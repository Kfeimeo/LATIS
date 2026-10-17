# LATIS v0.3R.2
StructuralPriorCount=0. Counterfactual labels never guide synthesis.
```text
Root specification Q0: ArrowT SceneT SceneT; observations=2; Gamma=[]. Original Grid targets reserved for exact verification.
Learn(ArrowT SceneT SceneT; observations=2; Gamma=[]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,36)]
Learn(SceneT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","mkScene"]
MRV immediate domains=[(0,1),(1,3),(2,12)]
Learn(SizeT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","size","canvasSize"]
Learn(ColorT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","background"]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,4)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,4)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
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
MRV immediate domains=[(0,1),(1,3)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,1)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,1),(1,1)]
Learn(ObjectT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","objectOf"]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
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
MRV immediate domains=[(0,1),(1,1),(2,3)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,1)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,1),(1,1)]
Learn(ObjectT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","objectOf"]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
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
MRV immediate domains=[(0,1),(1,3),(2,12)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,4)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,4)]
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
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
MRV immediate domains=[(0,1),(1,3)]
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
MRV immediate domains=[(0,1),(1,0),(2,3)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,1)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,3)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,3)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,1)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3),(2,12)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,4)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,4)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
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
MRV immediate domains=[(0,1),(1,3)]
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
MRV immediate domains=[(0,1),(1,1),(2,3)]
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
MRV immediate domains=[(0,1),(1,3),(2,12)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,4)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,4)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
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
MRV immediate domains=[(0,1),(1,3)]
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
MRV immediate domains=[(0,1),(1,0),(2,3)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,1)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,3)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,3)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,1)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3),(2,12)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,4)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,4)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
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
MRV immediate domains=[(0,1),(1,3)]
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
MRV immediate domains=[(0,1),(1,1),(2,3)]
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
MRV immediate domains=[(0,1),(1,3),(2,12)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,4)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,4)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
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
MRV immediate domains=[(0,1),(1,3)]
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
MRV immediate domains=[(0,1),(1,1),(2,3)]
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
MRV immediate domains=[(0,1),(1,3),(2,12)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,4)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,4)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
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
MRV immediate domains=[(0,1),(1,1),(2,3)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,3)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,1)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,1),(1,1)]
Learn(ObjectT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","objectOf"]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,3)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3),(2,12)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,4)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,4)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,3)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,1)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,3)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,3)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,1)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3),(2,12)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,4)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,4)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
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
MRV immediate domains=[(0,1),(1,1),(2,3)]
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
MRV immediate domains=[(0,1),(1,3),(2,12)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,4)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,4)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,3)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,1)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,3)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,3)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,1)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3),(2,12)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,4)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,4)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
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
MRV immediate domains=[(0,1),(1,1),(2,3)]
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
MRV immediate domains=[(0,1),(1,3),(2,12)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,4)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,4)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
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
MRV immediate domains=[(0,1),(1,1),(2,3)]
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
MRV immediate domains=[(0,1),(1,3),(2,12)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,4)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,4)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
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
MRV immediate domains=[(0,1),(1,1),(2,3)]
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
MRV immediate domains=[(0,1)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,1),(1,1)]
Learn(ObjectT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","objectOf"]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3),(2,12)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,4)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,4)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
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
MRV immediate domains=[(0,1),(1,1),(2,3)]
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
MRV immediate domains=[(0,1),(1,3),(2,12)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,4)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,4)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
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
MRV immediate domains=[(0,1),(1,1),(2,3)]
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
MRV immediate domains=[(0,1),(1,3),(2,12)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,4)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,4)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
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
MRV immediate domains=[(0,1),(1,1),(2,3)]
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
MRV immediate domains=[(0,1),(1,3),(2,12)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,4)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,4)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
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
MRV immediate domains=[(0,1),(1,1),(2,3)]
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
MRV immediate domains=[(0,1),(1,3),(2,12)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,4)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,4)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
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
MRV immediate domains=[(0,1),(1,1),(2,3)]
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
MRV immediate domains=[(0,1),(1,3),(2,12)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,4)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,4)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,3)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,1)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,1),(1,1)]
Learn(ObjectT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","objectOf"]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_coord node=9 children=[7,8]; component projection of output specification
Nonempty VS_place node=10 children=[6,9]; place inverse: output local geometry and absolute origin; no translation template
Nonempty VS_lambda node=11 children=[10]; function graph -> parameter binding and output points
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,13),(1,13)]
Learn(ObjectT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","objectOf"]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_place node=40 children=[25,39]; place inverse: output local geometry and absolute origin; no translation template
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_scan node=45 children=[11,40,44]; scan witness: output head is seed; ((y_(i-1),x_i),y_i)=[(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 5, cy = 7}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2)], orientation = 0})) (PlacedV (Object {objectId = 0, position = Coord {cx = 7, cy = 1}, geometry = fromList [(Coord {cx = 0, cy = 0},5)], orientation = 0})),PlacedV (Object {objectId = 0, position = Coord {cx = 8, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},5)], orientation = 0})),(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 8, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},5)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 15, cy = 13}, geometry = fromList [(Coord {cx = 0, cy = 1},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 9, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 1},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 10, cy = 14}, geometry = fromList [(Coord {cx = 0, cy = 0},7),(Coord {cx = 1, cy = 0},7),(Coord {cx = 1, cy = 1},7),(Coord {cx = 2, cy = 0},7)], orientation = 0})) (PlacedV (Object {objectId = 0, position = Coord {cx = 13, cy = 0}, geometry = fromList [(Coord {cx = 0, cy = 0},9),(Coord {cx = 1, cy = 0},9),(Coord {cx = 1, cy = 1},9),(Coord {cx = 2, cy = 0},9)], orientation = 0})),PlacedV (Object {objectId = 0, position = Coord {cx = 13, cy = 16}, geometry = fromList [(Coord {cx = 0, cy = 0},9),(Coord {cx = 1, cy = 0},9),(Coord {cx = 1, cy = 1},9),(Coord {cx = 2, cy = 0},9)], orientation = 0})),(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 13, cy = 16}, geometry = fromList [(Coord {cx = 0, cy = 0},9),(Coord {cx = 1, cy = 0},9),(Coord {cx = 1, cy = 1},9),(Coord {cx = 2, cy = 0},9)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 14, cy = 14}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 1, cy = 0},3),(Coord {cx = 1, cy = 1},3),(Coord {cx = 2, cy = 0},3)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 16, cy = 18}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 1, cy = 0},3),(Coord {cx = 1, cy = 1},3),(Coord {cx = 2, cy = 0},3)], orientation = 0}))]; includes-seed convention; no task classifier
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
Nonempty VS_mkScene node=46 children=[1,4,45]; mkScene residual: canonical correspondence + Render-validated paint order; branch=0
MRV immediate domains=[(0,1),(1,3),(2,12)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,4)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,4)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
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
MRV immediate domains=[(0,1),(1,1),(2,3)]
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
MRV immediate domains=[(0,1),(1,3),(2,12)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,4)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,4)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
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
MRV immediate domains=[(0,1),(1,1),(2,3)]
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
MRV immediate domains=[(0,1),(1,3),(2,12)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,4)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,4)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
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
MRV immediate domains=[(0,1),(1,1),(2,3)]
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
MRV immediate domains=[(0,1),(1,3),(2,12)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,4)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,4)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
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
MRV immediate domains=[(0,1),(1,1),(2,3)]
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
MRV immediate domains=[(0,1),(1,3),(2,12)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,4)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,4)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
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
MRV immediate domains=[(0,1),(1,1),(2,3)]
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
MRV immediate domains=[(0,1),(1,3),(2,12)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,4)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,4)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
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
MRV immediate domains=[(0,1)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,1),(1,1)]
Learn(ObjectT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","objectOf"]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,3)]
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
MRV immediate domains=[(0,1),(1,3),(2,12)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,4)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,4)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
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
MRV immediate domains=[(0,1),(1,1),(2,3)]
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
MRV immediate domains=[(0,1),(1,3),(2,12)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,4)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,4)]
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,3)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,1)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,3)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,3)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,1)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3),(2,12)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,4)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,4)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,3)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,1)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,3)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,3)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,1)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3),(2,12)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,4)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,4)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
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
MRV immediate domains=[(0,1),(1,1),(2,3)]
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
MRV immediate domains=[(0,1),(1,3),(2,12)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,4)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,4)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
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
MRV immediate domains=[(0,1),(1,1),(2,3)]
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
MRV immediate domains=[(0,1),(1,3),(2,12)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,4)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,4)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,1)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,1),(1,1)]
Learn(ObjectT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","objectOf"]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
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
MRV immediate domains=[(0,1),(1,1),(2,3)]
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
MRV immediate domains=[(0,1),(1,3),(2,12)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,4)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,4)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
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
MRV immediate domains=[(0,1),(1,1),(2,3)]
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
MRV immediate domains=[(0,1),(1,3),(2,12)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,4)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,4)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,3)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,1)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,3)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,3)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,1)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3),(2,12)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,4)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,4)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,3)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,1)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,3)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,3)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,1)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3),(2,12)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,4)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,4)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
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
MRV immediate domains=[(0,1),(1,1),(2,3)]
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
MRV immediate domains=[(0,1),(1,3),(2,12)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,4)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,4)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
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
MRV immediate domains=[(0,1),(1,1),(2,3)]
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
Nonempty VS_lambda node=47 children=[46]; function graph -> parameter binding and output points
Task TSL supported Base=["Anchor","add","background","canvasSize","coord","fst","head","index","lambda","literal","mkScene","objectOf","objects","place","scan","snd","sortBy","subtract","tail","x","y"]
Cost saturation C=1..96 root representatives=[(1,0),(2,0),(3,0),(4,0),(5,0),(6,0),(7,0),(8,0),(9,0),(10,0),(11,0),(12,0),(13,0),(14,0),(15,0),(16,0),(17,0),(18,0),(19,0),(20,0),(21,0),(22,0),(23,0),(24,0),(25,0),(26,0),(27,0),(28,0),(29,0),(30,0),(31,0),(32,0),(33,0),(34,0),(35,0),(36,0),(37,0),(38,0),(39,0),(40,0),(41,0),(42,0),(43,0),(44,0),(45,3),(46,9),(47,18),(48,24),(49,24),(50,24),(51,30),(52,69),(53,138),(54,183),(55,237),(56,318),(57,360),(58,402),(59,456),(60,510),(61,636),(62,780),(63,852),(64,924),(65,996),(66,1014),(67,1014),(68,1014),(69,1014),(70,1014),(71,1014),(72,1014),(73,1014),(74,1014),(75,1014),(76,1014),(77,1014),(78,1014),(79,1014),(80,1014),(81,1014),(82,1014),(83,1014),(84,1014),(85,1014),(86,1014),(87,1014),(88,1014),(89,1014),(90,1014),(91,1014),(92,1014),(93,1014),(94,1014),(95,1014),(96,1014)]
Abstraction round=0; exact frontier=1014; accepted=["I0","I1","I2","I3","I4","I5"]
Learn uses I0 by typed definition expansion; ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]
Task TSL supported Base=["Anchor","add","background","canvasSize","coord","fst","head","index","lambda","let","literal","mkScene","objectOf","objects","place","scan","snd","sortBy","subtract","tail","x","y"]
Cost saturation C=1..96 root representatives=[(1,0),(2,0),(3,0),(4,0),(5,0),(6,0),(7,0),(8,0),(9,0),(10,0),(11,0),(12,0),(13,0),(14,0),(15,0),(16,0),(17,0),(18,0),(19,0),(20,0),(21,0),(22,0),(23,0),(24,0),(25,0),(26,0),(27,0),(28,0),(29,0),(30,0),(31,0),(32,0),(33,0),(34,0),(35,0),(36,0),(37,0),(38,0),(39,0),(40,0),(41,0),(42,0),(43,0),(44,0),(45,3),(46,9),(47,18),(48,24),(49,24),(50,24),(51,30),(52,69),(53,138),(54,183),(55,237),(56,318),(57,360),(58,402),(59,456),(60,510),(61,636),(62,780),(63,852),(64,924),(65,996),(66,1014),(67,1014),(68,1014),(69,1014),(70,1014),(71,1014),(72,1014),(73,1014),(74,1014),(75,1014),(76,1014),(77,1014),(78,1014),(79,1014),(80,1014),(81,1014),(82,1014),(83,1014),(84,1014),(85,1014),(86,1014),(87,1014),(88,1014),(89,1014),(90,1014),(91,1014),(92,1014),(93,1014),(94,1014),(95,1014),(96,1014)]
Abstraction round=1; exact frontier=1014; accepted=[]
Cost saturation C=1..96 root representatives=[(1,0),(2,0),(3,0),(4,0),(5,0),(6,0),(7,0),(8,0),(9,0),(10,0),(11,0),(12,0),(13,0),(14,0),(15,0),(16,0),(17,0),(18,0),(19,0),(20,0),(21,0),(22,0),(23,0),(24,0),(25,0),(26,0),(27,0),(28,0),(29,0),(30,0),(31,0),(32,0),(33,0),(34,0),(35,0),(36,0),(37,0),(38,0),(39,0),(40,0),(41,0),(42,0),(43,0),(44,0),(45,3),(46,9),(47,18),(48,24),(49,24),(50,24),(51,30),(52,69),(53,138),(54,183),(55,237),(56,318),(57,360),(58,402),(59,456),(60,510),(61,636),(62,780),(63,852),(64,924),(65,996),(66,1014),(67,1014),(68,1014),(69,1014),(70,1014),(71,1014),(72,1014),(73,1014),(74,1014),(75,1014),(76,1014),(77,1014),(78,1014),(79,1014),(80,1014),(81,1014),(82,1014),(83,1014),(84,1014),(85,1014),(86,1014),(87,1014),(88,1014),(89,1014),(90,1014),(91,1014),(92,1014),(93,1014),(94,1014),(95,1014),(96,1014)]
Exact original Render(P(Encode(x)))=y: True; MDL rank=(66,19,3,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),Anchor(head(__cse0),BR)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(66,19,3,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),Anchor(head(__cse0),BR)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(66,19,3,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),Anchor(head(__cse0),BR)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(67,19,3,0,"(lambda v0:SceneT. let __cse0=head(tail(objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),Anchor(__cse0,BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(67,19,3,0,"(lambda v0:SceneT. let __cse0=head(tail(objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),Anchor(__cse0,BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(67,19,3,0,"(lambda v0:SceneT. let __cse0=head(tail(objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),Anchor(__cse0,BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,20,3,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),Anchor(head(__cse0),BR)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,20,3,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),Anchor(head(__cse0),BR)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,20,3,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),Anchor(head(__cse0),BR)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,20,3,0,"(lambda v0:SceneT. let __cse0=head(tail(objects(v0))) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),Anchor(__cse0,BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,20,3,0,"(lambda v0:SceneT. let __cse0=head(tail(objects(v0))) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),Anchor(__cse0,BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,20,3,0,"(lambda v0:SceneT. let __cse0=head(tail(objects(v0))) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),Anchor(__cse0,BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,19,3,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),Anchor(head(tail(objects(v0))),BR)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,19,3,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(objects(v0)))),Anchor(head(__cse0),BR)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,19,3,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),Anchor(head(tail(objects(v0))),BR)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,19,3,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(objects(v0)))),Anchor(head(__cse0),BR)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,19,3,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),Anchor(head(tail(objects(v0))),BR)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,19,3,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(objects(v0)))),Anchor(head(__cse0),BR)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(70,20,3,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),Anchor(head(tail(objects(v0))),BR)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(70,20,3,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(objects(v0)))),Anchor(head(__cse0),BR)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(70,20,3,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),Anchor(head(tail(objects(v0))),BR)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(70,20,3,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(objects(v0)))),Anchor(head(__cse0),BR)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(70,20,3,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),Anchor(head(tail(objects(v0))),BR)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(70,20,3,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(objects(v0)))),Anchor(head(__cse0),BR)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(73,19,4,0,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),Anchor(__cse0,BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(73,19,4,0,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),Anchor(__cse0,BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(73,19,4,0,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),Anchor(__cse0,BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(73,19,4,0,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),Anchor(__cse0,BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(73,19,4,0,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),Anchor(__cse0,BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(73,19,4,0,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),Anchor(__cse0,BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,20,4,0,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),Anchor(__cse0,BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,20,4,0,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),Anchor(__cse0,BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,20,4,0,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),Anchor(__cse0,BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,20,4,0,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),Anchor(__cse0,BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,20,4,0,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),Anchor(__cse0,BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,20,4,0,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),Anchor(__cse0,BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,19,4,0,"(lambda v0:SceneT. let __cse0=head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),Anchor(__cse0,BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,19,4,0,"(lambda v0:SceneT. let __cse0=head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),Anchor(__cse0,BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,19,4,0,"(lambda v0:SceneT. let __cse0=head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),Anchor(__cse0,BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,19,4,0,"(lambda v0:SceneT. let __cse0=head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),Anchor(__cse0,BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,19,4,0,"(lambda v0:SceneT. let __cse0=head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),Anchor(__cse0,BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,19,4,0,"(lambda v0:SceneT. let __cse0=head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),Anchor(__cse0,BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,19,4,0,"(lambda v0:SceneT. let __cse0=head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),Anchor(__cse0,BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,19,4,0,"(lambda v0:SceneT. let __cse0=head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),Anchor(__cse0,BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,19,4,0,"(lambda v0:SceneT. let __cse0=head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),Anchor(__cse0,BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,19,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))),BR)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,19,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),BR)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,19,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),Anchor(head(__cse0),BR)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,19,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))),Anchor(head(__cse0),BR)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,19,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),BR)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,19,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),BR)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,19,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),Anchor(head(__cse0),BR)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,19,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))),Anchor(head(__cse0),BR)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,19,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),BR)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,19,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))),BR)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,19,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),Anchor(head(__cse0),BR)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,19,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),Anchor(head(__cse0),BR)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,19,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),Anchor(head(tail(objects(v0))),BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,19,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),Anchor(head(tail(objects(v0))),BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,19,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),Anchor(head(tail(objects(v0))),BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,19,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),Anchor(head(tail(objects(v0))),BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,19,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))),Anchor(head(tail(objects(v0))),BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,19,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))),Anchor(head(tail(objects(v0))),BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,19,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(objects(v0)))),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,19,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(objects(v0)))),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,19,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(objects(v0)))),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))),BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,19,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(objects(v0)))),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))),BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,19,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(objects(v0)))),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,19,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(objects(v0)))),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(76,20,4,0,"(lambda v0:SceneT. let __cse0=head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),Anchor(__cse0,BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(76,20,4,0,"(lambda v0:SceneT. let __cse0=head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),Anchor(__cse0,BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(76,20,4,0,"(lambda v0:SceneT. let __cse0=head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),Anchor(__cse0,BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(76,20,4,0,"(lambda v0:SceneT. let __cse0=head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),Anchor(__cse0,BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(76,20,4,0,"(lambda v0:SceneT. let __cse0=head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),Anchor(__cse0,BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(76,20,4,0,"(lambda v0:SceneT. let __cse0=head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),Anchor(__cse0,BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(76,20,4,0,"(lambda v0:SceneT. let __cse0=head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),Anchor(__cse0,BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(76,20,4,0,"(lambda v0:SceneT. let __cse0=head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),Anchor(__cse0,BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(76,20,4,0,"(lambda v0:SceneT. let __cse0=head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),Anchor(__cse0,BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,19,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))),BR)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,19,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))),BR)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,19,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))),BR)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,19,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))),Anchor(head(__cse0),BR)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,19,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))),Anchor(head(__cse0),BR)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,19,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))),Anchor(head(__cse0),BR)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(76,20,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))),BR)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(76,20,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),BR)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(76,20,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),Anchor(head(__cse0),BR)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(76,20,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))),Anchor(head(__cse0),BR)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,19,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))),BR)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,19,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))),BR)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,19,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))),BR)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,19,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))),Anchor(head(__cse0),BR)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,19,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))),Anchor(head(__cse0),BR)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,19,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))),Anchor(head(__cse0),BR)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(76,20,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),BR)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(76,20,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),BR)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(76,20,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),Anchor(head(__cse0),BR)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(76,20,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))),Anchor(head(__cse0),BR)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,19,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))),BR)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,19,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))),BR)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,19,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))),BR)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,19,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))),Anchor(head(__cse0),BR)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,19,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))),Anchor(head(__cse0),BR)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,19,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))),Anchor(head(__cse0),BR)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(76,20,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),BR)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(76,20,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))),BR)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(76,20,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),Anchor(head(__cse0),BR)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(76,20,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),Anchor(head(__cse0),BR)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,19,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(objects(v0)))),Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))),BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,19,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(objects(v0)))),Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))),BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,19,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(objects(v0)))),Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))),BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,19,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(objects(v0)))),Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))),BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,19,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(objects(v0)))),Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))),BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,19,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(objects(v0)))),Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))),BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,19,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(objects(v0)))),Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))),BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,19,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(objects(v0)))),Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))),BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,19,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(objects(v0)))),Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))),BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,19,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))),Anchor(head(tail(objects(v0))),BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,19,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))),Anchor(head(tail(objects(v0))),BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,19,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))),Anchor(head(tail(objects(v0))),BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,19,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))),Anchor(head(tail(objects(v0))),BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,19,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))),Anchor(head(tail(objects(v0))),BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,19,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))),Anchor(head(tail(objects(v0))),BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,19,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))),Anchor(head(tail(objects(v0))),BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,19,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))),Anchor(head(tail(objects(v0))),BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,19,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))),Anchor(head(tail(objects(v0))),BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(76,20,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),Anchor(head(tail(objects(v0))),BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(76,20,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),Anchor(head(tail(objects(v0))),BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(76,20,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),Anchor(head(tail(objects(v0))),BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(76,20,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),Anchor(head(tail(objects(v0))),BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(76,20,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))),Anchor(head(tail(objects(v0))),BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(76,20,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))),Anchor(head(tail(objects(v0))),BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(76,20,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(objects(v0)))),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(76,20,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(objects(v0)))),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(76,20,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(objects(v0)))),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))),BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(76,20,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(objects(v0)))),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))),BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(76,20,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(objects(v0)))),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(76,20,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(objects(v0)))),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(77,20,4,0,"(lambda v0:SceneT. let __cse0=head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),Anchor(__cse0,BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(77,20,4,0,"(lambda v0:SceneT. let __cse0=head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),Anchor(__cse0,BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(77,20,4,0,"(lambda v0:SceneT. let __cse0=head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),Anchor(__cse0,BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(77,20,4,0,"(lambda v0:SceneT. let __cse0=head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),Anchor(__cse0,BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(77,20,4,0,"(lambda v0:SceneT. let __cse0=head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),Anchor(__cse0,BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(77,20,4,0,"(lambda v0:SceneT. let __cse0=head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),Anchor(__cse0,BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(77,20,4,0,"(lambda v0:SceneT. let __cse0=head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),Anchor(__cse0,BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(77,20,4,0,"(lambda v0:SceneT. let __cse0=head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),Anchor(__cse0,BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(77,20,4,0,"(lambda v0:SceneT. let __cse0=head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),Anchor(__cse0,BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(77,20,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))),BR)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(77,20,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))),BR)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(77,20,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))),BR)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(77,20,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))),Anchor(head(__cse0),BR)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(77,20,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))),Anchor(head(__cse0),BR)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(77,20,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))),Anchor(head(__cse0),BR)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(77,20,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))),BR)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(77,20,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))),BR)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(77,20,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))),BR)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(77,20,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))),Anchor(head(__cse0),BR)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(77,20,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))),Anchor(head(__cse0),BR)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(77,20,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))),Anchor(head(__cse0),BR)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(77,20,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))),BR)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(77,20,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))),BR)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(77,20,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))),BR)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(77,20,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))),Anchor(head(__cse0),BR)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(77,20,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))),Anchor(head(__cse0),BR)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(77,20,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))),Anchor(head(__cse0),BR)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(77,20,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(objects(v0)))),Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))),BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(77,20,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(objects(v0)))),Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))),BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(77,20,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(objects(v0)))),Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))),BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(77,20,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(objects(v0)))),Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))),BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(77,20,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(objects(v0)))),Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))),BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(77,20,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(objects(v0)))),Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))),BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(77,20,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(objects(v0)))),Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))),BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(77,20,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(objects(v0)))),Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))),BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(77,20,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(objects(v0)))),Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))),BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(77,20,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))),Anchor(head(tail(objects(v0))),BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(77,20,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))),Anchor(head(tail(objects(v0))),BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(77,20,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))),Anchor(head(tail(objects(v0))),BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(77,20,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))),Anchor(head(tail(objects(v0))),BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(77,20,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))),Anchor(head(tail(objects(v0))),BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(77,20,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))),Anchor(head(tail(objects(v0))),BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(77,20,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))),Anchor(head(tail(objects(v0))),BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(77,20,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))),Anchor(head(tail(objects(v0))),BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(77,20,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))),Anchor(head(tail(objects(v0))),BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(79,21,4,0,"(lambda v0:SceneT. let __cse0=head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)))) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),Anchor(__cse0,BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(79,21,4,0,"(lambda v0:SceneT. let __cse0=head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)))) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),Anchor(__cse0,BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(79,21,4,0,"(lambda v0:SceneT. let __cse0=head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)))) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),Anchor(__cse0,BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(79,21,4,0,"(lambda v0:SceneT. let __cse0=head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)))) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),Anchor(__cse0,BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(79,21,4,0,"(lambda v0:SceneT. let __cse0=head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)))) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),Anchor(__cse0,BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(79,21,4,0,"(lambda v0:SceneT. let __cse0=head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)))) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),Anchor(__cse0,BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(79,21,4,0,"(lambda v0:SceneT. let __cse0=head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)))) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),Anchor(__cse0,BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(79,21,4,0,"(lambda v0:SceneT. let __cse0=head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)))) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),Anchor(__cse0,BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(79,21,4,0,"(lambda v0:SceneT. let __cse0=head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)))) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),Anchor(__cse0,BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(78,20,4,0,"(lambda v0:SceneT. let __cse0=head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),Anchor(__cse0,BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(78,20,4,0,"(lambda v0:SceneT. let __cse0=head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),Anchor(__cse0,BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(78,20,4,0,"(lambda v0:SceneT. let __cse0=head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),Anchor(__cse0,BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(78,20,4,0,"(lambda v0:SceneT. let __cse0=head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),Anchor(__cse0,BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(78,20,4,0,"(lambda v0:SceneT. let __cse0=head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),Anchor(__cse0,BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(78,20,4,0,"(lambda v0:SceneT. let __cse0=head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),Anchor(__cse0,BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(78,20,4,0,"(lambda v0:SceneT. let __cse0=head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),Anchor(__cse0,BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(78,20,4,0,"(lambda v0:SceneT. let __cse0=head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),Anchor(__cse0,BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(78,20,4,0,"(lambda v0:SceneT. let __cse0=head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),Anchor(__cse0,BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(78,20,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)))),BR)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(78,20,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)))),BR)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(78,20,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)))),BR)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(78,20,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))),Anchor(head(__cse0),BR)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(78,20,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))),Anchor(head(__cse0),BR)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(78,20,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))),Anchor(head(__cse0),BR)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(78,20,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)))),BR)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(78,20,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)))),BR)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(78,20,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)))),BR)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(78,20,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))),Anchor(head(__cse0),BR)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(78,20,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))),Anchor(head(__cse0),BR)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(78,20,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))),Anchor(head(__cse0),BR)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(78,20,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)))),BR)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(78,20,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)))),BR)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(78,20,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)))),BR)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(78,20,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))),Anchor(head(__cse0),BR)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(78,20,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))),Anchor(head(__cse0),BR)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(78,20,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))),Anchor(head(__cse0),BR)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(78,20,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(objects(v0)))),Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)))),BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(78,20,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(objects(v0)))),Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)))),BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(78,20,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(objects(v0)))),Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)))),BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(78,20,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(objects(v0)))),Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)))),BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(78,20,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(objects(v0)))),Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)))),BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(78,20,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(objects(v0)))),Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)))),BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(78,20,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(objects(v0)))),Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)))),BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(78,20,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(objects(v0)))),Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)))),BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(78,20,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(objects(v0)))),Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)))),BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(78,20,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))),Anchor(head(tail(objects(v0))),BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(78,20,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))),Anchor(head(tail(objects(v0))),BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(78,20,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))),Anchor(head(tail(objects(v0))),BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(78,20,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))),Anchor(head(tail(objects(v0))),BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(78,20,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))),Anchor(head(tail(objects(v0))),BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(78,20,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))),Anchor(head(tail(objects(v0))),BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(78,20,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))),Anchor(head(tail(objects(v0))),BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(78,20,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))),Anchor(head(tail(objects(v0))),BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(78,20,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))),Anchor(head(tail(objects(v0))),BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(80,21,4,0,"(lambda v0:SceneT. let __cse0=head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),Anchor(__cse0,BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(80,21,4,0,"(lambda v0:SceneT. let __cse0=head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),Anchor(__cse0,BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(80,21,4,0,"(lambda v0:SceneT. let __cse0=head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),Anchor(__cse0,BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(80,21,4,0,"(lambda v0:SceneT. let __cse0=head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),Anchor(__cse0,BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(80,21,4,0,"(lambda v0:SceneT. let __cse0=head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),Anchor(__cse0,BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(80,21,4,0,"(lambda v0:SceneT. let __cse0=head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),Anchor(__cse0,BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(80,21,4,0,"(lambda v0:SceneT. let __cse0=head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),Anchor(__cse0,BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(80,21,4,0,"(lambda v0:SceneT. let __cse0=head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),Anchor(__cse0,BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(80,21,4,0,"(lambda v0:SceneT. let __cse0=head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),Anchor(__cse0,BR)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(79,20,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))),BR)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(79,20,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))),BR)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(79,20,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))),BR)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(79,20,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)))))),Anchor(head(__cse0),BR)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(79,20,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)))))),Anchor(head(__cse0),BR)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(79,20,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0)))))),Anchor(head(__cse0),BR)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(80,21,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)))),BR)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(80,21,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)))),BR)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(80,21,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)))),BR)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(80,21,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))),Anchor(head(__cse0),BR)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(80,21,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))),Anchor(head(__cse0),BR)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(80,21,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))),Anchor(head(__cse0),BR)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(79,20,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))),BR)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(79,20,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))),BR)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(79,20,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))),BR)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(79,20,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)))))),Anchor(head(__cse0),BR)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(79,20,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)))))),Anchor(head(__cse0),BR)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(79,20,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0)))))),Anchor(head(__cse0),BR)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(80,21,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)))),BR)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(80,21,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)))),BR)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(80,21,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)))),BR)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(80,21,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))),Anchor(head(__cse0),BR)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(80,21,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))),Anchor(head(__cse0),BR)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(80,21,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))),Anchor(head(__cse0),BR)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(79,20,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))),BR)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(79,20,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))),BR)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(79,20,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))),BR)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(79,20,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)))))),Anchor(head(__cse0),BR)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(79,20,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)))))),Anchor(head(__cse0),BR)),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(79,20,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0)))))),Anchor(head(__cse0),BR)),tail(__cse0))))")
```
