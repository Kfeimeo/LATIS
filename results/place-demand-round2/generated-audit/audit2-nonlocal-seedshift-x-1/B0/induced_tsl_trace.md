# LATIS v0.3R.2
StructuralPriorCount=0. Counterfactual labels never guide synthesis.
```text
Root specification Q0: ArrowT SceneT SceneT; observations=2; Gamma=[]. Original Grid targets reserved for exact verification.
Learn(ArrowT SceneT SceneT; observations=2; Gamma=[]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,28)]
Learn(SceneT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","mkScene"]
MRV immediate domains=[(0,1),(1,3),(2,14)]
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
MRV immediate domains=[(0,1),(1,1)]
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
MRV immediate domains=[(0,1),(1,2)]
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
MRV immediate domains=[(0,1),(1,1),(2,2)]
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
MRV immediate domains=[(0,1),(1,3),(2,14)]
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
MRV immediate domains=[(0,1),(1,2)]
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
MRV immediate domains=[(0,1),(1,1),(2,2)]
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
MRV immediate domains=[(0,1),(1,3),(2,14)]
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
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
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
MRV immediate domains=[(0,1),(1,1),(2,2)]
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
MRV immediate domains=[(0,1),(1,3),(2,14)]
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
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
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
MRV immediate domains=[(0,1),(1,1),(2,2)]
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
MRV immediate domains=[(0,1),(1,3),(2,14)]
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
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
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
MRV immediate domains=[(0,1),(1,1),(2,2)]
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
MRV immediate domains=[(0,1),(1,3),(2,14)]
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
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
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
MRV immediate domains=[(0,1),(1,1),(2,2)]
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
MRV immediate domains=[(0,1),(1,3),(2,14)]
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
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
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
MRV immediate domains=[(0,1),(1,1),(2,2)]
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
MRV immediate domains=[(0,1),(1,3),(2,14)]
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
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
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
MRV immediate domains=[(0,1),(1,1),(2,2)]
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
MRV immediate domains=[(0,1),(1,3),(2,14)]
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
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
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
MRV immediate domains=[(0,1),(1,1),(2,2)]
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
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3),(2,14)]
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
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
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
MRV immediate domains=[(0,1),(1,1),(2,2)]
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
MRV immediate domains=[(0,1),(1,3),(2,14)]
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
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
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
MRV immediate domains=[(0,1),(1,1),(2,2)]
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
MRV immediate domains=[(0,1),(1,3),(2,14)]
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
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
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
MRV immediate domains=[(0,1),(1,1),(2,2)]
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
MRV immediate domains=[(0,1),(1,3),(2,14)]
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
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
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
MRV immediate domains=[(0,11),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,11),(1,31)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_coord node=56 children=[23,55]; component projection of output specification
Learn(ObjectT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","objectOf"]
Nonempty VS_place node=69 children=[68,56]; place inverse: output local geometry and absolute origin; no translation template
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_scan node=74 children=[11,69,73]; scan witness: output head is seed; ((y_(i-1),x_i),y_i)=[(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 4, cy = 13}, geometry = fromList [(Coord {cx = 0, cy = 0},3)], orientation = 0})) (PlacedV (Object {objectId = 0, position = Coord {cx = 4, cy = 4}, geometry = fromList [(Coord {cx = 0, cy = 1},9),(Coord {cx = 1, cy = 0},9),(Coord {cx = 1, cy = 1},9)], orientation = 0})),PlacedV (Object {objectId = 0, position = Coord {cx = 5, cy = 14}, geometry = fromList [(Coord {cx = 0, cy = 1},9),(Coord {cx = 1, cy = 0},9),(Coord {cx = 1, cy = 1},9)], orientation = 0})),(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 5, cy = 14}, geometry = fromList [(Coord {cx = 0, cy = 1},9),(Coord {cx = 1, cy = 0},9),(Coord {cx = 1, cy = 1},9)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 13, cy = 12}, geometry = fromList [(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 7, cy = 16}, geometry = fromList [(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 8, cy = 8}, geometry = fromList [(Coord {cx = 0, cy = 0},7),(Coord {cx = 1, cy = 0},7),(Coord {cx = 1, cy = 1},7),(Coord {cx = 2, cy = 0},7)], orientation = 0})) (PlacedV (Object {objectId = 0, position = Coord {cx = 9, cy = 1}, geometry = fromList [(Coord {cx = 0, cy = 0},5),(Coord {cx = 0, cy = 1},5),(Coord {cx = 1, cy = 1},5)], orientation = 0})),PlacedV (Object {objectId = 0, position = Coord {cx = 11, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},5),(Coord {cx = 0, cy = 1},5),(Coord {cx = 1, cy = 1},5)], orientation = 0})),(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 11, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},5),(Coord {cx = 0, cy = 1},5),(Coord {cx = 1, cy = 1},5)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 11, cy = 11}, geometry = fromList [(Coord {cx = 0, cy = 1},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 13, cy = 12}, geometry = fromList [(Coord {cx = 0, cy = 1},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1)], orientation = 0}))]; includes-seed convention; no task classifier
MRV immediate domains=[(0,1),(1,1),(2,1)]
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
MRV immediate domains=[(0,1),(1,1),(2,2)]
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
Nonempty VS_mkScene node=75 children=[1,4,74]; mkScene residual: canonical correspondence + Render-validated paint order; branch=0
MRV immediate domains=[(0,1),(1,3),(2,14)]
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
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
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
MRV immediate domains=[(0,1),(1,1),(2,2)]
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
MRV immediate domains=[(0,1),(1,3),(2,14)]
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
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
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
MRV immediate domains=[(0,1),(1,1),(2,2)]
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
MRV immediate domains=[(0,1),(1,3),(2,14)]
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
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
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
MRV immediate domains=[(0,1),(1,1),(2,2)]
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
MRV immediate domains=[(0,1),(1,3),(2,14)]
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
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
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
MRV immediate domains=[(0,1),(1,1),(2,2)]
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
MRV immediate domains=[(0,1),(1,3),(2,14)]
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
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
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
MRV immediate domains=[(0,1),(1,1),(2,2)]
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
MRV immediate domains=[(0,1),(1,3),(2,14)]
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
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
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
MRV immediate domains=[(0,1),(1,1),(2,2)]
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
MRV immediate domains=[(0,1),(1,3),(2,14)]
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
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
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
MRV immediate domains=[(0,1),(1,1),(2,2)]
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
MRV immediate domains=[(0,1),(1,3),(2,14)]
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
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
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
MRV immediate domains=[(0,1),(1,1),(2,2)]
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
MRV immediate domains=[(0,1),(1,3),(2,14)]
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
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
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
MRV immediate domains=[(0,1),(1,1),(2,2)]
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
MRV immediate domains=[(0,1),(1,3),(2,14)]
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
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
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
MRV immediate domains=[(0,1),(1,1),(2,2)]
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
MRV immediate domains=[(0,1),(1,3),(2,14)]
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
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
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
MRV immediate domains=[(0,1),(1,1),(2,2)]
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
Nonempty VS_lambda node=76 children=[75]; function graph -> parameter binding and output points
Task TSL supported Base=["Anchor","ObjectCells","ObjectColors","add","background","canvasSize","cardinality","colorToInt","coord","fst","head","index","lambda","literal","mkScene","objectOf","objects","place","scan","setToList","snd","sortBy","subtract","tail","x","y"]
Cost saturation C=1..67 root representatives=[(1,0),(2,0),(3,0),(4,0),(5,0),(6,0),(7,0),(8,0),(9,0),(10,0),(11,0),(12,0),(13,0),(14,0),(15,0),(16,0),(17,0),(18,0),(19,0),(20,0),(21,0),(22,0),(23,0),(24,0),(25,0),(26,0),(27,0),(28,0),(29,0),(30,0),(31,0),(32,0),(33,0),(34,0),(35,0),(36,0),(37,0),(38,0),(39,0),(40,0),(41,0),(42,0),(43,0),(44,0),(45,0),(46,0),(47,0),(48,0),(49,0),(50,0),(51,0),(52,0),(53,0),(54,0),(55,0),(56,0),(57,0),(58,12),(59,24),(60,48),(61,84),(62,96),(63,108),(64,138),(65,234),(66,510),(67,510)]
Abstraction round=0; exact frontier=797; accepted=["I0","I1","I2","I3","I4","I5"]
Learn uses I0 by typed definition expansion; ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]
Task TSL supported Base=["Anchor","ObjectCells","ObjectColors","add","background","canvasSize","cardinality","colorToInt","coord","fst","head","index","lambda","let","literal","mkScene","objectOf","objects","place","scan","setToList","snd","sortBy","subtract","tail","x","y"]
Cost saturation C=1..67 root representatives=[(1,0),(2,0),(3,0),(4,0),(5,0),(6,0),(7,0),(8,0),(9,0),(10,0),(11,0),(12,0),(13,0),(14,0),(15,0),(16,0),(17,0),(18,0),(19,0),(20,0),(21,0),(22,0),(23,0),(24,0),(25,0),(26,0),(27,0),(28,0),(29,0),(30,0),(31,0),(32,0),(33,0),(34,0),(35,0),(36,0),(37,0),(38,0),(39,0),(40,0),(41,0),(42,0),(43,0),(44,0),(45,0),(46,0),(47,0),(48,0),(49,0),(50,0),(51,0),(52,0),(53,0),(54,0),(55,0),(56,0),(57,0),(58,12),(59,24),(60,48),(61,84),(62,96),(63,108),(64,138),(65,234),(66,510),(67,510)]
Abstraction round=1; exact frontier=797; accepted=[]
Cost saturation C=1..52 root representatives=[(1,0),(2,0),(3,0),(4,0),(5,0),(6,0),(7,0),(8,0),(9,0),(10,0),(11,0),(12,0),(13,0),(14,0),(15,0),(16,0),(17,0),(18,0),(19,0),(20,0),(21,0),(22,0),(23,0),(24,0),(25,0),(26,0),(27,0),(28,0),(29,0),(30,0),(31,0),(32,0),(33,0),(34,0),(35,0),(36,0),(37,0),(38,0),(39,0),(40,0),(41,0),(42,0),(43,0),(44,0),(45,0),(46,0),(47,0),(48,0),(49,0),(50,0),(51,0),(52,0)]
Exact original Render(P(Encode(x)))=y: True; MDL rank=(82,22,3,0,"(lambda v0:SceneT. let __cse0=head(tail(objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse0))))),IntV 1),add(y(Anchor(__cse0,Center)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(82,22,3,0,"(lambda v0:SceneT. let __cse0=head(tail(objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse0))))),IntV 1),add(y(Anchor(__cse0,Center)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(82,22,3,0,"(lambda v0:SceneT. let __cse0=head(tail(objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse0))))),IntV 1),add(y(Anchor(__cse0,Center)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(82,22,3,0,"(lambda v0:SceneT. let __cse0=head(tail(objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse0))))),IntV 1),add(y(Anchor(__cse0,TL)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(82,22,3,0,"(lambda v0:SceneT. let __cse0=head(tail(objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse0))))),IntV 1),add(y(Anchor(__cse0,TL)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(82,22,3,0,"(lambda v0:SceneT. let __cse0=head(tail(objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse0))))),IntV 1),add(y(Anchor(__cse0,TL)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(82,22,3,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),add(y(Anchor(head(__cse0),Center)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(82,22,3,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),add(y(Anchor(head(__cse0),TL)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(82,22,3,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),add(y(Anchor(head(__cse0),Center)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(82,22,3,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),add(y(Anchor(head(__cse0),TL)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(82,22,3,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),add(y(Anchor(head(__cse0),Center)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(82,22,3,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),add(y(Anchor(head(__cse0),TL)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(84,23,3,0,"(lambda v0:SceneT. let __cse0=head(tail(objects(v0))) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse0))))),IntV 1),add(y(Anchor(__cse0,Center)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(84,23,3,0,"(lambda v0:SceneT. let __cse0=head(tail(objects(v0))) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse0))))),IntV 1),add(y(Anchor(__cse0,Center)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(84,23,3,0,"(lambda v0:SceneT. let __cse0=head(tail(objects(v0))) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse0))))),IntV 1),add(y(Anchor(__cse0,Center)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(84,23,3,0,"(lambda v0:SceneT. let __cse0=head(tail(objects(v0))) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse0))))),IntV 1),add(y(Anchor(__cse0,TL)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(84,23,3,0,"(lambda v0:SceneT. let __cse0=head(tail(objects(v0))) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse0))))),IntV 1),add(y(Anchor(__cse0,TL)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(84,23,3,0,"(lambda v0:SceneT. let __cse0=head(tail(objects(v0))) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse0))))),IntV 1),add(y(Anchor(__cse0,TL)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(84,23,3,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),add(y(Anchor(head(__cse0),Center)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(84,23,3,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),add(y(Anchor(head(__cse0),TL)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(84,23,3,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),add(y(Anchor(head(__cse0),Center)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(84,23,3,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),add(y(Anchor(head(__cse0),TL)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(84,23,3,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),add(y(Anchor(head(__cse0),Center)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(84,23,3,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),add(y(Anchor(head(__cse0),TL)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(84,22,3,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in let __cse1=objectOf(head(tail(objects(v0)))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse1,coord(add(colorToInt(head(setToList(ObjectColors(__cse1)))),IntV 1),add(y(Anchor(head(__cse0),Center)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(84,22,3,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in let __cse1=objectOf(head(tail(objects(v0)))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse1,coord(add(colorToInt(head(setToList(ObjectColors(__cse1)))),IntV 1),add(y(Anchor(head(__cse0),TL)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(84,22,3,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),add(y(Anchor(head(tail(objects(v0))),Center)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(84,22,3,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),add(y(Anchor(head(tail(objects(v0))),TL)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(84,22,3,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(objects(v0)))))))),IntV 1),add(y(Anchor(head(__cse0),Center)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(84,22,3,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(objects(v0)))))))),IntV 1),add(y(Anchor(head(__cse0),TL)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(84,22,3,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(objects(v0)))),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),add(y(Anchor(head(__cse0),Center)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(84,22,3,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(objects(v0)))),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),add(y(Anchor(head(__cse0),TL)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(84,22,3,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in let __cse1=objectOf(head(tail(objects(v0)))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse1,coord(add(colorToInt(head(setToList(ObjectColors(__cse1)))),IntV 1),add(y(Anchor(head(__cse0),Center)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(84,22,3,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in let __cse1=objectOf(head(tail(objects(v0)))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse1,coord(add(colorToInt(head(setToList(ObjectColors(__cse1)))),IntV 1),add(y(Anchor(head(__cse0),TL)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(84,22,3,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),add(y(Anchor(head(tail(objects(v0))),Center)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(84,22,3,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),add(y(Anchor(head(tail(objects(v0))),TL)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(84,22,3,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(objects(v0)))))))),IntV 1),add(y(Anchor(head(__cse0),Center)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(84,22,3,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(objects(v0)))))))),IntV 1),add(y(Anchor(head(__cse0),TL)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(84,22,3,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(objects(v0)))),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),add(y(Anchor(head(__cse0),Center)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(84,22,3,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(objects(v0)))),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),add(y(Anchor(head(__cse0),TL)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(84,22,3,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)) in let __cse1=objectOf(head(tail(objects(v0)))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse1,coord(add(colorToInt(head(setToList(ObjectColors(__cse1)))),IntV 1),add(y(Anchor(head(__cse0),Center)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(84,22,3,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)) in let __cse1=objectOf(head(tail(objects(v0)))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse1,coord(add(colorToInt(head(setToList(ObjectColors(__cse1)))),IntV 1),add(y(Anchor(head(__cse0),TL)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(84,22,3,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),add(y(Anchor(head(tail(objects(v0))),Center)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(84,22,3,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),add(y(Anchor(head(tail(objects(v0))),TL)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(84,22,3,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(objects(v0)))))))),IntV 1),add(y(Anchor(head(__cse0),Center)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(84,22,3,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(objects(v0)))))))),IntV 1),add(y(Anchor(head(__cse0),TL)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(84,22,3,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(objects(v0)))),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),add(y(Anchor(head(__cse0),Center)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(84,22,3,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(objects(v0)))),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),add(y(Anchor(head(__cse0),TL)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(85,22,3,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in let __cse1=head(tail(objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse1),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),add(y(Anchor(__cse1,Center)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(85,22,3,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in let __cse1=head(tail(objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse1),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),add(y(Anchor(__cse1,TL)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(85,22,3,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in let __cse1=head(tail(objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse1))))),IntV 1),add(y(Anchor(__cse1,Center)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(85,22,3,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in let __cse1=head(tail(objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse1))))),IntV 1),add(y(Anchor(__cse1,TL)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(86,23,3,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in let __cse1=objectOf(head(tail(objects(v0)))) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse1,coord(add(colorToInt(head(setToList(ObjectColors(__cse1)))),IntV 1),add(y(Anchor(head(__cse0),Center)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(86,23,3,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in let __cse1=objectOf(head(tail(objects(v0)))) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse1,coord(add(colorToInt(head(setToList(ObjectColors(__cse1)))),IntV 1),add(y(Anchor(head(__cse0),TL)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(86,23,3,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),add(y(Anchor(head(tail(objects(v0))),Center)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(86,23,3,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),add(y(Anchor(head(tail(objects(v0))),TL)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(86,23,3,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(objects(v0)))))))),IntV 1),add(y(Anchor(head(__cse0),Center)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(86,23,3,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(objects(v0)))))))),IntV 1),add(y(Anchor(head(__cse0),TL)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(86,23,3,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(objects(v0)))),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),add(y(Anchor(head(__cse0),Center)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(86,23,3,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(objects(v0)))),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),add(y(Anchor(head(__cse0),TL)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(85,22,3,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in let __cse1=head(tail(objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse1),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),add(y(Anchor(__cse1,Center)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(85,22,3,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in let __cse1=head(tail(objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse1),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),add(y(Anchor(__cse1,TL)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(85,22,3,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in let __cse1=head(tail(objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse1))))),IntV 1),add(y(Anchor(__cse1,Center)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(85,22,3,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in let __cse1=head(tail(objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse1))))),IntV 1),add(y(Anchor(__cse1,TL)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(86,23,3,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in let __cse1=objectOf(head(tail(objects(v0)))) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse1,coord(add(colorToInt(head(setToList(ObjectColors(__cse1)))),IntV 1),add(y(Anchor(head(__cse0),Center)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(86,23,3,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in let __cse1=objectOf(head(tail(objects(v0)))) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse1,coord(add(colorToInt(head(setToList(ObjectColors(__cse1)))),IntV 1),add(y(Anchor(head(__cse0),TL)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(86,23,3,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),add(y(Anchor(head(tail(objects(v0))),Center)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(86,23,3,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),add(y(Anchor(head(tail(objects(v0))),TL)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(86,23,3,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(objects(v0)))))))),IntV 1),add(y(Anchor(head(__cse0),Center)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(86,23,3,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(objects(v0)))))))),IntV 1),add(y(Anchor(head(__cse0),TL)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(86,23,3,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(objects(v0)))),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),add(y(Anchor(head(__cse0),Center)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(86,23,3,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(objects(v0)))),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),add(y(Anchor(head(__cse0),TL)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(85,22,3,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)) in let __cse1=head(tail(objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse1),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),add(y(Anchor(__cse1,Center)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(85,22,3,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)) in let __cse1=head(tail(objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse1),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),add(y(Anchor(__cse1,TL)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(85,22,3,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)) in let __cse1=head(tail(objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse1))))),IntV 1),add(y(Anchor(__cse1,Center)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(85,22,3,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)) in let __cse1=head(tail(objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse1))))),IntV 1),add(y(Anchor(__cse1,TL)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(86,23,3,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)) in let __cse1=objectOf(head(tail(objects(v0)))) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse1,coord(add(colorToInt(head(setToList(ObjectColors(__cse1)))),IntV 1),add(y(Anchor(head(__cse0),Center)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(86,23,3,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)) in let __cse1=objectOf(head(tail(objects(v0)))) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse1,coord(add(colorToInt(head(setToList(ObjectColors(__cse1)))),IntV 1),add(y(Anchor(head(__cse0),TL)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(86,23,3,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),add(y(Anchor(head(tail(objects(v0))),Center)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(86,23,3,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),add(y(Anchor(head(tail(objects(v0))),TL)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(86,23,3,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(objects(v0)))))))),IntV 1),add(y(Anchor(head(__cse0),Center)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(86,23,3,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(objects(v0)))))))),IntV 1),add(y(Anchor(head(__cse0),TL)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(86,23,3,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(objects(v0)))),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),add(y(Anchor(head(__cse0),Center)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(86,23,3,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(objects(v0)))),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),add(y(Anchor(head(__cse0),TL)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(87,23,3,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in let __cse1=head(tail(objects(v0))) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse1),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),add(y(Anchor(__cse1,Center)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(87,23,3,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in let __cse1=head(tail(objects(v0))) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse1),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),add(y(Anchor(__cse1,TL)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(87,23,3,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in let __cse1=head(tail(objects(v0))) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse1))))),IntV 1),add(y(Anchor(__cse1,Center)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(87,23,3,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in let __cse1=head(tail(objects(v0))) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse1))))),IntV 1),add(y(Anchor(__cse1,TL)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(87,23,3,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in let __cse1=head(tail(objects(v0))) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse1),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),add(y(Anchor(__cse1,Center)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(87,23,3,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in let __cse1=head(tail(objects(v0))) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse1),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),add(y(Anchor(__cse1,TL)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(87,23,3,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in let __cse1=head(tail(objects(v0))) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse1))))),IntV 1),add(y(Anchor(__cse1,Center)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(87,23,3,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in let __cse1=head(tail(objects(v0))) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse1))))),IntV 1),add(y(Anchor(__cse1,TL)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(87,23,3,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)) in let __cse1=head(tail(objects(v0))) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse1),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),add(y(Anchor(__cse1,Center)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(87,23,3,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)) in let __cse1=head(tail(objects(v0))) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse1),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),add(y(Anchor(__cse1,TL)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(87,23,3,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)) in let __cse1=head(tail(objects(v0))) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse1))))),IntV 1),add(y(Anchor(__cse1,Center)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(87,23,3,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)) in let __cse1=head(tail(objects(v0))) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse1))))),IntV 1),add(y(Anchor(__cse1,TL)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(88,22,4,0,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse0))))),IntV 1),add(y(Anchor(__cse0,Center)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(88,22,4,0,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse0))))),IntV 1),add(y(Anchor(__cse0,Center)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(88,22,4,0,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse0))))),IntV 1),add(y(Anchor(__cse0,TL)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(88,22,4,0,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse0))))),IntV 1),add(y(Anchor(__cse0,TL)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(88,22,4,0,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse0))))),IntV 1),add(y(Anchor(__cse0,Center)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(88,22,4,0,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse0))))),IntV 1),add(y(Anchor(__cse0,Center)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(88,22,4,0,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse0))))),IntV 1),add(y(Anchor(__cse0,TL)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(88,22,4,0,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse0))))),IntV 1),add(y(Anchor(__cse0,TL)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(88,22,4,0,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse0))))),IntV 1),add(y(Anchor(__cse0,Center)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(88,22,4,0,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse0))))),IntV 1),add(y(Anchor(__cse0,Center)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(88,22,4,0,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse0))))),IntV 1),add(y(Anchor(__cse0,TL)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(88,22,4,0,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse0))))),IntV 1),add(y(Anchor(__cse0,TL)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(90,23,4,0,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse0))))),IntV 1),add(y(Anchor(__cse0,Center)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(90,23,4,0,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse0))))),IntV 1),add(y(Anchor(__cse0,Center)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(90,23,4,0,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse0))))),IntV 1),add(y(Anchor(__cse0,TL)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(90,23,4,0,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse0))))),IntV 1),add(y(Anchor(__cse0,TL)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(90,23,4,0,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse0))))),IntV 1),add(y(Anchor(__cse0,Center)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(90,23,4,0,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse0))))),IntV 1),add(y(Anchor(__cse0,Center)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(90,23,4,0,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse0))))),IntV 1),add(y(Anchor(__cse0,TL)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(90,23,4,0,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse0))))),IntV 1),add(y(Anchor(__cse0,TL)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(90,23,4,0,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse0))))),IntV 1),add(y(Anchor(__cse0,Center)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(90,23,4,0,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse0))))),IntV 1),add(y(Anchor(__cse0,Center)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(90,23,4,0,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse0))))),IntV 1),add(y(Anchor(__cse0,TL)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(90,23,4,0,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse0))))),IntV 1),add(y(Anchor(__cse0,TL)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(89,22,4,0,"(lambda v0:SceneT. let __cse0=head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse0))))),IntV 1),add(y(Anchor(__cse0,Center)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(89,22,4,0,"(lambda v0:SceneT. let __cse0=head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse0))))),IntV 1),add(y(Anchor(__cse0,Center)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(89,22,4,0,"(lambda v0:SceneT. let __cse0=head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse0))))),IntV 1),add(y(Anchor(__cse0,Center)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(89,22,4,0,"(lambda v0:SceneT. let __cse0=head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse0))))),IntV 1),add(y(Anchor(__cse0,TL)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(89,22,4,0,"(lambda v0:SceneT. let __cse0=head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse0))))),IntV 1),add(y(Anchor(__cse0,TL)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(89,22,4,0,"(lambda v0:SceneT. let __cse0=head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse0))))),IntV 1),add(y(Anchor(__cse0,TL)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(89,22,4,0,"(lambda v0:SceneT. let __cse0=head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse0))))),IntV 1),add(y(Anchor(__cse0,Center)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(89,22,4,0,"(lambda v0:SceneT. let __cse0=head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse0))))),IntV 1),add(y(Anchor(__cse0,Center)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(89,22,4,0,"(lambda v0:SceneT. let __cse0=head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse0))))),IntV 1),add(y(Anchor(__cse0,Center)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(89,22,4,0,"(lambda v0:SceneT. let __cse0=head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse0))))),IntV 1),add(y(Anchor(__cse0,TL)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(89,22,4,0,"(lambda v0:SceneT. let __cse0=head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse0))))),IntV 1),add(y(Anchor(__cse0,TL)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(89,22,4,0,"(lambda v0:SceneT. let __cse0=head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse0))))),IntV 1),add(y(Anchor(__cse0,TL)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(89,22,4,0,"(lambda v0:SceneT. let __cse0=head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse0))))),IntV 1),add(y(Anchor(__cse0,Center)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(89,22,4,0,"(lambda v0:SceneT. let __cse0=head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse0))))),IntV 1),add(y(Anchor(__cse0,Center)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(89,22,4,0,"(lambda v0:SceneT. let __cse0=head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse0))))),IntV 1),add(y(Anchor(__cse0,Center)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(89,22,4,0,"(lambda v0:SceneT. let __cse0=head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse0))))),IntV 1),add(y(Anchor(__cse0,TL)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(89,22,4,0,"(lambda v0:SceneT. let __cse0=head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse0))))),IntV 1),add(y(Anchor(__cse0,TL)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(89,22,4,0,"(lambda v0:SceneT. let __cse0=head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse0))))),IntV 1),add(y(Anchor(__cse0,TL)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,23,4,0,"(lambda v0:SceneT. let __cse0=head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse0))))),IntV 1),add(y(Anchor(__cse0,Center)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,23,4,0,"(lambda v0:SceneT. let __cse0=head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse0))))),IntV 1),add(y(Anchor(__cse0,Center)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,23,4,0,"(lambda v0:SceneT. let __cse0=head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse0))))),IntV 1),add(y(Anchor(__cse0,Center)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,23,4,0,"(lambda v0:SceneT. let __cse0=head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse0))))),IntV 1),add(y(Anchor(__cse0,TL)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,23,4,0,"(lambda v0:SceneT. let __cse0=head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse0))))),IntV 1),add(y(Anchor(__cse0,TL)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,23,4,0,"(lambda v0:SceneT. let __cse0=head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse0))))),IntV 1),add(y(Anchor(__cse0,TL)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,23,4,0,"(lambda v0:SceneT. let __cse0=head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse0))))),IntV 1),add(y(Anchor(__cse0,Center)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,23,4,0,"(lambda v0:SceneT. let __cse0=head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse0))))),IntV 1),add(y(Anchor(__cse0,Center)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,23,4,0,"(lambda v0:SceneT. let __cse0=head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse0))))),IntV 1),add(y(Anchor(__cse0,Center)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,23,4,0,"(lambda v0:SceneT. let __cse0=head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse0))))),IntV 1),add(y(Anchor(__cse0,TL)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,23,4,0,"(lambda v0:SceneT. let __cse0=head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse0))))),IntV 1),add(y(Anchor(__cse0,TL)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,23,4,0,"(lambda v0:SceneT. let __cse0=head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse0))))),IntV 1),add(y(Anchor(__cse0,TL)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,23,4,0,"(lambda v0:SceneT. let __cse0=head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse0))))),IntV 1),add(y(Anchor(__cse0,Center)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,23,4,0,"(lambda v0:SceneT. let __cse0=head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse0))))),IntV 1),add(y(Anchor(__cse0,Center)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,23,4,0,"(lambda v0:SceneT. let __cse0=head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse0))))),IntV 1),add(y(Anchor(__cse0,Center)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,23,4,0,"(lambda v0:SceneT. let __cse0=head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse0))))),IntV 1),add(y(Anchor(__cse0,TL)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,23,4,0,"(lambda v0:SceneT. let __cse0=head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse0))))),IntV 1),add(y(Anchor(__cse0,TL)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,23,4,0,"(lambda v0:SceneT. let __cse0=head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse0))))),IntV 1),add(y(Anchor(__cse0,TL)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(90,22,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))) in let __cse1=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(__cse1),Center)),IntV 1))),tail(__cse1))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(90,22,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))) in let __cse1=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(__cse1),TL)),IntV 1))),tail(__cse1))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(90,22,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))) in let __cse1=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(__cse1),Center)),IntV 1))),tail(__cse1))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(90,22,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))) in let __cse1=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(__cse1),TL)),IntV 1))),tail(__cse1))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(90,22,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))) in let __cse1=sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(__cse1),Center)),IntV 1))),tail(__cse1))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(90,22,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))) in let __cse1=sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(__cse1),TL)),IntV 1))),tail(__cse1))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(90,22,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(tail(objects(v0))),Center)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(90,22,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(tail(objects(v0))),Center)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(90,22,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(tail(objects(v0))),TL)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(90,22,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(tail(objects(v0))),TL)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(90,22,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))) in let __cse1=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(__cse1),Center)),IntV 1))),tail(__cse1))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(90,22,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))) in let __cse1=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(__cse1),TL)),IntV 1))),tail(__cse1))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(90,22,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))) in let __cse1=sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(__cse1),Center)),IntV 1))),tail(__cse1))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(90,22,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))) in let __cse1=sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(__cse1),TL)),IntV 1))),tail(__cse1))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(90,22,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(tail(objects(v0))),Center)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(90,22,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(tail(objects(v0))),Center)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(90,22,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(tail(objects(v0))),TL)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(90,22,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(tail(objects(v0))),TL)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(90,22,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))) in let __cse1=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(__cse1),Center)),IntV 1))),tail(__cse1))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(90,22,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))) in let __cse1=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(__cse1),TL)),IntV 1))),tail(__cse1))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(90,22,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(tail(objects(v0))),Center)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(90,22,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(tail(objects(v0))),Center)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(90,22,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(tail(objects(v0))),TL)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(90,22,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(tail(objects(v0))),TL)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(90,22,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(tail(objects(v0)))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),Center)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(90,22,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(tail(objects(v0)))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),Center)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(90,22,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(tail(objects(v0)))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),TL)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(90,22,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(tail(objects(v0)))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),TL)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(90,22,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(tail(objects(v0)))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))),Center)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(90,22,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(tail(objects(v0)))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))),Center)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(90,22,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(tail(objects(v0)))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))),TL)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(90,22,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(tail(objects(v0)))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))),TL)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(90,22,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(tail(objects(v0)))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),Center)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(90,22,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(tail(objects(v0)))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),Center)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(90,22,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(tail(objects(v0)))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),TL)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(90,22,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(tail(objects(v0)))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),TL)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(92,24,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(tail(objects(v0)))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),y(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))),BR)))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(92,24,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(tail(objects(v0)))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),y(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))),BR)))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(92,24,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(tail(objects(v0)))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),y(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))),BR)))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(90,22,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),add(y(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))),Center)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(90,22,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),add(y(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))),TL)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(90,22,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),add(y(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),Center)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(90,22,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),add(y(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),TL)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(92,24,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),y(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))),BR)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(90,22,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))))))),IntV 1),add(y(Anchor(head(__cse0),Center)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(90,22,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))))))),IntV 1),add(y(Anchor(head(__cse0),TL)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(90,22,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))))))),IntV 1),add(y(Anchor(head(__cse0),Center)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(90,22,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))))))),IntV 1),add(y(Anchor(head(__cse0),TL)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(90,22,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),add(y(Anchor(head(__cse0),Center)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(90,22,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),add(y(Anchor(head(__cse0),TL)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(90,22,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),add(y(Anchor(head(__cse0),Center)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(90,22,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),add(y(Anchor(head(__cse0),TL)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(90,22,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),add(y(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),Center)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(90,22,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),add(y(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),TL)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(90,22,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),add(y(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),Center)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(90,22,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),add(y(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),TL)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(92,24,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),y(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))),BR)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(90,22,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))))))),IntV 1),add(y(Anchor(head(__cse0),Center)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(90,22,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))))))),IntV 1),add(y(Anchor(head(__cse0),TL)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(90,22,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))))))),IntV 1),add(y(Anchor(head(__cse0),Center)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(90,22,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))))))),IntV 1),add(y(Anchor(head(__cse0),TL)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(90,22,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),add(y(Anchor(head(__cse0),Center)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(90,22,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),add(y(Anchor(head(__cse0),TL)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(90,22,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),add(y(Anchor(head(__cse0),Center)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(90,22,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),add(y(Anchor(head(__cse0),TL)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(90,22,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),add(y(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),Center)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(90,22,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),add(y(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),TL)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(90,22,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),add(y(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))),Center)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(90,22,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),add(y(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))),TL)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(92,24,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),y(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))),BR)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(90,22,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))))))),IntV 1),add(y(Anchor(head(__cse0),Center)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(90,22,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))))))),IntV 1),add(y(Anchor(head(__cse0),TL)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(90,22,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))))))),IntV 1),add(y(Anchor(head(__cse0),Center)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(90,22,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))))))),IntV 1),add(y(Anchor(head(__cse0),TL)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(90,22,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),add(y(Anchor(head(__cse0),Center)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(90,22,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),add(y(Anchor(head(__cse0),TL)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(90,22,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),add(y(Anchor(head(__cse0),Center)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(90,22,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),add(y(Anchor(head(__cse0),TL)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))) in let __cse1=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse1)))))),IntV 1),add(y(Anchor(__cse0,Center)),IntV 1))),tail(__cse1))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))) in let __cse1=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse1)))))),IntV 1),add(y(Anchor(__cse0,TL)),IntV 1))),tail(__cse1))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))) in let __cse1=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse1)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse0))))),IntV 1),add(y(Anchor(__cse0,Center)),IntV 1))),tail(__cse1))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))) in let __cse1=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse1)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse0))))),IntV 1),add(y(Anchor(__cse0,TL)),IntV 1))),tail(__cse1))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))) in let __cse1=sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse1)))))),IntV 1),add(y(Anchor(__cse0,Center)),IntV 1))),tail(__cse1))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))) in let __cse1=sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse1)))))),IntV 1),add(y(Anchor(__cse0,TL)),IntV 1))),tail(__cse1))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))) in let __cse1=sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse1)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse0))))),IntV 1),add(y(Anchor(__cse0,Center)),IntV 1))),tail(__cse1))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))) in let __cse1=sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse1)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse0))))),IntV 1),add(y(Anchor(__cse0,TL)),IntV 1))),tail(__cse1))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(objects(v0)))))))),IntV 1),add(y(Anchor(__cse0,Center)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(objects(v0)))))))),IntV 1),add(y(Anchor(__cse0,Center)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(objects(v0)))))))),IntV 1),add(y(Anchor(__cse0,TL)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(objects(v0)))))))),IntV 1),add(y(Anchor(__cse0,TL)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(objects(v0)))),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse0))))),IntV 1),add(y(Anchor(__cse0,Center)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(objects(v0)))),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse0))))),IntV 1),add(y(Anchor(__cse0,Center)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(objects(v0)))),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse0))))),IntV 1),add(y(Anchor(__cse0,TL)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(objects(v0)))),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse0))))),IntV 1),add(y(Anchor(__cse0,TL)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))) in let __cse1=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse1)))))),IntV 1),add(y(Anchor(__cse0,Center)),IntV 1))),tail(__cse1))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))) in let __cse1=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse1)))))),IntV 1),add(y(Anchor(__cse0,TL)),IntV 1))),tail(__cse1))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))) in let __cse1=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse1)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse0))))),IntV 1),add(y(Anchor(__cse0,Center)),IntV 1))),tail(__cse1))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))) in let __cse1=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse1)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse0))))),IntV 1),add(y(Anchor(__cse0,TL)),IntV 1))),tail(__cse1))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))) in let __cse1=sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse1)))))),IntV 1),add(y(Anchor(__cse0,Center)),IntV 1))),tail(__cse1))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))) in let __cse1=sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse1)))))),IntV 1),add(y(Anchor(__cse0,TL)),IntV 1))),tail(__cse1))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))) in let __cse1=sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse1)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse0))))),IntV 1),add(y(Anchor(__cse0,Center)),IntV 1))),tail(__cse1))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))) in let __cse1=sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse1)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse0))))),IntV 1),add(y(Anchor(__cse0,TL)),IntV 1))),tail(__cse1))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(objects(v0)))))))),IntV 1),add(y(Anchor(__cse0,Center)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(objects(v0)))))))),IntV 1),add(y(Anchor(__cse0,Center)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(objects(v0)))))))),IntV 1),add(y(Anchor(__cse0,TL)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(objects(v0)))))))),IntV 1),add(y(Anchor(__cse0,TL)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(objects(v0)))),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse0))))),IntV 1),add(y(Anchor(__cse0,Center)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(objects(v0)))),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse0))))),IntV 1),add(y(Anchor(__cse0,Center)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(objects(v0)))),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse0))))),IntV 1),add(y(Anchor(__cse0,TL)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(objects(v0)))),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse0))))),IntV 1),add(y(Anchor(__cse0,TL)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))) in let __cse1=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse1)))))),IntV 1),add(y(Anchor(__cse0,Center)),IntV 1))),tail(__cse1))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))) in let __cse1=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse1)))))),IntV 1),add(y(Anchor(__cse0,TL)),IntV 1))),tail(__cse1))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))) in let __cse1=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse1)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse0))))),IntV 1),add(y(Anchor(__cse0,Center)),IntV 1))),tail(__cse1))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))) in let __cse1=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse1)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse0))))),IntV 1),add(y(Anchor(__cse0,TL)),IntV 1))),tail(__cse1))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))) in let __cse1=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse1)))))),IntV 1),add(y(Anchor(__cse0,Center)),IntV 1))),tail(__cse1))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))) in let __cse1=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse1)))))),IntV 1),add(y(Anchor(__cse0,TL)),IntV 1))),tail(__cse1))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))) in let __cse1=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse1)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse0))))),IntV 1),add(y(Anchor(__cse0,Center)),IntV 1))),tail(__cse1))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))) in let __cse1=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse1)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse0))))),IntV 1),add(y(Anchor(__cse0,TL)),IntV 1))),tail(__cse1))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(objects(v0)))))))),IntV 1),add(y(Anchor(__cse0,Center)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(objects(v0)))))))),IntV 1),add(y(Anchor(__cse0,Center)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(objects(v0)))))))),IntV 1),add(y(Anchor(__cse0,TL)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(objects(v0)))))))),IntV 1),add(y(Anchor(__cse0,TL)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(objects(v0)))),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse0))))),IntV 1),add(y(Anchor(__cse0,Center)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(objects(v0)))),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse0))))),IntV 1),add(y(Anchor(__cse0,Center)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(objects(v0)))),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse0))))),IntV 1),add(y(Anchor(__cse0,TL)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(objects(v0)))),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse0))))),IntV 1),add(y(Anchor(__cse0,TL)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=head(tail(objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))))))),IntV 1),add(y(Anchor(__cse0,Center)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=head(tail(objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))))))),IntV 1),add(y(Anchor(__cse0,Center)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=head(tail(objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))))))),IntV 1),add(y(Anchor(__cse0,TL)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=head(tail(objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))))))),IntV 1),add(y(Anchor(__cse0,TL)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=head(tail(objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))))))),IntV 1),add(y(Anchor(__cse0,Center)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=head(tail(objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))))))),IntV 1),add(y(Anchor(__cse0,Center)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=head(tail(objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))))))),IntV 1),add(y(Anchor(__cse0,TL)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=head(tail(objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))))))),IntV 1),add(y(Anchor(__cse0,TL)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=head(tail(objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))))))),IntV 1),add(y(Anchor(__cse0,Center)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=head(tail(objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))))))),IntV 1),add(y(Anchor(__cse0,Center)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=head(tail(objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))))))),IntV 1),add(y(Anchor(__cse0,TL)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=head(tail(objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))))))),IntV 1),add(y(Anchor(__cse0,TL)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=head(tail(objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse0))))),IntV 1),add(y(Anchor(__cse0,Center)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=head(tail(objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse0))))),IntV 1),add(y(Anchor(__cse0,Center)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=head(tail(objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse0))))),IntV 1),add(y(Anchor(__cse0,TL)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=head(tail(objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse0))))),IntV 1),add(y(Anchor(__cse0,TL)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=head(tail(objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse0))))),IntV 1),add(y(Anchor(__cse0,Center)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=head(tail(objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse0))))),IntV 1),add(y(Anchor(__cse0,Center)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=head(tail(objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse0))))),IntV 1),add(y(Anchor(__cse0,TL)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=head(tail(objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse0))))),IntV 1),add(y(Anchor(__cse0,TL)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=head(tail(objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse0))))),IntV 1),add(y(Anchor(__cse0,Center)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=head(tail(objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse0))))),IntV 1),add(y(Anchor(__cse0,Center)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=head(tail(objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse0))))),IntV 1),add(y(Anchor(__cse0,TL)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=head(tail(objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse0))))),IntV 1),add(y(Anchor(__cse0,TL)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(92,23,4,0,"(lambda v0:SceneT. let __cse0=head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse0))))),IntV 1),add(y(Anchor(__cse0,Center)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(92,23,4,0,"(lambda v0:SceneT. let __cse0=head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse0))))),IntV 1),add(y(Anchor(__cse0,Center)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(92,23,4,0,"(lambda v0:SceneT. let __cse0=head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse0))))),IntV 1),add(y(Anchor(__cse0,Center)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(92,23,4,0,"(lambda v0:SceneT. let __cse0=head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse0))))),IntV 1),add(y(Anchor(__cse0,TL)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(92,23,4,0,"(lambda v0:SceneT. let __cse0=head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse0))))),IntV 1),add(y(Anchor(__cse0,TL)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(92,23,4,0,"(lambda v0:SceneT. let __cse0=head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(__cse0),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(__cse0))))),IntV 1),add(y(Anchor(__cse0,TL)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(92,23,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))) in let __cse1=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(__cse1),Center)),IntV 1))),tail(__cse1))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(92,23,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))) in let __cse1=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(__cse1),TL)),IntV 1))),tail(__cse1))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(92,23,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))) in let __cse1=sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(__cse1),Center)),IntV 1))),tail(__cse1))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(92,23,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))) in let __cse1=sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(__cse1),TL)),IntV 1))),tail(__cse1))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(92,23,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(tail(objects(v0))),Center)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(92,23,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(tail(objects(v0))),Center)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(92,23,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(tail(objects(v0))),TL)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(92,23,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(tail(objects(v0))),TL)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(92,23,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))) in let __cse1=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(__cse1),Center)),IntV 1))),tail(__cse1))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(92,23,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))) in let __cse1=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(__cse1),TL)),IntV 1))),tail(__cse1))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(92,23,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))) in let __cse1=sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(__cse1),Center)),IntV 1))),tail(__cse1))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(92,23,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))) in let __cse1=sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(__cse1),TL)),IntV 1))),tail(__cse1))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(92,23,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(tail(objects(v0))),Center)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(92,23,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(tail(objects(v0))),Center)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(92,23,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(tail(objects(v0))),TL)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(92,23,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(tail(objects(v0))),TL)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(92,23,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))) in let __cse1=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(__cse1),Center)),IntV 1))),tail(__cse1))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(92,23,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))) in let __cse1=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(__cse1),TL)),IntV 1))),tail(__cse1))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(92,23,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))) in let __cse1=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(__cse1),Center)),IntV 1))),tail(__cse1))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(92,23,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))) in let __cse1=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(__cse1),TL)),IntV 1))),tail(__cse1))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(92,23,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(tail(objects(v0))),Center)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(92,23,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(tail(objects(v0))),Center)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(92,23,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(tail(objects(v0))),TL)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(92,23,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(tail(objects(v0))),TL)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(tail(objects(v0)))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))),Center)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(tail(objects(v0)))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))),Center)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(tail(objects(v0)))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))),Center)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(tail(objects(v0)))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))),TL)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(tail(objects(v0)))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))),TL)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(tail(objects(v0)))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))),TL)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(tail(objects(v0)))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))),Center)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(tail(objects(v0)))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))),Center)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(tail(objects(v0)))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))),Center)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(tail(objects(v0)))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))),TL)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(tail(objects(v0)))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))),TL)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(tail(objects(v0)))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))),TL)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(tail(objects(v0)))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))),Center)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(tail(objects(v0)))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))),Center)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(tail(objects(v0)))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))),Center)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(tail(objects(v0)))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))),TL)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(tail(objects(v0)))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))),TL)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(tail(objects(v0)))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))),TL)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(92,23,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(tail(objects(v0)))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),y(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)))),BR)))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(92,23,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(tail(objects(v0)))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),y(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)))),BR)))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(92,23,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(tail(objects(v0)))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),y(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)))),BR)))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(92,23,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(tail(objects(v0)))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),y(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)))),BR)))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(92,23,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(tail(objects(v0)))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),y(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)))),BR)))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(92,23,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(tail(objects(v0)))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),y(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)))),BR)))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(92,23,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(tail(objects(v0)))) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),Center)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(92,23,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(tail(objects(v0)))) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),Center)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(92,23,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(tail(objects(v0)))) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),TL)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(92,23,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(tail(objects(v0)))) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),TL)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(92,23,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(tail(objects(v0)))) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))),Center)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(92,23,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(tail(objects(v0)))) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))),Center)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(92,23,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(tail(objects(v0)))) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))),TL)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(92,23,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(tail(objects(v0)))) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))),TL)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(92,23,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(tail(objects(v0)))) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),Center)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(92,23,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(tail(objects(v0)))) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),Center)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(92,23,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(tail(objects(v0)))) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),TL)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(92,23,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(tail(objects(v0)))) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),TL)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(94,25,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(tail(objects(v0)))) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),y(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))),BR)))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(94,25,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(tail(objects(v0)))) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),y(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))),BR)))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(94,25,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(tail(objects(v0)))) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),y(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))),BR)))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BL))),objects(v0))))) in let __cse1=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(__cse1),Center)),IntV 1))),tail(__cse1))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BL))),objects(v0))))) in let __cse1=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(__cse1),TL)),IntV 1))),tail(__cse1))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))) in let __cse1=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(__cse1),Center)),IntV 1))),tail(__cse1))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))) in let __cse1=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(__cse1),TL)),IntV 1))),tail(__cse1))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))) in let __cse1=sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(__cse1),Center)),IntV 1))),tail(__cse1))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))) in let __cse1=sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(__cse1),TL)),IntV 1))),tail(__cse1))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(tail(objects(v0))),Center)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(tail(objects(v0))),Center)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(tail(objects(v0))),Center)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(tail(objects(v0))),TL)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(tail(objects(v0))),TL)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(tail(objects(v0))),TL)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))) in let __cse1=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(__cse1),Center)),IntV 1))),tail(__cse1))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))) in let __cse1=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(__cse1),TL)),IntV 1))),tail(__cse1))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))) in let __cse1=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(__cse1),Center)),IntV 1))),tail(__cse1))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))) in let __cse1=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(__cse1),TL)),IntV 1))),tail(__cse1))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))) in let __cse1=sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(__cse1),Center)),IntV 1))),tail(__cse1))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))) in let __cse1=sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(__cse1),TL)),IntV 1))),tail(__cse1))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(tail(objects(v0))),Center)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(tail(objects(v0))),Center)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(tail(objects(v0))),Center)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(tail(objects(v0))),TL)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(tail(objects(v0))),TL)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(tail(objects(v0))),TL)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))) in let __cse1=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(__cse1),Center)),IntV 1))),tail(__cse1))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))) in let __cse1=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(__cse1),TL)),IntV 1))),tail(__cse1))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))) in let __cse1=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(__cse1),Center)),IntV 1))),tail(__cse1))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))) in let __cse1=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(__cse1),TL)),IntV 1))),tail(__cse1))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))) in let __cse1=sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(__cse1),Center)),IntV 1))),tail(__cse1))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))) in let __cse1=sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(__cse1),TL)),IntV 1))),tail(__cse1))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(tail(objects(v0))),Center)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(tail(objects(v0))),Center)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(tail(objects(v0))),Center)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(tail(objects(v0))),TL)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(tail(objects(v0))),TL)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=objectOf(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(__cse0,coord(add(colorToInt(head(setToList(ObjectColors(__cse0)))),IntV 1),add(y(Anchor(head(tail(objects(v0))),TL)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))),Center)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))),TL)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))),Center)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))),TL)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))),Center)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))),TL)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(92,23,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),y(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)))),BR)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(92,23,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),y(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)))),BR)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))))))),IntV 1),add(y(Anchor(head(__cse0),Center)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))))))),IntV 1),add(y(Anchor(head(__cse0),TL)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))))))),IntV 1),add(y(Anchor(head(__cse0),Center)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))))))),IntV 1),add(y(Anchor(head(__cse0),TL)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))))))),IntV 1),add(y(Anchor(head(__cse0),Center)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))))))),IntV 1),add(y(Anchor(head(__cse0),TL)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),add(y(Anchor(head(__cse0),Center)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),add(y(Anchor(head(__cse0),TL)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),add(y(Anchor(head(__cse0),Center)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),add(y(Anchor(head(__cse0),TL)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),add(y(Anchor(head(__cse0),Center)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),add(y(Anchor(head(__cse0),TL)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(92,23,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),add(y(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))),Center)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(92,23,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),add(y(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))),TL)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(92,23,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),add(y(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),Center)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(92,23,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),add(y(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),TL)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(94,25,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),y(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))),BR)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(92,23,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))))))),IntV 1),add(y(Anchor(head(__cse0),Center)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(92,23,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))))))),IntV 1),add(y(Anchor(head(__cse0),TL)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(92,23,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))))))),IntV 1),add(y(Anchor(head(__cse0),Center)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(92,23,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))))))),IntV 1),add(y(Anchor(head(__cse0),TL)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(92,23,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),add(y(Anchor(head(__cse0),Center)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(92,23,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),add(y(Anchor(head(__cse0),TL)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(92,23,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),add(y(Anchor(head(__cse0),Center)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(92,23,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),add(y(Anchor(head(__cse0),TL)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))),Center)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))),TL)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))),Center)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))),TL)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))),Center)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))),TL)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(92,23,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),y(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)))),BR)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(92,23,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),y(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)))),BR)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))))))),IntV 1),add(y(Anchor(head(__cse0),Center)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))))))),IntV 1),add(y(Anchor(head(__cse0),TL)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))))))),IntV 1),add(y(Anchor(head(__cse0),Center)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))))))),IntV 1),add(y(Anchor(head(__cse0),TL)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))))))),IntV 1),add(y(Anchor(head(__cse0),Center)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))))))),IntV 1),add(y(Anchor(head(__cse0),TL)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),add(y(Anchor(head(__cse0),Center)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),add(y(Anchor(head(__cse0),TL)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),add(y(Anchor(head(__cse0),Center)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),add(y(Anchor(head(__cse0),TL)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),add(y(Anchor(head(__cse0),Center)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),add(y(Anchor(head(__cse0),TL)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(92,23,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),add(y(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),Center)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(92,23,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),add(y(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),TL)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(92,23,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),add(y(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),Center)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(92,23,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),add(y(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),TL)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(94,25,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),y(Anchor(head(tail(tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))),BR)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(92,23,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))))))),IntV 1),add(y(Anchor(head(__cse0),Center)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(92,23,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))))))),IntV 1),add(y(Anchor(head(__cse0),TL)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(92,23,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))))))),IntV 1),add(y(Anchor(head(__cse0),Center)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(92,23,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))))))),IntV 1),add(y(Anchor(head(__cse0),TL)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(92,23,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),add(y(Anchor(head(__cse0),Center)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(92,23,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),add(y(Anchor(head(__cse0),TL)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(92,23,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),add(y(Anchor(head(__cse0),Center)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(92,23,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)) in mkScene(canvasSize(v0),background(v0),scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),add(y(Anchor(head(__cse0),TL)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))),Center)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))),TL)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))),Center)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))),TL)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))),Center)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))),TL)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(92,23,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),y(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)))),BR)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(92,23,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),y(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)))),BR)))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))))))),IntV 1),add(y(Anchor(head(__cse0),Center)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))))))),IntV 1),add(y(Anchor(head(__cse0),TL)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))))))),IntV 1),add(y(Anchor(head(__cse0),Center)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))))))),IntV 1),add(y(Anchor(head(__cse0),TL)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))))))),IntV 1),add(y(Anchor(head(__cse0),Center)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(__cse0)),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))))))),IntV 1),add(y(Anchor(head(__cse0),TL)),IntV 1))),tail(__cse0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(91,22,4,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. let __r1b1=Anchor(fst(__r1b0),BR) in place(objectOf(snd(__r1b0)),coord(add(x(__r1b1),IntV 1),add(y(__r1b1),IntV 1)))),place(objectOf(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))),coord(add(colorToInt(head(setToList(ObjectColors(objectOf(head(__cse0)))))),IntV 1),add(y(Anchor(head(__cse0),Center)),IntV 1))),tail(__cse0))))")
```
