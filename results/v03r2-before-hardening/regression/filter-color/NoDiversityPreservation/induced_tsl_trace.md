# LATIS v0.3R.2
StructuralPriorCount=0. Counterfactual labels never guide synthesis.
```text
Root specification Q0: ArrowT SceneT SceneT; observations=2; Gamma=[]. Original Grid targets reserved for exact verification.
Learn(ArrowT SceneT SceneT; observations=2; Gamma=[]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,12)]
Learn(SceneT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","mkScene"]
MRV immediate domains=[(0,2),(1,2),(2,11)]
Learn(SizeT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","size","canvasSize"]
Learn(ColorT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","background"]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,1)]
Learn(ArrowT PlacedT BoolT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,38)]
Learn(BoolT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","contains","get","equal","less","lessEqual"]
MRV immediate domains=[(0,1),(1,2)]
Learn(SetT ColorT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","ObjectColors"]
Learn(ColorT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","background"]
Nonempty VS_contains node=7 children=[5,6]; conditional algebra witness; ObjectColors(objectOf(v1)) / ColorV 2
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=10 children=[9,8]; conditional algebra witness; IntV 1 / add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV (-1))
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_equal node=11 children=[8,9]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV (-1)) / IntV 1
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=14 children=[12,13]; conditional algebra witness; x(Anchor(v1,BL)) / add(cardinality(ObjectCells(objectOf(v1))),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=17 children=[15,16]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV 1) / cardinality(ObjectCells(objectOf(v1)))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_equal node=18 children=[13,12]; conditional algebra witness; add(cardinality(ObjectCells(objectOf(v1))),IntV (-1)) / x(Anchor(v1,BL))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_equal node=19 children=[16,15]; conditional algebra witness; cardinality(ObjectCells(objectOf(v1))) / add(x(Anchor(v1,BL)),IntV 1)
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=22 children=[20,21]; conditional algebra witness; x(Anchor(v1,BR)) / add(y(Anchor(head(objects(v0)),TL)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=25 children=[23,24]; conditional algebra witness; add(x(Anchor(v1,BR)),IntV 1) / y(Anchor(head(objects(v0)),TL))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_equal node=26 children=[21,20]; conditional algebra witness; add(y(Anchor(head(objects(v0)),TL)),IntV (-1)) / x(Anchor(v1,BR))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_equal node=27 children=[24,23]; conditional algebra witness; y(Anchor(head(objects(v0)),TL)) / add(x(Anchor(v1,BR)),IntV 1)
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=29 children=[28,21]; conditional algebra witness; add(x(Anchor(v1,Center)),IntV 1) / add(y(Anchor(head(objects(v0)),TL)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_equal node=30 children=[21,28]; conditional algebra witness; add(y(Anchor(head(objects(v0)),TL)),IntV (-1)) / add(x(Anchor(v1,Center)),IntV 1)
MRV immediate domains=[(0,1),(1,1)]
Learn(SetT ColorT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","ObjectColors"]
Learn(ColorT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","background"]
Nonempty VS_contains node=33 children=[31,32]; conditional algebra witness; ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))))) / head(setToList(ObjectColors(objectOf(v1))))
MRV immediate domains=[(0,1),(1,1)]
Learn(SetT CellT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","cells","ObjectCells"]
Learn(CellT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get"]
Nonempty VS_contains node=36 children=[34,35]; conditional algebra witness; ObjectCells(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))))) / head(setToList(ObjectCells(objectOf(v1))))
MRV immediate domains=[(0,1),(1,1)]
Learn(SetT CellT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","cells","ObjectCells"]
Learn(CellT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get"]
Nonempty VS_contains node=39 children=[37,38]; conditional algebra witness; ObjectCells(objectOf(v1)) / head(setToList(ObjectCells(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))))))))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=41 children=[12,40]; conditional algebra witness; x(Anchor(v1,BL)) / x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))),BL))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=44 children=[42,43]; conditional algebra witness; x(Anchor(v1,Center)) / x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))),Center))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=47 children=[45,46]; conditional algebra witness; y(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))),TL)) / y(Anchor(v1,TL))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_equal node=48 children=[40,12]; conditional algebra witness; x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))),BL)) / x(Anchor(v1,BL))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_equal node=49 children=[43,42]; conditional algebra witness; x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))),Center)) / x(Anchor(v1,Center))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_equal node=50 children=[46,45]; conditional algebra witness; y(Anchor(v1,TL)) / y(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))),TL))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=53 children=[51,52]; conditional algebra witness; cardinality(ObjectCells(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))) / add(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_equal node=54 children=[52,51]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / cardinality(ObjectCells(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=56 children=[15,55]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV 1) / cardinality(ObjectCells(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))))))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=58 children=[43,57]; conditional algebra witness; x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))),Center)) / add(x(Anchor(v1,BR)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_equal node=59 children=[55,15]; conditional algebra witness; cardinality(ObjectCells(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))))))) / add(x(Anchor(v1,BL)),IntV 1)
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_equal node=60 children=[57,43]; conditional algebra witness; add(x(Anchor(v1,BR)),IntV (-1)) / x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))),Center))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=63 children=[61,62]; conditional algebra witness; add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))),TL)),IntV 1) / add(y(Anchor(v1,TL)),IntV 1)
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=66 children=[64,65]; conditional algebra witness; add(x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))),Center)),IntV (-1)) / add(x(Anchor(v1,Center)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=69 children=[67,68]; conditional algebra witness; add(y(Anchor(v1,TL)),IntV (-1)) / add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))),TL)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_equal node=70 children=[65,64]; conditional algebra witness; add(x(Anchor(v1,Center)),IntV (-1)) / add(x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))),Center)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_equal node=71 children=[62,61]; conditional algebra witness; add(y(Anchor(v1,TL)),IntV 1) / add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))),TL)),IntV 1)
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_equal node=72 children=[68,67]; conditional algebra witness; add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))),TL)),IntV (-1)) / add(y(Anchor(v1,TL)),IntV (-1))
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=77 children=[76,73]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))))))))),IntV 1) / add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 1)
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_equal node=78 children=[73,76]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 1) / add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))))))))),IntV 1)
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=81 children=[80,79]; conditional algebra witness; IntV 2 / colorToInt(head(setToList(ObjectColors(objectOf(v1)))))
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_equal node=82 children=[79,80]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(v1))))) / IntV 2
Nonempty VS_lambda node=84 children=[83]; function graph -> parameter binding and output points
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_filter node=86 children=[84,85]; filter exact multiplicity/order inverse; predicate consistency retained across duplicate inputs
MRV immediate domains=[(0,1),(1,1)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_filter node=88 children=[84,87]; filter exact multiplicity/order inverse; predicate consistency retained across duplicate inputs
MRV immediate domains=[(0,1),(1,1)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_filter node=90 children=[84,89]; filter exact multiplicity/order inverse; predicate consistency retained across duplicate inputs
MRV immediate domains=[(0,1),(1,1)]
Learn(ArrowT PlacedT BoolT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,162)]
Learn(BoolT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","contains","get","equal","less","lessEqual"]
MRV immediate domains=[(0,1),(1,2)]
Learn(SetT ColorT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","ObjectColors"]
Learn(ColorT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","background"]
Nonempty VS_contains node=7 children=[5,6]; conditional algebra witness; ObjectColors(objectOf(v1)) / ColorV 2
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=91 children=[9,52]; conditional algebra witness; IntV 1 / add(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,1),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=11 children=[8,9]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV (-1)) / IntV 1
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_equal node=10 children=[9,8]; conditional algebra witness; IntV 1 / add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=14 children=[12,13]; conditional algebra witness; x(Anchor(v1,BL)) / add(cardinality(ObjectCells(objectOf(v1))),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=17 children=[15,16]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV 1) / cardinality(ObjectCells(objectOf(v1)))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_equal node=18 children=[13,12]; conditional algebra witness; add(cardinality(ObjectCells(objectOf(v1))),IntV (-1)) / x(Anchor(v1,BL))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_equal node=19 children=[16,15]; conditional algebra witness; cardinality(ObjectCells(objectOf(v1))) / add(x(Anchor(v1,BL)),IntV 1)
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=92 children=[79,12]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(v1))))) / x(Anchor(v1,BL))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=93 children=[79,42]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(v1))))) / x(Anchor(v1,Center))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=22 children=[20,21]; conditional algebra witness; x(Anchor(v1,BR)) / add(y(Anchor(head(objects(v0)),TL)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=25 children=[23,24]; conditional algebra witness; add(x(Anchor(v1,BR)),IntV 1) / y(Anchor(head(objects(v0)),TL))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_equal node=26 children=[21,20]; conditional algebra witness; add(y(Anchor(head(objects(v0)),TL)),IntV (-1)) / x(Anchor(v1,BR))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_equal node=27 children=[24,23]; conditional algebra witness; y(Anchor(head(objects(v0)),TL)) / add(x(Anchor(v1,BR)),IntV 1)
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=94 children=[79,52]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(v1))))) / add(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=95 children=[79,65]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(v1))))) / add(x(Anchor(v1,Center)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=96 children=[73,12]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 1) / x(Anchor(v1,BL))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=97 children=[73,42]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 1) / x(Anchor(v1,Center))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=98 children=[73,20]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 1) / x(Anchor(v1,BR))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=99 children=[79,52]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(v1))))) / add(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=100 children=[79,65]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(v1))))) / add(x(Anchor(v1,Center)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=101 children=[73,12]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 1) / x(Anchor(v1,BL))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=102 children=[73,42]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 1) / x(Anchor(v1,Center))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=104 children=[103,12]; conditional algebra witness; add(cardinality(ObjectCells(objectOf(head(objects(v0))))),IntV (-1)) / x(Anchor(v1,BL))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=105 children=[103,42]; conditional algebra witness; add(cardinality(ObjectCells(objectOf(head(objects(v0))))),IntV (-1)) / x(Anchor(v1,Center))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=106 children=[103,20]; conditional algebra witness; add(cardinality(ObjectCells(objectOf(head(objects(v0))))),IntV (-1)) / x(Anchor(v1,BR))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=108 children=[107,12]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(head(tail(objects(v0)))))))) / x(Anchor(v1,BL))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=109 children=[107,42]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(head(tail(objects(v0)))))))) / x(Anchor(v1,Center))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=110 children=[8,52]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV (-1)) / add(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=111 children=[8,65]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV (-1)) / add(x(Anchor(v1,Center)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=113 children=[112,12]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(index(tail(objects(v0)),IntV 1)))))) / x(Anchor(v1,BL))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=114 children=[112,42]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(index(tail(objects(v0)),IntV 1)))))) / x(Anchor(v1,Center))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=115 children=[112,20]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(index(tail(objects(v0)),IntV 1)))))) / x(Anchor(v1,BR))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=116 children=[73,52]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 1) / add(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=117 children=[73,65]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 1) / add(x(Anchor(v1,Center)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=118 children=[73,15]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 1) / add(x(Anchor(v1,BL)),IntV 1)
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=119 children=[112,12]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(index(tail(objects(v0)),IntV 1)))))) / x(Anchor(v1,BL))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=120 children=[112,42]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(index(tail(objects(v0)),IntV 1)))))) / x(Anchor(v1,Center))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=121 children=[73,52]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 1) / add(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=122 children=[73,65]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 1) / add(x(Anchor(v1,Center)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=124 children=[123,52]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(head(objects(v0))))))) / add(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=125 children=[103,15]; conditional algebra witness; add(cardinality(ObjectCells(objectOf(head(objects(v0))))),IntV (-1)) / add(x(Anchor(v1,BL)),IntV 1)
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=127 children=[126,12]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(head(objects(v0))))))),IntV 1) / x(Anchor(v1,BL))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=129 children=[128,20]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(objects(v0)))))))),IntV 1) / x(Anchor(v1,BR))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=130 children=[107,52]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(head(tail(objects(v0)))))))) / add(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=131 children=[107,65]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(head(tail(objects(v0)))))))) / add(x(Anchor(v1,Center)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=132 children=[128,12]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(objects(v0)))))))),IntV 1) / x(Anchor(v1,BL))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=133 children=[128,42]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(objects(v0)))))))),IntV 1) / x(Anchor(v1,Center))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=135 children=[134,12]; conditional algebra witness; x(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))),BL)) / x(Anchor(v1,BL))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=137 children=[136,12]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(index(tail(objects(v0)),IntV 1)))))),IntV (-1)) / x(Anchor(v1,BL))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=138 children=[136,42]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(index(tail(objects(v0)),IntV 1)))))),IntV (-1)) / x(Anchor(v1,Center))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=140 children=[139,52]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(head(objects(v0))))))),IntV (-1)) / add(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=141 children=[112,52]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(index(tail(objects(v0)),IntV 1)))))) / add(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=142 children=[112,65]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(index(tail(objects(v0)),IntV 1)))))) / add(x(Anchor(v1,Center)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=143 children=[112,15]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(index(tail(objects(v0)),IntV 1)))))) / add(x(Anchor(v1,BL)),IntV 1)
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=144 children=[112,52]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(index(tail(objects(v0)),IntV 1)))))) / add(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=145 children=[112,65]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(index(tail(objects(v0)),IntV 1)))))) / add(x(Anchor(v1,Center)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=147 children=[146,12]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(index(tail(objects(v0)),IntV 1)))))),IntV 1) / x(Anchor(v1,BL))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=148 children=[146,42]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(index(tail(objects(v0)),IntV 1)))))),IntV 1) / x(Anchor(v1,Center))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=149 children=[146,20]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(index(tail(objects(v0)),IntV 1)))))),IntV 1) / x(Anchor(v1,BR))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=150 children=[126,52]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(head(objects(v0))))))),IntV 1) / add(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=151 children=[126,65]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(head(objects(v0))))))),IntV 1) / add(x(Anchor(v1,Center)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Learn(SetT ColorT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","ObjectColors"]
Learn(ColorT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","background"]
Nonempty VS_contains node=33 children=[31,32]; conditional algebra witness; ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))))) / head(setToList(ObjectColors(objectOf(v1))))
MRV immediate domains=[(0,1),(1,1)]
Learn(SetT CellT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","cells","ObjectCells"]
Learn(CellT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get"]
Nonempty VS_contains node=39 children=[37,38]; conditional algebra witness; ObjectCells(objectOf(v1)) / head(setToList(ObjectCells(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))))))))
MRV immediate domains=[(0,1),(1,1)]
Learn(SetT CellT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","cells","ObjectCells"]
Learn(CellT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get"]
Nonempty VS_contains node=36 children=[34,35]; conditional algebra witness; ObjectCells(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))))) / head(setToList(ObjectCells(objectOf(v1))))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=41 children=[12,40]; conditional algebra witness; x(Anchor(v1,BL)) / x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))),BL))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=44 children=[42,43]; conditional algebra witness; x(Anchor(v1,Center)) / x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))),Center))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=47 children=[45,46]; conditional algebra witness; y(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))),TL)) / y(Anchor(v1,TL))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_equal node=48 children=[40,12]; conditional algebra witness; x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))),BL)) / x(Anchor(v1,BL))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_equal node=49 children=[43,42]; conditional algebra witness; x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))),Center)) / x(Anchor(v1,Center))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_equal node=50 children=[46,45]; conditional algebra witness; y(Anchor(v1,TL)) / y(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))),TL))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=153 children=[152,52]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(objects(v0)))))))),IntV (-1)) / add(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=154 children=[152,65]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(objects(v0)))))))),IntV (-1)) / add(x(Anchor(v1,Center)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=155 children=[128,15]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(objects(v0)))))))),IntV 1) / add(x(Anchor(v1,BL)),IntV 1)
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=54 children=[52,51]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / cardinality(ObjectCells(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_equal node=53 children=[51,52]; conditional algebra witness; cardinality(ObjectCells(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))) / add(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=156 children=[134,52]; conditional algebra witness; x(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))),BL)) / add(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=157 children=[134,65]; conditional algebra witness; x(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))),BL)) / add(x(Anchor(v1,Center)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=158 children=[136,52]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(index(tail(objects(v0)),IntV 1)))))),IntV (-1)) / add(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=159 children=[136,65]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(index(tail(objects(v0)),IntV 1)))))),IntV (-1)) / add(x(Anchor(v1,Center)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=161 children=[160,12]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))))))) / x(Anchor(v1,BL))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=162 children=[160,42]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))))))) / x(Anchor(v1,Center))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=164 children=[163,12]; conditional algebra witness; add(x(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))),BL)),IntV 1) / x(Anchor(v1,BL))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=165 children=[163,42]; conditional algebra witness; add(x(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))),BL)),IntV 1) / x(Anchor(v1,Center))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=166 children=[134,52]; conditional algebra witness; x(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))),BL)) / add(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=167 children=[136,52]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(index(tail(objects(v0)),IntV 1)))))),IntV (-1)) / add(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=168 children=[136,65]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(index(tail(objects(v0)),IntV 1)))))),IntV (-1)) / add(x(Anchor(v1,Center)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=169 children=[163,12]; conditional algebra witness; add(x(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))),BL)),IntV 1) / x(Anchor(v1,BL))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=170 children=[146,52]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(index(tail(objects(v0)),IntV 1)))))),IntV 1) / add(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=171 children=[146,65]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(index(tail(objects(v0)),IntV 1)))))),IntV 1) / add(x(Anchor(v1,Center)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=172 children=[146,15]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(index(tail(objects(v0)),IntV 1)))))),IntV 1) / add(x(Anchor(v1,BL)),IntV 1)
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=174 children=[173,12]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))))) / x(Anchor(v1,BL))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=175 children=[173,42]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))))) / x(Anchor(v1,Center))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=176 children=[173,20]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))))) / x(Anchor(v1,BR))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=56 children=[15,55]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV 1) / cardinality(ObjectCells(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))))))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_equal node=59 children=[55,15]; conditional algebra witness; cardinality(ObjectCells(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))))))) / add(x(Anchor(v1,BL)),IntV 1)
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=178 children=[177,52]; conditional algebra witness; add(x(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))),BL)),IntV (-1)) / add(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=180 children=[179,52]; conditional algebra witness; add(x(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))),Center)),IntV (-1)) / add(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=181 children=[179,65]; conditional algebra witness; add(x(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))),Center)),IntV (-1)) / add(x(Anchor(v1,Center)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=182 children=[160,52]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))))))) / add(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=183 children=[160,65]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))))))) / add(x(Anchor(v1,Center)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=184 children=[163,52]; conditional algebra witness; add(x(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))),BL)),IntV 1) / add(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=185 children=[163,65]; conditional algebra witness; add(x(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))),BL)),IntV 1) / add(x(Anchor(v1,Center)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=186 children=[163,15]; conditional algebra witness; add(x(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))),BL)),IntV 1) / add(x(Anchor(v1,BL)),IntV 1)
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=188 children=[187,12]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))))),IntV (-1)) / x(Anchor(v1,BL))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=189 children=[187,42]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))))),IntV (-1)) / x(Anchor(v1,Center))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=190 children=[187,20]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))))),IntV (-1)) / x(Anchor(v1,BR))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=191 children=[160,52]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))))))) / add(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=192 children=[160,65]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))))))) / add(x(Anchor(v1,Center)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=193 children=[163,52]; conditional algebra witness; add(x(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))),BL)),IntV 1) / add(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=194 children=[163,65]; conditional algebra witness; add(x(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))),BL)),IntV 1) / add(x(Anchor(v1,Center)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=195 children=[187,12]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))))),IntV (-1)) / x(Anchor(v1,BL))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=196 children=[187,42]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))))),IntV (-1)) / x(Anchor(v1,Center))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=197 children=[173,52]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))))) / add(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=198 children=[173,65]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))))) / add(x(Anchor(v1,Center)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=199 children=[173,15]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))))) / add(x(Anchor(v1,BL)),IntV 1)
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=70 children=[65,64]; conditional algebra witness; add(x(Anchor(v1,Center)),IntV (-1)) / add(x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))),Center)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=71 children=[62,61]; conditional algebra witness; add(y(Anchor(v1,TL)),IntV 1) / add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))),TL)),IntV 1)
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_equal node=63 children=[61,62]; conditional algebra witness; add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))),TL)),IntV 1) / add(y(Anchor(v1,TL)),IntV 1)
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_equal node=66 children=[64,65]; conditional algebra witness; add(x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))),Center)),IntV (-1)) / add(x(Anchor(v1,Center)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=69 children=[67,68]; conditional algebra witness; add(y(Anchor(v1,TL)),IntV (-1)) / add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))),TL)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_equal node=72 children=[68,67]; conditional algebra witness; add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))),TL)),IntV (-1)) / add(y(Anchor(v1,TL)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=201 children=[200,12]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))))))))) / x(Anchor(v1,BL))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=202 children=[200,42]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))))))))) / x(Anchor(v1,Center))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=203 children=[200,20]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))))))))) / x(Anchor(v1,BR))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=204 children=[200,12]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))))))))) / x(Anchor(v1,BL))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=205 children=[200,42]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))))))))) / x(Anchor(v1,Center))
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=206 children=[76,12]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))))))))),IntV 1) / x(Anchor(v1,BL))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=208 children=[207,52]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))))))),IntV (-1)) / add(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=209 children=[207,65]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))))))),IntV (-1)) / add(x(Anchor(v1,Center)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=210 children=[187,52]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))))),IntV (-1)) / add(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=211 children=[187,65]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))))),IntV (-1)) / add(x(Anchor(v1,Center)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=212 children=[187,15]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))))),IntV (-1)) / add(x(Anchor(v1,BL)),IntV 1)
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=213 children=[187,52]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))))),IntV (-1)) / add(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=214 children=[187,65]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))))),IntV (-1)) / add(x(Anchor(v1,Center)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=216 children=[215,12]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(index(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),IntV 1)))))) / x(Anchor(v1,BL))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=217 children=[215,42]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(index(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),IntV 1)))))) / x(Anchor(v1,Center))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=219 children=[218,12]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))))))))),IntV (-1)) / x(Anchor(v1,BL))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=220 children=[218,42]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))))))))),IntV (-1)) / x(Anchor(v1,Center))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=221 children=[200,15]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))))))))) / add(x(Anchor(v1,BL)),IntV 1)
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=222 children=[200,52]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))))))))) / add(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=223 children=[200,65]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))))))))) / add(x(Anchor(v1,Center)),IntV (-1))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_lessEqual node=224 children=[76,52]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))))))))),IntV 1) / add(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_lessEqual node=225 children=[76,65]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))))))))),IntV 1) / add(x(Anchor(v1,Center)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=226 children=[215,52]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(index(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),IntV 1)))))) / add(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=227 children=[215,65]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(index(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),IntV 1)))))) / add(x(Anchor(v1,Center)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=228 children=[215,15]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(index(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),IntV 1)))))) / add(x(Anchor(v1,BL)),IntV 1)
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=230 children=[229,12]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(index(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),IntV 1)))))),IntV 1) / x(Anchor(v1,BL))
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_equal node=78 children=[73,76]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 1) / add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))))))))),IntV 1)
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_equal node=77 children=[76,73]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))))))))),IntV 1) / add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 1)
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=231 children=[218,52]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))))))))),IntV (-1)) / add(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=232 children=[218,65]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))))))))),IntV (-1)) / add(x(Anchor(v1,Center)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=233 children=[218,52]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))))))))),IntV (-1)) / add(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=234 children=[218,65]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))))))))),IntV (-1)) / add(x(Anchor(v1,Center)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=235 children=[229,52]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(index(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),IntV 1)))))),IntV 1) / add(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=236 children=[229,65]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(index(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),IntV 1)))))),IntV 1) / add(x(Anchor(v1,Center)),IntV (-1))
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=237 children=[80,12]; conditional algebra witness; IntV 2 / x(Anchor(v1,BL))
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_equal node=82 children=[79,80]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(v1))))) / IntV 2
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_equal node=81 children=[80,79]; conditional algebra witness; IntV 2 / colorToInt(head(setToList(ObjectColors(objectOf(v1)))))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_less node=238 children=[80,52]; conditional algebra witness; IntV 2 / add(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_less node=239 children=[80,65]; conditional algebra witness; IntV 2 / add(x(Anchor(v1,Center)),IntV (-1))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_lessEqual node=240 children=[80,52]; conditional algebra witness; IntV 2 / add(x(Anchor(v1,BL)),IntV (-1))
Nonempty VS_lambda node=242 children=[241]; function graph -> parameter binding and output points
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_filter node=244 children=[242,243]; filter exact multiplicity/order inverse; predicate consistency retained across duplicate inputs
MRV immediate domains=[(0,1),(1,1)]
Learn(ArrowT PlacedT BoolT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,178)]
Learn(BoolT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","contains","get","equal","less","lessEqual"]
MRV immediate domains=[(0,1),(1,2)]
Learn(SetT ColorT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","ObjectColors"]
Learn(ColorT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","background"]
Nonempty VS_contains node=7 children=[5,6]; conditional algebra witness; ObjectColors(objectOf(v1)) / ColorV 2
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=245 children=[12,46]; conditional algebra witness; x(Anchor(v1,BL)) / y(Anchor(v1,TL))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=247 children=[12,246]; conditional algebra witness; x(Anchor(v1,BL)) / y(Anchor(v1,Center))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=248 children=[12,16]; conditional algebra witness; x(Anchor(v1,BL)) / cardinality(ObjectCells(objectOf(v1)))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=249 children=[12,46]; conditional algebra witness; x(Anchor(v1,BL)) / y(Anchor(v1,TL))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=250 children=[12,246]; conditional algebra witness; x(Anchor(v1,BL)) / y(Anchor(v1,Center))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=251 children=[12,16]; conditional algebra witness; x(Anchor(v1,BL)) / cardinality(ObjectCells(objectOf(v1)))
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=10 children=[9,8]; conditional algebra witness; IntV 1 / add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV (-1))
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_equal node=11 children=[8,9]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV (-1)) / IntV 1
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_lessEqual node=252 children=[8,9]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV (-1)) / IntV 1
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=14 children=[12,13]; conditional algebra witness; x(Anchor(v1,BL)) / add(cardinality(ObjectCells(objectOf(v1))),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_equal node=18 children=[13,12]; conditional algebra witness; add(cardinality(ObjectCells(objectOf(v1))),IntV (-1)) / x(Anchor(v1,BL))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=17 children=[15,16]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV 1) / cardinality(ObjectCells(objectOf(v1)))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_equal node=19 children=[16,15]; conditional algebra witness; cardinality(ObjectCells(objectOf(v1))) / add(x(Anchor(v1,BL)),IntV 1)
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=253 children=[52,46]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / y(Anchor(v1,TL))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=254 children=[52,246]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / y(Anchor(v1,Center))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=255 children=[52,16]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / cardinality(ObjectCells(objectOf(v1)))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=257 children=[12,256]; conditional algebra witness; x(Anchor(v1,BL)) / add(y(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=259 children=[12,258]; conditional algebra witness; x(Anchor(v1,BL)) / x(Anchor(head(objects(v0)),BR))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=261 children=[12,260]; conditional algebra witness; x(Anchor(v1,BL)) / add(y(Anchor(v1,Center)),IntV 1)
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=262 children=[12,62]; conditional algebra witness; x(Anchor(v1,BL)) / add(y(Anchor(v1,TL)),IntV 1)
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=264 children=[12,263]; conditional algebra witness; x(Anchor(v1,BL)) / add(cardinality(ObjectCells(objectOf(v1))),IntV 1)
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=265 children=[52,46]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / y(Anchor(v1,TL))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=266 children=[52,16]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / cardinality(ObjectCells(objectOf(v1)))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=267 children=[12,62]; conditional algebra witness; x(Anchor(v1,BL)) / add(y(Anchor(v1,TL)),IntV 1)
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=268 children=[12,13]; conditional algebra witness; x(Anchor(v1,BL)) / add(cardinality(ObjectCells(objectOf(v1))),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=269 children=[12,263]; conditional algebra witness; x(Anchor(v1,BL)) / add(cardinality(ObjectCells(objectOf(v1))),IntV 1)
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=270 children=[12,24]; conditional algebra witness; x(Anchor(v1,BL)) / y(Anchor(head(objects(v0)),TL))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=271 children=[12,67]; conditional algebra witness; x(Anchor(v1,BL)) / add(y(Anchor(v1,TL)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=273 children=[12,272]; conditional algebra witness; x(Anchor(v1,BL)) / add(y(Anchor(v1,Center)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=275 children=[12,274]; conditional algebra witness; x(Anchor(v1,BL)) / y(Anchor(head(objects(v0)),Center))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=22 children=[20,21]; conditional algebra witness; x(Anchor(v1,BR)) / add(y(Anchor(head(objects(v0)),TL)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_equal node=26 children=[21,20]; conditional algebra witness; add(y(Anchor(head(objects(v0)),TL)),IntV (-1)) / x(Anchor(v1,BR))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=25 children=[23,24]; conditional algebra witness; add(x(Anchor(v1,BR)),IntV 1) / y(Anchor(head(objects(v0)),TL))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_equal node=27 children=[24,23]; conditional algebra witness; y(Anchor(head(objects(v0)),TL)) / add(x(Anchor(v1,BR)),IntV 1)
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=276 children=[79,13]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(v1))))) / add(cardinality(ObjectCells(objectOf(v1))),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=277 children=[73,16]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 1) / cardinality(ObjectCells(objectOf(v1)))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=278 children=[52,62]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / add(y(Anchor(v1,TL)),IntV 1)
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=279 children=[52,13]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / add(cardinality(ObjectCells(objectOf(v1))),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=280 children=[52,263]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / add(cardinality(ObjectCells(objectOf(v1))),IntV 1)
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=281 children=[52,24]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / y(Anchor(head(objects(v0)),TL))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=282 children=[52,67]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / add(y(Anchor(v1,TL)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=283 children=[52,272]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / add(y(Anchor(v1,Center)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=284 children=[52,274]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / y(Anchor(head(objects(v0)),Center))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=285 children=[12,21]; conditional algebra witness; x(Anchor(v1,BL)) / add(y(Anchor(head(objects(v0)),TL)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=287 children=[52,286]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / cardinality(ObjectCells(objectOf(head(objects(v0)))))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=288 children=[52,13]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / add(cardinality(ObjectCells(objectOf(v1))),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=289 children=[52,263]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / add(cardinality(ObjectCells(objectOf(v1))),IntV 1)
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=290 children=[52,24]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / y(Anchor(head(objects(v0)),TL))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=291 children=[52,67]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / add(y(Anchor(v1,TL)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=292 children=[52,272]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / add(y(Anchor(v1,Center)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=294 children=[12,293]; conditional algebra witness; x(Anchor(v1,BL)) / add(cardinality(ObjectCells(objectOf(head(objects(v0))))),IntV 1)
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=295 children=[12,21]; conditional algebra witness; x(Anchor(v1,BL)) / add(y(Anchor(head(objects(v0)),TL)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=297 children=[12,296]; conditional algebra witness; x(Anchor(v1,BL)) / add(x(Anchor(head(objects(v0)),BR)),IntV (-1))
MRV immediate domains=[(0,1),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=301 children=[52,300]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / cardinality(ObjectCells(objectOf(head(tail(objects(v0))))))
MRV immediate domains=[(0,1),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=305 children=[12,304]; conditional algebra witness; x(Anchor(v1,BL)) / add(cardinality(ObjectCells(objectOf(head(tail(objects(v0)))))),IntV 1)
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=29 children=[28,21]; conditional algebra witness; add(x(Anchor(v1,Center)),IntV 1) / add(y(Anchor(head(objects(v0)),TL)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_equal node=30 children=[21,28]; conditional algebra witness; add(y(Anchor(head(objects(v0)),TL)),IntV (-1)) / add(x(Anchor(v1,Center)),IntV 1)
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=306 children=[73,13]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 1) / add(cardinality(ObjectCells(objectOf(v1))),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=307 children=[52,293]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / add(cardinality(ObjectCells(objectOf(head(objects(v0))))),IntV 1)
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=308 children=[52,21]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / add(y(Anchor(head(objects(v0)),TL)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=309 children=[52,296]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / add(x(Anchor(head(objects(v0)),BR)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=310 children=[73,13]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 1) / add(cardinality(ObjectCells(objectOf(v1))),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=311 children=[52,293]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / add(cardinality(ObjectCells(objectOf(head(objects(v0))))),IntV 1)
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=312 children=[52,21]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / add(y(Anchor(head(objects(v0)),TL)),IntV (-1))
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_less node=313 children=[52,304]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / add(cardinality(ObjectCells(objectOf(head(tail(objects(v0)))))),IntV 1)
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_lessEqual node=314 children=[52,304]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / add(cardinality(ObjectCells(objectOf(head(tail(objects(v0)))))),IntV 1)
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=315 children=[51,16]; conditional algebra witness; cardinality(ObjectCells(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))) / cardinality(ObjectCells(objectOf(v1)))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=317 children=[12,316]; conditional algebra witness; x(Anchor(v1,BL)) / x(Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),BL))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=319 children=[12,318]; conditional algebra witness; x(Anchor(v1,BL)) / y(Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),TL))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=320 children=[79,112]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(v1))))) / colorToInt(head(setToList(ObjectColors(objectOf(index(tail(objects(v0)),IntV 1))))))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=321 children=[12,318]; conditional algebra witness; x(Anchor(v1,BL)) / y(Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),TL))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=323 children=[12,322]; conditional algebra witness; x(Anchor(v1,BL)) / y(Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),Center))
MRV immediate domains=[(0,1),(1,1)]
Learn(SetT ColorT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","ObjectColors"]
Learn(ColorT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","background"]
Nonempty VS_contains node=33 children=[31,32]; conditional algebra witness; ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))))) / head(setToList(ObjectColors(objectOf(v1))))
MRV immediate domains=[(0,1),(1,1)]
Learn(SetT CellT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","cells","ObjectCells"]
Learn(CellT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get"]
Nonempty VS_contains node=36 children=[34,35]; conditional algebra witness; ObjectCells(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))))) / head(setToList(ObjectCells(objectOf(v1))))
MRV immediate domains=[(0,1),(1,1)]
Learn(SetT CellT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","cells","ObjectCells"]
Learn(CellT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get"]
Nonempty VS_contains node=39 children=[37,38]; conditional algebra witness; ObjectCells(objectOf(v1)) / head(setToList(ObjectCells(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))))))))
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=327 children=[326,246]; conditional algebra witness; y(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))),Center)) / y(Anchor(v1,Center))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=47 children=[45,46]; conditional algebra witness; y(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))),TL)) / y(Anchor(v1,TL))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_equal node=50 children=[46,45]; conditional algebra witness; y(Anchor(v1,TL)) / y(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))),TL))
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_equal node=328 children=[246,326]; conditional algebra witness; y(Anchor(v1,Center)) / y(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))),Center))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=41 children=[12,40]; conditional algebra witness; x(Anchor(v1,BL)) / x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))),BL))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_equal node=48 children=[40,12]; conditional algebra witness; x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))),BL)) / x(Anchor(v1,BL))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=44 children=[42,43]; conditional algebra witness; x(Anchor(v1,Center)) / x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))),Center))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=329 children=[16,55]; conditional algebra witness; cardinality(ObjectCells(objectOf(v1))) / cardinality(ObjectCells(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))))))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_equal node=49 children=[43,42]; conditional algebra witness; x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))),Center)) / x(Anchor(v1,Center))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_equal node=330 children=[55,16]; conditional algebra witness; cardinality(ObjectCells(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))))))) / cardinality(ObjectCells(objectOf(v1)))
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_less node=331 children=[12,326]; conditional algebra witness; x(Anchor(v1,BL)) / y(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))),Center))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=332 children=[12,45]; conditional algebra witness; x(Anchor(v1,BL)) / y(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))),TL))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=333 children=[12,55]; conditional algebra witness; x(Anchor(v1,BL)) / cardinality(ObjectCells(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))))))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=334 children=[12,40]; conditional algebra witness; x(Anchor(v1,BL)) / x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))),BL))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=335 children=[12,43]; conditional algebra witness; x(Anchor(v1,BL)) / x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))),Center))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=336 children=[12,55]; conditional algebra witness; x(Anchor(v1,BL)) / cardinality(ObjectCells(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))))))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_equal node=53 children=[51,52]; conditional algebra witness; cardinality(ObjectCells(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))) / add(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_equal node=54 children=[52,51]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / cardinality(ObjectCells(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=337 children=[8,112]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV (-1)) / colorToInt(head(setToList(ObjectColors(objectOf(index(tail(objects(v0)),IntV 1))))))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=338 children=[79,146]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(v1))))) / add(colorToInt(head(setToList(ObjectColors(objectOf(index(tail(objects(v0)),IntV 1)))))),IntV 1)
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=339 children=[146,13]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(index(tail(objects(v0)),IntV 1)))))),IntV 1) / add(cardinality(ObjectCells(objectOf(v1))),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=340 children=[51,13]; conditional algebra witness; cardinality(ObjectCells(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))) / add(cardinality(ObjectCells(objectOf(v1))),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=341 children=[52,318]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / y(Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),TL))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=342 children=[52,322]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / y(Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),Center))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=344 children=[12,343]; conditional algebra witness; x(Anchor(v1,BL)) / add(y(Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),TL)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=345 children=[51,13]; conditional algebra witness; cardinality(ObjectCells(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))) / add(cardinality(ObjectCells(objectOf(v1))),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=346 children=[52,51]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / cardinality(ObjectCells(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=347 children=[52,318]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / y(Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),TL))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=348 children=[12,343]; conditional algebra witness; x(Anchor(v1,BL)) / add(y(Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),TL)),IntV (-1))
MRV immediate domains=[(0,1),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=352 children=[12,351]; conditional algebra witness; x(Anchor(v1,BL)) / y(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),TL))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_equal node=353 children=[13,40]; conditional algebra witness; add(cardinality(ObjectCells(objectOf(v1))),IntV (-1)) / x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))),BL))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_equal node=354 children=[40,13]; conditional algebra witness; x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))),BL)) / add(cardinality(ObjectCells(objectOf(v1))),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_equal node=56 children=[15,55]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV 1) / cardinality(ObjectCells(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))))))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=58 children=[43,57]; conditional algebra witness; x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))),Center)) / add(x(Anchor(v1,BR)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_equal node=59 children=[55,15]; conditional algebra witness; cardinality(ObjectCells(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))))))) / add(x(Anchor(v1,BL)),IntV 1)
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_equal node=60 children=[57,43]; conditional algebra witness; add(x(Anchor(v1,BR)),IntV (-1)) / x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))),Center))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=355 children=[52,40]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))),BL))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=356 children=[52,43]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))),Center))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=357 children=[52,55]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / cardinality(ObjectCells(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))))))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=359 children=[12,358]; conditional algebra witness; x(Anchor(v1,BL)) / x(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))),Center))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=360 children=[52,40]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))),BL))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=361 children=[52,43]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))),Center))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=362 children=[52,55]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / cardinality(ObjectCells(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))))))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=363 children=[12,68]; conditional algebra witness; x(Anchor(v1,BL)) / add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))),TL)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_equal node=364 children=[263,343]; conditional algebra witness; add(cardinality(ObjectCells(objectOf(v1))),IntV 1) / add(y(Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),TL)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_equal node=365 children=[343,263]; conditional algebra witness; add(y(Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),TL)),IntV (-1)) / add(cardinality(ObjectCells(objectOf(v1))),IntV 1)
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_equal node=366 children=[272,351]; conditional algebra witness; add(y(Anchor(v1,Center)),IntV (-1)) / y(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),TL))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_equal node=367 children=[351,272]; conditional algebra witness; y(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),TL)) / add(y(Anchor(v1,Center)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=368 children=[79,173]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(v1))))) / colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))))))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=369 children=[173,13]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))))) / add(cardinality(ObjectCells(objectOf(v1))),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=370 children=[73,51]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 1) / cardinality(ObjectCells(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=372 children=[371,16]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))))),IntV 1) / cardinality(ObjectCells(objectOf(v1)))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=373 children=[52,343]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / add(y(Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),TL)),IntV (-1))
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_less node=374 children=[52,351]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / y(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),TL))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=376 children=[12,375]; conditional algebra witness; x(Anchor(v1,BL)) / y(Anchor(index(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),IntV 1),TL))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=377 children=[8,134]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV (-1)) / x(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))),BL))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=378 children=[8,136]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV (-1)) / add(colorToInt(head(setToList(ObjectColors(objectOf(index(tail(objects(v0)),IntV 1)))))),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=379 children=[79,163]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(v1))))) / add(x(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))),BL)),IntV 1)
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=380 children=[73,146]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 1) / add(colorToInt(head(setToList(ObjectColors(objectOf(index(tail(objects(v0)),IntV 1)))))),IntV 1)
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=381 children=[52,343]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / add(y(Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),TL)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=382 children=[12,375]; conditional algebra witness; x(Anchor(v1,BL)) / y(Anchor(index(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),IntV 1),TL))
MRV immediate domains=[(0,1),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=386 children=[12,385]; conditional algebra witness; x(Anchor(v1,BL)) / add(y(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),TL)),IntV (-1))
MRV immediate domains=[(0,1),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=390 children=[260,389]; conditional algebra witness; add(y(Anchor(v1,Center)),IntV 1) / add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))),Center)),IntV 1)
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=63 children=[61,62]; conditional algebra witness; add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))),TL)),IntV 1) / add(y(Anchor(v1,TL)),IntV 1)
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_equal node=391 children=[389,260]; conditional algebra witness; add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))),Center)),IntV 1) / add(y(Anchor(v1,Center)),IntV 1)
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_equal node=71 children=[62,61]; conditional algebra witness; add(y(Anchor(v1,TL)),IntV 1) / add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))),TL)),IntV 1)
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=66 children=[64,65]; conditional algebra witness; add(x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))),Center)),IntV (-1)) / add(x(Anchor(v1,Center)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_equal node=70 children=[65,64]; conditional algebra witness; add(x(Anchor(v1,Center)),IntV (-1)) / add(x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))),Center)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_equal node=69 children=[67,68]; conditional algebra witness; add(y(Anchor(v1,TL)),IntV (-1)) / add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))),TL)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_equal node=72 children=[68,67]; conditional algebra witness; add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))),TL)),IntV (-1)) / add(y(Anchor(v1,TL)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=392 children=[52,68]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))),TL)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=393 children=[52,64]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / add(x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))),Center)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=395 children=[12,394]; conditional algebra witness; x(Anchor(v1,BL)) / add(x(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))),Center)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=396 children=[64,13]; conditional algebra witness; add(x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))),Center)),IntV (-1)) / add(cardinality(ObjectCells(objectOf(v1))),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=397 children=[8,163]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV (-1)) / add(x(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))),BL)),IntV 1)
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=398 children=[52,375]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / y(Anchor(index(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),IntV 1),TL))
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_less node=399 children=[52,385]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / add(y(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),TL)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=401 children=[12,400]; conditional algebra witness; x(Anchor(v1,BL)) / add(y(Anchor(index(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),IntV 1),TL)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=402 children=[8,160]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV (-1)) / colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))))))))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=403 children=[79,187]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(v1))))) / add(colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))))),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=404 children=[73,173]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 1) / colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))))))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=405 children=[371,13]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))))),IntV 1) / add(cardinality(ObjectCells(objectOf(v1))),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=406 children=[52,371]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / add(colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))))),IntV 1)
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_lessEqual node=407 children=[52,385]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / add(y(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),TL)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=408 children=[12,400]; conditional algebra witness; x(Anchor(v1,BL)) / add(y(Anchor(index(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),IntV 1),TL)),IntV (-1))
MRV immediate domains=[(0,1),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=409 children=[79,76]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(v1))))) / add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))))))))),IntV 1)
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=410 children=[52,394]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / add(x(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))),Center)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=411 children=[8,187]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV (-1)) / add(colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))))),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=412 children=[79,215]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(v1))))) / colorToInt(head(setToList(ObjectColors(objectOf(index(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),IntV 1))))))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=413 children=[73,371]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 1) / add(colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))))),IntV 1)
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=414 children=[52,400]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / add(y(Anchor(index(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),IntV 1),TL)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=415 children=[52,400]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / add(y(Anchor(index(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),IntV 1),TL)),IntV (-1))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_equal node=77 children=[76,73]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))))))))),IntV 1) / add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 1)
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_equal node=78 children=[73,76]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 1) / add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))))))))),IntV 1)
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_lessEqual node=416 children=[73,76]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 1) / add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))))))))),IntV 1)
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=417 children=[229,13]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(index(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),IntV 1)))))),IntV 1) / add(cardinality(ObjectCells(objectOf(v1))),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=418 children=[73,215]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 1) / colorToInt(head(setToList(ObjectColors(objectOf(index(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),IntV 1))))))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=419 children=[73,229]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 1) / add(colorToInt(head(setToList(ObjectColors(objectOf(index(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),IntV 1)))))),IntV 1)
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=81 children=[80,79]; conditional algebra witness; IntV 2 / colorToInt(head(setToList(ObjectColors(objectOf(v1)))))
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_equal node=82 children=[79,80]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(v1))))) / IntV 2
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_lessEqual node=420 children=[79,80]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(v1))))) / IntV 2
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_less node=421 children=[8,80]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV (-1)) / IntV 2
Nonempty VS_lambda node=423 children=[422]; function graph -> parameter binding and output points
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_filter node=425 children=[423,424]; filter exact multiplicity/order inverse; predicate consistency retained across duplicate inputs
MRV immediate domains=[(0,1),(1,1)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_filter node=427 children=[84,426]; filter exact multiplicity/order inverse; predicate consistency retained across duplicate inputs
MRV immediate domains=[(0,1),(1,1)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_filter node=429 children=[84,428]; filter exact multiplicity/order inverse; predicate consistency retained across duplicate inputs
MRV immediate domains=[(0,1),(1,1)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_filter node=431 children=[84,430]; filter exact multiplicity/order inverse; predicate consistency retained across duplicate inputs
MRV immediate domains=[(0,1),(1,1)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_filter node=433 children=[84,432]; filter exact multiplicity/order inverse; predicate consistency retained across duplicate inputs
MRV immediate domains=[(0,1),(1,1)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_filter node=435 children=[242,434]; filter exact multiplicity/order inverse; predicate consistency retained across duplicate inputs
MRV immediate domains=[(0,1),(1,1)]
Learn(ArrowT PlacedT BoolT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,83)]
Learn(BoolT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","contains","get","equal","less","lessEqual"]
MRV immediate domains=[(0,1),(1,2)]
Learn(SetT ColorT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","ObjectColors"]
Learn(ColorT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","background"]
Nonempty VS_contains node=7 children=[5,6]; conditional algebra witness; ObjectColors(objectOf(v1)) / ColorV 2
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=10 children=[9,8]; conditional algebra witness; IntV 1 / add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV (-1))
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_equal node=11 children=[8,9]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV (-1)) / IntV 1
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_lessEqual node=252 children=[8,9]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV (-1)) / IntV 1
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=14 children=[12,13]; conditional algebra witness; x(Anchor(v1,BL)) / add(cardinality(ObjectCells(objectOf(v1))),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_equal node=18 children=[13,12]; conditional algebra witness; add(cardinality(ObjectCells(objectOf(v1))),IntV (-1)) / x(Anchor(v1,BL))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=17 children=[15,16]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV 1) / cardinality(ObjectCells(objectOf(v1)))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_equal node=19 children=[16,15]; conditional algebra witness; cardinality(ObjectCells(objectOf(v1))) / add(x(Anchor(v1,BL)),IntV 1)
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=22 children=[20,21]; conditional algebra witness; x(Anchor(v1,BR)) / add(y(Anchor(head(objects(v0)),TL)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_equal node=26 children=[21,20]; conditional algebra witness; add(y(Anchor(head(objects(v0)),TL)),IntV (-1)) / x(Anchor(v1,BR))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=25 children=[23,24]; conditional algebra witness; add(x(Anchor(v1,BR)),IntV 1) / y(Anchor(head(objects(v0)),TL))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_equal node=27 children=[24,23]; conditional algebra witness; y(Anchor(head(objects(v0)),TL)) / add(x(Anchor(v1,BR)),IntV 1)
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=29 children=[28,21]; conditional algebra witness; add(x(Anchor(v1,Center)),IntV 1) / add(y(Anchor(head(objects(v0)),TL)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_equal node=30 children=[21,28]; conditional algebra witness; add(y(Anchor(head(objects(v0)),TL)),IntV (-1)) / add(x(Anchor(v1,Center)),IntV 1)
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=306 children=[73,13]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 1) / add(cardinality(ObjectCells(objectOf(v1))),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=436 children=[21,263]; conditional algebra witness; add(y(Anchor(head(objects(v0)),TL)),IntV (-1)) / add(cardinality(ObjectCells(objectOf(v1))),IntV 1)
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=315 children=[51,16]; conditional algebra witness; cardinality(ObjectCells(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))) / cardinality(ObjectCells(objectOf(v1)))
MRV immediate domains=[(0,1),(1,1)]
Learn(SetT ColorT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","ObjectColors"]
Learn(ColorT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","background"]
Nonempty VS_contains node=33 children=[31,32]; conditional algebra witness; ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))))) / head(setToList(ObjectColors(objectOf(v1))))
MRV immediate domains=[(0,1),(1,1)]
Learn(SetT CellT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","cells","ObjectCells"]
Learn(CellT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get"]
Nonempty VS_contains node=36 children=[34,35]; conditional algebra witness; ObjectCells(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))))) / head(setToList(ObjectCells(objectOf(v1))))
MRV immediate domains=[(0,1),(1,1)]
Learn(SetT CellT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","cells","ObjectCells"]
Learn(CellT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get"]
Nonempty VS_contains node=39 children=[37,38]; conditional algebra witness; ObjectCells(objectOf(v1)) / head(setToList(ObjectCells(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))))))))
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=327 children=[326,246]; conditional algebra witness; y(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))),Center)) / y(Anchor(v1,Center))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=47 children=[45,46]; conditional algebra witness; y(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))),TL)) / y(Anchor(v1,TL))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_equal node=50 children=[46,45]; conditional algebra witness; y(Anchor(v1,TL)) / y(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))),TL))
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_equal node=328 children=[246,326]; conditional algebra witness; y(Anchor(v1,Center)) / y(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))),Center))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=41 children=[12,40]; conditional algebra witness; x(Anchor(v1,BL)) / x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))),BL))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_equal node=48 children=[40,12]; conditional algebra witness; x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))),BL)) / x(Anchor(v1,BL))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=44 children=[42,43]; conditional algebra witness; x(Anchor(v1,Center)) / x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))),Center))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=329 children=[16,55]; conditional algebra witness; cardinality(ObjectCells(objectOf(v1))) / cardinality(ObjectCells(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))))))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_equal node=49 children=[43,42]; conditional algebra witness; x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))),Center)) / x(Anchor(v1,Center))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_equal node=330 children=[55,16]; conditional algebra witness; cardinality(ObjectCells(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))))))) / cardinality(ObjectCells(objectOf(v1)))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=437 children=[40,16]; conditional algebra witness; x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))),BL)) / cardinality(ObjectCells(objectOf(v1)))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=438 children=[40,16]; conditional algebra witness; x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))),BL)) / cardinality(ObjectCells(objectOf(v1)))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=439 children=[43,16]; conditional algebra witness; x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))),Center)) / cardinality(ObjectCells(objectOf(v1)))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=440 children=[55,16]; conditional algebra witness; cardinality(ObjectCells(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))))))) / cardinality(ObjectCells(objectOf(v1)))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=53 children=[51,52]; conditional algebra witness; cardinality(ObjectCells(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))) / add(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_equal node=54 children=[52,51]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / cardinality(ObjectCells(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=339 children=[146,13]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(index(tail(objects(v0)),IntV 1)))))),IntV 1) / add(cardinality(ObjectCells(objectOf(v1))),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=340 children=[51,13]; conditional algebra witness; cardinality(ObjectCells(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))) / add(cardinality(ObjectCells(objectOf(v1))),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=345 children=[51,13]; conditional algebra witness; cardinality(ObjectCells(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))) / add(cardinality(ObjectCells(objectOf(v1))),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_equal node=353 children=[13,40]; conditional algebra witness; add(cardinality(ObjectCells(objectOf(v1))),IntV (-1)) / x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))),BL))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_equal node=354 children=[40,13]; conditional algebra witness; x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))),BL)) / add(cardinality(ObjectCells(objectOf(v1))),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_equal node=56 children=[15,55]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV 1) / cardinality(ObjectCells(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))))))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=58 children=[43,57]; conditional algebra witness; x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))),Center)) / add(x(Anchor(v1,BR)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_equal node=59 children=[55,15]; conditional algebra witness; cardinality(ObjectCells(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))))))) / add(x(Anchor(v1,BL)),IntV 1)
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_equal node=60 children=[57,43]; conditional algebra witness; add(x(Anchor(v1,BR)),IntV (-1)) / x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))),Center))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=441 children=[64,16]; conditional algebra witness; add(x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))),Center)),IntV (-1)) / cardinality(ObjectCells(objectOf(v1)))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=442 children=[40,263]; conditional algebra witness; x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))),BL)) / add(cardinality(ObjectCells(objectOf(v1))),IntV 1)
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=443 children=[43,263]; conditional algebra witness; x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))),Center)) / add(cardinality(ObjectCells(objectOf(v1))),IntV 1)
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=444 children=[55,263]; conditional algebra witness; cardinality(ObjectCells(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))))))) / add(cardinality(ObjectCells(objectOf(v1))),IntV 1)
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=445 children=[40,13]; conditional algebra witness; x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))),BL)) / add(cardinality(ObjectCells(objectOf(v1))),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=446 children=[55,263]; conditional algebra witness; cardinality(ObjectCells(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))))))) / add(cardinality(ObjectCells(objectOf(v1))),IntV 1)
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=364 children=[263,343]; conditional algebra witness; add(cardinality(ObjectCells(objectOf(v1))),IntV 1) / add(y(Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),TL)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_equal node=365 children=[343,263]; conditional algebra witness; add(y(Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),TL)),IntV (-1)) / add(cardinality(ObjectCells(objectOf(v1))),IntV 1)
MRV immediate domains=[(0,1),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=366 children=[272,351]; conditional algebra witness; add(y(Anchor(v1,Center)),IntV (-1)) / y(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),TL))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_equal node=367 children=[351,272]; conditional algebra witness; y(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),TL)) / add(y(Anchor(v1,Center)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=369 children=[173,13]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))))) / add(cardinality(ObjectCells(objectOf(v1))),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=372 children=[371,16]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))))),IntV 1) / cardinality(ObjectCells(objectOf(v1)))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=377 children=[8,134]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV (-1)) / x(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))),BL))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=379 children=[79,163]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(v1))))) / add(x(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))),BL)),IntV 1)
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=447 children=[343,263]; conditional algebra witness; add(y(Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),TL)),IntV (-1)) / add(cardinality(ObjectCells(objectOf(v1))),IntV 1)
MRV immediate domains=[(0,1),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=390 children=[260,389]; conditional algebra witness; add(y(Anchor(v1,Center)),IntV 1) / add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))),Center)),IntV 1)
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=63 children=[61,62]; conditional algebra witness; add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))),TL)),IntV 1) / add(y(Anchor(v1,TL)),IntV 1)
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_equal node=391 children=[389,260]; conditional algebra witness; add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))),Center)),IntV 1) / add(y(Anchor(v1,Center)),IntV 1)
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_equal node=71 children=[62,61]; conditional algebra witness; add(y(Anchor(v1,TL)),IntV 1) / add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))),TL)),IntV 1)
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=66 children=[64,65]; conditional algebra witness; add(x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))),Center)),IntV (-1)) / add(x(Anchor(v1,Center)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_equal node=70 children=[65,64]; conditional algebra witness; add(x(Anchor(v1,Center)),IntV (-1)) / add(x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))),Center)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=69 children=[67,68]; conditional algebra witness; add(y(Anchor(v1,TL)),IntV (-1)) / add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))),TL)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_equal node=72 children=[68,67]; conditional algebra witness; add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))),TL)),IntV (-1)) / add(y(Anchor(v1,TL)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=396 children=[64,13]; conditional algebra witness; add(x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0)))),Center)),IntV (-1)) / add(cardinality(ObjectCells(objectOf(v1))),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=397 children=[8,163]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV (-1)) / add(x(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))),BL)),IntV 1)
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=405 children=[371,13]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))))),IntV 1) / add(cardinality(ObjectCells(objectOf(v1))),IntV (-1))
MRV immediate domains=[(0,1),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=409 children=[79,76]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(v1))))) / add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))))))))),IntV 1)
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=412 children=[79,215]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(v1))))) / colorToInt(head(setToList(ObjectColors(objectOf(index(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),IntV 1))))))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_equal node=77 children=[76,73]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))))))))),IntV 1) / add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 1)
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_equal node=78 children=[73,76]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 1) / add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))))))))),IntV 1)
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_lessEqual node=416 children=[73,76]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 1) / add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,BL))),objects(v0))))))))),IntV 1)
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=417 children=[229,13]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(index(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),IntV 1)))))),IntV 1) / add(cardinality(ObjectCells(objectOf(v1))),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=418 children=[73,215]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 1) / colorToInt(head(setToList(ObjectColors(objectOf(index(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),IntV 1))))))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=419 children=[73,229]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 1) / add(colorToInt(head(setToList(ObjectColors(objectOf(index(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),IntV 1)))))),IntV 1)
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=81 children=[80,79]; conditional algebra witness; IntV 2 / colorToInt(head(setToList(ObjectColors(objectOf(v1)))))
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_equal node=82 children=[79,80]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(v1))))) / IntV 2
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_lessEqual node=420 children=[79,80]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(v1))))) / IntV 2
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_less node=421 children=[8,80]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV (-1)) / IntV 2
Nonempty VS_lambda node=449 children=[448]; function graph -> parameter binding and output points
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_filter node=451 children=[449,450]; filter exact multiplicity/order inverse; predicate consistency retained across duplicate inputs
Nonempty VS_mkScene node=453 children=[3,4,452]; mkScene residual: canonical correspondence + Render-validated paint order; branch=0
Nonempty VS_lambda node=454 children=[453]; function graph -> parameter binding and output points
Task TSL supported Base=["Anchor","ObjectCells","ObjectColors","add","canvasSize","cardinality","colorToInt","contains","equal","filter","head","index","lambda","less","lessEqual","literal","mkScene","objectOf","objects","setToList","sortBy","subtract","tail","x","y"]
Cost saturation C=1..96 root representatives=[(1,0),(2,0),(3,0),(4,0),(5,0),(6,0),(7,0),(8,0),(9,0),(10,0),(11,0),(12,0),(13,0),(14,1),(15,1),(16,1),(17,1),(18,1),(19,1),(20,1),(21,1),(22,1),(23,1),(24,1),(25,1),(26,1),(27,1),(28,1),(29,1),(30,1),(31,1),(32,1),(33,1),(34,1),(35,1),(36,1),(37,1),(38,1),(39,1),(40,1),(41,1),(42,1),(43,1),(44,1),(45,1),(46,1),(47,1),(48,1),(49,1),(50,1),(51,1),(52,1),(53,1),(54,1),(55,1),(56,1),(57,1),(58,1),(59,1),(60,1),(61,1),(62,1),(63,1),(64,1),(65,1),(66,1),(67,1),(68,1),(69,1),(70,1),(71,1),(72,1),(73,1),(74,1),(75,1),(76,1),(77,1),(78,1),(79,1),(80,1),(81,1),(82,1),(83,1),(84,1),(85,1),(86,1),(87,1),(88,1),(89,1),(90,1),(91,1),(92,1),(93,1),(94,1),(95,1),(96,1)]
Abstraction round=0; exact frontier=1; accepted=[]
Exact original Render(P(Encode(x)))=y: True; MDL rank=(25,9,2,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. contains(ObjectColors(objectOf(v1)),ColorV 2)),objects(v0))))")
Selected AST; FV=[]; (lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. contains(ObjectColors(objectOf(v1)),ColorV 2)),objects(v0))))
Induced TSL=Signature(root VS) union inventions. BaseActivated=["Anchor","ObjectCells","ObjectColors","add","canvasSize","cardinality","colorToInt","contains","equal","filter","head","index","lambda","less","lessEqual","literal","mkScene","objectOf","objects","setToList","sortBy","subtract","tail","x","y"]; TaskInvented=[]; StructuralPriorCount=0
```
