# LATIS v0.3R.2
StructuralPriorCount=0. Counterfactual labels never guide synthesis.
```text
Root specification Q0: ArrowT SceneT SceneT; observations=2; Gamma=[]. Original Grid targets reserved for exact verification.
Learn(ArrowT SceneT SceneT; observations=2; Gamma=[]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,20)]
Learn(SceneT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","mkScene"]
MRV immediate domains=[(0,2),(1,3),(2,10)]
Learn(SizeT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","size","canvasSize"]
Learn(ColorT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","background"]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,4)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,4)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,4)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,1)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,1),(1,17)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Learn(VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,68)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,68)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,2)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,1)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,2)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,2)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,1)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,7)]
MRV immediate domains=[(0,1),(1,45)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,135)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,30)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,105)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,15)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,105)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,30)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,105)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,7)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,7)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,68)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,7)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,7)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,4)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,1)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,1),(1,17)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,69)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,69)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,3)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,3)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,6),(1,3)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,7)]
MRV immediate domains=[(0,1),(1,45)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,135)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,30)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,135)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,30)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,105)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,15)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,105)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,30)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,105)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,7)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,7)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,69)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,7)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,7)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,7)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,3)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,3)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,2),(1,3),(2,10)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,4)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,4)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,4)]
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
MRV immediate domains=[(0,1),(1,3)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,4)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,3)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,3)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,2),(1,3),(2,10)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,4)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,4)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,4)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,4)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,3)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,3)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,2),(1,3),(2,10)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,4)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,4)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,4)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,4)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,3)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,1)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,1),(1,17)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,69)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,69)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,1)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,7)]
MRV immediate domains=[(0,1),(1,45)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,135)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,30)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,135)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,30)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,105)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,15)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,105)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,30)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,105)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,7)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,7)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,69)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,7)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,7)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,7)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,3)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,2),(1,3),(2,10)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,4)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,4)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,1)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,1),(1,17)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,3),(1,69)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,3),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=14 children=[12,13]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=20 children=[19,15]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=26 children=[25,21]; conditional scalar inverse (observed operand; remaining values deduced)
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_vec node=97 children=[27,96]; component projection of output specification
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,3),(1,69)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,1)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,3),(1,3)]
Nonempty VS_coord node=98 children=[12,12]; component projection of output specification
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=102 children=[98,101]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,4),(1,3)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,4),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,5),(1,3)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,8),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,8),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,3),(1,7)]
MRV immediate domains=[(0,1),(1,45)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,135)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,30)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,105)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,15)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,105)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,30)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,105)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,3),(1,7)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,3),(1,7)]
Nonempty VS_Translate node=108 children=[8,107]; Translate: v_i=Anchor(target_i,TL)-Anchor(source_i,TL); Vec specification=[Vec (-10) 0,Vec 2 0,Vec (-10) 0,Vec 2 0]
Nonempty VS_lambda node=109 children=[108]; function graph -> parameter binding and output points
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,15),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,1),(1,45)]
MRV immediate domains=[(0,1),(1,30)]
MRV immediate domains=[(0,1),(1,30)]
MRV immediate domains=[(0,1),(1,15)]
MRV immediate domains=[(0,1),(1,30)]
MRV immediate domains=[(0,1),(1,67)]
Nonempty VS_vec node=180 children=[112,179]; component projection of output specification
MRV immediate domains=[(0,1),(1,3)]
Nonempty VS_coordDelta node=186 children=[182,185]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_vecAdd node=191 children=[188,190]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_coordDelta node=197 children=[193,196]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_coordDelta node=203 children=[199,202]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_coordDelta node=209 children=[205,208]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_coordDelta node=215 children=[211,214]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_coordDelta node=221 children=[217,220]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_coordDelta node=227 children=[223,226]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_coordDelta node=233 children=[229,232]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_coordDelta node=239 children=[235,238]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_coordDelta node=245 children=[241,244]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_coordDelta node=251 children=[247,250]; coordinate/vector inverse: condition on right operand and deduce left component specification
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Nonempty VS_Translate node=269 children=[268,252]; Translate: v_i=Anchor(target_i,TL)-Anchor(source_i,TL); Vec specification=[Vec 11 0,Vec 11 0]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_scan node=275 children=[109,269,274]; scan witness: output head is seed; ((y_(i-1),x_i),y_i)=[(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 13, cy = 3}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 1, cy = 0},1)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 12, cy = 4}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 2, cy = 0},6)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 2, cy = 4}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 2, cy = 0},6)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 2, cy = 4}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 2, cy = 0},6)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 7, cy = 7}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 9, cy = 7}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3)], orientation = 0})),(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 15, cy = 5}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 1, cy = 0},1)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 14, cy = 6}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 2, cy = 0},6)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 4, cy = 6}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 2, cy = 0},6)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 4, cy = 6}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 2, cy = 0},6)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 9, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 11, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3)], orientation = 0}))]; includes-seed convention; no task classifier
MRV immediate domains=[(0,1),(1,4)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,4)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,3)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,3)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
Nonempty VS_mkScene node=276 children=[3,6,275]; mkScene residual: canonical correspondence + Render-validated paint order; branch=0
MRV immediate domains=[(0,2),(1,3),(2,10)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,4)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,4)]
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,4)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,4)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,1)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,3)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,3)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,2),(1,3),(2,10)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,4)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,4)]
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,4)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,4)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,1)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,3)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,3)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,2),(1,3),(2,10)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,4)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,4)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,4)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,4)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,3)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,3)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,1)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,1),(1,17)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,69)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,69)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,3)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,3)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,3)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,7)]
MRV immediate domains=[(0,1),(1,45)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,135)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,30)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,135)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,30)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,105)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,15)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,105)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,30)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,105)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,7)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,7)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,69)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,7)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,7)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,7)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,2),(1,3),(2,10)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,4)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,4)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,4)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,4)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,1)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,1),(1,17)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,69)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,69)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,1)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,1)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,7)]
MRV immediate domains=[(0,1),(1,45)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,135)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,30)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,105)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,15)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,105)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,30)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,105)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,7)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,7)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,69)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,7)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,7)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,7)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,3)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,3)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,2),(1,3),(2,10)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,4)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,4)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,4)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,4)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,1)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,3)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,3)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,2),(1,3),(2,10)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,4)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,4)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,4)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,4)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,1)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,3)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,3)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,2),(1,3),(2,10)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,4)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,4)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,4)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,4)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,3)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,3)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
Nonempty VS_lambda node=277 children=[276]; function graph -> parameter binding and output points
Task TSL supported Base=["Anchor","ObjectCells","ObjectColors","Translate","add","background","canvasSize","cardinality","colorToInt","coord","coordDelta","fst","head","height","index","lambda","literal","mkScene","objectOf","objects","scan","setToList","snd","sortBy","subtract","tail","vec","vecAdd","width","x","y"]
Cost saturation C=1..54 root representatives=[(1,0),(2,0),(3,0),(4,0),(5,0),(6,0),(7,0),(8,0),(9,0),(10,0),(11,0),(12,0),(13,0),(14,0),(15,0),(16,0),(17,0),(18,0),(19,0),(20,0),(21,0),(22,0),(23,0),(24,0),(25,0),(26,0),(27,0),(28,0),(29,0),(30,0),(31,0),(32,0),(33,0),(34,0),(35,0),(36,0),(37,0),(38,0),(39,0),(40,0),(41,0),(42,0),(43,0),(44,0),(45,0),(46,0),(47,0),(48,0),(49,0),(50,0),(51,0),(52,0),(53,0),(54,0)]
Abstraction round=0; exact frontier=335; accepted=["I0","I1","I2","I3","I4","I5"]
Learn uses I0 by typed definition expansion; ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]
Learn uses I1 by typed definition expansion; ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]
Task TSL supported Base=["Anchor","ObjectCells","ObjectColors","Translate","add","background","canvasSize","cardinality","colorToInt","coord","coordDelta","fst","head","height","index","lambda","let","literal","mkScene","objectOf","objects","scan","setToList","snd","sortBy","subtract","tail","vec","vecAdd","width","x","y"]
Cost saturation C=1..54 root representatives=[(1,0),(2,0),(3,0),(4,0),(5,0),(6,0),(7,0),(8,0),(9,0),(10,0),(11,0),(12,0),(13,0),(14,0),(15,0),(16,0),(17,0),(18,0),(19,0),(20,0),(21,0),(22,0),(23,0),(24,0),(25,0),(26,0),(27,0),(28,0),(29,0),(30,0),(31,0),(32,0),(33,0),(34,0),(35,0),(36,0),(37,0),(38,0),(39,0),(40,0),(41,0),(42,0),(43,0),(44,0),(45,0),(46,0),(47,0),(48,0),(49,0),(50,0),(51,0),(52,0),(53,0),(54,0)]
Abstraction round=1; exact frontier=246; accepted=[]
Cost saturation C=1..51 root representatives=[(1,0),(2,0),(3,0),(4,0),(5,0),(6,0),(7,0),(8,0),(9,0),(10,0),(11,0),(12,0),(13,0),(14,0),(15,0),(16,0),(17,0),(18,0),(19,0),(20,0),(21,0),(22,0),(23,0),(24,0),(25,0),(26,0),(27,0),(28,0),(29,0),(30,0),(31,0),(32,0),(33,0),(34,0),(35,0),(36,0),(37,0),(38,0),(39,0),(40,0),(41,0),(42,0),(43,0),(44,0),(45,0),(46,0),(47,0),(48,0),(49,0),(50,0),(51,0)]
Exact original Render(P(Encode(x)))=y: True; MDL rank=(51,17,2,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BL) in Translate(snd(__r1b0),vec(subtract(y(__r1b1),x(__r1b1)),IntV 0))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(51,17,2,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),TL) in Translate(snd(__r1b0),vec(subtract(y(__r1b1),x(__r1b1)),IntV 0))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(50,16,2,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),BL) in Translate(snd(v1),coordDelta(coord(y(__cse0),y(__cse0)),__cse0))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(50,16,2,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),coordDelta(coord(y(__cse0),y(__cse0)),__cse0))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(51,16,2,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),vec(subtract(y(Anchor(fst(v1),BR)),x(Anchor(fst(v1),TL))),IntV 0))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(51,16,2,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),vec(subtract(y(Anchor(fst(v1),Center)),x(Anchor(fst(v1),TL))),IntV 0))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(53,18,2,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BL) in Translate(snd(__r1b0),vec(subtract(y(__r1b1),x(__r1b1)),IntV 0))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(53,18,2,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),IntV 0))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,18,2,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BL) in Translate(snd(__r1b0),vec(subtract(y(__r1b1),x(__r1b1)),IntV 0))),Translate(head(objects(v0)),coordDelta(CoordV (Coord {cx = 11, cy = 0}),CoordV (Coord {cx = 0, cy = 0}))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(53,17,2,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BL) in Translate(snd(__r1b0),vec(subtract(y(__r1b1),x(__r1b1)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,IntV 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,18,2,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BL) in Translate(snd(__r1b0),vec(subtract(y(__r1b1),x(__r1b1)),IntV 0))),Translate(head(objects(v0)),vecAdd(VecV (Vec 0 0),VecV (Vec 11 0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,19,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),BL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),colorToInt(background(v0))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,18,2,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),IntV 0))),Translate(head(objects(v0)),coordDelta(CoordV (Coord {cx = 11, cy = 0}),CoordV (Coord {cx = 0, cy = 0}))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(53,17,2,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,IntV 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,18,2,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),IntV 0))),Translate(head(objects(v0)),vecAdd(VecV (Vec 0 0),VecV (Vec 11 0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,19,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),colorToInt(background(v0))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(52,16,2,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=y(Anchor(fst(v1),BL)) in Translate(snd(v1),coordDelta(coord(__cse0,__cse0),Anchor(fst(v1),TL)))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(52,16,2,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=y(Anchor(fst(v1),BR)) in Translate(snd(v1),coordDelta(coord(__cse0,__cse0),Anchor(fst(v1),BL)))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(52,16,2,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=y(Anchor(fst(v1),Center)) in Translate(snd(v1),coordDelta(coord(__cse0,__cse0),Anchor(fst(v1),BL)))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(52,16,2,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=y(Anchor(fst(v1),Center)) in Translate(snd(v1),coordDelta(coord(__cse0,__cse0),Anchor(fst(v1),TL)))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(52,16,2,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=y(Anchor(fst(v1),TL)) in Translate(snd(v1),coordDelta(coord(__cse0,__cse0),Anchor(fst(v1),BL)))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(55,18,2,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),BL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),x(coord(IntV 0,IntV 0))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(55,18,2,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),BL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),y(coord(IntV 0,IntV 0))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(55,18,2,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),x(coord(IntV 0,IntV 0))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(55,18,2,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),y(coord(IntV 0,IntV 0))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,19,2,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BL) in Translate(snd(__r1b0),vec(subtract(y(__r1b1),x(__r1b1)),IntV 0))),Translate(head(objects(v0)),coordDelta(CoordV (Coord {cx = 11, cy = 0}),coord(IntV 0,IntV 0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,19,2,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BL) in Translate(snd(__r1b0),vec(subtract(y(__r1b1),x(__r1b1)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,colorToInt(background(v0)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(53,15,2,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),coordDelta(coord(y(Anchor(fst(v1),BR)),y(Anchor(fst(v1),Center))),Anchor(fst(v1),BL)))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(53,15,2,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),coordDelta(coord(y(Anchor(fst(v1),BR)),y(Anchor(fst(v1),TL))),Anchor(fst(v1),BL)))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(53,15,2,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),coordDelta(coord(y(Anchor(fst(v1),Center)),y(Anchor(fst(v1),BR))),Anchor(fst(v1),BL)))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(53,15,2,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),coordDelta(coord(y(Anchor(fst(v1),TL)),y(Anchor(fst(v1),BR))),Anchor(fst(v1),BL)))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,18,2,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),BL) in Translate(snd(v1),vec(subtract(add(y(__cse0),IntV (-1)),add(x(__cse0),IntV (-1))),IntV 0))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,18,2,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),BL) in Translate(snd(v1),vec(subtract(add(y(__cse0),IntV 1),add(x(__cse0),IntV 1)),IntV 0))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,18,2,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(add(y(__cse0),IntV (-1)),add(x(__cse0),IntV (-1))),IntV 0))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,18,2,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(add(y(__cse0),IntV 1),add(x(__cse0),IntV 1)),IntV 0))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,19,2,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),IntV 0))),Translate(head(objects(v0)),coordDelta(CoordV (Coord {cx = 11, cy = 0}),coord(IntV 0,IntV 0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,19,2,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,colorToInt(background(v0)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,18,2,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BL) in Translate(snd(__r1b0),vec(subtract(y(__r1b1),x(__r1b1)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,x(coord(IntV 0,IntV 0)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,18,2,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BL) in Translate(snd(__r1b0),vec(subtract(y(__r1b1),x(__r1b1)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,y(coord(IntV 0,IntV 0)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,17,2,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),vec(subtract(add(y(Anchor(fst(v1),BR)),IntV (-1)),add(x(Anchor(fst(v1),TL)),IntV (-1))),IntV 0))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,17,2,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),vec(subtract(add(y(Anchor(fst(v1),BR)),IntV 1),add(x(Anchor(fst(v1),TL)),IntV 1)),IntV 0))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,17,2,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),vec(subtract(add(y(Anchor(fst(v1),Center)),IntV (-1)),add(x(Anchor(fst(v1),TL)),IntV (-1))),IntV 0))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,17,2,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),vec(subtract(add(y(Anchor(fst(v1),Center)),IntV 1),add(x(Anchor(fst(v1),TL)),IntV 1)),IntV 0))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,19,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),BL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),x(coord(IntV 0,height(canvasSize(v0))))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,19,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),BL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),y(coord(width(canvasSize(v0)),IntV 0))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,18,2,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,x(coord(IntV 0,IntV 0)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,18,2,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,y(coord(IntV 0,IntV 0)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,19,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),x(coord(IntV 0,height(canvasSize(v0))))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,19,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),y(coord(width(canvasSize(v0)),IntV 0))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,18,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BL) in Translate(snd(__r1b0),vec(subtract(y(__r1b1),x(__r1b1)),IntV 0))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,18,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BL) in Translate(snd(__r1b0),vec(subtract(y(__r1b1),x(__r1b1)),IntV 0))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,18,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BL) in Translate(snd(__r1b0),vec(subtract(y(__r1b1),x(__r1b1)),IntV 0))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,21,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BL) in Translate(snd(__r1b0),vec(subtract(y(__r1b1),x(__r1b1)),IntV 0))),Translate(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,18,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BL) in Translate(snd(__r1b0),vec(subtract(y(__r1b1),x(__r1b1)),IntV 0))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,18,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BL) in Translate(snd(__r1b0),vec(subtract(y(__r1b1),x(__r1b1)),IntV 0))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,18,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BL) in Translate(snd(__r1b0),vec(subtract(y(__r1b1),x(__r1b1)),IntV 0))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,18,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BL) in Translate(snd(__r1b0),vec(subtract(y(__r1b1),x(__r1b1)),IntV 0))),Translate(head(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,18,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BL) in Translate(snd(__r1b0),vec(subtract(y(__r1b1),x(__r1b1)),IntV 0))),Translate(head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,18,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BL) in Translate(snd(__r1b0),vec(subtract(y(__r1b1),x(__r1b1)),IntV 0))),Translate(head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,21,2,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),BL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),add(cardinality(ObjectColors(objectOf(fst(v1)))),IntV (-1))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,21,2,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),BL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),add(cardinality(ObjectColors(objectOf(snd(v1)))),IntV (-1))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,18,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),IntV 0))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,18,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),IntV 0))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,18,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),IntV 0))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,21,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),IntV 0))),Translate(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,18,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),IntV 0))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,18,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),IntV 0))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,18,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),IntV 0))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,18,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),IntV 0))),Translate(head(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,18,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),IntV 0))),Translate(head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,18,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),IntV 0))),Translate(head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,21,2,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),add(cardinality(ObjectColors(objectOf(fst(v1)))),IntV (-1))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,21,2,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),add(cardinality(ObjectColors(objectOf(snd(v1)))),IntV (-1))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,19,2,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BL) in Translate(snd(__r1b0),vec(subtract(y(__r1b1),x(__r1b1)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,x(coord(IntV 0,height(canvasSize(v0)))))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,19,2,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BL) in Translate(snd(__r1b0),vec(subtract(y(__r1b1),x(__r1b1)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,y(coord(width(canvasSize(v0)),IntV 0)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,21,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),BL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),add(cardinality(ObjectColors(objectOf(head(objects(v0))))),IntV (-1))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,19,2,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,x(coord(IntV 0,height(canvasSize(v0)))))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,19,2,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,y(coord(width(canvasSize(v0)),IntV 0)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,21,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),add(cardinality(ObjectColors(objectOf(head(objects(v0))))),IntV (-1))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(64,21,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),BL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),add(cardinality(ObjectColors(objectOf(head(tail(objects(v0)))))),IntV (-1))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(64,21,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),add(cardinality(ObjectColors(objectOf(head(tail(objects(v0)))))),IntV (-1))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(64,21,2,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BL) in Translate(snd(__r1b0),vec(subtract(y(__r1b1),x(__r1b1)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,add(cardinality(ObjectColors(objectOf(head(objects(v0))))),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(65,21,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BL) in Translate(snd(__r1b0),vec(subtract(y(__r1b1),x(__r1b1)),IntV 0))),Translate(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(65,21,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),BL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),add(cardinality(ObjectColors(objectOf(head(tail(tail(objects(v0))))))),IntV (-1))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(66,22,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),BL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),add(colorToInt(head(setToList(ObjectColors(objectOf(head(objects(v0))))))),IntV (-1))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(64,21,2,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,add(cardinality(ObjectColors(objectOf(head(objects(v0))))),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(65,21,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),IntV 0))),Translate(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(65,21,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),add(cardinality(ObjectColors(objectOf(head(tail(tail(objects(v0))))))),IntV (-1))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(66,22,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),add(colorToInt(head(setToList(ObjectColors(objectOf(head(objects(v0))))))),IntV (-1))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(65,21,2,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BL) in Translate(snd(__r1b0),vec(subtract(y(__r1b1),x(__r1b1)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,add(cardinality(ObjectColors(objectOf(head(tail(objects(v0)))))),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,18,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BL) in Translate(snd(__r1b0),vec(subtract(y(__r1b1),x(__r1b1)),IntV 0))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,18,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BL) in Translate(snd(__r1b0),vec(subtract(y(__r1b1),x(__r1b1)),IntV 0))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,18,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BL) in Translate(snd(__r1b0),vec(subtract(y(__r1b1),x(__r1b1)),IntV 0))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,18,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BL) in Translate(snd(__r1b0),vec(subtract(y(__r1b1),x(__r1b1)),IntV 0))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,18,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BL) in Translate(snd(__r1b0),vec(subtract(y(__r1b1),x(__r1b1)),IntV 0))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,18,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BL) in Translate(snd(__r1b0),vec(subtract(y(__r1b1),x(__r1b1)),IntV 0))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(65,21,2,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,add(cardinality(ObjectColors(objectOf(head(tail(objects(v0)))))),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,18,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),IntV 0))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,18,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),IntV 0))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,18,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),IntV 0))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,18,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),IntV 0))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,18,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),IntV 0))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,18,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),IntV 0))),Translate(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(66,21,2,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BL) in Translate(snd(__r1b0),vec(subtract(y(__r1b1),x(__r1b1)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,add(cardinality(ObjectColors(objectOf(head(tail(tail(objects(v0))))))),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(67,22,2,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BL) in Translate(snd(__r1b0),vec(subtract(y(__r1b1),x(__r1b1)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,add(colorToInt(head(setToList(ObjectColors(objectOf(head(objects(v0))))))),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(66,21,2,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,add(cardinality(ObjectColors(objectOf(head(tail(tail(objects(v0))))))),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(67,22,2,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,add(colorToInt(head(setToList(ObjectColors(objectOf(head(objects(v0))))))),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(72,23,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),BL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),add(cardinality(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))),IntV (-1))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(71,22,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),BL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),add(cardinality(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))))),IntV (-1))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(71,22,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),BL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),add(cardinality(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))))),IntV (-1))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(71,22,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),BL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),add(cardinality(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))))),IntV (-1))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(71,22,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),BL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),add(cardinality(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))))),IntV (-1))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(71,22,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),BL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),add(cardinality(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))))),IntV (-1))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(71,22,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),BL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),add(cardinality(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))))),IntV (-1))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(72,23,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),add(cardinality(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))),IntV (-1))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(71,22,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),add(cardinality(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))))),IntV (-1))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(71,22,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),add(cardinality(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))))),IntV (-1))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(71,22,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),add(cardinality(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))))),IntV (-1))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(71,22,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),add(cardinality(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))))),IntV (-1))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(71,22,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),add(cardinality(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))))),IntV (-1))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(71,22,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),add(cardinality(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))))),IntV (-1))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(73,23,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),BL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),add(cardinality(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))))),IntV (-1))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(72,22,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),BL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),add(cardinality(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))),IntV (-1))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(72,22,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),BL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),add(cardinality(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))),IntV (-1))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(72,22,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),BL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),add(cardinality(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))),IntV (-1))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(72,22,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),BL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),add(cardinality(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))))),IntV (-1))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(72,22,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),BL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),add(cardinality(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))))),IntV (-1))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(72,22,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),BL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),add(cardinality(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))))),IntV (-1))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(73,23,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),add(cardinality(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))))),IntV (-1))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(72,22,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),add(cardinality(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))),IntV (-1))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(72,22,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),add(cardinality(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))),IntV (-1))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(72,22,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),add(cardinality(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))),IntV (-1))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(72,22,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),add(cardinality(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))))),IntV (-1))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(72,22,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),add(cardinality(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))))),IntV (-1))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(72,22,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),add(cardinality(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))))),IntV (-1))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(73,23,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BL) in Translate(snd(__r1b0),vec(subtract(y(__r1b1),x(__r1b1)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,add(cardinality(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(72,22,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BL) in Translate(snd(__r1b0),vec(subtract(y(__r1b1),x(__r1b1)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,add(cardinality(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))))),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(72,22,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BL) in Translate(snd(__r1b0),vec(subtract(y(__r1b1),x(__r1b1)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,add(cardinality(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))))),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(72,22,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BL) in Translate(snd(__r1b0),vec(subtract(y(__r1b1),x(__r1b1)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,add(cardinality(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))))),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(72,22,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BL) in Translate(snd(__r1b0),vec(subtract(y(__r1b1),x(__r1b1)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,add(cardinality(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))))),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(72,22,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BL) in Translate(snd(__r1b0),vec(subtract(y(__r1b1),x(__r1b1)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,add(cardinality(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))))),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(72,22,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BL) in Translate(snd(__r1b0),vec(subtract(y(__r1b1),x(__r1b1)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,add(cardinality(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))))),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,23,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),BL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),add(cardinality(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))),IntV (-1))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(73,22,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),BL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),add(cardinality(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)))))),IntV (-1))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(73,22,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),BL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),add(cardinality(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)))))),IntV (-1))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(73,22,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),BL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),add(cardinality(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0)))))),IntV (-1))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(73,22,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),BL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),add(cardinality(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)))))),IntV (-1))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(73,22,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),BL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),add(cardinality(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)))))),IntV (-1))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(73,22,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),BL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),add(cardinality(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)))))),IntV (-1))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,23,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),BL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),add(cardinality(ObjectColors(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))))),IntV (-1))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(73,22,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),BL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),add(cardinality(ObjectColors(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))))))),IntV (-1))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(73,22,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),BL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),add(cardinality(ObjectColors(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))))))),IntV (-1))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(73,22,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),BL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),add(cardinality(ObjectColors(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))))))),IntV (-1))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(73,22,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),BL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),add(cardinality(ObjectColors(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))))))),IntV (-1))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(73,22,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),BL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),add(cardinality(ObjectColors(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))))))),IntV (-1))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(73,22,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),BL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),add(cardinality(ObjectColors(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))))))),IntV (-1))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(76,25,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),BL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),add(colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))))),IntV (-1))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,23,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),BL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),add(colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))))))),IntV (-1))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,23,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),BL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),add(colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))))))),IntV (-1))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,23,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),BL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),add(colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))))))),IntV (-1))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,23,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),BL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),add(colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))))))),IntV (-1))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,23,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),BL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),add(colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))))))),IntV (-1))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,23,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),BL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),add(colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))))))),IntV (-1))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(73,23,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,add(cardinality(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(72,22,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,add(cardinality(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))))),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(72,22,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,add(cardinality(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))))),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(72,22,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,add(cardinality(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))))),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(72,22,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,add(cardinality(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))))),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(72,22,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,add(cardinality(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))))),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(72,22,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,add(cardinality(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))))),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,23,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),add(cardinality(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))),IntV (-1))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(73,22,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),add(cardinality(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)))))),IntV (-1))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(73,22,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),add(cardinality(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)))))),IntV (-1))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(73,22,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),add(cardinality(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0)))))),IntV (-1))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(73,22,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),add(cardinality(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)))))),IntV (-1))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(73,22,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),add(cardinality(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)))))),IntV (-1))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(73,22,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),add(cardinality(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)))))),IntV (-1))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,23,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),add(cardinality(ObjectColors(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))))),IntV (-1))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(73,22,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),add(cardinality(ObjectColors(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))))))),IntV (-1))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(73,22,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),add(cardinality(ObjectColors(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))))))),IntV (-1))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(73,22,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),add(cardinality(ObjectColors(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))))))),IntV (-1))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(73,22,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),add(cardinality(ObjectColors(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))))))),IntV (-1))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(73,22,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),add(cardinality(ObjectColors(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))))))),IntV (-1))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(73,22,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),add(cardinality(ObjectColors(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))))))),IntV (-1))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(76,25,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),add(colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))))),IntV (-1))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,23,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),add(colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))))))),IntV (-1))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,23,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),add(colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))))))),IntV (-1))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,23,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),add(colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))))))),IntV (-1))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,23,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),add(colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))))))),IntV (-1))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,23,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),add(colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))))))),IntV (-1))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,23,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),add(colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))))))),IntV (-1))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,23,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BL) in Translate(snd(__r1b0),vec(subtract(y(__r1b1),x(__r1b1)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,add(cardinality(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))))),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(73,22,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BL) in Translate(snd(__r1b0),vec(subtract(y(__r1b1),x(__r1b1)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,add(cardinality(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(73,22,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BL) in Translate(snd(__r1b0),vec(subtract(y(__r1b1),x(__r1b1)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,add(cardinality(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(73,22,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BL) in Translate(snd(__r1b0),vec(subtract(y(__r1b1),x(__r1b1)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,add(cardinality(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(73,22,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BL) in Translate(snd(__r1b0),vec(subtract(y(__r1b1),x(__r1b1)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,add(cardinality(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))))),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(73,22,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BL) in Translate(snd(__r1b0),vec(subtract(y(__r1b1),x(__r1b1)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,add(cardinality(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))))),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(73,22,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BL) in Translate(snd(__r1b0),vec(subtract(y(__r1b1),x(__r1b1)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,add(cardinality(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))))),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,23,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),BL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),add(cardinality(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))))))),IntV (-1))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,22,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),BL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),add(cardinality(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))),IntV (-1))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,22,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),BL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),add(cardinality(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))))),IntV (-1))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,22,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),BL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),add(cardinality(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))))),IntV (-1))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,22,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),BL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),add(cardinality(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))))),IntV (-1))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,22,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),BL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),add(cardinality(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))))),IntV (-1))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,22,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),BL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),add(cardinality(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))),IntV (-1))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,23,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,add(cardinality(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))))),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(73,22,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,add(cardinality(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(73,22,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,add(cardinality(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(73,22,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,add(cardinality(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(73,22,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,add(cardinality(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))))),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(73,22,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,add(cardinality(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))))),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(73,22,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,add(cardinality(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))))),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,23,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),add(cardinality(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))))))),IntV (-1))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,22,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),add(cardinality(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))),IntV (-1))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,22,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),add(cardinality(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))))),IntV (-1))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,22,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),add(cardinality(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))))),IntV (-1))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,22,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),add(cardinality(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))))),IntV (-1))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,22,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),add(cardinality(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))))),IntV (-1))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,22,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),add(cardinality(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))),IntV (-1))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,23,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BL) in Translate(snd(__r1b0),vec(subtract(y(__r1b1),x(__r1b1)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,add(cardinality(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,22,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BL) in Translate(snd(__r1b0),vec(subtract(y(__r1b1),x(__r1b1)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,add(cardinality(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)))))),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,22,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BL) in Translate(snd(__r1b0),vec(subtract(y(__r1b1),x(__r1b1)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,add(cardinality(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)))))),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,22,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BL) in Translate(snd(__r1b0),vec(subtract(y(__r1b1),x(__r1b1)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,add(cardinality(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0)))))),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,22,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BL) in Translate(snd(__r1b0),vec(subtract(y(__r1b1),x(__r1b1)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,add(cardinality(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)))))),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,22,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BL) in Translate(snd(__r1b0),vec(subtract(y(__r1b1),x(__r1b1)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,add(cardinality(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)))))),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,22,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BL) in Translate(snd(__r1b0),vec(subtract(y(__r1b1),x(__r1b1)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,add(cardinality(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)))))),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,23,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BL) in Translate(snd(__r1b0),vec(subtract(y(__r1b1),x(__r1b1)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,add(cardinality(ObjectColors(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))))),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,22,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BL) in Translate(snd(__r1b0),vec(subtract(y(__r1b1),x(__r1b1)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,add(cardinality(ObjectColors(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))))))),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,22,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BL) in Translate(snd(__r1b0),vec(subtract(y(__r1b1),x(__r1b1)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,add(cardinality(ObjectColors(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))))))),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,22,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BL) in Translate(snd(__r1b0),vec(subtract(y(__r1b1),x(__r1b1)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,add(cardinality(ObjectColors(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))))))),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,22,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BL) in Translate(snd(__r1b0),vec(subtract(y(__r1b1),x(__r1b1)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,add(cardinality(ObjectColors(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))))))),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,22,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BL) in Translate(snd(__r1b0),vec(subtract(y(__r1b1),x(__r1b1)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,add(cardinality(ObjectColors(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))))))),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,22,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BL) in Translate(snd(__r1b0),vec(subtract(y(__r1b1),x(__r1b1)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,add(cardinality(ObjectColors(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))))))),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(77,25,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BL) in Translate(snd(__r1b0),vec(subtract(y(__r1b1),x(__r1b1)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,add(colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))))),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,23,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BL) in Translate(snd(__r1b0),vec(subtract(y(__r1b1),x(__r1b1)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,add(colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))))))),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,23,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BL) in Translate(snd(__r1b0),vec(subtract(y(__r1b1),x(__r1b1)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,add(colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))))))),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,23,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BL) in Translate(snd(__r1b0),vec(subtract(y(__r1b1),x(__r1b1)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,add(colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))))))),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,23,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BL) in Translate(snd(__r1b0),vec(subtract(y(__r1b1),x(__r1b1)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,add(colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))))))),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,23,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BL) in Translate(snd(__r1b0),vec(subtract(y(__r1b1),x(__r1b1)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,add(colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))))))),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,23,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BL) in Translate(snd(__r1b0),vec(subtract(y(__r1b1),x(__r1b1)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,add(colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))))))),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(76,23,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),BL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),add(cardinality(ObjectColors(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))))),IntV (-1))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,22,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),BL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),add(cardinality(ObjectColors(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)))))))),IntV (-1))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,22,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),BL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),add(cardinality(ObjectColors(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)))))))),IntV (-1))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,22,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),BL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),add(cardinality(ObjectColors(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0)))))))),IntV (-1))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,22,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),BL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),add(cardinality(ObjectColors(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)))))))),IntV (-1))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,22,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),BL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),add(cardinality(ObjectColors(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)))))))),IntV (-1))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,22,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),BL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),add(cardinality(ObjectColors(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)))))))),IntV (-1))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,23,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,add(cardinality(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,22,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,add(cardinality(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)))))),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,22,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,add(cardinality(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)))))),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,22,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,add(cardinality(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0)))))),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,22,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,add(cardinality(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)))))),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,22,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,add(cardinality(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)))))),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,22,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,add(cardinality(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)))))),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,23,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,add(cardinality(ObjectColors(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))))),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,22,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,add(cardinality(ObjectColors(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))))))),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,22,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,add(cardinality(ObjectColors(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))))))),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,22,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,add(cardinality(ObjectColors(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))))))),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,22,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,add(cardinality(ObjectColors(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))))))),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,22,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,add(cardinality(ObjectColors(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))))))),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,22,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,add(cardinality(ObjectColors(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))))))),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(77,25,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,add(colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))))),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,23,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,add(colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))))))),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,23,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,add(colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))))))),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,23,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,add(colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))))))),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,23,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,add(colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))))))),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,23,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,add(colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))))))),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,23,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,add(colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))))))),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(76,23,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),add(cardinality(ObjectColors(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))))),IntV (-1))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,22,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),add(cardinality(ObjectColors(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)))))))),IntV (-1))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,22,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),add(cardinality(ObjectColors(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)))))))),IntV (-1))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,22,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),add(cardinality(ObjectColors(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0)))))))),IntV (-1))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,22,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),add(cardinality(ObjectColors(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)))))))),IntV (-1))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,22,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),add(cardinality(ObjectColors(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)))))))),IntV (-1))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,22,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),add(cardinality(ObjectColors(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)))))))),IntV (-1))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(76,23,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BL) in Translate(snd(__r1b0),vec(subtract(y(__r1b1),x(__r1b1)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,add(cardinality(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))))))),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,22,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BL) in Translate(snd(__r1b0),vec(subtract(y(__r1b1),x(__r1b1)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,add(cardinality(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,22,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BL) in Translate(snd(__r1b0),vec(subtract(y(__r1b1),x(__r1b1)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,add(cardinality(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))))),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,22,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BL) in Translate(snd(__r1b0),vec(subtract(y(__r1b1),x(__r1b1)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,add(cardinality(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))))),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,22,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BL) in Translate(snd(__r1b0),vec(subtract(y(__r1b1),x(__r1b1)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,add(cardinality(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))))),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,22,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BL) in Translate(snd(__r1b0),vec(subtract(y(__r1b1),x(__r1b1)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,add(cardinality(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))))),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,22,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BL) in Translate(snd(__r1b0),vec(subtract(y(__r1b1),x(__r1b1)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,add(cardinality(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(79,25,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),BL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))))))))),IntV (-1))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(76,23,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,add(cardinality(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))))))),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,22,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,add(cardinality(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,22,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,add(cardinality(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))))),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,22,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,add(cardinality(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))))),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,22,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,add(cardinality(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))))),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,22,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,add(cardinality(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))))),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,22,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,add(cardinality(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))))),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(79,25,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))))))))),IntV (-1))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(77,23,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BL) in Translate(snd(__r1b0),vec(subtract(y(__r1b1),x(__r1b1)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,add(cardinality(ObjectColors(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))))),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(76,22,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BL) in Translate(snd(__r1b0),vec(subtract(y(__r1b1),x(__r1b1)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,add(cardinality(ObjectColors(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)))))))),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(76,22,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BL) in Translate(snd(__r1b0),vec(subtract(y(__r1b1),x(__r1b1)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,add(cardinality(ObjectColors(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)))))))),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(76,22,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BL) in Translate(snd(__r1b0),vec(subtract(y(__r1b1),x(__r1b1)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,add(cardinality(ObjectColors(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0)))))))),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(76,22,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BL) in Translate(snd(__r1b0),vec(subtract(y(__r1b1),x(__r1b1)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,add(cardinality(ObjectColors(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)))))))),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(76,22,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BL) in Translate(snd(__r1b0),vec(subtract(y(__r1b1),x(__r1b1)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,add(cardinality(ObjectColors(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)))))))),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(76,22,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BL) in Translate(snd(__r1b0),vec(subtract(y(__r1b1),x(__r1b1)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,add(cardinality(ObjectColors(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)))))))),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(78,23,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),BL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)))))))))),IntV (-1))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(78,23,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),BL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)))))))))),IntV (-1))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(78,23,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),BL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0)))))))))),IntV (-1))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(78,23,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),BL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)))))))))),IntV (-1))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(78,23,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),BL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)))))))))),IntV (-1))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(78,23,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),BL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)))))))))),IntV (-1))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(77,23,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,add(cardinality(ObjectColors(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))))),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(76,22,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,add(cardinality(ObjectColors(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)))))))),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(76,22,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,add(cardinality(ObjectColors(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)))))))),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(76,22,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,add(cardinality(ObjectColors(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0)))))))),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(76,22,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,add(cardinality(ObjectColors(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)))))))),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(76,22,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,add(cardinality(ObjectColors(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)))))))),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(76,22,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,add(cardinality(ObjectColors(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)))))))),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(78,23,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)))))))))),IntV (-1))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(78,23,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)))))))))),IntV (-1))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(78,23,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0)))))))))),IntV (-1))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(78,23,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)))))))))),IntV (-1))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(78,23,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)))))))))),IntV (-1))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(78,23,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)))))))))),IntV (-1))))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(80,25,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BL) in Translate(snd(__r1b0),vec(subtract(y(__r1b1),x(__r1b1)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))))))))),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(80,25,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))))))))),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(79,23,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BL) in Translate(snd(__r1b0),vec(subtract(y(__r1b1),x(__r1b1)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)))))))))),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(79,23,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BL) in Translate(snd(__r1b0),vec(subtract(y(__r1b1),x(__r1b1)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)))))))))),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(79,23,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BL) in Translate(snd(__r1b0),vec(subtract(y(__r1b1),x(__r1b1)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0)))))))))),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(79,23,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BL) in Translate(snd(__r1b0),vec(subtract(y(__r1b1),x(__r1b1)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)))))))))),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(79,23,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BL) in Translate(snd(__r1b0),vec(subtract(y(__r1b1),x(__r1b1)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)))))))))),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(79,23,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BL) in Translate(snd(__r1b0),vec(subtract(y(__r1b1),x(__r1b1)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)))))))))),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(79,23,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)))))))))),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(79,23,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)))))))))),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(79,23,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0)))))))))),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(79,23,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)))))))))),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(79,23,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)))))))))),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(79,23,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),IntV 0))),Translate(head(objects(v0)),vec(IntV 11,add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)))))))))),IntV (-1)))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,20,2,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BL) in Translate(snd(__r1b0),vec(subtract(y(__r1b1),x(__r1b1)),IntV 0))),Translate(head(objects(v0)),coordDelta(CoordV (Coord {cx = 41, cy = 0}),coord(width(canvasSize(v0)),IntV 0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,20,2,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),IntV 0))),Translate(head(objects(v0)),coordDelta(CoordV (Coord {cx = 41, cy = 0}),coord(width(canvasSize(v0)),IntV 0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,21,2,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BL) in Translate(snd(__r1b0),vec(subtract(y(__r1b1),x(__r1b1)),IntV 0))),Translate(head(objects(v0)),coordDelta(CoordV (Coord {cx = 40, cy = 0}),coord(add(width(canvasSize(v0)),IntV (-1)),IntV 0))),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,21,2,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. let __cse0=Anchor(fst(v1),TL) in Translate(snd(v1),vec(subtract(y(__cse0),x(__cse0)),IntV 0))),Translate(head(objects(v0)),coordDelta(CoordV (Coord {cx = 40, cy = 0}),coord(add(width(canvasSize(v0)),IntV (-1)),IntV 0))),tail(objects(v0)))))")
Selected AST; FV=[]; (lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BL) in Translate(snd(__r1b0),vec(subtract(y(__r1b1),x(__r1b1)),IntV 0))),Translate(head(objects(v0)),VecV (Vec 11 0)),tail(objects(v0)))))
TaskInvented I0: (lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BL) in Translate(snd(__r1b0),vec(subtract(y(__r1b1),x(__r1b1)),IntV 0))); repeats=6; portfolio MDL saving=66
TaskInvented I1: (lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),TL) in Translate(snd(__r1b0),vec(subtract(y(__r1b1),x(__r1b1)),IntV 0))); repeats=5; portfolio MDL saving=52
TaskInvented I2: (lambda __r1h0:IntT. (lambda __r1h1:CoordT. (lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),coordDelta(coord(__r1h0,__r1h0),__r1h1))))); repeats=7; portfolio MDL saving=10
TaskInvented I3: (lambda __cse0:CoordT. vec(subtract(y(__cse0),x(__cse0)),x(coord(IntV 0,IntV 0)))); repeats=2; portfolio MDL saving=1
TaskInvented I4: (lambda __cse0:CoordT. vec(subtract(y(__cse0),x(__cse0)),y(coord(IntV 0,IntV 0)))); repeats=2; portfolio MDL saving=1
TaskInvented I5: (lambda __r1h0:IntT. (lambda __r1h1:IntT. (lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),coordDelta(coord(__r1h0,__r1h1),Anchor(fst(v1),BL)))))); repeats=7; portfolio MDL saving=17
Induced TSL=Signature(root VS) union inventions. BaseActivated=["Anchor","ObjectCells","ObjectColors","Translate","add","background","canvasSize","cardinality","colorToInt","coord","coordDelta","fst","head","height","index","lambda","let","literal","mkScene","objectOf","objects","scan","setToList","snd","sortBy","subtract","tail","vec","vecAdd","width","x","y"]; TaskInvented=["I0","I1","I2","I3","I4","I5"]; StructuralPriorCount=0
```
