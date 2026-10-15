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
MRV immediate domains=[(0,1)]
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,2),(1,2)]
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Learn(VecT; observations=2; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,2),(1,2)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
Nonempty VS_coordDelta node=11 children=[7,10]; indexed algebra inverse; child equivalence classes retain all structural representatives
MRV immediate domains=[(0,1),(1,10)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=19 children=[15,18]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=26 children=[22,25]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=33 children=[29,32]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=40 children=[36,39]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=45 children=[44,41]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=47 children=[44,46]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=51 children=[50,12]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=56 children=[55,52]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=58 children=[50,57]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=60 children=[55,59]; conditional scalar inverse (observed operand; remaining values deduced)
Nonempty VS_vec node=62 children=[12,61]; component projection of output specification
Nonempty VS_Translate node=64 children=[4,63]; Translate: v_i=Anchor(target_i,TL)-Anchor(source_i,TL); Vec specification=[Vec 10 10,Vec 10 13]
Nonempty VS_lambda node=65 children=[64]; function graph -> parameter binding and output points
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_map node=69 children=[65,68]; map witness: corresponding f(x_i)=y_i; element instances=2
Learn(ColorT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","background"]
Nonempty VS_mkScene node=73 children=[1,72,69]; mkScene residual: canonical correspondence + Render-validated paint order; branch=0
Nonempty VS_lambda node=74 children=[73]; function graph -> parameter binding and output points
Task TSL supported Base=["Anchor","ObjectColors","Translate","add","background","canvasSize","colorToInt","coord","coordDelta","head","height","lambda","literal","map","mkScene","objectOf","objects","setToList","sortBy","subtract","vec","width","x","y"]
Cost saturation C=1..0 root representatives=[]
Abstraction round=0; exact frontier=18; accepted=["I0","I1","I2","I3","I4"]
Learn uses I2 by typed definition expansion; ArrowT PlacedT PlacedT; observations=2; Gamma=[("v0",SceneT)]
Task TSL supported Base=["Anchor","ObjectColors","Translate","add","application","background","canvasSize","colorToInt","coord","coordDelta","head","height","lambda","literal","map","mkScene","objectOf","objects","setToList","sortBy","subtract","vec","width","x","y"]
Cost saturation C=1..0 root representatives=[]
Abstraction round=1; exact frontier=18; accepted=[]
Cost saturation C=1..0 root representatives=[]
Exact original Render(P(Encode(x)))=y: True; MDL rank=(42,13,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. Translate(v1,coordDelta(coord(add(width(canvasSize(v0)),IntV (-1)),add(height(canvasSize(v0)),IntV (-1))),Anchor(v1,BR)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(38,12,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. Translate(v1,vec(IntV 10,subtract(width(canvasSize(v0)),y(Anchor(v1,Center)))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(40,13,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),map((lambda v1:PlacedT. Translate(v1,vec(IntV 10,subtract(width(canvasSize(v0)),y(Anchor(v1,Center)))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(41,13,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. Translate(head(objects(v0)),vec(IntV 10,subtract(width(canvasSize(v0)),y(Anchor(v1,Center)))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(41,13,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. Translate(v1,vec(IntV 10,subtract(add(height(canvasSize(v0)),IntV (-1)),y(Anchor(v1,BL)))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(41,13,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. Translate(v1,vec(IntV 10,subtract(add(width(canvasSize(v0)),IntV (-1)),y(Anchor(v1,TL)))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(41,13,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. Translate(v1,vec(IntV 10,subtract(height(canvasSize(v0)),add(y(Anchor(v1,BL)),IntV 1))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(41,13,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. Translate(v1,vec(IntV 10,subtract(width(canvasSize(v0)),y(Anchor(head(objects(v0)),Center)))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(42,13,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),map((lambda v1:PlacedT. Translate(v1,vec(IntV 10,subtract(height(canvasSize(v0)),subtract(y(Anchor(v1,BL)),IntV (-1)))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(42,13,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),map((lambda v1:PlacedT. Translate(v1,vec(IntV 10,subtract(subtract(height(canvasSize(v0)),IntV 1),y(Anchor(v1,BL)))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(42,13,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),map((lambda v1:PlacedT. Translate(v1,vec(IntV 10,subtract(subtract(width(canvasSize(v0)),IntV 1),y(Anchor(v1,TL)))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(43,13,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. Translate(head(objects(v0)),vec(IntV 10,subtract(height(canvasSize(v0)),subtract(y(Anchor(v1,BL)),IntV (-1)))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(43,13,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. Translate(head(objects(v0)),vec(IntV 10,subtract(subtract(height(canvasSize(v0)),IntV 1),y(Anchor(v1,BL)))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(43,13,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. Translate(head(objects(v0)),vec(IntV 10,subtract(subtract(width(canvasSize(v0)),IntV 1),y(Anchor(v1,TL)))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(42,13,2,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. Translate(head(objects(v0)),vec(IntV 10,subtract(width(canvasSize(v0)),y(Anchor(head(objects(v0)),Center)))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(41,14,2,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. Translate(v1,vec(IntV 10,add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 9)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(43,14,2,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. Translate(v1,vec(IntV 10,add(add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV (-1)),IntV 10)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(43,14,2,2,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. Translate(v1,vec(IntV 10,add(add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 1),IntV 8)))),objects(v0))))")
Selected AST; FV=[]; (lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. Translate(v1,coordDelta(coord(add(width(canvasSize(v0)),IntV (-1)),add(height(canvasSize(v0)),IntV (-1))),Anchor(v1,BR)))),objects(v0))))
TaskInvented I0: (lambda __r1h0:IntT. (lambda __r1h1:IntT. (lambda v1:PlacedT. Translate(v1,vec(IntV 10,subtract(__r1h0,__r1h1)))))); repeats=14; portfolio MDL saving=16
TaskInvented I1: (lambda v0:SceneT. (lambda v1:PlacedT. vec(IntV 10,subtract(width(canvasSize(v0)),y(Anchor(v1,Center)))))); repeats=5; portfolio MDL saving=6
TaskInvented I2: (lambda __r1h0:IntT. (lambda __r1h1:AnchorT. (lambda __r1b0:PlacedT. Translate(__r1b0,vec(IntV 10,subtract(__r1h0,y(Anchor(__r1b0,__r1h1)))))))); repeats=6; portfolio MDL saving=7
TaskInvented I3: (lambda __r1h0:IntT. (lambda __r1h1:IntT. (lambda __r1b0:PlacedT. Translate(__r1b0,vec(IntV 10,add(add(colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))),__r1h0),__r1h1)))))); repeats=2; portfolio MDL saving=3
TaskInvented I4: (lambda __r1h0:ColorT. (lambda __r1h1:IntT. (lambda __r1h2:AnchorT. (lambda v0:SceneT. mkScene(canvasSize(v0),__r1h0,map((lambda __r1b0:PlacedT. Translate(__r1b0,vec(IntV 10,subtract(__r1h1,y(Anchor(__r1b0,__r1h2)))))),objects(v0))))))); repeats=6; portfolio MDL saving=6
Induced TSL=Signature(root VS) union inventions. BaseActivated=["Anchor","ObjectColors","Translate","add","application","background","canvasSize","colorToInt","coord","coordDelta","head","height","lambda","literal","map","mkScene","objectOf","objects","setToList","sortBy","subtract","vec","width","x","y"]; TaskInvented=["I0","I1","I2","I3","I4"]; StructuralPriorCount=0
```
