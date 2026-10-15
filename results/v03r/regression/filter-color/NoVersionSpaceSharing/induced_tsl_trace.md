# LATIS v0.3R induced TSL trace

Only training IO enters Learn; test labels are evaluated after selection. StructuralPriorCount=0.

The root is a typed Scene -> Scene graph. Return-type filtering visits the entire Base registry. Effect checks restrict conditional witness input domains. Each witness produces child learning tasks; a rule is activated only after every child has a nonempty version space. No task classifier selects scan.

## Deduction and child specifications

```text
Root specification Q0: ArrowT SceneT SceneT; observations=2; Gamma=[]. Original Grid targets reserved for exact verification.
Learn(ArrowT SceneT SceneT; observations=2; Gamma=[]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,19)]
Learn(SceneT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","mkScene"]
MRV immediate domains=[(0,2),(1,3),(2,17)]
Learn(SizeT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","size","canvasSize"]
Learn(ColorT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","background"]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,2)]
Learn(ArrowT PlacedT BoolT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,40)]
Learn(BoolT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","contains","get","equal","less","lessEqual"]
MRV immediate domains=[(0,1),(1,2)]
Learn(SetT CellT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","cells","ObjectCells"]
Learn(CellT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get"]
Nonempty VS_contains node=13 children=[7,10]; conditional algebra witness; ObjectCells(objectOf(v1)) / head(setToList(ObjectCells(objectOf(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1)))))
MRV immediate domains=[(0,2),(1,1)]
Learn(CellT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get"]
Learn(SetT CellT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","cells","ObjectCells"]
Nonempty VS_contains node=20 children=[17,14]; conditional algebra witness; ObjectCells(objectOf(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1))) / head(setToList(ObjectCells(objectOf(v1))))
MRV immediate domains=[(0,1),(1,3)]
Learn(SetT ColorT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","ObjectColors"]
Learn(ColorT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","background"]
Nonempty VS_contains node=25 children=[21,24]; conditional algebra witness; ObjectColors(objectOf(v1)) / ColorV 2
MRV immediate domains=[(0,2),(1,1)]
Learn(ColorT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","background"]
Learn(SetT ColorT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","ObjectColors"]
Nonempty VS_contains node=32 children=[29,26]; conditional algebra witness; ObjectColors(objectOf(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1))) / head(setToList(ObjectColors(objectOf(v1))))
MRV immediate domains=[(0,3),(1,1)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=37 children=[36,33]; conditional algebra witness; IntV 2 / colorToInt(head(setToList(ObjectColors(objectOf(v1)))))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=48 children=[40,43]; conditional algebra witness; x(Anchor(v1,TL)) / x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),TL))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=59 children=[51,54]; conditional algebra witness; y(Anchor(v1,TL)) / y(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),TL))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=70 children=[62,65]; conditional algebra witness; x(Anchor(v1,TR)) / x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),TR))
MRV immediate domains=[(0,1),(1,2)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=77 children=[71,74]; conditional algebra witness; x(Anchor(v1,Center)) / x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),Center))
MRV immediate domains=[(0,1),(1,3)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=82 children=[78,81]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(v1))))) / IntV 2
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=93 children=[85,88]; conditional algebra witness; x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),TL)) / x(Anchor(v1,TL))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=104 children=[96,99]; conditional algebra witness; y(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),TL)) / y(Anchor(v1,TL))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=115 children=[107,110]; conditional algebra witness; x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),TR)) / x(Anchor(v1,TR))
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=122 children=[119,116]; conditional algebra witness; x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),Center)) / x(Anchor(v1,Center))
Nonempty VS_lambda node=156 children=[123]; function graph -> parameter binding and output points
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_filter node=224 children=[156,159]; subsequence witness -> per-element membership predicate
MRV immediate domains=[(0,1),(1,2)]
Learn(ArrowT PlacedT BoolT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,40)]
Learn(BoolT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","contains","get","equal","less","lessEqual"]
MRV immediate domains=[(0,1),(1,2)]
Learn(SetT CellT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","cells","ObjectCells"]
Learn(CellT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get"]
Nonempty VS_contains node=231 children=[225,228]; conditional algebra witness; ObjectCells(objectOf(v1)) / head(setToList(ObjectCells(objectOf(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1)))))
MRV immediate domains=[(0,2),(1,1)]
Learn(CellT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get"]
Learn(SetT CellT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","cells","ObjectCells"]
Nonempty VS_contains node=238 children=[235,232]; conditional algebra witness; ObjectCells(objectOf(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1))) / head(setToList(ObjectCells(objectOf(v1))))
MRV immediate domains=[(0,1),(1,3)]
Learn(SetT ColorT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","ObjectColors"]
Learn(ColorT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","background"]
Nonempty VS_contains node=243 children=[239,242]; conditional algebra witness; ObjectColors(objectOf(v1)) / ColorV 2
MRV immediate domains=[(0,2),(1,1)]
Learn(ColorT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","background"]
Learn(SetT ColorT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","ObjectColors"]
Nonempty VS_contains node=250 children=[247,244]; conditional algebra witness; ObjectColors(objectOf(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1))) / head(setToList(ObjectColors(objectOf(v1))))
MRV immediate domains=[(0,3),(1,1)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=255 children=[254,251]; conditional algebra witness; IntV 2 / colorToInt(head(setToList(ObjectColors(objectOf(v1)))))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=266 children=[258,261]; conditional algebra witness; x(Anchor(v1,TL)) / x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),TL))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=277 children=[269,272]; conditional algebra witness; y(Anchor(v1,TL)) / y(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),TL))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=288 children=[280,283]; conditional algebra witness; x(Anchor(v1,TR)) / x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),TR))
MRV immediate domains=[(0,1),(1,2)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=295 children=[289,292]; conditional algebra witness; x(Anchor(v1,Center)) / x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),Center))
MRV immediate domains=[(0,1),(1,3)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=300 children=[296,299]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(v1))))) / IntV 2
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=311 children=[303,306]; conditional algebra witness; x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),TL)) / x(Anchor(v1,TL))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=322 children=[314,317]; conditional algebra witness; y(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),TL)) / y(Anchor(v1,TL))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=333 children=[325,328]; conditional algebra witness; x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),TR)) / x(Anchor(v1,TR))
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=340 children=[337,334]; conditional algebra witness; x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),Center)) / x(Anchor(v1,Center))
Nonempty VS_lambda node=374 children=[341]; function graph -> parameter binding and output points
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_filter node=442 children=[374,377]; subsequence witness -> per-element membership predicate
MRV immediate domains=[(0,1),(1,1)]
Learn(ArrowT PlacedT BoolT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,40)]
Learn(BoolT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","contains","get","equal","less","lessEqual"]
MRV immediate domains=[(0,1),(1,2)]
Learn(SetT CellT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","cells","ObjectCells"]
Learn(CellT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get"]
Nonempty VS_contains node=449 children=[443,446]; conditional algebra witness; ObjectCells(objectOf(v1)) / head(setToList(ObjectCells(objectOf(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1)))))
MRV immediate domains=[(0,2),(1,1)]
Learn(CellT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get"]
Learn(SetT CellT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","cells","ObjectCells"]
Nonempty VS_contains node=456 children=[453,450]; conditional algebra witness; ObjectCells(objectOf(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1))) / head(setToList(ObjectCells(objectOf(v1))))
MRV immediate domains=[(0,1),(1,3)]
Learn(SetT ColorT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","ObjectColors"]
Learn(ColorT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","background"]
Nonempty VS_contains node=461 children=[457,460]; conditional algebra witness; ObjectColors(objectOf(v1)) / ColorV 2
MRV immediate domains=[(0,2),(1,1)]
Learn(ColorT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","background"]
Learn(SetT ColorT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","ObjectColors"]
Nonempty VS_contains node=468 children=[465,462]; conditional algebra witness; ObjectColors(objectOf(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1))) / head(setToList(ObjectColors(objectOf(v1))))
MRV immediate domains=[(0,3),(1,1)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=473 children=[472,469]; conditional algebra witness; IntV 2 / colorToInt(head(setToList(ObjectColors(objectOf(v1)))))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=484 children=[476,479]; conditional algebra witness; x(Anchor(v1,TL)) / x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),TL))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=495 children=[487,490]; conditional algebra witness; y(Anchor(v1,TL)) / y(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),TL))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=506 children=[498,501]; conditional algebra witness; x(Anchor(v1,TR)) / x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),TR))
MRV immediate domains=[(0,1),(1,2)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=513 children=[507,510]; conditional algebra witness; x(Anchor(v1,Center)) / x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),Center))
MRV immediate domains=[(0,1),(1,3)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=518 children=[514,517]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(v1))))) / IntV 2
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=529 children=[521,524]; conditional algebra witness; x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),TL)) / x(Anchor(v1,TL))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=540 children=[532,535]; conditional algebra witness; y(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),TL)) / y(Anchor(v1,TL))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=551 children=[543,546]; conditional algebra witness; x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),TR)) / x(Anchor(v1,TR))
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=558 children=[555,552]; conditional algebra witness; x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),Center)) / x(Anchor(v1,Center))
Nonempty VS_lambda node=592 children=[559]; function graph -> parameter binding and output points
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_filter node=626 children=[592,593]; subsequence witness -> per-element membership predicate
MRV immediate domains=[(0,1),(1,2)]
Learn(ArrowT PlacedT BoolT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,176)]
Learn(BoolT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","contains","get","equal","less","lessEqual"]
MRV immediate domains=[(0,1),(1,2)]
Learn(SetT CellT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","cells","ObjectCells"]
Learn(CellT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get"]
Nonempty VS_contains node=633 children=[627,630]; conditional algebra witness; ObjectCells(objectOf(v1)) / head(setToList(ObjectCells(objectOf(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1)))))
MRV immediate domains=[(0,2),(1,1)]
Learn(CellT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get"]
Learn(SetT CellT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","cells","ObjectCells"]
Nonempty VS_contains node=640 children=[637,634]; conditional algebra witness; ObjectCells(objectOf(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1))) / head(setToList(ObjectCells(objectOf(v1))))
MRV immediate domains=[(0,1),(1,3)]
Learn(SetT ColorT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","ObjectColors"]
Learn(ColorT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","background"]
Nonempty VS_contains node=645 children=[641,644]; conditional algebra witness; ObjectColors(objectOf(v1)) / ColorV 2
MRV immediate domains=[(0,2),(1,1)]
Learn(ColorT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","background"]
Learn(SetT ColorT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","ObjectColors"]
Nonempty VS_contains node=652 children=[649,646]; conditional algebra witness; ObjectColors(objectOf(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1))) / head(setToList(ObjectColors(objectOf(v1))))
MRV immediate domains=[(0,3),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=657 children=[656,653]; conditional algebra witness; IntV 2 / colorToInt(head(setToList(ObjectColors(objectOf(v1)))))
MRV immediate domains=[(0,1),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=664 children=[658,661]; conditional algebra witness; cardinality(ObjectCells(objectOf(v1))) / cardinality(ObjectCells(objectOf(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1))))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=675 children=[667,670]; conditional algebra witness; x(Anchor(v1,TL)) / x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),TL))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=686 children=[678,681]; conditional algebra witness; y(Anchor(v1,TL)) / y(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),TL))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=697 children=[689,692]; conditional algebra witness; x(Anchor(v1,TR)) / x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),TR))
MRV immediate domains=[(0,1),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=704 children=[698,701]; conditional algebra witness; x(Anchor(v1,Center)) / x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),Center))
MRV immediate domains=[(0,1),(1,3)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=711 children=[705,708]; conditional algebra witness; y(Anchor(v1,Center)) / y(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),Center))
MRV immediate domains=[(0,1),(1,3)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=716 children=[712,715]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(v1))))) / IntV 2
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=723 children=[720,717]; conditional algebra witness; cardinality(ObjectCells(objectOf(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1)))) / cardinality(ObjectCells(objectOf(v1)))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=734 children=[726,729]; conditional algebra witness; x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),TL)) / x(Anchor(v1,TL))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=745 children=[737,740]; conditional algebra witness; y(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),TL)) / y(Anchor(v1,TL))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=756 children=[748,751]; conditional algebra witness; x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),TR)) / x(Anchor(v1,TR))
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=763 children=[760,757]; conditional algebra witness; x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),Center)) / x(Anchor(v1,Center))
MRV immediate domains=[(0,3),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=770 children=[767,764]; conditional algebra witness; y(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),Center)) / y(Anchor(v1,Center))
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=777 children=[774,771]; conditional algebra witness; x(Anchor(v1,TL)) / cardinality(ObjectCells(objectOf(v1)))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=788 children=[780,783]; conditional algebra witness; x(Anchor(v1,TL)) / y(Anchor(v1,TL))
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=795 children=[792,789]; conditional algebra witness; x(Anchor(v1,TL)) / y(Anchor(v1,Center))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=806 children=[798,801]; conditional algebra witness; x(Anchor(v1,TL)) / y(Anchor(head(objects(v0)),TL))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=817 children=[809,812]; conditional algebra witness; x(Anchor(v1,TL)) / x(Anchor(head(objects(v0)),TR))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=828 children=[820,823]; conditional algebra witness; x(Anchor(v1,TL)) / y(Anchor(head(objects(v0)),Center))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=839 children=[831,834]; conditional algebra witness; x(Anchor(v1,TL)) / y(Anchor(index(objects(v0),IntV 1),Center))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=850 children=[842,845]; conditional algebra witness; x(Anchor(v1,TL)) / y(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),TL))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=861 children=[853,856]; conditional algebra witness; x(Anchor(v1,TL)) / x(Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),TL))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=872 children=[864,867]; conditional algebra witness; x(Anchor(v1,TL)) / y(Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),TL))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=883 children=[875,878]; conditional algebra witness; x(Anchor(v1,TL)) / cardinality(ObjectCells(objectOf(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1))))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=894 children=[886,889]; conditional algebra witness; x(Anchor(v1,TL)) / y(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),TL))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=905 children=[897,900]; conditional algebra witness; x(Anchor(v1,TL)) / x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),TR))
MRV immediate domains=[(0,2),(1,3)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=916 children=[908,911]; conditional algebra witness; x(Anchor(v1,TL)) / y(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),Center))
MRV immediate domains=[(0,2),(1,3)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=927 children=[919,922]; conditional algebra witness; x(Anchor(v1,TL)) / y(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),TL))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=938 children=[930,933]; conditional algebra witness; x(Anchor(v1,TL)) / x(Anchor(index(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)),IntV 1),Center))
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=945 children=[942,939]; conditional algebra witness; x(Anchor(v1,TL)) / y(Anchor(index(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),IntV 1),TL))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=956 children=[948,951]; conditional algebra witness; x(Anchor(v1,TR)) / y(Anchor(v1,TL))
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=963 children=[960,957]; conditional algebra witness; x(Anchor(v1,TR)) / y(Anchor(v1,Center))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=974 children=[966,969]; conditional algebra witness; x(Anchor(v1,TR)) / y(Anchor(head(objects(v0)),TL))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=985 children=[977,980]; conditional algebra witness; x(Anchor(v1,TR)) / y(Anchor(head(objects(v0)),Center))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=996 children=[988,991]; conditional algebra witness; x(Anchor(v1,TR)) / y(Anchor(index(objects(v0),IntV 1),Center))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=1007 children=[999,1002]; conditional algebra witness; x(Anchor(v1,TR)) / y(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),TL))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=1018 children=[1010,1013]; conditional algebra witness; x(Anchor(v1,TR)) / x(Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),TL))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=1029 children=[1021,1024]; conditional algebra witness; x(Anchor(v1,TR)) / y(Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),TL))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=1040 children=[1032,1035]; conditional algebra witness; x(Anchor(v1,TR)) / x(Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),TR))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=1051 children=[1043,1046]; conditional algebra witness; x(Anchor(v1,TR)) / y(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),TL))
MRV immediate domains=[(0,2),(1,3)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=1062 children=[1054,1057]; conditional algebra witness; x(Anchor(v1,TR)) / y(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),Center))
MRV immediate domains=[(0,2),(1,3)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=1073 children=[1065,1068]; conditional algebra witness; x(Anchor(v1,TR)) / y(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),TL))
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=1080 children=[1077,1074]; conditional algebra witness; x(Anchor(v1,TR)) / y(Anchor(index(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),IntV 1),TL))
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=1087 children=[1084,1081]; conditional algebra witness; x(Anchor(v1,TL)) / cardinality(ObjectCells(objectOf(v1)))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=1098 children=[1090,1093]; conditional algebra witness; x(Anchor(v1,TL)) / y(Anchor(v1,TL))
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=1105 children=[1102,1099]; conditional algebra witness; x(Anchor(v1,TL)) / y(Anchor(v1,Center))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=1116 children=[1108,1111]; conditional algebra witness; x(Anchor(v1,TL)) / y(Anchor(head(objects(v0)),TL))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=1127 children=[1119,1122]; conditional algebra witness; x(Anchor(v1,TL)) / y(Anchor(head(objects(v0)),Center))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=1138 children=[1130,1133]; conditional algebra witness; x(Anchor(v1,TL)) / y(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),TL))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=1149 children=[1141,1144]; conditional algebra witness; x(Anchor(v1,TL)) / y(Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),TL))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=1160 children=[1152,1155]; conditional algebra witness; x(Anchor(v1,TL)) / cardinality(ObjectCells(objectOf(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1))))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=1171 children=[1163,1166]; conditional algebra witness; x(Anchor(v1,TL)) / x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),TL))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=1182 children=[1174,1177]; conditional algebra witness; x(Anchor(v1,TL)) / x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),TR))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=1193 children=[1185,1188]; conditional algebra witness; x(Anchor(v1,TL)) / x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),Center))
MRV immediate domains=[(0,2),(1,3)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=1204 children=[1196,1199]; conditional algebra witness; x(Anchor(v1,TL)) / y(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),TL))
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=1211 children=[1208,1205]; conditional algebra witness; x(Anchor(v1,TL)) / y(Anchor(index(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),IntV 1),TL))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=1222 children=[1214,1217]; conditional algebra witness; x(Anchor(v1,TR)) / y(Anchor(v1,TL))
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=1229 children=[1226,1223]; conditional algebra witness; x(Anchor(v1,TR)) / y(Anchor(v1,Center))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=1240 children=[1232,1235]; conditional algebra witness; x(Anchor(v1,TR)) / y(Anchor(head(objects(v0)),TL))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=1251 children=[1243,1246]; conditional algebra witness; x(Anchor(v1,TR)) / y(Anchor(head(objects(v0)),Center))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=1262 children=[1254,1257]; conditional algebra witness; x(Anchor(v1,TR)) / y(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),TL))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=1273 children=[1265,1268]; conditional algebra witness; x(Anchor(v1,TR)) / y(Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),TL))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=1284 children=[1276,1279]; conditional algebra witness; x(Anchor(v1,TR)) / x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),TR))
MRV immediate domains=[(0,2),(1,3)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=1295 children=[1287,1290]; conditional algebra witness; x(Anchor(v1,TR)) / y(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),TL))
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=1302 children=[1299,1296]; conditional algebra witness; x(Anchor(v1,TR)) / y(Anchor(index(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),IntV 1),TL))
Nonempty VS_lambda node=1336 children=[1303]; function graph -> parameter binding and output points
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_filter node=1404 children=[1336,1339]; subsequence witness -> per-element membership predicate
MRV immediate domains=[(0,1),(1,1)]
Learn(ArrowT PlacedT BoolT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,166)]
Learn(BoolT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","contains","get","equal","less","lessEqual"]
MRV immediate domains=[(0,1),(1,2)]
Learn(SetT CellT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","cells","ObjectCells"]
Learn(CellT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get"]
Nonempty VS_contains node=1411 children=[1405,1408]; conditional algebra witness; ObjectCells(objectOf(v1)) / head(setToList(ObjectCells(objectOf(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1)))))
MRV immediate domains=[(0,2),(1,1)]
Learn(CellT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get"]
Learn(SetT CellT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","cells","ObjectCells"]
Nonempty VS_contains node=1418 children=[1415,1412]; conditional algebra witness; ObjectCells(objectOf(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1))) / head(setToList(ObjectCells(objectOf(v1))))
MRV immediate domains=[(0,1),(1,3)]
Learn(SetT ColorT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","ObjectColors"]
Learn(ColorT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","background"]
Nonempty VS_contains node=1423 children=[1419,1422]; conditional algebra witness; ObjectColors(objectOf(v1)) / ColorV 2
MRV immediate domains=[(0,2),(1,1)]
Learn(ColorT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","background"]
Learn(SetT ColorT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","ObjectColors"]
Nonempty VS_contains node=1430 children=[1427,1424]; conditional algebra witness; ObjectColors(objectOf(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1))) / head(setToList(ObjectColors(objectOf(v1))))
MRV immediate domains=[(0,3),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=1435 children=[1434,1431]; conditional algebra witness; IntV 2 / colorToInt(head(setToList(ObjectColors(objectOf(v1)))))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=1446 children=[1438,1441]; conditional algebra witness; x(Anchor(v1,TL)) / x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),TL))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=1457 children=[1449,1452]; conditional algebra witness; y(Anchor(v1,TL)) / y(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),TL))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=1468 children=[1460,1463]; conditional algebra witness; x(Anchor(v1,TR)) / x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),TR))
MRV immediate domains=[(0,1),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=1475 children=[1469,1472]; conditional algebra witness; x(Anchor(v1,Center)) / x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),Center))
MRV immediate domains=[(0,1),(1,3)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=1480 children=[1476,1479]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(v1))))) / IntV 2
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=1491 children=[1483,1486]; conditional algebra witness; x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),TL)) / x(Anchor(v1,TL))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=1502 children=[1494,1497]; conditional algebra witness; y(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),TL)) / y(Anchor(v1,TL))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=1513 children=[1505,1508]; conditional algebra witness; x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),TR)) / x(Anchor(v1,TR))
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=1520 children=[1517,1514]; conditional algebra witness; x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),Center)) / x(Anchor(v1,Center))
MRV immediate domains=[(0,3),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=1529 children=[1526,1523]; conditional algebra witness; IntV 2 / x(Anchor(v1,TL))
MRV immediate domains=[(0,1),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=1536 children=[1530,1533]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(v1))))) / x(Anchor(v1,TL))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=1539 children=[1537,1538]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(v1))))) / x(Anchor(v1,Center))
MRV immediate domains=[(0,3),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=1550 children=[1545,1542]; conditional algebra witness; cardinality(ObjectCells(objectOf(index(objects(v0),IntV 1)))) / x(Anchor(v1,TR))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=1561 children=[1553,1556]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(head(objects(v0))))))) / x(Anchor(v1,TL))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=1572 children=[1564,1567]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(index(objects(v0),IntV 1)))))) / x(Anchor(v1,TL))
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=1579 children=[1576,1573]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(index(objects(v0),IntV 1)))))) / x(Anchor(v1,Center))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=1590 children=[1582,1585]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(index(tail(objects(v0)),IntV 1)))))) / x(Anchor(v1,TL))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=1601 children=[1593,1596]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(index(tail(objects(v0)),IntV 1)))))) / x(Anchor(v1,TR))
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=1608 children=[1605,1602]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(index(tail(objects(v0)),IntV 1)))))) / x(Anchor(v1,Center))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=1619 children=[1611,1614]; conditional algebra witness; cardinality(ObjectCells(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))) / x(Anchor(v1,TL))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=1630 children=[1622,1625]; conditional algebra witness; cardinality(ObjectCells(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))) / x(Anchor(v1,TR))
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=1637 children=[1634,1631]; conditional algebra witness; cardinality(ObjectCells(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))) / x(Anchor(v1,Center))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=1648 children=[1640,1643]; conditional algebra witness; x(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),TL)) / x(Anchor(v1,TL))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=1659 children=[1651,1654]; conditional algebra witness; x(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),Center)) / x(Anchor(v1,TL))
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=1666 children=[1663,1660]; conditional algebra witness; x(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),Center)) / x(Anchor(v1,Center))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=1677 children=[1669,1672]; conditional algebra witness; x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),TL)) / x(Anchor(v1,TR))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=1688 children=[1680,1683]; conditional algebra witness; x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),Center)) / x(Anchor(v1,TR))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=1699 children=[1691,1694]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))))))) / x(Anchor(v1,TL))
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=1706 children=[1703,1700]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))))))) / x(Anchor(v1,Center))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=1717 children=[1709,1712]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))))) / x(Anchor(v1,TL))
MRV immediate domains=[(0,1),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=1724 children=[1718,1721]; conditional algebra witness; cardinality(ObjectCells(objectOf(v1))) / x(Anchor(v1,TR))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=1735 children=[1727,1730]; conditional algebra witness; cardinality(ObjectCells(objectOf(head(objects(v0))))) / x(Anchor(v1,TR))
MRV immediate domains=[(0,3),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=1746 children=[1741,1738]; conditional algebra witness; cardinality(ObjectCells(objectOf(index(objects(v0),IntV 1)))) / x(Anchor(v1,TR))
MRV immediate domains=[(0,3),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=1753 children=[1750,1747]; conditional algebra witness; cardinality(ObjectCells(objectOf(index(objects(v0),IntV 1)))) / x(Anchor(v1,Center))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=1764 children=[1756,1759]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(index(tail(objects(v0)),IntV 1)))))) / x(Anchor(v1,TL))
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=1771 children=[1768,1765]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(index(tail(objects(v0)),IntV 1)))))) / x(Anchor(v1,Center))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=1782 children=[1774,1777]; conditional algebra witness; cardinality(ObjectCells(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))) / x(Anchor(v1,TL))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=1793 children=[1785,1788]; conditional algebra witness; cardinality(ObjectCells(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))) / x(Anchor(v1,TR))
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=1800 children=[1797,1794]; conditional algebra witness; cardinality(ObjectCells(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))) / x(Anchor(v1,Center))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=1811 children=[1803,1806]; conditional algebra witness; cardinality(ObjectCells(objectOf(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1)))) / x(Anchor(v1,TR))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=1822 children=[1814,1817]; conditional algebra witness; x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),TL)) / x(Anchor(v1,TL))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=1833 children=[1825,1828]; conditional algebra witness; x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),TL)) / x(Anchor(v1,TR))
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=1840 children=[1837,1834]; conditional algebra witness; x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),TL)) / x(Anchor(v1,Center))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=1851 children=[1843,1846]; conditional algebra witness; x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),TR)) / x(Anchor(v1,TR))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=1862 children=[1854,1857]; conditional algebra witness; x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),Center)) / x(Anchor(v1,TR))
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=1869 children=[1866,1863]; conditional algebra witness; x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),Center)) / x(Anchor(v1,Center))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=1880 children=[1872,1875]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))))) / x(Anchor(v1,TL))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=1891 children=[1883,1886]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))))) / x(Anchor(v1,TR))
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=1898 children=[1895,1892]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))))) / x(Anchor(v1,Center))
Nonempty VS_lambda node=1932 children=[1899]; function graph -> parameter binding and output points
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_filter node=1966 children=[1932,1933]; subsequence witness -> per-element membership predicate
MRV immediate domains=[(0,1),(1,2)]
Learn(ArrowT PlacedT BoolT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,40)]
Learn(BoolT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","contains","get","equal","less","lessEqual"]
MRV immediate domains=[(0,1),(1,2)]
Learn(SetT CellT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","cells","ObjectCells"]
Learn(CellT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get"]
Nonempty VS_contains node=1973 children=[1967,1970]; conditional algebra witness; ObjectCells(objectOf(v1)) / head(setToList(ObjectCells(objectOf(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1)))))
MRV immediate domains=[(0,2),(1,1)]
Learn(CellT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get"]
Learn(SetT CellT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","cells","ObjectCells"]
Nonempty VS_contains node=1980 children=[1977,1974]; conditional algebra witness; ObjectCells(objectOf(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1))) / head(setToList(ObjectCells(objectOf(v1))))
MRV immediate domains=[(0,1),(1,3)]
Learn(SetT ColorT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","ObjectColors"]
Learn(ColorT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","background"]
Nonempty VS_contains node=1985 children=[1981,1984]; conditional algebra witness; ObjectColors(objectOf(v1)) / ColorV 2
MRV immediate domains=[(0,2),(1,1)]
Learn(ColorT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","background"]
Learn(SetT ColorT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","ObjectColors"]
Nonempty VS_contains node=1992 children=[1989,1986]; conditional algebra witness; ObjectColors(objectOf(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1))) / head(setToList(ObjectColors(objectOf(v1))))
MRV immediate domains=[(0,3),(1,1)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=1997 children=[1996,1993]; conditional algebra witness; IntV 2 / colorToInt(head(setToList(ObjectColors(objectOf(v1)))))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=2008 children=[2000,2003]; conditional algebra witness; x(Anchor(v1,TL)) / x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),TL))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=2019 children=[2011,2014]; conditional algebra witness; y(Anchor(v1,TL)) / y(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),TL))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=2030 children=[2022,2025]; conditional algebra witness; x(Anchor(v1,TR)) / x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),TR))
MRV immediate domains=[(0,1),(1,2)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=2037 children=[2031,2034]; conditional algebra witness; x(Anchor(v1,Center)) / x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),Center))
MRV immediate domains=[(0,1),(1,3)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=2042 children=[2038,2041]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(v1))))) / IntV 2
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=2053 children=[2045,2048]; conditional algebra witness; x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),TL)) / x(Anchor(v1,TL))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=2064 children=[2056,2059]; conditional algebra witness; y(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),TL)) / y(Anchor(v1,TL))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=2075 children=[2067,2070]; conditional algebra witness; x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),TR)) / x(Anchor(v1,TR))
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=2082 children=[2079,2076]; conditional algebra witness; x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),Center)) / x(Anchor(v1,Center))
Nonempty VS_lambda node=2116 children=[2083]; function graph -> parameter binding and output points
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_filter node=2184 children=[2116,2119]; subsequence witness -> per-element membership predicate
MRV immediate domains=[(0,1),(1,2)]
Learn(ArrowT PlacedT BoolT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,40)]
Learn(BoolT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","contains","get","equal","less","lessEqual"]
MRV immediate domains=[(0,1),(1,2)]
Learn(SetT CellT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","cells","ObjectCells"]
Learn(CellT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get"]
Nonempty VS_contains node=2191 children=[2185,2188]; conditional algebra witness; ObjectCells(objectOf(v1)) / head(setToList(ObjectCells(objectOf(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1)))))
MRV immediate domains=[(0,2),(1,1)]
Learn(CellT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get"]
Learn(SetT CellT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","cells","ObjectCells"]
Nonempty VS_contains node=2198 children=[2195,2192]; conditional algebra witness; ObjectCells(objectOf(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1))) / head(setToList(ObjectCells(objectOf(v1))))
MRV immediate domains=[(0,1),(1,3)]
Learn(SetT ColorT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","ObjectColors"]
Learn(ColorT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","background"]
Nonempty VS_contains node=2203 children=[2199,2202]; conditional algebra witness; ObjectColors(objectOf(v1)) / ColorV 2
MRV immediate domains=[(0,2),(1,1)]
Learn(ColorT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","background"]
Learn(SetT ColorT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","ObjectColors"]
Nonempty VS_contains node=2210 children=[2207,2204]; conditional algebra witness; ObjectColors(objectOf(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1))) / head(setToList(ObjectColors(objectOf(v1))))
MRV immediate domains=[(0,3),(1,1)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=2215 children=[2214,2211]; conditional algebra witness; IntV 2 / colorToInt(head(setToList(ObjectColors(objectOf(v1)))))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=2226 children=[2218,2221]; conditional algebra witness; x(Anchor(v1,TL)) / x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),TL))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=2237 children=[2229,2232]; conditional algebra witness; y(Anchor(v1,TL)) / y(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),TL))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=2248 children=[2240,2243]; conditional algebra witness; x(Anchor(v1,TR)) / x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),TR))
MRV immediate domains=[(0,1),(1,2)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=2255 children=[2249,2252]; conditional algebra witness; x(Anchor(v1,Center)) / x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),Center))
MRV immediate domains=[(0,1),(1,3)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=2260 children=[2256,2259]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(v1))))) / IntV 2
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=2271 children=[2263,2266]; conditional algebra witness; x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),TL)) / x(Anchor(v1,TL))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=2282 children=[2274,2277]; conditional algebra witness; y(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),TL)) / y(Anchor(v1,TL))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=2293 children=[2285,2288]; conditional algebra witness; x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),TR)) / x(Anchor(v1,TR))
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=2300 children=[2297,2294]; conditional algebra witness; x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),Center)) / x(Anchor(v1,Center))
Nonempty VS_lambda node=2334 children=[2301]; function graph -> parameter binding and output points
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_filter node=2402 children=[2334,2337]; subsequence witness -> per-element membership predicate
MRV immediate domains=[(0,1),(1,1)]
Learn(ArrowT PlacedT BoolT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,40)]
Learn(BoolT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","contains","get","equal","less","lessEqual"]
MRV immediate domains=[(0,1),(1,2)]
Learn(SetT CellT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","cells","ObjectCells"]
Learn(CellT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get"]
Nonempty VS_contains node=2409 children=[2403,2406]; conditional algebra witness; ObjectCells(objectOf(v1)) / head(setToList(ObjectCells(objectOf(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1)))))
MRV immediate domains=[(0,2),(1,1)]
Learn(CellT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get"]
Learn(SetT CellT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","cells","ObjectCells"]
Nonempty VS_contains node=2416 children=[2413,2410]; conditional algebra witness; ObjectCells(objectOf(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1))) / head(setToList(ObjectCells(objectOf(v1))))
MRV immediate domains=[(0,1),(1,3)]
Learn(SetT ColorT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","ObjectColors"]
Learn(ColorT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","background"]
Nonempty VS_contains node=2421 children=[2417,2420]; conditional algebra witness; ObjectColors(objectOf(v1)) / ColorV 2
MRV immediate domains=[(0,2),(1,1)]
Learn(ColorT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","background"]
Learn(SetT ColorT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","ObjectColors"]
Nonempty VS_contains node=2428 children=[2425,2422]; conditional algebra witness; ObjectColors(objectOf(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1))) / head(setToList(ObjectColors(objectOf(v1))))
MRV immediate domains=[(0,3),(1,1)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=2433 children=[2432,2429]; conditional algebra witness; IntV 2 / colorToInt(head(setToList(ObjectColors(objectOf(v1)))))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=2444 children=[2436,2439]; conditional algebra witness; x(Anchor(v1,TL)) / x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),TL))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=2455 children=[2447,2450]; conditional algebra witness; y(Anchor(v1,TL)) / y(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),TL))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=2466 children=[2458,2461]; conditional algebra witness; x(Anchor(v1,TR)) / x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),TR))
MRV immediate domains=[(0,1),(1,2)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=2473 children=[2467,2470]; conditional algebra witness; x(Anchor(v1,Center)) / x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),Center))
MRV immediate domains=[(0,1),(1,3)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=2478 children=[2474,2477]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(v1))))) / IntV 2
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=2489 children=[2481,2484]; conditional algebra witness; x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),TL)) / x(Anchor(v1,TL))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=2500 children=[2492,2495]; conditional algebra witness; y(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),TL)) / y(Anchor(v1,TL))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=2511 children=[2503,2506]; conditional algebra witness; x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),TR)) / x(Anchor(v1,TR))
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=2518 children=[2515,2512]; conditional algebra witness; x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),Center)) / x(Anchor(v1,Center))
Nonempty VS_lambda node=2552 children=[2519]; function graph -> parameter binding and output points
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_filter node=2586 children=[2552,2553]; subsequence witness -> per-element membership predicate
MRV immediate domains=[(0,1),(1,1)]
Learn(ArrowT PlacedT BoolT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,40)]
Learn(BoolT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","contains","get","equal","less","lessEqual"]
MRV immediate domains=[(0,1),(1,2)]
Learn(SetT CellT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","cells","ObjectCells"]
Learn(CellT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get"]
Nonempty VS_contains node=2593 children=[2587,2590]; conditional algebra witness; ObjectCells(objectOf(v1)) / head(setToList(ObjectCells(objectOf(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1)))))
MRV immediate domains=[(0,2),(1,1)]
Learn(CellT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get"]
Learn(SetT CellT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","cells","ObjectCells"]
Nonempty VS_contains node=2600 children=[2597,2594]; conditional algebra witness; ObjectCells(objectOf(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1))) / head(setToList(ObjectCells(objectOf(v1))))
MRV immediate domains=[(0,1),(1,3)]
Learn(SetT ColorT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","ObjectColors"]
Learn(ColorT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","background"]
Nonempty VS_contains node=2605 children=[2601,2604]; conditional algebra witness; ObjectColors(objectOf(v1)) / ColorV 2
MRV immediate domains=[(0,2),(1,1)]
Learn(ColorT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","background"]
Learn(SetT ColorT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","ObjectColors"]
Nonempty VS_contains node=2612 children=[2609,2606]; conditional algebra witness; ObjectColors(objectOf(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1))) / head(setToList(ObjectColors(objectOf(v1))))
MRV immediate domains=[(0,3),(1,1)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=2617 children=[2616,2613]; conditional algebra witness; IntV 2 / colorToInt(head(setToList(ObjectColors(objectOf(v1)))))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=2628 children=[2620,2623]; conditional algebra witness; x(Anchor(v1,TL)) / x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),TL))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=2639 children=[2631,2634]; conditional algebra witness; y(Anchor(v1,TL)) / y(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),TL))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=2650 children=[2642,2645]; conditional algebra witness; x(Anchor(v1,TR)) / x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),TR))
MRV immediate domains=[(0,1),(1,2)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=2657 children=[2651,2654]; conditional algebra witness; x(Anchor(v1,Center)) / x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),Center))
MRV immediate domains=[(0,1),(1,3)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=2662 children=[2658,2661]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(v1))))) / IntV 2
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=2673 children=[2665,2668]; conditional algebra witness; x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),TL)) / x(Anchor(v1,TL))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=2684 children=[2676,2679]; conditional algebra witness; y(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),TL)) / y(Anchor(v1,TL))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=2695 children=[2687,2690]; conditional algebra witness; x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),TR)) / x(Anchor(v1,TR))
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=2702 children=[2699,2696]; conditional algebra witness; x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),Center)) / x(Anchor(v1,Center))
Nonempty VS_lambda node=2736 children=[2703]; function graph -> parameter binding and output points
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_filter node=2770 children=[2736,2737]; subsequence witness -> per-element membership predicate
MRV immediate domains=[(0,1),(1,2)]
Learn(ArrowT PlacedT BoolT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,166)]
Learn(BoolT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","contains","get","equal","less","lessEqual"]
MRV immediate domains=[(0,1),(1,2)]
Learn(SetT CellT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","cells","ObjectCells"]
Learn(CellT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get"]
Nonempty VS_contains node=2777 children=[2771,2774]; conditional algebra witness; ObjectCells(objectOf(v1)) / head(setToList(ObjectCells(objectOf(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1)))))
MRV immediate domains=[(0,2),(1,1)]
Learn(CellT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get"]
Learn(SetT CellT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","cells","ObjectCells"]
Nonempty VS_contains node=2784 children=[2781,2778]; conditional algebra witness; ObjectCells(objectOf(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1))) / head(setToList(ObjectCells(objectOf(v1))))
MRV immediate domains=[(0,1),(1,3)]
Learn(SetT ColorT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","ObjectColors"]
Learn(ColorT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","background"]
Nonempty VS_contains node=2789 children=[2785,2788]; conditional algebra witness; ObjectColors(objectOf(v1)) / ColorV 2
MRV immediate domains=[(0,2),(1,1)]
Learn(ColorT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","background"]
Learn(SetT ColorT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","ObjectColors"]
Nonempty VS_contains node=2796 children=[2793,2790]; conditional algebra witness; ObjectColors(objectOf(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1))) / head(setToList(ObjectColors(objectOf(v1))))
MRV immediate domains=[(0,3),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=2801 children=[2800,2797]; conditional algebra witness; IntV 2 / colorToInt(head(setToList(ObjectColors(objectOf(v1)))))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=2812 children=[2804,2807]; conditional algebra witness; x(Anchor(v1,TL)) / x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),TL))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=2823 children=[2815,2818]; conditional algebra witness; y(Anchor(v1,TL)) / y(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),TL))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=2834 children=[2826,2829]; conditional algebra witness; x(Anchor(v1,TR)) / x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),TR))
MRV immediate domains=[(0,1),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=2841 children=[2835,2838]; conditional algebra witness; x(Anchor(v1,Center)) / x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),Center))
MRV immediate domains=[(0,1),(1,3)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=2846 children=[2842,2845]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(v1))))) / IntV 2
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=2857 children=[2849,2852]; conditional algebra witness; x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),TL)) / x(Anchor(v1,TL))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=2868 children=[2860,2863]; conditional algebra witness; y(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),TL)) / y(Anchor(v1,TL))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=2879 children=[2871,2874]; conditional algebra witness; x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),TR)) / x(Anchor(v1,TR))
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=2886 children=[2883,2880]; conditional algebra witness; x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),Center)) / x(Anchor(v1,Center))
MRV immediate domains=[(0,3),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=2895 children=[2892,2889]; conditional algebra witness; IntV 2 / x(Anchor(v1,TL))
MRV immediate domains=[(0,1),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=2902 children=[2896,2899]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(v1))))) / x(Anchor(v1,TL))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=2905 children=[2903,2904]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(v1))))) / x(Anchor(v1,Center))
MRV immediate domains=[(0,3),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=2916 children=[2911,2908]; conditional algebra witness; cardinality(ObjectCells(objectOf(index(objects(v0),IntV 1)))) / x(Anchor(v1,TR))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=2927 children=[2919,2922]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(head(objects(v0))))))) / x(Anchor(v1,TL))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=2938 children=[2930,2933]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(index(objects(v0),IntV 1)))))) / x(Anchor(v1,TL))
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=2945 children=[2942,2939]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(index(objects(v0),IntV 1)))))) / x(Anchor(v1,Center))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=2956 children=[2948,2951]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(index(tail(objects(v0)),IntV 1)))))) / x(Anchor(v1,TL))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=2967 children=[2959,2962]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(index(tail(objects(v0)),IntV 1)))))) / x(Anchor(v1,TR))
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=2974 children=[2971,2968]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(index(tail(objects(v0)),IntV 1)))))) / x(Anchor(v1,Center))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=2985 children=[2977,2980]; conditional algebra witness; cardinality(ObjectCells(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))) / x(Anchor(v1,TL))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=2996 children=[2988,2991]; conditional algebra witness; cardinality(ObjectCells(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))) / x(Anchor(v1,TR))
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=3003 children=[3000,2997]; conditional algebra witness; cardinality(ObjectCells(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))) / x(Anchor(v1,Center))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=3014 children=[3006,3009]; conditional algebra witness; x(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),TL)) / x(Anchor(v1,TL))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=3025 children=[3017,3020]; conditional algebra witness; x(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),Center)) / x(Anchor(v1,TL))
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=3032 children=[3029,3026]; conditional algebra witness; x(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),Center)) / x(Anchor(v1,Center))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=3043 children=[3035,3038]; conditional algebra witness; x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),TL)) / x(Anchor(v1,TR))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=3054 children=[3046,3049]; conditional algebra witness; x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),Center)) / x(Anchor(v1,TR))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=3065 children=[3057,3060]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))))))) / x(Anchor(v1,TL))
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=3072 children=[3069,3066]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))))))) / x(Anchor(v1,Center))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=3083 children=[3075,3078]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))))) / x(Anchor(v1,TL))
MRV immediate domains=[(0,1),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=3090 children=[3084,3087]; conditional algebra witness; cardinality(ObjectCells(objectOf(v1))) / x(Anchor(v1,TR))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=3101 children=[3093,3096]; conditional algebra witness; cardinality(ObjectCells(objectOf(head(objects(v0))))) / x(Anchor(v1,TR))
MRV immediate domains=[(0,3),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=3112 children=[3107,3104]; conditional algebra witness; cardinality(ObjectCells(objectOf(index(objects(v0),IntV 1)))) / x(Anchor(v1,TR))
MRV immediate domains=[(0,3),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=3119 children=[3116,3113]; conditional algebra witness; cardinality(ObjectCells(objectOf(index(objects(v0),IntV 1)))) / x(Anchor(v1,Center))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=3130 children=[3122,3125]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(index(tail(objects(v0)),IntV 1)))))) / x(Anchor(v1,TL))
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=3137 children=[3134,3131]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(index(tail(objects(v0)),IntV 1)))))) / x(Anchor(v1,Center))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=3148 children=[3140,3143]; conditional algebra witness; cardinality(ObjectCells(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))) / x(Anchor(v1,TL))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=3159 children=[3151,3154]; conditional algebra witness; cardinality(ObjectCells(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))) / x(Anchor(v1,TR))
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=3166 children=[3163,3160]; conditional algebra witness; cardinality(ObjectCells(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))) / x(Anchor(v1,Center))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=3177 children=[3169,3172]; conditional algebra witness; cardinality(ObjectCells(objectOf(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1)))) / x(Anchor(v1,TR))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=3188 children=[3180,3183]; conditional algebra witness; x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),TL)) / x(Anchor(v1,TL))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=3199 children=[3191,3194]; conditional algebra witness; x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),TL)) / x(Anchor(v1,TR))
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=3206 children=[3203,3200]; conditional algebra witness; x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),TL)) / x(Anchor(v1,Center))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=3217 children=[3209,3212]; conditional algebra witness; x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),TR)) / x(Anchor(v1,TR))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=3228 children=[3220,3223]; conditional algebra witness; x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),Center)) / x(Anchor(v1,TR))
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=3235 children=[3232,3229]; conditional algebra witness; x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),Center)) / x(Anchor(v1,Center))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=3246 children=[3238,3241]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))))) / x(Anchor(v1,TL))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=3257 children=[3249,3252]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))))) / x(Anchor(v1,TR))
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=3264 children=[3261,3258]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))))) / x(Anchor(v1,Center))
Nonempty VS_lambda node=3298 children=[3265]; function graph -> parameter binding and output points
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_filter node=3366 children=[3298,3301]; subsequence witness -> per-element membership predicate
MRV immediate domains=[(0,1),(1,1)]
Learn(ArrowT PlacedT BoolT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,60)]
Learn(BoolT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","contains","get","equal","less","lessEqual"]
MRV immediate domains=[(0,1),(1,2)]
Learn(SetT CellT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","cells","ObjectCells"]
Learn(CellT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get"]
Nonempty VS_contains node=3373 children=[3367,3370]; conditional algebra witness; ObjectCells(objectOf(v1)) / head(setToList(ObjectCells(objectOf(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1)))))
MRV immediate domains=[(0,2),(1,1)]
Learn(CellT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get"]
Learn(SetT CellT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","cells","ObjectCells"]
Nonempty VS_contains node=3380 children=[3377,3374]; conditional algebra witness; ObjectCells(objectOf(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1))) / head(setToList(ObjectCells(objectOf(v1))))
MRV immediate domains=[(0,1),(1,3)]
Learn(SetT ColorT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","ObjectColors"]
Learn(ColorT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","background"]
Nonempty VS_contains node=3385 children=[3381,3384]; conditional algebra witness; ObjectColors(objectOf(v1)) / ColorV 2
MRV immediate domains=[(0,2),(1,1)]
Learn(ColorT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","background"]
Learn(SetT ColorT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","ObjectColors"]
Nonempty VS_contains node=3392 children=[3389,3386]; conditional algebra witness; ObjectColors(objectOf(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1))) / head(setToList(ObjectColors(objectOf(v1))))
MRV immediate domains=[(0,3),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=3397 children=[3396,3393]; conditional algebra witness; IntV 2 / colorToInt(head(setToList(ObjectColors(objectOf(v1)))))
MRV immediate domains=[(0,1),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=3404 children=[3398,3401]; conditional algebra witness; cardinality(ObjectCells(objectOf(v1))) / cardinality(ObjectCells(objectOf(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1))))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=3415 children=[3407,3410]; conditional algebra witness; x(Anchor(v1,TL)) / x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),TL))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=3426 children=[3418,3421]; conditional algebra witness; y(Anchor(v1,TL)) / y(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),TL))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=3437 children=[3429,3432]; conditional algebra witness; x(Anchor(v1,TR)) / x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),TR))
MRV immediate domains=[(0,1),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=3444 children=[3438,3441]; conditional algebra witness; x(Anchor(v1,Center)) / x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),Center))
MRV immediate domains=[(0,1),(1,3)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=3451 children=[3445,3448]; conditional algebra witness; y(Anchor(v1,Center)) / y(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),Center))
MRV immediate domains=[(0,1),(1,3)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=3456 children=[3452,3455]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(v1))))) / IntV 2
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=3463 children=[3460,3457]; conditional algebra witness; cardinality(ObjectCells(objectOf(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1)))) / cardinality(ObjectCells(objectOf(v1)))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=3474 children=[3466,3469]; conditional algebra witness; x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),TL)) / x(Anchor(v1,TL))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=3485 children=[3477,3480]; conditional algebra witness; y(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),TL)) / y(Anchor(v1,TL))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=3496 children=[3488,3491]; conditional algebra witness; x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),TR)) / x(Anchor(v1,TR))
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=3503 children=[3500,3497]; conditional algebra witness; x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),Center)) / x(Anchor(v1,Center))
MRV immediate domains=[(0,3),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=3510 children=[3507,3504]; conditional algebra witness; y(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),Center)) / y(Anchor(v1,Center))
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=3517 children=[3514,3511]; conditional algebra witness; cardinality(ObjectCells(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))) / cardinality(ObjectCells(objectOf(v1)))
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=3524 children=[3521,3518]; conditional algebra witness; x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),TL)) / cardinality(ObjectCells(objectOf(v1)))
MRV immediate domains=[(0,1),(1,3)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=3529 children=[3525,3528]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(v1))))) / IntV 2
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=3536 children=[3533,3530]; conditional algebra witness; cardinality(ObjectCells(objectOf(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1)))) / cardinality(ObjectCells(objectOf(v1)))
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=3543 children=[3540,3537]; conditional algebra witness; x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),TL)) / cardinality(ObjectCells(objectOf(v1)))
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=3550 children=[3547,3544]; conditional algebra witness; x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),Center)) / cardinality(ObjectCells(objectOf(v1)))
Nonempty VS_lambda node=3584 children=[3551]; function graph -> parameter binding and output points
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_filter node=3618 children=[3584,3585]; subsequence witness -> per-element membership predicate
Nonempty VS_mkScene node=3684 children=[3,6,3619]; mkScene residual: canonical correspondence + Render-validated paint order; branch=0
Nonempty VS_lambda node=3717 children=[3684]; function graph -> parameter binding and output points
Exact original Render(P(Encode(x)))=y: True; MDL rank=(25,9,2,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. contains(ObjectColors(objectOf(v1)),ColorV 2)),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(27,8,2,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. contains(ObjectColors(objectOf(v1)),ColorV 2)),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(31,12,2,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. equal(IntV 2,colorToInt(head(setToList(ObjectColors(objectOf(v1))))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(31,12,2,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. equal(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 2)),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(33,11,2,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. equal(IntV 2,colorToInt(head(setToList(ObjectColors(objectOf(v1))))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(33,11,2,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. equal(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 2)),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(35,12,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. contains(ObjectColors(objectOf(v1)),ColorV 2)),sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(35,12,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. contains(ObjectColors(objectOf(v1)),ColorV 2)),sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(35,12,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. contains(ObjectColors(objectOf(v1)),ColorV 2)),sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(35,12,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. contains(ObjectColors(objectOf(v1)),ColorV 2)),sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(37,11,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. contains(ObjectColors(objectOf(v1)),ColorV 2)),sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(37,11,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. contains(ObjectColors(objectOf(v1)),ColorV 2)),sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(37,11,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. contains(ObjectColors(objectOf(v1)),ColorV 2)),sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(37,11,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. contains(ObjectColors(objectOf(v1)),ColorV 2)),sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(37,13,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. contains(ObjectColors(objectOf(v1)),ColorV 2)),tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(37,13,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. contains(ObjectColors(objectOf(v1)),ColorV 2)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(37,13,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. contains(ObjectColors(objectOf(v1)),ColorV 2)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(38,11,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. less(x(Anchor(v1,BL)),IntV 10)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(38,11,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. less(x(Anchor(v1,BL)),IntV 10)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(38,11,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. less(x(Anchor(v1,BL)),IntV 9)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(38,11,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. less(x(Anchor(v1,BL)),IntV 9)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(38,11,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. less(x(Anchor(v1,BR)),IntV 10)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(38,11,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. less(x(Anchor(v1,BR)),IntV 10)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(38,11,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. less(x(Anchor(v1,BR)),IntV 9)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(38,11,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. less(x(Anchor(v1,BR)),IntV 9)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(38,11,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. less(x(Anchor(v1,TL)),IntV 10)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(38,11,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. less(x(Anchor(v1,TL)),IntV 10)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(38,11,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. less(x(Anchor(v1,TL)),IntV 9)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(38,11,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. less(x(Anchor(v1,TL)),IntV 9)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(38,11,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. less(x(Anchor(v1,TR)),IntV 10)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(38,11,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. less(x(Anchor(v1,TR)),IntV 10)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(38,11,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. less(x(Anchor(v1,TR)),IntV 9)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Selected AST; FV=[]; (lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. contains(ObjectColors(objectOf(v1)),ColorV 2)),objects(v0))))
TaskInvented I0: (lambda v1:PlacedT. equal(IntV 2,colorToInt(head(setToList(ObjectColors(objectOf(v1))))))); repeats=2; portfolio MDL saving=3
TaskInvented I1: (lambda v1:PlacedT. equal(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 2)); repeats=2; portfolio MDL saving=3
Induced TSL=Signature(root VS) union inventions. BaseActivated=["Anchor","ObjectCells","ObjectColors","canvasSize","cardinality","colorToInt","contains","equal","filter","head","lambda","less","literal","mkScene","objectOf","objects","setToList","sortBy","tail","x","y"]; TaskInvented=["I0","I1"]; StructuralPriorCount=0

```

