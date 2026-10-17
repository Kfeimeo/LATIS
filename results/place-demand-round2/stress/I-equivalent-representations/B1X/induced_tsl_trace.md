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
MRV immediate domains=[(0,1)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,1),(1,17)]
Learn(ObjectT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","objectOf"]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,3),(1,1)]
Learn(VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,4)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,0),(1,4)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,1)]
Learn(VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,9),(1,3)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,9),(1,0)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,4)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,9),(1,45)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,45),(1,75)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=134 children=[57,133]; indexed algebra inverse; child equivalence classes retain all structural representatives
MRV immediate domains=[(0,30),(1,45)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=166 children=[165,57]; indexed algebra inverse; child equivalence classes retain all structural representatives
MRV immediate domains=[(0,15),(1,30)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=214 children=[182,213]; indexed algebra inverse; child equivalence classes retain all structural representatives
Nonempty VS_coordAdd node=216 children=[11,215]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,75),(1,1)]
Learn(VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,1)]
Learn(VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,2),(1,1)]
Learn(VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,4)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,30),(1,1)]
Learn(VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,3),(1,2)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,45),(1,2)]
Learn(VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,3),(1,4)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,75)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=218 children=[11,133]; indexed algebra inverse; child equivalence classes retain all structural representatives
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordAdd node=219 children=[57,218]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,30),(1,1)]
Learn(VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,3),(1,2)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,15),(1,2)]
Learn(VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,3),(1,3)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,30)]
Nonempty VS_coordDelta node=220 children=[11,213]; indexed algebra inverse; child equivalence classes retain all structural representatives
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordAdd node=221 children=[182,220]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,30),(1,2)]
Learn(VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,3),(1,3)]
MRV immediate domains=[(0,2),(1,45)]
Nonempty VS_coordDelta node=222 children=[11,57]; indexed algebra inverse; child equivalence classes retain all structural representatives
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordAdd node=223 children=[165,222]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Learn(VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,2),(1,1)]
Learn(VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,2),(1,1)]
Learn(VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,4)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,1)]
Learn(VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,4)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_place node=225 children=[7,224]; place inverse: output local geometry and absolute origin; no translation template
Nonempty VS_lambda node=226 children=[225]; function graph -> parameter binding and output points
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_map node=236 children=[226,235]; map witness: corresponding f(x_i)=y_i; element instances=6
MRV immediate domains=[(0,1),(1,1),(2,8)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,1)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,1),(1,17)]
Learn(ObjectT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","objectOf"]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,3),(1,1)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,4)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,0),(1,4)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,1)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,9),(1,3)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,3),(1,1)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,9),(1,3)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,5),(1,4)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,9),(1,45)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,45),(1,75)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=238 children=[57,133]; indexed algebra inverse; child equivalence classes retain all structural representatives
MRV immediate domains=[(0,30),(1,45)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=239 children=[165,57]; indexed algebra inverse; child equivalence classes retain all structural representatives
MRV immediate domains=[(0,15),(1,30)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=240 children=[182,213]; indexed algebra inverse; child equivalence classes retain all structural representatives
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordAdd node=248 children=[247,241]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,75),(1,1)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,2),(1,3)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,1)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,2),(1,1)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,4)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,30),(1,1)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,3),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,45),(1,2)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,3),(1,5)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,5),(1,75)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=249 children=[247,133]; indexed algebra inverse; child equivalence classes retain all structural representatives
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordAdd node=250 children=[57,249]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,30),(1,1)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,3),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,15),(1,2)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,3),(1,3)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,5),(1,30)]
Nonempty VS_coordDelta node=251 children=[247,213]; indexed algebra inverse; child equivalence classes retain all structural representatives
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordAdd node=252 children=[182,251]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,30),(1,2)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,3),(1,4)]
MRV immediate domains=[(0,5),(1,45)]
Nonempty VS_coordDelta node=253 children=[247,57]; indexed algebra inverse; child equivalence classes retain all structural representatives
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordAdd node=254 children=[165,253]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,2),(1,1)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,2),(1,1)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,4)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,1)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,4)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_place node=256 children=[237,255]; place inverse: output local geometry and absolute origin; no translation template
Nonempty VS_lambda node=257 children=[256]; function graph -> parameter binding and output points
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,15),(1,45)]
Learn(ObjectT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","objectOf"]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_place node=274 children=[273,57]; place inverse: output local geometry and absolute origin; no translation template
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_scan node=284 children=[257,274,283]; scan witness: output head is seed; ((y_(i-1),x_i),y_i)=[(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 4, cy = 5}, geometry = fromList [(Coord {cx = 0, cy = 0},1)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 4, cy = 5}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 6, cy = 7}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 6, cy = 7}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 6, cy = 7}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3),(Coord {cx = 0, cy = 2},3)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 8, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3),(Coord {cx = 0, cy = 2},3)], orientation = 0})),(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 7, cy = 3}, geometry = fromList [(Coord {cx = 0, cy = 0},1)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 7, cy = 3}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 10, cy = 4}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 10, cy = 4}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 10, cy = 4}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3),(Coord {cx = 0, cy = 2},3)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 13, cy = 5}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3),(Coord {cx = 0, cy = 2},3)], orientation = 0}))]; includes-seed convention; no task classifier
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
Nonempty VS_mkScene node=286 children=[3,6,285]; mkScene residual: canonical correspondence + Render-validated paint order; branch=0
MRV immediate domains=[(0,2),(1,3),(2,4)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,8)]
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
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_map node=295 children=[226,294]; map witness: corresponding f(x_i)=y_i; element instances=6
MRV immediate domains=[(0,1),(1,1),(2,7)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,1)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,1),(1,17)]
Learn(ObjectT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","objectOf"]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,3),(1,1)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,6)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,0),(1,6)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,1)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,12),(1,0)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,12),(1,0)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,4)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,12),(1,12)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,75),(1,45)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=297 children=[133,57]; indexed algebra inverse; child equivalence classes retain all structural representatives
MRV immediate domains=[(0,45),(1,30)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=298 children=[57,165]; indexed algebra inverse; child equivalence classes retain all structural representatives
MRV immediate domains=[(0,30),(1,15)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=299 children=[213,182]; indexed algebra inverse; child equivalence classes retain all structural representatives
Nonempty VS_coordAdd node=301 children=[296,300]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,9),(1,3)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,3),(1,4)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,9),(1,45)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,45),(1,75)]
Nonempty VS_coordDelta node=238 children=[57,133]; indexed algebra inverse; child equivalence classes retain all structural representatives
MRV immediate domains=[(0,30),(1,45)]
Nonempty VS_coordDelta node=239 children=[165,57]; indexed algebra inverse; child equivalence classes retain all structural representatives
MRV immediate domains=[(0,15),(1,30)]
Nonempty VS_coordDelta node=240 children=[182,213]; indexed algebra inverse; child equivalence classes retain all structural representatives
Nonempty VS_coordAdd node=304 children=[303,241]; coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,75),(1,2)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,5),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,45)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=308 children=[296,57]; indexed algebra inverse; child equivalence classes retain all structural representatives
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordAdd node=309 children=[133,308]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,2),(1,1)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,6)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,30),(1,2)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,6),(1,5)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,15)]
Nonempty VS_coordDelta node=310 children=[296,182]; indexed algebra inverse; child equivalence classes retain all structural representatives
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordAdd node=311 children=[213,310]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,45),(1,3)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,6),(1,7)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,3),(1,75)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=312 children=[303,133]; indexed algebra inverse; child equivalence classes retain all structural representatives
MRV immediate domains=[(0,2),(1,30)]
Nonempty VS_coordDelta node=313 children=[296,165]; indexed algebra inverse; child equivalence classes retain all structural representatives
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordAdd node=315 children=[57,314]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,30),(1,1)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,3),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,15),(1,2)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,3),(1,3)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,3),(1,30)]
Nonempty VS_coordDelta node=316 children=[303,213]; indexed algebra inverse; child equivalence classes retain all structural representatives
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordAdd node=317 children=[182,316]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,30),(1,2)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,3),(1,3)]
MRV immediate domains=[(0,3),(1,45)]
Nonempty VS_coordDelta node=318 children=[303,57]; indexed algebra inverse; child equivalence classes retain all structural representatives
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordAdd node=319 children=[165,318]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,2),(1,1)]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,0),(1,0)]
Nonempty VS_place node=321 children=[237,320]; place inverse: output local geometry and absolute origin; no translation template
Nonempty VS_lambda node=322 children=[321]; function graph -> parameter binding and output points
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,15),(1,17)]
Learn(ObjectT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","objectOf"]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,3),(1,33)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,1),(1,3)]
MRV immediate domains=[(0,3),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,6)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,6)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,45),(1,45)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=434 children=[387,433]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,45)]
Nonempty VS_add node=435 children=[433,387]; conditional scalar inverse (observed operand; remaining values deduced)
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,45),(1,30)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=514 children=[513,467]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,15)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=577 children=[576,530]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,30),(1,45)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=655 children=[608,654]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,30)]
Nonempty VS_add node=656 children=[654,608]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,15),(1,45)]
Nonempty VS_add node=657 children=[530,576]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,30),(1,45)]
Nonempty VS_add node=658 children=[467,513]; conditional scalar inverse (observed operand; remaining values deduced)
Nonempty VS_vec node=660 children=[436,659]; component projection of output specification
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,0)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,75)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,6),(1,6)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,6)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,75),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,12),(1,19)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,8)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,6)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,30),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,14),(1,12)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,45),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,14),(1,17)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,0)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,0)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,6)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,6)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,30),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,12),(1,8)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,15),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,12),(1,8)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,30),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,12),(1,12)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,8)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,6)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,6)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,6)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,8)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,8)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,8)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
Nonempty VS_coordAdd node=661 children=[341,660]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,6)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,45),(1,45)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=434 children=[387,433]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,45)]
Nonempty VS_add node=435 children=[433,387]; conditional scalar inverse (observed operand; remaining values deduced)
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,45),(1,30)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=514 children=[513,467]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,15)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=577 children=[576,530]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,30),(1,45)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=655 children=[608,654]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,30)]
Nonempty VS_add node=656 children=[654,608]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,15),(1,45)]
Nonempty VS_add node=657 children=[530,576]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,30),(1,45)]
Nonempty VS_add node=658 children=[467,513]; conditional scalar inverse (observed operand; remaining values deduced)
Nonempty VS_coord node=662 children=[436,659]; component projection of output specification
MRV immediate domains=[(0,75),(1,33)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,11),(1,15)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,3),(1,1)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,11),(1,12)]
MRV immediate domains=[(0,1),(1,75)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,7),(1,15)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,75),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,8),(1,12)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,12),(1,8)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,13),(1,19)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,30),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,8)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,45),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,8)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,11),(1,13)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,11),(1,13)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,8),(1,15)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,7),(1,12)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,6),(1,15)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,30),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,8),(1,61)]
MRV immediate domains=[(0,15),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,8),(1,137)]
MRV immediate domains=[(0,30),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,8),(1,112)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,12),(1,9)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,12),(1,7)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,10),(1,19)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,12),(1,19)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,13),(1,8)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,8),(1,12)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,7),(1,13)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,7),(1,13)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,6),(1,12)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,10),(1,8)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,12),(1,8)]
MRV immediate domains=[(0,11),(1,15)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,112),(1,45)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=776 children=[775,433]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,112)]
Nonempty VS_add node=777 children=[433,775]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,7)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=785 children=[433,784]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,137),(1,45)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=969 children=[968,831]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,137)]
Nonempty VS_add node=970 children=[831,968]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,61),(1,45)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1079 children=[1078,1016]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,61)]
Nonempty VS_add node=1080 children=[1016,1078]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,15)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_multiply node=1127 children=[1126,530]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,15),(1,45)]
Nonempty VS_multiply node=1128 children=[530,1126]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,2)]
Nonempty VS_subtract node=1129 children=[831,663]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1131 children=[1016,1130]; conditional scalar inverse (observed operand; remaining values deduced)
Nonempty VS_vec node=1133 children=[1132,530]; component projection of output specification
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,8),(1,13)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,8),(1,13)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,6),(1,13)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordAdd node=1134 children=[133,1133]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,33)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,0)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,3),(1,1)]
MRV immediate domains=[(0,2),(1,0)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,75)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,6),(1,0)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,75),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,6)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,30),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,14),(1,7)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,45),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,14),(1,8)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,7)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,11)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,30),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,12),(1,0)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,15),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,12),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,30),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,12),(1,2)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,6)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,6)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,6)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,7)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,11)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,6)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,6)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,7)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,11)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,7)]
MRV immediate domains=[(0,2),(1,33)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,6)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,3),(1,1)]
MRV immediate domains=[(0,0),(1,6)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,75)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,6)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,75),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,6)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,30),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,9),(1,12)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,45),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,9),(1,17)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,6),(1,6)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,6)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,30),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,6),(1,8)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,15),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,6),(1,8)]
MRV immediate domains=[(0,30),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,6),(1,12)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,8)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,6)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,6)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,6)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,8)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,6),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,8)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,8)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,6),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,6),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,30),(1,33)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,26),(1,13)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,3),(1,1)]
MRV immediate domains=[(0,26),(1,13)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,7),(1,30)]
Nonempty VS_add node=1141 children=[784,608]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,30),(1,7)]
Nonempty VS_add node=1142 children=[608,784]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,30),(1,112)]
Nonempty VS_subtract node=1143 children=[608,775]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,137)]
Nonempty VS_subtract node=1144 children=[654,968]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,61)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1191 children=[1190,1078]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,15),(1,45)]
Nonempty VS_subtract node=1192 children=[530,576]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,30),(1,45)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1239 children=[467,1238]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,31),(1,45)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1272 children=[1271,1126]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,15),(1,31)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1289 children=[1288,1271]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,45)]
Nonempty VS_add node=1290 children=[663,654]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,2)]
Nonempty VS_add node=1291 children=[654,663]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Nonempty VS_add node=1292 children=[1190,1130]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,15),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1294 children=[1288,1293]; conditional scalar inverse (observed operand; remaining values deduced)
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,112),(1,45)]
Nonempty VS_add node=1296 children=[775,387]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,112)]
Nonempty VS_add node=1297 children=[387,775]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,7)]
Nonempty VS_subtract node=1298 children=[387,784]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,45),(2,8)]
Learn(ArrowT (PairT IntT PlacedT) IntT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,137),(1,45)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=1345 children=[968,1344]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,137)]
Nonempty VS_add node=1346 children=[1344,968]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,45)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1393 children=[1392,1344]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,61)]
Nonempty VS_add node=1394 children=[1126,1078]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,61),(1,45)]
Nonempty VS_add node=1395 children=[1078,1126]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,30)]
Nonempty VS_multiply node=1396 children=[1126,608]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,30),(1,45)]
Nonempty VS_multiply node=1397 children=[608,1126]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,45)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1444 children=[1443,1126]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,45)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1491 children=[1490,387]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,2)]
Nonempty VS_subtract node=1492 children=[1344,663]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Nonempty VS_subtract node=1493 children=[1126,1130]; conditional scalar inverse (observed operand; remaining values deduced)
Nonempty VS_vec node=1495 children=[1494,1295]; component projection of output specification
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,26),(1,9)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,4),(1,75)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,30),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordAdd node=1497 children=[165,1496]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,45),(1,15)]
Nonempty VS_coord node=1498 children=[1392,530]; component projection of output specification
MRV immediate domains=[(0,30),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordAdd node=1531 children=[1530,1499]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,15),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordAdd node=1533 children=[182,1532]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=1535 children=[1534,133]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,7),(1,13)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,75),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,30),(1,1)]
MRV immediate domains=[(0,45),(1,1)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,26),(1,8)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,26),(1,10)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,8),(1,13)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,7),(1,9)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,6),(1,13)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,30),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,45),(1,12)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,75),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordAdd node=1537 children=[133,1536]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=1538 children=[1530,1537]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,15),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,45),(1,12)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,75),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1540 children=[133,1539]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=1541 children=[182,1540]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,30),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,75),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1543 children=[133,1542]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,45),(1,45)]
Nonempty VS_coord node=1544 children=[1344,1238]; component projection of output specification
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=1546 children=[165,1545]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,14),(1,6)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,8),(1,12)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,10),(1,12)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,9),(1,7)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,8),(1,9)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,7),(1,8)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,7),(1,10)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,6),(1,9)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,8),(1,7)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,10),(1,7)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,8),(1,8)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,8),(1,10)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,6),(1,8)]
Nonempty VS_coordAdd node=1548 children=[213,1547]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,45),(1,2)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,26),(1,30)]
Nonempty VS_vec node=1549 children=[1494,608]; component projection of output specification
MRV immediate domains=[(0,30),(1,75)]
Nonempty VS_coordDelta node=1550 children=[165,133]; indexed algebra inverse; child equivalence classes retain all structural representatives
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordAdd node=1552 children=[57,1551]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,30),(1,33)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,9),(1,12)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,3),(1,1)]
MRV immediate domains=[(0,9),(1,12)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,45),(1,45)]
Nonempty VS_subtract node=1553 children=[831,1344]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,45)]
Nonempty VS_subtract node=1554 children=[1392,831]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,45)]
Nonempty VS_multiply node=1555 children=[1126,513]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,45)]
Nonempty VS_multiply node=1556 children=[513,1126]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,45)]
Nonempty VS_subtract node=1557 children=[1016,1126]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,45)]
Nonempty VS_subtract node=1558 children=[433,387]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,31),(1,45)]
Nonempty VS_subtract node=1559 children=[1271,513]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,45)]
Nonempty VS_subtract node=1560 children=[1443,1016]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,45)]
Nonempty VS_subtract node=1561 children=[1490,433]; conditional scalar inverse (observed operand; remaining values deduced)
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,45),(1,61)]
Nonempty VS_subtract node=1563 children=[576,1078]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,137)]
Nonempty VS_subtract node=1564 children=[513,968]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,45)]
Nonempty VS_subtract node=1565 children=[387,1016]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,30),(1,45)]
Nonempty VS_subtract node=1566 children=[608,1238]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,15),(1,45)]
Nonempty VS_subtract node=1567 children=[530,1190]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,30),(1,15)]
Nonempty VS_subtract node=1568 children=[467,1288]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,31)]
Nonempty VS_subtract node=1569 children=[1238,1271]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,45)]
Nonempty VS_subtract node=1570 children=[433,1443]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Nonempty VS_add node=1571 children=[576,1130]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,45)]
Nonempty VS_add node=1572 children=[663,513]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,2)]
Nonempty VS_add node=1573 children=[513,663]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Nonempty VS_add node=1574 children=[1238,1293]; conditional scalar inverse (observed operand; remaining values deduced)
Nonempty VS_vec node=1576 children=[1562,1575]; component projection of output specification
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,9),(1,6)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,3),(1,75)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,45),(1,13)]
MRV immediate domains=[(0,30),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordAdd node=1577 children=[213,1499]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,45),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordAdd node=1578 children=[57,1532]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=1580 children=[1579,133]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,12)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,75),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,30),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=1581 children=[213,1537]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,45),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=1582 children=[57,1540]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,9),(1,6)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,9),(1,7)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,12)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,6)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,12)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,30),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,45),(1,11)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,30),(1,1)]
Nonempty VS_coordAdd node=1583 children=[213,1536]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,45),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_coordAdd node=1585 children=[57,1584]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=1587 children=[1530,1586]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,15),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,45),(1,16)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,30),(1,1)]
Nonempty VS_coordAdd node=1588 children=[213,1539]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,45),(1,1)]
Nonempty VS_coordAdd node=1589 children=[57,1536]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=1591 children=[182,1590]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,30),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,30),(1,1)]
Nonempty VS_coordAdd node=1592 children=[213,1542]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,45),(1,15)]
Nonempty VS_coord node=1593 children=[831,1288]; component projection of output specification
MRV immediate domains=[(0,45),(1,1)]
Nonempty VS_coordAdd node=1594 children=[57,1539]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
Nonempty VS_coordDelta node=1596 children=[165,1595]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,12),(1,0)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,6),(1,8)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,6),(1,8)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,6),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,6)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,6)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,7)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,6)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,6),(1,0)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,6),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,6)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,7)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,6)]
Nonempty VS_coordAdd node=1598 children=[1530,1597]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,15),(1,2)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,9),(1,13)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,7),(1,45)]
Nonempty VS_add node=1599 children=[784,513]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,7)]
Nonempty VS_add node=1600 children=[513,784]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,112)]
Nonempty VS_subtract node=1601 children=[513,775]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,137)]
Nonempty VS_subtract node=1602 children=[576,968]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,30),(1,45)]
Nonempty VS_subtract node=1603 children=[608,576]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,45)]
Nonempty VS_subtract node=1604 children=[654,1238]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,30),(1,45)]
Nonempty VS_subtract node=1605 children=[467,1190]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,61)]
Nonempty VS_subtract node=1606 children=[1238,1078]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,15),(1,45)]
Nonempty VS_subtract node=1607 children=[530,654]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,15)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=1654 children=[1653,1288]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,45)]
Nonempty VS_add node=1655 children=[663,576]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,2)]
Nonempty VS_add node=1656 children=[576,663]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Nonempty VS_add node=1657 children=[1238,1130]; conditional scalar inverse (observed operand; remaining values deduced)
Nonempty VS_vec node=1659 children=[1562,1658]; component projection of output specification
MRV immediate domains=[(0,30),(1,30)]
Nonempty VS_coordDelta node=1660 children=[165,213]; indexed algebra inverse; child equivalence classes retain all structural representatives
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordAdd node=1662 children=[182,1661]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,30),(1,4)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,9),(1,45)]
Nonempty VS_vec node=1663 children=[1562,513]; component projection of output specification
MRV immediate domains=[(0,45),(1,75)]
Nonempty VS_coordDelta node=1664 children=[57,133]; indexed algebra inverse; child equivalence classes retain all structural representatives
MRV immediate domains=[(0,30),(1,45)]
Nonempty VS_coordDelta node=1665 children=[165,57]; indexed algebra inverse; child equivalence classes retain all structural representatives
MRV immediate domains=[(0,15),(1,30)]
Nonempty VS_coordDelta node=1666 children=[182,213]; indexed algebra inverse; child equivalence classes retain all structural representatives
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordAdd node=1668 children=[165,1667]; deferred-nonlocal: coordinate/vector inverse: condition on left operand and deduce right component specification
MRV immediate domains=[(0,2),(1,33)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,0)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,3),(1,1)]
MRV immediate domains=[(0,2),(1,0)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,75)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,6),(1,0)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,75),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,30),(1,1)]
MRV immediate domains=[(0,45),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,14),(1,11)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,10)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,30),(1,1)]
MRV immediate domains=[(0,15),(1,1)]
MRV immediate domains=[(0,30),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,12),(1,3)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,6)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,8)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,8)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,6)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,10)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,11)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,6)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,6)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,10)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,2),(1,33)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,0)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,3),(1,1)]
MRV immediate domains=[(0,2),(1,0)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,75)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,6),(1,0)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,75),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,30),(1,1)]
MRV immediate domains=[(0,45),(1,1)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,0)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,30),(1,1)]
MRV immediate domains=[(0,15),(1,1)]
MRV immediate domains=[(0,30),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,6)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,6)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,6)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,6)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,6)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,6)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,2),(1,33)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,6)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,3),(1,1)]
MRV immediate domains=[(0,0),(1,6)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,75)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,6)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,75),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,30),(1,1)]
MRV immediate domains=[(0,45),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,8),(1,17)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,6)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,30),(1,1)]
MRV immediate domains=[(0,15),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,6),(1,8)]
MRV immediate domains=[(0,30),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,6),(1,12)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,6)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,8)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,2),(1,33)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,6)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,3),(1,1)]
MRV immediate domains=[(0,0),(1,6)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,75)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,6)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,75),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,30),(1,1)]
MRV immediate domains=[(0,45),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,10),(1,17)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,6),(1,6)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,30),(1,1)]
MRV immediate domains=[(0,15),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,6),(1,8)]
MRV immediate domains=[(0,30),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,6),(1,12)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,6)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,6),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,8)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,6),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,6),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,2),(1,33)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,3),(1,1)]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,75)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,75),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,30),(1,1)]
MRV immediate domains=[(0,45),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,9),(1,8)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,7)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,11)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,6),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,30),(1,1)]
MRV immediate domains=[(0,15),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,6),(1,1)]
MRV immediate domains=[(0,30),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,6),(1,2)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,6)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,6)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,6)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,6),(1,7)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,6),(1,11)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,7)]
MRV immediate domains=[(0,2),(1,33)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,3),(1,1)]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,75)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,75),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,30),(1,1)]
MRV immediate domains=[(0,45),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,8),(1,8)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,7)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,11)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,30),(1,1)]
MRV immediate domains=[(0,15),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,6),(1,1)]
MRV immediate domains=[(0,30),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,6),(1,2)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,11)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,6)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,7)]
MRV immediate domains=[(0,2),(1,33)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,3),(1,1)]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,75)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,1),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,75),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,30),(1,1)]
MRV immediate domains=[(0,45),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,10),(1,8)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,7)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,11)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,6),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,30),(1,1)]
MRV immediate domains=[(0,15),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,6),(1,1)]
MRV immediate domains=[(0,30),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,6),(1,2)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,1),(1,2)]
MRV immediate domains=[(0,2),(1,1)]
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,6)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,6),(1,7)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,6),(1,11)]
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_place node=1691 children=[338,1690]; place inverse: output local geometry and absolute origin; no translation template
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_scan node=1700 children=[322,1691,1699]; scan witness: output head is seed; ((y_(i-1),x_i),y_i)=[(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 8, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3),(Coord {cx = 0, cy = 2},3)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 4, cy = 5}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 6, cy = 7}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 6, cy = 7}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2)], orientation = 0})) (PlacedV (Object {objectId = 0, position = Coord {cx = 2, cy = 3}, geometry = fromList [(Coord {cx = 0, cy = 0},1)], orientation = 0})),PlacedV (Object {objectId = 0, position = Coord {cx = 4, cy = 5}, geometry = fromList [(Coord {cx = 0, cy = 0},1)], orientation = 0})),(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 13, cy = 5}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3),(Coord {cx = 0, cy = 2},3)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 7, cy = 3}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 10, cy = 4}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 10, cy = 4}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2)], orientation = 0})) (PlacedV (Object {objectId = 0, position = Coord {cx = 4, cy = 2}, geometry = fromList [(Coord {cx = 0, cy = 0},1)], orientation = 0})),PlacedV (Object {objectId = 0, position = Coord {cx = 7, cy = 3}, geometry = fromList [(Coord {cx = 0, cy = 0},1)], orientation = 0}))]; includes-seed convention; no task classifier
Nonempty VS_mkScene node=1702 children=[3,6,1701]; mkScene residual: canonical correspondence + Render-validated paint order; branch=0
Nonempty VS_lambda node=1704 children=[1703]; function graph -> parameter binding and output points
Task TSL supported Base=["Anchor","ObjectCells","ObjectColors","add","background","canvasSize","cardinality","colorToInt","coord","coordAdd","coordDelta","fst","head","height","index","lambda","literal","map","mkScene","multiply","objectOf","objects","place","scan","setToList","snd","sortBy","subtract","tail","vec","width","x","y"]
Cost saturation C=1..18 root representatives=[(1,0),(2,0),(3,0),(4,0),(5,0),(6,0),(7,0),(8,0),(9,0),(10,0),(11,0),(12,0),(13,0),(14,0),(15,0),(16,0),(17,0),(18,0)]
Abstraction round=0; exact frontier=1845; accepted=["I0","I1","I2","I3","I4","I5"]
Task TSL supported Base=["Anchor","ObjectCells","ObjectColors","add","background","canvasSize","cardinality","colorToInt","coord","coordAdd","coordDelta","fst","head","height","index","lambda","literal","map","mkScene","multiply","objectOf","objects","place","scan","setToList","snd","sortBy","subtract","tail","vec","width","x","y"]
Abstraction round=1; exact frontier=1845; accepted=[]
Cost saturation C=1..18 root representatives=[(1,0),(2,0),(3,0),(4,0),(5,0),(6,0),(7,0),(8,0),(9,0),(10,0),(11,0),(12,0),(13,0),(14,0),(15,0),(16,0),(17,0),(18,0)]
Exact original Render(P(Encode(x)))=y: True; MDL rank=(44,13,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(objects(v0))),Center),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(44,13,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(objects(v0))),TL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(44,13,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(objects(v0))),TR),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(44,13,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(objects(v0))),Center),Anchor(head(objects(v0)),BL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(44,13,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(objects(v0))),TL),Anchor(head(objects(v0)),BL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(44,13,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(objects(v0))),TR),Anchor(head(objects(v0)),BL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(46,14,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(objects(v0))),Center),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(46,13,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(tail(objects(v0)))),Center),coordDelta(Anchor(v1,TL),Anchor(head(tail(objects(v0))),BL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(46,13,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(objects(v0))),Center))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(46,13,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(objects(v0))),TL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(46,13,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(objects(v0))),TR))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(46,13,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(tail(objects(v0))),Center))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(46,13,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(tail(objects(v0))),TL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(46,13,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(tail(objects(v0))),TR))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(54,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(objects(v0))),Center),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(53,15,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(objects(v0))),Center),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(53,15,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(objects(v0))),Center),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(53,15,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(objects(v0))),Center),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(53,15,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(objects(v0))),Center),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(53,15,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(objects(v0))),Center),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(53,15,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(objects(v0))),Center),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(54,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))),Center),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(54,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(54,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))),TR),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(53,15,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),Center),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(53,15,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(53,15,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),TR),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(53,15,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),Center),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(53,15,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(53,15,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),TR),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(53,15,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))),Center),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(53,15,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(53,15,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))),TR),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(53,15,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))),Center),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(53,15,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(53,15,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))),TR),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(53,15,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))),Center),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(53,15,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(53,15,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))),TR),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(53,15,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))),Center),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(53,15,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(53,15,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))),TR),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(54,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))),Center),Anchor(head(objects(v0)),BL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(54,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))),TL),Anchor(head(objects(v0)),BL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(54,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))),TR),Anchor(head(objects(v0)),BL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(53,15,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),Center),Anchor(head(objects(v0)),BL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(53,15,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),TL),Anchor(head(objects(v0)),BL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(53,15,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),TR),Anchor(head(objects(v0)),BL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(53,15,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),Center),Anchor(head(objects(v0)),BL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(53,15,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),TL),Anchor(head(objects(v0)),BL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(53,15,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),TR),Anchor(head(objects(v0)),BL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(53,15,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))),Center),Anchor(head(objects(v0)),BL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(53,15,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))),TL),Anchor(head(objects(v0)),BL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(53,15,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))),TR),Anchor(head(objects(v0)),BL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(53,15,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))),Center),Anchor(head(objects(v0)),BL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(53,15,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))),TL),Anchor(head(objects(v0)),BL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(53,15,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))),TR),Anchor(head(objects(v0)),BL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(53,15,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))),Center),Anchor(head(objects(v0)),BL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(53,15,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))),TL),Anchor(head(objects(v0)),BL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(53,15,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))),TR),Anchor(head(objects(v0)),BL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(53,15,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))),Center),Anchor(head(objects(v0)),BL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(53,15,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))),TL),Anchor(head(objects(v0)),BL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(53,15,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))),TR),Anchor(head(objects(v0)),BL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(objects(v0))),Center),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(objects(v0))),Center),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(objects(v0))),Center),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(objects(v0))),Center),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(objects(v0))),Center),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(objects(v0))),Center),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(objects(v0))),Center),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(objects(v0))),TL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(objects(v0))),TR),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))),Center),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))),TR),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)))),Center),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)))),TR),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)))),Center),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)))),TR),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0)))),Center),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0)))),TR),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)))),Center),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)))),TR),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)))),Center),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)))),TR),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)))),Center),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)))),TR),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))),Center))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))),TL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))),TR))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(55,15,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),Center))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(55,15,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),TL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(55,15,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),TR))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(55,15,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),Center))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(55,15,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),TL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(55,15,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),TR))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(55,15,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))),Center))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(55,15,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))),TL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(55,15,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))),TR))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(55,15,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))),Center))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(55,15,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))),TL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(55,15,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))),TR))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(55,15,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))),Center))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(55,15,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))),TL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(55,15,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))),TR))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(55,15,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))),Center))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(55,15,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))),TL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(55,15,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))),TR))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(objects(v0))),Center),Anchor(head(objects(v0)),BL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(objects(v0))),TL),Anchor(head(objects(v0)),BL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(objects(v0))),TR),Anchor(head(objects(v0)),BL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))),Center),Anchor(head(objects(v0)),BL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))),TL),Anchor(head(objects(v0)),BL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(57,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))),TR),Anchor(head(objects(v0)),BL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)))),Center),Anchor(head(objects(v0)),BL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)))),TL),Anchor(head(objects(v0)),BL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)))),TR),Anchor(head(objects(v0)),BL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)))),Center),Anchor(head(objects(v0)),BL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)))),TL),Anchor(head(objects(v0)),BL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)))),TR),Anchor(head(objects(v0)),BL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0)))),Center),Anchor(head(objects(v0)),BL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0)))),TL),Anchor(head(objects(v0)),BL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0)))),TR),Anchor(head(objects(v0)),BL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)))),Center),Anchor(head(objects(v0)),BL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)))),TL),Anchor(head(objects(v0)),BL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)))),TR),Anchor(head(objects(v0)),BL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)))),Center),Anchor(head(objects(v0)),BL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)))),TL),Anchor(head(objects(v0)),BL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)))),TR),Anchor(head(objects(v0)),BL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)))),Center),Anchor(head(objects(v0)),BL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)))),TL),Anchor(head(objects(v0)),BL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)))),TR),Anchor(head(objects(v0)),BL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))),Center))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))),TL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))),TR))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(55,15,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),Center))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(55,15,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),TL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(55,15,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),TR))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(55,15,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),Center))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(55,15,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),TL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(55,15,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),TR))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(55,15,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))),Center))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(55,15,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))),TL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(55,15,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))),TR))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(55,15,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))),Center))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(55,15,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))),TL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(55,15,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))),TR))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(55,15,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))),Center))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(55,15,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))),TL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(55,15,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))),TR))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(55,15,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))),Center))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(55,15,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))),TL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(55,15,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))),TR))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,18,5,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(__cse0)),Center),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,18,5,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(__cse0)),TL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,18,5,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(__cse0)),TR),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,18,5,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(__cse0)),Center),Anchor(head(objects(v0)),BL))))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,18,5,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(__cse0)),TL),Anchor(head(objects(v0)),BL))))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,18,5,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(__cse0)),TR),Anchor(head(objects(v0)),BL))))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,17,5,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BL)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(__cse0)),Center),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,17,5,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BL)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(__cse0)),TL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,17,5,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BL)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(__cse0)),TR),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,17,5,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BL)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(__cse0)),Center),Anchor(head(objects(v0)),BL))))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,17,5,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BL)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(__cse0)),TL),Anchor(head(objects(v0)),BL))))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,17,5,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BL)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(__cse0)),TR),Anchor(head(objects(v0)),BL))))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,17,5,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(__cse0)),Center),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,17,5,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(__cse0)),TL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,17,5,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(__cse0)),TR),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,17,5,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(__cse0)),Center),Anchor(head(objects(v0)),BL))))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,17,5,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(__cse0)),TL),Anchor(head(objects(v0)),BL))))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,17,5,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(__cse0)),TR),Anchor(head(objects(v0)),BL))))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,17,5,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(__cse0)),Center),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,17,5,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(__cse0)),TL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,17,5,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(__cse0)),TR),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,17,5,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(__cse0)),Center),Anchor(head(objects(v0)),BL))))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,17,5,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(__cse0)),TL),Anchor(head(objects(v0)),BL))))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,17,5,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(__cse0)),TR),Anchor(head(objects(v0)),BL))))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,17,5,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BL)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(__cse0)),Center),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,17,5,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BL)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(__cse0)),TL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,17,5,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BL)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(__cse0)),TR),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,17,5,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BL)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(__cse0)),Center),Anchor(head(objects(v0)),BL))))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,17,5,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BL)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(__cse0)),TL),Anchor(head(objects(v0)),BL))))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,17,5,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BL)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(__cse0)),TR),Anchor(head(objects(v0)),BL))))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,17,5,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(__cse0)),Center),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,17,5,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(__cse0)),TL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,17,5,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(__cse0)),TR),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,17,5,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(__cse0)),Center),Anchor(head(objects(v0)),BL))))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,17,5,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(__cse0)),TL),Anchor(head(objects(v0)),BL))))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,17,5,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(__cse0)),TR),Anchor(head(objects(v0)),BL))))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,17,5,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(__cse0)),Center),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,17,5,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(__cse0)),TL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,17,5,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(__cse0)),TR),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,17,5,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(__cse0)),Center),Anchor(head(objects(v0)),BL))))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,17,5,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(__cse0)),TL),Anchor(head(objects(v0)),BL))))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,17,5,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(__cse0)),TR),Anchor(head(objects(v0)),BL))))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,18,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(objects(v0))),Center),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(objects(v0))),Center),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))),BL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(objects(v0))),Center),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))),BR))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(objects(v0))),Center),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))),Center))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(objects(v0))),Center),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))),TL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(objects(v0))),Center),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))),TR))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(objects(v0))),Center),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))),BL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(objects(v0))),Center),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))),BR))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(objects(v0))),Center),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))),Center))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(objects(v0))),Center),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))),TL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(objects(v0))),Center),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))),TR))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(objects(v0))),Center),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))),BL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(objects(v0))),Center),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))),BR))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(objects(v0))),Center),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))),Center))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(objects(v0))),Center),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))),TL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(objects(v0))),Center),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))),TR))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(objects(v0))),Center),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))),BL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(objects(v0))),Center),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))),BR))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(objects(v0))),Center),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))),Center))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(objects(v0))),Center),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))),TL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(objects(v0))),Center),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))),TR))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(objects(v0))),Center),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))),BL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(objects(v0))),Center),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))),BR))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(objects(v0))),Center),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))),Center))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(objects(v0))),Center),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))),TL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(objects(v0))),Center),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))),TR))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(tail(objects(v0)))),Center),coordDelta(Anchor(v1,TL),Anchor(head(tail(objects(v0))),BL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(objects(v0))),Center))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(objects(v0))),TL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(objects(v0))),TR))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))),Center))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))),TL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))),TR))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)))),Center))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)))),TL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)))),TR))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)))),Center))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)))),TL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)))),TR))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0)))),Center))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0)))),TL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0)))),TR))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)))),Center))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)))),TL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)))),TR))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)))),Center))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)))),TL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)))),TR))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)))),Center))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)))),TL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)))),TR))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(objects(v0))),Center),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))),BL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(objects(v0))),Center),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))),BR))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(objects(v0))),Center),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))),Center))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(objects(v0))),Center),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))),TL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(objects(v0))),Center),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))),TR))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(objects(v0))),Center),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))),BL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(objects(v0))),Center),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))),BR))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(objects(v0))),Center),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))),Center))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(objects(v0))),Center),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))),TL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(objects(v0))),Center),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))),TR))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(objects(v0))),Center),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))),BL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(objects(v0))),Center),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))),BR))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(objects(v0))),Center),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))),Center))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(objects(v0))),Center),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))),TL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(objects(v0))),Center),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))),TR))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(objects(v0))),Center),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))),BL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(objects(v0))),Center),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))),BR))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(objects(v0))),Center),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))),Center))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(objects(v0))),Center),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))),TL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(objects(v0))),Center),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))),TR))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(objects(v0))),Center),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))),BL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(objects(v0))),Center),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))),BR))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(objects(v0))),Center),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))),Center))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(objects(v0))),Center),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))),TL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(objects(v0))),Center),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))),TR))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(tail(objects(v0))),Center))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(tail(objects(v0))),TL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(tail(objects(v0))),TR))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))),Center))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))),TL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,17,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))),TR))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)))),Center))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)))),TL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)))),TR))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)))),Center))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)))),TL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)))),TR))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0)))),Center))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0)))),TL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0)))),TR))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)))),Center))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)))),TL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)))),TR))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)))),Center))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)))),TL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)))),TR))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)))),Center))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)))),TL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,16,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)))),TR))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,16,4,0,"(lambda v0:SceneT. let __cse0=Anchor(head(tail(objects(v0))),Center) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(__cse0,Anchor(head(objects(v0)),BL))))),place(objectOf(head(objects(v0))),__cse0),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,16,4,0,"(lambda v0:SceneT. let __cse0=Anchor(head(tail(objects(v0))),Center) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(Anchor(fst(v1),Center),Anchor(head(objects(v0)),BL))))),place(objectOf(head(objects(v0))),__cse0),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,16,4,0,"(lambda v0:SceneT. let __cse0=Anchor(head(tail(objects(v0))),TL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(__cse0,Anchor(head(objects(v0)),BL))))),place(objectOf(head(objects(v0))),__cse0),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,16,4,0,"(lambda v0:SceneT. let __cse0=Anchor(head(tail(objects(v0))),TL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(Anchor(fst(v1),Center),Anchor(head(objects(v0)),BL))))),place(objectOf(head(objects(v0))),__cse0),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,16,4,0,"(lambda v0:SceneT. let __cse0=Anchor(head(tail(objects(v0))),TR) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(__cse0,Anchor(head(objects(v0)),BL))))),place(objectOf(head(objects(v0))),__cse0),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,16,4,0,"(lambda v0:SceneT. let __cse0=Anchor(head(tail(objects(v0))),TR) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(Anchor(fst(v1),Center),Anchor(head(objects(v0)),BL))))),place(objectOf(head(objects(v0))),__cse0),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,18,5,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(__cse0)),Center))))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,18,5,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(__cse0)),TL))))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,18,5,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(__cse0)),TR))))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,18,5,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(tail(__cse0)),Center))))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,18,5,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(tail(__cse0)),TL))))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(62,18,5,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(tail(__cse0)),TR))))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,5,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BL)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(__cse0)),Center))))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,5,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BL)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(__cse0)),TL))))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,5,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BL)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(__cse0)),TR))))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,5,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BL)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(tail(__cse0)),Center))))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,5,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BL)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(tail(__cse0)),TL))))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,5,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BL)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(tail(__cse0)),TR))))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,5,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(__cse0)),Center))))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,5,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(__cse0)),TL))))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,5,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(__cse0)),TR))))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,5,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(tail(__cse0)),Center))))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,5,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(tail(__cse0)),TL))))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,5,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(tail(__cse0)),TR))))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,5,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(__cse0)),Center))))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,5,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(__cse0)),TL))))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,5,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(__cse0)),TR))))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,5,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(tail(__cse0)),Center))))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,5,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(tail(__cse0)),TL))))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,5,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(tail(__cse0)),TR))))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,5,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BL)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(__cse0)),Center))))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,5,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BL)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(__cse0)),TL))))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,5,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BL)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(__cse0)),TR))))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,5,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BL)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(tail(__cse0)),Center))))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,5,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BL)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(tail(__cse0)),TL))))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,5,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BL)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(tail(__cse0)),TR))))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,5,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(__cse0)),Center))))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,5,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(__cse0)),TL))))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,5,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(__cse0)),TR))))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,5,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(tail(__cse0)),Center))))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,5,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(tail(__cse0)),TL))))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,5,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(tail(__cse0)),TR))))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,5,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(__cse0)),Center))))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,5,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(__cse0)),TL))))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,5,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(__cse0)),TR))))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,5,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(tail(__cse0)),Center))))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,5,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(tail(__cse0)),TL))))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,17,5,0,"(lambda v0:SceneT. let __cse0=sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)) in mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(tail(__cse0)),TR))))),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,16,4,0,"(lambda v0:SceneT. let __cse0=tail(objects(v0)) in let __cse1=Anchor(head(__cse0),Center) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(Anchor(head(tail(__cse0)),TL),__cse1)))),place(objectOf(head(objects(v0))),__cse1),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,16,4,0,"(lambda v0:SceneT. let __cse0=tail(objects(v0)) in let __cse1=Anchor(head(__cse0),Center) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(head(tail(__cse0)),TL),coordDelta(Anchor(fst(v1),Center),__cse1)))),place(objectOf(head(objects(v0))),__cse1),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,16,4,0,"(lambda v0:SceneT. let __cse0=tail(objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(Anchor(head(__cse0),Center),Anchor(head(objects(v0)),BL))))),place(objectOf(head(objects(v0))),Anchor(head(__cse0),TL)),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,16,4,0,"(lambda v0:SceneT. let __cse0=tail(objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(Anchor(head(__cse0),Center),Anchor(head(objects(v0)),BL))))),place(objectOf(head(objects(v0))),Anchor(head(__cse0),TR)),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,16,4,0,"(lambda v0:SceneT. let __cse0=tail(objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(Anchor(head(__cse0),TL),Anchor(head(objects(v0)),BL))))),place(objectOf(head(objects(v0))),Anchor(head(__cse0),Center)),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,16,4,0,"(lambda v0:SceneT. let __cse0=tail(objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(Anchor(head(__cse0),TR),Anchor(head(objects(v0)),BL))))),place(objectOf(head(objects(v0))),Anchor(head(__cse0),Center)),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,16,3,0,"(lambda v0:SceneT. let __cse0=tail(objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(Anchor(head(tail(__cse0)),TL),Anchor(head(__cse0),TL))))),place(objectOf(head(objects(v0))),Anchor(head(__cse0),Center)),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,16,3,0,"(lambda v0:SceneT. let __cse0=tail(objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(Anchor(head(tail(__cse0)),TL),Anchor(head(__cse0),TR))))),place(objectOf(head(objects(v0))),Anchor(head(__cse0),Center)),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,16,4,0,"(lambda v0:SceneT. let __cse0=tail(objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(head(__cse0),TL),coordDelta(Anchor(fst(v1),Center),Anchor(head(objects(v0)),BL))))),place(objectOf(head(objects(v0))),Anchor(head(__cse0),Center)),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,16,4,0,"(lambda v0:SceneT. let __cse0=tail(objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(head(__cse0),TR),coordDelta(Anchor(fst(v1),Center),Anchor(head(objects(v0)),BL))))),place(objectOf(head(objects(v0))),Anchor(head(__cse0),Center)),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,16,3,0,"(lambda v0:SceneT. let __cse0=tail(objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(head(tail(__cse0)),Center),coordDelta(Anchor(fst(v1),Center),Anchor(head(__cse0),BL))))),place(objectOf(head(objects(v0))),Anchor(head(__cse0),Center)),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,16,3,0,"(lambda v0:SceneT. let __cse0=tail(objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(head(tail(__cse0)),TL),coordDelta(Anchor(fst(v1),Center),Anchor(head(__cse0),TL))))),place(objectOf(head(objects(v0))),Anchor(head(__cse0),Center)),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(59,16,3,0,"(lambda v0:SceneT. let __cse0=tail(objects(v0)) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(head(tail(__cse0)),TL),coordDelta(Anchor(fst(v1),Center),Anchor(head(__cse0),TR))))),place(objectOf(head(objects(v0))),Anchor(head(__cse0),Center)),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(64,17,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))),Center),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(64,17,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(64,17,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))),TR),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(65,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),Center),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(65,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(65,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),TR),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(65,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),Center),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(65,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(65,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),TR),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(65,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))),Center),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(65,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(65,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))),TR),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(65,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))),Center),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(65,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(65,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))),TR),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(65,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))),Center),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(65,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(65,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))),TR),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(65,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))),Center),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(65,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(65,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))),TR),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(64,17,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))),Center),Anchor(head(objects(v0)),BL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(64,17,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))),TL),Anchor(head(objects(v0)),BL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(64,17,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))),TR),Anchor(head(objects(v0)),BL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(65,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),Center),Anchor(head(objects(v0)),BL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(65,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),TL),Anchor(head(objects(v0)),BL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(65,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),TR),Anchor(head(objects(v0)),BL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(65,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),Center),Anchor(head(objects(v0)),BL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(65,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),TL),Anchor(head(objects(v0)),BL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(65,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),TR),Anchor(head(objects(v0)),BL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(65,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))),Center),Anchor(head(objects(v0)),BL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(65,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))),TL),Anchor(head(objects(v0)),BL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(65,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))),TR),Anchor(head(objects(v0)),BL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(65,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))),Center),Anchor(head(objects(v0)),BL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(65,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))),TL),Anchor(head(objects(v0)),BL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(65,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))),TR),Anchor(head(objects(v0)),BL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(65,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))),Center),Anchor(head(objects(v0)),BL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(65,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))),TL),Anchor(head(objects(v0)),BL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(65,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))),TR),Anchor(head(objects(v0)),BL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(65,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))),Center),Anchor(head(objects(v0)),BL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(65,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))),TL),Anchor(head(objects(v0)),BL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(65,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))),TR),Anchor(head(objects(v0)),BL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(67,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)))),Center),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(67,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(67,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)))),TR),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(67,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)))),Center),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(67,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(67,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)))),TR),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(67,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0)))),Center),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(67,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(67,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0)))),TR),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(67,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)))),Center),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(67,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(67,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)))),TR),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(67,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)))),Center),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(67,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(67,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)))),TR),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(67,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)))),Center),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(67,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(67,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)))),TR),coordDelta(Anchor(v1,TL),Anchor(head(objects(v0)),BL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(66,17,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))),Center))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(66,17,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))),TL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(66,17,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))),TR))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(67,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),Center))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(67,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),TL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(67,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),TR))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(67,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),Center))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(67,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),TL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(67,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),TR))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(67,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))),Center))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(67,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))),TL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(67,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))),TR))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(67,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))),Center))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(67,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))),TL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(67,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))),TR))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(67,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))),Center))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(67,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))),TL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(67,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))),TR))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(67,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))),Center))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(67,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))),TL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(67,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))),TR))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(67,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)))),Center),Anchor(head(objects(v0)),BL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(67,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)))),TL),Anchor(head(objects(v0)),BL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(67,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)))),TR),Anchor(head(objects(v0)),BL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(67,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)))),Center),Anchor(head(objects(v0)),BL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(67,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)))),TL),Anchor(head(objects(v0)),BL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(67,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)))),TR),Anchor(head(objects(v0)),BL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(67,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0)))),Center),Anchor(head(objects(v0)),BL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(67,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0)))),TL),Anchor(head(objects(v0)),BL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(67,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0)))),TR),Anchor(head(objects(v0)),BL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(67,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)))),Center),Anchor(head(objects(v0)),BL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(67,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)))),TL),Anchor(head(objects(v0)),BL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(67,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)))),TR),Anchor(head(objects(v0)),BL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(67,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)))),Center),Anchor(head(objects(v0)),BL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(67,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)))),TL),Anchor(head(objects(v0)),BL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(67,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)))),TR),Anchor(head(objects(v0)),BL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(67,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)))),Center),Anchor(head(objects(v0)),BL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(67,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)))),TL),Anchor(head(objects(v0)),BL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(67,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)))),TR),Anchor(head(objects(v0)),BL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(66,17,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))),Center))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(66,17,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))),TL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(66,17,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))),TR))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(67,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),Center))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(67,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),TL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(67,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),TR))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(67,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),Center))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(67,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),TL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(67,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),TR))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(67,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))),Center))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(67,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))),TL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(67,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))),TR))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(67,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))),Center))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(67,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))),TL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(67,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))),TR))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(67,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))),Center))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(67,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))),TL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(67,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))),TR))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(67,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))),Center))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(67,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))),TL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(67,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))),TR))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,19,5,0,"(lambda v0:SceneT. let __cse0=Anchor(head(tail(objects(v0))),Center) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(__cse0,Anchor(head(objects(v0)),BL))))),place(objectOf(head(objects(v0))),__cse0),tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,18,5,0,"(lambda v0:SceneT. let __cse0=Anchor(head(tail(objects(v0))),Center) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(__cse0,Anchor(head(objects(v0)),BL))))),place(objectOf(head(objects(v0))),__cse0),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,18,5,0,"(lambda v0:SceneT. let __cse0=Anchor(head(tail(objects(v0))),Center) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(__cse0,Anchor(head(objects(v0)),BL))))),place(objectOf(head(objects(v0))),__cse0),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,18,5,0,"(lambda v0:SceneT. let __cse0=Anchor(head(tail(objects(v0))),Center) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(__cse0,Anchor(head(objects(v0)),BL))))),place(objectOf(head(objects(v0))),__cse0),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,18,5,0,"(lambda v0:SceneT. let __cse0=Anchor(head(tail(objects(v0))),Center) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(__cse0,Anchor(head(objects(v0)),BL))))),place(objectOf(head(objects(v0))),__cse0),tail(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,18,5,0,"(lambda v0:SceneT. let __cse0=Anchor(head(tail(objects(v0))),Center) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(__cse0,Anchor(head(objects(v0)),BL))))),place(objectOf(head(objects(v0))),__cse0),tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,18,5,0,"(lambda v0:SceneT. let __cse0=Anchor(head(tail(objects(v0))),Center) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(__cse0,Anchor(head(objects(v0)),BL))))),place(objectOf(head(objects(v0))),__cse0),tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,19,5,0,"(lambda v0:SceneT. let __cse0=Anchor(head(tail(objects(v0))),Center) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(__cse0,Anchor(head(objects(v0)),BL))))),place(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))),__cse0),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,18,5,0,"(lambda v0:SceneT. let __cse0=Anchor(head(tail(objects(v0))),Center) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(__cse0,Anchor(head(objects(v0)),BL))))),place(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),__cse0),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,18,5,0,"(lambda v0:SceneT. let __cse0=Anchor(head(tail(objects(v0))),Center) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(__cse0,Anchor(head(objects(v0)),BL))))),place(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),__cse0),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,18,5,0,"(lambda v0:SceneT. let __cse0=Anchor(head(tail(objects(v0))),Center) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(__cse0,Anchor(head(objects(v0)),BL))))),place(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))),__cse0),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,18,5,0,"(lambda v0:SceneT. let __cse0=Anchor(head(tail(objects(v0))),Center) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(__cse0,Anchor(head(objects(v0)),BL))))),place(objectOf(head(sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))),__cse0),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,18,5,0,"(lambda v0:SceneT. let __cse0=Anchor(head(tail(objects(v0))),Center) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(__cse0,Anchor(head(objects(v0)),BL))))),place(objectOf(head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))),__cse0),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,18,5,0,"(lambda v0:SceneT. let __cse0=Anchor(head(tail(objects(v0))),Center) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(__cse0,Anchor(head(objects(v0)),BL))))),place(objectOf(head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))),__cse0),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,19,5,0,"(lambda v0:SceneT. let __cse0=Anchor(head(tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))),Center) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(__cse0,Anchor(head(objects(v0)),BL))))),place(objectOf(head(objects(v0))),__cse0),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,19,5,0,"(lambda v0:SceneT. let __cse0=Anchor(head(tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))),Center) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(Anchor(fst(v1),Center),Anchor(head(objects(v0)),BL))))),place(objectOf(head(objects(v0))),__cse0),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,19,5,0,"(lambda v0:SceneT. let __cse0=Anchor(head(tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))),TL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(__cse0,Anchor(head(objects(v0)),BL))))),place(objectOf(head(objects(v0))),__cse0),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,19,5,0,"(lambda v0:SceneT. let __cse0=Anchor(head(tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))),TL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(Anchor(fst(v1),Center),Anchor(head(objects(v0)),BL))))),place(objectOf(head(objects(v0))),__cse0),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,19,5,0,"(lambda v0:SceneT. let __cse0=Anchor(head(tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))),TR) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(__cse0,Anchor(head(objects(v0)),BL))))),place(objectOf(head(objects(v0))),__cse0),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,19,5,0,"(lambda v0:SceneT. let __cse0=Anchor(head(tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))),TR) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(Anchor(fst(v1),Center),Anchor(head(objects(v0)),BL))))),place(objectOf(head(objects(v0))),__cse0),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,18,5,0,"(lambda v0:SceneT. let __cse0=Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))),Center) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(__cse0,Anchor(head(objects(v0)),BL))))),place(objectOf(head(objects(v0))),__cse0),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,18,5,0,"(lambda v0:SceneT. let __cse0=Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))),Center) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(Anchor(fst(v1),Center),Anchor(head(objects(v0)),BL))))),place(objectOf(head(objects(v0))),__cse0),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,18,5,0,"(lambda v0:SceneT. let __cse0=Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))),TL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(__cse0,Anchor(head(objects(v0)),BL))))),place(objectOf(head(objects(v0))),__cse0),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,18,5,0,"(lambda v0:SceneT. let __cse0=Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))),TL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(Anchor(fst(v1),Center),Anchor(head(objects(v0)),BL))))),place(objectOf(head(objects(v0))),__cse0),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,18,5,0,"(lambda v0:SceneT. let __cse0=Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))),TR) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(__cse0,Anchor(head(objects(v0)),BL))))),place(objectOf(head(objects(v0))),__cse0),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,18,5,0,"(lambda v0:SceneT. let __cse0=Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))),TR) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(Anchor(fst(v1),Center),Anchor(head(objects(v0)),BL))))),place(objectOf(head(objects(v0))),__cse0),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,18,5,0,"(lambda v0:SceneT. let __cse0=Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),Center) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(__cse0,Anchor(head(objects(v0)),BL))))),place(objectOf(head(objects(v0))),__cse0),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,18,5,0,"(lambda v0:SceneT. let __cse0=Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),Center) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(Anchor(fst(v1),Center),Anchor(head(objects(v0)),BL))))),place(objectOf(head(objects(v0))),__cse0),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,18,5,0,"(lambda v0:SceneT. let __cse0=Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),TL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(__cse0,Anchor(head(objects(v0)),BL))))),place(objectOf(head(objects(v0))),__cse0),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,18,5,0,"(lambda v0:SceneT. let __cse0=Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),TL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(Anchor(fst(v1),Center),Anchor(head(objects(v0)),BL))))),place(objectOf(head(objects(v0))),__cse0),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,18,5,0,"(lambda v0:SceneT. let __cse0=Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),TR) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(__cse0,Anchor(head(objects(v0)),BL))))),place(objectOf(head(objects(v0))),__cse0),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,18,5,0,"(lambda v0:SceneT. let __cse0=Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),TR) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(Anchor(fst(v1),Center),Anchor(head(objects(v0)),BL))))),place(objectOf(head(objects(v0))),__cse0),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,18,5,0,"(lambda v0:SceneT. let __cse0=Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),Center) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(__cse0,Anchor(head(objects(v0)),BL))))),place(objectOf(head(objects(v0))),__cse0),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,18,5,0,"(lambda v0:SceneT. let __cse0=Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),Center) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(Anchor(fst(v1),Center),Anchor(head(objects(v0)),BL))))),place(objectOf(head(objects(v0))),__cse0),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,18,5,0,"(lambda v0:SceneT. let __cse0=Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),TL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(__cse0,Anchor(head(objects(v0)),BL))))),place(objectOf(head(objects(v0))),__cse0),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,18,5,0,"(lambda v0:SceneT. let __cse0=Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),TL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(Anchor(fst(v1),Center),Anchor(head(objects(v0)),BL))))),place(objectOf(head(objects(v0))),__cse0),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,18,5,0,"(lambda v0:SceneT. let __cse0=Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),TR) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(__cse0,Anchor(head(objects(v0)),BL))))),place(objectOf(head(objects(v0))),__cse0),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,18,5,0,"(lambda v0:SceneT. let __cse0=Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),TR) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(Anchor(fst(v1),Center),Anchor(head(objects(v0)),BL))))),place(objectOf(head(objects(v0))),__cse0),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,18,5,0,"(lambda v0:SceneT. let __cse0=Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BL))),objects(v0)))),Center) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(__cse0,Anchor(head(objects(v0)),BL))))),place(objectOf(head(objects(v0))),__cse0),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,18,5,0,"(lambda v0:SceneT. let __cse0=Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BL))),objects(v0)))),Center) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(Anchor(fst(v1),Center),Anchor(head(objects(v0)),BL))))),place(objectOf(head(objects(v0))),__cse0),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,18,5,0,"(lambda v0:SceneT. let __cse0=Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BL))),objects(v0)))),TL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(__cse0,Anchor(head(objects(v0)),BL))))),place(objectOf(head(objects(v0))),__cse0),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,18,5,0,"(lambda v0:SceneT. let __cse0=Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BL))),objects(v0)))),TL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(Anchor(fst(v1),Center),Anchor(head(objects(v0)),BL))))),place(objectOf(head(objects(v0))),__cse0),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,18,5,0,"(lambda v0:SceneT. let __cse0=Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BL))),objects(v0)))),TR) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(__cse0,Anchor(head(objects(v0)),BL))))),place(objectOf(head(objects(v0))),__cse0),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,18,5,0,"(lambda v0:SceneT. let __cse0=Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,BL))),objects(v0)))),TR) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(Anchor(fst(v1),Center),Anchor(head(objects(v0)),BL))))),place(objectOf(head(objects(v0))),__cse0),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,18,5,0,"(lambda v0:SceneT. let __cse0=Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))),Center) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(__cse0,Anchor(head(objects(v0)),BL))))),place(objectOf(head(objects(v0))),__cse0),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,18,5,0,"(lambda v0:SceneT. let __cse0=Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))),Center) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(Anchor(fst(v1),Center),Anchor(head(objects(v0)),BL))))),place(objectOf(head(objects(v0))),__cse0),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,18,5,0,"(lambda v0:SceneT. let __cse0=Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))),TL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(__cse0,Anchor(head(objects(v0)),BL))))),place(objectOf(head(objects(v0))),__cse0),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,18,5,0,"(lambda v0:SceneT. let __cse0=Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))),TL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(Anchor(fst(v1),Center),Anchor(head(objects(v0)),BL))))),place(objectOf(head(objects(v0))),__cse0),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,18,5,0,"(lambda v0:SceneT. let __cse0=Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))),TR) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(__cse0,Anchor(head(objects(v0)),BL))))),place(objectOf(head(objects(v0))),__cse0),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,18,5,0,"(lambda v0:SceneT. let __cse0=Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))),TR) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(Anchor(fst(v1),Center),Anchor(head(objects(v0)),BL))))),place(objectOf(head(objects(v0))),__cse0),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,18,5,0,"(lambda v0:SceneT. let __cse0=Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))),Center) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(__cse0,Anchor(head(objects(v0)),BL))))),place(objectOf(head(objects(v0))),__cse0),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,18,5,0,"(lambda v0:SceneT. let __cse0=Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))),Center) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(Anchor(fst(v1),Center),Anchor(head(objects(v0)),BL))))),place(objectOf(head(objects(v0))),__cse0),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,18,5,0,"(lambda v0:SceneT. let __cse0=Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))),TL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(__cse0,Anchor(head(objects(v0)),BL))))),place(objectOf(head(objects(v0))),__cse0),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,18,5,0,"(lambda v0:SceneT. let __cse0=Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))),TL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(Anchor(fst(v1),Center),Anchor(head(objects(v0)),BL))))),place(objectOf(head(objects(v0))),__cse0),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,18,5,0,"(lambda v0:SceneT. let __cse0=Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))),TR) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(__cse0,Anchor(head(objects(v0)),BL))))),place(objectOf(head(objects(v0))),__cse0),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,18,5,0,"(lambda v0:SceneT. let __cse0=Anchor(head(tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))),TR) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(Anchor(fst(v1),Center),Anchor(head(objects(v0)),BL))))),place(objectOf(head(objects(v0))),__cse0),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,19,5,0,"(lambda v0:SceneT. let __cse0=tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))) in let __cse1=Anchor(head(__cse0),Center) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(Anchor(head(tail(__cse0)),TL),__cse1)))),place(objectOf(head(objects(v0))),__cse1),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,19,5,0,"(lambda v0:SceneT. let __cse0=tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))) in let __cse1=Anchor(head(__cse0),Center) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(head(tail(__cse0)),TL),coordDelta(Anchor(fst(v1),Center),__cse1)))),place(objectOf(head(objects(v0))),__cse1),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,18,5,0,"(lambda v0:SceneT. let __cse0=tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))) in let __cse1=Anchor(head(__cse0),Center) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(Anchor(head(tail(__cse0)),TL),__cse1)))),place(objectOf(head(objects(v0))),__cse1),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,18,5,0,"(lambda v0:SceneT. let __cse0=tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))) in let __cse1=Anchor(head(__cse0),Center) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(head(tail(__cse0)),TL),coordDelta(Anchor(fst(v1),Center),__cse1)))),place(objectOf(head(objects(v0))),__cse1),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,18,5,0,"(lambda v0:SceneT. let __cse0=tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))) in let __cse1=Anchor(head(__cse0),Center) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(Anchor(head(tail(__cse0)),TL),__cse1)))),place(objectOf(head(objects(v0))),__cse1),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,18,5,0,"(lambda v0:SceneT. let __cse0=tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))) in let __cse1=Anchor(head(__cse0),Center) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(head(tail(__cse0)),TL),coordDelta(Anchor(fst(v1),Center),__cse1)))),place(objectOf(head(objects(v0))),__cse1),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,18,5,0,"(lambda v0:SceneT. let __cse0=tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))) in let __cse1=Anchor(head(__cse0),Center) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(Anchor(head(tail(__cse0)),TL),__cse1)))),place(objectOf(head(objects(v0))),__cse1),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,18,5,0,"(lambda v0:SceneT. let __cse0=tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))) in let __cse1=Anchor(head(__cse0),Center) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(head(tail(__cse0)),TL),coordDelta(Anchor(fst(v1),Center),__cse1)))),place(objectOf(head(objects(v0))),__cse1),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,18,5,0,"(lambda v0:SceneT. let __cse0=tail(sortBy((lambda key:PlacedT. y(Anchor(key,BL))),objects(v0))) in let __cse1=Anchor(head(__cse0),Center) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(Anchor(head(tail(__cse0)),TL),__cse1)))),place(objectOf(head(objects(v0))),__cse1),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,18,5,0,"(lambda v0:SceneT. let __cse0=tail(sortBy((lambda key:PlacedT. y(Anchor(key,BL))),objects(v0))) in let __cse1=Anchor(head(__cse0),Center) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(head(tail(__cse0)),TL),coordDelta(Anchor(fst(v1),Center),__cse1)))),place(objectOf(head(objects(v0))),__cse1),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,18,5,0,"(lambda v0:SceneT. let __cse0=tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))) in let __cse1=Anchor(head(__cse0),Center) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(Anchor(head(tail(__cse0)),TL),__cse1)))),place(objectOf(head(objects(v0))),__cse1),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,18,5,0,"(lambda v0:SceneT. let __cse0=tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))) in let __cse1=Anchor(head(__cse0),Center) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(head(tail(__cse0)),TL),coordDelta(Anchor(fst(v1),Center),__cse1)))),place(objectOf(head(objects(v0))),__cse1),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,18,5,0,"(lambda v0:SceneT. let __cse0=tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))) in let __cse1=Anchor(head(__cse0),Center) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(Anchor(head(tail(__cse0)),TL),__cse1)))),place(objectOf(head(objects(v0))),__cse1),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,18,5,0,"(lambda v0:SceneT. let __cse0=tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))) in let __cse1=Anchor(head(__cse0),Center) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(head(tail(__cse0)),TL),coordDelta(Anchor(fst(v1),Center),__cse1)))),place(objectOf(head(objects(v0))),__cse1),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(70,19,5,0,"(lambda v0:SceneT. let __cse0=tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(Anchor(head(__cse0),Center),Anchor(head(objects(v0)),BL))))),place(objectOf(head(objects(v0))),Anchor(head(__cse0),TL)),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(70,19,5,0,"(lambda v0:SceneT. let __cse0=tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(Anchor(head(__cse0),Center),Anchor(head(objects(v0)),BL))))),place(objectOf(head(objects(v0))),Anchor(head(__cse0),TR)),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(70,19,5,0,"(lambda v0:SceneT. let __cse0=tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(Anchor(head(__cse0),TL),Anchor(head(objects(v0)),BL))))),place(objectOf(head(objects(v0))),Anchor(head(__cse0),Center)),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(70,19,5,0,"(lambda v0:SceneT. let __cse0=tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(Anchor(head(__cse0),TR),Anchor(head(objects(v0)),BL))))),place(objectOf(head(objects(v0))),Anchor(head(__cse0),Center)),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,19,4,0,"(lambda v0:SceneT. let __cse0=tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(Anchor(head(tail(__cse0)),TL),Anchor(head(__cse0),TL))))),place(objectOf(head(objects(v0))),Anchor(head(__cse0),Center)),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,19,4,0,"(lambda v0:SceneT. let __cse0=tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(Anchor(head(tail(__cse0)),TL),Anchor(head(__cse0),TR))))),place(objectOf(head(objects(v0))),Anchor(head(__cse0),Center)),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(70,19,5,0,"(lambda v0:SceneT. let __cse0=tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(head(__cse0),TL),coordDelta(Anchor(fst(v1),Center),Anchor(head(objects(v0)),BL))))),place(objectOf(head(objects(v0))),Anchor(head(__cse0),Center)),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(70,19,5,0,"(lambda v0:SceneT. let __cse0=tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(head(__cse0),TR),coordDelta(Anchor(fst(v1),Center),Anchor(head(objects(v0)),BL))))),place(objectOf(head(objects(v0))),Anchor(head(__cse0),Center)),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,19,4,0,"(lambda v0:SceneT. let __cse0=tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(head(tail(__cse0)),Center),coordDelta(Anchor(fst(v1),Center),Anchor(head(__cse0),BL))))),place(objectOf(head(objects(v0))),Anchor(head(__cse0),Center)),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,19,4,0,"(lambda v0:SceneT. let __cse0=tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(head(tail(__cse0)),TL),coordDelta(Anchor(fst(v1),Center),Anchor(head(__cse0),TL))))),place(objectOf(head(objects(v0))),Anchor(head(__cse0),Center)),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,19,4,0,"(lambda v0:SceneT. let __cse0=tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(head(tail(__cse0)),TL),coordDelta(Anchor(fst(v1),Center),Anchor(head(__cse0),TR))))),place(objectOf(head(objects(v0))),Anchor(head(__cse0),Center)),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,0,"(lambda v0:SceneT. let __cse0=tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(Anchor(head(__cse0),Center),Anchor(head(objects(v0)),BL))))),place(objectOf(head(objects(v0))),Anchor(head(__cse0),TL)),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,0,"(lambda v0:SceneT. let __cse0=tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(Anchor(head(__cse0),Center),Anchor(head(objects(v0)),BL))))),place(objectOf(head(objects(v0))),Anchor(head(__cse0),TR)),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,0,"(lambda v0:SceneT. let __cse0=tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(Anchor(head(__cse0),TL),Anchor(head(objects(v0)),BL))))),place(objectOf(head(objects(v0))),Anchor(head(__cse0),Center)),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,0,"(lambda v0:SceneT. let __cse0=tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(Anchor(head(__cse0),TR),Anchor(head(objects(v0)),BL))))),place(objectOf(head(objects(v0))),Anchor(head(__cse0),Center)),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,18,4,0,"(lambda v0:SceneT. let __cse0=tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(Anchor(head(tail(__cse0)),TL),Anchor(head(__cse0),TL))))),place(objectOf(head(objects(v0))),Anchor(head(__cse0),Center)),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,18,4,0,"(lambda v0:SceneT. let __cse0=tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(Anchor(head(tail(__cse0)),TL),Anchor(head(__cse0),TR))))),place(objectOf(head(objects(v0))),Anchor(head(__cse0),Center)),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,0,"(lambda v0:SceneT. let __cse0=tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(head(__cse0),TL),coordDelta(Anchor(fst(v1),Center),Anchor(head(objects(v0)),BL))))),place(objectOf(head(objects(v0))),Anchor(head(__cse0),Center)),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,0,"(lambda v0:SceneT. let __cse0=tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(head(__cse0),TR),coordDelta(Anchor(fst(v1),Center),Anchor(head(objects(v0)),BL))))),place(objectOf(head(objects(v0))),Anchor(head(__cse0),Center)),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,18,4,0,"(lambda v0:SceneT. let __cse0=tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(head(tail(__cse0)),Center),coordDelta(Anchor(fst(v1),Center),Anchor(head(__cse0),BL))))),place(objectOf(head(objects(v0))),Anchor(head(__cse0),Center)),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,18,4,0,"(lambda v0:SceneT. let __cse0=tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(head(tail(__cse0)),TL),coordDelta(Anchor(fst(v1),Center),Anchor(head(__cse0),TL))))),place(objectOf(head(objects(v0))),Anchor(head(__cse0),Center)),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,18,4,0,"(lambda v0:SceneT. let __cse0=tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(head(tail(__cse0)),TL),coordDelta(Anchor(fst(v1),Center),Anchor(head(__cse0),TR))))),place(objectOf(head(objects(v0))),Anchor(head(__cse0),Center)),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,0,"(lambda v0:SceneT. let __cse0=tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(Anchor(head(__cse0),Center),Anchor(head(objects(v0)),BL))))),place(objectOf(head(objects(v0))),Anchor(head(__cse0),TL)),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,0,"(lambda v0:SceneT. let __cse0=tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(Anchor(head(__cse0),Center),Anchor(head(objects(v0)),BL))))),place(objectOf(head(objects(v0))),Anchor(head(__cse0),TR)),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,0,"(lambda v0:SceneT. let __cse0=tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(Anchor(head(__cse0),TL),Anchor(head(objects(v0)),BL))))),place(objectOf(head(objects(v0))),Anchor(head(__cse0),Center)),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,0,"(lambda v0:SceneT. let __cse0=tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(Anchor(head(__cse0),TR),Anchor(head(objects(v0)),BL))))),place(objectOf(head(objects(v0))),Anchor(head(__cse0),Center)),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,18,4,0,"(lambda v0:SceneT. let __cse0=tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(Anchor(head(tail(__cse0)),TL),Anchor(head(__cse0),TL))))),place(objectOf(head(objects(v0))),Anchor(head(__cse0),Center)),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,18,4,0,"(lambda v0:SceneT. let __cse0=tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(Anchor(head(tail(__cse0)),TL),Anchor(head(__cse0),TR))))),place(objectOf(head(objects(v0))),Anchor(head(__cse0),Center)),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,0,"(lambda v0:SceneT. let __cse0=tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(head(__cse0),TL),coordDelta(Anchor(fst(v1),Center),Anchor(head(objects(v0)),BL))))),place(objectOf(head(objects(v0))),Anchor(head(__cse0),Center)),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,0,"(lambda v0:SceneT. let __cse0=tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(head(__cse0),TR),coordDelta(Anchor(fst(v1),Center),Anchor(head(objects(v0)),BL))))),place(objectOf(head(objects(v0))),Anchor(head(__cse0),Center)),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,18,4,0,"(lambda v0:SceneT. let __cse0=tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(head(tail(__cse0)),Center),coordDelta(Anchor(fst(v1),Center),Anchor(head(__cse0),BL))))),place(objectOf(head(objects(v0))),Anchor(head(__cse0),Center)),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,18,4,0,"(lambda v0:SceneT. let __cse0=tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(head(tail(__cse0)),TL),coordDelta(Anchor(fst(v1),Center),Anchor(head(__cse0),TL))))),place(objectOf(head(objects(v0))),Anchor(head(__cse0),Center)),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,18,4,0,"(lambda v0:SceneT. let __cse0=tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(head(tail(__cse0)),TL),coordDelta(Anchor(fst(v1),Center),Anchor(head(__cse0),TR))))),place(objectOf(head(objects(v0))),Anchor(head(__cse0),Center)),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,0,"(lambda v0:SceneT. let __cse0=tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(Anchor(head(__cse0),Center),Anchor(head(objects(v0)),BL))))),place(objectOf(head(objects(v0))),Anchor(head(__cse0),TL)),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,0,"(lambda v0:SceneT. let __cse0=tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(Anchor(head(__cse0),Center),Anchor(head(objects(v0)),BL))))),place(objectOf(head(objects(v0))),Anchor(head(__cse0),TR)),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,0,"(lambda v0:SceneT. let __cse0=tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(Anchor(head(__cse0),TL),Anchor(head(objects(v0)),BL))))),place(objectOf(head(objects(v0))),Anchor(head(__cse0),Center)),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,0,"(lambda v0:SceneT. let __cse0=tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(Anchor(head(__cse0),TR),Anchor(head(objects(v0)),BL))))),place(objectOf(head(objects(v0))),Anchor(head(__cse0),Center)),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,18,4,0,"(lambda v0:SceneT. let __cse0=tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(Anchor(head(tail(__cse0)),TL),Anchor(head(__cse0),TL))))),place(objectOf(head(objects(v0))),Anchor(head(__cse0),Center)),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,18,4,0,"(lambda v0:SceneT. let __cse0=tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(Anchor(head(tail(__cse0)),TL),Anchor(head(__cse0),TR))))),place(objectOf(head(objects(v0))),Anchor(head(__cse0),Center)),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,0,"(lambda v0:SceneT. let __cse0=tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(head(__cse0),TL),coordDelta(Anchor(fst(v1),Center),Anchor(head(objects(v0)),BL))))),place(objectOf(head(objects(v0))),Anchor(head(__cse0),Center)),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,0,"(lambda v0:SceneT. let __cse0=tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(head(__cse0),TR),coordDelta(Anchor(fst(v1),Center),Anchor(head(objects(v0)),BL))))),place(objectOf(head(objects(v0))),Anchor(head(__cse0),Center)),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,18,4,0,"(lambda v0:SceneT. let __cse0=tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(head(tail(__cse0)),Center),coordDelta(Anchor(fst(v1),Center),Anchor(head(__cse0),BL))))),place(objectOf(head(objects(v0))),Anchor(head(__cse0),Center)),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,18,4,0,"(lambda v0:SceneT. let __cse0=tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(head(tail(__cse0)),TL),coordDelta(Anchor(fst(v1),Center),Anchor(head(__cse0),TL))))),place(objectOf(head(objects(v0))),Anchor(head(__cse0),Center)),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,18,4,0,"(lambda v0:SceneT. let __cse0=tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(head(tail(__cse0)),TL),coordDelta(Anchor(fst(v1),Center),Anchor(head(__cse0),TR))))),place(objectOf(head(objects(v0))),Anchor(head(__cse0),Center)),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,0,"(lambda v0:SceneT. let __cse0=tail(sortBy((lambda key:PlacedT. y(Anchor(key,BL))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(Anchor(head(__cse0),Center),Anchor(head(objects(v0)),BL))))),place(objectOf(head(objects(v0))),Anchor(head(__cse0),TL)),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,0,"(lambda v0:SceneT. let __cse0=tail(sortBy((lambda key:PlacedT. y(Anchor(key,BL))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(Anchor(head(__cse0),Center),Anchor(head(objects(v0)),BL))))),place(objectOf(head(objects(v0))),Anchor(head(__cse0),TR)),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,0,"(lambda v0:SceneT. let __cse0=tail(sortBy((lambda key:PlacedT. y(Anchor(key,BL))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(Anchor(head(__cse0),TL),Anchor(head(objects(v0)),BL))))),place(objectOf(head(objects(v0))),Anchor(head(__cse0),Center)),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,0,"(lambda v0:SceneT. let __cse0=tail(sortBy((lambda key:PlacedT. y(Anchor(key,BL))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(Anchor(head(__cse0),TR),Anchor(head(objects(v0)),BL))))),place(objectOf(head(objects(v0))),Anchor(head(__cse0),Center)),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,18,4,0,"(lambda v0:SceneT. let __cse0=tail(sortBy((lambda key:PlacedT. y(Anchor(key,BL))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(Anchor(head(tail(__cse0)),TL),Anchor(head(__cse0),TL))))),place(objectOf(head(objects(v0))),Anchor(head(__cse0),Center)),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,18,4,0,"(lambda v0:SceneT. let __cse0=tail(sortBy((lambda key:PlacedT. y(Anchor(key,BL))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(Anchor(head(tail(__cse0)),TL),Anchor(head(__cse0),TR))))),place(objectOf(head(objects(v0))),Anchor(head(__cse0),Center)),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,0,"(lambda v0:SceneT. let __cse0=tail(sortBy((lambda key:PlacedT. y(Anchor(key,BL))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(head(__cse0),TL),coordDelta(Anchor(fst(v1),Center),Anchor(head(objects(v0)),BL))))),place(objectOf(head(objects(v0))),Anchor(head(__cse0),Center)),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,0,"(lambda v0:SceneT. let __cse0=tail(sortBy((lambda key:PlacedT. y(Anchor(key,BL))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(head(__cse0),TR),coordDelta(Anchor(fst(v1),Center),Anchor(head(objects(v0)),BL))))),place(objectOf(head(objects(v0))),Anchor(head(__cse0),Center)),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,18,4,0,"(lambda v0:SceneT. let __cse0=tail(sortBy((lambda key:PlacedT. y(Anchor(key,BL))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(head(tail(__cse0)),Center),coordDelta(Anchor(fst(v1),Center),Anchor(head(__cse0),BL))))),place(objectOf(head(objects(v0))),Anchor(head(__cse0),Center)),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,18,4,0,"(lambda v0:SceneT. let __cse0=tail(sortBy((lambda key:PlacedT. y(Anchor(key,BL))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(head(tail(__cse0)),TL),coordDelta(Anchor(fst(v1),Center),Anchor(head(__cse0),TL))))),place(objectOf(head(objects(v0))),Anchor(head(__cse0),Center)),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,18,4,0,"(lambda v0:SceneT. let __cse0=tail(sortBy((lambda key:PlacedT. y(Anchor(key,BL))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(head(tail(__cse0)),TL),coordDelta(Anchor(fst(v1),Center),Anchor(head(__cse0),TR))))),place(objectOf(head(objects(v0))),Anchor(head(__cse0),Center)),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,0,"(lambda v0:SceneT. let __cse0=tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(Anchor(head(__cse0),Center),Anchor(head(objects(v0)),BL))))),place(objectOf(head(objects(v0))),Anchor(head(__cse0),TL)),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,0,"(lambda v0:SceneT. let __cse0=tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(Anchor(head(__cse0),Center),Anchor(head(objects(v0)),BL))))),place(objectOf(head(objects(v0))),Anchor(head(__cse0),TR)),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,0,"(lambda v0:SceneT. let __cse0=tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(Anchor(head(__cse0),TL),Anchor(head(objects(v0)),BL))))),place(objectOf(head(objects(v0))),Anchor(head(__cse0),Center)),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,0,"(lambda v0:SceneT. let __cse0=tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(Anchor(head(__cse0),TR),Anchor(head(objects(v0)),BL))))),place(objectOf(head(objects(v0))),Anchor(head(__cse0),Center)),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,18,4,0,"(lambda v0:SceneT. let __cse0=tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(Anchor(head(tail(__cse0)),TL),Anchor(head(__cse0),TL))))),place(objectOf(head(objects(v0))),Anchor(head(__cse0),Center)),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,18,4,0,"(lambda v0:SceneT. let __cse0=tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(Anchor(head(tail(__cse0)),TL),Anchor(head(__cse0),TR))))),place(objectOf(head(objects(v0))),Anchor(head(__cse0),Center)),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,0,"(lambda v0:SceneT. let __cse0=tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(head(__cse0),TL),coordDelta(Anchor(fst(v1),Center),Anchor(head(objects(v0)),BL))))),place(objectOf(head(objects(v0))),Anchor(head(__cse0),Center)),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,0,"(lambda v0:SceneT. let __cse0=tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(head(__cse0),TR),coordDelta(Anchor(fst(v1),Center),Anchor(head(objects(v0)),BL))))),place(objectOf(head(objects(v0))),Anchor(head(__cse0),Center)),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,18,4,0,"(lambda v0:SceneT. let __cse0=tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(head(tail(__cse0)),Center),coordDelta(Anchor(fst(v1),Center),Anchor(head(__cse0),BL))))),place(objectOf(head(objects(v0))),Anchor(head(__cse0),Center)),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,18,4,0,"(lambda v0:SceneT. let __cse0=tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(head(tail(__cse0)),TL),coordDelta(Anchor(fst(v1),Center),Anchor(head(__cse0),TL))))),place(objectOf(head(objects(v0))),Anchor(head(__cse0),Center)),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,18,4,0,"(lambda v0:SceneT. let __cse0=tail(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(head(tail(__cse0)),TL),coordDelta(Anchor(fst(v1),Center),Anchor(head(__cse0),TR))))),place(objectOf(head(objects(v0))),Anchor(head(__cse0),Center)),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,0,"(lambda v0:SceneT. let __cse0=tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(Anchor(head(__cse0),Center),Anchor(head(objects(v0)),BL))))),place(objectOf(head(objects(v0))),Anchor(head(__cse0),TL)),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,0,"(lambda v0:SceneT. let __cse0=tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(Anchor(head(__cse0),Center),Anchor(head(objects(v0)),BL))))),place(objectOf(head(objects(v0))),Anchor(head(__cse0),TR)),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,0,"(lambda v0:SceneT. let __cse0=tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(Anchor(head(__cse0),TL),Anchor(head(objects(v0)),BL))))),place(objectOf(head(objects(v0))),Anchor(head(__cse0),Center)),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,0,"(lambda v0:SceneT. let __cse0=tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(Anchor(head(__cse0),TR),Anchor(head(objects(v0)),BL))))),place(objectOf(head(objects(v0))),Anchor(head(__cse0),Center)),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,18,4,0,"(lambda v0:SceneT. let __cse0=tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(Anchor(head(tail(__cse0)),TL),Anchor(head(__cse0),TL))))),place(objectOf(head(objects(v0))),Anchor(head(__cse0),Center)),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,18,4,0,"(lambda v0:SceneT. let __cse0=tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(Anchor(head(tail(__cse0)),TL),Anchor(head(__cse0),TR))))),place(objectOf(head(objects(v0))),Anchor(head(__cse0),Center)),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,0,"(lambda v0:SceneT. let __cse0=tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(head(__cse0),TL),coordDelta(Anchor(fst(v1),Center),Anchor(head(objects(v0)),BL))))),place(objectOf(head(objects(v0))),Anchor(head(__cse0),Center)),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,0,"(lambda v0:SceneT. let __cse0=tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(head(__cse0),TR),coordDelta(Anchor(fst(v1),Center),Anchor(head(objects(v0)),BL))))),place(objectOf(head(objects(v0))),Anchor(head(__cse0),Center)),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,18,4,0,"(lambda v0:SceneT. let __cse0=tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(head(tail(__cse0)),Center),coordDelta(Anchor(fst(v1),Center),Anchor(head(__cse0),BL))))),place(objectOf(head(objects(v0))),Anchor(head(__cse0),Center)),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,18,4,0,"(lambda v0:SceneT. let __cse0=tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(head(tail(__cse0)),TL),coordDelta(Anchor(fst(v1),Center),Anchor(head(__cse0),TL))))),place(objectOf(head(objects(v0))),Anchor(head(__cse0),Center)),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(68,18,4,0,"(lambda v0:SceneT. let __cse0=tail(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(head(tail(__cse0)),TL),coordDelta(Anchor(fst(v1),Center),Anchor(head(__cse0),TR))))),place(objectOf(head(objects(v0))),Anchor(head(__cse0),Center)),__cse0)))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(objects(v0))),Center),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))),BL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(objects(v0))),Center),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))),BR))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(objects(v0))),Center),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))),Center))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(objects(v0))),Center),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))),TL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(objects(v0))),Center),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))),TR))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(objects(v0))),Center),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))),BL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(objects(v0))),Center),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))),BR))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(objects(v0))),Center),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))),Center))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(objects(v0))),Center),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))),TL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(objects(v0))),Center),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))),TR))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(objects(v0))),Center),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))),BL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(objects(v0))),Center),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))),BR))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(objects(v0))),Center),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))),Center))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(objects(v0))),Center),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))),TL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(objects(v0))),Center),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))),TR))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(objects(v0))),Center),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))),BL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(objects(v0))),Center),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))),BR))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(objects(v0))),Center),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))),Center))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(objects(v0))),Center),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))),TL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(objects(v0))),Center),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))),TR))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(objects(v0))),Center),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))),BL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(objects(v0))),Center),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))),BR))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(objects(v0))),Center),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))),Center))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(objects(v0))),Center),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))),TL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(objects(v0))),Center),coordDelta(Anchor(v1,TL),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))),TR))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)))),Center))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)))),TL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)))),TR))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)))),Center))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)))),TL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)))),TR))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0)))),Center))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0)))),TL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0)))),TR))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)))),Center))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)))),TL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)))),TR))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)))),Center))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)))),TL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)))),TR))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)))),Center))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)))),TL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(head(tail(tail(objects(v0)))),TL),coordDelta(Anchor(v1,TL),Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)))),TR))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(objects(v0))),Center),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))),BL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(objects(v0))),Center),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))),BR))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(objects(v0))),Center),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))),Center))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(objects(v0))),Center),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))),TL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(objects(v0))),Center),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))),TR))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(objects(v0))),Center),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))),BL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(objects(v0))),Center),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))),BR))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(objects(v0))),Center),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))),Center))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(objects(v0))),Center),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))),TL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(objects(v0))),Center),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))),TR))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(objects(v0))),Center),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))),BL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(objects(v0))),Center),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))),BR))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(objects(v0))),Center),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))),Center))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(objects(v0))),Center),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))),TL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(objects(v0))),Center),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0))))),TR))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(objects(v0))),Center),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))),BL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(objects(v0))),Center),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))),BR))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(objects(v0))),Center),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))),Center))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(objects(v0))),Center),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))),TL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(objects(v0))),Center),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))),TR))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(objects(v0))),Center),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))),BL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(objects(v0))),Center),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))),BR))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(objects(v0))),Center),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))),Center))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(objects(v0))),Center),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))),TL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(objects(v0))),Center),Anchor(head(tail(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))))),TR))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)))),Center))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)))),TL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)))),TR))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)))),Center))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)))),TL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)))),TR))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0)))),Center))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0)))),TL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0)))),TR))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)))),Center))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)))),TL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)))),TR))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)))),Center))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)))),TL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)))),TR))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)))),Center))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)))),TL))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(69,18,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coordAdd(Anchor(v1,TL),coordDelta(Anchor(head(tail(tail(objects(v0)))),TL),Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)))),TR))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(72,20,5,0,"(lambda v0:SceneT. let __cse0=Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))),Center) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(__cse0,Anchor(head(objects(v0)),BL))))),place(objectOf(head(objects(v0))),__cse0),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(72,20,5,0,"(lambda v0:SceneT. let __cse0=Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))),Center) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(Anchor(fst(v1),Center),Anchor(head(objects(v0)),BL))))),place(objectOf(head(objects(v0))),__cse0),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(72,20,5,0,"(lambda v0:SceneT. let __cse0=Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))),TL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(__cse0,Anchor(head(objects(v0)),BL))))),place(objectOf(head(objects(v0))),__cse0),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(72,20,5,0,"(lambda v0:SceneT. let __cse0=Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))),TL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(Anchor(fst(v1),Center),Anchor(head(objects(v0)),BL))))),place(objectOf(head(objects(v0))),__cse0),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(72,20,5,0,"(lambda v0:SceneT. let __cse0=Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))),TR) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(__cse0,Anchor(head(objects(v0)),BL))))),place(objectOf(head(objects(v0))),__cse0),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(72,20,5,0,"(lambda v0:SceneT. let __cse0=Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))),TR) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(Anchor(fst(v1),Center),Anchor(head(objects(v0)),BL))))),place(objectOf(head(objects(v0))),__cse0),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(71,19,5,0,"(lambda v0:SceneT. let __cse0=Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BL)))),objects(v0)))),Center) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(__cse0,Anchor(head(objects(v0)),BL))))),place(objectOf(head(objects(v0))),__cse0),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(71,19,5,0,"(lambda v0:SceneT. let __cse0=Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BL)))),objects(v0)))),Center) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(__cse0,coordDelta(Anchor(fst(v1),Center),Anchor(head(objects(v0)),BL))))),place(objectOf(head(objects(v0))),__cse0),tail(objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(71,19,5,0,"(lambda v0:SceneT. let __cse0=Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BL)))),objects(v0)))),TL) in mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. place(objectOf(snd(v1)),coordAdd(Anchor(fst(v1),Center),coordDelta(__cse0,Anchor(head(objects(v0)),BL))))),place(objectOf(head(objects(v0))),__cse0),tail(objects(v0)))))")
```
