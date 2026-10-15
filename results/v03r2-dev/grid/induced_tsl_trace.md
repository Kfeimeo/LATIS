# LATIS v0.3R.2
StructuralPriorCount=0. Counterfactual labels never guide synthesis.
```text
Root specification Q0: ArrowT SceneT SceneT; observations=2; Gamma=[]. Original Grid targets reserved for exact verification.
Learn(ArrowT SceneT SceneT; observations=2; Gamma=[]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,1)]
Learn(SceneT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","mkScene"]
MRV immediate domains=[(0,1),(1,3),(2,1)]
Learn(SizeT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","size","canvasSize"]
MRV immediate domains=[(0,3),(1,3)]
Nonempty VS_size node=10 children=[5,9]; component projection of output specification
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,23)]
Learn(ArrowT PlacedT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,1)]
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,47),(1,2)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,1),(1,11)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,1),(1,3),(2,23)]
Nonempty VS_fold node=39 children=[14,5,38]; fold conditional transition trace; all intermediate states grounded; final state exact
MRV immediate domains=[(0,12),(1,1)]
Nonempty VS_add node=54 children=[53,41]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,101),(1,1)]
Nonempty VS_add node=158 children=[157,56]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,59),(1,1)]
Nonempty VS_add node=220 children=[219,160]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,48),(1,1)]
Nonempty VS_add node=272 children=[271,222]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,95),(1,1)]
Nonempty VS_add node=371 children=[370,274]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,95),(1,95)]
Nonempty VS_add node=468 children=[467,467]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_add node=473 children=[472,470]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,96),(1,1)]
Nonempty VS_add node=572 children=[571,475]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,101)]
Nonempty VS_add node=573 children=[56,157]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,12),(1,1)]
Nonempty VS_subtract node=576 children=[53,575]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,101),(1,1)]
Nonempty VS_subtract node=579 children=[157,578]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,59),(1,1)]
Nonempty VS_subtract node=582 children=[219,581]; conditional scalar inverse (observed operand; remaining values deduced)
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
Cost saturation C=1..0 root representatives=[]
Abstraction round=0; exact frontier=0; accepted=[]
Induced TSL=Signature(root VS) union inventions. BaseActivated=[]; TaskInvented=[]; StructuralPriorCount=0
```
