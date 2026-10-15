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
MRV immediate domains=[(0,38)]
Learn(BoolT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","contains","get","equal","less","lessEqual"]
MRV immediate domains=[(0,1),(1,3)]
Learn(SetT ColorT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","ObjectColors"]
Learn(ColorT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","background"]
Nonempty VS_contains node=11 children=[7,10]; conditional algebra witness; ObjectColors(objectOf(v1)) / ColorV 2
MRV immediate domains=[(0,3),(1,1)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=16 children=[15,12]; conditional algebra witness; IntV 1 / add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV (-1))
MRV immediate domains=[(0,1),(1,3)]
Nonempty VS_equal node=17 children=[12,15]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV (-1)) / IntV 1
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=20 children=[18,19]; conditional algebra witness; x(Anchor(v1,BL)) / add(cardinality(ObjectCells(objectOf(v1))),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=23 children=[21,22]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV 1) / cardinality(ObjectCells(objectOf(v1)))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_equal node=24 children=[19,18]; conditional algebra witness; add(cardinality(ObjectCells(objectOf(v1))),IntV (-1)) / x(Anchor(v1,BL))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_equal node=25 children=[22,21]; conditional algebra witness; cardinality(ObjectCells(objectOf(v1))) / add(x(Anchor(v1,BL)),IntV 1)
MRV immediate domains=[(0,1),(1,2)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=30 children=[26,29]; conditional algebra witness; x(Anchor(v1,BR)) / add(y(Anchor(head(objects(v0)),TL)),IntV (-1))
MRV immediate domains=[(0,1),(1,2)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=35 children=[31,34]; conditional algebra witness; add(x(Anchor(v1,BR)),IntV 1) / y(Anchor(head(objects(v0)),TL))
MRV immediate domains=[(0,3),(1,1)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=40 children=[39,36]; conditional algebra witness; IntV 2 / colorToInt(head(setToList(ObjectColors(objectOf(v1)))))
MRV immediate domains=[(0,1),(1,3)]
Nonempty VS_equal node=41 children=[36,39]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(v1))))) / IntV 2
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_equal node=42 children=[29,26]; conditional algebra witness; add(y(Anchor(head(objects(v0)),TL)),IntV (-1)) / x(Anchor(v1,BR))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_equal node=43 children=[34,31]; conditional algebra witness; y(Anchor(head(objects(v0)),TL)) / add(x(Anchor(v1,BR)),IntV 1)
MRV immediate domains=[(0,1),(1,2)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=45 children=[44,29]; conditional algebra witness; add(x(Anchor(v1,Center)),IntV 1) / add(y(Anchor(head(objects(v0)),TL)),IntV (-1))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_equal node=46 children=[29,44]; conditional algebra witness; add(y(Anchor(head(objects(v0)),TL)),IntV (-1)) / add(x(Anchor(v1,Center)),IntV 1)
MRV immediate domains=[(0,2),(1,1)]
Learn(ColorT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","background"]
Learn(SetT ColorT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","ObjectColors"]
Nonempty VS_contains node=51 children=[50,47]; conditional algebra witness; ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))))) / head(setToList(ObjectColors(objectOf(v1))))
MRV immediate domains=[(0,2),(1,1)]
Learn(CellT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get"]
Learn(SetT CellT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","cells","ObjectCells"]
Nonempty VS_contains node=56 children=[55,52]; conditional algebra witness; ObjectCells(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))))) / head(setToList(ObjectCells(objectOf(v1))))
MRV immediate domains=[(0,1),(1,2)]
Learn(SetT CellT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","cells","ObjectCells"]
Learn(CellT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get"]
Nonempty VS_contains node=61 children=[57,60]; conditional algebra witness; ObjectCells(objectOf(v1)) / head(setToList(ObjectCells(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))))
MRV immediate domains=[(0,1),(1,2)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=65 children=[18,64]; conditional algebra witness; x(Anchor(v1,BL)) / x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),BL))
MRV immediate domains=[(0,1),(1,2)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=70 children=[66,69]; conditional algebra witness; x(Anchor(v1,Center)) / x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),Center))
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=75 children=[74,71]; conditional algebra witness; y(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),TL)) / y(Anchor(v1,TL))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_equal node=76 children=[64,18]; conditional algebra witness; x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),BL)) / x(Anchor(v1,BL))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_equal node=77 children=[69,66]; conditional algebra witness; x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),Center)) / x(Anchor(v1,Center))
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_equal node=78 children=[71,74]; conditional algebra witness; y(Anchor(v1,TL)) / y(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),TL))
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=83 children=[82,79]; conditional algebra witness; cardinality(ObjectCells(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))) / add(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_equal node=84 children=[79,82]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / cardinality(ObjectCells(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))))
MRV immediate domains=[(0,1),(1,2)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=88 children=[21,87]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV 1) / cardinality(ObjectCells(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))))))
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=90 children=[69,89]; conditional algebra witness; x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),Center)) / add(x(Anchor(v1,BR)),IntV (-1))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_equal node=91 children=[87,21]; conditional algebra witness; cardinality(ObjectCells(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))) / add(x(Anchor(v1,BL)),IntV 1)
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_equal node=92 children=[89,69]; conditional algebra witness; add(x(Anchor(v1,BR)),IntV (-1)) / x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),Center))
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=97 children=[96,93]; conditional algebra witness; add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),TL)),IntV 1) / add(y(Anchor(v1,TL)),IntV 1)
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=102 children=[101,98]; conditional algebra witness; add(x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),Center)),IntV (-1)) / add(x(Anchor(v1,Center)),IntV (-1))
MRV immediate domains=[(0,1),(1,2)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=107 children=[103,106]; conditional algebra witness; add(y(Anchor(v1,TL)),IntV (-1)) / add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),TL)),IntV (-1))
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_equal node=108 children=[98,101]; conditional algebra witness; add(x(Anchor(v1,Center)),IntV (-1)) / add(x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),Center)),IntV (-1))
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_equal node=109 children=[93,96]; conditional algebra witness; add(y(Anchor(v1,TL)),IntV 1) / add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),TL)),IntV 1)
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_equal node=110 children=[106,103]; conditional algebra witness; add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),TL)),IntV (-1)) / add(y(Anchor(v1,TL)),IntV (-1))
MRV immediate domains=[(0,3),(1,1)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=116 children=[115,111]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))))),IntV 1) / add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 1)
MRV immediate domains=[(0,1),(1,3)]
Nonempty VS_equal node=117 children=[111,115]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 1) / add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))))),IntV 1)
Nonempty VS_lambda node=119 children=[118]; function graph -> parameter binding and output points
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_filter node=123 children=[119,122]; filter exact multiplicity/order inverse; predicate consistency retained across duplicate inputs
MRV immediate domains=[(0,1),(1,2)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_filter node=127 children=[119,126]; filter exact multiplicity/order inverse; predicate consistency retained across duplicate inputs
MRV immediate domains=[(0,1),(1,1)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_filter node=129 children=[119,128]; filter exact multiplicity/order inverse; predicate consistency retained across duplicate inputs
MRV immediate domains=[(0,1),(1,1)]
Learn(ArrowT PlacedT BoolT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,162)]
Learn(BoolT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","contains","get","equal","less","lessEqual"]
MRV immediate domains=[(0,1),(1,3)]
Learn(SetT ColorT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","ObjectColors"]
Learn(ColorT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","background"]
Nonempty VS_contains node=11 children=[7,10]; conditional algebra witness; ObjectColors(objectOf(v1)) / ColorV 2
MRV immediate domains=[(0,3),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=130 children=[15,79]; conditional algebra witness; IntV 1 / add(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,1),(1,3)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=17 children=[12,15]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV (-1)) / IntV 1
MRV immediate domains=[(0,3),(1,1)]
Nonempty VS_equal node=16 children=[15,12]; conditional algebra witness; IntV 1 / add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=20 children=[18,19]; conditional algebra witness; x(Anchor(v1,BL)) / add(cardinality(ObjectCells(objectOf(v1))),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=23 children=[21,22]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV 1) / cardinality(ObjectCells(objectOf(v1)))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_equal node=24 children=[19,18]; conditional algebra witness; add(cardinality(ObjectCells(objectOf(v1))),IntV (-1)) / x(Anchor(v1,BL))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_equal node=25 children=[22,21]; conditional algebra witness; cardinality(ObjectCells(objectOf(v1))) / add(x(Anchor(v1,BL)),IntV 1)
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=131 children=[36,18]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(v1))))) / x(Anchor(v1,BL))
MRV immediate domains=[(0,1),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=133 children=[36,132]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(v1))))) / x(Anchor(v1,Center))
MRV immediate domains=[(0,3),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=134 children=[39,18]; conditional algebra witness; IntV 2 / x(Anchor(v1,BL))
MRV immediate domains=[(0,1),(1,3)]
Nonempty VS_equal node=41 children=[36,39]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(v1))))) / IntV 2
MRV immediate domains=[(0,3),(1,1)]
Nonempty VS_equal node=40 children=[39,36]; conditional algebra witness; IntV 2 / colorToInt(head(setToList(ObjectColors(objectOf(v1)))))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=136 children=[135,29]; conditional algebra witness; x(Anchor(v1,BR)) / add(y(Anchor(head(objects(v0)),TL)),IntV (-1))
MRV immediate domains=[(0,1),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=35 children=[31,34]; conditional algebra witness; add(x(Anchor(v1,BR)),IntV 1) / y(Anchor(head(objects(v0)),TL))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_equal node=137 children=[29,135]; conditional algebra witness; add(y(Anchor(head(objects(v0)),TL)),IntV (-1)) / x(Anchor(v1,BR))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_equal node=43 children=[34,31]; conditional algebra witness; y(Anchor(head(objects(v0)),TL)) / add(x(Anchor(v1,BR)),IntV 1)
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=138 children=[36,79]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(v1))))) / add(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=139 children=[36,98]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(v1))))) / add(x(Anchor(v1,Center)),IntV (-1))
MRV immediate domains=[(0,3),(1,1)]
Nonempty VS_less node=140 children=[39,79]; conditional algebra witness; IntV 2 / add(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,3),(1,1)]
Nonempty VS_less node=141 children=[39,98]; conditional algebra witness; IntV 2 / add(x(Anchor(v1,Center)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=142 children=[111,18]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 1) / x(Anchor(v1,BL))
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_less node=143 children=[111,132]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 1) / x(Anchor(v1,Center))
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_less node=144 children=[111,135]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 1) / x(Anchor(v1,BR))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=145 children=[36,79]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(v1))))) / add(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=146 children=[36,98]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(v1))))) / add(x(Anchor(v1,Center)),IntV (-1))
MRV immediate domains=[(0,3),(1,1)]
Nonempty VS_lessEqual node=147 children=[39,79]; conditional algebra witness; IntV 2 / add(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=148 children=[111,18]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 1) / x(Anchor(v1,BL))
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_lessEqual node=149 children=[111,132]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 1) / x(Anchor(v1,Center))
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=153 children=[152,18]; conditional algebra witness; add(cardinality(ObjectCells(objectOf(head(objects(v0))))),IntV (-1)) / x(Anchor(v1,BL))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_lessEqual node=154 children=[152,132]; conditional algebra witness; add(cardinality(ObjectCells(objectOf(head(objects(v0))))),IntV (-1)) / x(Anchor(v1,Center))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_lessEqual node=155 children=[152,135]; conditional algebra witness; add(cardinality(ObjectCells(objectOf(head(objects(v0))))),IntV (-1)) / x(Anchor(v1,BR))
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=159 children=[158,18]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(head(tail(objects(v0)))))))) / x(Anchor(v1,BL))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_less node=160 children=[158,132]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(head(tail(objects(v0)))))))) / x(Anchor(v1,Center))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=161 children=[12,79]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV (-1)) / add(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=162 children=[12,98]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV (-1)) / add(x(Anchor(v1,Center)),IntV (-1))
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=166 children=[165,18]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(index(tail(objects(v0)),IntV 1)))))) / x(Anchor(v1,BL))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_less node=167 children=[165,132]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(index(tail(objects(v0)),IntV 1)))))) / x(Anchor(v1,Center))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_less node=168 children=[165,135]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(index(tail(objects(v0)),IntV 1)))))) / x(Anchor(v1,BR))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=169 children=[111,79]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 1) / add(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=170 children=[111,98]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 1) / add(x(Anchor(v1,Center)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=171 children=[111,21]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 1) / add(x(Anchor(v1,BL)),IntV 1)
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_lessEqual node=172 children=[165,18]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(index(tail(objects(v0)),IntV 1)))))) / x(Anchor(v1,BL))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_lessEqual node=173 children=[165,132]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(index(tail(objects(v0)),IntV 1)))))) / x(Anchor(v1,Center))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=174 children=[111,79]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 1) / add(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=175 children=[111,98]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 1) / add(x(Anchor(v1,Center)),IntV (-1))
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=179 children=[178,79]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(head(objects(v0))))))) / add(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_lessEqual node=180 children=[152,21]; conditional algebra witness; add(cardinality(ObjectCells(objectOf(head(objects(v0))))),IntV (-1)) / add(x(Anchor(v1,BL)),IntV 1)
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=184 children=[183,18]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(head(objects(v0))))))),IntV 1) / x(Anchor(v1,BL))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=188 children=[187,135]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(objects(v0)))))))),IntV 1) / x(Anchor(v1,BR))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_lessEqual node=189 children=[158,79]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(head(tail(objects(v0)))))))) / add(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_lessEqual node=190 children=[158,98]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(head(tail(objects(v0)))))))) / add(x(Anchor(v1,Center)),IntV (-1))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_lessEqual node=191 children=[187,18]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(objects(v0)))))))),IntV 1) / x(Anchor(v1,BL))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_lessEqual node=192 children=[187,132]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(objects(v0)))))))),IntV 1) / x(Anchor(v1,Center))
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=196 children=[195,18]; conditional algebra witness; x(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),BL)) / x(Anchor(v1,BL))
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=200 children=[199,18]; conditional algebra witness; x(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))),Center)) / x(Anchor(v1,BL))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_less node=201 children=[199,132]; conditional algebra witness; x(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))),Center)) / x(Anchor(v1,Center))
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=205 children=[204,79]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(head(objects(v0))))))),IntV (-1)) / add(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_less node=206 children=[165,79]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(index(tail(objects(v0)),IntV 1)))))) / add(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_less node=207 children=[165,98]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(index(tail(objects(v0)),IntV 1)))))) / add(x(Anchor(v1,Center)),IntV (-1))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_less node=208 children=[165,21]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(index(tail(objects(v0)),IntV 1)))))) / add(x(Anchor(v1,BL)),IntV 1)
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_lessEqual node=209 children=[165,79]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(index(tail(objects(v0)),IntV 1)))))) / add(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_lessEqual node=210 children=[165,98]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(index(tail(objects(v0)),IntV 1)))))) / add(x(Anchor(v1,Center)),IntV (-1))
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=214 children=[213,18]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(index(tail(objects(v0)),IntV 1)))))),IntV 1) / x(Anchor(v1,BL))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_lessEqual node=215 children=[213,132]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(index(tail(objects(v0)),IntV 1)))))),IntV 1) / x(Anchor(v1,Center))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_lessEqual node=216 children=[213,135]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(index(tail(objects(v0)),IntV 1)))))),IntV 1) / x(Anchor(v1,BR))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_lessEqual node=217 children=[183,79]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(head(objects(v0))))))),IntV 1) / add(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_lessEqual node=218 children=[183,98]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(head(objects(v0))))))),IntV 1) / add(x(Anchor(v1,Center)),IntV (-1))
MRV immediate domains=[(0,2),(1,1)]
Learn(ColorT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","background"]
Learn(SetT ColorT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","ObjectColors"]
Nonempty VS_contains node=51 children=[50,47]; conditional algebra witness; ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))))) / head(setToList(ObjectColors(objectOf(v1))))
MRV immediate domains=[(0,1),(1,2)]
Learn(SetT CellT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","cells","ObjectCells"]
Learn(CellT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get"]
Nonempty VS_contains node=61 children=[57,60]; conditional algebra witness; ObjectCells(objectOf(v1)) / head(setToList(ObjectCells(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))))
MRV immediate domains=[(0,2),(1,1)]
Learn(CellT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get"]
Learn(SetT CellT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","cells","ObjectCells"]
Nonempty VS_contains node=56 children=[55,52]; conditional algebra witness; ObjectCells(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))))) / head(setToList(ObjectCells(objectOf(v1))))
MRV immediate domains=[(0,1),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=65 children=[18,64]; conditional algebra witness; x(Anchor(v1,BL)) / x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),BL))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=219 children=[132,69]; conditional algebra witness; x(Anchor(v1,Center)) / x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),Center))
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=75 children=[74,71]; conditional algebra witness; y(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),TL)) / y(Anchor(v1,TL))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_equal node=76 children=[64,18]; conditional algebra witness; x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),BL)) / x(Anchor(v1,BL))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_equal node=220 children=[69,132]; conditional algebra witness; x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),Center)) / x(Anchor(v1,Center))
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_equal node=78 children=[71,74]; conditional algebra witness; y(Anchor(v1,TL)) / y(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),TL))
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=224 children=[223,79]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(objects(v0)))))))),IntV (-1)) / add(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_less node=225 children=[223,98]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(objects(v0)))))))),IntV (-1)) / add(x(Anchor(v1,Center)),IntV (-1))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_less node=226 children=[187,21]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(objects(v0)))))))),IntV 1) / add(x(Anchor(v1,BL)),IntV 1)
MRV immediate domains=[(0,1),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=84 children=[79,82]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / cardinality(ObjectCells(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_equal node=83 children=[82,79]; conditional algebra witness; cardinality(ObjectCells(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))) / add(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_less node=227 children=[195,79]; conditional algebra witness; x(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),BL)) / add(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_less node=228 children=[195,98]; conditional algebra witness; x(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),BL)) / add(x(Anchor(v1,Center)),IntV (-1))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_less node=229 children=[199,79]; conditional algebra witness; x(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))),Center)) / add(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_less node=230 children=[199,98]; conditional algebra witness; x(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))),Center)) / add(x(Anchor(v1,Center)),IntV (-1))
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=234 children=[233,18]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))))))) / x(Anchor(v1,BL))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_less node=235 children=[233,132]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))))))) / x(Anchor(v1,Center))
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=239 children=[238,18]; conditional algebra witness; add(x(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),BL)),IntV 1) / x(Anchor(v1,BL))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_less node=240 children=[238,132]; conditional algebra witness; add(x(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),BL)),IntV 1) / x(Anchor(v1,Center))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_lessEqual node=241 children=[195,79]; conditional algebra witness; x(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),BL)) / add(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_lessEqual node=242 children=[199,79]; conditional algebra witness; x(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))),Center)) / add(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_lessEqual node=243 children=[199,98]; conditional algebra witness; x(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))),Center)) / add(x(Anchor(v1,Center)),IntV (-1))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_lessEqual node=244 children=[238,18]; conditional algebra witness; add(x(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),BL)),IntV 1) / x(Anchor(v1,BL))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_lessEqual node=245 children=[213,79]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(index(tail(objects(v0)),IntV 1)))))),IntV 1) / add(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_lessEqual node=246 children=[213,98]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(index(tail(objects(v0)),IntV 1)))))),IntV 1) / add(x(Anchor(v1,Center)),IntV (-1))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_lessEqual node=247 children=[213,21]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(index(tail(objects(v0)),IntV 1)))))),IntV 1) / add(x(Anchor(v1,BL)),IntV 1)
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=251 children=[250,18]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))))) / x(Anchor(v1,BL))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_lessEqual node=252 children=[250,132]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))))) / x(Anchor(v1,Center))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_lessEqual node=253 children=[250,135]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))))) / x(Anchor(v1,BR))
MRV immediate domains=[(0,1),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=88 children=[21,87]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV 1) / cardinality(ObjectCells(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))))))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_equal node=91 children=[87,21]; conditional algebra witness; cardinality(ObjectCells(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))) / add(x(Anchor(v1,BL)),IntV 1)
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=257 children=[256,79]; conditional algebra witness; add(x(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),BL)),IntV (-1)) / add(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=261 children=[260,79]; conditional algebra witness; add(x(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),Center)),IntV (-1)) / add(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_less node=262 children=[260,98]; conditional algebra witness; add(x(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),Center)),IntV (-1)) / add(x(Anchor(v1,Center)),IntV (-1))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_less node=263 children=[233,79]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))))))) / add(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_less node=264 children=[233,98]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))))))) / add(x(Anchor(v1,Center)),IntV (-1))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_less node=265 children=[238,79]; conditional algebra witness; add(x(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),BL)),IntV 1) / add(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_less node=266 children=[238,98]; conditional algebra witness; add(x(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),BL)),IntV 1) / add(x(Anchor(v1,Center)),IntV (-1))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_less node=267 children=[238,21]; conditional algebra witness; add(x(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),BL)),IntV 1) / add(x(Anchor(v1,BL)),IntV 1)
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=271 children=[270,18]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))))))),IntV 1) / x(Anchor(v1,BL))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_less node=272 children=[270,132]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))))))),IntV 1) / x(Anchor(v1,Center))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_less node=273 children=[270,135]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))))))),IntV 1) / x(Anchor(v1,BR))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_lessEqual node=274 children=[233,79]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))))))) / add(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_lessEqual node=275 children=[233,98]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))))))) / add(x(Anchor(v1,Center)),IntV (-1))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_lessEqual node=276 children=[238,79]; conditional algebra witness; add(x(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),BL)),IntV 1) / add(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_lessEqual node=277 children=[238,98]; conditional algebra witness; add(x(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),BL)),IntV 1) / add(x(Anchor(v1,Center)),IntV (-1))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_lessEqual node=278 children=[270,18]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))))))),IntV 1) / x(Anchor(v1,BL))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_lessEqual node=279 children=[270,132]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))))))),IntV 1) / x(Anchor(v1,Center))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_lessEqual node=280 children=[250,79]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))))) / add(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_lessEqual node=281 children=[250,98]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))))) / add(x(Anchor(v1,Center)),IntV (-1))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_lessEqual node=282 children=[250,21]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))))) / add(x(Anchor(v1,BL)),IntV 1)
MRV immediate domains=[(0,1),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=108 children=[98,101]; conditional algebra witness; add(x(Anchor(v1,Center)),IntV (-1)) / add(x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),Center)),IntV (-1))
MRV immediate domains=[(0,1),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=109 children=[93,96]; conditional algebra witness; add(y(Anchor(v1,TL)),IntV 1) / add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),TL)),IntV 1)
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_equal node=97 children=[96,93]; conditional algebra witness; add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),TL)),IntV 1) / add(y(Anchor(v1,TL)),IntV 1)
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_equal node=102 children=[101,98]; conditional algebra witness; add(x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),Center)),IntV (-1)) / add(x(Anchor(v1,Center)),IntV (-1))
MRV immediate domains=[(0,1),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=107 children=[103,106]; conditional algebra witness; add(y(Anchor(v1,TL)),IntV (-1)) / add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),TL)),IntV (-1))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_equal node=110 children=[106,103]; conditional algebra witness; add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),TL)),IntV (-1)) / add(y(Anchor(v1,TL)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=284 children=[283,18]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))))))))) / x(Anchor(v1,BL))
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_less node=285 children=[283,132]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))))))))) / x(Anchor(v1,Center))
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_less node=286 children=[283,135]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))))))))) / x(Anchor(v1,BR))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=287 children=[283,18]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))))))))) / x(Anchor(v1,BL))
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_lessEqual node=288 children=[283,132]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))))))))) / x(Anchor(v1,Center))
MRV immediate domains=[(0,3),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=289 children=[115,18]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))))),IntV 1) / x(Anchor(v1,BL))
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=293 children=[292,79]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))))))),IntV (-1)) / add(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_less node=294 children=[292,98]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))))))),IntV (-1)) / add(x(Anchor(v1,Center)),IntV (-1))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_less node=295 children=[270,79]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))))))),IntV 1) / add(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_less node=296 children=[270,98]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))))))),IntV 1) / add(x(Anchor(v1,Center)),IntV (-1))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_less node=297 children=[270,21]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))))))),IntV 1) / add(x(Anchor(v1,BL)),IntV 1)
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_lessEqual node=298 children=[270,79]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))))))),IntV 1) / add(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_lessEqual node=299 children=[270,98]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))))))),IntV 1) / add(x(Anchor(v1,Center)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=301 children=[300,18]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(index(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),IntV 1)))))) / x(Anchor(v1,BL))
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_lessEqual node=302 children=[300,132]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(index(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),IntV 1)))))) / x(Anchor(v1,Center))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=304 children=[303,18]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))))))))),IntV (-1)) / x(Anchor(v1,BL))
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_less node=305 children=[303,132]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))))))))),IntV (-1)) / x(Anchor(v1,Center))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=306 children=[283,21]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))))))))) / add(x(Anchor(v1,BL)),IntV 1)
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=307 children=[283,79]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))))))))) / add(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=308 children=[283,98]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))))))))) / add(x(Anchor(v1,Center)),IntV (-1))
MRV immediate domains=[(0,3),(1,1)]
Nonempty VS_lessEqual node=309 children=[115,79]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))))),IntV 1) / add(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,3),(1,1)]
Nonempty VS_lessEqual node=310 children=[115,98]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))))),IntV 1) / add(x(Anchor(v1,Center)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=311 children=[300,79]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(index(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),IntV 1)))))) / add(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=312 children=[300,98]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(index(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),IntV 1)))))) / add(x(Anchor(v1,Center)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=313 children=[300,21]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(index(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),IntV 1)))))) / add(x(Anchor(v1,BL)),IntV 1)
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=315 children=[314,18]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(index(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),IntV 1)))))),IntV 1) / x(Anchor(v1,BL))
MRV immediate domains=[(0,1),(1,3)]
Nonempty VS_equal node=117 children=[111,115]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 1) / add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))))),IntV 1)
MRV immediate domains=[(0,3),(1,1)]
Nonempty VS_equal node=116 children=[115,111]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))))),IntV 1) / add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 1)
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=316 children=[303,79]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))))))))),IntV (-1)) / add(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=317 children=[303,98]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))))))))),IntV (-1)) / add(x(Anchor(v1,Center)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=318 children=[303,79]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))))))))),IntV (-1)) / add(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=319 children=[303,98]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))))))))),IntV (-1)) / add(x(Anchor(v1,Center)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=320 children=[314,79]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(index(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),IntV 1)))))),IntV 1) / add(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=321 children=[314,98]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(index(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),IntV 1)))))),IntV 1) / add(x(Anchor(v1,Center)),IntV (-1))
Nonempty VS_lambda node=323 children=[322]; function graph -> parameter binding and output points
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_filter node=325 children=[323,324]; filter exact multiplicity/order inverse; predicate consistency retained across duplicate inputs
MRV immediate domains=[(0,1),(1,2)]
Learn(ArrowT PlacedT BoolT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,178)]
Learn(BoolT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","contains","get","equal","less","lessEqual"]
MRV immediate domains=[(0,1),(1,3)]
Learn(SetT ColorT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","ObjectColors"]
Learn(ColorT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","background"]
Nonempty VS_contains node=11 children=[7,10]; conditional algebra witness; ObjectColors(objectOf(v1)) / ColorV 2
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=326 children=[18,71]; conditional algebra witness; x(Anchor(v1,BL)) / y(Anchor(v1,TL))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=328 children=[18,327]; conditional algebra witness; x(Anchor(v1,BL)) / y(Anchor(v1,Center))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=329 children=[18,22]; conditional algebra witness; x(Anchor(v1,BL)) / cardinality(ObjectCells(objectOf(v1)))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=330 children=[18,71]; conditional algebra witness; x(Anchor(v1,BL)) / y(Anchor(v1,TL))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=331 children=[18,327]; conditional algebra witness; x(Anchor(v1,BL)) / y(Anchor(v1,Center))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=332 children=[18,22]; conditional algebra witness; x(Anchor(v1,BL)) / cardinality(ObjectCells(objectOf(v1)))
MRV immediate domains=[(0,3),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=16 children=[15,12]; conditional algebra witness; IntV 1 / add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV (-1))
MRV immediate domains=[(0,1),(1,3)]
Nonempty VS_equal node=17 children=[12,15]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV (-1)) / IntV 1
MRV immediate domains=[(0,1),(1,3)]
Nonempty VS_lessEqual node=333 children=[12,15]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV (-1)) / IntV 1
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=20 children=[18,19]; conditional algebra witness; x(Anchor(v1,BL)) / add(cardinality(ObjectCells(objectOf(v1))),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_equal node=24 children=[19,18]; conditional algebra witness; add(cardinality(ObjectCells(objectOf(v1))),IntV (-1)) / x(Anchor(v1,BL))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=23 children=[21,22]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV 1) / cardinality(ObjectCells(objectOf(v1)))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_equal node=25 children=[22,21]; conditional algebra witness; cardinality(ObjectCells(objectOf(v1))) / add(x(Anchor(v1,BL)),IntV 1)
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=334 children=[79,71]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / y(Anchor(v1,TL))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=335 children=[79,327]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / y(Anchor(v1,Center))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=336 children=[79,22]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / cardinality(ObjectCells(objectOf(v1)))
MRV immediate domains=[(0,1),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=340 children=[18,339]; conditional algebra witness; x(Anchor(v1,BL)) / add(y(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,1),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=344 children=[18,343]; conditional algebra witness; x(Anchor(v1,BL)) / x(Anchor(head(objects(v0)),BR))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=346 children=[18,345]; conditional algebra witness; x(Anchor(v1,BL)) / add(y(Anchor(v1,Center)),IntV 1)
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=347 children=[18,93]; conditional algebra witness; x(Anchor(v1,BL)) / add(y(Anchor(v1,TL)),IntV 1)
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=349 children=[18,348]; conditional algebra witness; x(Anchor(v1,BL)) / add(cardinality(ObjectCells(objectOf(v1))),IntV 1)
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=350 children=[79,71]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / y(Anchor(v1,TL))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=351 children=[79,22]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / cardinality(ObjectCells(objectOf(v1)))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=352 children=[18,93]; conditional algebra witness; x(Anchor(v1,BL)) / add(y(Anchor(v1,TL)),IntV 1)
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=353 children=[18,19]; conditional algebra witness; x(Anchor(v1,BL)) / add(cardinality(ObjectCells(objectOf(v1))),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=354 children=[18,348]; conditional algebra witness; x(Anchor(v1,BL)) / add(cardinality(ObjectCells(objectOf(v1))),IntV 1)
MRV immediate domains=[(0,1),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=355 children=[18,34]; conditional algebra witness; x(Anchor(v1,BL)) / y(Anchor(head(objects(v0)),TL))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=356 children=[18,103]; conditional algebra witness; x(Anchor(v1,BL)) / add(y(Anchor(v1,TL)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=358 children=[18,357]; conditional algebra witness; x(Anchor(v1,BL)) / add(y(Anchor(v1,Center)),IntV (-1))
MRV immediate domains=[(0,1),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=362 children=[18,361]; conditional algebra witness; x(Anchor(v1,BL)) / y(Anchor(head(objects(v0)),Center))
MRV immediate domains=[(0,3),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=40 children=[39,36]; conditional algebra witness; IntV 2 / colorToInt(head(setToList(ObjectColors(objectOf(v1)))))
MRV immediate domains=[(0,1),(1,3)]
Nonempty VS_equal node=41 children=[36,39]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(v1))))) / IntV 2
MRV immediate domains=[(0,1),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=30 children=[26,29]; conditional algebra witness; x(Anchor(v1,BR)) / add(y(Anchor(head(objects(v0)),TL)),IntV (-1))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_equal node=42 children=[29,26]; conditional algebra witness; add(y(Anchor(head(objects(v0)),TL)),IntV (-1)) / x(Anchor(v1,BR))
MRV immediate domains=[(0,1),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=35 children=[31,34]; conditional algebra witness; add(x(Anchor(v1,BR)),IntV 1) / y(Anchor(head(objects(v0)),TL))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_equal node=43 children=[34,31]; conditional algebra witness; y(Anchor(head(objects(v0)),TL)) / add(x(Anchor(v1,BR)),IntV 1)
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=363 children=[36,19]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(v1))))) / add(cardinality(ObjectCells(objectOf(v1))),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=364 children=[111,22]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 1) / cardinality(ObjectCells(objectOf(v1)))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=365 children=[79,93]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / add(y(Anchor(v1,TL)),IntV 1)
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=366 children=[79,19]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / add(cardinality(ObjectCells(objectOf(v1))),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=367 children=[79,348]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / add(cardinality(ObjectCells(objectOf(v1))),IntV 1)
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_less node=368 children=[79,34]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / y(Anchor(head(objects(v0)),TL))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=369 children=[79,103]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / add(y(Anchor(v1,TL)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=370 children=[79,357]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / add(y(Anchor(v1,Center)),IntV (-1))
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_less node=371 children=[79,361]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / y(Anchor(head(objects(v0)),Center))
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_less node=372 children=[18,29]; conditional algebra witness; x(Anchor(v1,BL)) / add(y(Anchor(head(objects(v0)),TL)),IntV (-1))
MRV immediate domains=[(0,1),(1,3)]
Nonempty VS_lessEqual node=373 children=[36,39]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(v1))))) / IntV 2
MRV immediate domains=[(0,1),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=377 children=[79,376]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / cardinality(ObjectCells(objectOf(head(objects(v0)))))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=378 children=[79,19]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / add(cardinality(ObjectCells(objectOf(v1))),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=379 children=[79,348]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / add(cardinality(ObjectCells(objectOf(v1))),IntV 1)
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_lessEqual node=380 children=[79,34]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / y(Anchor(head(objects(v0)),TL))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=381 children=[79,103]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / add(y(Anchor(v1,TL)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=382 children=[79,357]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / add(y(Anchor(v1,Center)),IntV (-1))
MRV immediate domains=[(0,1),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=386 children=[18,385]; conditional algebra witness; x(Anchor(v1,BL)) / add(cardinality(ObjectCells(objectOf(head(objects(v0))))),IntV 1)
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_lessEqual node=387 children=[18,29]; conditional algebra witness; x(Anchor(v1,BL)) / add(y(Anchor(head(objects(v0)),TL)),IntV (-1))
MRV immediate domains=[(0,1),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=391 children=[18,390]; conditional algebra witness; x(Anchor(v1,BL)) / add(x(Anchor(head(objects(v0)),BR)),IntV (-1))
MRV immediate domains=[(0,1),(1,3)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=396 children=[79,395]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / cardinality(ObjectCells(objectOf(head(tail(objects(v0))))))
MRV immediate domains=[(0,1),(1,3)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=401 children=[18,400]; conditional algebra witness; x(Anchor(v1,BL)) / add(cardinality(ObjectCells(objectOf(head(tail(objects(v0)))))),IntV 1)
MRV immediate domains=[(0,1),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=45 children=[44,29]; conditional algebra witness; add(x(Anchor(v1,Center)),IntV 1) / add(y(Anchor(head(objects(v0)),TL)),IntV (-1))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_equal node=46 children=[29,44]; conditional algebra witness; add(y(Anchor(head(objects(v0)),TL)),IntV (-1)) / add(x(Anchor(v1,Center)),IntV 1)
MRV immediate domains=[(0,1),(1,3)]
Nonempty VS_less node=402 children=[12,39]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV (-1)) / IntV 2
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=403 children=[111,19]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 1) / add(cardinality(ObjectCells(objectOf(v1))),IntV (-1))
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_less node=404 children=[79,385]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / add(cardinality(ObjectCells(objectOf(head(objects(v0))))),IntV 1)
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_less node=405 children=[79,29]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / add(y(Anchor(head(objects(v0)),TL)),IntV (-1))
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_less node=406 children=[79,390]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / add(x(Anchor(head(objects(v0)),BR)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=407 children=[111,19]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 1) / add(cardinality(ObjectCells(objectOf(v1))),IntV (-1))
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_lessEqual node=408 children=[79,385]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / add(cardinality(ObjectCells(objectOf(head(objects(v0))))),IntV 1)
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_lessEqual node=409 children=[79,29]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / add(y(Anchor(head(objects(v0)),TL)),IntV (-1))
MRV immediate domains=[(0,1),(1,3)]
Nonempty VS_less node=410 children=[79,400]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / add(cardinality(ObjectCells(objectOf(head(tail(objects(v0)))))),IntV 1)
MRV immediate domains=[(0,1),(1,3)]
Nonempty VS_lessEqual node=411 children=[79,400]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / add(cardinality(ObjectCells(objectOf(head(tail(objects(v0)))))),IntV 1)
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=412 children=[82,22]; conditional algebra witness; cardinality(ObjectCells(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))) / cardinality(ObjectCells(objectOf(v1)))
MRV immediate domains=[(0,1),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=416 children=[18,415]; conditional algebra witness; x(Anchor(v1,BL)) / x(Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),Center))
MRV immediate domains=[(0,1),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=420 children=[18,419]; conditional algebra witness; x(Anchor(v1,BL)) / y(Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),TL))
MRV immediate domains=[(0,1),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=421 children=[36,165]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(v1))))) / colorToInt(head(setToList(ObjectColors(objectOf(index(tail(objects(v0)),IntV 1))))))
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_lessEqual node=422 children=[18,419]; conditional algebra witness; x(Anchor(v1,BL)) / y(Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),TL))
MRV immediate domains=[(0,1),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=426 children=[18,425]; conditional algebra witness; x(Anchor(v1,BL)) / y(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))),TL))
MRV immediate domains=[(0,2),(1,1)]
Learn(ColorT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","background"]
Learn(SetT ColorT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","ObjectColors"]
Nonempty VS_contains node=51 children=[50,47]; conditional algebra witness; ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))))) / head(setToList(ObjectColors(objectOf(v1))))
MRV immediate domains=[(0,2),(1,1)]
Learn(CellT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get"]
Learn(SetT CellT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","cells","ObjectCells"]
Nonempty VS_contains node=56 children=[55,52]; conditional algebra witness; ObjectCells(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))))) / head(setToList(ObjectCells(objectOf(v1))))
MRV immediate domains=[(0,1),(1,2)]
Learn(SetT CellT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","cells","ObjectCells"]
Learn(CellT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get"]
Nonempty VS_contains node=61 children=[57,60]; conditional algebra witness; ObjectCells(objectOf(v1)) / head(setToList(ObjectCells(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))))
MRV immediate domains=[(0,3),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=431 children=[430,327]; conditional algebra witness; y(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),Center)) / y(Anchor(v1,Center))
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=75 children=[74,71]; conditional algebra witness; y(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),TL)) / y(Anchor(v1,TL))
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_equal node=78 children=[71,74]; conditional algebra witness; y(Anchor(v1,TL)) / y(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),TL))
MRV immediate domains=[(0,1),(1,3)]
Nonempty VS_equal node=432 children=[327,430]; conditional algebra witness; y(Anchor(v1,Center)) / y(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),Center))
MRV immediate domains=[(0,1),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=65 children=[18,64]; conditional algebra witness; x(Anchor(v1,BL)) / x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),BL))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_equal node=76 children=[64,18]; conditional algebra witness; x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),BL)) / x(Anchor(v1,BL))
MRV immediate domains=[(0,1),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=70 children=[66,69]; conditional algebra witness; x(Anchor(v1,Center)) / x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),Center))
MRV immediate domains=[(0,1),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=433 children=[22,87]; conditional algebra witness; cardinality(ObjectCells(objectOf(v1))) / cardinality(ObjectCells(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))))))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_equal node=77 children=[69,66]; conditional algebra witness; x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),Center)) / x(Anchor(v1,Center))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_equal node=434 children=[87,22]; conditional algebra witness; cardinality(ObjectCells(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))) / cardinality(ObjectCells(objectOf(v1)))
MRV immediate domains=[(0,1),(1,3)]
Nonempty VS_less node=435 children=[18,430]; conditional algebra witness; x(Anchor(v1,BL)) / y(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),Center))
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_less node=436 children=[18,74]; conditional algebra witness; x(Anchor(v1,BL)) / y(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),TL))
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_less node=437 children=[18,87]; conditional algebra witness; x(Anchor(v1,BL)) / cardinality(ObjectCells(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))))))
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_lessEqual node=438 children=[18,64]; conditional algebra witness; x(Anchor(v1,BL)) / x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),BL))
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_lessEqual node=439 children=[18,69]; conditional algebra witness; x(Anchor(v1,BL)) / x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),Center))
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_lessEqual node=440 children=[18,87]; conditional algebra witness; x(Anchor(v1,BL)) / cardinality(ObjectCells(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))))))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_equal node=83 children=[82,79]; conditional algebra witness; cardinality(ObjectCells(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))) / add(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_equal node=84 children=[79,82]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / cardinality(ObjectCells(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))))
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_less node=441 children=[12,165]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV (-1)) / colorToInt(head(setToList(ObjectColors(objectOf(index(tail(objects(v0)),IntV 1))))))
MRV immediate domains=[(0,1),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=442 children=[36,213]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(v1))))) / add(colorToInt(head(setToList(ObjectColors(objectOf(index(tail(objects(v0)),IntV 1)))))),IntV 1)
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_less node=443 children=[213,19]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(index(tail(objects(v0)),IntV 1)))))),IntV 1) / add(cardinality(ObjectCells(objectOf(v1))),IntV (-1))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_less node=444 children=[82,19]; conditional algebra witness; cardinality(ObjectCells(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))) / add(cardinality(ObjectCells(objectOf(v1))),IntV (-1))
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_less node=445 children=[79,419]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / y(Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),TL))
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_less node=446 children=[79,425]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / y(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))),TL))
MRV immediate domains=[(0,1),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=450 children=[18,449]; conditional algebra witness; x(Anchor(v1,BL)) / add(y(Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),TL)),IntV (-1))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_lessEqual node=451 children=[82,19]; conditional algebra witness; cardinality(ObjectCells(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))) / add(cardinality(ObjectCells(objectOf(v1))),IntV (-1))
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_lessEqual node=452 children=[79,82]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / cardinality(ObjectCells(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))))
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_lessEqual node=453 children=[79,419]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / y(Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),TL))
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_lessEqual node=454 children=[18,449]; conditional algebra witness; x(Anchor(v1,BL)) / add(y(Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),TL)),IntV (-1))
MRV immediate domains=[(0,1),(1,3)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=459 children=[18,458]; conditional algebra witness; x(Anchor(v1,BL)) / y(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),TL))
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_equal node=460 children=[19,64]; conditional algebra witness; add(cardinality(ObjectCells(objectOf(v1))),IntV (-1)) / x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),BL))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_equal node=461 children=[64,19]; conditional algebra witness; x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),BL)) / add(cardinality(ObjectCells(objectOf(v1))),IntV (-1))
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_equal node=88 children=[21,87]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV 1) / cardinality(ObjectCells(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))))))
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=90 children=[69,89]; conditional algebra witness; x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),Center)) / add(x(Anchor(v1,BR)),IntV (-1))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_equal node=91 children=[87,21]; conditional algebra witness; cardinality(ObjectCells(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))) / add(x(Anchor(v1,BL)),IntV 1)
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_equal node=92 children=[89,69]; conditional algebra witness; add(x(Anchor(v1,BR)),IntV (-1)) / x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),Center))
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_less node=462 children=[79,64]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),BL))
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_less node=463 children=[79,69]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),Center))
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_less node=464 children=[79,87]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / cardinality(ObjectCells(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))))))
MRV immediate domains=[(0,1),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=468 children=[18,467]; conditional algebra witness; x(Anchor(v1,BL)) / x(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))),Center))
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_lessEqual node=469 children=[79,64]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),BL))
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_lessEqual node=470 children=[79,69]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),Center))
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_lessEqual node=471 children=[79,87]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / cardinality(ObjectCells(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))))))
MRV immediate domains=[(0,1),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=472 children=[18,106]; conditional algebra witness; x(Anchor(v1,BL)) / add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),TL)),IntV (-1))
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_equal node=473 children=[348,449]; conditional algebra witness; add(cardinality(ObjectCells(objectOf(v1))),IntV 1) / add(y(Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),TL)),IntV (-1))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_equal node=474 children=[449,348]; conditional algebra witness; add(y(Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),TL)),IntV (-1)) / add(cardinality(ObjectCells(objectOf(v1))),IntV 1)
MRV immediate domains=[(0,1),(1,3)]
Nonempty VS_equal node=475 children=[357,458]; conditional algebra witness; add(y(Anchor(v1,Center)),IntV (-1)) / y(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),TL))
MRV immediate domains=[(0,3),(1,1)]
Nonempty VS_equal node=476 children=[458,357]; conditional algebra witness; y(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),TL)) / add(y(Anchor(v1,Center)),IntV (-1))
MRV immediate domains=[(0,1),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=477 children=[36,250]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(v1))))) / colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))))))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_less node=478 children=[250,19]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))))) / add(cardinality(ObjectCells(objectOf(v1))),IntV (-1))
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_less node=479 children=[111,82]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 1) / cardinality(ObjectCells(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))))
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=483 children=[482,22]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))))),IntV 1) / cardinality(ObjectCells(objectOf(v1)))
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_less node=484 children=[79,449]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / add(y(Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),TL)),IntV (-1))
MRV immediate domains=[(0,1),(1,3)]
Nonempty VS_less node=485 children=[79,458]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / y(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),TL))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=487 children=[18,486]; conditional algebra witness; x(Anchor(v1,BL)) / y(Anchor(index(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),IntV 1),TL))
MRV immediate domains=[(0,1),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=488 children=[12,195]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV (-1)) / x(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),BL))
MRV immediate domains=[(0,1),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=489 children=[12,199]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV (-1)) / x(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))),Center))
MRV immediate domains=[(0,1),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=490 children=[36,238]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(v1))))) / add(x(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),BL)),IntV 1)
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_lessEqual node=491 children=[111,213]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 1) / add(colorToInt(head(setToList(ObjectColors(objectOf(index(tail(objects(v0)),IntV 1)))))),IntV 1)
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_lessEqual node=492 children=[79,449]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / add(y(Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),TL)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=493 children=[18,486]; conditional algebra witness; x(Anchor(v1,BL)) / y(Anchor(index(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),IntV 1),TL))
MRV immediate domains=[(0,1),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=497 children=[18,496]; conditional algebra witness; x(Anchor(v1,BL)) / add(y(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),TL)),IntV (-1))
MRV immediate domains=[(0,1),(1,3)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=502 children=[345,501]; conditional algebra witness; add(y(Anchor(v1,Center)),IntV 1) / add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),Center)),IntV 1)
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=97 children=[96,93]; conditional algebra witness; add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),TL)),IntV 1) / add(y(Anchor(v1,TL)),IntV 1)
MRV immediate domains=[(0,3),(1,1)]
Nonempty VS_equal node=503 children=[501,345]; conditional algebra witness; add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),Center)),IntV 1) / add(y(Anchor(v1,Center)),IntV 1)
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_equal node=109 children=[93,96]; conditional algebra witness; add(y(Anchor(v1,TL)),IntV 1) / add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),TL)),IntV 1)
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=102 children=[101,98]; conditional algebra witness; add(x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),Center)),IntV (-1)) / add(x(Anchor(v1,Center)),IntV (-1))
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_equal node=108 children=[98,101]; conditional algebra witness; add(x(Anchor(v1,Center)),IntV (-1)) / add(x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),Center)),IntV (-1))
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_equal node=107 children=[103,106]; conditional algebra witness; add(y(Anchor(v1,TL)),IntV (-1)) / add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),TL)),IntV (-1))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_equal node=110 children=[106,103]; conditional algebra witness; add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),TL)),IntV (-1)) / add(y(Anchor(v1,TL)),IntV (-1))
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_less node=504 children=[79,106]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),TL)),IntV (-1))
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_lessEqual node=505 children=[79,101]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / add(x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),Center)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=507 children=[18,506]; conditional algebra witness; x(Anchor(v1,BL)) / add(x(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))),Center)),IntV (-1))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_lessEqual node=508 children=[101,19]; conditional algebra witness; add(x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),Center)),IntV (-1)) / add(cardinality(ObjectCells(objectOf(v1))),IntV (-1))
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_less node=509 children=[12,238]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV (-1)) / add(x(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),BL)),IntV 1)
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=510 children=[79,486]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / y(Anchor(index(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),IntV 1),TL))
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_less node=511 children=[79,496]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / add(y(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),TL)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=513 children=[18,512]; conditional algebra witness; x(Anchor(v1,BL)) / add(y(Anchor(index(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),IntV 1),TL)),IntV (-1))
MRV immediate domains=[(0,1),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=514 children=[12,233]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV (-1)) / colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))))
MRV immediate domains=[(0,1),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=515 children=[36,270]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(v1))))) / add(colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))))))),IntV 1)
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_lessEqual node=516 children=[111,250]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 1) / colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))))))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_lessEqual node=517 children=[482,19]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))))),IntV 1) / add(cardinality(ObjectCells(objectOf(v1))),IntV (-1))
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_lessEqual node=518 children=[79,482]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / add(colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))))),IntV 1)
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_lessEqual node=519 children=[79,496]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / add(y(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),TL)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=520 children=[18,512]; conditional algebra witness; x(Anchor(v1,BL)) / add(y(Anchor(index(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),IntV 1),TL)),IntV (-1))
MRV immediate domains=[(0,1),(1,3)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=521 children=[36,115]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(v1))))) / add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))))),IntV 1)
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=522 children=[79,506]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / add(x(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))),Center)),IntV (-1))
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_less node=523 children=[12,270]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV (-1)) / add(colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))))))),IntV 1)
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=524 children=[36,300]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(v1))))) / colorToInt(head(setToList(ObjectColors(objectOf(index(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),IntV 1))))))
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_less node=525 children=[111,482]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 1) / add(colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))))),IntV 1)
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=526 children=[79,512]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / add(y(Anchor(index(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),IntV 1),TL)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=527 children=[79,512]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / add(y(Anchor(index(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),IntV 1),TL)),IntV (-1))
MRV immediate domains=[(0,3),(1,1)]
Nonempty VS_equal node=116 children=[115,111]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))))),IntV 1) / add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 1)
MRV immediate domains=[(0,1),(1,3)]
Nonempty VS_equal node=117 children=[111,115]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 1) / add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))))),IntV 1)
MRV immediate domains=[(0,1),(1,3)]
Nonempty VS_lessEqual node=528 children=[111,115]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 1) / add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))))),IntV 1)
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=529 children=[314,19]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(index(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),IntV 1)))))),IntV 1) / add(cardinality(ObjectCells(objectOf(v1))),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=530 children=[111,300]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 1) / colorToInt(head(setToList(ObjectColors(objectOf(index(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),IntV 1))))))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=531 children=[111,314]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 1) / add(colorToInt(head(setToList(ObjectColors(objectOf(index(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),IntV 1)))))),IntV 1)
Nonempty VS_lambda node=533 children=[532]; function graph -> parameter binding and output points
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_filter node=537 children=[533,536]; filter exact multiplicity/order inverse; predicate consistency retained across duplicate inputs
MRV immediate domains=[(0,1),(1,1)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_filter node=539 children=[119,538]; filter exact multiplicity/order inverse; predicate consistency retained across duplicate inputs
MRV immediate domains=[(0,1),(1,1)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_filter node=541 children=[119,540]; filter exact multiplicity/order inverse; predicate consistency retained across duplicate inputs
MRV immediate domains=[(0,1),(1,2)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_filter node=545 children=[119,544]; filter exact multiplicity/order inverse; predicate consistency retained across duplicate inputs
MRV immediate domains=[(0,1),(1,1)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_filter node=547 children=[119,546]; filter exact multiplicity/order inverse; predicate consistency retained across duplicate inputs
MRV immediate domains=[(0,1),(1,2)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_filter node=551 children=[323,550]; filter exact multiplicity/order inverse; predicate consistency retained across duplicate inputs
MRV immediate domains=[(0,1),(1,1)]
Learn(ArrowT PlacedT BoolT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,83)]
Learn(BoolT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","contains","get","equal","less","lessEqual"]
MRV immediate domains=[(0,1),(1,3)]
Learn(SetT ColorT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","ObjectColors"]
Learn(ColorT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","background"]
Nonempty VS_contains node=11 children=[7,10]; conditional algebra witness; ObjectColors(objectOf(v1)) / ColorV 2
MRV immediate domains=[(0,3),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=16 children=[15,12]; conditional algebra witness; IntV 1 / add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV (-1))
MRV immediate domains=[(0,1),(1,3)]
Nonempty VS_equal node=17 children=[12,15]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV (-1)) / IntV 1
MRV immediate domains=[(0,1),(1,3)]
Nonempty VS_lessEqual node=333 children=[12,15]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV (-1)) / IntV 1
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=20 children=[18,19]; conditional algebra witness; x(Anchor(v1,BL)) / add(cardinality(ObjectCells(objectOf(v1))),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_equal node=24 children=[19,18]; conditional algebra witness; add(cardinality(ObjectCells(objectOf(v1))),IntV (-1)) / x(Anchor(v1,BL))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=23 children=[21,22]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV 1) / cardinality(ObjectCells(objectOf(v1)))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_equal node=25 children=[22,21]; conditional algebra witness; cardinality(ObjectCells(objectOf(v1))) / add(x(Anchor(v1,BL)),IntV 1)
MRV immediate domains=[(0,3),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=40 children=[39,36]; conditional algebra witness; IntV 2 / colorToInt(head(setToList(ObjectColors(objectOf(v1)))))
MRV immediate domains=[(0,1),(1,3)]
Nonempty VS_equal node=41 children=[36,39]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(v1))))) / IntV 2
MRV immediate domains=[(0,1),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=30 children=[26,29]; conditional algebra witness; x(Anchor(v1,BR)) / add(y(Anchor(head(objects(v0)),TL)),IntV (-1))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_equal node=42 children=[29,26]; conditional algebra witness; add(y(Anchor(head(objects(v0)),TL)),IntV (-1)) / x(Anchor(v1,BR))
MRV immediate domains=[(0,1),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=35 children=[31,34]; conditional algebra witness; add(x(Anchor(v1,BR)),IntV 1) / y(Anchor(head(objects(v0)),TL))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_equal node=43 children=[34,31]; conditional algebra witness; y(Anchor(head(objects(v0)),TL)) / add(x(Anchor(v1,BR)),IntV 1)
MRV immediate domains=[(0,1),(1,3)]
Nonempty VS_lessEqual node=373 children=[36,39]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(v1))))) / IntV 2
MRV immediate domains=[(0,1),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=45 children=[44,29]; conditional algebra witness; add(x(Anchor(v1,Center)),IntV 1) / add(y(Anchor(head(objects(v0)),TL)),IntV (-1))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_equal node=46 children=[29,44]; conditional algebra witness; add(y(Anchor(head(objects(v0)),TL)),IntV (-1)) / add(x(Anchor(v1,Center)),IntV 1)
MRV immediate domains=[(0,1),(1,3)]
Nonempty VS_less node=402 children=[12,39]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV (-1)) / IntV 2
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=403 children=[111,19]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 1) / add(cardinality(ObjectCells(objectOf(v1))),IntV (-1))
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=552 children=[29,348]; conditional algebra witness; add(y(Anchor(head(objects(v0)),TL)),IntV (-1)) / add(cardinality(ObjectCells(objectOf(v1))),IntV 1)
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=412 children=[82,22]; conditional algebra witness; cardinality(ObjectCells(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))) / cardinality(ObjectCells(objectOf(v1)))
MRV immediate domains=[(0,2),(1,1)]
Learn(ColorT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","background"]
Learn(SetT ColorT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","ObjectColors"]
Nonempty VS_contains node=51 children=[50,47]; conditional algebra witness; ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))))) / head(setToList(ObjectColors(objectOf(v1))))
MRV immediate domains=[(0,2),(1,1)]
Learn(CellT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get"]
Learn(SetT CellT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","cells","ObjectCells"]
Nonempty VS_contains node=56 children=[55,52]; conditional algebra witness; ObjectCells(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))))) / head(setToList(ObjectCells(objectOf(v1))))
MRV immediate domains=[(0,1),(1,2)]
Learn(SetT CellT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","cells","ObjectCells"]
Learn(CellT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get"]
Nonempty VS_contains node=61 children=[57,60]; conditional algebra witness; ObjectCells(objectOf(v1)) / head(setToList(ObjectCells(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))))
MRV immediate domains=[(0,3),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=431 children=[430,327]; conditional algebra witness; y(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),Center)) / y(Anchor(v1,Center))
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=75 children=[74,71]; conditional algebra witness; y(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),TL)) / y(Anchor(v1,TL))
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_equal node=78 children=[71,74]; conditional algebra witness; y(Anchor(v1,TL)) / y(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),TL))
MRV immediate domains=[(0,1),(1,3)]
Nonempty VS_equal node=432 children=[327,430]; conditional algebra witness; y(Anchor(v1,Center)) / y(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),Center))
MRV immediate domains=[(0,1),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=65 children=[18,64]; conditional algebra witness; x(Anchor(v1,BL)) / x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),BL))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_equal node=76 children=[64,18]; conditional algebra witness; x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),BL)) / x(Anchor(v1,BL))
MRV immediate domains=[(0,1),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=70 children=[66,69]; conditional algebra witness; x(Anchor(v1,Center)) / x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),Center))
MRV immediate domains=[(0,1),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=433 children=[22,87]; conditional algebra witness; cardinality(ObjectCells(objectOf(v1))) / cardinality(ObjectCells(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))))))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_equal node=77 children=[69,66]; conditional algebra witness; x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),Center)) / x(Anchor(v1,Center))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_equal node=434 children=[87,22]; conditional algebra witness; cardinality(ObjectCells(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))) / cardinality(ObjectCells(objectOf(v1)))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_less node=553 children=[64,22]; conditional algebra witness; x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),BL)) / cardinality(ObjectCells(objectOf(v1)))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_lessEqual node=554 children=[64,22]; conditional algebra witness; x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),BL)) / cardinality(ObjectCells(objectOf(v1)))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_lessEqual node=555 children=[69,22]; conditional algebra witness; x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),Center)) / cardinality(ObjectCells(objectOf(v1)))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_lessEqual node=556 children=[87,22]; conditional algebra witness; cardinality(ObjectCells(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))) / cardinality(ObjectCells(objectOf(v1)))
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=83 children=[82,79]; conditional algebra witness; cardinality(ObjectCells(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))) / add(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_equal node=84 children=[79,82]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / cardinality(ObjectCells(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))))
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=443 children=[213,19]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(index(tail(objects(v0)),IntV 1)))))),IntV 1) / add(cardinality(ObjectCells(objectOf(v1))),IntV (-1))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_less node=444 children=[82,19]; conditional algebra witness; cardinality(ObjectCells(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))) / add(cardinality(ObjectCells(objectOf(v1))),IntV (-1))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_lessEqual node=451 children=[82,19]; conditional algebra witness; cardinality(ObjectCells(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))) / add(cardinality(ObjectCells(objectOf(v1))),IntV (-1))
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_equal node=460 children=[19,64]; conditional algebra witness; add(cardinality(ObjectCells(objectOf(v1))),IntV (-1)) / x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),BL))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_equal node=461 children=[64,19]; conditional algebra witness; x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),BL)) / add(cardinality(ObjectCells(objectOf(v1))),IntV (-1))
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_equal node=88 children=[21,87]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV 1) / cardinality(ObjectCells(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))))))
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=90 children=[69,89]; conditional algebra witness; x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),Center)) / add(x(Anchor(v1,BR)),IntV (-1))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_equal node=91 children=[87,21]; conditional algebra witness; cardinality(ObjectCells(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))) / add(x(Anchor(v1,BL)),IntV 1)
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_equal node=92 children=[89,69]; conditional algebra witness; add(x(Anchor(v1,BR)),IntV (-1)) / x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),Center))
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=557 children=[101,22]; conditional algebra witness; add(x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),Center)),IntV (-1)) / cardinality(ObjectCells(objectOf(v1)))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_less node=558 children=[64,348]; conditional algebra witness; x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),BL)) / add(cardinality(ObjectCells(objectOf(v1))),IntV 1)
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_less node=559 children=[69,348]; conditional algebra witness; x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),Center)) / add(cardinality(ObjectCells(objectOf(v1))),IntV 1)
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_less node=560 children=[87,348]; conditional algebra witness; cardinality(ObjectCells(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))) / add(cardinality(ObjectCells(objectOf(v1))),IntV 1)
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_lessEqual node=561 children=[64,19]; conditional algebra witness; x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),BL)) / add(cardinality(ObjectCells(objectOf(v1))),IntV (-1))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_lessEqual node=562 children=[87,348]; conditional algebra witness; cardinality(ObjectCells(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))) / add(cardinality(ObjectCells(objectOf(v1))),IntV 1)
MRV immediate domains=[(0,1),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=473 children=[348,449]; conditional algebra witness; add(cardinality(ObjectCells(objectOf(v1))),IntV 1) / add(y(Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),TL)),IntV (-1))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_equal node=474 children=[449,348]; conditional algebra witness; add(y(Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),TL)),IntV (-1)) / add(cardinality(ObjectCells(objectOf(v1))),IntV 1)
MRV immediate domains=[(0,1),(1,3)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=475 children=[357,458]; conditional algebra witness; add(y(Anchor(v1,Center)),IntV (-1)) / y(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),TL))
MRV immediate domains=[(0,3),(1,1)]
Nonempty VS_equal node=476 children=[458,357]; conditional algebra witness; y(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),TL)) / add(y(Anchor(v1,Center)),IntV (-1))
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=478 children=[250,19]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))))) / add(cardinality(ObjectCells(objectOf(v1))),IntV (-1))
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=483 children=[482,22]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))))),IntV 1) / cardinality(ObjectCells(objectOf(v1)))
MRV immediate domains=[(0,1),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=488 children=[12,195]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV (-1)) / x(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),BL))
MRV immediate domains=[(0,1),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=490 children=[36,238]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(v1))))) / add(x(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),BL)),IntV 1)
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_lessEqual node=563 children=[449,348]; conditional algebra witness; add(y(Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),TL)),IntV (-1)) / add(cardinality(ObjectCells(objectOf(v1))),IntV 1)
MRV immediate domains=[(0,1),(1,3)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=502 children=[345,501]; conditional algebra witness; add(y(Anchor(v1,Center)),IntV 1) / add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),Center)),IntV 1)
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=97 children=[96,93]; conditional algebra witness; add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),TL)),IntV 1) / add(y(Anchor(v1,TL)),IntV 1)
MRV immediate domains=[(0,3),(1,1)]
Nonempty VS_equal node=503 children=[501,345]; conditional algebra witness; add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),Center)),IntV 1) / add(y(Anchor(v1,Center)),IntV 1)
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_equal node=109 children=[93,96]; conditional algebra witness; add(y(Anchor(v1,TL)),IntV 1) / add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),TL)),IntV 1)
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=102 children=[101,98]; conditional algebra witness; add(x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),Center)),IntV (-1)) / add(x(Anchor(v1,Center)),IntV (-1))
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_equal node=108 children=[98,101]; conditional algebra witness; add(x(Anchor(v1,Center)),IntV (-1)) / add(x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),Center)),IntV (-1))
MRV immediate domains=[(0,1),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=107 children=[103,106]; conditional algebra witness; add(y(Anchor(v1,TL)),IntV (-1)) / add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),TL)),IntV (-1))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_equal node=110 children=[106,103]; conditional algebra witness; add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),TL)),IntV (-1)) / add(y(Anchor(v1,TL)),IntV (-1))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_lessEqual node=508 children=[101,19]; conditional algebra witness; add(x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))),Center)),IntV (-1)) / add(cardinality(ObjectCells(objectOf(v1))),IntV (-1))
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_less node=509 children=[12,238]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV (-1)) / add(x(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))),BL)),IntV 1)
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_lessEqual node=517 children=[482,19]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))))),IntV 1) / add(cardinality(ObjectCells(objectOf(v1))),IntV (-1))
MRV immediate domains=[(0,1),(1,3)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=521 children=[36,115]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(v1))))) / add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))))),IntV 1)
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=524 children=[36,300]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(v1))))) / colorToInt(head(setToList(ObjectColors(objectOf(index(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),IntV 1))))))
MRV immediate domains=[(0,3),(1,1)]
Nonempty VS_equal node=116 children=[115,111]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))))),IntV 1) / add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 1)
MRV immediate domains=[(0,1),(1,3)]
Nonempty VS_equal node=117 children=[111,115]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 1) / add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))))),IntV 1)
MRV immediate domains=[(0,1),(1,3)]
Nonempty VS_lessEqual node=528 children=[111,115]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 1) / add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))))),IntV 1)
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=529 children=[314,19]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(index(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),IntV 1)))))),IntV 1) / add(cardinality(ObjectCells(objectOf(v1))),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=530 children=[111,300]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 1) / colorToInt(head(setToList(ObjectColors(objectOf(index(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),IntV 1))))))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=531 children=[111,314]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 1) / add(colorToInt(head(setToList(ObjectColors(objectOf(index(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),IntV 1)))))),IntV 1)
Nonempty VS_lambda node=565 children=[564]; function graph -> parameter binding and output points
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_filter node=567 children=[565,566]; filter exact multiplicity/order inverse; predicate consistency retained across duplicate inputs
Nonempty VS_mkScene node=569 children=[3,6,568]; mkScene residual: canonical correspondence + Render-validated paint order; branch=0
Nonempty VS_lambda node=570 children=[569]; function graph -> parameter binding and output points
Task TSL supported Base=["Anchor","ObjectCells","ObjectColors","add","background","canvasSize","cardinality","colorToInt","contains","equal","filter","head","index","lambda","less","lessEqual","literal","mkScene","objectOf","objects","setToList","sortBy","subtract","tail","x","y"]
Cost saturation C=1..96 root representatives=[(1,0),(2,0),(3,0),(4,0),(5,0),(6,0),(7,0),(8,0),(9,0),(10,0),(11,0),(12,0),(13,0),(14,1),(15,2),(16,2),(17,2),(18,2),(19,2),(20,2),(21,2),(22,2),(23,2),(24,2),(25,2),(26,2),(27,2),(28,2),(29,2),(30,2),(31,2),(32,2),(33,2),(34,2),(35,2),(36,2),(37,2),(38,2),(39,2),(40,2),(41,2),(42,2),(43,2),(44,2),(45,2),(46,2),(47,2),(48,2),(49,2),(50,2),(51,2),(52,2),(53,2),(54,2),(55,2),(56,2),(57,2),(58,2),(59,2),(60,2),(61,2),(62,2),(63,2),(64,2),(65,2),(66,2),(67,2),(68,2),(69,2),(70,2),(71,2),(72,2),(73,2),(74,2),(75,2),(76,2),(77,2),(78,2),(79,2),(80,2),(81,2),(82,2),(83,2),(84,2),(85,2),(86,2),(87,2),(88,2),(89,2),(90,2),(91,2),(92,2),(93,2),(94,2),(95,2),(96,2)]
Abstraction round=0; exact frontier=2; accepted=["I0"]
Task TSL supported Base=["Anchor","ObjectCells","ObjectColors","add","background","canvasSize","cardinality","colorToInt","contains","equal","filter","head","index","lambda","less","lessEqual","literal","mkScene","objectOf","objects","setToList","sortBy","subtract","tail","x","y"]
Abstraction round=1; exact frontier=2; accepted=[]
Cost saturation C=1..96 root representatives=[(1,0),(2,0),(3,0),(4,0),(5,0),(6,0),(7,0),(8,0),(9,0),(10,0),(11,0),(12,0),(13,0),(14,1),(15,2),(16,2),(17,2),(18,2),(19,2),(20,2),(21,2),(22,2),(23,2),(24,2),(25,2),(26,2),(27,2),(28,2),(29,2),(30,2),(31,2),(32,2),(33,2),(34,2),(35,2),(36,2),(37,2),(38,2),(39,2),(40,2),(41,2),(42,2),(43,2),(44,2),(45,2),(46,2),(47,2),(48,2),(49,2),(50,2),(51,2),(52,2),(53,2),(54,2),(55,2),(56,2),(57,2),(58,2),(59,2),(60,2),(61,2),(62,2),(63,2),(64,2),(65,2),(66,2),(67,2),(68,2),(69,2),(70,2),(71,2),(72,2),(73,2),(74,2),(75,2),(76,2),(77,2),(78,2),(79,2),(80,2),(81,2),(82,2),(83,2),(84,2),(85,2),(86,2),(87,2),(88,2),(89,2),(90,2),(91,2),(92,2),(93,2),(94,2),(95,2),(96,2)]
Exact original Render(P(Encode(x)))=y: True; MDL rank=(25,9,2,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. contains(ObjectColors(objectOf(v1)),ColorV 2)),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(27,10,2,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),filter((lambda v1:PlacedT. contains(ObjectColors(objectOf(v1)),ColorV 2)),objects(v0))))")
Selected AST; FV=[]; (lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. contains(ObjectColors(objectOf(v1)),ColorV 2)),objects(v0))))
TaskInvented I0: (lambda __r1h0:ColorT. (lambda v0:SceneT. mkScene(canvasSize(v0),__r1h0,filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),objects(v0))))); repeats=2; portfolio MDL saving=1
Induced TSL=Signature(root VS) union inventions. BaseActivated=["Anchor","ObjectCells","ObjectColors","add","background","canvasSize","cardinality","colorToInt","contains","equal","filter","head","index","lambda","less","lessEqual","literal","mkScene","objectOf","objects","setToList","sortBy","subtract","tail","x","y"]; TaskInvented=["I0"]; StructuralPriorCount=0
```
