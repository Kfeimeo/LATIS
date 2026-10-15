# LATIS v0.3R.2
StructuralPriorCount=0. Counterfactual labels never guide synthesis.
```text
Root specification Q0: ArrowT SceneT SceneT; observations=2; Gamma=[]. Original Grid targets reserved for exact verification.
Learn(ArrowT SceneT SceneT; observations=2; Gamma=[]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,3)]
Learn(SceneT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","mkScene"]
MRV immediate domains=[(0,2),(1,3),(2,14)]
Learn(SizeT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","size","canvasSize"]
Learn(ColorT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","background"]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,2)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,2)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,1)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,1),(1,17)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Learn(VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,15),(1,0)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,15),(1,0)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,5),(1,0)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,3),(1,0)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,3),(1,0)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,15),(1,0)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,3),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,0)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,0)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,15),(1,0)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,15),(1,0)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
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
MRV immediate domains=[(0,1),(1,1)]
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
MRV immediate domains=[(0,1),(1,1),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,1)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,1),(1,2)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,5),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=15 children=[11,14]; conditional scalar inverse (observed operand; remaining values deduced)
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,3),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=22 children=[21,18]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_multiply node=26 children=[25,18]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,3)]
Nonempty VS_multiply node=27 children=[18,25]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=31 children=[25,30]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=38 children=[37,34]; conditional scalar inverse (observed operand; remaining values deduced)
Nonempty VS_vec node=40 children=[39,15]; component projection of output specification
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=43 children=[41,42]; indexed algebra inverse; child equivalence classes retain all structural representatives
Nonempty VS_Translate node=45 children=[8,44]; Translate: v_i=Anchor(target_i,TL)-Anchor(source_i,TL); Vec specification=[Vec (-5) (-8),Vec (-10) (-5),Vec (-7) (-8),Vec (-12) (-6)]
Nonempty VS_lambda node=46 children=[45]; function graph -> parameter binding and output points
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,2),(1,2)]
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,19),(1,14)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,3)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=57 children=[52,56]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,3)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=65 children=[60,64]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,2)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=69 children=[25,68]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,2)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=73 children=[21,72]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,2)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=79 children=[78,76]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,2)]
Nonempty VS_multiply node=80 children=[25,72]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,3)]
Nonempty VS_multiply node=81 children=[72,25]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=88 children=[84,87]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=95 children=[91,94]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=102 children=[98,101]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=104 children=[52,103]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=109 children=[108,105]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=111 children=[60,110]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=113 children=[108,112]; conditional scalar inverse (observed operand; remaining values deduced)
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,3),(1,2)]
Nonempty VS_subtract node=115 children=[21,98]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,2)]
Nonempty VS_multiply node=116 children=[25,98]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,3)]
Nonempty VS_multiply node=117 children=[98,25]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=121 children=[120,108]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=125 children=[124,52]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,2)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=133 children=[132,128]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,2)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=141 children=[140,136]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=145 children=[144,60]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_subtract node=146 children=[136,72]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=150 children=[149,76]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,3)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=158 children=[153,157]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_subtract node=159 children=[128,68]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=163 children=[98,162]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_subtract node=164 children=[72,101]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=166 children=[84,165]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=168 children=[84,167]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=170 children=[91,169]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=172 children=[91,171]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=174 children=[153,173]; conditional scalar inverse (observed operand; remaining values deduced)
Nonempty VS_vec node=176 children=[175,114]; component projection of output specification
MRV immediate domains=[(0,3),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=183 children=[182,179]; indexed algebra inverse; child equivalence classes retain all structural representatives
Nonempty VS_Translate node=185 children=[49,184]; Translate: v_i=Anchor(target_i,TL)-Anchor(source_i,TL); Vec specification=[Vec (-1) (-9),Vec (-2) (-11)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_scan node=189 children=[46,185,188]; scan witness: output head is seed; ((y_(i-1),x_i),y_i)=[(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 0, cy = 0}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 5, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 0, cy = 2}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})),(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 0, cy = 2}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})) (PlacedV (Object {objectId = 0, position = Coord {cx = 10, cy = 8}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3),(Coord {cx = 0, cy = 2},3),(Coord {cx = 0, cy = 3},3)], orientation = 0})),PlacedV (Object {objectId = 0, position = Coord {cx = 0, cy = 3}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3),(Coord {cx = 0, cy = 2},3),(Coord {cx = 0, cy = 3},3)], orientation = 0})),(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 0, cy = 0}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4)], orientation = 0})) (PlacedV (Object {objectId = 0, position = Coord {cx = 7, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2)], orientation = 0})),PlacedV (Object {objectId = 0, position = Coord {cx = 0, cy = 1}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2)], orientation = 0})),(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 0, cy = 1}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 12, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 0, cy = 4}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6)], orientation = 0}))]; includes-seed convention; no task classifier
MRV immediate domains=[(0,1),(1,1),(2,1)]
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
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
Nonempty VS_mkScene node=190 children=[3,6,189]; mkScene residual: canonical correspondence + Render-validated paint order; branch=0
MRV immediate domains=[(0,2),(1,3),(2,14)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,2)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
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
MRV immediate domains=[(0,1),(1,1)]
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
MRV immediate domains=[(0,1),(1,1),(2,2)]
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
MRV immediate domains=[(0,1),(1,1),(2,1)]
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
MRV immediate domains=[(0,1),(1,1),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,2),(1,3),(2,14)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,2)]
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
MRV immediate domains=[(0,1),(1,1)]
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
MRV immediate domains=[(0,1),(1,0),(2,2)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,1)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,1)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,1)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,2)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,2)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
Nonempty VS_lambda node=191 children=[190]; function graph -> parameter binding and output points
Task TSL supported Base=["Anchor","ObjectCells","ObjectColors","Translate","add","background","canvasSize","cardinality","colorToInt","coord","coordDelta","fst","head","height","index","lambda","literal","mkScene","multiply","objectOf","objects","scan","setToList","snd","sortBy","subtract","tail","vec","width","x","y"]
Cost saturation C=1..0 root representatives=[]
Abstraction round=0; exact frontier=32; accepted=["I0","I1","I2","I3","I4","I5"]
Learn uses I0 by typed definition expansion; ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]
Task TSL supported Base=["Anchor","ObjectCells","ObjectColors","Translate","add","background","canvasSize","cardinality","colorToInt","coord","coordDelta","fst","head","height","index","lambda","literal","mkScene","multiply","objectOf","objects","scan","setToList","snd","sortBy","subtract","tail","vec","width","x","y"]
Cost saturation C=1..0 root representatives=[]
Abstraction round=1; exact frontier=16; accepted=[]
Cost saturation C=1..0 root representatives=[]
Exact original Render(P(Encode(x)))=y: True; MDL rank=(73,15,5,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. Translate(snd(__r1b0),coordDelta(Anchor(fst(__r1b0),BL),Anchor(snd(__r1b0),TL)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))),coordDelta(CoordV (Coord {cx = 0, cy = 0}),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))),TL))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(73,15,5,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. Translate(snd(__r1b0),coordDelta(Anchor(fst(__r1b0),BL),Anchor(snd(__r1b0),TL)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))),coordDelta(CoordV (Coord {cx = 0, cy = 0}),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))),TL))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(73,15,5,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. Translate(snd(__r1b0),coordDelta(Anchor(fst(__r1b0),BL),Anchor(snd(__r1b0),TL)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))),coordDelta(CoordV (Coord {cx = 0, cy = 0}),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),TL))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(73,15,5,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. Translate(snd(__r1b0),coordDelta(Anchor(fst(__r1b0),BL),Anchor(snd(__r1b0),TL)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))),coordDelta(CoordV (Coord {cx = 0, cy = 0}),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),TL))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(73,15,5,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. Translate(snd(__r1b0),coordDelta(Anchor(fst(__r1b0),BL),Anchor(snd(__r1b0),TL)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),coordDelta(CoordV (Coord {cx = 0, cy = 0}),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))),TL))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(73,15,5,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. Translate(snd(__r1b0),coordDelta(Anchor(fst(__r1b0),BL),Anchor(snd(__r1b0),TL)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),coordDelta(CoordV (Coord {cx = 0, cy = 0}),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))),TL))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(73,15,5,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. Translate(snd(__r1b0),coordDelta(Anchor(fst(__r1b0),BL),Anchor(snd(__r1b0),TL)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),coordDelta(CoordV (Coord {cx = 0, cy = 0}),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),TL))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(73,15,5,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. Translate(snd(__r1b0),coordDelta(Anchor(fst(__r1b0),BL),Anchor(snd(__r1b0),TL)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),coordDelta(CoordV (Coord {cx = 0, cy = 0}),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),TL))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,16,5,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),coordDelta(Anchor(fst(v1),BL),Anchor(snd(v1),TL)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))),coordDelta(CoordV (Coord {cx = 0, cy = 0}),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))),TL))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,16,5,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),coordDelta(Anchor(fst(v1),BL),Anchor(snd(v1),TL)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))),coordDelta(CoordV (Coord {cx = 0, cy = 0}),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))),TL))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,16,5,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),coordDelta(Anchor(fst(v1),BL),Anchor(snd(v1),TL)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))),coordDelta(CoordV (Coord {cx = 0, cy = 0}),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),TL))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,16,5,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),coordDelta(Anchor(fst(v1),BL),Anchor(snd(v1),TL)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))),coordDelta(CoordV (Coord {cx = 0, cy = 0}),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),TL))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,16,5,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),coordDelta(Anchor(fst(v1),BL),Anchor(snd(v1),TL)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),coordDelta(CoordV (Coord {cx = 0, cy = 0}),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))),TL))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,16,5,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),coordDelta(Anchor(fst(v1),BL),Anchor(snd(v1),TL)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),coordDelta(CoordV (Coord {cx = 0, cy = 0}),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))),TL))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,16,5,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),coordDelta(Anchor(fst(v1),BL),Anchor(snd(v1),TL)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),coordDelta(CoordV (Coord {cx = 0, cy = 0}),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),TL))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,16,5,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),coordDelta(Anchor(fst(v1),BL),Anchor(snd(v1),TL)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),coordDelta(CoordV (Coord {cx = 0, cy = 0}),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),TL))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,16,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. Translate(snd(__r1b0),coordDelta(Anchor(fst(__r1b0),BL),Anchor(snd(__r1b0),TL)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))),coordDelta(coord(IntV 0,IntV 0),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))),TL))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,16,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. Translate(snd(__r1b0),coordDelta(Anchor(fst(__r1b0),BL),Anchor(snd(__r1b0),TL)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))),coordDelta(coord(IntV 0,IntV 0),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))),TL))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,16,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. Translate(snd(__r1b0),coordDelta(Anchor(fst(__r1b0),BL),Anchor(snd(__r1b0),TL)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))),coordDelta(coord(IntV 0,IntV 0),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),TL))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,16,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. Translate(snd(__r1b0),coordDelta(Anchor(fst(__r1b0),BL),Anchor(snd(__r1b0),TL)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))),coordDelta(coord(IntV 0,IntV 0),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),TL))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,16,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. Translate(snd(__r1b0),coordDelta(Anchor(fst(__r1b0),BL),Anchor(snd(__r1b0),TL)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),coordDelta(coord(IntV 0,IntV 0),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))),TL))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,16,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. Translate(snd(__r1b0),coordDelta(Anchor(fst(__r1b0),BL),Anchor(snd(__r1b0),TL)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),coordDelta(coord(IntV 0,IntV 0),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))),TL))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,16,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. Translate(snd(__r1b0),coordDelta(Anchor(fst(__r1b0),BL),Anchor(snd(__r1b0),TL)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),coordDelta(coord(IntV 0,IntV 0),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),TL))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(74,16,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. Translate(snd(__r1b0),coordDelta(Anchor(fst(__r1b0),BL),Anchor(snd(__r1b0),TL)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),coordDelta(coord(IntV 0,IntV 0),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),TL))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,14,5,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),coordDelta(Anchor(fst(v1),BL),Anchor(snd(v1),TL)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))),coordDelta(CoordV (Coord {cx = 0, cy = 0}),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))),TL))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,14,5,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),coordDelta(Anchor(fst(v1),BL),Anchor(snd(v1),TL)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))),coordDelta(CoordV (Coord {cx = 0, cy = 0}),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))),TL))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,14,5,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),coordDelta(Anchor(fst(v1),BL),Anchor(snd(v1),TL)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))),coordDelta(CoordV (Coord {cx = 0, cy = 0}),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),TL))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,14,5,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),coordDelta(Anchor(fst(v1),BL),Anchor(snd(v1),TL)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))),coordDelta(CoordV (Coord {cx = 0, cy = 0}),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),TL))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,14,5,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),coordDelta(Anchor(fst(v1),BL),Anchor(snd(v1),TL)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),coordDelta(CoordV (Coord {cx = 0, cy = 0}),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))),TL))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,14,5,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),coordDelta(Anchor(fst(v1),BL),Anchor(snd(v1),TL)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),coordDelta(CoordV (Coord {cx = 0, cy = 0}),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))),TL))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,14,5,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),coordDelta(Anchor(fst(v1),BL),Anchor(snd(v1),TL)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),coordDelta(CoordV (Coord {cx = 0, cy = 0}),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),TL))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,14,5,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),coordDelta(Anchor(fst(v1),BL),Anchor(snd(v1),TL)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),coordDelta(CoordV (Coord {cx = 0, cy = 0}),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),TL))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))))))")
Selected AST; FV=[]; (lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda __r1b0:PairT PlacedT PlacedT. Translate(snd(__r1b0),coordDelta(Anchor(fst(__r1b0),BL),Anchor(snd(__r1b0),TL)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))),coordDelta(CoordV (Coord {cx = 0, cy = 0}),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))),TL))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))
TaskInvented I0: (lambda __r1b0:PairT PlacedT PlacedT. Translate(snd(__r1b0),coordDelta(Anchor(fst(__r1b0),BL),Anchor(snd(__r1b0),TL)))); repeats=32; portfolio MDL saving=337
TaskInvented I1: (lambda __r1h0:PlacedT. (lambda __r1h1:CoordT. Translate(__r1h0,coordDelta(__r1h1,Anchor(__r1h0,TL))))); repeats=48; portfolio MDL saving=165
TaskInvented I2: (lambda v0:SceneT. sortBy((lambda __r1b0:PlacedT. x(Anchor(__r1b0,BL))),objects(v0))); repeats=32; portfolio MDL saving=69
TaskInvented I3: (lambda v0:SceneT. sortBy((lambda __r1b0:PlacedT. x(Anchor(__r1b0,TL))),objects(v0))); repeats=16; portfolio MDL saving=69
TaskInvented I4: (lambda v0:SceneT. sortBy((lambda __r1b0:PlacedT. x(Anchor(__r1b0,TR))),objects(v0))); repeats=16; portfolio MDL saving=69
TaskInvented I5: (lambda v0:SceneT. sortBy((lambda __r1b0:PlacedT. x(Anchor(__r1b0,BR))),objects(v0))); repeats=32; portfolio MDL saving=69
Induced TSL=Signature(root VS) union inventions. BaseActivated=["Anchor","ObjectCells","ObjectColors","Translate","add","background","canvasSize","cardinality","colorToInt","coord","coordDelta","fst","head","height","index","lambda","literal","mkScene","multiply","objectOf","objects","scan","setToList","snd","sortBy","subtract","tail","vec","width","x","y"]; TaskInvented=["I0","I1","I2","I3","I4","I5"]; StructuralPriorCount=0
```
