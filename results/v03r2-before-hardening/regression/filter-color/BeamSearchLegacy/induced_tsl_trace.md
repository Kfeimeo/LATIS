# LATIS v0.3R.2
StructuralPriorCount=0. Counterfactual labels never guide synthesis.
```text
Root specification Q0: ArrowT SceneT SceneT; observations=2; Gamma=[]. Original Grid targets reserved for exact verification.
Learn(ArrowT SceneT SceneT; observations=2; Gamma=[]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,12)]
Learn(SceneT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","mkScene"]
MRV immediate domains=[(0,2),(1,3),(2,11)]
Learn(SizeT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","size","canvasSize"]
Learn(ColorT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","background"]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,2)]
Learn(ArrowT PlacedT BoolT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,18)]
Learn(BoolT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","contains","get","equal","less","lessEqual"]
MRV immediate domains=[(0,1),(1,3)]
Learn(SetT ColorT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","ObjectColors"]
Learn(ColorT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","background"]
Nonempty VS_contains node=11 children=[7,10]; conditional algebra witness; ObjectColors(objectOf(v1)) / ColorV 2
MRV immediate domains=[(0,3),(1,2)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=18 children=[17,14]; conditional algebra witness; IntV 1 / subtract(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 1)
MRV immediate domains=[(0,2),(1,3)]
Nonempty VS_equal node=19 children=[14,17]; conditional algebra witness; subtract(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 1) / IntV 1
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=26 children=[22,25]; conditional algebra witness; x(Anchor(v1,BL)) / subtract(cardinality(ObjectCells(objectOf(v1))),IntV 1)
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=31 children=[30,27]; conditional algebra witness; subtract(x(Anchor(v1,BL)),IntV (-1)) / cardinality(ObjectCells(objectOf(v1)))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_equal node=32 children=[25,22]; conditional algebra witness; subtract(cardinality(ObjectCells(objectOf(v1))),IntV 1) / x(Anchor(v1,BL))
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_equal node=33 children=[27,30]; conditional algebra witness; cardinality(ObjectCells(objectOf(v1))) / subtract(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=40 children=[36,39]; conditional algebra witness; x(Anchor(v1,BR)) / subtract(y(Anchor(head(objects(v0)),TL)),IntV 1)
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=47 children=[43,46]; conditional algebra witness; subtract(x(Anchor(v1,BR)),IntV (-1)) / y(Anchor(head(objects(v0)),TR))
MRV immediate domains=[(0,3),(1,1)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=52 children=[51,48]; conditional algebra witness; IntV 2 / colorToInt(head(setToList(ObjectColors(objectOf(v1)))))
MRV immediate domains=[(0,1),(1,3)]
Nonempty VS_equal node=53 children=[48,51]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(v1))))) / IntV 2
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_equal node=54 children=[39,36]; conditional algebra witness; subtract(y(Anchor(head(objects(v0)),TL)),IntV 1) / x(Anchor(v1,BR))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_equal node=55 children=[46,43]; conditional algebra witness; y(Anchor(head(objects(v0)),TR)) / subtract(x(Anchor(v1,BR)),IntV (-1))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=59 children=[58,39]; conditional algebra witness; subtract(x(Anchor(v1,Center)),IntV (-1)) / subtract(y(Anchor(head(objects(v0)),TL)),IntV 1)
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_equal node=60 children=[39,58]; conditional algebra witness; subtract(y(Anchor(head(objects(v0)),TL)),IntV 1) / subtract(x(Anchor(v1,Center)),IntV (-1))
MRV immediate domains=[(0,2),(1,1)]
Learn(ColorT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","background"]
Learn(SetT ColorT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","ObjectColors"]
Nonempty VS_contains node=65 children=[64,61]; conditional algebra witness; ObjectColors(objectOf(index(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)),IntV 1))) / head(setToList(ObjectColors(objectOf(v1))))
MRV immediate domains=[(0,2),(1,1)]
Learn(CellT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get"]
Learn(SetT CellT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","cells","ObjectCells"]
Nonempty VS_contains node=70 children=[69,66]; conditional algebra witness; ObjectCells(objectOf(index(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)),IntV 1))) / head(setToList(ObjectCells(objectOf(v1))))
MRV immediate domains=[(0,1),(1,2)]
Learn(SetT CellT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","cells","ObjectCells"]
Learn(CellT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get"]
Nonempty VS_contains node=75 children=[71,74]; conditional algebra witness; ObjectCells(objectOf(v1)) / head(setToList(ObjectCells(objectOf(index(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)),IntV 1)))))
Nonempty VS_lambda node=77 children=[76]; function graph -> parameter binding and output points
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_filter node=81 children=[77,80]; filter exact multiplicity/order inverse; predicate consistency retained across duplicate inputs
MRV immediate domains=[(0,1),(1,2)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_filter node=85 children=[77,84]; filter exact multiplicity/order inverse; predicate consistency retained across duplicate inputs
MRV immediate domains=[(0,1),(1,1)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_filter node=87 children=[77,86]; filter exact multiplicity/order inverse; predicate consistency retained across duplicate inputs
MRV immediate domains=[(0,1),(1,1)]
Learn(ArrowT PlacedT BoolT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,90)]
Learn(BoolT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","contains","get","equal","less","lessEqual"]
MRV immediate domains=[(0,1),(1,3)]
Learn(SetT ColorT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","ObjectColors"]
Learn(ColorT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","background"]
Nonempty VS_contains node=11 children=[7,10]; conditional algebra witness; ObjectColors(objectOf(v1)) / ColorV 2
MRV immediate domains=[(0,3),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=91 children=[17,90]; conditional algebra witness; IntV 1 / subtract(x(Anchor(v1,BL)),IntV 1)
MRV immediate domains=[(0,1),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=92 children=[27,36]; conditional algebra witness; cardinality(ObjectCells(objectOf(v1))) / x(Anchor(v1,BR))
MRV immediate domains=[(0,2),(1,3)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=19 children=[14,17]; conditional algebra witness; subtract(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 1) / IntV 1
MRV immediate domains=[(0,3),(1,2)]
Nonempty VS_equal node=18 children=[17,14]; conditional algebra witness; IntV 1 / subtract(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 1)
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=26 children=[22,25]; conditional algebra witness; x(Anchor(v1,BL)) / subtract(cardinality(ObjectCells(objectOf(v1))),IntV 1)
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=31 children=[30,27]; conditional algebra witness; subtract(x(Anchor(v1,BL)),IntV (-1)) / cardinality(ObjectCells(objectOf(v1)))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_equal node=32 children=[25,22]; conditional algebra witness; subtract(cardinality(ObjectCells(objectOf(v1))),IntV 1) / x(Anchor(v1,BL))
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_equal node=33 children=[27,30]; conditional algebra witness; cardinality(ObjectCells(objectOf(v1))) / subtract(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,1),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=93 children=[48,22]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(v1))))) / x(Anchor(v1,BL))
MRV immediate domains=[(0,1),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=97 children=[48,96]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(v1))))) / x(Anchor(v1,Center))
MRV immediate domains=[(0,3),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=98 children=[51,22]; conditional algebra witness; IntV 2 / x(Anchor(v1,BL))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_less node=99 children=[25,36]; conditional algebra witness; subtract(cardinality(ObjectCells(objectOf(v1))),IntV 1) / x(Anchor(v1,BR))
MRV immediate domains=[(0,1),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=100 children=[27,43]; conditional algebra witness; cardinality(ObjectCells(objectOf(v1))) / subtract(x(Anchor(v1,BR)),IntV (-1))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=104 children=[103,36]; conditional algebra witness; cardinality(ObjectCells(objectOf(head(objects(v0))))) / x(Anchor(v1,BR))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_lessEqual node=105 children=[25,22]; conditional algebra witness; subtract(cardinality(ObjectCells(objectOf(v1))),IntV 1) / x(Anchor(v1,BL))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_lessEqual node=106 children=[25,96]; conditional algebra witness; subtract(cardinality(ObjectCells(objectOf(v1))),IntV 1) / x(Anchor(v1,Center))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_lessEqual node=107 children=[25,36]; conditional algebra witness; subtract(cardinality(ObjectCells(objectOf(v1))),IntV 1) / x(Anchor(v1,BR))
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_lessEqual node=108 children=[27,30]; conditional algebra witness; cardinality(ObjectCells(objectOf(v1))) / subtract(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_lessEqual node=109 children=[27,43]; conditional algebra witness; cardinality(ObjectCells(objectOf(v1))) / subtract(x(Anchor(v1,BR)),IntV (-1))
MRV immediate domains=[(0,3),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=114 children=[113,36]; conditional algebra witness; cardinality(ObjectCells(objectOf(head(tail(objects(v0)))))) / x(Anchor(v1,BR))
MRV immediate domains=[(0,3),(1,2)]
Nonempty VS_lessEqual node=115 children=[113,96]; conditional algebra witness; cardinality(ObjectCells(objectOf(head(tail(objects(v0)))))) / x(Anchor(v1,Center))
MRV immediate domains=[(0,3),(1,2)]
Nonempty VS_lessEqual node=116 children=[113,36]; conditional algebra witness; cardinality(ObjectCells(objectOf(head(tail(objects(v0)))))) / x(Anchor(v1,BR))
MRV immediate domains=[(0,1),(1,3)]
Nonempty VS_equal node=53 children=[48,51]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(v1))))) / IntV 2
MRV immediate domains=[(0,3),(1,1)]
Nonempty VS_equal node=52 children=[51,48]; conditional algebra witness; IntV 2 / colorToInt(head(setToList(ObjectColors(objectOf(v1)))))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=40 children=[36,39]; conditional algebra witness; x(Anchor(v1,BR)) / subtract(y(Anchor(head(objects(v0)),TL)),IntV 1)
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=47 children=[43,46]; conditional algebra witness; subtract(x(Anchor(v1,BR)),IntV (-1)) / y(Anchor(head(objects(v0)),TR))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_equal node=54 children=[39,36]; conditional algebra witness; subtract(y(Anchor(head(objects(v0)),TL)),IntV 1) / x(Anchor(v1,BR))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_equal node=55 children=[46,43]; conditional algebra witness; y(Anchor(head(objects(v0)),TR)) / subtract(x(Anchor(v1,BR)),IntV (-1))
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_less node=117 children=[48,90]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(v1))))) / subtract(x(Anchor(v1,BL)),IntV 1)
MRV immediate domains=[(0,1),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=121 children=[48,120]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(v1))))) / subtract(x(Anchor(v1,Center)),IntV 1)
MRV immediate domains=[(0,3),(1,2)]
Nonempty VS_less node=122 children=[51,90]; conditional algebra witness; IntV 2 / subtract(x(Anchor(v1,BL)),IntV 1)
MRV immediate domains=[(0,3),(1,2)]
Nonempty VS_less node=123 children=[51,120]; conditional algebra witness; IntV 2 / subtract(x(Anchor(v1,Center)),IntV 1)
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=127 children=[126,22]; conditional algebra witness; subtract(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV (-1)) / x(Anchor(v1,BL))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_less node=128 children=[126,96]; conditional algebra witness; subtract(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV (-1)) / x(Anchor(v1,Center))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_less node=129 children=[126,36]; conditional algebra witness; subtract(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV (-1)) / x(Anchor(v1,BR))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=133 children=[132,22]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(head(objects(v0))))))) / x(Anchor(v1,BL))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=137 children=[136,36]; conditional algebra witness; subtract(cardinality(ObjectCells(objectOf(head(objects(v0))))),IntV 1) / x(Anchor(v1,BR))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_less node=138 children=[103,43]; conditional algebra witness; cardinality(ObjectCells(objectOf(head(objects(v0))))) / subtract(x(Anchor(v1,BR)),IntV (-1))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_less node=139 children=[25,30]; conditional algebra witness; subtract(cardinality(ObjectCells(objectOf(v1))),IntV 1) / subtract(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_less node=140 children=[25,43]; conditional algebra witness; subtract(cardinality(ObjectCells(objectOf(v1))),IntV 1) / subtract(x(Anchor(v1,BR)),IntV (-1))
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_lessEqual node=141 children=[48,90]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(v1))))) / subtract(x(Anchor(v1,BL)),IntV 1)
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_lessEqual node=142 children=[48,120]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(v1))))) / subtract(x(Anchor(v1,Center)),IntV 1)
MRV immediate domains=[(0,3),(1,2)]
Nonempty VS_lessEqual node=143 children=[51,90]; conditional algebra witness; IntV 2 / subtract(x(Anchor(v1,BL)),IntV 1)
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_lessEqual node=144 children=[126,22]; conditional algebra witness; subtract(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV (-1)) / x(Anchor(v1,BL))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_lessEqual node=145 children=[126,96]; conditional algebra witness; subtract(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV (-1)) / x(Anchor(v1,Center))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_lessEqual node=146 children=[136,22]; conditional algebra witness; subtract(cardinality(ObjectCells(objectOf(head(objects(v0))))),IntV 1) / x(Anchor(v1,BL))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_lessEqual node=147 children=[136,96]; conditional algebra witness; subtract(cardinality(ObjectCells(objectOf(head(objects(v0))))),IntV 1) / x(Anchor(v1,Center))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_lessEqual node=148 children=[136,36]; conditional algebra witness; subtract(cardinality(ObjectCells(objectOf(head(objects(v0))))),IntV 1) / x(Anchor(v1,BR))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_lessEqual node=149 children=[103,30]; conditional algebra witness; cardinality(ObjectCells(objectOf(head(objects(v0))))) / subtract(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_lessEqual node=150 children=[103,43]; conditional algebra witness; cardinality(ObjectCells(objectOf(head(objects(v0))))) / subtract(x(Anchor(v1,BR)),IntV (-1))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_lessEqual node=151 children=[25,30]; conditional algebra witness; subtract(cardinality(ObjectCells(objectOf(v1))),IntV 1) / subtract(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=155 children=[154,43]; conditional algebra witness; subtract(cardinality(ObjectCells(objectOf(v1))),IntV (-1)) / subtract(x(Anchor(v1,BR)),IntV (-1))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_lessEqual node=156 children=[39,36]; conditional algebra witness; subtract(y(Anchor(head(objects(v0)),TL)),IntV 1) / x(Anchor(v1,BR))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_lessEqual node=157 children=[46,43]; conditional algebra witness; y(Anchor(head(objects(v0)),TR)) / subtract(x(Anchor(v1,BR)),IntV (-1))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=161 children=[160,22]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(head(tail(objects(v0)))))))) / x(Anchor(v1,BL))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_less node=162 children=[160,96]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(head(tail(objects(v0)))))))) / x(Anchor(v1,Center))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=166 children=[165,96]; conditional algebra witness; add(cardinality(ObjectCells(objectOf(head(tail(objects(v0)))))),IntV (-1)) / x(Anchor(v1,Center))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_less node=167 children=[165,36]; conditional algebra witness; add(cardinality(ObjectCells(objectOf(head(tail(objects(v0)))))),IntV (-1)) / x(Anchor(v1,BR))
MRV immediate domains=[(0,3),(1,2)]
Nonempty VS_less node=168 children=[113,43]; conditional algebra witness; cardinality(ObjectCells(objectOf(head(tail(objects(v0)))))) / subtract(x(Anchor(v1,BR)),IntV (-1))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_lessEqual node=169 children=[165,22]; conditional algebra witness; add(cardinality(ObjectCells(objectOf(head(tail(objects(v0)))))),IntV (-1)) / x(Anchor(v1,BL))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_lessEqual node=170 children=[165,96]; conditional algebra witness; add(cardinality(ObjectCells(objectOf(head(tail(objects(v0)))))),IntV (-1)) / x(Anchor(v1,Center))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_lessEqual node=171 children=[165,36]; conditional algebra witness; add(cardinality(ObjectCells(objectOf(head(tail(objects(v0)))))),IntV (-1)) / x(Anchor(v1,BR))
MRV immediate domains=[(0,3),(1,2)]
Nonempty VS_lessEqual node=172 children=[113,30]; conditional algebra witness; cardinality(ObjectCells(objectOf(head(tail(objects(v0)))))) / subtract(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,3),(1,2)]
Nonempty VS_lessEqual node=173 children=[113,43]; conditional algebra witness; cardinality(ObjectCells(objectOf(head(tail(objects(v0)))))) / subtract(x(Anchor(v1,BR)),IntV (-1))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_less node=174 children=[14,90]; conditional algebra witness; subtract(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 1) / subtract(x(Anchor(v1,BL)),IntV 1)
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_less node=175 children=[14,120]; conditional algebra witness; subtract(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 1) / subtract(x(Anchor(v1,Center)),IntV 1)
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_less node=176 children=[126,90]; conditional algebra witness; subtract(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV (-1)) / subtract(x(Anchor(v1,BL)),IntV 1)
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_less node=177 children=[126,120]; conditional algebra witness; subtract(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV (-1)) / subtract(x(Anchor(v1,Center)),IntV 1)
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_less node=178 children=[126,30]; conditional algebra witness; subtract(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV (-1)) / subtract(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_less node=179 children=[132,90]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(head(objects(v0))))))) / subtract(x(Anchor(v1,BL)),IntV 1)
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_less node=180 children=[132,120]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(head(objects(v0))))))) / subtract(x(Anchor(v1,Center)),IntV 1)
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_less node=181 children=[136,30]; conditional algebra witness; subtract(cardinality(ObjectCells(objectOf(head(objects(v0))))),IntV 1) / subtract(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_less node=182 children=[136,43]; conditional algebra witness; subtract(cardinality(ObjectCells(objectOf(head(objects(v0))))),IntV 1) / subtract(x(Anchor(v1,BR)),IntV (-1))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_less node=183 children=[39,43]; conditional algebra witness; subtract(y(Anchor(head(objects(v0)),TL)),IntV 1) / subtract(x(Anchor(v1,BR)),IntV (-1))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_lessEqual node=184 children=[126,90]; conditional algebra witness; subtract(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV (-1)) / subtract(x(Anchor(v1,BL)),IntV 1)
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_lessEqual node=185 children=[126,120]; conditional algebra witness; subtract(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV (-1)) / subtract(x(Anchor(v1,Center)),IntV 1)
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_lessEqual node=186 children=[132,90]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(head(objects(v0))))))) / subtract(x(Anchor(v1,BL)),IntV 1)
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_lessEqual node=187 children=[136,30]; conditional algebra witness; subtract(cardinality(ObjectCells(objectOf(head(objects(v0))))),IntV 1) / subtract(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=191 children=[190,43]; conditional algebra witness; subtract(cardinality(ObjectCells(objectOf(head(objects(v0))))),IntV (-1)) / subtract(x(Anchor(v1,BR)),IntV (-1))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_lessEqual node=192 children=[39,43]; conditional algebra witness; subtract(y(Anchor(head(objects(v0)),TL)),IntV 1) / subtract(x(Anchor(v1,BR)),IntV (-1))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_less node=193 children=[165,30]; conditional algebra witness; add(cardinality(ObjectCells(objectOf(head(tail(objects(v0)))))),IntV (-1)) / subtract(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_less node=194 children=[165,43]; conditional algebra witness; add(cardinality(ObjectCells(objectOf(head(tail(objects(v0)))))),IntV (-1)) / subtract(x(Anchor(v1,BR)),IntV (-1))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_lessEqual node=195 children=[160,90]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(head(tail(objects(v0)))))))) / subtract(x(Anchor(v1,BL)),IntV 1)
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_lessEqual node=196 children=[160,120]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(head(tail(objects(v0)))))))) / subtract(x(Anchor(v1,Center)),IntV 1)
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_lessEqual node=197 children=[165,120]; conditional algebra witness; add(cardinality(ObjectCells(objectOf(head(tail(objects(v0)))))),IntV (-1)) / subtract(x(Anchor(v1,Center)),IntV 1)
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_lessEqual node=198 children=[165,30]; conditional algebra witness; add(cardinality(ObjectCells(objectOf(head(tail(objects(v0)))))),IntV (-1)) / subtract(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,2),(1,1)]
Learn(ColorT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","background"]
Learn(SetT ColorT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","ObjectColors"]
Nonempty VS_contains node=65 children=[64,61]; conditional algebra witness; ObjectColors(objectOf(index(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)),IntV 1))) / head(setToList(ObjectColors(objectOf(v1))))
MRV immediate domains=[(0,1),(1,2)]
Learn(SetT CellT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","cells","ObjectCells"]
Learn(CellT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get"]
Nonempty VS_contains node=75 children=[71,74]; conditional algebra witness; ObjectCells(objectOf(v1)) / head(setToList(ObjectCells(objectOf(index(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)),IntV 1)))))
MRV immediate domains=[(0,2),(1,1)]
Learn(CellT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get"]
Learn(SetT CellT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","cells","ObjectCells"]
Nonempty VS_contains node=70 children=[69,66]; conditional algebra witness; ObjectCells(objectOf(index(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)),IntV 1))) / head(setToList(ObjectCells(objectOf(v1))))
Nonempty VS_lambda node=200 children=[199]; function graph -> parameter binding and output points
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_filter node=202 children=[200,201]; filter exact multiplicity/order inverse; predicate consistency retained across duplicate inputs
MRV immediate domains=[(0,1),(1,2)]
Learn(ArrowT PlacedT BoolT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,146)]
Learn(BoolT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","contains","get","equal","less","lessEqual"]
MRV immediate domains=[(0,1),(1,3)]
Learn(SetT ColorT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","ObjectColors"]
Learn(ColorT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","background"]
Nonempty VS_contains node=11 children=[7,10]; conditional algebra witness; ObjectColors(objectOf(v1)) / ColorV 2
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=206 children=[22,205]; conditional algebra witness; x(Anchor(v1,BL)) / y(Anchor(v1,TR))
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=208 children=[22,207]; conditional algebra witness; x(Anchor(v1,BL)) / y(Anchor(v1,Center))
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=209 children=[22,27]; conditional algebra witness; x(Anchor(v1,BL)) / cardinality(ObjectCells(objectOf(v1)))
MRV immediate domains=[(0,1),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=210 children=[95,205]; conditional algebra witness; x(Anchor(v1,Center)) / y(Anchor(v1,TR))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=211 children=[95,207]; conditional algebra witness; x(Anchor(v1,Center)) / y(Anchor(v1,Center))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_lessEqual node=212 children=[22,205]; conditional algebra witness; x(Anchor(v1,BL)) / y(Anchor(v1,TR))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_lessEqual node=213 children=[22,207]; conditional algebra witness; x(Anchor(v1,BL)) / y(Anchor(v1,Center))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_lessEqual node=214 children=[22,27]; conditional algebra witness; x(Anchor(v1,BL)) / cardinality(ObjectCells(objectOf(v1)))
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_lessEqual node=215 children=[95,205]; conditional algebra witness; x(Anchor(v1,Center)) / y(Anchor(v1,TR))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=216 children=[95,207]; conditional algebra witness; x(Anchor(v1,Center)) / y(Anchor(v1,Center))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=217 children=[95,27]; conditional algebra witness; x(Anchor(v1,Center)) / cardinality(ObjectCells(objectOf(v1)))
MRV immediate domains=[(0,3),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=18 children=[17,14]; conditional algebra witness; IntV 1 / subtract(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 1)
MRV immediate domains=[(0,2),(1,3)]
Nonempty VS_equal node=19 children=[14,17]; conditional algebra witness; subtract(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 1) / IntV 1
MRV immediate domains=[(0,2),(1,3)]
Nonempty VS_lessEqual node=218 children=[14,17]; conditional algebra witness; subtract(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 1) / IntV 1
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=26 children=[22,25]; conditional algebra witness; x(Anchor(v1,BL)) / subtract(cardinality(ObjectCells(objectOf(v1))),IntV 1)
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_equal node=32 children=[25,22]; conditional algebra witness; subtract(cardinality(ObjectCells(objectOf(v1))),IntV 1) / x(Anchor(v1,BL))
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=31 children=[30,27]; conditional algebra witness; subtract(x(Anchor(v1,BL)),IntV (-1)) / cardinality(ObjectCells(objectOf(v1)))
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_equal node=33 children=[27,30]; conditional algebra witness; cardinality(ObjectCells(objectOf(v1))) / subtract(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=219 children=[90,205]; conditional algebra witness; subtract(x(Anchor(v1,BL)),IntV 1) / y(Anchor(v1,TR))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_less node=220 children=[90,207]; conditional algebra witness; subtract(x(Anchor(v1,BL)),IntV 1) / y(Anchor(v1,Center))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_less node=221 children=[90,27]; conditional algebra witness; subtract(x(Anchor(v1,BL)),IntV 1) / cardinality(ObjectCells(objectOf(v1)))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=225 children=[22,224]; conditional algebra witness; x(Anchor(v1,BL)) / subtract(y(Anchor(v1,BL)),IntV 1)
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=229 children=[22,228]; conditional algebra witness; x(Anchor(v1,BL)) / x(Anchor(head(objects(v0)),BR))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=233 children=[22,232]; conditional algebra witness; x(Anchor(v1,BL)) / subtract(y(Anchor(v1,Center)),IntV (-1))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=237 children=[22,236]; conditional algebra witness; x(Anchor(v1,BL)) / subtract(y(Anchor(v1,TL)),IntV (-1))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=238 children=[22,154]; conditional algebra witness; x(Anchor(v1,BL)) / subtract(cardinality(ObjectCells(objectOf(v1))),IntV (-1))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=239 children=[22,46]; conditional algebra witness; x(Anchor(v1,BL)) / y(Anchor(head(objects(v0)),TR))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=243 children=[22,242]; conditional algebra witness; x(Anchor(v1,BL)) / subtract(y(Anchor(v1,TL)),IntV 1)
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=247 children=[22,246]; conditional algebra witness; x(Anchor(v1,BL)) / subtract(y(Anchor(v1,Center)),IntV 1)
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=251 children=[22,250]; conditional algebra witness; x(Anchor(v1,BL)) / y(Anchor(head(objects(v0)),Center))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=252 children=[120,205]; conditional algebra witness; subtract(x(Anchor(v1,Center)),IntV 1) / y(Anchor(v1,TR))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_less node=253 children=[120,207]; conditional algebra witness; subtract(x(Anchor(v1,Center)),IntV 1) / y(Anchor(v1,Center))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_less node=254 children=[120,27]; conditional algebra witness; subtract(x(Anchor(v1,Center)),IntV 1) / cardinality(ObjectCells(objectOf(v1)))
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_less node=255 children=[95,224]; conditional algebra witness; x(Anchor(v1,Center)) / subtract(y(Anchor(v1,BL)),IntV 1)
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_less node=256 children=[95,228]; conditional algebra witness; x(Anchor(v1,Center)) / x(Anchor(head(objects(v0)),BR))
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_less node=257 children=[95,232]; conditional algebra witness; x(Anchor(v1,Center)) / subtract(y(Anchor(v1,Center)),IntV (-1))
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_less node=258 children=[95,236]; conditional algebra witness; x(Anchor(v1,Center)) / subtract(y(Anchor(v1,TL)),IntV (-1))
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_less node=259 children=[95,154]; conditional algebra witness; x(Anchor(v1,Center)) / subtract(cardinality(ObjectCells(objectOf(v1))),IntV (-1))
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_less node=260 children=[95,46]; conditional algebra witness; x(Anchor(v1,Center)) / y(Anchor(head(objects(v0)),TR))
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_less node=261 children=[95,242]; conditional algebra witness; x(Anchor(v1,Center)) / subtract(y(Anchor(v1,TL)),IntV 1)
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_less node=262 children=[95,246]; conditional algebra witness; x(Anchor(v1,Center)) / subtract(y(Anchor(v1,Center)),IntV 1)
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_less node=263 children=[95,250]; conditional algebra witness; x(Anchor(v1,Center)) / y(Anchor(head(objects(v0)),Center))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_less node=264 children=[30,205]; conditional algebra witness; subtract(x(Anchor(v1,BL)),IntV (-1)) / y(Anchor(v1,TR))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_less node=265 children=[30,207]; conditional algebra witness; subtract(x(Anchor(v1,BL)),IntV (-1)) / y(Anchor(v1,Center))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=269 children=[30,268]; conditional algebra witness; subtract(x(Anchor(v1,BL)),IntV (-1)) / y(Anchor(v1,BR))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_lessEqual node=270 children=[90,205]; conditional algebra witness; subtract(x(Anchor(v1,BL)),IntV 1) / y(Anchor(v1,TR))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_lessEqual node=271 children=[90,27]; conditional algebra witness; subtract(x(Anchor(v1,BL)),IntV 1) / cardinality(ObjectCells(objectOf(v1)))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_lessEqual node=272 children=[22,236]; conditional algebra witness; x(Anchor(v1,BL)) / subtract(y(Anchor(v1,TL)),IntV (-1))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_lessEqual node=273 children=[22,25]; conditional algebra witness; x(Anchor(v1,BL)) / subtract(cardinality(ObjectCells(objectOf(v1))),IntV 1)
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_lessEqual node=274 children=[22,154]; conditional algebra witness; x(Anchor(v1,BL)) / subtract(cardinality(ObjectCells(objectOf(v1))),IntV (-1))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_lessEqual node=275 children=[22,46]; conditional algebra witness; x(Anchor(v1,BL)) / y(Anchor(head(objects(v0)),TR))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_lessEqual node=276 children=[22,242]; conditional algebra witness; x(Anchor(v1,BL)) / subtract(y(Anchor(v1,TL)),IntV 1)
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_lessEqual node=277 children=[22,246]; conditional algebra witness; x(Anchor(v1,BL)) / subtract(y(Anchor(v1,Center)),IntV 1)
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_lessEqual node=278 children=[22,250]; conditional algebra witness; x(Anchor(v1,BL)) / y(Anchor(head(objects(v0)),Center))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_lessEqual node=279 children=[120,205]; conditional algebra witness; subtract(x(Anchor(v1,Center)),IntV 1) / y(Anchor(v1,TR))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_lessEqual node=280 children=[120,27]; conditional algebra witness; subtract(x(Anchor(v1,Center)),IntV 1) / cardinality(ObjectCells(objectOf(v1)))
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_lessEqual node=281 children=[95,236]; conditional algebra witness; x(Anchor(v1,Center)) / subtract(y(Anchor(v1,TL)),IntV (-1))
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_lessEqual node=282 children=[95,154]; conditional algebra witness; x(Anchor(v1,Center)) / subtract(cardinality(ObjectCells(objectOf(v1))),IntV (-1))
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_lessEqual node=283 children=[95,46]; conditional algebra witness; x(Anchor(v1,Center)) / y(Anchor(head(objects(v0)),TR))
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_lessEqual node=284 children=[95,242]; conditional algebra witness; x(Anchor(v1,Center)) / subtract(y(Anchor(v1,TL)),IntV 1)
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_lessEqual node=285 children=[95,246]; conditional algebra witness; x(Anchor(v1,Center)) / subtract(y(Anchor(v1,Center)),IntV 1)
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_lessEqual node=286 children=[95,250]; conditional algebra witness; x(Anchor(v1,Center)) / y(Anchor(head(objects(v0)),Center))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_lessEqual node=287 children=[30,205]; conditional algebra witness; subtract(x(Anchor(v1,BL)),IntV (-1)) / y(Anchor(v1,TR))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_lessEqual node=288 children=[30,207]; conditional algebra witness; subtract(x(Anchor(v1,BL)),IntV (-1)) / y(Anchor(v1,Center))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_lessEqual node=289 children=[30,27]; conditional algebra witness; subtract(x(Anchor(v1,BL)),IntV (-1)) / cardinality(ObjectCells(objectOf(v1)))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=292 children=[291,205]; conditional algebra witness; subtract(x(Anchor(v1,BR)),IntV 1) / y(Anchor(v1,TR))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_lessEqual node=293 children=[291,27]; conditional algebra witness; subtract(x(Anchor(v1,BR)),IntV 1) / cardinality(ObjectCells(objectOf(v1)))
MRV immediate domains=[(0,3),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=52 children=[51,48]; conditional algebra witness; IntV 2 / colorToInt(head(setToList(ObjectColors(objectOf(v1)))))
MRV immediate domains=[(0,1),(1,3)]
Nonempty VS_equal node=53 children=[48,51]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(v1))))) / IntV 2
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=40 children=[36,39]; conditional algebra witness; x(Anchor(v1,BR)) / subtract(y(Anchor(head(objects(v0)),TL)),IntV 1)
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_equal node=54 children=[39,36]; conditional algebra witness; subtract(y(Anchor(head(objects(v0)),TL)),IntV 1) / x(Anchor(v1,BR))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=47 children=[43,46]; conditional algebra witness; subtract(x(Anchor(v1,BR)),IntV (-1)) / y(Anchor(head(objects(v0)),TR))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_equal node=55 children=[46,43]; conditional algebra witness; y(Anchor(head(objects(v0)),TR)) / subtract(x(Anchor(v1,BR)),IntV (-1))
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_less node=294 children=[48,25]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(v1))))) / subtract(cardinality(ObjectCells(objectOf(v1))),IntV 1)
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=295 children=[126,27]; conditional algebra witness; subtract(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV (-1)) / cardinality(ObjectCells(objectOf(v1)))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_less node=296 children=[90,236]; conditional algebra witness; subtract(x(Anchor(v1,BL)),IntV 1) / subtract(y(Anchor(v1,TL)),IntV (-1))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_less node=297 children=[90,25]; conditional algebra witness; subtract(x(Anchor(v1,BL)),IntV 1) / subtract(cardinality(ObjectCells(objectOf(v1))),IntV 1)
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_less node=298 children=[90,154]; conditional algebra witness; subtract(x(Anchor(v1,BL)),IntV 1) / subtract(cardinality(ObjectCells(objectOf(v1))),IntV (-1))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_less node=299 children=[90,46]; conditional algebra witness; subtract(x(Anchor(v1,BL)),IntV 1) / y(Anchor(head(objects(v0)),TR))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_less node=300 children=[90,242]; conditional algebra witness; subtract(x(Anchor(v1,BL)),IntV 1) / subtract(y(Anchor(v1,TL)),IntV 1)
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_less node=301 children=[90,246]; conditional algebra witness; subtract(x(Anchor(v1,BL)),IntV 1) / subtract(y(Anchor(v1,Center)),IntV 1)
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_less node=302 children=[90,250]; conditional algebra witness; subtract(x(Anchor(v1,BL)),IntV 1) / y(Anchor(head(objects(v0)),Center))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_less node=303 children=[22,39]; conditional algebra witness; x(Anchor(v1,BL)) / subtract(y(Anchor(head(objects(v0)),TL)),IntV 1)
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_less node=304 children=[120,236]; conditional algebra witness; subtract(x(Anchor(v1,Center)),IntV 1) / subtract(y(Anchor(v1,TL)),IntV (-1))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_less node=305 children=[120,154]; conditional algebra witness; subtract(x(Anchor(v1,Center)),IntV 1) / subtract(cardinality(ObjectCells(objectOf(v1))),IntV (-1))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_less node=306 children=[120,46]; conditional algebra witness; subtract(x(Anchor(v1,Center)),IntV 1) / y(Anchor(head(objects(v0)),TR))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_less node=307 children=[120,242]; conditional algebra witness; subtract(x(Anchor(v1,Center)),IntV 1) / subtract(y(Anchor(v1,TL)),IntV 1)
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_less node=308 children=[120,246]; conditional algebra witness; subtract(x(Anchor(v1,Center)),IntV 1) / subtract(y(Anchor(v1,Center)),IntV 1)
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_less node=309 children=[120,250]; conditional algebra witness; subtract(x(Anchor(v1,Center)),IntV 1) / y(Anchor(head(objects(v0)),Center))
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_less node=310 children=[95,39]; conditional algebra witness; x(Anchor(v1,Center)) / subtract(y(Anchor(head(objects(v0)),TL)),IntV 1)
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_less node=311 children=[30,224]; conditional algebra witness; subtract(x(Anchor(v1,BL)),IntV (-1)) / subtract(y(Anchor(v1,BL)),IntV 1)
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_less node=312 children=[30,232]; conditional algebra witness; subtract(x(Anchor(v1,BL)),IntV (-1)) / subtract(y(Anchor(v1,Center)),IntV (-1))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_less node=313 children=[30,236]; conditional algebra witness; subtract(x(Anchor(v1,BL)),IntV (-1)) / subtract(y(Anchor(v1,TL)),IntV (-1))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_less node=314 children=[30,154]; conditional algebra witness; subtract(x(Anchor(v1,BL)),IntV (-1)) / subtract(cardinality(ObjectCells(objectOf(v1))),IntV (-1))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_less node=315 children=[30,46]; conditional algebra witness; subtract(x(Anchor(v1,BL)),IntV (-1)) / y(Anchor(head(objects(v0)),TR))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_less node=316 children=[30,246]; conditional algebra witness; subtract(x(Anchor(v1,BL)),IntV (-1)) / subtract(y(Anchor(v1,Center)),IntV 1)
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_less node=317 children=[30,250]; conditional algebra witness; subtract(x(Anchor(v1,BL)),IntV (-1)) / y(Anchor(head(objects(v0)),Center))
MRV immediate domains=[(0,1),(1,3)]
Nonempty VS_lessEqual node=318 children=[48,51]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(v1))))) / IntV 2
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=319 children=[90,103]; conditional algebra witness; subtract(x(Anchor(v1,BL)),IntV 1) / cardinality(ObjectCells(objectOf(head(objects(v0)))))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_lessEqual node=320 children=[90,25]; conditional algebra witness; subtract(x(Anchor(v1,BL)),IntV 1) / subtract(cardinality(ObjectCells(objectOf(v1))),IntV 1)
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_lessEqual node=321 children=[90,154]; conditional algebra witness; subtract(x(Anchor(v1,BL)),IntV 1) / subtract(cardinality(ObjectCells(objectOf(v1))),IntV (-1))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_lessEqual node=322 children=[90,46]; conditional algebra witness; subtract(x(Anchor(v1,BL)),IntV 1) / y(Anchor(head(objects(v0)),TR))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_lessEqual node=323 children=[90,242]; conditional algebra witness; subtract(x(Anchor(v1,BL)),IntV 1) / subtract(y(Anchor(v1,TL)),IntV 1)
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_lessEqual node=324 children=[90,246]; conditional algebra witness; subtract(x(Anchor(v1,BL)),IntV 1) / subtract(y(Anchor(v1,Center)),IntV 1)
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=325 children=[22,190]; conditional algebra witness; x(Anchor(v1,BL)) / subtract(cardinality(ObjectCells(objectOf(head(objects(v0))))),IntV (-1))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_lessEqual node=326 children=[22,39]; conditional algebra witness; x(Anchor(v1,BL)) / subtract(y(Anchor(head(objects(v0)),TL)),IntV 1)
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=330 children=[22,329]; conditional algebra witness; x(Anchor(v1,BL)) / subtract(x(Anchor(head(objects(v0)),BR)),IntV 1)
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_lessEqual node=331 children=[120,25]; conditional algebra witness; subtract(x(Anchor(v1,Center)),IntV 1) / subtract(cardinality(ObjectCells(objectOf(v1))),IntV 1)
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_lessEqual node=332 children=[120,154]; conditional algebra witness; subtract(x(Anchor(v1,Center)),IntV 1) / subtract(cardinality(ObjectCells(objectOf(v1))),IntV (-1))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_lessEqual node=333 children=[120,46]; conditional algebra witness; subtract(x(Anchor(v1,Center)),IntV 1) / y(Anchor(head(objects(v0)),TR))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_lessEqual node=334 children=[120,242]; conditional algebra witness; subtract(x(Anchor(v1,Center)),IntV 1) / subtract(y(Anchor(v1,TL)),IntV 1)
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_lessEqual node=335 children=[120,246]; conditional algebra witness; subtract(x(Anchor(v1,Center)),IntV 1) / subtract(y(Anchor(v1,Center)),IntV 1)
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_lessEqual node=336 children=[95,39]; conditional algebra witness; x(Anchor(v1,Center)) / subtract(y(Anchor(head(objects(v0)),TL)),IntV 1)
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_lessEqual node=337 children=[95,329]; conditional algebra witness; x(Anchor(v1,Center)) / subtract(x(Anchor(head(objects(v0)),BR)),IntV 1)
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_lessEqual node=338 children=[30,224]; conditional algebra witness; subtract(x(Anchor(v1,BL)),IntV (-1)) / subtract(y(Anchor(v1,BL)),IntV 1)
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_lessEqual node=339 children=[30,228]; conditional algebra witness; subtract(x(Anchor(v1,BL)),IntV (-1)) / x(Anchor(head(objects(v0)),BR))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_lessEqual node=340 children=[30,232]; conditional algebra witness; subtract(x(Anchor(v1,BL)),IntV (-1)) / subtract(y(Anchor(v1,Center)),IntV (-1))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_lessEqual node=341 children=[30,236]; conditional algebra witness; subtract(x(Anchor(v1,BL)),IntV (-1)) / subtract(y(Anchor(v1,TL)),IntV (-1))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_lessEqual node=342 children=[30,154]; conditional algebra witness; subtract(x(Anchor(v1,BL)),IntV (-1)) / subtract(cardinality(ObjectCells(objectOf(v1))),IntV (-1))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_lessEqual node=343 children=[30,46]; conditional algebra witness; subtract(x(Anchor(v1,BL)),IntV (-1)) / y(Anchor(head(objects(v0)),TR))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_lessEqual node=344 children=[30,242]; conditional algebra witness; subtract(x(Anchor(v1,BL)),IntV (-1)) / subtract(y(Anchor(v1,TL)),IntV 1)
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_lessEqual node=345 children=[30,246]; conditional algebra witness; subtract(x(Anchor(v1,BL)),IntV (-1)) / subtract(y(Anchor(v1,Center)),IntV 1)
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_lessEqual node=346 children=[30,250]; conditional algebra witness; subtract(x(Anchor(v1,BL)),IntV (-1)) / y(Anchor(head(objects(v0)),Center))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_lessEqual node=347 children=[291,154]; conditional algebra witness; subtract(x(Anchor(v1,BR)),IntV 1) / subtract(cardinality(ObjectCells(objectOf(v1))),IntV (-1))
MRV immediate domains=[(0,2),(1,3)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=348 children=[90,113]; conditional algebra witness; subtract(x(Anchor(v1,BL)),IntV 1) / cardinality(ObjectCells(objectOf(head(tail(objects(v0))))))
MRV immediate domains=[(0,2),(1,3)]
Nonempty VS_lessEqual node=349 children=[120,113]; conditional algebra witness; subtract(x(Anchor(v1,Center)),IntV 1) / cardinality(ObjectCells(objectOf(head(tail(objects(v0))))))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=59 children=[58,39]; conditional algebra witness; subtract(x(Anchor(v1,Center)),IntV (-1)) / subtract(y(Anchor(head(objects(v0)),TL)),IntV 1)
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_equal node=60 children=[39,58]; conditional algebra witness; subtract(y(Anchor(head(objects(v0)),TL)),IntV 1) / subtract(x(Anchor(v1,Center)),IntV (-1))
MRV immediate domains=[(0,2),(1,3)]
Nonempty VS_less node=350 children=[14,51]; conditional algebra witness; subtract(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 1) / IntV 2
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_less node=351 children=[126,25]; conditional algebra witness; subtract(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV (-1)) / subtract(cardinality(ObjectCells(objectOf(v1))),IntV 1)
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_less node=352 children=[90,190]; conditional algebra witness; subtract(x(Anchor(v1,BL)),IntV 1) / subtract(cardinality(ObjectCells(objectOf(head(objects(v0))))),IntV (-1))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_less node=353 children=[90,39]; conditional algebra witness; subtract(x(Anchor(v1,BL)),IntV 1) / subtract(y(Anchor(head(objects(v0)),TL)),IntV 1)
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_less node=354 children=[90,329]; conditional algebra witness; subtract(x(Anchor(v1,BL)),IntV 1) / subtract(x(Anchor(head(objects(v0)),BR)),IntV 1)
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_less node=355 children=[120,39]; conditional algebra witness; subtract(x(Anchor(v1,Center)),IntV 1) / subtract(y(Anchor(head(objects(v0)),TL)),IntV 1)
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_less node=356 children=[120,329]; conditional algebra witness; subtract(x(Anchor(v1,Center)),IntV 1) / subtract(x(Anchor(head(objects(v0)),BR)),IntV 1)
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=360 children=[30,359]; conditional algebra witness; subtract(x(Anchor(v1,BL)),IntV (-1)) / subtract(x(Anchor(head(objects(v0)),BR)),IntV (-1))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_lessEqual node=361 children=[126,25]; conditional algebra witness; subtract(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV (-1)) / subtract(cardinality(ObjectCells(objectOf(v1))),IntV 1)
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_lessEqual node=362 children=[90,190]; conditional algebra witness; subtract(x(Anchor(v1,BL)),IntV 1) / subtract(cardinality(ObjectCells(objectOf(head(objects(v0))))),IntV (-1))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_lessEqual node=363 children=[90,39]; conditional algebra witness; subtract(x(Anchor(v1,BL)),IntV 1) / subtract(y(Anchor(head(objects(v0)),TL)),IntV 1)
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_lessEqual node=364 children=[120,190]; conditional algebra witness; subtract(x(Anchor(v1,Center)),IntV 1) / subtract(cardinality(ObjectCells(objectOf(head(objects(v0))))),IntV (-1))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_lessEqual node=365 children=[120,39]; conditional algebra witness; subtract(x(Anchor(v1,Center)),IntV 1) / subtract(y(Anchor(head(objects(v0)),TL)),IntV 1)
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_lessEqual node=366 children=[30,39]; conditional algebra witness; subtract(x(Anchor(v1,BL)),IntV (-1)) / subtract(y(Anchor(head(objects(v0)),TL)),IntV 1)
MRV immediate domains=[(0,2),(1,1)]
Learn(ColorT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","background"]
Learn(SetT ColorT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","ObjectColors"]
Nonempty VS_contains node=65 children=[64,61]; conditional algebra witness; ObjectColors(objectOf(index(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)),IntV 1))) / head(setToList(ObjectColors(objectOf(v1))))
MRV immediate domains=[(0,2),(1,1)]
Learn(CellT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get"]
Learn(SetT CellT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","cells","ObjectCells"]
Nonempty VS_contains node=70 children=[69,66]; conditional algebra witness; ObjectCells(objectOf(index(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)),IntV 1))) / head(setToList(ObjectCells(objectOf(v1))))
MRV immediate domains=[(0,1),(1,2)]
Learn(SetT CellT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","cells","ObjectCells"]
Learn(CellT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get"]
Nonempty VS_contains node=75 children=[71,74]; conditional algebra witness; ObjectCells(objectOf(v1)) / head(setToList(ObjectCells(objectOf(index(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)),IntV 1)))))
Nonempty VS_lambda node=368 children=[367]; function graph -> parameter binding and output points
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_filter node=372 children=[368,371]; filter exact multiplicity/order inverse; predicate consistency retained across duplicate inputs
MRV immediate domains=[(0,1),(1,1)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_filter node=374 children=[77,373]; filter exact multiplicity/order inverse; predicate consistency retained across duplicate inputs
MRV immediate domains=[(0,1),(1,1)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_filter node=376 children=[77,375]; filter exact multiplicity/order inverse; predicate consistency retained across duplicate inputs
MRV immediate domains=[(0,1),(1,2)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_filter node=380 children=[77,379]; filter exact multiplicity/order inverse; predicate consistency retained across duplicate inputs
MRV immediate domains=[(0,1),(1,2)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_filter node=384 children=[77,383]; filter exact multiplicity/order inverse; predicate consistency retained across duplicate inputs
MRV immediate domains=[(0,1),(1,2)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_filter node=388 children=[200,387]; filter exact multiplicity/order inverse; predicate consistency retained across duplicate inputs
MRV immediate domains=[(0,1),(1,1)]
Learn(ArrowT PlacedT BoolT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,23)]
Learn(BoolT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","contains","get","equal","less","lessEqual"]
MRV immediate domains=[(0,1),(1,3)]
Learn(SetT ColorT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","ObjectColors"]
Learn(ColorT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","background"]
Nonempty VS_contains node=11 children=[7,10]; conditional algebra witness; ObjectColors(objectOf(v1)) / ColorV 2
MRV immediate domains=[(0,3),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=18 children=[17,14]; conditional algebra witness; IntV 1 / subtract(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 1)
MRV immediate domains=[(0,2),(1,3)]
Nonempty VS_equal node=19 children=[14,17]; conditional algebra witness; subtract(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 1) / IntV 1
MRV immediate domains=[(0,2),(1,3)]
Nonempty VS_lessEqual node=218 children=[14,17]; conditional algebra witness; subtract(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 1) / IntV 1
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=26 children=[22,25]; conditional algebra witness; x(Anchor(v1,BL)) / subtract(cardinality(ObjectCells(objectOf(v1))),IntV 1)
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_equal node=32 children=[25,22]; conditional algebra witness; subtract(cardinality(ObjectCells(objectOf(v1))),IntV 1) / x(Anchor(v1,BL))
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=31 children=[30,27]; conditional algebra witness; subtract(x(Anchor(v1,BL)),IntV (-1)) / cardinality(ObjectCells(objectOf(v1)))
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_equal node=33 children=[27,30]; conditional algebra witness; cardinality(ObjectCells(objectOf(v1))) / subtract(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,3),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=52 children=[51,48]; conditional algebra witness; IntV 2 / colorToInt(head(setToList(ObjectColors(objectOf(v1)))))
MRV immediate domains=[(0,1),(1,3)]
Nonempty VS_equal node=53 children=[48,51]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(v1))))) / IntV 2
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=40 children=[36,39]; conditional algebra witness; x(Anchor(v1,BR)) / subtract(y(Anchor(head(objects(v0)),TL)),IntV 1)
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_equal node=54 children=[39,36]; conditional algebra witness; subtract(y(Anchor(head(objects(v0)),TL)),IntV 1) / x(Anchor(v1,BR))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=47 children=[43,46]; conditional algebra witness; subtract(x(Anchor(v1,BR)),IntV (-1)) / y(Anchor(head(objects(v0)),TR))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_equal node=55 children=[46,43]; conditional algebra witness; y(Anchor(head(objects(v0)),TR)) / subtract(x(Anchor(v1,BR)),IntV (-1))
MRV immediate domains=[(0,1),(1,3)]
Nonempty VS_lessEqual node=318 children=[48,51]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(v1))))) / IntV 2
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=59 children=[58,39]; conditional algebra witness; subtract(x(Anchor(v1,Center)),IntV (-1)) / subtract(y(Anchor(head(objects(v0)),TL)),IntV 1)
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_equal node=60 children=[39,58]; conditional algebra witness; subtract(y(Anchor(head(objects(v0)),TL)),IntV 1) / subtract(x(Anchor(v1,Center)),IntV (-1))
MRV immediate domains=[(0,2),(1,3)]
Nonempty VS_less node=350 children=[14,51]; conditional algebra witness; subtract(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 1) / IntV 2
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=351 children=[126,25]; conditional algebra witness; subtract(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV (-1)) / subtract(cardinality(ObjectCells(objectOf(v1))),IntV 1)
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=389 children=[39,154]; conditional algebra witness; subtract(y(Anchor(head(objects(v0)),TL)),IntV 1) / subtract(cardinality(ObjectCells(objectOf(v1))),IntV (-1))
MRV immediate domains=[(0,2),(1,1)]
Learn(ColorT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","background"]
Learn(SetT ColorT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","ObjectColors"]
Nonempty VS_contains node=65 children=[64,61]; conditional algebra witness; ObjectColors(objectOf(index(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)),IntV 1))) / head(setToList(ObjectColors(objectOf(v1))))
MRV immediate domains=[(0,2),(1,1)]
Learn(CellT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get"]
Learn(SetT CellT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","cells","ObjectCells"]
Nonempty VS_contains node=70 children=[69,66]; conditional algebra witness; ObjectCells(objectOf(index(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)),IntV 1))) / head(setToList(ObjectCells(objectOf(v1))))
MRV immediate domains=[(0,1),(1,2)]
Learn(SetT CellT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","cells","ObjectCells"]
Learn(CellT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get"]
Nonempty VS_contains node=75 children=[71,74]; conditional algebra witness; ObjectCells(objectOf(v1)) / head(setToList(ObjectCells(objectOf(index(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)),IntV 1)))))
Nonempty VS_lambda node=391 children=[390]; function graph -> parameter binding and output points
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_filter node=393 children=[391,392]; filter exact multiplicity/order inverse; predicate consistency retained across duplicate inputs
Nonempty VS_mkScene node=395 children=[3,6,394]; mkScene residual: canonical correspondence + Render-validated paint order; branch=0
Nonempty VS_lambda node=396 children=[395]; function graph -> parameter binding and output points
Task TSL supported Base=["Anchor","ObjectCells","ObjectColors","add","background","canvasSize","cardinality","colorToInt","contains","equal","filter","head","index","lambda","less","lessEqual","literal","mkScene","objectOf","objects","setToList","sortBy","subtract","tail","x","y"]
Cost saturation C=1..0 root representatives=[]
Abstraction round=0; exact frontier=22; accepted=["I0","I1","I2","I3"]
Learn uses I0 by typed definition expansion; ArrowT PlacedT BoolT; observations=6; Gamma=[("v0",SceneT)]
Learn uses I1 by typed definition expansion; ArrowT PlacedT BoolT; observations=6; Gamma=[("v0",SceneT)]
Learn uses I2 by typed definition expansion; ArrowT PlacedT BoolT; observations=6; Gamma=[("v0",SceneT)]
Learn uses I0 by typed definition expansion; ArrowT PlacedT BoolT; observations=4; Gamma=[("v0",SceneT)]
Learn uses I1 by typed definition expansion; ArrowT PlacedT BoolT; observations=4; Gamma=[("v0",SceneT)]
Learn uses I2 by typed definition expansion; ArrowT PlacedT BoolT; observations=4; Gamma=[("v0",SceneT)]
Learn uses I0 by typed definition expansion; ArrowT PlacedT BoolT; observations=4; Gamma=[("v0",SceneT)]
Learn uses I1 by typed definition expansion; ArrowT PlacedT BoolT; observations=4; Gamma=[("v0",SceneT)]
Learn uses I2 by typed definition expansion; ArrowT PlacedT BoolT; observations=4; Gamma=[("v0",SceneT)]
Learn uses I0 by typed definition expansion; ArrowT PlacedT BoolT; observations=4; Gamma=[("v0",SceneT)]
Learn uses I1 by typed definition expansion; ArrowT PlacedT BoolT; observations=4; Gamma=[("v0",SceneT)]
Learn uses I2 by typed definition expansion; ArrowT PlacedT BoolT; observations=4; Gamma=[("v0",SceneT)]
Task TSL supported Base=["Anchor","ObjectCells","ObjectColors","add","background","canvasSize","cardinality","colorToInt","contains","equal","filter","head","index","lambda","less","lessEqual","literal","mkScene","objectOf","objects","setToList","sortBy","subtract","tail","x","y"]
Cost saturation C=1..0 root representatives=[]
Abstraction round=1; exact frontier=18; accepted=[]
Cost saturation C=1..0 root representatives=[]
Exact original Render(P(Encode(x)))=y: True; MDL rank=(25,9,2,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(27,10,2,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(34,13,2,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. equal(IntV 1,add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV (-1)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(34,13,2,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. equal(add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV (-1)),IntV 1)),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(35,12,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(35,12,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(35,12,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(35,12,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(35,13,2,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. equal(add(cardinality(ObjectCells(objectOf(v1))),IntV (-1)),x(Anchor(v1,BL)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(35,13,2,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. equal(add(x(Anchor(v1,BL)),IntV 1),cardinality(ObjectCells(objectOf(v1))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(35,13,2,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. equal(cardinality(ObjectCells(objectOf(v1))),add(x(Anchor(v1,BL)),IntV 1))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(35,13,2,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. equal(x(Anchor(v1,BL)),add(cardinality(ObjectCells(objectOf(v1))),IntV (-1)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(31,12,2,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda __r1b0:PlacedT. equal(IntV 2,colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(31,12,2,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda __r1b0:PlacedT. equal(colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))),IntV 2)),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(33,13,2,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),filter((lambda __r1b0:PlacedT. equal(IntV 2,colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(33,13,2,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),filter((lambda __r1b0:PlacedT. equal(colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))),IntV 2)),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(27,8,2,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(29,9,2,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(33,11,2,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda __r1b0:PlacedT. equal(IntV 2,colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(33,11,2,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda __r1b0:PlacedT. equal(colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))),IntV 2)),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(35,12,2,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda __r1b0:PlacedT. equal(IntV 2,colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(35,12,2,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda __r1b0:PlacedT. equal(colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))),IntV 2)),objects(v0))))")
Selected AST; FV=[]; (lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),objects(v0))))
TaskInvented I0: (lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)); repeats=8; portfolio MDL saving=24
TaskInvented I1: (lambda __r1b0:PlacedT. equal(IntV 2,colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))))); repeats=4; portfolio MDL saving=17
TaskInvented I2: (lambda __r1b0:PlacedT. equal(colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))),IntV 2)); repeats=4; portfolio MDL saving=17
TaskInvented I3: (lambda __r1h0:SizeT. (lambda __r1h1:ListT PlacedT. mkScene(__r1h0,ColorV 0,filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),__r1h1)))); repeats=6; portfolio MDL saving=3
Induced TSL=Signature(root VS) union inventions. BaseActivated=["Anchor","ObjectCells","ObjectColors","add","background","canvasSize","cardinality","colorToInt","contains","equal","filter","head","index","lambda","less","lessEqual","literal","mkScene","objectOf","objects","setToList","sortBy","subtract","tail","x","y"]; TaskInvented=["I0","I1","I2","I3"]; StructuralPriorCount=0
```
