# LATIS v0.3R induced TSL trace

Only training IO enters Learn; test labels are evaluated after selection. StructuralPriorCount=0.

The root is a typed Scene -> Scene graph. Return-type filtering visits the entire Base registry. Effect checks restrict conditional witness input domains. Each witness produces child learning tasks; a rule is activated only after every child has a nonempty version space. No task classifier selects scan.

## Deduction and child specifications

```text
Root specification Q0: ArrowT SceneT SceneT; observations=2; Gamma=[]. Original Grid targets reserved for exact verification.
Learn(ArrowT SceneT SceneT; observations=2; Gamma=[]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,5)]
Learn(SceneT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","mkScene"]
MRV immediate domains=[(0,2),(1,3),(2,22)]
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
MRV immediate domains=[(0,1),(1,2)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,1)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,1),(1,1)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Learn(VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,5),(1,0)]
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
MRV immediate domains=[(0,1)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,1),(1,2)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,5),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=19 children=[11,14]; conditional scalar inverse (observed operand; remaining values deduced)
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,3),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=28 children=[25,22]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_multiply node=37 children=[31,34]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_multiply node=46 children=[40,43]; conditional scalar inverse (observed operand; remaining values deduced)
Nonempty VS_vec node=72 children=[47,19]; component projection of output specification
MRV immediate domains=[(0,1),(1,1)]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(CoordT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=75 children=[73,74]; conditional algebra witness; Anchor(fst(v1),BL) / Anchor(snd(v1),TL)
Nonempty VS_Translate node=102 children=[8,76]; Translate: v_i=Anchor(target_i,TL)-Anchor(source_i,TL); Vec specification=[Vec (-5) (-8),Vec (-10) (-5),Vec (-7) (-8),Vec (-12) (-6)]
Nonempty VS_lambda node=128 children=[102]; function graph -> parameter binding and output points
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,2),(1,3)]
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,32),(1,10)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=140 children=[134,137]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,2)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=149 children=[146,143]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,2)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=158 children=[155,152]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=169 children=[161,164]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_multiply node=178 children=[172,175]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_multiply node=187 children=[181,184]; conditional scalar inverse (observed operand; remaining values deduced)
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,3),(1,2)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=197 children=[194,191]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=202 children=[201,198]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=213 children=[205,208]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=224 children=[216,219]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,2)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=235 children=[230,227]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=246 children=[238,241]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=257 children=[249,252]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=268 children=[260,263]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=279 children=[271,274]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=290 children=[282,285]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,2)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=301 children=[296,293]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=312 children=[304,307]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=323 children=[315,318]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,2)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=334 children=[329,326]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,2)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=341 children=[335,338]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_multiply node=350 children=[344,347]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_multiply node=359 children=[353,356]; conditional scalar inverse (observed operand; remaining values deduced)
Nonempty VS_vec node=809 children=[360,188]; component projection of output specification
MRV immediate domains=[(0,2),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=818 children=[812,815]; conditional algebra witness; CoordV (Coord {cx = 0, cy = 0}) / Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),TL)
Nonempty VS_Translate node=884 children=[131,819]; Translate: v_i=Anchor(target_i,TL)-Anchor(source_i,TL); Vec specification=[Vec (-1) (-9),Vec (-2) (-11)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_scan node=1912 children=[128,884,887]; scan witness: output head is seed; ((y_(i-1),x_i),y_i)=[(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 0, cy = 0}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 5, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 0, cy = 2}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})),(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 0, cy = 2}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})) (PlacedV (Object {objectId = 0, position = Coord {cx = 10, cy = 8}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3),(Coord {cx = 0, cy = 2},3),(Coord {cx = 0, cy = 3},3)], orientation = 0})),PlacedV (Object {objectId = 0, position = Coord {cx = 0, cy = 3}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3),(Coord {cx = 0, cy = 2},3),(Coord {cx = 0, cy = 3},3)], orientation = 0})),(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 0, cy = 0}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4)], orientation = 0})) (PlacedV (Object {objectId = 0, position = Coord {cx = 7, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2)], orientation = 0})),PlacedV (Object {objectId = 0, position = Coord {cx = 0, cy = 1}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2)], orientation = 0})),(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 0, cy = 1}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 12, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 0, cy = 4}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6)], orientation = 0}))]; includes-seed convention; no task classifier
MRV immediate domains=[(0,1),(1,2),(2,1)]
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
MRV immediate domains=[(0,1),(1,2),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
Nonempty VS_mkScene node=1977 children=[3,6,1912]; mkScene residual: canonical correspondence + Render-validated paint order; branch=0
MRV immediate domains=[(0,2),(1,3),(2,22)]
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
MRV immediate domains=[(0,1),(1,2),(2,1)]
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
MRV immediate domains=[(0,1),(1,2),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,2),(1,3),(2,22)]
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
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,1)]
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,2)]
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,2)]
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,1)]
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,0),(2,1)]
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
Nonempty VS_lambda node=2022 children=[1977]; function graph -> parameter binding and output points
Exact original Render(P(Encode(x)))=y: True; MDL rank=(73,15,5,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),coordDelta(Anchor(fst(v1),BL),Anchor(snd(v1),TL)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),coordDelta(CoordV (Coord {cx = 0, cy = 0}),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),TL))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(73,15,5,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),coordDelta(Anchor(fst(v1),BL),Anchor(snd(v1),TL)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),coordDelta(CoordV (Coord {cx = 0, cy = 0}),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),TL))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(73,15,5,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),coordDelta(Anchor(fst(v1),BL),Anchor(snd(v1),TL)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),coordDelta(CoordV (Coord {cx = 0, cy = 0}),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))),TL))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(73,15,5,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),coordDelta(Anchor(fst(v1),BL),Anchor(snd(v1),TL)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),coordDelta(CoordV (Coord {cx = 0, cy = 0}),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))),TL))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(73,15,5,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),coordDelta(Anchor(fst(v1),BL),Anchor(snd(v1),TL)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))),coordDelta(CoordV (Coord {cx = 0, cy = 0}),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),TL))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(73,15,5,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),coordDelta(Anchor(fst(v1),BL),Anchor(snd(v1),TL)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))),coordDelta(CoordV (Coord {cx = 0, cy = 0}),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),TL))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(73,15,5,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),coordDelta(Anchor(fst(v1),BL),Anchor(snd(v1),TL)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))),coordDelta(CoordV (Coord {cx = 0, cy = 0}),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))),TL))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(73,15,5,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),coordDelta(Anchor(fst(v1),BL),Anchor(snd(v1),TL)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))),coordDelta(CoordV (Coord {cx = 0, cy = 0}),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))),TL))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,14,5,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),coordDelta(Anchor(fst(v1),BL),Anchor(snd(v1),TL)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),coordDelta(CoordV (Coord {cx = 0, cy = 0}),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),TL))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,14,5,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),coordDelta(Anchor(fst(v1),BL),Anchor(snd(v1),TL)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),coordDelta(CoordV (Coord {cx = 0, cy = 0}),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),TL))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,14,5,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),coordDelta(Anchor(fst(v1),BL),Anchor(snd(v1),TL)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),coordDelta(CoordV (Coord {cx = 0, cy = 0}),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))),TL))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,14,5,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),coordDelta(Anchor(fst(v1),BL),Anchor(snd(v1),TL)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),coordDelta(CoordV (Coord {cx = 0, cy = 0}),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))),TL))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,14,5,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),coordDelta(Anchor(fst(v1),BL),Anchor(snd(v1),TL)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))),coordDelta(CoordV (Coord {cx = 0, cy = 0}),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),TL))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,14,5,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),coordDelta(Anchor(fst(v1),BL),Anchor(snd(v1),TL)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))),coordDelta(CoordV (Coord {cx = 0, cy = 0}),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),TL))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,14,5,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),coordDelta(Anchor(fst(v1),BL),Anchor(snd(v1),TL)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))),coordDelta(CoordV (Coord {cx = 0, cy = 0}),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))),TL))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(75,14,5,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),coordDelta(Anchor(fst(v1),BL),Anchor(snd(v1),TL)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))),coordDelta(CoordV (Coord {cx = 0, cy = 0}),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))),TL))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(86,18,5,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),coordDelta(Anchor(fst(v1),BL),Anchor(snd(v1),TL)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),vec(subtract(IntV 10,y(Anchor(head(objects(v0)),BL))),subtract(IntV 0,y(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),TL))))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(86,18,5,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),coordDelta(Anchor(fst(v1),BL),Anchor(snd(v1),TL)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),vec(subtract(IntV 10,y(Anchor(head(objects(v0)),BL))),subtract(IntV 0,y(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),TL))))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(86,18,5,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),coordDelta(Anchor(fst(v1),BL),Anchor(snd(v1),TL)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),vec(subtract(IntV 10,y(Anchor(head(objects(v0)),BL))),subtract(IntV 0,y(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),TR))))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(86,18,5,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),coordDelta(Anchor(fst(v1),BL),Anchor(snd(v1),TL)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),vec(subtract(IntV 10,y(Anchor(head(objects(v0)),BL))),subtract(IntV 0,y(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),TR))))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(86,18,5,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),coordDelta(Anchor(fst(v1),BL),Anchor(snd(v1),TL)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),vec(subtract(IntV 10,y(Anchor(head(objects(v0)),BR))),subtract(IntV 0,y(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),TL))))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(86,18,5,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),coordDelta(Anchor(fst(v1),BL),Anchor(snd(v1),TL)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),vec(subtract(IntV 10,y(Anchor(head(objects(v0)),BR))),subtract(IntV 0,y(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),TL))))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(86,18,5,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),coordDelta(Anchor(fst(v1),BL),Anchor(snd(v1),TL)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),vec(subtract(IntV 10,y(Anchor(head(objects(v0)),BR))),subtract(IntV 0,y(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),TR))))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(86,18,5,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),coordDelta(Anchor(fst(v1),BL),Anchor(snd(v1),TL)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),vec(subtract(IntV 10,y(Anchor(head(objects(v0)),BR))),subtract(IntV 0,y(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),TR))))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(86,18,5,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),coordDelta(Anchor(fst(v1),BL),Anchor(snd(v1),TL)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))),vec(subtract(IntV 10,y(Anchor(head(objects(v0)),BL))),subtract(IntV 0,y(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),TL))))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(86,18,5,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),coordDelta(Anchor(fst(v1),BL),Anchor(snd(v1),TL)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))),vec(subtract(IntV 10,y(Anchor(head(objects(v0)),BL))),subtract(IntV 0,y(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),TL))))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(86,18,5,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),coordDelta(Anchor(fst(v1),BL),Anchor(snd(v1),TL)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))),vec(subtract(IntV 10,y(Anchor(head(objects(v0)),BL))),subtract(IntV 0,y(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),TR))))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(86,18,5,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),coordDelta(Anchor(fst(v1),BL),Anchor(snd(v1),TL)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))),vec(subtract(IntV 10,y(Anchor(head(objects(v0)),BL))),subtract(IntV 0,y(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),TR))))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(86,18,5,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),coordDelta(Anchor(fst(v1),BL),Anchor(snd(v1),TL)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))),vec(subtract(IntV 10,y(Anchor(head(objects(v0)),BR))),subtract(IntV 0,y(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),TL))))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(86,18,5,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),coordDelta(Anchor(fst(v1),BL),Anchor(snd(v1),TL)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))),vec(subtract(IntV 10,y(Anchor(head(objects(v0)),BR))),subtract(IntV 0,y(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),TL))))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(86,18,5,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),coordDelta(Anchor(fst(v1),BL),Anchor(snd(v1),TL)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))),vec(subtract(IntV 10,y(Anchor(head(objects(v0)),BR))),subtract(IntV 0,y(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),TR))))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(86,18,5,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),coordDelta(Anchor(fst(v1),BL),Anchor(snd(v1),TL)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))),vec(subtract(IntV 10,y(Anchor(head(objects(v0)),BR))),subtract(IntV 0,y(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),TR))))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))))))")
Selected AST; FV=[]; (lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),coordDelta(Anchor(fst(v1),BL),Anchor(snd(v1),TL)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),coordDelta(CoordV (Coord {cx = 0, cy = 0}),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),TL))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))
TaskInvented I0: (lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),coordDelta(Anchor(fst(v1),BL),Anchor(snd(v1),TL)))); repeats=32; portfolio MDL saving=337
Induced TSL=Signature(root VS) union inventions. BaseActivated=["Anchor","Translate","canvasSize","coordDelta","fst","head","lambda","literal","mkScene","objects","scan","snd","sortBy","subtract","tail","vec","x","y"]; TaskInvented=["I0"]; StructuralPriorCount=0

```

