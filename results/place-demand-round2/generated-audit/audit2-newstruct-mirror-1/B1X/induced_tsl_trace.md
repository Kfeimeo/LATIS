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
Learn(ArrowT PlacedT PlacedT; observations=7; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,4)]
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
MRV immediate domains=[(0,1),(1,2)]
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
MRV immediate domains=[(0,1),(1,1)]
Learn(ArrowT PlacedT PlacedT; observations=7; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,1)]
Learn(PlacedT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,1),(1,17)]
Learn(ObjectT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","objectOf"]
Learn(CoordT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,3),(1,1)]
Learn(VecT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,6),(1,2)]
Learn(IntT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,6),(1,2)]
Learn(IntT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=12 children=[8,11]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_add node=13 children=[11,8]; conditional scalar inverse (observed operand; remaining values deduced)
Learn(IntT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,8),(1,1)]
Learn(IntT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=25 children=[24,15]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,8)]
Nonempty VS_add node=26 children=[15,24]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=31 children=[30,27]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,11)]
Learn(IntT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=45 children=[32,44]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_add node=46 children=[27,30]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,11),(1,1)]
Nonempty VS_add node=47 children=[44,32]; conditional scalar inverse (observed operand; remaining values deduced)
Nonempty VS_coord node=49 children=[48,14]; component projection of output specification
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,8),(1,0)]
Learn(IntT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,50)]
Learn(IntT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,8),(1,50)]
Learn(IntT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,50)]
MRV immediate domains=[(0,18),(1,1)]
Learn(VecT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,3),(1,0)]
Learn(IntT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,6),(1,0)]
Learn(IntT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,2)]
Learn(IntT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,5),(1,1)]
Learn(VecT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,5),(1,1)]
Learn(VecT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,10),(1,1)]
Learn(VecT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,3)]
MRV immediate domains=[(0,5),(1,1)]
Learn(VecT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,3)]
MRV immediate domains=[(0,4),(1,1)]
Learn(VecT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,3)]
Learn(IntT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,4),(1,1)]
Learn(VecT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,3),(1,3)]
Learn(IntT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_place node=57 children=[5,49]; place inverse: output local geometry and absolute origin; no translation template
Nonempty VS_lambda node=58 children=[57]; function graph -> parameter binding and output points
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_map node=60 children=[58,59]; map witness: corresponding f(x_i)=y_i; element instances=7
MRV immediate domains=[(0,1),(1,3)]
Learn(ArrowT PlacedT PlacedT; observations=7; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=7; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects place under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,3)]
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
MRV immediate domains=[(0,1),(1,1),(2,2)]
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
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=5; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,1)]
Learn(PlacedT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,1),(1,17)]
Learn(ObjectT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","objectOf"]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,3),(1,1)]
Learn(VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,6),(1,2)]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,6),(1,2)]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=65 children=[8,64]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_add node=66 children=[64,8]; conditional scalar inverse (observed operand; remaining values deduced)
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,8),(1,2)]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=71 children=[24,70]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,8)]
Nonempty VS_add node=72 children=[70,24]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=76 children=[30,75]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,11)]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=80 children=[79,44]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,11),(1,2)]
Nonempty VS_add node=81 children=[44,79]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_add node=82 children=[75,30]; conditional scalar inverse (observed operand; remaining values deduced)
Nonempty VS_coord node=84 children=[83,67]; component projection of output specification
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
MRV immediate domains=[(0,8),(1,0)]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,1),(1,0)]
MRV immediate domains=[(0,2),(1,1)]
Learn(VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,8),(1,50)]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,1),(1,50)]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,18),(1,1)]
Learn(VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,3),(1,0)]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,12),(1,1)]
Learn(VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,6),(1,0)]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,2)]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,5),(1,1)]
Learn(VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,5),(1,1)]
Learn(VecT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=5; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_place node=93 children=[61,84]; place inverse: output local geometry and absolute origin; no translation template
Nonempty VS_lambda node=94 children=[93]; function graph -> parameter binding and output points
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,8),(1,17)]
Learn(ObjectT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","objectOf"]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,3),(1,33)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,1),(1,3)]
MRV immediate domains=[(0,3),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,25),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,76),(1,33)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,18),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,18),(1,21)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,12),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,24),(1,21)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,25),(1,71)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,38),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_coord node=147 children=[146,107]; component projection of output specification
Nonempty VS_coordDelta node=148 children=[56,147]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,1),(1,5)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,12),(1,41)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,10)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,12),(1,35)]
MRV immediate domains=[(0,5),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,7),(1,51)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,5),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,8),(1,51)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,10),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,7),(1,41)]
MRV immediate domains=[(0,5),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,8),(1,41)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,76),(1,32)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,76),(1,24)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,4),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,27),(1,46)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,4),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,21),(1,46)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,4),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,18),(1,34)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,4),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,27),(1,34)]
MRV immediate domains=[(0,4),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,21),(1,34)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,25),(1,3)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,25),(1,13)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,6)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,14),(1,21)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,8)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,34),(1,41)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,8)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,34),(1,35)]
MRV immediate domains=[(0,1),(1,8)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,30),(1,35)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,33)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,36)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,40),(1,36)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,30),(1,33)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,30),(1,36)]
MRV immediate domains=[(0,1),(1,7)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,16),(1,33)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,76),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,3),(1,38)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=175 children=[174,146]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,38)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=219 children=[179,218]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,24)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=249 children=[223,248]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,24)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=279 children=[253,278]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,12)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=297 children=[283,296]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,22),(1,12)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=334 children=[333,310]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,4),(1,12)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=353 children=[339,352]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,12),(1,22)]
Nonempty VS_add node=354 children=[310,333]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,12),(1,4)]
Nonempty VS_add node=355 children=[352,339]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,19),(1,24)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=401 children=[375,400]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,24),(1,19)]
Nonempty VS_add node=402 children=[400,375]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,18),(1,2)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=425 children=[424,405]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,18),(1,12)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=458 children=[457,438]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,18)]
Nonempty VS_add node=459 children=[405,424]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,12),(1,18)]
Nonempty VS_add node=460 children=[438,457]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,14),(1,18)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=476 children=[475,424]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,4),(1,4)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=487 children=[481,486]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,4),(1,4)]
Nonempty VS_add node=488 children=[486,481]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,10),(1,13)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=514 children=[499,513]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,10)]
Nonempty VS_add node=515 children=[513,499]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,8)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=529 children=[519,528]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,18),(1,2)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=552 children=[551,532]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,18),(1,12)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=585 children=[584,565]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,19),(1,19)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=626 children=[605,625]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,20),(1,2)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=651 children=[650,629]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,9),(1,19)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=682 children=[661,681]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,19),(1,19)]
Nonempty VS_add node=683 children=[625,605]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,20)]
Nonempty VS_add node=684 children=[629,650]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,18)]
Nonempty VS_add node=685 children=[532,551]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,12),(1,18)]
Nonempty VS_add node=686 children=[565,584]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,19),(1,9)]
Nonempty VS_add node=687 children=[681,661]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,14),(1,18)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=703 children=[702,551]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,14),(1,20)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=719 children=[718,650]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,6),(1,12)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=727 children=[726,296]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,12),(1,6)]
Nonempty VS_add node=728 children=[296,726]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,7),(1,15)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_multiply node=753 children=[736,752]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,15),(1,7)]
Nonempty VS_multiply node=754 children=[752,736]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,24)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=764 children=[763,278]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,24)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=774 children=[773,248]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,24),(1,8)]
Nonempty VS_add node=775 children=[248,773]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,24),(1,8)]
Nonempty VS_add node=776 children=[278,763]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,52),(1,8)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_multiply node=829 children=[828,528]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,52)]
Nonempty VS_multiply node=830 children=[528,828]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,13)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=849 children=[834,848]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,3)]
Nonempty VS_add node=850 children=[848,834]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,10)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=862 children=[24,861]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,10),(1,8)]
Nonempty VS_add node=863 children=[861,24]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,7),(1,19)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=892 children=[871,891]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,10)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=904 children=[30,903]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,10),(1,2)]
Nonempty VS_add node=905 children=[903,30]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,19),(1,7)]
Nonempty VS_add node=906 children=[891,871]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,24),(1,3)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_multiply node=932 children=[931,153]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,24)]
Nonempty VS_multiply node=933 children=[153,931]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,11)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=943 children=[942,44]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,11),(1,8)]
Nonempty VS_add node=944 children=[44,942]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,9)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_multiply node=959 children=[948,958]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,9),(1,3)]
Nonempty VS_multiply node=960 children=[958,948]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,12),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=962 children=[296,961]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,7),(1,9)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=981 children=[970,980]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,8)]
Nonempty VS_add node=982 children=[528,528]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,9),(1,7)]
Nonempty VS_add node=983 children=[980,970]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,38),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=985 children=[218,984]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,38),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=987 children=[218,986]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,38),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=989 children=[146,988]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,38),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=991 children=[146,990]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,26),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1020 children=[1019,992]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,26),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1022 children=[1019,1021]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,4),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1029 children=[1028,1023]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,4),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1031 children=[1028,1030]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,19),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1033 children=[681,1032]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,16),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1052 children=[1051,1034]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,4),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1059 children=[1058,1053]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,19),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1061 children=[605,1060]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,16),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1063 children=[1051,1062]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,4),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1065 children=[1058,1064]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,7),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1067 children=[871,1066]; conditional scalar inverse (observed operand; remaining values deduced)
Nonempty VS_vec node=1069 children=[1068,170]; component projection of output specification
Nonempty VS_coordAdd node=1071 children=[106,1070]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,18),(1,33)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,18),(1,34)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,3),(1,1)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,18),(1,18)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,18),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,8),(1,8)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,12),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,4),(1,8)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,18),(1,51)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,28),(1,21)]
MRV immediate domains=[(0,1),(1,5)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,10),(1,29)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,10)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,10),(1,17)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,5),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,4),(1,33)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,5),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,3),(1,33)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,10),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,4),(1,28)]
MRV immediate domains=[(0,5),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,3),(1,28)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,18),(1,18)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,18),(1,18)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,4),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,21),(1,30)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,4),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,6),(1,30)]
MRV immediate domains=[(0,4),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,52),(1,22)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,4),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,21),(1,22)]
MRV immediate domains=[(0,4),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,6),(1,22)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,18),(1,46)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,18),(1,45)]
MRV immediate domains=[(0,1),(1,6)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,67),(1,15)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,8)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,29),(1,29)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,8)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,29),(1,17)]
MRV immediate domains=[(0,1),(1,8)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,37),(1,17)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,7),(1,52)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,7),(1,26)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,49),(1,26)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,40),(1,52)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,40),(1,26)]
MRV immediate domains=[(0,1),(1,7)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,16),(1,52)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,18),(1,34)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,12),(1,19)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1134 children=[1133,681]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,19),(1,12)]
Nonempty VS_add node=1135 children=[681,1133]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,19),(1,8)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1145 children=[605,1144]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,12),(1,16)]
Nonempty VS_add node=1146 children=[352,1051]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,19)]
Nonempty VS_add node=1147 children=[1144,605]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,16),(1,12)]
Nonempty VS_add node=1148 children=[1051,352]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,21),(1,13)]
Nonempty VS_multiply node=1149 children=[1112,848]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,21)]
Nonempty VS_multiply node=1150 children=[848,1112]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,12)]
Nonempty VS_add node=1151 children=[24,565]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,12),(1,11)]
Nonempty VS_add node=1152 children=[438,44]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,12),(1,8)]
Nonempty VS_add node=1153 children=[565,24]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,11),(1,12)]
Nonempty VS_add node=1154 children=[44,438]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,15),(1,7)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1163 children=[752,1162]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,7),(1,15)]
Nonempty VS_add node=1164 children=[1162,752]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,12),(1,9)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1175 children=[310,1174]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,9),(1,12)]
Nonempty VS_add node=1176 children=[1174,310]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,11),(1,18)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1189 children=[1188,551]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,4),(1,4)]
Nonempty VS_add node=1190 children=[481,1058]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,15),(1,7)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1207 children=[1206,970]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,7),(1,15)]
Nonempty VS_add node=1208 children=[970,1206]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,4),(1,4)]
Nonempty VS_add node=1209 children=[1058,481]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,7),(1,5)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1216 children=[736,1215]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,5)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1223 children=[942,1222]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,5),(1,7)]
Nonempty VS_add node=1224 children=[1215,736]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,5),(1,8)]
Nonempty VS_add node=1225 children=[1222,942]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,7)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1234 children=[629,1233]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,7),(1,2)]
Nonempty VS_add node=1235 children=[1233,629]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,14),(1,9)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1246 children=[718,1245]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,9),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1257 children=[1256,992]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,9),(1,1)]
Nonempty VS_subtract node=1258 children=[1256,1021]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,9),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1269 children=[1268,1023]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,9),(1,1)]
Nonempty VS_add node=1270 children=[980,984]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,9),(1,1)]
Nonempty VS_subtract node=1271 children=[1268,1030]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,9),(1,1)]
Nonempty VS_subtract node=1272 children=[980,986]; conditional scalar inverse (observed operand; remaining values deduced)
Nonempty VS_vec node=1274 children=[457,1273]; component projection of output specification
Nonempty VS_coordAdd node=1275 children=[1090,1274]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,12),(1,33)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,63),(1,34)]
MRV immediate domains=[(0,3),(1,1)]
MRV immediate domains=[(0,63),(1,34)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,7),(1,4)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1296 children=[1295,339]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,4),(1,7)]
Nonempty VS_add node=1297 children=[339,1295]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,4),(1,57)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1355 children=[339,1354]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,18),(1,18)]
Nonempty VS_add node=1356 children=[424,424]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,25),(1,18)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_multiply node=1383 children=[1382,424]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,15),(1,18)]
Nonempty VS_multiply node=1384 children=[752,424]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,52),(1,18)]
Nonempty VS_multiply node=1385 children=[828,424]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,25)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1421 children=[1394,1420]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,5),(1,18)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_multiply node=1428 children=[1427,424]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,18),(1,20)]
Nonempty VS_add node=1429 children=[551,650]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,20),(1,18)]
Nonempty VS_add node=1430 children=[650,551]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,22),(1,25)]
Nonempty VS_subtract node=1431 children=[333,1382]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,4),(1,52)]
Nonempty VS_subtract node=1432 children=[486,828]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,19)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1442 children=[1441,375]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,26),(1,6)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_multiply node=1450 children=[1019,1449]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,24),(1,18)]
Nonempty VS_multiply node=1451 children=[931,424]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,24),(1,6)]
Nonempty VS_multiply node=1452 children=[248,1449]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,18),(2,4)]
Learn(ArrowT (PairT IntT PlacedT) IntT; observations=7; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,9),(1,18)]
Nonempty VS_multiply node=1453 children=[958,424]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,15)]
Nonempty VS_subtract node=1454 children=[405,752]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,18),(1,6)]
Nonempty VS_subtract node=1455 children=[457,1449]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,4)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1460 children=[1459,486]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,15)]
Nonempty VS_subtract node=1461 children=[629,1206]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,4)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1471 children=[1465,1470]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,18),(1,6)]
Nonempty VS_multiply node=1472 children=[584,1449]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,12),(1,7)]
Nonempty VS_multiply node=1473 children=[310,871]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,19),(1,7)]
Nonempty VS_multiply node=1474 children=[681,871]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,7),(1,6)]
Nonempty VS_multiply node=1475 children=[1162,1449]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,6)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_multiply node=1477 children=[1476,1449]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,5)]
Nonempty VS_subtract node=1478 children=[532,1215]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,4),(1,6)]
Nonempty VS_subtract node=1479 children=[1470,726]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,19),(1,7)]
Nonempty VS_multiply node=1480 children=[375,871]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,9),(1,19)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1491 children=[1490,605]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,4)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1495 children=[1494,339]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,14),(1,2)]
Nonempty VS_subtract node=1496 children=[475,405]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,7),(1,10)]
Nonempty VS_subtract node=1497 children=[1120,903]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,4),(1,8)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1503 children=[1502,763]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,6),(1,7)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_multiply node=1511 children=[1510,871]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,18),(1,14)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1527 children=[584,1526]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,14),(1,18)]
Nonempty VS_add node=1528 children=[1526,584]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,9),(1,7)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1539 children=[1538,871]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,7),(1,10)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1548 children=[1547,861]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,7)]
Nonempty VS_multiply node=1549 children=[24,871]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,4),(1,7)]
Nonempty VS_multiply node=1550 children=[481,871]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,14),(1,2)]
Nonempty VS_subtract node=1551 children=[702,629]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,14),(1,2)]
Nonempty VS_subtract node=1552 children=[718,532]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,7),(1,2)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1564 children=[1563,1555]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,9),(1,7)]
Nonempty VS_multiply node=1565 children=[1256,871]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,4)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1567 children=[1566,486]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,4),(1,2)]
Nonempty VS_add node=1568 children=[486,1566]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,7)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_multiply node=1569 children=[8,871]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,7),(1,7)]
Nonempty VS_subtract node=1570 children=[970,1233]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,4),(1,1)]
Nonempty VS_add node=1571 children=[1470,961]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,7)]
Nonempty VS_multiply node=1572 children=[834,871]; conditional scalar inverse (observed operand; remaining values deduced)
Nonempty VS_vec node=1574 children=[1573,1273]; component projection of output specification
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,63),(1,18)]
MRV immediate domains=[(0,18),(1,1)]
MRV immediate domains=[(0,12),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,4),(1,8)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,24),(1,51)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,29),(1,21)]
MRV immediate domains=[(0,1),(1,5)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,29)]
MRV immediate domains=[(0,1),(1,10)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,17)]
MRV immediate domains=[(0,5),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,4),(1,33)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,5),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,33)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,10),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,4),(1,28)]
MRV immediate domains=[(0,5),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,28)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,63),(1,18)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,63),(1,18)]
MRV immediate domains=[(0,4),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,52),(1,30)]
MRV immediate domains=[(0,4),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,19),(1,30)]
MRV immediate domains=[(0,4),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,25),(1,22)]
MRV immediate domains=[(0,4),(1,1)]
MRV immediate domains=[(0,4),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,19),(1,22)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,24),(1,46)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,24),(1,45)]
MRV immediate domains=[(0,1),(1,6)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,66),(1,15)]
MRV immediate domains=[(0,1),(1,8)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,7),(1,29)]
MRV immediate domains=[(0,1),(1,8)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,7),(1,17)]
MRV immediate domains=[(0,1),(1,8)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,14),(1,52)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,14),(1,26)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,49),(1,52)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,7)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,6),(1,52)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_coordAdd node=1575 children=[1288,1574]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,1),(1,33)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,76),(1,28)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,3),(1,1)]
MRV immediate domains=[(0,76),(1,28)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,57),(1,13)]
Nonempty VS_subtract node=1576 children=[1354,168]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,52),(1,13)]
Nonempty VS_subtract node=1577 children=[828,848]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,7),(1,3)]
Nonempty VS_subtract node=1578 children=[1295,153]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,21),(1,38)]
Nonempty VS_subtract node=1579 children=[1112,218]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,24),(1,38)]
Nonempty VS_subtract node=1580 children=[931,146]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,11),(1,3)]
Nonempty VS_subtract node=1581 children=[1188,519]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,14)]
Nonempty VS_subtract node=1582 children=[848,475]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,14),(1,26)]
Nonempty VS_subtract node=1583 children=[1526,1019]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,7),(1,24)]
Nonempty VS_subtract node=1584 children=[1233,278]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,6),(1,13)]
Nonempty VS_subtract node=1585 children=[726,513]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,9),(1,24)]
Nonempty VS_subtract node=1586 children=[958,400]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,10),(1,12)]
Nonempty VS_subtract node=1587 children=[499,296]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,5),(1,9)]
Nonempty VS_subtract node=1588 children=[1427,661]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,11),(1,19)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1601 children=[1600,625]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,14)]
Nonempty VS_subtract node=1602 children=[168,702]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,14)]
Nonempty VS_subtract node=1603 children=[513,718]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,6),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1605 children=[1449,1604]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,6),(1,19)]
Nonempty VS_subtract node=1606 children=[1510,891]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,6),(1,11)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1614 children=[1613,1188]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,9),(1,10)]
Nonempty VS_subtract node=1615 children=[1268,903]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,9),(1,2)]
Nonempty VS_subtract node=1616 children=[1256,1555]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,9)]
Nonempty VS_subtract node=1617 children=[1566,1174]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,5),(1,1)]
Nonempty VS_add node=1618 children=[1427,1032]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,5),(1,1)]
Nonempty VS_add node=1619 children=[1222,1062]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,11),(1,1)]
Nonempty VS_add node=1620 children=[1600,1060]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,5),(1,1)]
Nonempty VS_subtract node=1621 children=[1222,1034]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,6),(1,1)]
Nonempty VS_add node=1622 children=[1510,1066]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,6),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1624 children=[1613,1623]; conditional scalar inverse (observed operand; remaining values deduced)
Nonempty VS_vec node=1626 children=[1068,1625]; component projection of output specification
MRV immediate domains=[(0,1),(1,1)]
MRV immediate domains=[(0,18),(1,1)]
MRV immediate domains=[(0,12),(1,1)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,25),(1,42)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,38),(1,71)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,5)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,12),(1,52)]
MRV immediate domains=[(0,1),(1,10)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,12),(1,21)]
MRV immediate domains=[(0,5),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,7),(1,14)]
MRV immediate domains=[(0,5),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,8),(1,14)]
MRV immediate domains=[(0,10),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,7),(1,31)]
MRV immediate domains=[(0,5),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,8),(1,31)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,76),(1,11)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,76),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,4),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,27),(1,30)]
MRV immediate domains=[(0,4),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,21),(1,30)]
MRV immediate domains=[(0,4),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,18),(1,49)]
MRV immediate domains=[(0,4),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,27),(1,49)]
MRV immediate domains=[(0,4),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,21),(1,49)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,25),(1,31)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,25),(1,28)]
MRV immediate domains=[(0,1),(1,6)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,14),(1,36)]
MRV immediate domains=[(0,1),(1,8)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,34),(1,52)]
MRV immediate domains=[(0,1),(1,8)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,34),(1,21)]
MRV immediate domains=[(0,1),(1,8)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,30),(1,21)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,33)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,33)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,40),(1,33)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,30),(1,33)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,30),(1,33)]
MRV immediate domains=[(0,1),(1,7)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,16),(1,33)]
Nonempty VS_coordAdd node=1628 children=[55,1626]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,1),(1,33)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,43),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,3),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=1629 children=[106,147]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,43),(1,33)]
MRV immediate domains=[(0,18),(1,1)]
MRV immediate domains=[(0,12),(1,1)]
MRV immediate domains=[(0,1),(1,1)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,20),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,5)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,12),(1,41)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,10)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,12),(1,35)]
MRV immediate domains=[(0,5),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,10),(1,51)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,5),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,15),(1,51)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,10),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,10),(1,41)]
MRV immediate domains=[(0,5),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,15),(1,41)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,43),(1,32)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,43),(1,24)]
MRV immediate domains=[(0,4),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,35),(1,46)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,4),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,14),(1,46)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,4),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,19),(1,34)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,4),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,35),(1,34)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,4),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,14),(1,34)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,38),(1,3)]
Nonempty VS_coord node=1630 children=[146,153]; component projection of output specification
Nonempty VS_coordDelta node=1631 children=[149,1630]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,38),(1,13)]
Nonempty VS_coord node=1632 children=[146,168]; component projection of output specification
Nonempty VS_coordDelta node=1633 children=[154,1632]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,1),(1,6)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,19),(1,21)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,8)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,55),(1,41)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,8)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,55),(1,35)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,8)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,7),(1,35)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,40),(1,33)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,40),(1,36)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,5),(1,36)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,9),(1,33)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,9),(1,36)]
MRV immediate domains=[(0,1),(1,7)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,33)]
MRV immediate domains=[(0,43),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,7),(2,4)]
Learn(ArrowT (PairT IntT PlacedT) IntT; observations=7; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,7),(1,38)]
Nonempty VS_subtract node=1634 children=[1295,218]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,52),(1,38)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1687 children=[1686,146]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,7),(1,38)]
Nonempty VS_multiply node=1688 children=[1295,146]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,38),(1,7)]
Nonempty VS_multiply node=1689 children=[146,1295]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,57),(1,12)]
Nonempty VS_subtract node=1690 children=[1354,296]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,18),(2,4)]
Learn(ArrowT (PairT IntT PlacedT) IntT; observations=7; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,6),(1,13)]
Nonempty VS_subtract node=1691 children=[1449,513]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,18),(2,4)]
Learn(ArrowT (PairT IntT PlacedT) IntT; observations=7; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,1),(1,9),(2,4)]
Learn(ArrowT (PairT IntT PlacedT) IntT; observations=7; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,14),(1,24)]
Nonempty VS_subtract node=1692 children=[1526,400]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,5),(1,10)]
Nonempty VS_subtract node=1693 children=[1222,903]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,5),(1,2)]
Nonempty VS_subtract node=1694 children=[1427,1555]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,9),(1,19)]
Nonempty VS_subtract node=1695 children=[958,891]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,2),(2,4)]
Learn(ArrowT (PairT IntT PlacedT) IntT; observations=7; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,1),(1,2),(2,4)]
Learn(ArrowT (PairT IntT PlacedT) IntT; observations=7; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,7),(1,19)]
Nonempty VS_subtract node=1696 children=[1233,625]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,14)]
Nonempty VS_subtract node=1697 children=[1476,475]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,9),(1,11)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1708 children=[1707,1188]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,26)]
Nonempty VS_subtract node=1709 children=[1566,1019]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,14)]
Nonempty VS_subtract node=1710 children=[948,702]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,14)]
Nonempty VS_subtract node=1711 children=[1604,718]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,8)]
Nonempty VS_multiply node=1712 children=[1566,763]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,2)]
Nonempty VS_multiply node=1713 children=[763,1566]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,9),(1,1)]
Nonempty VS_add node=1714 children=[958,1066]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,9),(1,1)]
Nonempty VS_add node=1715 children=[1707,1623]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,7),(1,1)]
Nonempty VS_add node=1716 children=[1233,1060]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_add node=1717 children=[8,107]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_subtract node=1718 children=[8,170]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1720 children=[405,1719]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1722 children=[405,1721]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1724 children=[629,1723]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1726 children=[532,1725]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1728 children=[629,1727]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1730 children=[532,1729]; conditional scalar inverse (observed operand; remaining values deduced)
Nonempty VS_vec node=1732 children=[1731,170]; component projection of output specification
Nonempty VS_coordAdd node=1734 children=[56,1733]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,5),(1,33)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,23),(1,6)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,3),(1,1)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,23),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,18),(1,1)]
MRV immediate domains=[(0,12),(1,1)]
MRV immediate domains=[(0,1),(1,1)]
MRV immediate domains=[(0,1),(1,1)]
MRV immediate domains=[(0,1),(1,5)]
MRV immediate domains=[(0,1),(1,10)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,76),(1,63)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,5),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,3),(1,69)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,5),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,69)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,10),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,3),(1,49)]
MRV immediate domains=[(0,5),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,49)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,23),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,23),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,4),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,39),(1,42)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,4),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,48),(1,42)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,4),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,48),(1,20)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,4),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,39),(1,20)]
MRV immediate domains=[(0,4),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,48),(1,20)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,7),(1,14)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,7),(1,14)]
MRV immediate domains=[(0,1),(1,6)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,14),(1,38)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,23),(1,6)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,18),(1,4)]
Nonempty VS_add node=1744 children=[551,486]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,18),(1,4)]
Nonempty VS_add node=1745 children=[424,339]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,4),(1,18)]
Nonempty VS_add node=1746 children=[339,424]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,4),(1,18)]
Nonempty VS_add node=1747 children=[486,551]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,18)]
Nonempty VS_subtract node=1748 children=[1494,424]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,14),(1,12)]
Nonempty VS_subtract node=1749 children=[475,352]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,14),(1,12)]
Nonempty VS_subtract node=1750 children=[718,1133]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,20)]
Nonempty VS_subtract node=1751 children=[1459,650]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,9),(1,19)]
Nonempty VS_add node=1752 children=[1245,681]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,9),(1,19)]
Nonempty VS_add node=1753 children=[1538,605]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,19),(1,9)]
Nonempty VS_add node=1754 children=[605,1538]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,19),(1,9)]
Nonempty VS_add node=1755 children=[681,1245]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,22)]
Nonempty VS_add node=1756 children=[30,333]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,22),(1,2)]
Nonempty VS_add node=1757 children=[333,30]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,18),(1,8)]
Nonempty VS_add node=1758 children=[457,24]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,18)]
Nonempty VS_add node=1759 children=[24,457]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,2)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1763 children=[1465,1762]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,14),(1,4)]
Nonempty VS_subtract node=1764 children=[702,481]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,18),(1,11)]
Nonempty VS_add node=1765 children=[584,44]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,7),(1,9)]
Nonempty VS_add node=1766 children=[871,1490]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,9),(1,7)]
Nonempty VS_add node=1767 children=[1490,871]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,11),(1,18)]
Nonempty VS_add node=1768 children=[44,584]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,3)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1770 children=[1769,948]; conditional scalar inverse (observed operand; remaining values deduced)
Nonempty VS_vec node=1772 children=[1771,1510]; component projection of output specification
MRV immediate domains=[(0,1),(1,8)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,10),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,8)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,10),(1,63)]
MRV immediate domains=[(0,1),(1,8)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,26),(1,63)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,28),(1,45)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,28),(1,57)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,12),(1,57)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,6),(1,45)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,6),(1,57)]
MRV immediate domains=[(0,1),(1,7)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,45)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_coordAdd node=1773 children=[1740,1772]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,5),(1,33)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,45),(1,6)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,3),(1,1)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,45),(1,1)]
MRV immediate domains=[(0,18),(1,1)]
MRV immediate domains=[(0,12),(1,1)]
MRV immediate domains=[(0,1),(1,1)]
MRV immediate domains=[(0,1),(1,1)]
MRV immediate domains=[(0,1),(1,5)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,66),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,10)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,66),(1,63)]
MRV immediate domains=[(0,5),(1,1)]
MRV immediate domains=[(0,5),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,69)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,10),(1,1)]
MRV immediate domains=[(0,5),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,49)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,45),(1,1)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,45),(1,1)]
MRV immediate domains=[(0,4),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,49),(1,42)]
MRV immediate domains=[(0,4),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,55),(1,42)]
MRV immediate domains=[(0,4),(1,1)]
MRV immediate domains=[(0,4),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,49),(1,20)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,4),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,55),(1,20)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,8),(1,14)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,8),(1,14)]
MRV immediate domains=[(0,1),(1,6)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,14),(1,38)]
MRV immediate domains=[(0,45),(1,6)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,25),(1,18)]
Nonempty VS_multiply node=1780 children=[1420,424]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,18),(1,18)]
Nonempty VS_multiply node=1781 children=[551,424]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,5),(1,18)]
Nonempty VS_multiply node=1782 children=[1215,424]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,19),(1,18)]
Nonempty VS_multiply node=1783 children=[605,424]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,6)]
Nonempty VS_multiply node=1784 children=[1441,1449]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,11),(1,18)]
Nonempty VS_multiply node=1785 children=[1600,424]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,18),(1,4)]
Nonempty VS_add node=1786 children=[551,339]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,4),(1,18)]
Nonempty VS_add node=1787 children=[339,551]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,14),(1,12)]
Nonempty VS_subtract node=1788 children=[475,1133]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,10),(1,18)]
Nonempty VS_multiply node=1789 children=[499,424]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,4),(1,5)]
Nonempty VS_subtract node=1790 children=[1502,1222]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,6),(1,18)]
Nonempty VS_multiply node=1791 children=[726,424]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,9),(1,18)]
Nonempty VS_multiply node=1792 children=[1707,424]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,19),(1,6)]
Nonempty VS_multiply node=1793 children=[891,1449]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,12),(1,7)]
Nonempty VS_multiply node=1794 children=[1133,871]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,20)]
Nonempty VS_subtract node=1795 children=[1494,650]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,14),(1,12)]
Nonempty VS_subtract node=1796 children=[702,352]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,14),(1,8)]
Nonempty VS_subtract node=1797 children=[718,1144]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,12),(1,2)]
Nonempty VS_multiply node=1798 children=[310,30]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,6)]
Nonempty VS_multiply node=1799 children=[1555,1449]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,12),(1,7)]
Nonempty VS_multiply node=1800 children=[565,871]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,19),(1,2)]
Nonempty VS_multiply node=1801 children=[681,30]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,9),(1,18)]
Nonempty VS_multiply node=1802 children=[1268,424]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,19),(1,2)]
Nonempty VS_multiply node=1803 children=[375,30]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,9),(1,19)]
Nonempty VS_add node=1804 children=[1245,605]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,19),(1,9)]
Nonempty VS_add node=1805 children=[605,1245]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,4),(1,7)]
Nonempty VS_multiply node=1806 children=[1058,871]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,6),(1,2)]
Nonempty VS_multiply node=1807 children=[1510,30]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,18),(1,8)]
Nonempty VS_add node=1808 children=[584,24]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,9),(1,7)]
Nonempty VS_add node=1809 children=[1538,871]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,7),(1,9)]
Nonempty VS_add node=1810 children=[871,1538]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,18)]
Nonempty VS_add node=1811 children=[30,457]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,18),(1,2)]
Nonempty VS_add node=1812 children=[457,30]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,18)]
Nonempty VS_add node=1813 children=[24,584]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,2)]
Nonempty VS_subtract node=1814 children=[1459,1762]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,2)]
Nonempty VS_multiply node=1815 children=[24,30]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,4),(1,2)]
Nonempty VS_multiply node=1816 children=[481,30]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,3)]
Nonempty VS_subtract node=1817 children=[1465,948]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_subtract node=1818 children=[1769,1476]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,7)]
Nonempty VS_multiply node=1819 children=[1762,871]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,9),(1,7)]
Nonempty VS_multiply node=1820 children=[1174,871]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,7)]
Nonempty VS_multiply node=1821 children=[773,871]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,9),(1,2)]
Nonempty VS_multiply node=1822 children=[1256,30]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_multiply node=1823 children=[8,30]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,2)]
Nonempty VS_multiply node=1824 children=[834,30]; conditional scalar inverse (observed operand; remaining values deduced)
Nonempty VS_vec node=1826 children=[1825,1510]; component projection of output specification
MRV immediate domains=[(0,1),(1,8)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,14),(1,1)]
MRV immediate domains=[(0,1),(1,8)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,14),(1,63)]
MRV immediate domains=[(0,1),(1,8)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,10),(1,63)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,35),(1,45)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,35),(1,57)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,10),(1,57)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,26),(1,45)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,26),(1,57)]
MRV immediate domains=[(0,1),(1,7)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,15),(1,45)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_coordAdd node=1827 children=[1779,1826]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,10),(1,33)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,23),(1,50)]
MRV immediate domains=[(0,3),(1,1)]
MRV immediate domains=[(0,23),(1,50)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,38),(1,18)]
Nonempty VS_subtract node=1839 children=[218,424]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,25),(1,5)]
Nonempty VS_add node=1840 children=[1420,1427]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,5),(1,25)]
Nonempty VS_add node=1841 children=[1427,1420]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,38),(1,20)]
Nonempty VS_subtract node=1842 children=[146,650]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,25),(1,11)]
Nonempty VS_add node=1843 children=[1382,1600]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,11),(1,25)]
Nonempty VS_add node=1844 children=[1600,1382]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,26),(1,18)]
Nonempty VS_subtract node=1845 children=[1019,551]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,57),(1,2)]
Nonempty VS_add node=1846 children=[1354,8]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,57)]
Nonempty VS_add node=1847 children=[8,1354]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,7)]
Nonempty VS_subtract node=1848 children=[8,1295]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,14)]
Nonempty VS_subtract node=1849 children=[179,475]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,14)]
Nonempty VS_subtract node=1850 children=[174,718]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,19),(1,5)]
Nonempty VS_add node=1851 children=[375,1222]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,5),(1,19)]
Nonempty VS_add node=1852 children=[1222,375]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,6),(1,6)]
Nonempty VS_add node=1853 children=[1449,1510]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,6),(1,6)]
Nonempty VS_add node=1854 children=[1510,1449]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,24),(1,8)]
Nonempty VS_subtract node=1855 children=[278,24]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,52),(1,9)]
Nonempty VS_add node=1856 children=[828,1707]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,9),(1,52)]
Nonempty VS_add node=1857 children=[1707,828]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,19),(1,4)]
Nonempty VS_subtract node=1858 children=[625,1058]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,19)]
Nonempty VS_subtract node=1859 children=[942,375]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,11),(1,26)]
Nonempty VS_subtract node=1860 children=[1188,1019]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,24),(1,10)]
Nonempty VS_add node=1861 children=[931,499]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,10),(1,24)]
Nonempty VS_add node=1862 children=[499,931]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,9),(1,16)]
Nonempty VS_subtract node=1863 children=[661,1051]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,7),(1,4)]
Nonempty VS_subtract node=1864 children=[1547,1502]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,19),(1,4)]
Nonempty VS_subtract node=1865 children=[891,1028]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,24),(1,2)]
Nonempty VS_subtract node=1866 children=[248,30]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,24),(1,11)]
Nonempty VS_subtract node=1867 children=[400,44]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,12),(1,2)]
Nonempty VS_subtract node=1868 children=[296,1762]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,6),(1,9)]
Nonempty VS_add node=1869 children=[726,958]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,9),(1,6)]
Nonempty VS_add node=1870 children=[958,726]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,6),(1,14)]
Nonempty VS_subtract node=1871 children=[1613,1526]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,10),(1,8)]
Nonempty VS_subtract node=1872 children=[903,773]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,21),(1,3)]
Nonempty VS_add node=1873 children=[1112,834]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,21)]
Nonempty VS_add node=1874 children=[834,1112]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,10),(1,8)]
Nonempty VS_subtract node=1875 children=[861,763]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,7),(1,9)]
Nonempty VS_add node=1876 children=[871,1268]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,9),(1,7)]
Nonempty VS_add node=1877 children=[1268,871]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,8)]
Nonempty VS_subtract node=1878 children=[1555,528]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,9),(1,1)]
Nonempty VS_subtract node=1879 children=[958,961]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,9),(1,2)]
Nonempty VS_subtract node=1880 children=[1707,1566]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_add node=1881 children=[405,986]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_subtract node=1882 children=[405,984]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_add node=1883 children=[629,990]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_add node=1884 children=[532,1021]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,7),(1,1)]
Nonempty VS_add node=1885 children=[1233,988]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_subtract node=1886 children=[629,988]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_subtract node=1887 children=[532,992]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,7),(1,1)]
Nonempty VS_subtract node=1888 children=[1233,990]; conditional scalar inverse (observed operand; remaining values deduced)
Nonempty VS_vec node=1890 children=[1771,1889]; component projection of output specification
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,23),(1,30)]
MRV immediate domains=[(0,18),(1,1)]
MRV immediate domains=[(0,12),(1,1)]
MRV immediate domains=[(0,1),(1,1)]
MRV immediate domains=[(0,1),(1,1)]
MRV immediate domains=[(0,1),(1,5)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,76),(1,55)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,10)]
MRV immediate domains=[(0,5),(1,1)]
MRV immediate domains=[(0,5),(1,1)]
MRV immediate domains=[(0,10),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,3),(1,18)]
MRV immediate domains=[(0,5),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,18)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,23),(1,34)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,23),(1,26)]
MRV immediate domains=[(0,4),(1,1)]
MRV immediate domains=[(0,4),(1,1)]
MRV immediate domains=[(0,4),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,48),(1,8)]
MRV immediate domains=[(0,4),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,39),(1,8)]
MRV immediate domains=[(0,4),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,48),(1,8)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,7),(1,39)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,7),(1,30)]
MRV immediate domains=[(0,1),(1,6)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,14),(1,23)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,8)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,10),(1,55)]
MRV immediate domains=[(0,1),(1,8)]
MRV immediate domains=[(0,1),(1,8)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,26),(1,1)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,28),(1,31)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,12),(1,45)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,6),(1,31)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,7)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,31)]
Nonempty VS_coordAdd node=1891 children=[1838,1890]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,5),(1,33)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,45),(1,50)]
MRV immediate domains=[(0,3),(1,1)]
MRV immediate domains=[(0,45),(1,50)]
Nonempty VS_vec node=1898 children=[1825,1889]; component projection of output specification
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,45),(1,30)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,18),(1,1)]
MRV immediate domains=[(0,12),(1,1)]
MRV immediate domains=[(0,1),(1,1)]
MRV immediate domains=[(0,1),(1,1)]
MRV immediate domains=[(0,1),(1,5)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,66),(1,55)]
MRV immediate domains=[(0,1),(1,10)]
MRV immediate domains=[(0,5),(1,1)]
MRV immediate domains=[(0,5),(1,1)]
MRV immediate domains=[(0,10),(1,1)]
MRV immediate domains=[(0,5),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,18)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,45),(1,34)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,45),(1,26)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,4),(1,1)]
MRV immediate domains=[(0,4),(1,1)]
MRV immediate domains=[(0,4),(1,1)]
MRV immediate domains=[(0,4),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,49),(1,8)]
MRV immediate domains=[(0,4),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,55),(1,8)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,8),(1,39)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,8),(1,30)]
MRV immediate domains=[(0,1),(1,6)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,14),(1,23)]
MRV immediate domains=[(0,1),(1,8)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,14),(1,55)]
MRV immediate domains=[(0,1),(1,8)]
MRV immediate domains=[(0,1),(1,8)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,10),(1,1)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,35),(1,31)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,10),(1,45)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,26),(1,31)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,7)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,15),(1,31)]
Nonempty VS_coordAdd node=1899 children=[1897,1898]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,4),(1,33)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,4),(1,2)]
Nonempty VS_coord node=1905 children=[481,8]; component projection of output specification
Nonempty VS_coordDelta node=1906 children=[1905,106]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,3),(1,1)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,4),(1,34)]
MRV immediate domains=[(0,18),(1,1)]
MRV immediate domains=[(0,12),(1,1)]
MRV immediate domains=[(0,1),(1,1)]
MRV immediate domains=[(0,1),(1,1)]
MRV immediate domains=[(0,1),(1,5)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,4),(1,60)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,10)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,4),(1,11)]
MRV immediate domains=[(0,5),(1,1)]
MRV immediate domains=[(0,5),(1,1)]
MRV immediate domains=[(0,10),(1,1)]
MRV immediate domains=[(0,5),(1,1)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,4),(1,40)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,4),(1,30)]
MRV immediate domains=[(0,4),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,10),(1,2)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,4),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,4),(1,2)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,4),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,5),(1,11)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,4),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,10),(1,11)]
MRV immediate domains=[(0,4),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,4),(1,11)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,27),(1,31)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,27),(1,26)]
MRV immediate domains=[(0,1),(1,6)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,8),(1,25)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,8)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,15),(1,60)]
MRV immediate domains=[(0,1),(1,8)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,15),(1,11)]
MRV immediate domains=[(0,1),(1,8)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,23),(1,11)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,10),(1,38)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,10),(1,45)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,16),(1,45)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,18),(1,38)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,18),(1,45)]
MRV immediate domains=[(0,1),(1,7)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,38)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,4),(1,2)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_vec node=1908 children=[481,8]; component projection of output specification
Nonempty VS_coordAdd node=1910 children=[1904,1909]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,4),(1,33)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,22),(1,2)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,3),(1,1)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,22),(1,34)]
MRV immediate domains=[(0,18),(1,1)]
MRV immediate domains=[(0,12),(1,1)]
MRV immediate domains=[(0,1),(1,1)]
MRV immediate domains=[(0,1),(1,1)]
MRV immediate domains=[(0,1),(1,5)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,60)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,10)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,11)]
MRV immediate domains=[(0,5),(1,1)]
MRV immediate domains=[(0,5),(1,1)]
MRV immediate domains=[(0,10),(1,1)]
MRV immediate domains=[(0,5),(1,1)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,22),(1,40)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,22),(1,30)]
MRV immediate domains=[(0,4),(1,1)]
MRV immediate domains=[(0,4),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,8),(1,2)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,4),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,12),(1,11)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,4),(1,1)]
MRV immediate domains=[(0,4),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,8),(1,11)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,21),(1,31)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,21),(1,26)]
MRV immediate domains=[(0,1),(1,6)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,6),(1,25)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,8)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,15),(1,60)]
MRV immediate domains=[(0,1),(1,8)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,15),(1,11)]
MRV immediate domains=[(0,1),(1,8)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,14),(1,11)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,10),(1,38)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,10),(1,45)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,8),(1,45)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,15),(1,38)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,15),(1,45)]
MRV immediate domains=[(0,1),(1,7)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,29),(1,38)]
MRV immediate domains=[(0,22),(1,2)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,12),(1,25)]
Nonempty VS_subtract node=1916 children=[352,1420]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,12),(1,19)]
Nonempty VS_subtract node=1917 children=[1133,375]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,12),(1,52)]
Nonempty VS_subtract node=1918 children=[310,828]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,5),(1,5)]
Nonempty VS_subtract node=1919 children=[1215,1222]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,4),(1,25)]
Nonempty VS_subtract node=1920 children=[481,1382]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,12),(1,6)]
Nonempty VS_subtract node=1921 children=[438,726]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,6),(1,18)]
Nonempty VS_subtract node=1922 children=[1613,551]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,38),(1,18)]
Nonempty VS_subtract node=1923 children=[146,584]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,12),(1,18)]
Nonempty VS_subtract node=1924 children=[296,457]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,9)]
Nonempty VS_subtract node=1925 children=[513,1245]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,8)]
Nonempty VS_subtract node=1926 children=[1144,763]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,7),(1,24)]
Nonempty VS_multiply node=1927 children=[1233,931]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,24),(1,7)]
Nonempty VS_multiply node=1928 children=[931,1233]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,10),(1,7)]
Nonempty VS_subtract node=1929 children=[861,1162]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,12),(1,1)]
Nonempty VS_add node=1930 children=[438,961]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,10),(1,7)]
Nonempty VS_subtract node=1931 children=[903,970]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,12)]
Nonempty VS_add node=1932 children=[1566,310]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,12),(1,2)]
Nonempty VS_add node=1933 children=[310,1566]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,7)]
Nonempty VS_subtract node=1934 children=[942,736]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,9),(1,2)]
Nonempty VS_subtract node=1935 children=[980,30]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,12),(1,1)]
Nonempty VS_add node=1936 children=[565,990]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,12),(1,1)]
Nonempty VS_subtract node=1937 children=[565,988]; conditional scalar inverse (observed operand; remaining values deduced)
Nonempty VS_vec node=1939 children=[1938,8]; component projection of output specification
Nonempty VS_coordAdd node=1940 children=[1915,1939]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,4),(1,33)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,20),(1,55)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,3),(1,1)]
MRV immediate domains=[(0,20),(1,55)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,7),(1,12)]
Nonempty VS_add node=1946 children=[1295,310]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,12),(1,7)]
Nonempty VS_add node=1947 children=[310,1295]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,12),(1,57)]
Nonempty VS_subtract node=1948 children=[310,1354]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,12),(1,25)]
Nonempty VS_subtract node=1949 children=[1133,1420]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,12),(1,25)]
Nonempty VS_subtract node=1950 children=[352,1382]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,12),(1,52)]
Nonempty VS_subtract node=1951 children=[438,828]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,19)]
Nonempty VS_subtract node=1952 children=[1144,375]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,4),(1,6)]
Nonempty VS_subtract node=1953 children=[481,1449]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,12),(1,6)]
Nonempty VS_subtract node=1954 children=[565,726]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,10)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1966 children=[30,1965]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,10),(1,2)]
Nonempty VS_add node=1967 children=[1965,30]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,12),(1,18)]
Nonempty VS_subtract node=1968 children=[296,584]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,21),(1,9)]
Nonempty VS_multiply node=1969 children=[1112,1707]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,9),(1,21)]
Nonempty VS_multiply node=1970 children=[1707,1112]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,10),(1,7)]
Nonempty VS_subtract node=1971 children=[903,1162]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,12)]
Nonempty VS_add node=1972 children=[1566,438]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,12),(1,2)]
Nonempty VS_add node=1973 children=[438,1566]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,10),(1,7)]
Nonempty VS_subtract node=1974 children=[861,736]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,12),(1,1)]
Nonempty VS_add node=1975 children=[565,961]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,7)]
Nonempty VS_subtract node=1976 children=[1555,970]; conditional scalar inverse (observed operand; remaining values deduced)
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,13),(1,18)]
Nonempty VS_subtract node=1978 children=[168,424]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,20)]
Nonempty VS_subtract node=1979 children=[848,650]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,24),(1,19)]
Nonempty VS_subtract node=1980 children=[278,681]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,19),(1,5)]
Nonempty VS_add node=1981 children=[605,1427]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,19),(1,5)]
Nonempty VS_add node=1982 children=[681,1222]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,5),(1,19)]
Nonempty VS_add node=1983 children=[1222,681]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,5),(1,19)]
Nonempty VS_add node=1984 children=[1427,605]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,24),(1,19)]
Nonempty VS_subtract node=1985 children=[248,605]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,24),(1,16)]
Nonempty VS_subtract node=1986 children=[400,1051]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,57),(1,3)]
Nonempty VS_add node=1987 children=[1354,834]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,25),(1,9)]
Nonempty VS_add node=1988 children=[1382,1707]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,25),(1,9)]
Nonempty VS_add node=1989 children=[1420,958]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,9),(1,25)]
Nonempty VS_add node=1990 children=[958,1420]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,9),(1,25)]
Nonempty VS_add node=1991 children=[1707,1382]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,57)]
Nonempty VS_add node=1992 children=[834,1354]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,7)]
Nonempty VS_subtract node=1993 children=[834,1295]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,38),(1,8)]
Nonempty VS_subtract node=1994 children=[218,24]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,52),(1,10)]
Nonempty VS_add node=1995 children=[828,499]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,10),(1,52)]
Nonempty VS_add node=1996 children=[499,828]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,21),(1,16)]
Nonempty VS_multiply node=1997 children=[1112,1051]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,16),(1,21)]
Nonempty VS_multiply node=1998 children=[1051,1112]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,38),(1,11)]
Nonempty VS_subtract node=1999 children=[146,44]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,6),(1,2)]
Nonempty VS_add node=2000 children=[1449,8]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,7),(1,19)]
Nonempty VS_add node=2001 children=[1233,375]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,19),(1,7)]
Nonempty VS_add node=2002 children=[375,1233]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,6)]
Nonempty VS_add node=2003 children=[8,1449]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,26),(1,2)]
Nonempty VS_subtract node=2004 children=[1019,30]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,13),(1,2)]
Nonempty VS_subtract node=2005 children=[513,1762]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,11),(1,24)]
Nonempty VS_subtract node=2006 children=[1188,248]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,12),(1,9)]
Nonempty VS_subtract node=2007 children=[296,1174]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,7),(1,11)]
Nonempty VS_add node=2008 children=[871,1600]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,24),(1,6)]
Nonempty VS_add node=2009 children=[931,726]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,6),(1,24)]
Nonempty VS_add node=2010 children=[726,931]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,11),(1,7)]
Nonempty VS_add node=2011 children=[1600,871]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,19),(1,8)]
Nonempty VS_subtract node=2012 children=[625,773]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,19),(1,8)]
Nonempty VS_subtract node=2013 children=[891,528]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,11),(1,7)]
Nonempty VS_multiply node=2014 children=[44,1233]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,7),(1,11)]
Nonempty VS_multiply node=2015 children=[1233,44]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,9),(1,8)]
Nonempty VS_subtract node=2016 children=[661,763]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,7)]
Nonempty VS_subtract node=2017 children=[528,871]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,3)]
Nonempty VS_subtract node=2018 children=[629,834]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,24),(1,1)]
Nonempty VS_subtract node=2019 children=[931,961]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,10),(1,2)]
Nonempty VS_subtract node=2020 children=[499,1566]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,21),(1,1)]
Nonempty VS_add node=2021 children=[1112,988]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,21),(1,1)]
Nonempty VS_subtract node=2022 children=[1112,990]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,14),(1,1)]
Nonempty VS_add node=2023 children=[1526,984]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,10),(1,1)]
Nonempty VS_add node=2024 children=[861,986]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,10),(1,1)]
Nonempty VS_add node=2025 children=[903,1021]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,14),(1,1)]
Nonempty VS_subtract node=2026 children=[1526,986]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,10),(1,1)]
Nonempty VS_subtract node=2027 children=[861,984]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,10),(1,1)]
Nonempty VS_subtract node=2028 children=[903,992]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,1)]
Nonempty VS_add node=2029 children=[942,990]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_add node=2030 children=[1555,1030]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,8),(1,1)]
Nonempty VS_subtract node=2031 children=[942,988]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_subtract node=2032 children=[1555,1023]; conditional scalar inverse (observed operand; remaining values deduced)
Nonempty VS_vec node=2034 children=[1977,2033]; component projection of output specification
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,20),(1,30)]
MRV immediate domains=[(0,18),(1,1)]
MRV immediate domains=[(0,12),(1,1)]
MRV immediate domains=[(0,1),(1,1)]
MRV immediate domains=[(0,1),(1,1)]
MRV immediate domains=[(0,1),(1,5)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,4),(1,68)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,10)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,4),(1,60)]
MRV immediate domains=[(0,5),(1,1)]
MRV immediate domains=[(0,5),(1,1)]
MRV immediate domains=[(0,10),(1,1)]
MRV immediate domains=[(0,5),(1,1)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,20),(1,30)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,20),(1,26)]
MRV immediate domains=[(0,4),(1,1)]
MRV immediate domains=[(0,4),(1,1)]
MRV immediate domains=[(0,4),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,12),(1,19)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,4),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,5),(1,19)]
MRV immediate domains=[(0,4),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,12),(1,19)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,18),(1,62)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,18),(1,51)]
MRV immediate domains=[(0,1),(1,6)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,8),(1,36)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,8)]
```
