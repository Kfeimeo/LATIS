# LATIS v0.3R.2
StructuralPriorCount=0. Counterfactual labels never guide synthesis.
```text
Root specification Q0: ArrowT SceneT SceneT; observations=2; Gamma=[]. Original Grid targets reserved for exact verification.
Learn(ArrowT SceneT SceneT; observations=2; Gamma=[]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,1)]
Learn(SceneT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","mkScene"]
MRV immediate domains=[(0,1),(1,3),(2,1)]
Learn(SizeT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","size","canvasSize"]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,23)]
Learn(ArrowT PlacedT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,1)]
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,47),(1,2)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,1),(1,10)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,12),(1,1)]
Nonempty VS_add node=17 children=[16,4]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,101),(1,1)]
Nonempty VS_add node=121 children=[120,19]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,59),(1,1)]
Nonempty VS_add node=183 children=[182,123]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,48),(1,1)]
Nonempty VS_add node=235 children=[234,185]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,95),(1,1)]
Nonempty VS_add node=334 children=[333,237]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,95),(1,95)]
Nonempty VS_add node=431 children=[430,430]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_add node=436 children=[435,433]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,96),(1,1)]
Nonempty VS_add node=535 children=[534,438]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,101)]
Nonempty VS_add node=536 children=[19,120]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,12),(1,1)]
Nonempty VS_subtract node=539 children=[16,538]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,101),(1,1)]
Nonempty VS_subtract node=542 children=[120,541]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,59),(1,1)]
Nonempty VS_subtract node=545 children=[182,544]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,3),(1,188)]
Nonempty VS_subtract node=739 children=[549,738]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,48),(1,1)]
Nonempty VS_subtract node=742 children=[234,741]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,6),(1,376)]
Nonempty VS_subtract node=1127 children=[749,1126]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,95),(1,1)]
Nonempty VS_subtract node=1130 children=[333,1129]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,95),(1,1)]
Nonempty VS_subtract node=1133 children=[430,1132]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_subtract node=1136 children=[435,1135]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,96),(1,1)]
Nonempty VS_subtract node=1139 children=[534,1138]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,101)]
Nonempty VS_subtract node=1140 children=[19,120]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,12),(1,1)]
Nonempty VS_multiply node=1141 children=[16,541]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,59),(1,1)]
Nonempty VS_multiply node=1142 children=[182,19]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,95),(1,96)]
Nonempty VS_multiply node=1143 children=[430,534]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_multiply node=1144 children=[435,1132]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,96),(1,95)]
Nonempty VS_multiply node=1145 children=[534,430]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,59)]
Nonempty VS_multiply node=1146 children=[19,182]; conditional scalar inverse (observed operand; remaining values deduced)
Learn(IntT; observations=2; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,47),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,12),(1,1)]
Nonempty VS_add node=1149 children=[16,19]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,101),(1,1)]
Nonempty VS_add node=1150 children=[120,123]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,59),(1,1)]
Nonempty VS_add node=1151 children=[182,438]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,48),(1,95)]
Nonempty VS_add node=1152 children=[234,430]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,95),(1,1)]
Nonempty VS_add node=1153 children=[333,185]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,95),(1,48)]
Nonempty VS_add node=1154 children=[430,234]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_add node=1155 children=[435,4]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,96),(1,1)]
Nonempty VS_add node=1156 children=[534,237]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,1),(1,101)]
Nonempty VS_add node=1157 children=[123,120]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,12),(1,1)]
Nonempty VS_subtract node=1158 children=[16,541]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,101),(1,1)]
Nonempty VS_subtract node=1159 children=[120,544]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,59),(1,1)]
Nonempty VS_subtract node=1160 children=[182,1138]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,48),(1,1)]
Nonempty VS_subtract node=1161 children=[234,1132]; conditional scalar inverse (observed operand; remaining values deduced)
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
Cost saturation C=1..0 root representatives=[]
Abstraction round=0; exact frontier=0; accepted=[]
Induced TSL=Signature(root VS) union inventions. BaseActivated=[]; TaskInvented=[]; StructuralPriorCount=0
```