## Supported map / scan rules

```text

```

## Final expression and free-variable dependencies

```text
(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. contains(ObjectColors(objectOf(v1)),ColorV 2)),objects(v0))))
FV=[]
```

## Version space, inventions, induced TSL, exact verification and MDL

```json
{"task":"E:\\dev\\AI\\ARC-AGI-1\\results\\v03\\regression\\filter-color\\task.json","mode":"NoVersionSpaceSharing","train_exact":true,"heldout_exact":true,"heldout_available":true,"failure":"None","failure_evidence":"training exact; heldout is assessed only after MDL selection","program":"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. contains(ObjectColors(objectOf(v1)),ColorV 2)),objects(v0))))","typed_ast":{"type":"ArrowT SceneT SceneT","expression":"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. contains(ObjectColors(objectOf(v1)),ColorV 2)),objects(v0))))","free_variables":[],"binding_accesses":["v0","v1"],"children":[{"type":"SceneT","expression":"mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. contains(ObjectColors(objectOf(v1)),ColorV 2)),objects(v0)))","free_variables":["v0"],"binding_accesses":["v0","v1"],"children":[{"type":"SizeT","expression":"canvasSize(v0)","free_variables":["v0"],"binding_accesses":["v0"],"children":[{"type":"SceneT","expression":"v0","free_variables":["v0"],"binding_accesses":["v0"],"children":[]}]},{"type":"ColorT","expression":"ColorV 0","free_variables":[],"binding_accesses":[],"children":[]},{"type":"ListT PlacedT","expression":"filter((lambda v1:PlacedT. contains(ObjectColors(objectOf(v1)),ColorV 2)),objects(v0))","free_variables":["v0"],"binding_accesses":["v0","v1"],"children":[{"type":"ArrowT PlacedT BoolT","expression":"(lambda v1:PlacedT. contains(ObjectColors(objectOf(v1)),ColorV 2))","free_variables":[],"binding_accesses":["v1"],"children":[{"type":"BoolT","expression":"contains(ObjectColors(objectOf(v1)),ColorV 2)","free_variables":["v1"],"binding_accesses":["v1"],"children":[{"type":"SetT ColorT","expression":"ObjectColors(objectOf(v1))","free_variables":["v1"],"binding_accesses":["v1"],"children":[{"type":"ObjectT","expression":"objectOf(v1)","free_variables":["v1"],"binding_accesses":["v1"],"children":[{"type":"PlacedT","expression":"v1","free_variables":["v1"],"binding_accesses":["v1"],"children":[]}]}]},{"type":"ColorT","expression":"ColorV 2","free_variables":[],"binding_accesses":[],"children":[]}]}]},{"type":"ListT PlacedT","expression":"objects(v0)","free_variables":["v0"],"binding_accesses":["v0"],"children":[{"type":"SceneT","expression":"v0","free_variables":["v0"],"binding_accesses":["v0"],"children":[]}]}]}]}]},"portfolio_count":32,"version_space_derivations":32,"base_activated":[{"symbol":"Anchor","source":"BaseActivated","support":[{"specification":"ArrowT SceneT SceneT; observations=2; Gamma=[]","witness":"function graph -> parameter binding and output points"}]},{"symbol":"ObjectCells","source":"BaseActivated","support":[{"specification":"ArrowT SceneT SceneT; observations=2; Gamma=[]","witness":"function graph -> parameter binding and output points"}]},{"symbol":"ObjectColors","source":"BaseActivated","support":[{"specification":"ArrowT SceneT SceneT; observations=2; Gamma=[]","witness":"function graph -> parameter binding and output points"}]},{"symbol":"canvasSize","source":"BaseActivated","support":[{"specification":"ArrowT SceneT SceneT; observations=2; Gamma=[]","witness":"function graph -> parameter binding and output points"}]},{"symbol":"cardinality","source":"BaseActivated","support":[{"specification":"ArrowT SceneT SceneT; observations=2; Gamma=[]","witness":"function graph -> parameter binding and output points"}]},{"symbol":"colorToInt","source":"BaseActivated","support":[{"specification":"ArrowT SceneT SceneT; observations=2; Gamma=[]","witness":"function graph -> parameter binding and output points"}]},{"symbol":"contains","source":"BaseActivated","support":[{"specification":"ArrowT SceneT SceneT; observations=2; Gamma=[]","witness":"function graph -> parameter binding and output points"}]},{"symbol":"equal","source":"BaseActivated","support":[{"specification":"ArrowT SceneT SceneT; observations=2; Gamma=[]","witness":"function graph -> parameter binding and output points"}]},{"symbol":"filter","source":"BaseActivated","support":[{"specification":"ArrowT SceneT SceneT; observations=2; Gamma=[]","witness":"function graph -> parameter binding and output points"}]},{"symbol":"head","source":"BaseActivated","support":[{"specification":"ArrowT SceneT SceneT; observations=2; Gamma=[]","witness":"function graph -> parameter binding and output points"}]},{"symbol":"lambda","source":"BaseActivated","support":[{"specification":"ArrowT SceneT SceneT; observations=2; Gamma=[]","witness":"function graph -> parameter binding and output points"}]},{"symbol":"less","source":"BaseActivated","support":[{"specification":"ArrowT SceneT SceneT; observations=2; Gamma=[]","witness":"function graph -> parameter binding and output points"}]},{"symbol":"literal","source":"BaseActivated","support":[{"specification":"ArrowT SceneT SceneT; observations=2; Gamma=[]","witness":"function graph -> parameter binding and output points"}]},{"symbol":"mkScene","source":"BaseActivated","support":[{"specification":"ArrowT SceneT SceneT; observations=2; Gamma=[]","witness":"function graph -> parameter binding and output points"}]},{"symbol":"objectOf","source":"BaseActivated","support":[{"specification":"ArrowT SceneT SceneT; observations=2; Gamma=[]","witness":"function graph -> parameter binding and output points"}]},{"symbol":"objects","source":"BaseActivated","support":[{"specification":"ArrowT SceneT SceneT; observations=2; Gamma=[]","witness":"function graph -> parameter binding and output points"}]},{"symbol":"setToList","source":"BaseActivated","support":[{"specification":"ArrowT SceneT SceneT; observations=2; Gamma=[]","witness":"function graph -> parameter binding and output points"}]},{"symbol":"sortBy","source":"BaseActivated","support":[{"specification":"ArrowT SceneT SceneT; observations=2; Gamma=[]","witness":"function graph -> parameter binding and output points"}]},{"symbol":"tail","source":"BaseActivated","support":[{"specification":"ArrowT SceneT SceneT; observations=2; Gamma=[]","witness":"function graph -> parameter binding and output points"}]},{"symbol":"x","source":"BaseActivated","support":[{"specification":"ArrowT SceneT SceneT; observations=2; Gamma=[]","witness":"function graph -> parameter binding and output points"}]},{"symbol":"y","source":"BaseActivated","support":[{"specification":"ArrowT SceneT SceneT; observations=2; Gamma=[]","witness":"function graph -> parameter binding and output points"}]}],"task_invented":[{"name":"I0","source":"TaskInvented","originating_ast":{"type":"ArrowT PlacedT BoolT","expression":"(lambda v1:PlacedT. equal(IntV 2,colorToInt(head(setToList(ObjectColors(objectOf(v1)))))))","free_variables":[],"binding_accesses":["v1"],"children":[{"type":"BoolT","expression":"equal(IntV 2,colorToInt(head(setToList(ObjectColors(objectOf(v1))))))","free_variables":["v1"],"binding_accesses":["v1"],"children":[{"type":"IntT","expression":"IntV 2","free_variables":[],"binding_accesses":[],"children":[]},{"type":"IntT","expression":"colorToInt(head(setToList(ObjectColors(objectOf(v1)))))","free_variables":["v1"],"binding_accesses":["v1"],"children":[{"type":"ColorT","expression":"head(setToList(ObjectColors(objectOf(v1))))","free_variables":["v1"],"binding_accesses":["v1"],"children":[{"type":"ListT ColorT","expression":"setToList(ObjectColors(objectOf(v1)))","free_variables":["v1"],"binding_accesses":["v1"],"children":[{"type":"SetT ColorT","expression":"ObjectColors(objectOf(v1))","free_variables":["v1"],"binding_accesses":["v1"],"children":[{"type":"ObjectT","expression":"objectOf(v1)","free_variables":["v1"],"binding_accesses":["v1"],"children":[{"type":"PlacedT","expression":"v1","free_variables":["v1"],"binding_accesses":["v1"],"children":[]}]}]}]}]}]}]}]},"repeated_occurrences":2,"mdl_saving":3,"saving_scope":"exact-valid program portfolio","evidence":"exact repeated alpha-equivalent lambda subtrees across distinct exact-valid portfolio programs; definition cost=L+2, reference cost=2; no preassigned semantic label"},{"name":"I1","source":"TaskInvented","originating_ast":{"type":"ArrowT PlacedT BoolT","expression":"(lambda v1:PlacedT. equal(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 2))","free_variables":[],"binding_accesses":["v1"],"children":[{"type":"BoolT","expression":"equal(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 2)","free_variables":["v1"],"binding_accesses":["v1"],"children":[{"type":"IntT","expression":"colorToInt(head(setToList(ObjectColors(objectOf(v1)))))","free_variables":["v1"],"binding_accesses":["v1"],"children":[{"type":"ColorT","expression":"head(setToList(ObjectColors(objectOf(v1))))","free_variables":["v1"],"binding_accesses":["v1"],"children":[{"type":"ListT ColorT","expression":"setToList(ObjectColors(objectOf(v1)))","free_variables":["v1"],"binding_accesses":["v1"],"children":[{"type":"SetT ColorT","expression":"ObjectColors(objectOf(v1))","free_variables":["v1"],"binding_accesses":["v1"],"children":[{"type":"ObjectT","expression":"objectOf(v1)","free_variables":["v1"],"binding_accesses":["v1"],"children":[{"type":"PlacedT","expression":"v1","free_variables":["v1"],"binding_accesses":["v1"],"children":[]}]}]}]}]}]},{"type":"IntT","expression":"IntV 2","free_variables":[],"binding_accesses":[],"children":[]}]}]},"repeated_occurrences":2,"mdl_saving":3,"saving_scope":"exact-valid program portfolio","evidence":"exact repeated alpha-equivalent lambda subtrees across distinct exact-valid portfolio programs; definition cost=L+2, reference cost=2; no preassigned semantic label"}],"statistics":{"base_symbols_activated":21,"base_symbols_rejected":43,"bottom_up_terms":0,"branch_points":12,"depth_cutoffs":0,"distinct_symbol_count":9,"effect_pruned":0,"exact_verifier_calls":32,"expression_tests":181451,"failed_witness_decompositions":0,"first_solution_states":195630,"fv_bindings_eliminated":52253,"induced_tsl_symbol_count":23,"invented_abstractions":2,"join_nodes":0,"lookahead_witness_calls":283,"materialized_child_asts":1904,"materialized_complete_asts":32,"memo_hits":0,"memo_queries":638,"memoized_learning_tasks":0,"observer_terms":4760,"program_ast_length":14,"propagation_steps":13258,"recursive_learning_tasks":638,"root_learning_tasks":1,"semantic_deduplications":0,"structural_deduplications":0,"structural_prior_count":0,"successful_witness_decompositions":324,"total_expanded_work":195630,"union_nodes":766,"version_space_nodes":3717,"witness_calls":576,"witness_unavailable":249,"wall_clock_seconds":34.7129495},"bounded":false,"configuration":{"work_budget":250000,"depth":7,"frontier":32,"correspondence_budget":32},"mdl":{"score":25,"ast_length":14,"distinct_symbols":9,"portfolio_saving":6},"secondary_latent_path":"Base observer expressions only; v0.3 handwritten hierarchical codecs are legacy and are not called","predictions":[[[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,2,2,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,2,2,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]]]}
```

Limits: depth=7, extraction frontier=32; 64 witness decompositions/rule; 96 observer terms/type with 2 semantic alternatives. Forward observers are bounded Base subexpressions, not complete programs. The version space is the discovered bounded support, not all possible Base programs.

Abstraction compression is measured over distinct exact-valid portfolio programs. Naming a single-use scan lambda does not by itself shorten the winning AST. `I<n>` names are assigned only after discovery; any Attach interpretation is a post hoc semantic description.

Legacy hierarchical codecs are retained in solve-v03 and measured separately. This solver constructs its grounded observations from Base expressions; richer local/global codec discovery remains a coverage limitation.
