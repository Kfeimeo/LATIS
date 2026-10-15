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
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,8)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,7)]
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
MRV immediate domains=[(0,5),(1,8)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,5),(1,0)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,5),(1,0)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,5),(1,0)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,8)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,8)]
MRV immediate domains=[(0,5),(1,8)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,76),(1,45)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=131 children=[130,53]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,76),(1,45)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=255 children=[254,177]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,61),(1,45)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=364 children=[363,301]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,45)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=457 children=[410,456]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,45)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=550 children=[503,549]; conditional scalar inverse (observed operand; remaining values deduced)
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,61),(1,45)]
Nonempty VS_subtract node=552 children=[363,53]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,76),(1,45)]
Nonempty VS_subtract node=553 children=[130,177]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,31),(1,45)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=586 children=[585,301]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,45)]
Nonempty VS_subtract node=587 children=[503,456]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,45)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_multiply node=634 children=[633,177]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,45)]
Nonempty VS_multiply node=635 children=[177,633]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,45)]
Nonempty VS_subtract node=636 children=[410,633]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,45)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=683 children=[682,549]; conditional scalar inverse (observed operand; remaining values deduced)
Nonempty VS_vec node=685 children=[551,684]; component projection of output specification
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,75)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,45),(1,61)]
Nonempty VS_coord node=686 children=[410,363]; component projection of output specification
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=763 children=[686,762]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,30)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,9),(1,1)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,30)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,9),(1,1)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,15)]
Learn(CoordT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,9),(1,1)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_Translate node=768 children=[7,767]; Translate: v_i=Anchor(target_i,TL)-Anchor(source_i,TL); Vec specification=[Vec 1 2,Vec 1 2,Vec 1 2,Vec 2 3,Vec 2 3,Vec 2 3]
Nonempty VS_lambda node=769 children=[768]; function graph -> parameter binding and output points
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_map node=778 children=[769,777]; map witness: corresponding f(x_i)=y_i; element instances=6
MRV immediate domains=[(0,1),(1,1),(2,7)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,1)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,1),(1,17)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,5),(1,8)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,5),(1,0)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,5),(1,0)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,5),(1,0)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,8)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,8)]
MRV immediate domains=[(0,5),(1,8)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,76),(1,45)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=780 children=[130,53]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,76),(1,45)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=781 children=[254,177]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,61),(1,45)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=782 children=[363,301]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,45)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=783 children=[410,456]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,45)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=784 children=[503,549]; conditional scalar inverse (observed operand; remaining values deduced)
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,61),(1,45)]
Nonempty VS_subtract node=786 children=[363,53]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,76),(1,45)]
Nonempty VS_subtract node=787 children=[130,177]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,31),(1,45)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=788 children=[585,301]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,45)]
Nonempty VS_subtract node=789 children=[503,456]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,45)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_multiply node=790 children=[633,177]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,45)]
Nonempty VS_multiply node=791 children=[177,633]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,45)]
Nonempty VS_subtract node=792 children=[410,633]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,45)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=793 children=[682,549]; conditional scalar inverse (observed operand; remaining values deduced)
Nonempty VS_vec node=795 children=[785,794]; component projection of output specification
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,75)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,45),(1,61)]
Nonempty VS_coord node=796 children=[410,363]; component projection of output specification
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=797 children=[796,762]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,30)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,9),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,30)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,9),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,15)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,9),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_Translate node=799 children=[779,798]; Translate: v_i=Anchor(target_i,TL)-Anchor(source_i,TL); Vec specification=[Vec 1 2,Vec 1 2,Vec 2 3,Vec 2 3]
Nonempty VS_lambda node=800 children=[799]; function graph -> parameter binding and output points
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,15),(1,17)]
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,5),(1,8)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,76),(1,45)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=817 children=[130,53]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,76),(1,45)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=818 children=[254,177]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,61),(1,45)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=819 children=[363,301]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,45)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=820 children=[410,456]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,45)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=821 children=[503,549]; conditional scalar inverse (observed operand; remaining values deduced)
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,61),(1,45)]
Nonempty VS_subtract node=823 children=[363,53]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,76),(1,45)]
Nonempty VS_subtract node=824 children=[130,177]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,31),(1,45)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=825 children=[585,301]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,45)]
Nonempty VS_subtract node=826 children=[503,456]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,45)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_multiply node=827 children=[633,177]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,45)]
Nonempty VS_multiply node=828 children=[177,633]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,45)]
Nonempty VS_subtract node=829 children=[410,633]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,45)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=830 children=[682,549]; conditional scalar inverse (observed operand; remaining values deduced)
Nonempty VS_coord node=832 children=[822,831]; component projection of output specification
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=836 children=[832,835]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,5),(1,0)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,5),(1,0)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,5),(1,0)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,8)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
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
MRV immediate domains=[(0,5),(1,8)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,76),(1,45)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=817 children=[130,53]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,76),(1,45)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=818 children=[254,177]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,61),(1,45)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=819 children=[363,301]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,45)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=820 children=[410,456]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,45)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=821 children=[503,549]; conditional scalar inverse (observed operand; remaining values deduced)
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,61),(1,45)]
Nonempty VS_subtract node=823 children=[363,53]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,76),(1,45)]
Nonempty VS_subtract node=824 children=[130,177]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,31),(1,45)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=825 children=[585,301]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,45)]
Nonempty VS_subtract node=826 children=[503,456]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,45)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_multiply node=827 children=[633,177]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,45)]
Nonempty VS_multiply node=828 children=[177,633]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,45)]
Nonempty VS_subtract node=829 children=[410,633]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,45)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=830 children=[682,549]; conditional scalar inverse (observed operand; remaining values deduced)
Nonempty VS_vec node=837 children=[822,831]; component projection of output specification
MRV immediate domains=[(0,1),(1,75)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,45),(1,61)]
Nonempty VS_coord node=838 children=[410,363]; component projection of output specification
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=839 children=[838,762]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,30)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,9),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,45),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=841 children=[503,840]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=843 children=[503,842]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=845 children=[410,844]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,16)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=863 children=[682,862]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,16),(1,45)]
Nonempty VS_add node=864 children=[862,682]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=866 children=[410,865]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=868 children=[682,867]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,45)]
Nonempty VS_multiply node=869 children=[549,301]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,45)]
Nonempty VS_multiply node=870 children=[301,549]; conditional scalar inverse (observed operand; remaining values deduced)
Nonempty VS_coord node=872 children=[871,764]; component projection of output specification
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=904 children=[872,903]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,30)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,9),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_coord node=905 children=[871,765]; component projection of output specification
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=937 children=[905,936]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,15)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,9),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_coord node=938 children=[871,766]; component projection of output specification
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=955 children=[938,954]; coordinate/vector inverse: condition on right operand and deduce left component specification
Nonempty VS_Translate node=957 children=[816,956]; Translate: v_i=Anchor(target_i,TL)-Anchor(source_i,TL); Vec specification=[Vec 1 2,Vec 2 3]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_scan node=966 children=[800,957,965]; scan witness: output head is seed; ((y_(i-1),x_i),y_i)=[(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 12, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 4, cy = 4}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 5, cy = 6}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 5, cy = 6}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3)], orientation = 0})) (PlacedV (Object {objectId = 0, position = Coord {cx = 2, cy = 3}, geometry = fromList [(Coord {cx = 0, cy = 0},1)], orientation = 0})),PlacedV (Object {objectId = 0, position = Coord {cx = 3, cy = 5}, geometry = fromList [(Coord {cx = 0, cy = 0},1)], orientation = 0})),(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 15, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 7, cy = 4}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 9, cy = 7}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 9, cy = 7}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3)], orientation = 0})) (PlacedV (Object {objectId = 0, position = Coord {cx = 4, cy = 2}, geometry = fromList [(Coord {cx = 0, cy = 0},1)], orientation = 0})),PlacedV (Object {objectId = 0, position = Coord {cx = 6, cy = 5}, geometry = fromList [(Coord {cx = 0, cy = 0},1)], orientation = 0}))]; includes-seed convention; no task classifier
Nonempty VS_mkScene node=968 children=[3,6,967]; mkScene residual: canonical correspondence + Render-validated paint order; branch=0
MRV immediate domains=[(0,2),(1,3),(2,4)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,8)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_map node=978 children=[769,977]; map witness: corresponding f(x_i)=y_i; element instances=6
MRV immediate domains=[(0,1),(1,1),(2,8)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,1)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,1),(1,17)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,5),(1,8)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,5),(1,0)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,5),(1,0)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,5),(1,0)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,8)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,8)]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,5),(1,8)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,76),(1,45)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=780 children=[130,53]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,76),(1,45)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=781 children=[254,177]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,61),(1,45)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=782 children=[363,301]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,45)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=783 children=[410,456]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,45)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=784 children=[503,549]; conditional scalar inverse (observed operand; remaining values deduced)
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,61),(1,45)]
Nonempty VS_subtract node=786 children=[363,53]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,76),(1,45)]
Nonempty VS_subtract node=787 children=[130,177]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,31),(1,45)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=788 children=[585,301]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,45)]
Nonempty VS_subtract node=789 children=[503,456]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,45)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_multiply node=790 children=[633,177]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,45)]
Nonempty VS_multiply node=791 children=[177,633]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,45)]
Nonempty VS_subtract node=792 children=[410,633]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,45),(1,45)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=793 children=[682,549]; conditional scalar inverse (observed operand; remaining values deduced)
Nonempty VS_vec node=795 children=[785,794]; component projection of output specification
MRV immediate domains=[(0,1),(1,3)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,2)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,0),(1,0)]
MRV immediate domains=[(0,1),(1,75)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,45),(1,61)]
Nonempty VS_coord node=796 children=[410,363]; component projection of output specification
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=797 children=[796,762]; coordinate/vector inverse: condition on right operand and deduce left component specification
MRV immediate domains=[(0,1),(1,30)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,9),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,30)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,9),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,15)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,9),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_Translate node=799 children=[779,798]; Translate: v_i=Anchor(target_i,TL)-Anchor(source_i,TL); Vec specification=[Vec 1 2,Vec 1 2,Vec 2 3,Vec 2 3]
Nonempty VS_lambda node=800 children=[799]; function graph -> parameter binding and output points
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,15),(1,17)]
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Nonempty VS_Translate node=995 children=[994,956]; Translate: v_i=Anchor(target_i,TL)-Anchor(source_i,TL); Vec specification=[Vec 1 2,Vec 2 3]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_scan node=1005 children=[800,995,1004]; scan witness: output head is seed; ((y_(i-1),x_i),y_i)=[(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 3, cy = 5}, geometry = fromList [(Coord {cx = 0, cy = 0},1)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 4, cy = 4}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 5, cy = 6}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 5, cy = 6}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 11, cy = 8}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 12, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6)], orientation = 0})),(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 6, cy = 5}, geometry = fromList [(Coord {cx = 0, cy = 0},1)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 7, cy = 4}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 9, cy = 7}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 9, cy = 7}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 13, cy = 7}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 15, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6)], orientation = 0}))]; includes-seed convention; no task classifier
MRV immediate domains=[(0,1),(1,7)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,7)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
Nonempty VS_mkScene node=1007 children=[3,6,1006]; mkScene residual: canonical correspondence + Render-validated paint order; branch=0
Nonempty VS_lambda node=1009 children=[1008]; function graph -> parameter binding and output points
Task TSL supported Base=["Anchor","ObjectCells","ObjectColors","Translate","add","background","canvasSize","cardinality","colorToInt","coord","coordDelta","head","index","lambda","literal","map","mkScene","multiply","objectOf","objects","scan","setToList","snd","sortBy","subtract","tail","vec","x","y"]
Cost saturation C=1..20 root representatives=[(1,0),(2,0),(3,0),(4,0),(5,0),(6,0),(7,0),(8,0),(9,0),(10,0),(11,0),(12,0),(13,0),(14,0),(15,0),(16,0),(17,0),(18,0),(19,0),(20,0)]
Abstraction round=0; exact frontier=45; accepted=["I0","I1","I2","I3","I4","I5"]
Task TSL supported Base=["Anchor","ObjectCells","ObjectColors","Translate","add","background","canvasSize","cardinality","colorToInt","coord","coordDelta","head","index","lambda","literal","map","mkScene","multiply","objectOf","objects","scan","setToList","snd","sortBy","subtract","tail","vec","x","y"]
Abstraction round=1; exact frontier=45; accepted=[]
Cost saturation C=1..20 root representatives=[(1,0),(2,0),(3,0),(4,0),(5,0),(6,0),(7,0),(8,0),(9,0),(10,0),(11,0),(12,0),(13,0),(14,0),(15,0),(16,0),(17,0),(18,0),(19,0),(20,0)]
Exact original Render(P(Encode(x)))=y: True; MDL rank=(47,12,3,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 30, gridHeight = 30}),ColorV 0,map((lambda v1:PlacedT. let __cse0=y(Anchor(head(objects(v0)),BL)) in Translate(v1,vec(subtract(IntV 4,__cse0),subtract(IntV 5,__cse0)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(47,12,3,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 30, gridHeight = 30}),ColorV 0,map((lambda v1:PlacedT. let __cse0=y(Anchor(head(objects(v0)),Center)) in Translate(v1,vec(subtract(IntV 4,__cse0),subtract(IntV 5,__cse0)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(47,12,3,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 30, gridHeight = 30}),ColorV 0,map((lambda v1:PlacedT. let __cse0=y(Anchor(head(objects(v0)),TL)) in Translate(v1,vec(subtract(IntV 4,__cse0),subtract(IntV 5,__cse0)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,16,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 30, gridHeight = 30}),ColorV 0,map((lambda v1:PlacedT. let __cse0=y(Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),BL)) in Translate(v1,vec(subtract(IntV 4,__cse0),subtract(IntV 5,__cse0)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,16,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 30, gridHeight = 30}),ColorV 0,map((lambda v1:PlacedT. let __cse0=y(Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),Center)) in Translate(v1,vec(subtract(IntV 4,__cse0),subtract(IntV 5,__cse0)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(58,16,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 30, gridHeight = 30}),ColorV 0,map((lambda v1:PlacedT. let __cse0=y(Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),TL)) in Translate(v1,vec(subtract(IntV 4,__cse0),subtract(IntV 5,__cse0)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 30, gridHeight = 30}),ColorV 0,map((lambda v1:PlacedT. let __cse0=y(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))),BL)) in Translate(v1,vec(subtract(IntV 4,__cse0),subtract(IntV 5,__cse0)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 30, gridHeight = 30}),ColorV 0,map((lambda v1:PlacedT. let __cse0=y(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))),Center)) in Translate(v1,vec(subtract(IntV 4,__cse0),subtract(IntV 5,__cse0)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 30, gridHeight = 30}),ColorV 0,map((lambda v1:PlacedT. let __cse0=y(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))),TL)) in Translate(v1,vec(subtract(IntV 4,__cse0),subtract(IntV 5,__cse0)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 30, gridHeight = 30}),ColorV 0,map((lambda v1:PlacedT. let __cse0=y(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),BL)) in Translate(v1,vec(subtract(IntV 4,__cse0),subtract(IntV 5,__cse0)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 30, gridHeight = 30}),ColorV 0,map((lambda v1:PlacedT. let __cse0=y(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),Center)) in Translate(v1,vec(subtract(IntV 4,__cse0),subtract(IntV 5,__cse0)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 30, gridHeight = 30}),ColorV 0,map((lambda v1:PlacedT. let __cse0=y(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),TL)) in Translate(v1,vec(subtract(IntV 4,__cse0),subtract(IntV 5,__cse0)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 30, gridHeight = 30}),ColorV 0,map((lambda v1:PlacedT. let __cse0=y(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))),BL)) in Translate(v1,vec(subtract(IntV 4,__cse0),subtract(IntV 5,__cse0)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 30, gridHeight = 30}),ColorV 0,map((lambda v1:PlacedT. let __cse0=y(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))),Center)) in Translate(v1,vec(subtract(IntV 4,__cse0),subtract(IntV 5,__cse0)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(56,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 30, gridHeight = 30}),ColorV 0,map((lambda v1:PlacedT. let __cse0=y(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))),TL)) in Translate(v1,vec(subtract(IntV 4,__cse0),subtract(IntV 5,__cse0)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(55,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 30, gridHeight = 30}),ColorV 0,map((lambda v1:PlacedT. let __cse0=y(Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,BL))),objects(v0))),BL)) in Translate(v1,vec(subtract(IntV 4,__cse0),subtract(IntV 5,__cse0)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(55,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 30, gridHeight = 30}),ColorV 0,map((lambda v1:PlacedT. let __cse0=y(Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,BL))),objects(v0))),Center)) in Translate(v1,vec(subtract(IntV 4,__cse0),subtract(IntV 5,__cse0)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(55,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 30, gridHeight = 30}),ColorV 0,map((lambda v1:PlacedT. let __cse0=y(Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,BL))),objects(v0))),TL)) in Translate(v1,vec(subtract(IntV 4,__cse0),subtract(IntV 5,__cse0)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(55,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 30, gridHeight = 30}),ColorV 0,map((lambda v1:PlacedT. let __cse0=y(Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))),BL)) in Translate(v1,vec(subtract(IntV 4,__cse0),subtract(IntV 5,__cse0)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(55,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 30, gridHeight = 30}),ColorV 0,map((lambda v1:PlacedT. let __cse0=y(Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))),Center)) in Translate(v1,vec(subtract(IntV 4,__cse0),subtract(IntV 5,__cse0)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(55,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 30, gridHeight = 30}),ColorV 0,map((lambda v1:PlacedT. let __cse0=y(Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0))),TL)) in Translate(v1,vec(subtract(IntV 4,__cse0),subtract(IntV 5,__cse0)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(55,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 30, gridHeight = 30}),ColorV 0,map((lambda v1:PlacedT. let __cse0=y(Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))),BL)) in Translate(v1,vec(subtract(IntV 4,__cse0),subtract(IntV 5,__cse0)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(55,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 30, gridHeight = 30}),ColorV 0,map((lambda v1:PlacedT. let __cse0=y(Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))),Center)) in Translate(v1,vec(subtract(IntV 4,__cse0),subtract(IntV 5,__cse0)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(55,13,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 30, gridHeight = 30}),ColorV 0,map((lambda v1:PlacedT. let __cse0=y(Anchor(head(sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0))),TL)) in Translate(v1,vec(subtract(IntV 4,__cse0),subtract(IntV 5,__cse0)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,17,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 30, gridHeight = 30}),ColorV 0,map((lambda v1:PlacedT. let __cse0=y(Anchor(index(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),IntV 1),BL)) in Translate(v1,vec(subtract(IntV 4,__cse0),subtract(IntV 5,__cse0)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,17,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 30, gridHeight = 30}),ColorV 0,map((lambda v1:PlacedT. let __cse0=y(Anchor(index(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),IntV 1),Center)) in Translate(v1,vec(subtract(IntV 4,__cse0),subtract(IntV 5,__cse0)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(63,17,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 30, gridHeight = 30}),ColorV 0,map((lambda v1:PlacedT. let __cse0=y(Anchor(index(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),IntV 1),TL)) in Translate(v1,vec(subtract(IntV 4,__cse0),subtract(IntV 5,__cse0)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,15,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 30, gridHeight = 30}),ColorV 0,map((lambda v1:PlacedT. let __cse0=y(Anchor(index(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BL)))),objects(v0))),IntV 1),BL)) in Translate(v1,vec(subtract(IntV 4,__cse0),subtract(IntV 5,__cse0)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,15,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 30, gridHeight = 30}),ColorV 0,map((lambda v1:PlacedT. let __cse0=y(Anchor(index(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BL)))),objects(v0))),IntV 1),Center)) in Translate(v1,vec(subtract(IntV 4,__cse0),subtract(IntV 5,__cse0)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,15,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 30, gridHeight = 30}),ColorV 0,map((lambda v1:PlacedT. let __cse0=y(Anchor(index(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BL)))),objects(v0))),IntV 1),TL)) in Translate(v1,vec(subtract(IntV 4,__cse0),subtract(IntV 5,__cse0)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,15,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 30, gridHeight = 30}),ColorV 0,map((lambda v1:PlacedT. let __cse0=y(Anchor(index(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))),IntV 1),BL)) in Translate(v1,vec(subtract(IntV 4,__cse0),subtract(IntV 5,__cse0)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,15,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 30, gridHeight = 30}),ColorV 0,map((lambda v1:PlacedT. let __cse0=y(Anchor(index(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))),IntV 1),Center)) in Translate(v1,vec(subtract(IntV 4,__cse0),subtract(IntV 5,__cse0)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,15,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 30, gridHeight = 30}),ColorV 0,map((lambda v1:PlacedT. let __cse0=y(Anchor(index(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))),IntV 1),TL)) in Translate(v1,vec(subtract(IntV 4,__cse0),subtract(IntV 5,__cse0)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,15,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 30, gridHeight = 30}),ColorV 0,map((lambda v1:PlacedT. let __cse0=y(Anchor(index(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))),IntV 1),BL)) in Translate(v1,vec(subtract(IntV 4,__cse0),subtract(IntV 5,__cse0)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,15,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 30, gridHeight = 30}),ColorV 0,map((lambda v1:PlacedT. let __cse0=y(Anchor(index(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))),IntV 1),Center)) in Translate(v1,vec(subtract(IntV 4,__cse0),subtract(IntV 5,__cse0)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(61,15,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 30, gridHeight = 30}),ColorV 0,map((lambda v1:PlacedT. let __cse0=y(Anchor(index(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))),IntV 1),TL)) in Translate(v1,vec(subtract(IntV 4,__cse0),subtract(IntV 5,__cse0)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 30, gridHeight = 30}),ColorV 0,map((lambda v1:PlacedT. let __cse0=y(Anchor(index(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BL)))),objects(v0))),IntV 1),BL)) in Translate(v1,vec(subtract(IntV 4,__cse0),subtract(IntV 5,__cse0)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 30, gridHeight = 30}),ColorV 0,map((lambda v1:PlacedT. let __cse0=y(Anchor(index(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BL)))),objects(v0))),IntV 1),Center)) in Translate(v1,vec(subtract(IntV 4,__cse0),subtract(IntV 5,__cse0)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 30, gridHeight = 30}),ColorV 0,map((lambda v1:PlacedT. let __cse0=y(Anchor(index(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BL)))),objects(v0))),IntV 1),TL)) in Translate(v1,vec(subtract(IntV 4,__cse0),subtract(IntV 5,__cse0)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 30, gridHeight = 30}),ColorV 0,map((lambda v1:PlacedT. let __cse0=y(Anchor(index(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))),IntV 1),BL)) in Translate(v1,vec(subtract(IntV 4,__cse0),subtract(IntV 5,__cse0)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 30, gridHeight = 30}),ColorV 0,map((lambda v1:PlacedT. let __cse0=y(Anchor(index(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))),IntV 1),Center)) in Translate(v1,vec(subtract(IntV 4,__cse0),subtract(IntV 5,__cse0)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 30, gridHeight = 30}),ColorV 0,map((lambda v1:PlacedT. let __cse0=y(Anchor(index(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))),IntV 1),TL)) in Translate(v1,vec(subtract(IntV 4,__cse0),subtract(IntV 5,__cse0)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 30, gridHeight = 30}),ColorV 0,map((lambda v1:PlacedT. let __cse0=y(Anchor(index(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))),IntV 1),BL)) in Translate(v1,vec(subtract(IntV 4,__cse0),subtract(IntV 5,__cse0)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 30, gridHeight = 30}),ColorV 0,map((lambda v1:PlacedT. let __cse0=y(Anchor(index(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))),IntV 1),Center)) in Translate(v1,vec(subtract(IntV 4,__cse0),subtract(IntV 5,__cse0)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(60,14,4,4,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 30, gridHeight = 30}),ColorV 0,map((lambda v1:PlacedT. let __cse0=y(Anchor(index(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0))),IntV 1),TL)) in Translate(v1,vec(subtract(IntV 4,__cse0),subtract(IntV 5,__cse0)))),objects(v0))))")
Selected AST; FV=[]; (lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 30, gridHeight = 30}),ColorV 0,map((lambda v1:PlacedT. let __cse0=y(Anchor(head(objects(v0)),BL)) in Translate(v1,vec(subtract(IntV 4,__cse0),subtract(IntV 5,__cse0)))),objects(v0))))
TaskInvented I0: (lambda __cse0:IntT. vec(subtract(IntV 4,__cse0),subtract(IntV 5,__cse0))); repeats=32; portfolio MDL saving=118
TaskInvented I1: (lambda v0:SceneT. sortBy((lambda __r1b0:PlacedT. cardinality(ObjectCells(objectOf(__r1b0)))),objects(v0))); repeats=3; portfolio MDL saving=4
TaskInvented I2: (lambda v0:SceneT. sortBy((lambda __r1b0:PlacedT. x(Anchor(__r1b0,BL))),objects(v0))); repeats=3; portfolio MDL saving=4
TaskInvented I3: (lambda v0:SceneT. sortBy((lambda __r1b0:PlacedT. x(Anchor(__r1b0,BR))),objects(v0))); repeats=3; portfolio MDL saving=4
TaskInvented I4: (lambda v0:SceneT. sortBy((lambda __r1b0:PlacedT. x(Anchor(__r1b0,Center))),objects(v0))); repeats=3; portfolio MDL saving=4
TaskInvented I5: (lambda v0:SceneT. sortBy((lambda __r1b0:PlacedT. y(Anchor(__r1b0,TL))),objects(v0))); repeats=3; portfolio MDL saving=4
Induced TSL=Signature(root VS) union inventions. BaseActivated=["Anchor","ObjectCells","ObjectColors","Translate","add","background","canvasSize","cardinality","colorToInt","coord","coordDelta","head","index","lambda","let","literal","map","mkScene","multiply","objectOf","objects","scan","setToList","snd","sortBy","subtract","tail","vec","x","y"]; TaskInvented=["I0","I1","I2","I3","I4","I5"]; StructuralPriorCount=0
```
