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
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,2),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Nonempty VS_Translate node=5 children=[4,1]; Translate: v_i=Anchor(target_i,TL)-Anchor(source_i,TL); Vec specification=[Vec 2 0,Vec 2 0]
Nonempty VS_lambda node=6 children=[5]; function graph -> parameter binding and output points
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_map node=10 children=[6,9]; map witness: corresponding f(x_i)=y_i; element instances=2
Learn(SizeT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","size","canvasSize"]
Learn(ColorT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","background"]
Nonempty VS_mkScene node=17 children=[13,16,10]; mkScene residual: canonical correspondence + Render-validated paint order; branch=0
Nonempty VS_lambda node=18 children=[17]; function graph -> parameter binding and output points
Task TSL supported Base=["Anchor","Translate","background","canvasSize","head","lambda","literal","map","mkScene","objects","sortBy","x"]
Cost saturation C=1..0 root representatives=[]
Abstraction round=0; exact frontier=16; accepted=["I0","I1","I2","I3"]
Learn uses I0 by typed definition expansion; ArrowT PlacedT PlacedT; observations=2; Gamma=[("v0",SceneT)]
Task TSL supported Base=["Anchor","Translate","application","background","canvasSize","head","lambda","literal","map","mkScene","objects","sortBy","x"]
Cost saturation C=1..0 root representatives=[]
Abstraction round=1; exact frontier=24; accepted=["I4"]
Learn uses I0 by typed definition expansion; ArrowT PlacedT PlacedT; observations=2; Gamma=[("v0",SceneT)]
Learn uses I4 by typed definition expansion; ArrowT PlacedT PlacedT; observations=2; Gamma=[("v0",SceneT)]
Task TSL supported Base=["Anchor","Translate","application","background","canvasSize","head","lambda","literal","map","mkScene","objects","sortBy","x"]
Cost saturation C=1..0 root representatives=[]
Cost saturation C=1..0 root representatives=[]
Exact original Render(P(Encode(x)))=y: True; MDL rank=(23,7,2,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. Translate(v1,VecV (Vec 2 0))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(25,8,2,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),map((lambda v1:PlacedT. Translate(v1,VecV (Vec 2 0))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(26,8,2,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. Translate(head(objects(v0)),VecV (Vec 2 0))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(28,9,2,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),map((lambda v1:PlacedT. Translate(head(objects(v0)),VecV (Vec 2 0))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(31,9,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map(application((lambda v0:SceneT. (lambda __r1b0:PlacedT. Translate(head(objects(v0)),VecV (Vec 2 0)))),v0),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(33,10,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. Translate(v1,VecV (Vec 2 0))),sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(33,10,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),map(application((lambda v0:SceneT. (lambda __r1b0:PlacedT. Translate(head(objects(v0)),VecV (Vec 2 0)))),v0),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(35,11,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),map((lambda v1:PlacedT. Translate(v1,VecV (Vec 2 0))),sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(36,11,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. Translate(head(objects(v0)),VecV (Vec 2 0))),sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(35,9,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map(application((lambda v0:SceneT. application((lambda __r1b0:SceneT. (lambda __r1b1:PlacedT. Translate(head(objects(__r1b0)),VecV (Vec 2 0)))),v0)),v0),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(38,12,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),map((lambda v1:PlacedT. Translate(head(objects(v0)),VecV (Vec 2 0))),sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(37,10,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),map(application((lambda v0:SceneT. application((lambda __r1b0:SceneT. (lambda __r1b1:PlacedT. Translate(head(objects(__r1b0)),VecV (Vec 2 0)))),v0)),v0),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(41,12,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map(application((lambda v0:SceneT. (lambda __r1b0:PlacedT. Translate(head(objects(v0)),VecV (Vec 2 0)))),v0),sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(43,13,4,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),map(application((lambda v0:SceneT. (lambda __r1b0:PlacedT. Translate(head(objects(v0)),VecV (Vec 2 0)))),v0),sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(45,12,5,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map(application((lambda v0:SceneT. application((lambda __r1b0:SceneT. (lambda __r1b1:PlacedT. Translate(head(objects(__r1b0)),VecV (Vec 2 0)))),v0)),v0),sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(47,13,5,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),map(application((lambda v0:SceneT. application((lambda __r1b0:SceneT. (lambda __r1b1:PlacedT. Translate(head(objects(__r1b0)),VecV (Vec 2 0)))),v0)),v0),sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(25,6,2,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,map((lambda v1:PlacedT. Translate(v1,VecV (Vec 2 0))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(27,7,2,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),map((lambda v1:PlacedT. Translate(v1,VecV (Vec 2 0))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(28,7,2,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,map((lambda v1:PlacedT. Translate(head(objects(v0)),VecV (Vec 2 0))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(30,8,2,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),map((lambda v1:PlacedT. Translate(head(objects(v0)),VecV (Vec 2 0))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(33,8,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,map(application((lambda v0:SceneT. (lambda __r1b0:PlacedT. Translate(head(objects(v0)),VecV (Vec 2 0)))),v0),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(35,9,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,map((lambda v1:PlacedT. Translate(v1,VecV (Vec 2 0))),sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(35,9,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),map(application((lambda v0:SceneT. (lambda __r1b0:PlacedT. Translate(head(objects(v0)),VecV (Vec 2 0)))),v0),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(37,10,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),map((lambda v1:PlacedT. Translate(v1,VecV (Vec 2 0))),sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(38,10,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,map((lambda v1:PlacedT. Translate(head(objects(v0)),VecV (Vec 2 0))),sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(37,8,4,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,map(application((lambda v0:SceneT. application((lambda __r1b0:SceneT. (lambda __r1b1:PlacedT. Translate(head(objects(__r1b0)),VecV (Vec 2 0)))),v0)),v0),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(40,11,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),map((lambda v1:PlacedT. Translate(head(objects(v0)),VecV (Vec 2 0))),sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(39,9,4,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),map(application((lambda v0:SceneT. application((lambda __r1b0:SceneT. (lambda __r1b1:PlacedT. Translate(head(objects(__r1b0)),VecV (Vec 2 0)))),v0)),v0),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(43,11,4,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,map(application((lambda v0:SceneT. (lambda __r1b0:PlacedT. Translate(head(objects(v0)),VecV (Vec 2 0)))),v0),sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(45,12,4,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),map(application((lambda v0:SceneT. (lambda __r1b0:PlacedT. Translate(head(objects(v0)),VecV (Vec 2 0)))),v0),sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(47,11,5,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,map(application((lambda v0:SceneT. application((lambda __r1b0:SceneT. (lambda __r1b1:PlacedT. Translate(head(objects(__r1b0)),VecV (Vec 2 0)))),v0)),v0),sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,12,5,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),map(application((lambda v0:SceneT. application((lambda __r1b0:SceneT. (lambda __r1b1:PlacedT. Translate(head(objects(__r1b0)),VecV (Vec 2 0)))),v0)),v0),sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))))")
Selected AST; FV=[]; (lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. Translate(v1,VecV (Vec 2 0))),objects(v0))))
TaskInvented I0: (lambda v0:SceneT. (lambda __r1b0:PlacedT. Translate(head(objects(v0)),VecV (Vec 2 0)))); repeats=8; portfolio MDL saving=15
TaskInvented I1: (lambda __r1h0:ListT PlacedT. map((lambda __r1b0:PlacedT. Translate(__r1b0,VecV (Vec 2 0))),__r1h0)); repeats=8; portfolio MDL saving=15
TaskInvented I2: (lambda v0:SceneT. sortBy((lambda __r1b0:PlacedT. x(Anchor(__r1b0,TL))),objects(v0))); repeats=8; portfolio MDL saving=17
TaskInvented I3: (lambda v0:SceneT. map((lambda __r1b0:PlacedT. Translate(__r1b0,VecV (Vec 2 0))),sortBy((lambda __r1b0:PlacedT. x(Anchor(__r1b0,TL))),objects(v0)))); repeats=4; portfolio MDL saving=4
TaskInvented I4: (lambda v0:SceneT. application((lambda __r1b0:SceneT. (lambda __r1b1:PlacedT. Translate(head(objects(__r1b0)),VecV (Vec 2 0)))),v0)); repeats=8; portfolio MDL saving=12
Induced TSL=Signature(root VS) union inventions. BaseActivated=["Anchor","Translate","application","background","canvasSize","head","lambda","literal","map","mkScene","objects","sortBy","x"]; TaskInvented=["I0","I1","I2","I3","I4"]; StructuralPriorCount=0
```
