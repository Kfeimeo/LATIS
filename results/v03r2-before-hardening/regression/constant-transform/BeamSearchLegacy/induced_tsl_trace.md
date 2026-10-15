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
MRV immediate domains=[(0,1),(1,2)]
Learn(ArrowT PlacedT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,3)]
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,2),(1,2)]
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Learn(D4T; observations=2; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get"]
Nonempty VS_TransformD4 node=6 children=[4,5]; finite D4 forward inverse; geometry and position exact
MRV immediate domains=[(0,1),(1,2),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=2; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,3)]
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT),("v1",PlacedT),("v2",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,2),(1,2)]
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT),("v1",PlacedT),("v2",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Learn(D4T; observations=2; Gamma=[("v0",SceneT),("v1",PlacedT),("v2",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get"]
Nonempty VS_TransformD4 node=9 children=[8,5]; finite D4 forward inverse; geometry and position exact
MRV immediate domains=[(0,1),(1,2),(2,2)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=2; Gamma=[("v0",SceneT),("v1",PlacedT),("v2",PairT PlacedT PlacedT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
Nonempty VS_lambda node=10 children=[9]; function graph -> parameter binding and output points
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_fold node=14 children=[10,4,13]; fold conditional transition trace; all intermediate states grounded; final state exact
Nonempty VS_lambda node=16 children=[15]; function graph -> parameter binding and output points
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_map node=17 children=[16,13]; map witness: corresponding f(x_i)=y_i; element instances=2
Learn(ColorT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","background"]
Nonempty VS_mkScene node=21 children=[1,20,17]; mkScene residual: canonical correspondence + Render-validated paint order; branch=0
Nonempty VS_lambda node=22 children=[21]; function graph -> parameter binding and output points
Task TSL supported Base=["Anchor","TransformD4","background","canvasSize","fold","fst","head","lambda","literal","map","mkScene","objects","sortBy","x"]
Cost saturation C=1..0 root representatives=[]
Abstraction round=0; exact frontier=32; accepted=["I0","I1","I2","I3","I4","I5"]
Learn uses I0 by typed definition expansion; ArrowT PlacedT PlacedT; observations=2; Gamma=[("v0",SceneT)]
Learn uses I3 by typed definition expansion; ArrowT PlacedT PlacedT; observations=2; Gamma=[("v0",SceneT)]
Learn uses I3 by typed definition expansion; ArrowT PlacedT PlacedT; observations=2; Gamma=[("v0",SceneT)]
Learn uses I5 by typed definition expansion; ArrowT PlacedT PlacedT; observations=2; Gamma=[("v0",SceneT)]
Task TSL supported Base=["Anchor","TransformD4","application","background","canvasSize","fold","fst","head","lambda","literal","map","mkScene","objects","sortBy","x"]
Cost saturation C=1..0 root representatives=[]
Abstraction round=1; exact frontier=32; accepted=[]
Cost saturation C=1..0 root representatives=[]
Exact original Render(P(Encode(x)))=y: True; MDL rank=(21,7,2,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. TransformD4(v1,D4V 1)),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(23,8,2,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),map((lambda v1:PlacedT. TransformD4(v1,D4V 1)),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(24,8,2,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. TransformD4(head(objects(v0)),D4V 1)),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(26,9,2,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),map((lambda v1:PlacedT. TransformD4(head(objects(v0)),D4V 1)),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(29,8,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. fold((lambda v2:PairT PlacedT PlacedT. TransformD4(v1,D4V 1)),v1,objects(v0))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(29,9,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map(application((lambda v0:SceneT. (lambda __r1b0:PlacedT. TransformD4(head(objects(v0)),D4V 1))),v0),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(31,10,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. TransformD4(v1,D4V 1)),sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(31,9,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. fold((lambda v2:PairT PlacedT PlacedT. TransformD4(fst(v2),D4V 1)),v1,objects(v0))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(31,9,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),map((lambda v1:PlacedT. fold((lambda v2:PairT PlacedT PlacedT. TransformD4(v1,D4V 1)),v1,objects(v0))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(31,10,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),map(application((lambda v0:SceneT. (lambda __r1b0:PlacedT. TransformD4(head(objects(v0)),D4V 1))),v0),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(32,9,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. fold((lambda v2:PairT PlacedT PlacedT. TransformD4(v1,D4V 1)),head(objects(v0)),objects(v0))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(33,11,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),map((lambda v1:PlacedT. TransformD4(v1,D4V 1)),sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(33,10,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),map((lambda v1:PlacedT. fold((lambda v2:PairT PlacedT PlacedT. TransformD4(fst(v2),D4V 1)),v1,objects(v0))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(34,11,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. TransformD4(head(objects(v0)),D4V 1)),sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(33,10,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. fold((lambda v2:PairT PlacedT PlacedT. TransformD4(fst(v2),D4V 1)),head(objects(v0)),objects(v0))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(34,9,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map(application((lambda __r1h0:ListT PlacedT. (lambda __r1b0:PlacedT. fold((lambda __r1b1:PairT PlacedT PlacedT. TransformD4(__r1b0,D4V 1)),__r1b0,__r1h0))),objects(v0)),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(34,10,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),map((lambda v1:PlacedT. fold((lambda v2:PairT PlacedT PlacedT. TransformD4(v1,D4V 1)),head(objects(v0)),objects(v0))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(36,12,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),map((lambda v1:PlacedT. TransformD4(head(objects(v0)),D4V 1)),sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(35,11,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),map((lambda v1:PlacedT. fold((lambda v2:PairT PlacedT PlacedT. TransformD4(fst(v2),D4V 1)),head(objects(v0)),objects(v0))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(36,10,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),map(application((lambda __r1h0:ListT PlacedT. (lambda __r1b0:PlacedT. fold((lambda __r1b1:PairT PlacedT PlacedT. TransformD4(__r1b0,D4V 1)),__r1b0,__r1h0))),objects(v0)),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(37,10,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map(application((lambda v0:SceneT. (lambda __r1b0:PlacedT. fold((lambda __r1b1:PairT PlacedT PlacedT. TransformD4(__r1b0,D4V 1)),head(objects(v0)),objects(v0)))),v0),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(39,11,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. fold((lambda v2:PairT PlacedT PlacedT. TransformD4(v1,D4V 1)),v1,objects(v0))),sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(39,11,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. fold((lambda v2:PairT PlacedT PlacedT. TransformD4(v1,D4V 1)),v1,sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(39,12,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map(application((lambda v0:SceneT. (lambda __r1b0:PlacedT. TransformD4(head(objects(v0)),D4V 1))),v0),sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(39,11,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),map(application((lambda v0:SceneT. (lambda __r1b0:PlacedT. fold((lambda __r1b1:PairT PlacedT PlacedT. TransformD4(__r1b0,D4V 1)),head(objects(v0)),objects(v0)))),v0),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(41,12,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. fold((lambda v2:PairT PlacedT PlacedT. TransformD4(fst(v2),D4V 1)),v1,objects(v0))),sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(41,12,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. fold((lambda v2:PairT PlacedT PlacedT. TransformD4(fst(v2),D4V 1)),v1,sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(41,12,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),map((lambda v1:PlacedT. fold((lambda v2:PairT PlacedT PlacedT. TransformD4(v1,D4V 1)),v1,objects(v0))),sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(41,12,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),map((lambda v1:PlacedT. fold((lambda v2:PairT PlacedT PlacedT. TransformD4(v1,D4V 1)),v1,sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(41,13,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),map(application((lambda v0:SceneT. (lambda __r1b0:PlacedT. TransformD4(head(objects(v0)),D4V 1))),v0),sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(42,12,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. fold((lambda v2:PairT PlacedT PlacedT. TransformD4(v1,D4V 1)),head(objects(v0)),objects(v0))),sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(42,12,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. fold((lambda v2:PairT PlacedT PlacedT. TransformD4(v1,D4V 1)),head(objects(v0)),sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(43,13,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),map((lambda v1:PlacedT. fold((lambda v2:PairT PlacedT PlacedT. TransformD4(fst(v2),D4V 1)),v1,objects(v0))),sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(43,13,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),map((lambda v1:PlacedT. fold((lambda v2:PairT PlacedT PlacedT. TransformD4(fst(v2),D4V 1)),v1,sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(43,13,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. fold((lambda v2:PairT PlacedT PlacedT. TransformD4(fst(v2),D4V 1)),head(objects(v0)),objects(v0))),sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(43,13,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. fold((lambda v2:PairT PlacedT PlacedT. TransformD4(fst(v2),D4V 1)),head(objects(v0)),sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(44,13,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),map((lambda v1:PlacedT. fold((lambda v2:PairT PlacedT PlacedT. TransformD4(v1,D4V 1)),head(objects(v0)),objects(v0))),sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(44,13,5,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),map((lambda v1:PlacedT. fold((lambda v2:PairT PlacedT PlacedT. TransformD4(v1,D4V 1)),head(objects(v0)),sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(45,14,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),map((lambda v1:PlacedT. fold((lambda v2:PairT PlacedT PlacedT. TransformD4(fst(v2),D4V 1)),head(objects(v0)),objects(v0))),sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(45,14,4,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),map((lambda v1:PlacedT. fold((lambda v2:PairT PlacedT PlacedT. TransformD4(fst(v2),D4V 1)),head(objects(v0)),sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))),objects(v0))))")
Selected AST; FV=[]; (lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. TransformD4(v1,D4V 1)),objects(v0))))
TaskInvented I0: (lambda v0:SceneT. (lambda __r1b0:PlacedT. TransformD4(head(objects(v0)),D4V 1))); repeats=4; portfolio MDL saving=3
TaskInvented I1: (lambda __r1h0:ListT PlacedT. map((lambda __r1b0:PlacedT. TransformD4(__r1b0,D4V 1)),__r1h0)); repeats=4; portfolio MDL saving=3
TaskInvented I2: (lambda v0:SceneT. sortBy((lambda __r1b0:PlacedT. x(Anchor(__r1b0,TL))),objects(v0))); repeats=20; portfolio MDL saving=83
TaskInvented I3: (lambda __r1h0:ListT PlacedT. (lambda __r1b0:PlacedT. fold((lambda __r1b1:PairT PlacedT PlacedT. TransformD4(__r1b0,D4V 1)),__r1b0,__r1h0))); repeats=6; portfolio MDL saving=9
TaskInvented I4: (lambda __r1h0:ListT PlacedT. (lambda v1:PlacedT. fold((lambda __r1b0:PairT PlacedT PlacedT. TransformD4(fst(__r1b0),D4V 1)),v1,__r1h0))); repeats=12; portfolio MDL saving=20
TaskInvented I5: (lambda v0:SceneT. (lambda __r1b0:PlacedT. fold((lambda __r1b1:PairT PlacedT PlacedT. TransformD4(__r1b0,D4V 1)),head(objects(v0)),objects(v0)))); repeats=4; portfolio MDL saving=18
Induced TSL=Signature(root VS) union inventions. BaseActivated=["Anchor","TransformD4","application","background","canvasSize","fold","fst","head","lambda","literal","map","mkScene","objects","sortBy","x"]; TaskInvented=["I0","I1","I2","I3","I4","I5"]; StructuralPriorCount=0
```