## Supported map / scan rules

```text
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
Nonempty VS_scan node=1912 children=[128,884,887]; scan witness: output head is seed; ((y_(i-1),x_i),y_i)=[(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 0, cy = 0}, geometry = fromList [(Coord {cx = 0, cy = 0},1),(Coord {cx = 0, cy = 1},1),(Coord {cx = 0, cy = 2},1),(Coord {cx = 1, cy = 0},1),(Coord {cx = 1, cy = 1},1),(Coord {cx = 1, cy = 2},1)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 5, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 0, cy = 2}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})),(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 0, cy = 2}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 2, cy = 0},2),(Coord {cx = 2, cy = 1},2)], orientation = 0})) (PlacedV (Object {objectId = 0, position = Coord {cx = 10, cy = 8}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3),(Coord {cx = 0, cy = 2},3),(Coord {cx = 0, cy = 3},3)], orientation = 0})),PlacedV (Object {objectId = 0, position = Coord {cx = 0, cy = 3}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3),(Coord {cx = 0, cy = 2},3),(Coord {cx = 0, cy = 3},3)], orientation = 0})),(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 0, cy = 0}, geometry = fromList [(Coord {cx = 0, cy = 0},4),(Coord {cx = 0, cy = 1},4),(Coord {cx = 1, cy = 0},4),(Coord {cx = 1, cy = 1},4),(Coord {cx = 2, cy = 0},4),(Coord {cx = 2, cy = 1},4)], orientation = 0})) (PlacedV (Object {objectId = 0, position = Coord {cx = 7, cy = 9}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2)], orientation = 0})),PlacedV (Object {objectId = 0, position = Coord {cx = 0, cy = 1}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2)], orientation = 0})),(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 0, cy = 1}, geometry = fromList [(Coord {cx = 0, cy = 0},2),(Coord {cx = 0, cy = 1},2),(Coord {cx = 0, cy = 2},2),(Coord {cx = 0, cy = 3},2),(Coord {cx = 1, cy = 0},2),(Coord {cx = 1, cy = 1},2),(Coord {cx = 1, cy = 2},2),(Coord {cx = 1, cy = 3},2)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 12, cy = 10}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 0, cy = 4}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6),(Coord {cx = 1, cy = 0},6),(Coord {cx = 1, cy = 1},6),(Coord {cx = 1, cy = 2},6)], orientation = 0}))]; includes-seed convention; no task classifier
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
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
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
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]

```

