# LATIS v0.3R.2
StructuralPriorCount=0. Counterfactual labels never guide synthesis.
```text
Root specification Q0: ArrowT SceneT SceneT; observations=2; Gamma=[]. Original Grid targets reserved for exact verification.
Learn(ArrowT SceneT SceneT; observations=2; Gamma=[]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,1)]
Learn(SceneT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","mkScene"]
MRV immediate domains=[(0,2),(1,3),(2,1)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,2)]
Learn(ArrowT PlacedT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,1)]
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,2),(1,3)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_coord node=8 children=[3,7]; component projection of output specification
Learn(ObjectT; observations=2; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","objectOf"]
Nonempty VS_place node=12 children=[11,8]; place inverse: output local geometry and absolute origin; no translation template
Nonempty VS_lambda node=13 children=[12]; function graph -> parameter binding and output points
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_map node=17 children=[13,16]; map witness: corresponding f(x_i)=y_i; element instances=2
Learn(SizeT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","size","canvasSize"]
Learn(ColorT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","background"]
Nonempty VS_mkScene node=24 children=[20,23,17]; mkScene residual: canonical correspondence + Render-validated paint order; branch=0
Nonempty VS_lambda node=25 children=[24]; function graph -> parameter binding and output points
Task TSL supported Base=["Anchor","add","background","canvasSize","coord","head","lambda","literal","map","mkScene","objectOf","objects","place","sortBy","subtract","x","y"]
Cost saturation C=1..0 root representatives=[]
Abstraction round=0; exact frontier=11; accepted=["I0","I1","I2"]
Learn uses I0 by typed definition expansion; ArrowT PlacedT PlacedT; observations=2; Gamma=[("v0",SceneT)]
Learn uses I1 by typed definition expansion; ArrowT PlacedT PlacedT; observations=2; Gamma=[("v0",SceneT)]
Task TSL supported Base=["Anchor","add","background","canvasSize","coord","head","lambda","literal","map","mkScene","objectOf","objects","place","sortBy","subtract","x","y"]
Cost saturation C=1..0 root representatives=[]
Abstraction round=1; exact frontier=10; accepted=[]
Cost saturation C=1..0 root representatives=[]
Exact original Render(P(Encode(x)))=y: True; MDL rank=(38,13,2,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda __r1b0:PlacedT. place(objectOf(__r1b0),coord(add(x(Anchor(__r1b0,BR)),IntV 1),y(Anchor(__r1b0,TL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(40,14,2,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),map((lambda __r1b0:PlacedT. place(objectOf(__r1b0),coord(add(x(Anchor(__r1b0,BR)),IntV 1),y(Anchor(__r1b0,TL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(42,14,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(head(objects(v0))),coord(add(x(Anchor(v1,BR)),IntV 1),y(Anchor(v1,TL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(36,12,2,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda __r1b0:PlacedT. place(objectOf(__r1b0),coord(add(x(Anchor(__r1b0,BR)),IntV 1),IntV 3))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(38,13,2,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),map((lambda __r1b0:PlacedT. place(objectOf(__r1b0),coord(add(x(Anchor(__r1b0,BR)),IntV 1),IntV 3))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(40,13,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(head(objects(v0))),coord(add(x(Anchor(v1,BR)),IntV 1),IntV 3))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(40,12,2,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,map((lambda __r1b0:PlacedT. place(objectOf(__r1b0),coord(add(x(Anchor(__r1b0,BR)),IntV 1),y(Anchor(__r1b0,TL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(42,13,2,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),map((lambda __r1b0:PlacedT. place(objectOf(__r1b0),coord(add(x(Anchor(__r1b0,BR)),IntV 1),y(Anchor(__r1b0,TL))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(38,11,2,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,map((lambda __r1b0:PlacedT. place(objectOf(__r1b0),coord(add(x(Anchor(__r1b0,BR)),IntV 1),IntV 3))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(40,12,2,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),map((lambda __r1b0:PlacedT. place(objectOf(__r1b0),coord(add(x(Anchor(__r1b0,BR)),IntV 1),IntV 3))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(42,12,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,map((lambda v1:PlacedT. place(objectOf(head(objects(v0))),coord(add(x(Anchor(v1,BR)),IntV 1),IntV 3))),objects(v0))))")
Selected AST; FV=[]; (lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda __r1b0:PlacedT. place(objectOf(__r1b0),coord(add(x(Anchor(__r1b0,BR)),IntV 1),y(Anchor(__r1b0,TL))))),objects(v0))))
TaskInvented I0: (lambda __r1b0:PlacedT. place(objectOf(__r1b0),coord(add(x(Anchor(__r1b0,BR)),IntV 1),IntV 3))); repeats=4; portfolio MDL saving=26
TaskInvented I1: (lambda __r1b0:PlacedT. place(objectOf(__r1b0),coord(add(x(Anchor(__r1b0,BR)),IntV 1),y(Anchor(__r1b0,TL))))); repeats=4; portfolio MDL saving=35
TaskInvented I2: (lambda __r1h0:PlacedT. (lambda __r1h1:IntT. (lambda v1:PlacedT. place(objectOf(__r1h0),coord(add(x(Anchor(v1,BR)),IntV 1),__r1h1))))); repeats=11; portfolio MDL saving=2
Induced TSL=Signature(root VS) union inventions. BaseActivated=["Anchor","add","background","canvasSize","coord","head","lambda","literal","map","mkScene","objectOf","objects","place","sortBy","subtract","x","y"]; TaskInvented=["I0","I1","I2"]; StructuralPriorCount=0
```
