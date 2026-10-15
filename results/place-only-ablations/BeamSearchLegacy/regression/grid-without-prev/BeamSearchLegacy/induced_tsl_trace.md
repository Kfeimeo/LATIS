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
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,2),(1,1)]
Learn(CoordT; observations=2; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","coord","coordAdd","Anchor"]
MRV immediate domains=[(0,20),(1,2)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
MRV immediate domains=[(0,3),(1,2)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=8 children=[7,4]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,3)]
Nonempty VS_add node=9 children=[4,7]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,3)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=13 children=[4,12]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,3)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=21 children=[16,20]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,3)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=28 children=[24,27]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,3)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=36 children=[31,35]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,3)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=44 children=[39,43]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=46 children=[45,24]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_add node=47 children=[24,45]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=49 children=[31,48]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=51 children=[16,50]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=53 children=[39,52]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=58 children=[57,54]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=63 children=[62,59]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=65 children=[57,64]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=67 children=[62,66]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=72 children=[71,68]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=2; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_add node=77 children=[76,73]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=79 children=[71,78]; conditional scalar inverse (observed operand; remaining values deduced)
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=2; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_subtract node=81 children=[76,80]; conditional scalar inverse (observed operand; remaining values deduced)
Nonempty VS_coord node=83 children=[82,4]; component projection of output specification
Learn(ObjectT; observations=2; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","objectOf"]
Nonempty VS_place node=87 children=[86,83]; place inverse: output local geometry and absolute origin; no translation template
Nonempty VS_lambda node=88 children=[87]; function graph -> parameter binding and output points
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_map node=92 children=[88,91]; map witness: corresponding f(x_i)=y_i; element instances=2
Learn(ColorT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","background"]
Nonempty VS_mkScene node=96 children=[1,95,92]; mkScene residual: canonical correspondence + Render-validated paint order; branch=0
Nonempty VS_lambda node=97 children=[96]; function graph -> parameter binding and output points
Task TSL supported Base=["Anchor","ObjectCells","ObjectColors","add","background","canvasSize","cardinality","colorToInt","coord","head","height","lambda","literal","map","mkScene","objectOf","objects","place","sortBy","subtract","width","x","y"]
Cost saturation C=1..0 root representatives=[]
Abstraction round=0; exact frontier=12; accepted=["I0","I1","I2","I3","I4"]
Learn uses I2 by typed definition expansion; ArrowT PlacedT PlacedT; observations=2; Gamma=[("v0",SceneT)]
Learn uses I2 by typed definition expansion; ArrowT PlacedT PlacedT; observations=2; Gamma=[("v0",SceneT)]
Task TSL supported Base=["Anchor","ObjectCells","ObjectColors","add","application","background","canvasSize","cardinality","colorToInt","coord","head","height","lambda","literal","map","mkScene","objectOf","objects","place","sortBy","subtract","width","x","y"]
Cost saturation C=1..0 root representatives=[]
Abstraction round=1; exact frontier=12; accepted=[]
Cost saturation C=1..0 root representatives=[]
Exact original Render(P(Encode(x)))=y: True; MDL rank=(39,11,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coord(add(IntV (-1),add(width(canvasSize(v0)),IntV (-1))),add(width(canvasSize(v0)),IntV (-1))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(39,11,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coord(add(add(width(canvasSize(v0)),IntV (-1)),IntV (-1)),add(width(canvasSize(v0)),IntV (-1))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(41,12,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),map((lambda v1:PlacedT. place(objectOf(v1),coord(add(IntV (-1),add(width(canvasSize(v0)),IntV (-1))),add(width(canvasSize(v0)),IntV (-1))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(41,12,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),map((lambda v1:PlacedT. place(objectOf(v1),coord(add(add(width(canvasSize(v0)),IntV (-1)),IntV (-1)),add(width(canvasSize(v0)),IntV (-1))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(37,11,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coord(add(IntV (-2),width(canvasSize(v0))),add(width(canvasSize(v0)),IntV (-1))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(37,11,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coord(add(width(canvasSize(v0)),IntV (-2)),add(width(canvasSize(v0)),IntV (-1))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(39,12,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),map((lambda v1:PlacedT. place(objectOf(v1),coord(add(IntV (-2),width(canvasSize(v0))),add(width(canvasSize(v0)),IntV (-1))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(39,12,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),map((lambda v1:PlacedT. place(objectOf(v1),coord(add(width(canvasSize(v0)),IntV (-2)),add(width(canvasSize(v0)),IntV (-1))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(39,12,2,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(head(objects(v0))),coord(add(IntV (-2),width(canvasSize(v0))),add(width(canvasSize(v0)),IntV (-1))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(39,12,2,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(head(objects(v0))),coord(add(width(canvasSize(v0)),IntV (-2)),add(width(canvasSize(v0)),IntV (-1))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(41,12,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coord(add(IntV (-2),x(coord(width(canvasSize(v0)),IntV 0))),add(width(canvasSize(v0)),IntV (-1))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(40,12,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coord(add(height(canvasSize(v0)),IntV (-4)),add(width(canvasSize(v0)),IntV (-1))))),objects(v0))))")
Selected AST; FV=[]; (lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. place(objectOf(v1),coord(add(IntV (-1),add(width(canvasSize(v0)),IntV (-1))),add(width(canvasSize(v0)),IntV (-1))))),objects(v0))))
TaskInvented I0: (lambda __r1h0:IntT. (lambda v0:SceneT. coord(add(IntV (-2),__r1h0),add(width(canvasSize(v0)),IntV (-1))))); repeats=4; portfolio MDL saving=7
TaskInvented I1: (lambda __r1h0:IntT. (lambda __r1h1:IntT. (lambda v0:SceneT. coord(add(__r1h0,__r1h1),add(width(canvasSize(v0)),IntV (-1)))))); repeats=12; portfolio MDL saving=18
TaskInvented I2: (lambda __r1h0:IntT. (lambda __r1h1:IntT. (lambda v0:SceneT. (lambda __r1b0:PlacedT. place(objectOf(__r1b0),coord(add(__r1h0,__r1h1),add(width(canvasSize(v0)),IntV (-1)))))))); repeats=10; portfolio MDL saving=19
TaskInvented I3: (lambda __r1h0:IntT. (lambda __r1h1:IntT. (lambda v0:SceneT. map((lambda __r1b0:PlacedT. place(objectOf(__r1b0),coord(add(__r1h0,__r1h1),add(width(canvasSize(v0)),IntV (-1))))),objects(v0))))); repeats=10; portfolio MDL saving=9
TaskInvented I4: (lambda __r1h0:ColorT. (lambda __r1h1:IntT. (lambda __r1h2:IntT. (lambda v0:SceneT. mkScene(canvasSize(v0),__r1h0,map((lambda __r1b0:PlacedT. place(objectOf(__r1b0),coord(add(__r1h1,__r1h2),add(width(canvasSize(v0)),IntV (-1))))),objects(v0))))))); repeats=10; portfolio MDL saving=4
Induced TSL=Signature(root VS) union inventions. BaseActivated=["Anchor","ObjectCells","ObjectColors","add","application","background","canvasSize","cardinality","colorToInt","coord","head","height","lambda","literal","map","mkScene","objectOf","objects","place","sortBy","subtract","width","x","y"]; TaskInvented=["I0","I1","I2","I3","I4"]; StructuralPriorCount=0
```