## Final expression and free-variable dependencies

```text
(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),coordDelta(Anchor(fst(v1),BL),Anchor(snd(v1),TL)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),coordDelta(CoordV (Coord {cx = 0, cy = 0}),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),TL))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))
FV=[]
```

## Version space, inventions, induced TSL, exact verification and MDL

```json
{"task":"E:\\dev\\AI\\ARC-AGI-1\\results\\v03\\regression\\scan-BL-TL\\task.json","mode":"NoVersionSpaceSharing","train_exact":true,"heldout_exact":true,"heldout_available":true,"failure":"None","failure_evidence":"training exact; heldout is assessed only after MDL selection","program":"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),coordDelta(Anchor(fst(v1),BL),Anchor(snd(v1),TL)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),coordDelta(CoordV (Coord {cx = 0, cy = 0}),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),TL))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))","typed_ast":{"type":"ArrowT SceneT SceneT","expression":"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),coordDelta(Anchor(fst(v1),BL),Anchor(snd(v1),TL)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),coordDelta(CoordV (Coord {cx = 0, cy = 0}),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),TL))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))","free_variables":[],"binding_accesses":["key","v0","v1.0","v1.1"],"children":[{"type":"SceneT","expression":"mkScene(canvasSize(v0),ColorV 0,scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),coordDelta(Anchor(fst(v1),BL),Anchor(snd(v1),TL)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),coordDelta(CoordV (Coord {cx = 0, cy = 0}),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),TL))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))))","free_variables":["v0"],"binding_accesses":["key","v0","v1.0","v1.1"],"children":[{"type":"SizeT","expression":"canvasSize(v0)","free_variables":["v0"],"binding_accesses":["v0"],"children":[{"type":"SceneT","expression":"v0","free_variables":["v0"],"binding_accesses":["v0"],"children":[]}]},{"type":"ColorT","expression":"ColorV 0","free_variables":[],"binding_accesses":[],"children":[]},{"type":"ListT PlacedT","expression":"scan((lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),coordDelta(Anchor(fst(v1),BL),Anchor(snd(v1),TL)))),Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),coordDelta(CoordV (Coord {cx = 0, cy = 0}),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),TL))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))","free_variables":["v0"],"binding_accesses":["key","v0","v1.0","v1.1"],"children":[{"type":"ArrowT (PairT PlacedT PlacedT) PlacedT","expression":"(lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),coordDelta(Anchor(fst(v1),BL),Anchor(snd(v1),TL))))","free_variables":[],"binding_accesses":["v1.0","v1.1"],"children":[{"type":"PlacedT","expression":"Translate(snd(v1),coordDelta(Anchor(fst(v1),BL),Anchor(snd(v1),TL)))","free_variables":["v1"],"binding_accesses":["v1.0","v1.1"],"children":[{"type":"PlacedT","expression":"snd(v1)","free_variables":["v1"],"binding_accesses":["v1.1"],"children":[{"type":"PairT PlacedT PlacedT","expression":"v1","free_variables":["v1"],"binding_accesses":["v1"],"children":[]}]},{"type":"VecT","expression":"coordDelta(Anchor(fst(v1),BL),Anchor(snd(v1),TL))","free_variables":["v1"],"binding_accesses":["v1.0","v1.1"],"children":[{"type":"CoordT","expression":"Anchor(fst(v1),BL)","free_variables":["v1"],"binding_accesses":["v1.0"],"children":[{"type":"PlacedT","expression":"fst(v1)","free_variables":["v1"],"binding_accesses":["v1.0"],"children":[{"type":"PairT PlacedT PlacedT","expression":"v1","free_variables":["v1"],"binding_accesses":["v1"],"children":[]}]},{"type":"AnchorT","expression":"BL","free_variables":[],"binding_accesses":[],"children":[]}]},{"type":"CoordT","expression":"Anchor(snd(v1),TL)","free_variables":["v1"],"binding_accesses":["v1.1"],"children":[{"type":"PlacedT","expression":"snd(v1)","free_variables":["v1"],"binding_accesses":["v1.1"],"children":[{"type":"PairT PlacedT PlacedT","expression":"v1","free_variables":["v1"],"binding_accesses":["v1"],"children":[]}]},{"type":"AnchorT","expression":"TL","free_variables":[],"binding_accesses":[],"children":[]}]}]}]}]},{"type":"PlacedT","expression":"Translate(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),coordDelta(CoordV (Coord {cx = 0, cy = 0}),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),TL)))","free_variables":["v0"],"binding_accesses":["key","v0"],"children":[{"type":"PlacedT","expression":"head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))","free_variables":["v0"],"binding_accesses":["key","v0"],"children":[{"type":"ListT PlacedT","expression":"sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))","free_variables":["v0"],"binding_accesses":["key","v0"],"children":[{"type":"ArrowT PlacedT IntT","expression":"(lambda key:PlacedT. x(Anchor(key,TL)))","free_variables":[],"binding_accesses":["key"],"children":[{"type":"IntT","expression":"x(Anchor(key,TL))","free_variables":["key"],"binding_accesses":["key"],"children":[{"type":"CoordT","expression":"Anchor(key,TL)","free_variables":["key"],"binding_accesses":["key"],"children":[{"type":"PlacedT","expression":"key","free_variables":["key"],"binding_accesses":["key"],"children":[]},{"type":"AnchorT","expression":"TL","free_variables":[],"binding_accesses":[],"children":[]}]}]}]},{"type":"ListT PlacedT","expression":"objects(v0)","free_variables":["v0"],"binding_accesses":["v0"],"children":[{"type":"SceneT","expression":"v0","free_variables":["v0"],"binding_accesses":["v0"],"children":[]}]}]}]},{"type":"VecT","expression":"coordDelta(CoordV (Coord {cx = 0, cy = 0}),Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),TL))","free_variables":["v0"],"binding_accesses":["key","v0"],"children":[{"type":"CoordT","expression":"CoordV (Coord {cx = 0, cy = 0})","free_variables":[],"binding_accesses":[],"children":[]},{"type":"CoordT","expression":"Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),TL)","free_variables":["v0"],"binding_accesses":["key","v0"],"children":[{"type":"PlacedT","expression":"head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))","free_variables":["v0"],"binding_accesses":["key","v0"],"children":[{"type":"ListT PlacedT","expression":"sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))","free_variables":["v0"],"binding_accesses":["key","v0"],"children":[{"type":"ArrowT PlacedT IntT","expression":"(lambda key:PlacedT. x(Anchor(key,TL)))","free_variables":[],"binding_accesses":["key"],"children":[{"type":"IntT","expression":"x(Anchor(key,TL))","free_variables":["key"],"binding_accesses":["key"],"children":[{"type":"CoordT","expression":"Anchor(key,TL)","free_variables":["key"],"binding_accesses":["key"],"children":[{"type":"PlacedT","expression":"key","free_variables":["key"],"binding_accesses":["key"],"children":[]},{"type":"AnchorT","expression":"TL","free_variables":[],"binding_accesses":[],"children":[]}]}]}]},{"type":"ListT PlacedT","expression":"objects(v0)","free_variables":["v0"],"binding_accesses":["v0"],"children":[{"type":"SceneT","expression":"v0","free_variables":["v0"],"binding_accesses":["v0"],"children":[]}]}]}]},{"type":"AnchorT","expression":"TL","free_variables":[],"binding_accesses":[],"children":[]}]}]}]},{"type":"ListT PlacedT","expression":"tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))","free_variables":["v0"],"binding_accesses":["key","v0"],"children":[{"type":"ListT PlacedT","expression":"sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))","free_variables":["v0"],"binding_accesses":["key","v0"],"children":[{"type":"ArrowT PlacedT IntT","expression":"(lambda key:PlacedT. x(Anchor(key,TL)))","free_variables":[],"binding_accesses":["key"],"children":[{"type":"IntT","expression":"x(Anchor(key,TL))","free_variables":["key"],"binding_accesses":["key"],"children":[{"type":"CoordT","expression":"Anchor(key,TL)","free_variables":["key"],"binding_accesses":["key"],"children":[{"type":"PlacedT","expression":"key","free_variables":["key"],"binding_accesses":["key"],"children":[]},{"type":"AnchorT","expression":"TL","free_variables":[],"binding_accesses":[],"children":[]}]}]}]},{"type":"ListT PlacedT","expression":"objects(v0)","free_variables":["v0"],"binding_accesses":["v0"],"children":[{"type":"SceneT","expression":"v0","free_variables":["v0"],"binding_accesses":["v0"],"children":[]}]}]}]}]}]}]},"portfolio_count":32,"version_space_derivations":32,"base_activated":[{"symbol":"Anchor","source":"BaseActivated","support":[{"specification":"ArrowT SceneT SceneT; observations=2; Gamma=[]","witness":"function graph -> parameter binding and output points"}]},{"symbol":"Translate","source":"BaseActivated","support":[{"specification":"ArrowT SceneT SceneT; observations=2; Gamma=[]","witness":"function graph -> parameter binding and output points"}]},{"symbol":"canvasSize","source":"BaseActivated","support":[{"specification":"ArrowT SceneT SceneT; observations=2; Gamma=[]","witness":"function graph -> parameter binding and output points"}]},{"symbol":"coordDelta","source":"BaseActivated","support":[{"specification":"ArrowT SceneT SceneT; observations=2; Gamma=[]","witness":"function graph -> parameter binding and output points"}]},{"symbol":"fst","source":"BaseActivated","support":[{"specification":"ArrowT SceneT SceneT; observations=2; Gamma=[]","witness":"function graph -> parameter binding and output points"}]},{"symbol":"head","source":"BaseActivated","support":[{"specification":"ArrowT SceneT SceneT; observations=2; Gamma=[]","witness":"function graph -> parameter binding and output points"}]},{"symbol":"lambda","source":"BaseActivated","support":[{"specification":"ArrowT SceneT SceneT; observations=2; Gamma=[]","witness":"function graph -> parameter binding and output points"}]},{"symbol":"literal","source":"BaseActivated","support":[{"specification":"ArrowT SceneT SceneT; observations=2; Gamma=[]","witness":"function graph -> parameter binding and output points"}]},{"symbol":"mkScene","source":"BaseActivated","support":[{"specification":"ArrowT SceneT SceneT; observations=2; Gamma=[]","witness":"function graph -> parameter binding and output points"}]},{"symbol":"objects","source":"BaseActivated","support":[{"specification":"ArrowT SceneT SceneT; observations=2; Gamma=[]","witness":"function graph -> parameter binding and output points"}]},{"symbol":"scan","source":"BaseActivated","support":[{"specification":"ArrowT SceneT SceneT; observations=2; Gamma=[]","witness":"function graph -> parameter binding and output points"}]},{"symbol":"snd","source":"BaseActivated","support":[{"specification":"ArrowT SceneT SceneT; observations=2; Gamma=[]","witness":"function graph -> parameter binding and output points"}]},{"symbol":"sortBy","source":"BaseActivated","support":[{"specification":"ArrowT SceneT SceneT; observations=2; Gamma=[]","witness":"function graph -> parameter binding and output points"}]},{"symbol":"subtract","source":"BaseActivated","support":[{"specification":"ArrowT SceneT SceneT; observations=2; Gamma=[]","witness":"function graph -> parameter binding and output points"}]},{"symbol":"tail","source":"BaseActivated","support":[{"specification":"ArrowT SceneT SceneT; observations=2; Gamma=[]","witness":"function graph -> parameter binding and output points"}]},{"symbol":"vec","source":"BaseActivated","support":[{"specification":"ArrowT SceneT SceneT; observations=2; Gamma=[]","witness":"function graph -> parameter binding and output points"}]},{"symbol":"x","source":"BaseActivated","support":[{"specification":"ArrowT SceneT SceneT; observations=2; Gamma=[]","witness":"function graph -> parameter binding and output points"}]},{"symbol":"y","source":"BaseActivated","support":[{"specification":"ArrowT SceneT SceneT; observations=2; Gamma=[]","witness":"function graph -> parameter binding and output points"}]}],"task_invented":[{"name":"I0","source":"TaskInvented","originating_ast":{"type":"ArrowT (PairT PlacedT PlacedT) PlacedT","expression":"(lambda v1:PairT PlacedT PlacedT. Translate(snd(v1),coordDelta(Anchor(fst(v1),BL),Anchor(snd(v1),TL))))","free_variables":[],"binding_accesses":["v1.0","v1.1"],"children":[{"type":"PlacedT","expression":"Translate(snd(v1),coordDelta(Anchor(fst(v1),BL),Anchor(snd(v1),TL)))","free_variables":["v1"],"binding_accesses":["v1.0","v1.1"],"children":[{"type":"PlacedT","expression":"snd(v1)","free_variables":["v1"],"binding_accesses":["v1.1"],"children":[{"type":"PairT PlacedT PlacedT","expression":"v1","free_variables":["v1"],"binding_accesses":["v1"],"children":[]}]},{"type":"VecT","expression":"coordDelta(Anchor(fst(v1),BL),Anchor(snd(v1),TL))","free_variables":["v1"],"binding_accesses":["v1.0","v1.1"],"children":[{"type":"CoordT","expression":"Anchor(fst(v1),BL)","free_variables":["v1"],"binding_accesses":["v1.0"],"children":[{"type":"PlacedT","expression":"fst(v1)","free_variables":["v1"],"binding_accesses":["v1.0"],"children":[{"type":"PairT PlacedT PlacedT","expression":"v1","free_variables":["v1"],"binding_accesses":["v1"],"children":[]}]},{"type":"AnchorT","expression":"BL","free_variables":[],"binding_accesses":[],"children":[]}]},{"type":"CoordT","expression":"Anchor(snd(v1),TL)","free_variables":["v1"],"binding_accesses":["v1.1"],"children":[{"type":"PlacedT","expression":"snd(v1)","free_variables":["v1"],"binding_accesses":["v1.1"],"children":[{"type":"PairT PlacedT PlacedT","expression":"v1","free_variables":["v1"],"binding_accesses":["v1"],"children":[]}]},{"type":"AnchorT","expression":"TL","free_variables":[],"binding_accesses":[],"children":[]}]}]}]}]},"repeated_occurrences":32,"mdl_saving":337,"saving_scope":"exact-valid program portfolio","evidence":"exact repeated alpha-equivalent lambda subtrees across distinct exact-valid portfolio programs; definition cost=L+2, reference cost=2; no preassigned semantic label"}],"statistics":{"base_symbols_activated":18,"base_symbols_rejected":46,"bottom_up_terms":0,"branch_points":9,"depth_cutoffs":0,"distinct_symbol_count":15,"effect_pruned":126,"exact_verifier_calls":32,"expression_tests":18172,"failed_witness_decompositions":79,"first_solution_states":22349,"fv_bindings_eliminated":566,"induced_tsl_symbol_count":19,"invented_abstractions":1,"join_nodes":0,"lookahead_witness_calls":1357,"materialized_child_asts":1822,"materialized_complete_asts":32,"memo_hits":0,"memo_queries":159,"memoized_learning_tasks":0,"observer_terms":8950,"program_ast_length":51,"propagation_steps":2661,"recursive_learning_tasks":159,"root_learning_tasks":1,"semantic_deduplications":0,"structural_deduplications":0,"structural_prior_count":0,"successful_witness_decompositions":37,"total_expanded_work":22349,"union_nodes":102,"version_space_nodes":2022,"witness_calls":2462,"witness_unavailable":1047,"wall_clock_seconds":8.7878614},"bounded":false,"configuration":{"work_budget":250000,"depth":7,"frontier":32,"correspondence_budget":32},"mdl":{"score":73,"ast_length":51,"distinct_symbols":15,"portfolio_saving":337},"secondary_latent_path":"Base observer expressions only; v0.3 handwritten hierarchical codecs are legacy and are not called","predictions":[[[7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[7,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[2,2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[8,8,8,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[8,8,8,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]]]}
```

Limits: depth=7, extraction frontier=32; 64 witness decompositions/rule; 96 observer terms/type with 2 semantic alternatives. Forward observers are bounded Base subexpressions, not complete programs. The version space is the discovered bounded support, not all possible Base programs.

Abstraction compression is measured over distinct exact-valid portfolio programs. Naming a single-use scan lambda does not by itself shorten the winning AST. `I<n>` names are assigned only after discovery; any Attach interpretation is a post hoc semantic description.

Legacy hierarchical codecs are retained in solve-v03 and measured separately. This solver constructs its grounded observations from Base expressions; richer local/global codec discovery remains a coverage limitation.
