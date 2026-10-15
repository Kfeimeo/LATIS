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
MRV immediate domains=[(0,3)]
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
MRV immediate domains=[(0,2),(1,2)]
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Learn(ColorT; observations=2; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","background"]
Nonempty VS_Recolor node=5 children=[3,4]; uniform color residual with geometry/position preserved
MRV immediate domains=[(0,1),(1,2),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=2; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,3)]
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT),("v1",PlacedT),("v2",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
MRV immediate domains=[(0,2),(1,2)]
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT),("v1",PlacedT),("v2",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Learn(ColorT; observations=2; Gamma=[("v0",SceneT),("v1",PlacedT),("v2",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","background"]
Nonempty VS_Recolor node=8 children=[7,4]; uniform color residual with geometry/position preserved
MRV immediate domains=[(0,1),(1,2),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=2; Gamma=[("v0",SceneT),("v1",PlacedT),("v2",PairT PlacedT PlacedT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
Nonempty VS_lambda node=9 children=[8]; function graph -> parameter binding and output points
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_fold node=13 children=[9,3,12]; fold conditional transition trace; all intermediate states grounded; final state exact
Nonempty VS_lambda node=15 children=[14]; function graph -> parameter binding and output points
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_map node=16 children=[15,12]; map witness: corresponding f(x_i)=y_i; element instances=2
Learn(SizeT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","size","canvasSize"]
Learn(ColorT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","background"]
Nonempty VS_mkScene node=23 children=[19,22,16]; mkScene residual: canonical correspondence + Render-validated paint order; branch=0
Nonempty VS_lambda node=24 children=[23]; function graph -> parameter binding and output points
Task TSL supported Base=["Anchor","Recolor","background","canvasSize","fold","fst","head","lambda","literal","map","mkScene","objects","sortBy","x"]
Cost saturation C=1..0 root representatives=[]
Abstraction round=0; exact frontier=32; accepted=["I0","I1","I2","I3","I4","I5"]
Learn uses I0 by typed definition expansion; ArrowT PlacedT PlacedT; observations=2; Gamma=[("v0",SceneT)]
Learn uses I3 by typed definition expansion; ArrowT PlacedT PlacedT; observations=2; Gamma=[("v0",SceneT)]
Learn uses I5 by typed definition expansion; ArrowT PlacedT PlacedT; observations=2; Gamma=[("v0",SceneT)]
Task TSL supported Base=["Anchor","Recolor","application","background","canvasSize","fold","fst","head","lambda","literal","map","mkScene","objects","sortBy","x"]
Cost saturation C=1..0 root representatives=[]
Abstraction round=1; exact frontier=32; accepted=[]
Cost saturation C=1..0 root representatives=[]
Exact original Render(P(Encode(x)))=y: True; MDL rank=(21,7,2,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. Recolor(v1,ColorV 9)),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(23,8,2,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),map((lambda v1:PlacedT. Recolor(v1,ColorV 9)),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(24,8,2,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. Recolor(head(objects(v0)),ColorV 9)),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(26,9,2,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),map((lambda v1:PlacedT. Recolor(head(objects(v0)),ColorV 9)),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(29,8,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. fold((lambda v2:PairT PlacedT PlacedT. Recolor(v1,ColorV 9)),v1,objects(v0))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(29,9,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map(application((lambda v0:SceneT. (lambda __r1b0:PlacedT. Recolor(head(objects(v0)),ColorV 9))),v0),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(31,10,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. Recolor(v1,ColorV 9)),sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(31,9,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. fold((lambda v2:PairT PlacedT PlacedT. Recolor(fst(v2),ColorV 9)),v1,objects(v0))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(31,9,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),map((lambda v1:PlacedT. fold((lambda v2:PairT PlacedT PlacedT. Recolor(v1,ColorV 9)),v1,objects(v0))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(31,10,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),map(application((lambda v0:SceneT. (lambda __r1b0:PlacedT. Recolor(head(objects(v0)),ColorV 9))),v0),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(32,9,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. fold((lambda v2:PairT PlacedT PlacedT. Recolor(v1,ColorV 9)),head(objects(v0)),objects(v0))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(33,11,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),map((lambda v1:PlacedT. Recolor(v1,ColorV 9)),sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(33,10,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),map((lambda v1:PlacedT. fold((lambda v2:PairT PlacedT PlacedT. Recolor(fst(v2),ColorV 9)),v1,objects(v0))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(34,11,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. Recolor(head(objects(v0)),ColorV 9)),sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(33,10,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. fold((lambda v2:PairT PlacedT PlacedT. Recolor(fst(v2),ColorV 9)),head(objects(v0)),objects(v0))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(34,9,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map(application((lambda v0:SceneT. (lambda __r1b0:PlacedT. fold((lambda __r1b1:PairT PlacedT PlacedT. Recolor(__r1b0,ColorV 9)),__r1b0,objects(v0)))),v0),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(34,10,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),map((lambda v1:PlacedT. fold((lambda v2:PairT PlacedT PlacedT. Recolor(v1,ColorV 9)),head(objects(v0)),objects(v0))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(36,12,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),map((lambda v1:PlacedT. Recolor(head(objects(v0)),ColorV 9)),sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(35,11,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),map((lambda v1:PlacedT. fold((lambda v2:PairT PlacedT PlacedT. Recolor(fst(v2),ColorV 9)),head(objects(v0)),objects(v0))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(23,6,2,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,map((lambda v1:PlacedT. Recolor(v1,ColorV 9)),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(25,7,2,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),map((lambda v1:PlacedT. Recolor(v1,ColorV 9)),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(26,7,2,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,map((lambda v1:PlacedT. Recolor(head(objects(v0)),ColorV 9)),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(28,8,2,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),map((lambda v1:PlacedT. Recolor(head(objects(v0)),ColorV 9)),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(31,7,4,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,map((lambda v1:PlacedT. fold((lambda v2:PairT PlacedT PlacedT. Recolor(v1,ColorV 9)),v1,objects(v0))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(31,8,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,map(application((lambda v0:SceneT. (lambda __r1b0:PlacedT. Recolor(head(objects(v0)),ColorV 9))),v0),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(33,9,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,map((lambda v1:PlacedT. Recolor(v1,ColorV 9)),sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(33,8,4,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,map((lambda v1:PlacedT. fold((lambda v2:PairT PlacedT PlacedT. Recolor(fst(v2),ColorV 9)),v1,objects(v0))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(33,8,4,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),map((lambda v1:PlacedT. fold((lambda v2:PairT PlacedT PlacedT. Recolor(v1,ColorV 9)),v1,objects(v0))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(33,9,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),map(application((lambda v0:SceneT. (lambda __r1b0:PlacedT. Recolor(head(objects(v0)),ColorV 9))),v0),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(34,8,4,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,map((lambda v1:PlacedT. fold((lambda v2:PairT PlacedT PlacedT. Recolor(v1,ColorV 9)),head(objects(v0)),objects(v0))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(35,10,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),map((lambda v1:PlacedT. Recolor(v1,ColorV 9)),sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(35,9,4,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),map((lambda v1:PlacedT. fold((lambda v2:PairT PlacedT PlacedT. Recolor(fst(v2),ColorV 9)),v1,objects(v0))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(36,10,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,map((lambda v1:PlacedT. Recolor(head(objects(v0)),ColorV 9)),sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(35,9,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,map((lambda v1:PlacedT. fold((lambda v2:PairT PlacedT PlacedT. Recolor(fst(v2),ColorV 9)),head(objects(v0)),objects(v0))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(36,9,4,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),map((lambda v1:PlacedT. fold((lambda v2:PairT PlacedT PlacedT. Recolor(v1,ColorV 9)),head(objects(v0)),objects(v0))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(38,11,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),map((lambda v1:PlacedT. Recolor(head(objects(v0)),ColorV 9)),sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(37,10,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),map((lambda v1:PlacedT. fold((lambda v2:PairT PlacedT PlacedT. Recolor(fst(v2),ColorV 9)),head(objects(v0)),objects(v0))),objects(v0))))")
Selected AST; FV=[]; (lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. Recolor(v1,ColorV 9)),objects(v0))))
TaskInvented I0: (lambda v0:SceneT. (lambda __r1b0:PlacedT. Recolor(head(objects(v0)),ColorV 9))); repeats=8; portfolio MDL saving=15
TaskInvented I1: (lambda __r1h0:ListT PlacedT. map((lambda __r1b0:PlacedT. Recolor(__r1b0,ColorV 9)),__r1h0)); repeats=8; portfolio MDL saving=15
TaskInvented I2: (lambda v0:SceneT. sortBy((lambda __r1b0:PlacedT. x(Anchor(__r1b0,TL))),objects(v0))); repeats=8; portfolio MDL saving=17
TaskInvented I3: (lambda v0:SceneT. (lambda __r1b0:PlacedT. fold((lambda __r1b1:PairT PlacedT PlacedT. Recolor(__r1b0,ColorV 9)),__r1b0,objects(v0)))); repeats=4; portfolio MDL saving=12
TaskInvented I4: (lambda v0:SceneT. (lambda v1:PlacedT. fold((lambda __r1b0:PairT PlacedT PlacedT. Recolor(fst(__r1b0),ColorV 9)),v1,objects(v0)))); repeats=8; portfolio MDL saving=27
TaskInvented I5: (lambda v0:SceneT. (lambda __r1b0:PlacedT. fold((lambda __r1b1:PairT PlacedT PlacedT. Recolor(__r1b0,ColorV 9)),head(objects(v0)),objects(v0)))); repeats=4; portfolio MDL saving=18
Induced TSL=Signature(root VS) union inventions. BaseActivated=["Anchor","Recolor","application","background","canvasSize","fold","fst","head","lambda","literal","map","mkScene","objects","sortBy","x"]; TaskInvented=["I0","I1","I2","I3","I4","I5"]; StructuralPriorCount=0
```
