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
MRV immediate domains=[(0,1),(1,5)]
Learn(ArrowT PlacedT BoolT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,38)]
Learn(BoolT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","contains","get","equal","less","lessEqual"]
MRV immediate domains=[(0,1),(1,9)]
Learn(SetT ColorT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","ObjectColors"]
Learn(ColorT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","background"]
Nonempty VS_contains node=17 children=[7,16]; conditional algebra witness; ObjectColors(objectOf(v1)) / ColorV 2
MRV immediate domains=[(0,55),(1,1)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=74 children=[73,18]; conditional algebra witness; IntV 2 / colorToInt(head(setToList(ObjectColors(objectOf(v1)))))
MRV immediate domains=[(0,1),(1,55)]
Nonempty VS_equal node=75 children=[18,73]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(v1))))) / IntV 2
MRV immediate domains=[(0,60),(1,1)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=137 children=[136,76]; conditional algebra witness; IntV 1 / add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV (-1))
MRV immediate domains=[(0,1),(1,60)]
Nonempty VS_equal node=138 children=[76,136]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV (-1)) / IntV 1
MRV immediate domains=[(0,8),(1,1)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=149 children=[148,139]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))))),IntV 1) / add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 1)
MRV immediate domains=[(0,1),(1,8)]
Nonempty VS_equal node=150 children=[139,148]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 1) / add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))))),IntV 1)
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=153 children=[151,152]; conditional algebra witness; x(Anchor(v1,BL)) / add(cardinality(ObjectCells(objectOf(v1))),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=156 children=[154,155]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV 1) / cardinality(ObjectCells(objectOf(v1)))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_equal node=157 children=[152,151]; conditional algebra witness; add(cardinality(ObjectCells(objectOf(v1))),IntV (-1)) / x(Anchor(v1,BL))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_equal node=158 children=[155,154]; conditional algebra witness; cardinality(ObjectCells(objectOf(v1))) / add(x(Anchor(v1,BL)),IntV 1)
MRV immediate domains=[(0,1),(1,21)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=182 children=[159,181]; conditional algebra witness; x(Anchor(v1,BR)) / add(y(Anchor(head(objects(v0)),TL)),IntV (-1))
MRV immediate domains=[(0,1),(1,28)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=213 children=[183,212]; conditional algebra witness; add(x(Anchor(v1,BR)),IntV 1) / y(Anchor(head(objects(v0)),TL))
MRV immediate domains=[(0,21),(1,1)]
Nonempty VS_equal node=214 children=[181,159]; conditional algebra witness; add(y(Anchor(head(objects(v0)),TL)),IntV (-1)) / x(Anchor(v1,BR))
MRV immediate domains=[(0,28),(1,1)]
Nonempty VS_equal node=215 children=[212,183]; conditional algebra witness; y(Anchor(head(objects(v0)),TL)) / add(x(Anchor(v1,BR)),IntV 1)
MRV immediate domains=[(0,1),(1,21)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=217 children=[216,181]; conditional algebra witness; add(x(Anchor(v1,Center)),IntV 1) / add(y(Anchor(head(objects(v0)),TL)),IntV (-1))
MRV immediate domains=[(0,21),(1,1)]
Nonempty VS_equal node=218 children=[181,216]; conditional algebra witness; add(y(Anchor(head(objects(v0)),TL)),IntV (-1)) / add(x(Anchor(v1,Center)),IntV 1)
MRV immediate domains=[(0,7),(1,1)]
Learn(ColorT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","background"]
Learn(SetT ColorT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","ObjectColors"]
Nonempty VS_contains node=228 children=[227,219]; conditional algebra witness; ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))))) / head(setToList(ObjectColors(objectOf(v1))))
MRV immediate domains=[(0,7),(1,1)]
Learn(CellT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get"]
Learn(SetT CellT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","cells","ObjectCells"]
Nonempty VS_contains node=238 children=[237,229]; conditional algebra witness; ObjectCells(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))))) / head(setToList(ObjectCells(objectOf(v1))))
MRV immediate domains=[(0,1),(1,7)]
Learn(SetT CellT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","cells","ObjectCells"]
Learn(CellT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get"]
Nonempty VS_contains node=248 children=[239,247]; conditional algebra witness; ObjectCells(objectOf(v1)) / head(setToList(ObjectCells(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))))
MRV immediate domains=[(0,1),(1,23)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=273 children=[151,272]; conditional algebra witness; x(Anchor(v1,BL)) / x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),BL))
MRV immediate domains=[(0,1),(1,14)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=290 children=[274,289]; conditional algebra witness; x(Anchor(v1,Center)) / x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),Center))
MRV immediate domains=[(0,7),(1,1)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=300 children=[299,291]; conditional algebra witness; y(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),TL)) / y(Anchor(v1,TL))
MRV immediate domains=[(0,23),(1,1)]
Nonempty VS_equal node=301 children=[272,151]; conditional algebra witness; x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),BL)) / x(Anchor(v1,BL))
MRV immediate domains=[(0,14),(1,1)]
Nonempty VS_equal node=302 children=[289,274]; conditional algebra witness; x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),Center)) / x(Anchor(v1,Center))
MRV immediate domains=[(0,1),(1,7)]
Nonempty VS_equal node=303 children=[291,299]; conditional algebra witness; y(Anchor(v1,TL)) / y(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),TL))
MRV immediate domains=[(0,15),(1,1)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=321 children=[320,304]; conditional algebra witness; cardinality(ObjectCells(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))) / add(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,1),(1,15)]
Nonempty VS_equal node=322 children=[304,320]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / cardinality(ObjectCells(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))))
MRV immediate domains=[(0,1),(1,15)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=339 children=[154,338]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV 1) / cardinality(ObjectCells(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))))))
MRV immediate domains=[(0,14),(1,1)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=341 children=[289,340]; conditional algebra witness; x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),Center)) / add(x(Anchor(v1,BR)),IntV (-1))
MRV immediate domains=[(0,15),(1,1)]
Nonempty VS_equal node=342 children=[338,154]; conditional algebra witness; cardinality(ObjectCells(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))) / add(x(Anchor(v1,BL)),IntV 1)
MRV immediate domains=[(0,1),(1,14)]
Nonempty VS_equal node=343 children=[340,289]; conditional algebra witness; add(x(Anchor(v1,BR)),IntV (-1)) / x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),Center))
MRV immediate domains=[(0,7),(1,1)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=353 children=[352,344]; conditional algebra witness; add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),TL)),IntV 1) / add(y(Anchor(v1,TL)),IntV 1)
MRV immediate domains=[(0,7),(1,1)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=363 children=[362,354]; conditional algebra witness; add(x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),Center)),IntV (-1)) / add(x(Anchor(v1,Center)),IntV (-1))
MRV immediate domains=[(0,1),(1,7)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=373 children=[364,372]; conditional algebra witness; add(y(Anchor(v1,TL)),IntV (-1)) / add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),TL)),IntV (-1))
MRV immediate domains=[(0,1),(1,7)]
Nonempty VS_equal node=374 children=[354,362]; conditional algebra witness; add(x(Anchor(v1,Center)),IntV (-1)) / add(x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),Center)),IntV (-1))
MRV immediate domains=[(0,1),(1,7)]
Nonempty VS_equal node=375 children=[344,352]; conditional algebra witness; add(y(Anchor(v1,TL)),IntV 1) / add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),TL)),IntV 1)
MRV immediate domains=[(0,7),(1,1)]
Nonempty VS_equal node=376 children=[372,364]; conditional algebra witness; add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),TL)),IntV (-1)) / add(y(Anchor(v1,TL)),IntV (-1))
Nonempty VS_lambda node=378 children=[377]; function graph -> parameter binding and output points
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_filter node=385 children=[378,384]; filter exact multiplicity/order inverse; predicate consistency retained across duplicate inputs
MRV immediate domains=[(0,1),(1,3)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_filter node=390 children=[378,389]; filter exact multiplicity/order inverse; predicate consistency retained across duplicate inputs
MRV immediate domains=[(0,1),(1,1)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_filter node=392 children=[378,391]; filter exact multiplicity/order inverse; predicate consistency retained across duplicate inputs
MRV immediate domains=[(0,1),(1,1)]
Learn(ArrowT PlacedT BoolT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,162)]
Learn(BoolT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","contains","get","equal","less","lessEqual"]
MRV immediate domains=[(0,1),(1,9)]
Learn(SetT ColorT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","ObjectColors"]
Learn(ColorT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","background"]
Nonempty VS_contains node=17 children=[7,16]; conditional algebra witness; ObjectColors(objectOf(v1)) / ColorV 2
MRV immediate domains=[(0,55),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=393 children=[73,151]; conditional algebra witness; IntV 2 / x(Anchor(v1,BL))
MRV immediate domains=[(0,8),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=394 children=[148,151]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))))),IntV 1) / x(Anchor(v1,BL))
MRV immediate domains=[(0,1),(1,55)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=75 children=[18,73]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(v1))))) / IntV 2
MRV immediate domains=[(0,55),(1,1)]
Nonempty VS_equal node=74 children=[73,18]; conditional algebra witness; IntV 2 / colorToInt(head(setToList(ObjectColors(objectOf(v1)))))
MRV immediate domains=[(0,60),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=395 children=[136,304]; conditional algebra witness; IntV 1 / add(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,55),(1,1)]
Nonempty VS_less node=396 children=[73,304]; conditional algebra witness; IntV 2 / add(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,55),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=397 children=[73,354]; conditional algebra witness; IntV 2 / add(x(Anchor(v1,Center)),IntV (-1))
MRV immediate domains=[(0,55),(1,1)]
Nonempty VS_lessEqual node=398 children=[73,304]; conditional algebra witness; IntV 2 / add(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,8),(1,1)]
Nonempty VS_lessEqual node=399 children=[148,304]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))))),IntV 1) / add(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,8),(1,1)]
Nonempty VS_lessEqual node=400 children=[148,354]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))))),IntV 1) / add(x(Anchor(v1,Center)),IntV (-1))
MRV immediate domains=[(0,1),(1,60)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=138 children=[76,136]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV (-1)) / IntV 1
MRV immediate domains=[(0,60),(1,1)]
Nonempty VS_equal node=137 children=[136,76]; conditional algebra witness; IntV 1 / add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV (-1))
MRV immediate domains=[(0,1),(1,8)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=150 children=[139,148]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 1) / add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))))),IntV 1)
MRV immediate domains=[(0,8),(1,1)]
Nonempty VS_equal node=149 children=[148,139]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))))),IntV 1) / add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 1)
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=153 children=[151,152]; conditional algebra witness; x(Anchor(v1,BL)) / add(cardinality(ObjectCells(objectOf(v1))),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=156 children=[154,155]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV 1) / cardinality(ObjectCells(objectOf(v1)))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_equal node=157 children=[152,151]; conditional algebra witness; add(cardinality(ObjectCells(objectOf(v1))),IntV (-1)) / x(Anchor(v1,BL))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_equal node=158 children=[155,154]; conditional algebra witness; cardinality(ObjectCells(objectOf(v1))) / add(x(Anchor(v1,BL)),IntV 1)
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=401 children=[18,151]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(v1))))) / x(Anchor(v1,BL))
MRV immediate domains=[(0,1),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=403 children=[18,402]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(v1))))) / x(Anchor(v1,Center))
MRV immediate domains=[(0,2),(1,21)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=405 children=[404,181]; conditional algebra witness; x(Anchor(v1,BR)) / add(y(Anchor(head(objects(v0)),TL)),IntV (-1))
MRV immediate domains=[(0,1),(1,28)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=213 children=[183,212]; conditional algebra witness; add(x(Anchor(v1,BR)),IntV 1) / y(Anchor(head(objects(v0)),TL))
MRV immediate domains=[(0,21),(1,2)]
Nonempty VS_equal node=406 children=[181,404]; conditional algebra witness; add(y(Anchor(head(objects(v0)),TL)),IntV (-1)) / x(Anchor(v1,BR))
MRV immediate domains=[(0,28),(1,1)]
Nonempty VS_equal node=215 children=[212,183]; conditional algebra witness; y(Anchor(head(objects(v0)),TL)) / add(x(Anchor(v1,BR)),IntV 1)
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=407 children=[18,304]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(v1))))) / add(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=408 children=[18,354]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(v1))))) / add(x(Anchor(v1,Center)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=409 children=[139,151]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 1) / x(Anchor(v1,BL))
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_less node=410 children=[139,402]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 1) / x(Anchor(v1,Center))
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_less node=411 children=[139,404]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 1) / x(Anchor(v1,BR))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=412 children=[18,304]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(v1))))) / add(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=413 children=[18,354]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(v1))))) / add(x(Anchor(v1,Center)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=414 children=[139,151]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 1) / x(Anchor(v1,BL))
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_lessEqual node=415 children=[139,402]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 1) / x(Anchor(v1,Center))
MRV immediate domains=[(0,8),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=425 children=[424,151]; conditional algebra witness; add(cardinality(ObjectCells(objectOf(head(objects(v0))))),IntV (-1)) / x(Anchor(v1,BL))
MRV immediate domains=[(0,8),(1,2)]
Nonempty VS_lessEqual node=426 children=[424,402]; conditional algebra witness; add(cardinality(ObjectCells(objectOf(head(objects(v0))))),IntV (-1)) / x(Anchor(v1,Center))
MRV immediate domains=[(0,8),(1,2)]
Nonempty VS_lessEqual node=427 children=[424,404]; conditional algebra witness; add(cardinality(ObjectCells(objectOf(head(objects(v0))))),IntV (-1)) / x(Anchor(v1,BR))
MRV immediate domains=[(0,7),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=436 children=[435,151]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(head(tail(objects(v0)))))))) / x(Anchor(v1,BL))
MRV immediate domains=[(0,7),(1,2)]
Nonempty VS_less node=437 children=[435,402]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(head(tail(objects(v0)))))))) / x(Anchor(v1,Center))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=438 children=[76,304]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV (-1)) / add(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=439 children=[76,354]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV (-1)) / add(x(Anchor(v1,Center)),IntV (-1))
MRV immediate domains=[(0,21),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=462 children=[461,151]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(index(tail(objects(v0)),IntV 1)))))) / x(Anchor(v1,BL))
MRV immediate domains=[(0,21),(1,2)]
Nonempty VS_less node=463 children=[461,402]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(index(tail(objects(v0)),IntV 1)))))) / x(Anchor(v1,Center))
MRV immediate domains=[(0,21),(1,2)]
Nonempty VS_less node=464 children=[461,404]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(index(tail(objects(v0)),IntV 1)))))) / x(Anchor(v1,BR))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=465 children=[139,304]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 1) / add(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=466 children=[139,354]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 1) / add(x(Anchor(v1,Center)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=467 children=[139,154]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 1) / add(x(Anchor(v1,BL)),IntV 1)
MRV immediate domains=[(0,21),(1,1)]
Nonempty VS_lessEqual node=468 children=[461,151]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(index(tail(objects(v0)),IntV 1)))))) / x(Anchor(v1,BL))
MRV immediate domains=[(0,21),(1,2)]
Nonempty VS_lessEqual node=469 children=[461,402]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(index(tail(objects(v0)),IntV 1)))))) / x(Anchor(v1,Center))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=470 children=[139,304]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 1) / add(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=471 children=[139,354]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 1) / add(x(Anchor(v1,Center)),IntV (-1))
MRV immediate domains=[(0,7),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=480 children=[479,304]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(head(objects(v0))))))) / add(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,8),(1,1)]
Nonempty VS_lessEqual node=481 children=[424,154]; conditional algebra witness; add(cardinality(ObjectCells(objectOf(head(objects(v0))))),IntV (-1)) / add(x(Anchor(v1,BL)),IntV 1)
MRV immediate domains=[(0,7),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=490 children=[489,151]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(head(objects(v0))))))),IntV 1) / x(Anchor(v1,BL))
MRV immediate domains=[(0,7),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=499 children=[498,404]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(objects(v0)))))))),IntV 1) / x(Anchor(v1,BR))
MRV immediate domains=[(0,7),(1,1)]
Nonempty VS_lessEqual node=500 children=[435,304]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(head(tail(objects(v0)))))))) / add(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,7),(1,1)]
Nonempty VS_lessEqual node=501 children=[435,354]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(head(tail(objects(v0)))))))) / add(x(Anchor(v1,Center)),IntV (-1))
MRV immediate domains=[(0,7),(1,1)]
Nonempty VS_lessEqual node=502 children=[498,151]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(objects(v0)))))))),IntV 1) / x(Anchor(v1,BL))
MRV immediate domains=[(0,7),(1,2)]
Nonempty VS_lessEqual node=503 children=[498,402]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(objects(v0)))))))),IntV 1) / x(Anchor(v1,Center))
MRV immediate domains=[(0,8),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=513 children=[512,151]; conditional algebra witness; x(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))),BL)) / x(Anchor(v1,BL))
MRV immediate domains=[(0,21),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=536 children=[535,151]; conditional algebra witness; x(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))),Center)) / x(Anchor(v1,BL))
MRV immediate domains=[(0,21),(1,2)]
Nonempty VS_less node=537 children=[535,402]; conditional algebra witness; x(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))),Center)) / x(Anchor(v1,Center))
MRV immediate domains=[(0,7),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=546 children=[545,304]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(head(objects(v0))))))),IntV (-1)) / add(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,21),(1,1)]
Nonempty VS_less node=547 children=[461,304]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(index(tail(objects(v0)),IntV 1)))))) / add(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,21),(1,1)]
Nonempty VS_less node=548 children=[461,354]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(index(tail(objects(v0)),IntV 1)))))) / add(x(Anchor(v1,Center)),IntV (-1))
MRV immediate domains=[(0,21),(1,1)]
Nonempty VS_less node=549 children=[461,154]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(index(tail(objects(v0)),IntV 1)))))) / add(x(Anchor(v1,BL)),IntV 1)
MRV immediate domains=[(0,21),(1,1)]
Nonempty VS_lessEqual node=550 children=[461,304]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(index(tail(objects(v0)),IntV 1)))))) / add(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,21),(1,1)]
Nonempty VS_lessEqual node=551 children=[461,354]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(index(tail(objects(v0)),IntV 1)))))) / add(x(Anchor(v1,Center)),IntV (-1))
MRV immediate domains=[(0,22),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=575 children=[574,151]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(index(tail(objects(v0)),IntV 1)))))),IntV 1) / x(Anchor(v1,BL))
MRV immediate domains=[(0,22),(1,2)]
Nonempty VS_lessEqual node=576 children=[574,402]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(index(tail(objects(v0)),IntV 1)))))),IntV 1) / x(Anchor(v1,Center))
MRV immediate domains=[(0,22),(1,2)]
Nonempty VS_lessEqual node=577 children=[574,404]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(index(tail(objects(v0)),IntV 1)))))),IntV 1) / x(Anchor(v1,BR))
MRV immediate domains=[(0,7),(1,1)]
Nonempty VS_lessEqual node=578 children=[489,304]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(head(objects(v0))))))),IntV 1) / add(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,7),(1,1)]
Nonempty VS_lessEqual node=579 children=[489,354]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(head(objects(v0))))))),IntV 1) / add(x(Anchor(v1,Center)),IntV (-1))
MRV immediate domains=[(0,7),(1,1)]
Learn(ColorT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","background"]
Learn(SetT ColorT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","ObjectColors"]
Nonempty VS_contains node=228 children=[227,219]; conditional algebra witness; ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))))) / head(setToList(ObjectColors(objectOf(v1))))
MRV immediate domains=[(0,1),(1,7)]
Learn(SetT CellT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","cells","ObjectCells"]
Learn(CellT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get"]
Nonempty VS_contains node=248 children=[239,247]; conditional algebra witness; ObjectCells(objectOf(v1)) / head(setToList(ObjectCells(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))))
MRV immediate domains=[(0,7),(1,1)]
Learn(CellT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get"]
Learn(SetT CellT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","cells","ObjectCells"]
Nonempty VS_contains node=238 children=[237,229]; conditional algebra witness; ObjectCells(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))))) / head(setToList(ObjectCells(objectOf(v1))))
MRV immediate domains=[(0,1),(1,23)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=273 children=[151,272]; conditional algebra witness; x(Anchor(v1,BL)) / x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),BL))
MRV immediate domains=[(0,2),(1,14)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=580 children=[402,289]; conditional algebra witness; x(Anchor(v1,Center)) / x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),Center))
MRV immediate domains=[(0,7),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=300 children=[299,291]; conditional algebra witness; y(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),TL)) / y(Anchor(v1,TL))
MRV immediate domains=[(0,23),(1,1)]
Nonempty VS_equal node=301 children=[272,151]; conditional algebra witness; x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),BL)) / x(Anchor(v1,BL))
MRV immediate domains=[(0,14),(1,2)]
Nonempty VS_equal node=581 children=[289,402]; conditional algebra witness; x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),Center)) / x(Anchor(v1,Center))
MRV immediate domains=[(0,1),(1,7)]
Nonempty VS_equal node=303 children=[291,299]; conditional algebra witness; y(Anchor(v1,TL)) / y(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),TL))
MRV immediate domains=[(0,7),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=590 children=[589,304]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(objects(v0)))))))),IntV (-1)) / add(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,7),(1,1)]
Nonempty VS_less node=591 children=[589,354]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(objects(v0)))))))),IntV (-1)) / add(x(Anchor(v1,Center)),IntV (-1))
MRV immediate domains=[(0,7),(1,1)]
Nonempty VS_less node=592 children=[498,154]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(objects(v0)))))))),IntV 1) / add(x(Anchor(v1,BL)),IntV 1)
MRV immediate domains=[(0,1),(1,15)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=322 children=[304,320]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / cardinality(ObjectCells(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))))
MRV immediate domains=[(0,15),(1,1)]
Nonempty VS_equal node=321 children=[320,304]; conditional algebra witness; cardinality(ObjectCells(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))) / add(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,8),(1,1)]
Nonempty VS_less node=593 children=[512,304]; conditional algebra witness; x(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))),BL)) / add(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,8),(1,1)]
Nonempty VS_less node=594 children=[512,354]; conditional algebra witness; x(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))),BL)) / add(x(Anchor(v1,Center)),IntV (-1))
MRV immediate domains=[(0,21),(1,1)]
Nonempty VS_less node=595 children=[535,304]; conditional algebra witness; x(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))),Center)) / add(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,21),(1,1)]
Nonempty VS_less node=596 children=[535,354]; conditional algebra witness; x(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))),Center)) / add(x(Anchor(v1,Center)),IntV (-1))
MRV immediate domains=[(0,7),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=605 children=[604,151]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))))))) / x(Anchor(v1,BL))
MRV immediate domains=[(0,7),(1,2)]
Nonempty VS_less node=606 children=[604,402]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))))))) / x(Anchor(v1,Center))
MRV immediate domains=[(0,9),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=617 children=[616,151]; conditional algebra witness; add(x(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))),BL)),IntV 1) / x(Anchor(v1,BL))
MRV immediate domains=[(0,9),(1,2)]
Nonempty VS_less node=618 children=[616,402]; conditional algebra witness; add(x(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))),BL)),IntV 1) / x(Anchor(v1,Center))
MRV immediate domains=[(0,8),(1,1)]
Nonempty VS_lessEqual node=619 children=[512,304]; conditional algebra witness; x(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))),BL)) / add(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,21),(1,1)]
Nonempty VS_lessEqual node=620 children=[535,304]; conditional algebra witness; x(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))),Center)) / add(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,21),(1,1)]
Nonempty VS_lessEqual node=621 children=[535,354]; conditional algebra witness; x(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))),Center)) / add(x(Anchor(v1,Center)),IntV (-1))
MRV immediate domains=[(0,9),(1,1)]
Nonempty VS_lessEqual node=622 children=[616,151]; conditional algebra witness; add(x(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))),BL)),IntV 1) / x(Anchor(v1,BL))
MRV immediate domains=[(0,22),(1,1)]
Nonempty VS_lessEqual node=623 children=[574,304]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(index(tail(objects(v0)),IntV 1)))))),IntV 1) / add(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,22),(1,1)]
Nonempty VS_lessEqual node=624 children=[574,354]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(index(tail(objects(v0)),IntV 1)))))),IntV 1) / add(x(Anchor(v1,Center)),IntV (-1))
MRV immediate domains=[(0,22),(1,1)]
Nonempty VS_lessEqual node=625 children=[574,154]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(index(tail(objects(v0)),IntV 1)))))),IntV 1) / add(x(Anchor(v1,BL)),IntV 1)
MRV immediate domains=[(0,7),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=634 children=[633,151]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))))) / x(Anchor(v1,BL))
MRV immediate domains=[(0,7),(1,2)]
Nonempty VS_lessEqual node=635 children=[633,402]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))))) / x(Anchor(v1,Center))
MRV immediate domains=[(0,7),(1,2)]
Nonempty VS_lessEqual node=636 children=[633,404]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))))) / x(Anchor(v1,BR))
MRV immediate domains=[(0,1),(1,15)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=339 children=[154,338]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV 1) / cardinality(ObjectCells(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))))))
MRV immediate domains=[(0,15),(1,1)]
Nonempty VS_equal node=342 children=[338,154]; conditional algebra witness; cardinality(ObjectCells(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))) / add(x(Anchor(v1,BL)),IntV 1)
MRV immediate domains=[(0,8),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=646 children=[645,304]; conditional algebra witness; add(x(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))),BL)),IntV (-1)) / add(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,7),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=655 children=[654,304]; conditional algebra witness; add(x(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))),Center)),IntV (-1)) / add(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,7),(1,1)]
Nonempty VS_less node=656 children=[654,354]; conditional algebra witness; add(x(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))),Center)),IntV (-1)) / add(x(Anchor(v1,Center)),IntV (-1))
MRV immediate domains=[(0,7),(1,1)]
Nonempty VS_less node=657 children=[604,304]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))))))) / add(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,7),(1,1)]
Nonempty VS_less node=658 children=[604,354]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))))))) / add(x(Anchor(v1,Center)),IntV (-1))
MRV immediate domains=[(0,9),(1,1)]
Nonempty VS_less node=659 children=[616,304]; conditional algebra witness; add(x(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))),BL)),IntV 1) / add(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,9),(1,1)]
Nonempty VS_less node=660 children=[616,354]; conditional algebra witness; add(x(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))),BL)),IntV 1) / add(x(Anchor(v1,Center)),IntV (-1))
MRV immediate domains=[(0,9),(1,1)]
Nonempty VS_less node=661 children=[616,154]; conditional algebra witness; add(x(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))),BL)),IntV 1) / add(x(Anchor(v1,BL)),IntV 1)
MRV immediate domains=[(0,14),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=677 children=[676,151]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))))))),IntV 1) / x(Anchor(v1,BL))
MRV immediate domains=[(0,14),(1,2)]
Nonempty VS_less node=678 children=[676,402]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))))))),IntV 1) / x(Anchor(v1,Center))
MRV immediate domains=[(0,14),(1,2)]
Nonempty VS_less node=679 children=[676,404]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))))))),IntV 1) / x(Anchor(v1,BR))
MRV immediate domains=[(0,7),(1,1)]
Nonempty VS_lessEqual node=680 children=[604,304]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))))))) / add(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,7),(1,1)]
Nonempty VS_lessEqual node=681 children=[604,354]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))))))) / add(x(Anchor(v1,Center)),IntV (-1))
MRV immediate domains=[(0,9),(1,1)]
Nonempty VS_lessEqual node=682 children=[616,304]; conditional algebra witness; add(x(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))),BL)),IntV 1) / add(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,9),(1,1)]
Nonempty VS_lessEqual node=683 children=[616,354]; conditional algebra witness; add(x(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))),BL)),IntV 1) / add(x(Anchor(v1,Center)),IntV (-1))
MRV immediate domains=[(0,14),(1,1)]
Nonempty VS_lessEqual node=684 children=[676,151]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))))))),IntV 1) / x(Anchor(v1,BL))
MRV immediate domains=[(0,14),(1,2)]
Nonempty VS_lessEqual node=685 children=[676,402]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))))))),IntV 1) / x(Anchor(v1,Center))
MRV immediate domains=[(0,7),(1,1)]
Nonempty VS_lessEqual node=686 children=[633,304]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))))) / add(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,7),(1,1)]
Nonempty VS_lessEqual node=687 children=[633,354]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))))) / add(x(Anchor(v1,Center)),IntV (-1))
MRV immediate domains=[(0,7),(1,1)]
Nonempty VS_lessEqual node=688 children=[633,154]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))))) / add(x(Anchor(v1,BL)),IntV 1)
MRV immediate domains=[(0,1),(1,7)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=374 children=[354,362]; conditional algebra witness; add(x(Anchor(v1,Center)),IntV (-1)) / add(x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),Center)),IntV (-1))
MRV immediate domains=[(0,1),(1,7)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=375 children=[344,352]; conditional algebra witness; add(y(Anchor(v1,TL)),IntV 1) / add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),TL)),IntV 1)
MRV immediate domains=[(0,7),(1,1)]
Nonempty VS_equal node=353 children=[352,344]; conditional algebra witness; add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),TL)),IntV 1) / add(y(Anchor(v1,TL)),IntV 1)
MRV immediate domains=[(0,7),(1,1)]
Nonempty VS_equal node=363 children=[362,354]; conditional algebra witness; add(x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),Center)),IntV (-1)) / add(x(Anchor(v1,Center)),IntV (-1))
MRV immediate domains=[(0,1),(1,7)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=373 children=[364,372]; conditional algebra witness; add(y(Anchor(v1,TL)),IntV (-1)) / add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),TL)),IntV (-1))
MRV immediate domains=[(0,7),(1,1)]
Nonempty VS_equal node=376 children=[372,364]; conditional algebra witness; add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),TL)),IntV (-1)) / add(y(Anchor(v1,TL)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=690 children=[689,151]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))))))))) / x(Anchor(v1,BL))
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_less node=691 children=[689,402]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))))))))) / x(Anchor(v1,Center))
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_less node=692 children=[689,404]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))))))))) / x(Anchor(v1,BR))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=693 children=[689,151]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))))))))) / x(Anchor(v1,BL))
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_lessEqual node=694 children=[689,402]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))))))))) / x(Anchor(v1,Center))
MRV immediate domains=[(0,7),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=703 children=[702,304]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))))))),IntV (-1)) / add(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,7),(1,1)]
Nonempty VS_less node=704 children=[702,354]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))))))),IntV (-1)) / add(x(Anchor(v1,Center)),IntV (-1))
MRV immediate domains=[(0,14),(1,1)]
Nonempty VS_less node=705 children=[676,304]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))))))),IntV 1) / add(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,14),(1,1)]
Nonempty VS_less node=706 children=[676,354]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))))))),IntV 1) / add(x(Anchor(v1,Center)),IntV (-1))
MRV immediate domains=[(0,14),(1,1)]
Nonempty VS_less node=707 children=[676,154]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))))))),IntV 1) / add(x(Anchor(v1,BL)),IntV 1)
MRV immediate domains=[(0,14),(1,1)]
Nonempty VS_lessEqual node=708 children=[676,304]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))))))),IntV 1) / add(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,14),(1,1)]
Nonempty VS_lessEqual node=709 children=[676,354]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))))))),IntV 1) / add(x(Anchor(v1,Center)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=711 children=[710,151]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(index(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),IntV 1)))))) / x(Anchor(v1,BL))
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_lessEqual node=712 children=[710,402]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(index(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),IntV 1)))))) / x(Anchor(v1,Center))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=714 children=[713,151]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))))))))),IntV (-1)) / x(Anchor(v1,BL))
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_less node=715 children=[713,402]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))))))))),IntV (-1)) / x(Anchor(v1,Center))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=716 children=[689,154]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))))))))) / add(x(Anchor(v1,BL)),IntV 1)
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=717 children=[689,304]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))))))))) / add(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=718 children=[689,354]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))))))))) / add(x(Anchor(v1,Center)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=719 children=[710,304]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(index(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),IntV 1)))))) / add(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=720 children=[710,354]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(index(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),IntV 1)))))) / add(x(Anchor(v1,Center)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=721 children=[710,154]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(index(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),IntV 1)))))) / add(x(Anchor(v1,BL)),IntV 1)
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=723 children=[722,151]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(index(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),IntV 1)))))),IntV 1) / x(Anchor(v1,BL))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=724 children=[713,304]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))))))))),IntV (-1)) / add(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=725 children=[713,354]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))))))))),IntV (-1)) / add(x(Anchor(v1,Center)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=726 children=[713,304]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))))))))),IntV (-1)) / add(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=727 children=[713,354]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))))))))),IntV (-1)) / add(x(Anchor(v1,Center)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=728 children=[722,304]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(index(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),IntV 1)))))),IntV 1) / add(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=729 children=[722,354]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(index(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),IntV 1)))))),IntV 1) / add(x(Anchor(v1,Center)),IntV (-1))
Nonempty VS_lambda node=731 children=[730]; function graph -> parameter binding and output points
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_filter node=733 children=[731,732]; filter exact multiplicity/order inverse; predicate consistency retained across duplicate inputs
MRV immediate domains=[(0,1),(1,3)]
Learn(ArrowT PlacedT BoolT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,178)]
Learn(BoolT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","contains","get","equal","less","lessEqual"]
MRV immediate domains=[(0,1),(1,9)]
Learn(SetT ColorT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","ObjectColors"]
Learn(ColorT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","background"]
Nonempty VS_contains node=17 children=[7,16]; conditional algebra witness; ObjectColors(objectOf(v1)) / ColorV 2
MRV immediate domains=[(0,11),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=747 children=[746,734]; conditional algebra witness; y(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),Center)) / y(Anchor(v1,Center))
MRV immediate domains=[(0,1),(1,11)]
Nonempty VS_equal node=748 children=[734,746]; conditional algebra witness; y(Anchor(v1,Center)) / y(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),Center))
MRV immediate domains=[(0,1),(1,11)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=749 children=[151,746]; conditional algebra witness; x(Anchor(v1,BL)) / y(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),Center))
MRV immediate domains=[(0,1),(1,23)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=774 children=[151,773]; conditional algebra witness; x(Anchor(v1,BL)) / add(cardinality(ObjectCells(objectOf(head(tail(objects(v0)))))),IntV 1)
MRV immediate domains=[(0,1),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=778 children=[151,777]; conditional algebra witness; x(Anchor(v1,BL)) / add(y(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),TL)),IntV (-1))
MRV immediate domains=[(0,1),(1,11)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=791 children=[151,790]; conditional algebra witness; x(Anchor(v1,BL)) / y(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),TL))
MRV immediate domains=[(0,1),(1,10)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=804 children=[792,803]; conditional algebra witness; add(y(Anchor(v1,Center)),IntV 1) / add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),Center)),IntV 1)
MRV immediate domains=[(0,10),(1,1)]
Nonempty VS_equal node=805 children=[803,792]; conditional algebra witness; add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),Center)),IntV 1) / add(y(Anchor(v1,Center)),IntV 1)
MRV immediate domains=[(0,55),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=74 children=[73,18]; conditional algebra witness; IntV 2 / colorToInt(head(setToList(ObjectColors(objectOf(v1)))))
MRV immediate domains=[(0,1),(1,55)]
Nonempty VS_equal node=75 children=[18,73]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(v1))))) / IntV 2
MRV immediate domains=[(0,1),(1,11)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=807 children=[806,790]; conditional algebra witness; add(y(Anchor(v1,Center)),IntV (-1)) / y(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),TL))
MRV immediate domains=[(0,11),(1,1)]
Nonempty VS_equal node=808 children=[790,806]; conditional algebra witness; y(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),TL)) / add(y(Anchor(v1,Center)),IntV (-1))
MRV immediate domains=[(0,1),(1,8)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=809 children=[18,148]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(v1))))) / add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))))),IntV 1)
MRV immediate domains=[(0,1),(1,23)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=810 children=[304,773]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / add(cardinality(ObjectCells(objectOf(head(tail(objects(v0)))))),IntV 1)
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_less node=811 children=[304,777]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / add(y(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),TL)),IntV (-1))
MRV immediate domains=[(0,1),(1,11)]
Nonempty VS_less node=812 children=[304,790]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / y(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),TL))
MRV immediate domains=[(0,1),(1,55)]
Nonempty VS_lessEqual node=813 children=[18,73]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(v1))))) / IntV 2
MRV immediate domains=[(0,1),(1,23)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=838 children=[304,837]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / cardinality(ObjectCells(objectOf(head(tail(objects(v0))))))
MRV immediate domains=[(0,1),(1,23)]
Nonempty VS_lessEqual node=839 children=[304,773]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / add(cardinality(ObjectCells(objectOf(head(tail(objects(v0)))))),IntV 1)
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_lessEqual node=840 children=[304,777]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / add(y(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),TL)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=841 children=[151,291]; conditional algebra witness; x(Anchor(v1,BL)) / y(Anchor(v1,TL))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=842 children=[151,734]; conditional algebra witness; x(Anchor(v1,BL)) / y(Anchor(v1,Center))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=843 children=[151,155]; conditional algebra witness; x(Anchor(v1,BL)) / cardinality(ObjectCells(objectOf(v1)))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=844 children=[151,291]; conditional algebra witness; x(Anchor(v1,BL)) / y(Anchor(v1,TL))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=845 children=[151,734]; conditional algebra witness; x(Anchor(v1,BL)) / y(Anchor(v1,Center))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=846 children=[151,155]; conditional algebra witness; x(Anchor(v1,BL)) / cardinality(ObjectCells(objectOf(v1)))
MRV immediate domains=[(0,60),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=137 children=[136,76]; conditional algebra witness; IntV 1 / add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV (-1))
MRV immediate domains=[(0,1),(1,60)]
Nonempty VS_equal node=138 children=[76,136]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV (-1)) / IntV 1
MRV immediate domains=[(0,8),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=149 children=[148,139]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))))),IntV 1) / add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 1)
MRV immediate domains=[(0,1),(1,8)]
Nonempty VS_equal node=150 children=[139,148]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 1) / add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))))),IntV 1)
MRV immediate domains=[(0,1),(1,55)]
Nonempty VS_less node=847 children=[76,73]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV (-1)) / IntV 2
MRV immediate domains=[(0,1),(1,60)]
Nonempty VS_lessEqual node=848 children=[76,136]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV (-1)) / IntV 1
MRV immediate domains=[(0,1),(1,8)]
Nonempty VS_lessEqual node=849 children=[139,148]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 1) / add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))))),IntV 1)
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=153 children=[151,152]; conditional algebra witness; x(Anchor(v1,BL)) / add(cardinality(ObjectCells(objectOf(v1))),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_equal node=157 children=[152,151]; conditional algebra witness; add(cardinality(ObjectCells(objectOf(v1))),IntV (-1)) / x(Anchor(v1,BL))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=156 children=[154,155]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV 1) / cardinality(ObjectCells(objectOf(v1)))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_equal node=158 children=[155,154]; conditional algebra witness; cardinality(ObjectCells(objectOf(v1))) / add(x(Anchor(v1,BL)),IntV 1)
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=850 children=[304,291]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / y(Anchor(v1,TL))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=851 children=[304,734]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / y(Anchor(v1,Center))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=852 children=[304,155]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / cardinality(ObjectCells(objectOf(v1)))
MRV immediate domains=[(0,1),(1,89)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=943 children=[151,942]; conditional algebra witness; x(Anchor(v1,BL)) / add(y(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,1),(1,7)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=952 children=[151,951]; conditional algebra witness; x(Anchor(v1,BL)) / x(Anchor(head(objects(v0)),BR))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=953 children=[151,792]; conditional algebra witness; x(Anchor(v1,BL)) / add(y(Anchor(v1,Center)),IntV 1)
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=954 children=[151,344]; conditional algebra witness; x(Anchor(v1,BL)) / add(y(Anchor(v1,TL)),IntV 1)
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=956 children=[151,955]; conditional algebra witness; x(Anchor(v1,BL)) / add(cardinality(ObjectCells(objectOf(v1))),IntV 1)
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=957 children=[304,291]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / y(Anchor(v1,TL))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=958 children=[304,155]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / cardinality(ObjectCells(objectOf(v1)))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=959 children=[151,344]; conditional algebra witness; x(Anchor(v1,BL)) / add(y(Anchor(v1,TL)),IntV 1)
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=960 children=[151,152]; conditional algebra witness; x(Anchor(v1,BL)) / add(cardinality(ObjectCells(objectOf(v1))),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=961 children=[151,955]; conditional algebra witness; x(Anchor(v1,BL)) / add(cardinality(ObjectCells(objectOf(v1))),IntV 1)
MRV immediate domains=[(0,1),(1,28)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=962 children=[151,212]; conditional algebra witness; x(Anchor(v1,BL)) / y(Anchor(head(objects(v0)),TL))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=963 children=[151,364]; conditional algebra witness; x(Anchor(v1,BL)) / add(y(Anchor(v1,TL)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=964 children=[151,806]; conditional algebra witness; x(Anchor(v1,BL)) / add(y(Anchor(v1,Center)),IntV (-1))
MRV immediate domains=[(0,1),(1,50)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=1016 children=[151,1015]; conditional algebra witness; x(Anchor(v1,BL)) / y(Anchor(head(objects(v0)),Center))
MRV immediate domains=[(0,1),(1,21)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=182 children=[159,181]; conditional algebra witness; x(Anchor(v1,BR)) / add(y(Anchor(head(objects(v0)),TL)),IntV (-1))
MRV immediate domains=[(0,21),(1,1)]
Nonempty VS_equal node=214 children=[181,159]; conditional algebra witness; add(y(Anchor(head(objects(v0)),TL)),IntV (-1)) / x(Anchor(v1,BR))
MRV immediate domains=[(0,1),(1,28)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=213 children=[183,212]; conditional algebra witness; add(x(Anchor(v1,BR)),IntV 1) / y(Anchor(head(objects(v0)),TL))
MRV immediate domains=[(0,28),(1,1)]
Nonempty VS_equal node=215 children=[212,183]; conditional algebra witness; y(Anchor(head(objects(v0)),TL)) / add(x(Anchor(v1,BR)),IntV 1)
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=1017 children=[18,152]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(v1))))) / add(cardinality(ObjectCells(objectOf(v1))),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=1018 children=[139,155]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 1) / cardinality(ObjectCells(objectOf(v1)))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=1019 children=[304,344]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / add(y(Anchor(v1,TL)),IntV 1)
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=1020 children=[304,152]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / add(cardinality(ObjectCells(objectOf(v1))),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=1021 children=[304,955]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / add(cardinality(ObjectCells(objectOf(v1))),IntV 1)
MRV immediate domains=[(0,1),(1,28)]
Nonempty VS_less node=1022 children=[304,212]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / y(Anchor(head(objects(v0)),TL))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=1023 children=[304,364]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / add(y(Anchor(v1,TL)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=1024 children=[304,806]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / add(y(Anchor(v1,Center)),IntV (-1))
MRV immediate domains=[(0,1),(1,50)]
Nonempty VS_less node=1025 children=[304,1015]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / y(Anchor(head(objects(v0)),Center))
MRV immediate domains=[(0,1),(1,21)]
Nonempty VS_less node=1026 children=[151,181]; conditional algebra witness; x(Anchor(v1,BL)) / add(y(Anchor(head(objects(v0)),TL)),IntV (-1))
MRV immediate domains=[(0,1),(1,7)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=1035 children=[304,1034]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / cardinality(ObjectCells(objectOf(head(objects(v0)))))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=1036 children=[304,152]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / add(cardinality(ObjectCells(objectOf(v1))),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=1037 children=[304,955]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / add(cardinality(ObjectCells(objectOf(v1))),IntV 1)
MRV immediate domains=[(0,1),(1,28)]
Nonempty VS_lessEqual node=1038 children=[304,212]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / y(Anchor(head(objects(v0)),TL))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=1039 children=[304,364]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / add(y(Anchor(v1,TL)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=1040 children=[304,806]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / add(y(Anchor(v1,Center)),IntV (-1))
MRV immediate domains=[(0,1),(1,7)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=1049 children=[151,1048]; conditional algebra witness; x(Anchor(v1,BL)) / add(cardinality(ObjectCells(objectOf(head(objects(v0))))),IntV 1)
MRV immediate domains=[(0,1),(1,21)]
Nonempty VS_lessEqual node=1050 children=[151,181]; conditional algebra witness; x(Anchor(v1,BL)) / add(y(Anchor(head(objects(v0)),TL)),IntV (-1))
MRV immediate domains=[(0,1),(1,7)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=1059 children=[151,1058]; conditional algebra witness; x(Anchor(v1,BL)) / add(x(Anchor(head(objects(v0)),BR)),IntV (-1))
MRV immediate domains=[(0,1),(1,21)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=217 children=[216,181]; conditional algebra witness; add(x(Anchor(v1,Center)),IntV 1) / add(y(Anchor(head(objects(v0)),TL)),IntV (-1))
MRV immediate domains=[(0,21),(1,1)]
Nonempty VS_equal node=218 children=[181,216]; conditional algebra witness; add(y(Anchor(head(objects(v0)),TL)),IntV (-1)) / add(x(Anchor(v1,Center)),IntV 1)
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=1060 children=[139,152]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 1) / add(cardinality(ObjectCells(objectOf(v1))),IntV (-1))
MRV immediate domains=[(0,1),(1,7)]
Nonempty VS_less node=1061 children=[304,1048]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / add(cardinality(ObjectCells(objectOf(head(objects(v0))))),IntV 1)
MRV immediate domains=[(0,1),(1,21)]
Nonempty VS_less node=1062 children=[304,181]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / add(y(Anchor(head(objects(v0)),TL)),IntV (-1))
MRV immediate domains=[(0,1),(1,7)]
Nonempty VS_less node=1063 children=[304,1058]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / add(x(Anchor(head(objects(v0)),BR)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=1064 children=[139,152]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 1) / add(cardinality(ObjectCells(objectOf(v1))),IntV (-1))
MRV immediate domains=[(0,1),(1,7)]
Nonempty VS_lessEqual node=1065 children=[304,1048]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / add(cardinality(ObjectCells(objectOf(head(objects(v0))))),IntV 1)
MRV immediate domains=[(0,1),(1,21)]
Nonempty VS_lessEqual node=1066 children=[304,181]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / add(y(Anchor(head(objects(v0)),TL)),IntV (-1))
MRV immediate domains=[(0,15),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=1067 children=[320,155]; conditional algebra witness; cardinality(ObjectCells(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))) / cardinality(ObjectCells(objectOf(v1)))
MRV immediate domains=[(0,1),(1,29)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=1098 children=[151,1097]; conditional algebra witness; x(Anchor(v1,BL)) / x(Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),Center))
MRV immediate domains=[(0,1),(1,22)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=1122 children=[151,1121]; conditional algebra witness; x(Anchor(v1,BL)) / y(Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),TL))
MRV immediate domains=[(0,1),(1,21)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=1123 children=[18,461]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(v1))))) / colorToInt(head(setToList(ObjectColors(objectOf(index(tail(objects(v0)),IntV 1))))))
MRV immediate domains=[(0,1),(1,22)]
Nonempty VS_lessEqual node=1124 children=[151,1121]; conditional algebra witness; x(Anchor(v1,BL)) / y(Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),TL))
MRV immediate domains=[(0,1),(1,36)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=1162 children=[151,1161]; conditional algebra witness; x(Anchor(v1,BL)) / y(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))),TL))
MRV immediate domains=[(0,7),(1,1)]
Learn(ColorT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","background"]
Learn(SetT ColorT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","ObjectColors"]
Nonempty VS_contains node=228 children=[227,219]; conditional algebra witness; ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))))) / head(setToList(ObjectColors(objectOf(v1))))
MRV immediate domains=[(0,7),(1,1)]
Learn(CellT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get"]
Learn(SetT CellT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","cells","ObjectCells"]
Nonempty VS_contains node=238 children=[237,229]; conditional algebra witness; ObjectCells(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))))) / head(setToList(ObjectCells(objectOf(v1))))
MRV immediate domains=[(0,1),(1,7)]
Learn(SetT CellT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","cells","ObjectCells"]
Learn(CellT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get"]
Nonempty VS_contains node=248 children=[239,247]; conditional algebra witness; ObjectCells(objectOf(v1)) / head(setToList(ObjectCells(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))))
MRV immediate domains=[(0,7),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=300 children=[299,291]; conditional algebra witness; y(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),TL)) / y(Anchor(v1,TL))
MRV immediate domains=[(0,1),(1,7)]
Nonempty VS_equal node=303 children=[291,299]; conditional algebra witness; y(Anchor(v1,TL)) / y(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),TL))
MRV immediate domains=[(0,1),(1,23)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=273 children=[151,272]; conditional algebra witness; x(Anchor(v1,BL)) / x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),BL))
MRV immediate domains=[(0,23),(1,1)]
Nonempty VS_equal node=301 children=[272,151]; conditional algebra witness; x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),BL)) / x(Anchor(v1,BL))
MRV immediate domains=[(0,1),(1,14)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=290 children=[274,289]; conditional algebra witness; x(Anchor(v1,Center)) / x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),Center))
MRV immediate domains=[(0,1),(1,15)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=1163 children=[155,338]; conditional algebra witness; cardinality(ObjectCells(objectOf(v1))) / cardinality(ObjectCells(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))))))
MRV immediate domains=[(0,14),(1,1)]
Nonempty VS_equal node=302 children=[289,274]; conditional algebra witness; x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),Center)) / x(Anchor(v1,Center))
MRV immediate domains=[(0,15),(1,1)]
Nonempty VS_equal node=1164 children=[338,155]; conditional algebra witness; cardinality(ObjectCells(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))) / cardinality(ObjectCells(objectOf(v1)))
MRV immediate domains=[(0,1),(1,7)]
Nonempty VS_less node=1165 children=[151,299]; conditional algebra witness; x(Anchor(v1,BL)) / y(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),TL))
MRV immediate domains=[(0,1),(1,15)]
Nonempty VS_less node=1166 children=[151,338]; conditional algebra witness; x(Anchor(v1,BL)) / cardinality(ObjectCells(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))))))
MRV immediate domains=[(0,1),(1,23)]
Nonempty VS_lessEqual node=1167 children=[151,272]; conditional algebra witness; x(Anchor(v1,BL)) / x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),BL))
MRV immediate domains=[(0,1),(1,14)]
Nonempty VS_lessEqual node=1168 children=[151,289]; conditional algebra witness; x(Anchor(v1,BL)) / x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),Center))
MRV immediate domains=[(0,1),(1,15)]
Nonempty VS_lessEqual node=1169 children=[151,338]; conditional algebra witness; x(Anchor(v1,BL)) / cardinality(ObjectCells(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))))))
MRV immediate domains=[(0,15),(1,1)]
Nonempty VS_equal node=321 children=[320,304]; conditional algebra witness; cardinality(ObjectCells(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))) / add(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,1),(1,15)]
Nonempty VS_equal node=322 children=[304,320]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / cardinality(ObjectCells(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))))
MRV immediate domains=[(0,1),(1,21)]
Nonempty VS_less node=1170 children=[76,461]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV (-1)) / colorToInt(head(setToList(ObjectColors(objectOf(index(tail(objects(v0)),IntV 1))))))
MRV immediate domains=[(0,1),(1,22)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=1171 children=[18,574]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(v1))))) / add(colorToInt(head(setToList(ObjectColors(objectOf(index(tail(objects(v0)),IntV 1)))))),IntV 1)
MRV immediate domains=[(0,22),(1,1)]
Nonempty VS_less node=1172 children=[574,152]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(index(tail(objects(v0)),IntV 1)))))),IntV 1) / add(cardinality(ObjectCells(objectOf(v1))),IntV (-1))
MRV immediate domains=[(0,15),(1,1)]
Nonempty VS_less node=1173 children=[320,152]; conditional algebra witness; cardinality(ObjectCells(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))) / add(cardinality(ObjectCells(objectOf(v1))),IntV (-1))
MRV immediate domains=[(0,1),(1,22)]
Nonempty VS_less node=1174 children=[304,1121]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / y(Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),TL))
MRV immediate domains=[(0,1),(1,36)]
Nonempty VS_less node=1175 children=[304,1161]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / y(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))),TL))
MRV immediate domains=[(0,1),(1,15)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=1192 children=[151,1191]; conditional algebra witness; x(Anchor(v1,BL)) / add(y(Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),TL)),IntV (-1))
MRV immediate domains=[(0,15),(1,1)]
Nonempty VS_lessEqual node=1193 children=[320,152]; conditional algebra witness; cardinality(ObjectCells(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))) / add(cardinality(ObjectCells(objectOf(v1))),IntV (-1))
MRV immediate domains=[(0,1),(1,15)]
Nonempty VS_lessEqual node=1194 children=[304,320]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / cardinality(ObjectCells(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))))
MRV immediate domains=[(0,1),(1,22)]
Nonempty VS_lessEqual node=1195 children=[304,1121]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / y(Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),TL))
MRV immediate domains=[(0,1),(1,15)]
Nonempty VS_lessEqual node=1196 children=[151,1191]; conditional algebra witness; x(Anchor(v1,BL)) / add(y(Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),TL)),IntV (-1))
MRV immediate domains=[(0,1),(1,23)]
Nonempty VS_equal node=1197 children=[152,272]; conditional algebra witness; add(cardinality(ObjectCells(objectOf(v1))),IntV (-1)) / x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),BL))
MRV immediate domains=[(0,23),(1,1)]
Nonempty VS_equal node=1198 children=[272,152]; conditional algebra witness; x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),BL)) / add(cardinality(ObjectCells(objectOf(v1))),IntV (-1))
MRV immediate domains=[(0,1),(1,15)]
Nonempty VS_equal node=339 children=[154,338]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV 1) / cardinality(ObjectCells(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))))))
MRV immediate domains=[(0,14),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=341 children=[289,340]; conditional algebra witness; x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),Center)) / add(x(Anchor(v1,BR)),IntV (-1))
MRV immediate domains=[(0,15),(1,1)]
Nonempty VS_equal node=342 children=[338,154]; conditional algebra witness; cardinality(ObjectCells(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))) / add(x(Anchor(v1,BL)),IntV 1)
MRV immediate domains=[(0,1),(1,14)]
Nonempty VS_equal node=343 children=[340,289]; conditional algebra witness; add(x(Anchor(v1,BR)),IntV (-1)) / x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),Center))
MRV immediate domains=[(0,1),(1,23)]
Nonempty VS_less node=1199 children=[304,272]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),BL))
MRV immediate domains=[(0,1),(1,14)]
Nonempty VS_less node=1200 children=[304,289]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),Center))
MRV immediate domains=[(0,1),(1,15)]
Nonempty VS_less node=1201 children=[304,338]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / cardinality(ObjectCells(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))))))
MRV immediate domains=[(0,1),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=1205 children=[151,1204]; conditional algebra witness; x(Anchor(v1,BL)) / x(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))),Center))
MRV immediate domains=[(0,1),(1,23)]
Nonempty VS_lessEqual node=1206 children=[304,272]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),BL))
MRV immediate domains=[(0,1),(1,14)]
Nonempty VS_lessEqual node=1207 children=[304,289]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),Center))
MRV immediate domains=[(0,1),(1,15)]
Nonempty VS_lessEqual node=1208 children=[304,338]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / cardinality(ObjectCells(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))))))
MRV immediate domains=[(0,1),(1,7)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=1209 children=[151,372]; conditional algebra witness; x(Anchor(v1,BL)) / add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),TL)),IntV (-1))
MRV immediate domains=[(0,1),(1,15)]
Nonempty VS_equal node=1210 children=[955,1191]; conditional algebra witness; add(cardinality(ObjectCells(objectOf(v1))),IntV 1) / add(y(Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),TL)),IntV (-1))
MRV immediate domains=[(0,15),(1,1)]
Nonempty VS_equal node=1211 children=[1191,955]; conditional algebra witness; add(y(Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),TL)),IntV (-1)) / add(cardinality(ObjectCells(objectOf(v1))),IntV 1)
MRV immediate domains=[(0,1),(1,7)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=1212 children=[18,633]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(v1))))) / colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))))))
MRV immediate domains=[(0,7),(1,1)]
Nonempty VS_less node=1213 children=[633,152]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))))) / add(cardinality(ObjectCells(objectOf(v1))),IntV (-1))
MRV immediate domains=[(0,1),(1,15)]
Nonempty VS_less node=1214 children=[139,320]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 1) / cardinality(ObjectCells(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))))
MRV immediate domains=[(0,7),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=1223 children=[1222,155]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))))),IntV 1) / cardinality(ObjectCells(objectOf(v1)))
MRV immediate domains=[(0,1),(1,15)]
Nonempty VS_less node=1224 children=[304,1191]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / add(y(Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),TL)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=1226 children=[151,1225]; conditional algebra witness; x(Anchor(v1,BL)) / y(Anchor(index(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),IntV 1),TL))
MRV immediate domains=[(0,1),(1,8)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=1227 children=[76,512]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV (-1)) / x(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))),BL))
MRV immediate domains=[(0,1),(1,21)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=1228 children=[76,535]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV (-1)) / x(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))),Center))
MRV immediate domains=[(0,1),(1,9)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=1229 children=[18,616]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(v1))))) / add(x(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))),BL)),IntV 1)
MRV immediate domains=[(0,1),(1,22)]
Nonempty VS_lessEqual node=1230 children=[139,574]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 1) / add(colorToInt(head(setToList(ObjectColors(objectOf(index(tail(objects(v0)),IntV 1)))))),IntV 1)
MRV immediate domains=[(0,1),(1,15)]
Nonempty VS_lessEqual node=1231 children=[304,1191]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / add(y(Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),TL)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=1232 children=[151,1225]; conditional algebra witness; x(Anchor(v1,BL)) / y(Anchor(index(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),IntV 1),TL))
MRV immediate domains=[(0,7),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=353 children=[352,344]; conditional algebra witness; add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),TL)),IntV 1) / add(y(Anchor(v1,TL)),IntV 1)
MRV immediate domains=[(0,1),(1,7)]
Nonempty VS_equal node=375 children=[344,352]; conditional algebra witness; add(y(Anchor(v1,TL)),IntV 1) / add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),TL)),IntV 1)
MRV immediate domains=[(0,7),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=363 children=[362,354]; conditional algebra witness; add(x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),Center)),IntV (-1)) / add(x(Anchor(v1,Center)),IntV (-1))
MRV immediate domains=[(0,1),(1,7)]
Nonempty VS_equal node=374 children=[354,362]; conditional algebra witness; add(x(Anchor(v1,Center)),IntV (-1)) / add(x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),Center)),IntV (-1))
MRV immediate domains=[(0,1),(1,7)]
Nonempty VS_equal node=373 children=[364,372]; conditional algebra witness; add(y(Anchor(v1,TL)),IntV (-1)) / add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),TL)),IntV (-1))
MRV immediate domains=[(0,7),(1,1)]
Nonempty VS_equal node=376 children=[372,364]; conditional algebra witness; add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),TL)),IntV (-1)) / add(y(Anchor(v1,TL)),IntV (-1))
MRV immediate domains=[(0,1),(1,7)]
Nonempty VS_less node=1233 children=[304,372]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),TL)),IntV (-1))
MRV immediate domains=[(0,1),(1,7)]
Nonempty VS_lessEqual node=1234 children=[304,362]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / add(x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),Center)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=1236 children=[151,1235]; conditional algebra witness; x(Anchor(v1,BL)) / add(x(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))),Center)),IntV (-1))
MRV immediate domains=[(0,7),(1,1)]
Nonempty VS_lessEqual node=1237 children=[362,152]; conditional algebra witness; add(x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),Center)),IntV (-1)) / add(cardinality(ObjectCells(objectOf(v1))),IntV (-1))
MRV immediate domains=[(0,1),(1,9)]
Nonempty VS_less node=1238 children=[76,616]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV (-1)) / add(x(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))),BL)),IntV 1)
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=1239 children=[304,1225]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / y(Anchor(index(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),IntV 1),TL))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=1241 children=[151,1240]; conditional algebra witness; x(Anchor(v1,BL)) / add(y(Anchor(index(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),IntV 1),TL)),IntV (-1))
MRV immediate domains=[(0,1),(1,7)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=1242 children=[76,604]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV (-1)) / colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))))
MRV immediate domains=[(0,1),(1,14)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=1243 children=[18,676]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(v1))))) / add(colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))))))),IntV 1)
MRV immediate domains=[(0,1),(1,7)]
Nonempty VS_lessEqual node=1244 children=[139,633]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 1) / colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))))))
MRV immediate domains=[(0,7),(1,1)]
Nonempty VS_lessEqual node=1245 children=[1222,152]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))))),IntV 1) / add(cardinality(ObjectCells(objectOf(v1))),IntV (-1))
MRV immediate domains=[(0,1),(1,7)]
Nonempty VS_lessEqual node=1246 children=[304,1222]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / add(colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))))),IntV 1)
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=1247 children=[151,1240]; conditional algebra witness; x(Anchor(v1,BL)) / add(y(Anchor(index(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),IntV 1),TL)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=1248 children=[304,1235]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / add(x(Anchor(head(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))),Center)),IntV (-1))
MRV immediate domains=[(0,1),(1,14)]
Nonempty VS_less node=1249 children=[76,676]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV (-1)) / add(colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))))))),IntV 1)
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=1250 children=[18,710]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(v1))))) / colorToInt(head(setToList(ObjectColors(objectOf(index(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),IntV 1))))))
MRV immediate domains=[(0,1),(1,7)]
Nonempty VS_less node=1251 children=[139,1222]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 1) / add(colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))))),IntV 1)
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=1252 children=[304,1240]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / add(y(Anchor(index(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),IntV 1),TL)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=1253 children=[304,1240]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / add(y(Anchor(index(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),IntV 1),TL)),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=1254 children=[722,152]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(index(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),IntV 1)))))),IntV 1) / add(cardinality(ObjectCells(objectOf(v1))),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=1255 children=[139,710]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 1) / colorToInt(head(setToList(ObjectColors(objectOf(index(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),IntV 1))))))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=1256 children=[139,722]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 1) / add(colorToInt(head(setToList(ObjectColors(objectOf(index(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),IntV 1)))))),IntV 1)
Nonempty VS_lambda node=1258 children=[1257]; function graph -> parameter binding and output points
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_filter node=1263 children=[1258,1262]; filter exact multiplicity/order inverse; predicate consistency retained across duplicate inputs
MRV immediate domains=[(0,1),(1,1)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_filter node=1265 children=[378,1264]; filter exact multiplicity/order inverse; predicate consistency retained across duplicate inputs
MRV immediate domains=[(0,1),(1,1)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_filter node=1267 children=[378,1266]; filter exact multiplicity/order inverse; predicate consistency retained across duplicate inputs
MRV immediate domains=[(0,1),(1,3)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_filter node=1272 children=[378,1271]; filter exact multiplicity/order inverse; predicate consistency retained across duplicate inputs
MRV immediate domains=[(0,1),(1,1)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_filter node=1274 children=[378,1273]; filter exact multiplicity/order inverse; predicate consistency retained across duplicate inputs
MRV immediate domains=[(0,1),(1,3)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_filter node=1279 children=[731,1278]; filter exact multiplicity/order inverse; predicate consistency retained across duplicate inputs
MRV immediate domains=[(0,1),(1,1)]
Learn(ArrowT PlacedT BoolT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,83)]
Learn(BoolT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","contains","get","equal","less","lessEqual"]
MRV immediate domains=[(0,1),(1,9)]
Learn(SetT ColorT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","ObjectColors"]
Learn(ColorT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","background"]
Nonempty VS_contains node=17 children=[7,16]; conditional algebra witness; ObjectColors(objectOf(v1)) / ColorV 2
MRV immediate domains=[(0,11),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=747 children=[746,734]; conditional algebra witness; y(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),Center)) / y(Anchor(v1,Center))
MRV immediate domains=[(0,1),(1,11)]
Nonempty VS_equal node=748 children=[734,746]; conditional algebra witness; y(Anchor(v1,Center)) / y(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),Center))
MRV immediate domains=[(0,1),(1,10)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=804 children=[792,803]; conditional algebra witness; add(y(Anchor(v1,Center)),IntV 1) / add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),Center)),IntV 1)
MRV immediate domains=[(0,10),(1,1)]
Nonempty VS_equal node=805 children=[803,792]; conditional algebra witness; add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),Center)),IntV 1) / add(y(Anchor(v1,Center)),IntV 1)
MRV immediate domains=[(0,55),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=74 children=[73,18]; conditional algebra witness; IntV 2 / colorToInt(head(setToList(ObjectColors(objectOf(v1)))))
MRV immediate domains=[(0,1),(1,55)]
Nonempty VS_equal node=75 children=[18,73]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(v1))))) / IntV 2
MRV immediate domains=[(0,1),(1,11)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=807 children=[806,790]; conditional algebra witness; add(y(Anchor(v1,Center)),IntV (-1)) / y(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),TL))
MRV immediate domains=[(0,11),(1,1)]
Nonempty VS_equal node=808 children=[790,806]; conditional algebra witness; y(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),TL)) / add(y(Anchor(v1,Center)),IntV (-1))
MRV immediate domains=[(0,1),(1,8)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=809 children=[18,148]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(v1))))) / add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))))),IntV 1)
MRV immediate domains=[(0,1),(1,55)]
Nonempty VS_lessEqual node=813 children=[18,73]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(v1))))) / IntV 2
MRV immediate domains=[(0,60),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=137 children=[136,76]; conditional algebra witness; IntV 1 / add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV (-1))
MRV immediate domains=[(0,1),(1,60)]
Nonempty VS_equal node=138 children=[76,136]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV (-1)) / IntV 1
MRV immediate domains=[(0,8),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=149 children=[148,139]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))))),IntV 1) / add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 1)
MRV immediate domains=[(0,1),(1,8)]
Nonempty VS_equal node=150 children=[139,148]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 1) / add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))))),IntV 1)
MRV immediate domains=[(0,1),(1,55)]
Nonempty VS_less node=847 children=[76,73]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV (-1)) / IntV 2
MRV immediate domains=[(0,1),(1,60)]
Nonempty VS_lessEqual node=848 children=[76,136]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV (-1)) / IntV 1
MRV immediate domains=[(0,1),(1,8)]
Nonempty VS_lessEqual node=849 children=[139,148]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 1) / add(colorToInt(head(setToList(ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))))),IntV 1)
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=153 children=[151,152]; conditional algebra witness; x(Anchor(v1,BL)) / add(cardinality(ObjectCells(objectOf(v1))),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_equal node=157 children=[152,151]; conditional algebra witness; add(cardinality(ObjectCells(objectOf(v1))),IntV (-1)) / x(Anchor(v1,BL))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=156 children=[154,155]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV 1) / cardinality(ObjectCells(objectOf(v1)))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_equal node=158 children=[155,154]; conditional algebra witness; cardinality(ObjectCells(objectOf(v1))) / add(x(Anchor(v1,BL)),IntV 1)
MRV immediate domains=[(0,1),(1,21)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=182 children=[159,181]; conditional algebra witness; x(Anchor(v1,BR)) / add(y(Anchor(head(objects(v0)),TL)),IntV (-1))
MRV immediate domains=[(0,21),(1,1)]
Nonempty VS_equal node=214 children=[181,159]; conditional algebra witness; add(y(Anchor(head(objects(v0)),TL)),IntV (-1)) / x(Anchor(v1,BR))
MRV immediate domains=[(0,1),(1,28)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=213 children=[183,212]; conditional algebra witness; add(x(Anchor(v1,BR)),IntV 1) / y(Anchor(head(objects(v0)),TL))
MRV immediate domains=[(0,28),(1,1)]
Nonempty VS_equal node=215 children=[212,183]; conditional algebra witness; y(Anchor(head(objects(v0)),TL)) / add(x(Anchor(v1,BR)),IntV 1)
MRV immediate domains=[(0,1),(1,21)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=217 children=[216,181]; conditional algebra witness; add(x(Anchor(v1,Center)),IntV 1) / add(y(Anchor(head(objects(v0)),TL)),IntV (-1))
MRV immediate domains=[(0,21),(1,1)]
Nonempty VS_equal node=218 children=[181,216]; conditional algebra witness; add(y(Anchor(head(objects(v0)),TL)),IntV (-1)) / add(x(Anchor(v1,Center)),IntV 1)
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=1060 children=[139,152]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 1) / add(cardinality(ObjectCells(objectOf(v1))),IntV (-1))
MRV immediate domains=[(0,21),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=1280 children=[181,955]; conditional algebra witness; add(y(Anchor(head(objects(v0)),TL)),IntV (-1)) / add(cardinality(ObjectCells(objectOf(v1))),IntV 1)
MRV immediate domains=[(0,15),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=1067 children=[320,155]; conditional algebra witness; cardinality(ObjectCells(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))) / cardinality(ObjectCells(objectOf(v1)))
MRV immediate domains=[(0,7),(1,1)]
Learn(ColorT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","background"]
Learn(SetT ColorT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","ObjectColors"]
Nonempty VS_contains node=228 children=[227,219]; conditional algebra witness; ObjectColors(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))))) / head(setToList(ObjectColors(objectOf(v1))))
MRV immediate domains=[(0,7),(1,1)]
Learn(CellT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get"]
Learn(SetT CellT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","cells","ObjectCells"]
Nonempty VS_contains node=238 children=[237,229]; conditional algebra witness; ObjectCells(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))))) / head(setToList(ObjectCells(objectOf(v1))))
MRV immediate domains=[(0,1),(1,7)]
Learn(SetT CellT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","cells","ObjectCells"]
Learn(CellT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get"]
Nonempty VS_contains node=248 children=[239,247]; conditional algebra witness; ObjectCells(objectOf(v1)) / head(setToList(ObjectCells(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))))
MRV immediate domains=[(0,7),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=300 children=[299,291]; conditional algebra witness; y(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),TL)) / y(Anchor(v1,TL))
MRV immediate domains=[(0,1),(1,7)]
Nonempty VS_equal node=303 children=[291,299]; conditional algebra witness; y(Anchor(v1,TL)) / y(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),TL))
MRV immediate domains=[(0,1),(1,23)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=273 children=[151,272]; conditional algebra witness; x(Anchor(v1,BL)) / x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),BL))
MRV immediate domains=[(0,23),(1,1)]
Nonempty VS_equal node=301 children=[272,151]; conditional algebra witness; x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),BL)) / x(Anchor(v1,BL))
MRV immediate domains=[(0,1),(1,14)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=290 children=[274,289]; conditional algebra witness; x(Anchor(v1,Center)) / x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),Center))
MRV immediate domains=[(0,1),(1,15)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=1163 children=[155,338]; conditional algebra witness; cardinality(ObjectCells(objectOf(v1))) / cardinality(ObjectCells(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))))))
MRV immediate domains=[(0,14),(1,1)]
Nonempty VS_equal node=302 children=[289,274]; conditional algebra witness; x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),Center)) / x(Anchor(v1,Center))
MRV immediate domains=[(0,15),(1,1)]
Nonempty VS_equal node=1164 children=[338,155]; conditional algebra witness; cardinality(ObjectCells(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))) / cardinality(ObjectCells(objectOf(v1)))
MRV immediate domains=[(0,23),(1,1)]
Nonempty VS_less node=1281 children=[272,155]; conditional algebra witness; x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),BL)) / cardinality(ObjectCells(objectOf(v1)))
MRV immediate domains=[(0,23),(1,1)]
Nonempty VS_lessEqual node=1282 children=[272,155]; conditional algebra witness; x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),BL)) / cardinality(ObjectCells(objectOf(v1)))
MRV immediate domains=[(0,14),(1,1)]
Nonempty VS_lessEqual node=1283 children=[289,155]; conditional algebra witness; x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),Center)) / cardinality(ObjectCells(objectOf(v1)))
MRV immediate domains=[(0,15),(1,1)]
Nonempty VS_lessEqual node=1284 children=[338,155]; conditional algebra witness; cardinality(ObjectCells(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))) / cardinality(ObjectCells(objectOf(v1)))
MRV immediate domains=[(0,15),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=321 children=[320,304]; conditional algebra witness; cardinality(ObjectCells(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))) / add(x(Anchor(v1,BL)),IntV (-1))
MRV immediate domains=[(0,1),(1,15)]
Nonempty VS_equal node=322 children=[304,320]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV (-1)) / cardinality(ObjectCells(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))))
MRV immediate domains=[(0,22),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=1172 children=[574,152]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(index(tail(objects(v0)),IntV 1)))))),IntV 1) / add(cardinality(ObjectCells(objectOf(v1))),IntV (-1))
MRV immediate domains=[(0,15),(1,1)]
Nonempty VS_less node=1173 children=[320,152]; conditional algebra witness; cardinality(ObjectCells(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))) / add(cardinality(ObjectCells(objectOf(v1))),IntV (-1))
MRV immediate domains=[(0,15),(1,1)]
Nonempty VS_lessEqual node=1193 children=[320,152]; conditional algebra witness; cardinality(ObjectCells(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))) / add(cardinality(ObjectCells(objectOf(v1))),IntV (-1))
MRV immediate domains=[(0,1),(1,23)]
Nonempty VS_equal node=1197 children=[152,272]; conditional algebra witness; add(cardinality(ObjectCells(objectOf(v1))),IntV (-1)) / x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),BL))
MRV immediate domains=[(0,23),(1,1)]
Nonempty VS_equal node=1198 children=[272,152]; conditional algebra witness; x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),BL)) / add(cardinality(ObjectCells(objectOf(v1))),IntV (-1))
MRV immediate domains=[(0,1),(1,15)]
Nonempty VS_equal node=339 children=[154,338]; conditional algebra witness; add(x(Anchor(v1,BL)),IntV 1) / cardinality(ObjectCells(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))))))
MRV immediate domains=[(0,14),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=341 children=[289,340]; conditional algebra witness; x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),Center)) / add(x(Anchor(v1,BR)),IntV (-1))
MRV immediate domains=[(0,15),(1,1)]
Nonempty VS_equal node=342 children=[338,154]; conditional algebra witness; cardinality(ObjectCells(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))) / add(x(Anchor(v1,BL)),IntV 1)
MRV immediate domains=[(0,1),(1,14)]
Nonempty VS_equal node=343 children=[340,289]; conditional algebra witness; add(x(Anchor(v1,BR)),IntV (-1)) / x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),Center))
MRV immediate domains=[(0,7),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=1285 children=[362,155]; conditional algebra witness; add(x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),Center)),IntV (-1)) / cardinality(ObjectCells(objectOf(v1)))
MRV immediate domains=[(0,23),(1,1)]
Nonempty VS_less node=1286 children=[272,955]; conditional algebra witness; x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),BL)) / add(cardinality(ObjectCells(objectOf(v1))),IntV 1)
MRV immediate domains=[(0,14),(1,1)]
Nonempty VS_less node=1287 children=[289,955]; conditional algebra witness; x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),Center)) / add(cardinality(ObjectCells(objectOf(v1))),IntV 1)
MRV immediate domains=[(0,15),(1,1)]
Nonempty VS_less node=1288 children=[338,955]; conditional algebra witness; cardinality(ObjectCells(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))) / add(cardinality(ObjectCells(objectOf(v1))),IntV 1)
MRV immediate domains=[(0,23),(1,1)]
Nonempty VS_lessEqual node=1289 children=[272,152]; conditional algebra witness; x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),BL)) / add(cardinality(ObjectCells(objectOf(v1))),IntV (-1))
MRV immediate domains=[(0,15),(1,1)]
Nonempty VS_lessEqual node=1290 children=[338,955]; conditional algebra witness; cardinality(ObjectCells(objectOf(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))) / add(cardinality(ObjectCells(objectOf(v1))),IntV 1)
MRV immediate domains=[(0,1),(1,15)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=1210 children=[955,1191]; conditional algebra witness; add(cardinality(ObjectCells(objectOf(v1))),IntV 1) / add(y(Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),TL)),IntV (-1))
MRV immediate domains=[(0,15),(1,1)]
Nonempty VS_equal node=1211 children=[1191,955]; conditional algebra witness; add(y(Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),TL)),IntV (-1)) / add(cardinality(ObjectCells(objectOf(v1))),IntV 1)
MRV immediate domains=[(0,7),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=1213 children=[633,152]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))))) / add(cardinality(ObjectCells(objectOf(v1))),IntV (-1))
MRV immediate domains=[(0,7),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=1223 children=[1222,155]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))))),IntV 1) / cardinality(ObjectCells(objectOf(v1)))
MRV immediate domains=[(0,1),(1,8)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=1227 children=[76,512]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV (-1)) / x(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))),BL))
MRV immediate domains=[(0,1),(1,9)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=1229 children=[18,616]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(v1))))) / add(x(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))),BL)),IntV 1)
MRV immediate domains=[(0,15),(1,1)]
Nonempty VS_lessEqual node=1291 children=[1191,955]; conditional algebra witness; add(y(Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),TL)),IntV (-1)) / add(cardinality(ObjectCells(objectOf(v1))),IntV 1)
MRV immediate domains=[(0,7),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=353 children=[352,344]; conditional algebra witness; add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),TL)),IntV 1) / add(y(Anchor(v1,TL)),IntV 1)
MRV immediate domains=[(0,1),(1,7)]
Nonempty VS_equal node=375 children=[344,352]; conditional algebra witness; add(y(Anchor(v1,TL)),IntV 1) / add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),TL)),IntV 1)
MRV immediate domains=[(0,7),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=363 children=[362,354]; conditional algebra witness; add(x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),Center)),IntV (-1)) / add(x(Anchor(v1,Center)),IntV (-1))
MRV immediate domains=[(0,1),(1,7)]
Nonempty VS_equal node=374 children=[354,362]; conditional algebra witness; add(x(Anchor(v1,Center)),IntV (-1)) / add(x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),Center)),IntV (-1))
MRV immediate domains=[(0,1),(1,7)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=373 children=[364,372]; conditional algebra witness; add(y(Anchor(v1,TL)),IntV (-1)) / add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),TL)),IntV (-1))
MRV immediate domains=[(0,7),(1,1)]
Nonempty VS_equal node=376 children=[372,364]; conditional algebra witness; add(y(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),TL)),IntV (-1)) / add(y(Anchor(v1,TL)),IntV (-1))
MRV immediate domains=[(0,7),(1,1)]
Nonempty VS_lessEqual node=1237 children=[362,152]; conditional algebra witness; add(x(Anchor(head(tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))),Center)),IntV (-1)) / add(cardinality(ObjectCells(objectOf(v1))),IntV (-1))
MRV immediate domains=[(0,1),(1,9)]
Nonempty VS_less node=1238 children=[76,616]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV (-1)) / add(x(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))),BL)),IntV 1)
MRV immediate domains=[(0,7),(1,1)]
Nonempty VS_lessEqual node=1245 children=[1222,152]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))))),IntV 1) / add(cardinality(ObjectCells(objectOf(v1))),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=1250 children=[18,710]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(v1))))) / colorToInt(head(setToList(ObjectColors(objectOf(index(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),IntV 1))))))
MRV immediate domains=[(0,1),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=1254 children=[722,152]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(index(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),IntV 1)))))),IntV 1) / add(cardinality(ObjectCells(objectOf(v1))),IntV (-1))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_lessEqual node=1255 children=[139,710]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 1) / colorToInt(head(setToList(ObjectColors(objectOf(index(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),IntV 1))))))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=1256 children=[139,722]; conditional algebra witness; add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 1) / add(colorToInt(head(setToList(ObjectColors(objectOf(index(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),IntV 1)))))),IntV 1)
Nonempty VS_lambda node=1293 children=[1292]; function graph -> parameter binding and output points
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_filter node=1295 children=[1293,1294]; filter exact multiplicity/order inverse; predicate consistency retained across duplicate inputs
Nonempty VS_mkScene node=1297 children=[3,6,1296]; mkScene residual: canonical correspondence + Render-validated paint order; branch=0
Nonempty VS_lambda node=1298 children=[1297]; function graph -> parameter binding and output points
Task TSL supported Base=["Anchor","ObjectCells","ObjectColors","add","background","canvasSize","cardinality","colorToInt","contains","coord","equal","filter","head","height","index","lambda","less","lessEqual","literal","mkScene","objectOf","objects","setToList","sortBy","subtract","tail","width","x","y"]
Cost saturation C=1..25 root representatives=[(1,0),(2,0),(3,0),(4,0),(5,0),(6,0),(7,0),(8,0),(9,0),(10,0),(11,0),(12,0),(13,1),(14,3),(15,4),(16,6),(17,10),(18,16),(19,35),(20,65),(21,119),(22,213),(23,358),(24,584),(25,584)]
Abstraction round=0; exact frontier=584; accepted=["I0","I1","I2","I3","I4","I5"]
Learn uses I0 by typed definition expansion; ArrowT PlacedT BoolT; observations=6; Gamma=[("v0",SceneT)]
Learn uses I1 by typed definition expansion; ArrowT PlacedT BoolT; observations=6; Gamma=[("v0",SceneT)]
Learn uses I2 by typed definition expansion; ArrowT PlacedT BoolT; observations=6; Gamma=[("v0",SceneT)]
Learn uses I3 by typed definition expansion; ArrowT PlacedT BoolT; observations=6; Gamma=[("v0",SceneT)]
Learn uses I4 by typed definition expansion; ArrowT PlacedT BoolT; observations=6; Gamma=[("v0",SceneT)]
Learn uses I5 by typed definition expansion; ArrowT PlacedT BoolT; observations=6; Gamma=[("v0",SceneT)]
Learn uses I0 by typed definition expansion; ArrowT PlacedT BoolT; observations=4; Gamma=[("v0",SceneT)]
Learn uses I1 by typed definition expansion; ArrowT PlacedT BoolT; observations=4; Gamma=[("v0",SceneT)]
Learn uses I2 by typed definition expansion; ArrowT PlacedT BoolT; observations=4; Gamma=[("v0",SceneT)]
Learn uses I3 by typed definition expansion; ArrowT PlacedT BoolT; observations=4; Gamma=[("v0",SceneT)]
Learn uses I4 by typed definition expansion; ArrowT PlacedT BoolT; observations=4; Gamma=[("v0",SceneT)]
Learn uses I5 by typed definition expansion; ArrowT PlacedT BoolT; observations=4; Gamma=[("v0",SceneT)]
Learn uses I0 by typed definition expansion; ArrowT PlacedT BoolT; observations=4; Gamma=[("v0",SceneT)]
Learn uses I1 by typed definition expansion; ArrowT PlacedT BoolT; observations=4; Gamma=[("v0",SceneT)]
Learn uses I2 by typed definition expansion; ArrowT PlacedT BoolT; observations=4; Gamma=[("v0",SceneT)]
Learn uses I3 by typed definition expansion; ArrowT PlacedT BoolT; observations=4; Gamma=[("v0",SceneT)]
Learn uses I4 by typed definition expansion; ArrowT PlacedT BoolT; observations=4; Gamma=[("v0",SceneT)]
Learn uses I5 by typed definition expansion; ArrowT PlacedT BoolT; observations=4; Gamma=[("v0",SceneT)]
Learn uses I0 by typed definition expansion; ArrowT PlacedT BoolT; observations=4; Gamma=[("v0",SceneT)]
Learn uses I1 by typed definition expansion; ArrowT PlacedT BoolT; observations=4; Gamma=[("v0",SceneT)]
Learn uses I2 by typed definition expansion; ArrowT PlacedT BoolT; observations=4; Gamma=[("v0",SceneT)]
Learn uses I3 by typed definition expansion; ArrowT PlacedT BoolT; observations=4; Gamma=[("v0",SceneT)]
Learn uses I4 by typed definition expansion; ArrowT PlacedT BoolT; observations=4; Gamma=[("v0",SceneT)]
Learn uses I5 by typed definition expansion; ArrowT PlacedT BoolT; observations=4; Gamma=[("v0",SceneT)]
Task TSL supported Base=["Anchor","ObjectCells","ObjectColors","add","background","canvasSize","cardinality","colorToInt","contains","coord","equal","filter","head","height","index","lambda","less","lessEqual","literal","mkScene","objectOf","objects","setToList","sortBy","subtract","tail","width","x","y"]
Cost saturation C=1..24 root representatives=[(1,0),(2,0),(3,0),(4,0),(5,0),(6,0),(7,0),(8,0),(9,0),(10,0),(11,0),(12,0),(13,1),(14,3),(15,4),(16,6),(17,10),(18,16),(19,35),(20,65),(21,119),(22,213),(23,358),(24,584)]
Abstraction round=1; exact frontier=584; accepted=[]
Cost saturation C=1..23 root representatives=[(1,0),(2,0),(3,0),(4,0),(5,0),(6,0),(7,0),(8,0),(9,0),(10,0),(11,0),(12,0),(13,1),(14,3),(15,4),(16,6),(17,10),(18,16),(19,35),(20,65),(21,119),(22,213),(23,358)]
Exact original Render(P(Encode(x)))=y: True; MDL rank=(27,8,2,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(29,9,2,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(25,9,2,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(27,10,2,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(33,11,2,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda __r1b0:PlacedT. equal(IntV 2,colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(33,11,2,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda __r1b0:PlacedT. equal(colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))),IntV 2)),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(35,12,2,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda __r1b0:PlacedT. equal(IntV 2,colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(35,12,2,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda __r1b0:PlacedT. equal(colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))),IntV 2)),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(31,12,2,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda __r1b0:PlacedT. equal(IntV 2,colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(31,12,2,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda __r1b0:PlacedT. equal(colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))),IntV 2)),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(36,12,2,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda __r1b0:PlacedT. equal(IntV 1,add(colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))),IntV (-1)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(38,12,2,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda __r1b0:PlacedT. equal(IntV 3,add(colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))),IntV 1))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(36,12,2,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda __r1b0:PlacedT. equal(add(colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))),IntV (-1)),IntV 1)),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(38,12,2,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. equal(add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 1),IntV 3)),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(33,13,2,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),filter((lambda __r1b0:PlacedT. equal(IntV 2,colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(33,13,2,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),filter((lambda __r1b0:PlacedT. equal(colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))),IntV 2)),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(37,11,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(37,11,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(37,11,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(37,11,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(37,11,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(37,11,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(37,11,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(37,12,2,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. equal(add(cardinality(ObjectCells(objectOf(v1))),IntV (-1)),x(Anchor(v1,TL)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(37,12,2,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. equal(add(x(Anchor(v1,TL)),IntV 1),cardinality(ObjectCells(objectOf(v1))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(37,12,2,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. equal(cardinality(ObjectCells(objectOf(v1))),add(x(Anchor(v1,TL)),IntV 1))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(37,12,2,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. equal(x(Anchor(v1,TL)),add(cardinality(ObjectCells(objectOf(v1))),IntV (-1)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(38,13,2,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda __r1b0:PlacedT. equal(IntV 1,add(colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))),IntV (-1)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(40,13,2,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda __r1b0:PlacedT. equal(IntV 3,add(colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))),IntV 1))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(38,13,2,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda __r1b0:PlacedT. equal(add(colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))),IntV (-1)),IntV 1)),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(40,13,2,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda v1:PlacedT. equal(add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 1),IntV 3)),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(34,13,2,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda __r1b0:PlacedT. equal(IntV 1,add(colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))),IntV (-1)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(36,13,2,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda __r1b0:PlacedT. equal(IntV 3,add(colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))),IntV 1))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(34,13,2,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda __r1b0:PlacedT. equal(add(colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))),IntV (-1)),IntV 1)),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(36,13,2,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. equal(add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 1),IntV 3)),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(39,12,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(39,12,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(39,12,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(39,12,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(39,12,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(39,12,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(39,12,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(39,12,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(39,12,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(39,12,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(39,12,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(39,13,2,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda v1:PlacedT. equal(add(cardinality(ObjectCells(objectOf(v1))),IntV (-1)),x(Anchor(v1,TL)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(39,13,2,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda v1:PlacedT. equal(add(x(Anchor(v1,TL)),IntV 1),cardinality(ObjectCells(objectOf(v1))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(39,13,2,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda v1:PlacedT. equal(cardinality(ObjectCells(objectOf(v1))),add(x(Anchor(v1,TL)),IntV 1))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(39,13,2,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda v1:PlacedT. equal(x(Anchor(v1,TL)),add(cardinality(ObjectCells(objectOf(v1))),IntV (-1)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(35,12,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(35,12,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(35,12,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(35,12,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(35,12,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(35,12,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(35,12,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(35,13,2,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. equal(add(cardinality(ObjectCells(objectOf(v1))),IntV (-1)),x(Anchor(v1,TL)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(35,13,2,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. equal(add(x(Anchor(v1,TL)),IntV 1),cardinality(ObjectCells(objectOf(v1))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(35,13,2,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. equal(cardinality(ObjectCells(objectOf(v1))),add(x(Anchor(v1,TL)),IntV 1))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(35,13,2,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. equal(x(Anchor(v1,TL)),add(cardinality(ObjectCells(objectOf(v1))),IntV (-1)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(36,14,2,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),filter((lambda __r1b0:PlacedT. equal(IntV 1,add(colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))),IntV (-1)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(38,14,2,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),filter((lambda __r1b0:PlacedT. equal(IntV 3,add(colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))),IntV 1))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(36,14,2,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),filter((lambda __r1b0:PlacedT. equal(add(colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))),IntV (-1)),IntV 1)),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(38,14,2,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),filter((lambda v1:PlacedT. equal(add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 1),IntV 3)),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(40,12,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(40,12,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(40,12,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(40,12,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(40,12,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(40,12,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(40,12,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(41,11,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. equal(IntV 10,y(Anchor(v1,Center)))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(41,11,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. equal(IntV 10,y(Anchor(v1,Center)))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(41,11,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. equal(IntV 10,y(Anchor(v1,Center)))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(40,13,2,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. equal(add(cardinality(ObjectColors(objectOf(v1))),IntV 1),colorToInt(head(setToList(ObjectColors(objectOf(v1))))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(40,13,2,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. equal(add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV (-1)),cardinality(ObjectColors(objectOf(v1))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(39,11,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. equal(add(x(Anchor(v1,BR)),IntV 1),y(Anchor(head(objects(v0)),TL)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(39,11,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. equal(add(y(Anchor(head(objects(v0)),TL)),IntV (-1)),x(Anchor(v1,BR)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(40,13,2,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. equal(cardinality(ObjectColors(objectOf(v1))),add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV (-1)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(40,13,2,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. equal(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),add(cardinality(ObjectColors(objectOf(v1))),IntV 1))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(39,11,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. equal(x(Anchor(v1,BR)),add(y(Anchor(head(objects(v0)),TL)),IntV (-1)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(39,11,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. equal(y(Anchor(head(objects(v0)),TL)),add(x(Anchor(v1,BR)),IntV 1))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(41,11,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. equal(y(Anchor(v1,Center)),IntV 10)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(41,11,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. equal(y(Anchor(v1,Center)),IntV 10)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(41,11,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. equal(y(Anchor(v1,Center)),IntV 10)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(41,13,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. less(IntV 2,x(Anchor(v1,TL)))),tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(40,10,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. less(x(Anchor(v1,TL)),IntV 10)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(40,10,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. less(x(Anchor(v1,TL)),IntV 10)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(40,10,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. less(x(Anchor(v1,TL)),IntV 10)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(43,13,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. lessEqual(IntV 3,x(Anchor(v1,TL)))),tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(40,10,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. lessEqual(x(Anchor(v1,TL)),IntV 7)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(40,10,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. lessEqual(x(Anchor(v1,TL)),IntV 7)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(40,10,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. lessEqual(x(Anchor(v1,TL)),IntV 7)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(40,10,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. lessEqual(x(Anchor(v1,TL)),IntV 8)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(40,10,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. lessEqual(x(Anchor(v1,TL)),IntV 8)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(40,10,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. lessEqual(x(Anchor(v1,TL)),IntV 8)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(40,10,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. lessEqual(x(Anchor(v1,TL)),IntV 9)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(40,10,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. lessEqual(x(Anchor(v1,TL)),IntV 9)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(40,10,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. lessEqual(x(Anchor(v1,TL)),IntV 9)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(41,13,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(41,13,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(41,13,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(41,13,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(37,13,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(37,13,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(37,13,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(37,13,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(37,13,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(37,13,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(37,13,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(37,13,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(37,13,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(37,13,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(37,13,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(37,14,2,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),filter((lambda v1:PlacedT. equal(add(cardinality(ObjectCells(objectOf(v1))),IntV (-1)),x(Anchor(v1,TL)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(37,14,2,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),filter((lambda v1:PlacedT. equal(add(x(Anchor(v1,TL)),IntV 1),cardinality(ObjectCells(objectOf(v1))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(37,14,2,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),filter((lambda v1:PlacedT. equal(cardinality(ObjectCells(objectOf(v1))),add(x(Anchor(v1,TL)),IntV 1))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(37,14,2,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),filter((lambda v1:PlacedT. equal(x(Anchor(v1,TL)),add(cardinality(ObjectCells(objectOf(v1))),IntV (-1)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(42,13,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(42,13,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(42,13,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(42,13,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(43,14,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda __r1b0:PlacedT. equal(IntV 2,colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))))),sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(43,14,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda __r1b0:PlacedT. equal(IntV 2,colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))))),sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(43,14,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda __r1b0:PlacedT. equal(IntV 2,colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))))),sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(43,14,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda __r1b0:PlacedT. equal(IntV 2,colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))))),sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(43,14,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda __r1b0:PlacedT. equal(IntV 2,colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))))),sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(43,14,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda __r1b0:PlacedT. equal(IntV 2,colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))))),sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(43,14,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda __r1b0:PlacedT. equal(IntV 2,colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))))),sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(43,14,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda __r1b0:PlacedT. equal(colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))),IntV 2)),sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(43,14,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda __r1b0:PlacedT. equal(colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))),IntV 2)),sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(43,14,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda __r1b0:PlacedT. equal(colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))),IntV 2)),sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(43,14,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda __r1b0:PlacedT. equal(colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))),IntV 2)),sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(43,14,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda __r1b0:PlacedT. equal(colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))),IntV 2)),sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(43,14,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda __r1b0:PlacedT. equal(colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))),IntV 2)),sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(43,14,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda __r1b0:PlacedT. equal(colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))),IntV 2)),sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(42,13,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. equal(add(colorToInt(background(v0)),IntV 1),add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV (-1)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(42,13,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. equal(add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV (-1)),add(colorToInt(background(v0)),IntV 1))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(42,13,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(42,13,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(42,13,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(42,13,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(42,13,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(42,13,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(42,13,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(43,12,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda v1:PlacedT. equal(IntV 10,y(Anchor(v1,Center)))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(43,12,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda v1:PlacedT. equal(IntV 10,y(Anchor(v1,Center)))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(43,12,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda v1:PlacedT. equal(IntV 10,y(Anchor(v1,Center)))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(42,14,2,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda v1:PlacedT. equal(add(cardinality(ObjectColors(objectOf(v1))),IntV 1),colorToInt(head(setToList(ObjectColors(objectOf(v1))))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(42,14,2,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda v1:PlacedT. equal(add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV (-1)),cardinality(ObjectColors(objectOf(v1))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(41,12,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda v1:PlacedT. equal(add(x(Anchor(v1,BR)),IntV 1),y(Anchor(head(objects(v0)),TL)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(41,12,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda v1:PlacedT. equal(add(y(Anchor(head(objects(v0)),TL)),IntV (-1)),x(Anchor(v1,BR)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(42,14,2,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda v1:PlacedT. equal(cardinality(ObjectColors(objectOf(v1))),add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV (-1)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(42,14,2,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda v1:PlacedT. equal(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),add(cardinality(ObjectColors(objectOf(v1))),IntV 1))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(41,12,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda v1:PlacedT. equal(x(Anchor(v1,BR)),add(y(Anchor(head(objects(v0)),TL)),IntV (-1)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(41,12,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda v1:PlacedT. equal(y(Anchor(head(objects(v0)),TL)),add(x(Anchor(v1,BR)),IntV 1))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(43,12,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda v1:PlacedT. equal(y(Anchor(v1,Center)),IntV 10)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(43,12,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda v1:PlacedT. equal(y(Anchor(v1,Center)),IntV 10)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(43,12,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda v1:PlacedT. equal(y(Anchor(v1,Center)),IntV 10)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(43,14,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda v1:PlacedT. less(IntV 2,x(Anchor(v1,TL)))),tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(42,11,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda v1:PlacedT. less(x(Anchor(v1,TL)),IntV 10)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(42,11,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda v1:PlacedT. less(x(Anchor(v1,TL)),IntV 10)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(42,11,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda v1:PlacedT. less(x(Anchor(v1,TL)),IntV 10)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(45,14,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda v1:PlacedT. lessEqual(IntV 3,x(Anchor(v1,TL)))),tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(42,11,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda v1:PlacedT. lessEqual(x(Anchor(v1,TL)),IntV 7)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(42,11,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda v1:PlacedT. lessEqual(x(Anchor(v1,TL)),IntV 7)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(42,11,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda v1:PlacedT. lessEqual(x(Anchor(v1,TL)),IntV 7)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(42,11,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda v1:PlacedT. lessEqual(x(Anchor(v1,TL)),IntV 8)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(42,11,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda v1:PlacedT. lessEqual(x(Anchor(v1,TL)),IntV 8)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(42,11,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda v1:PlacedT. lessEqual(x(Anchor(v1,TL)),IntV 8)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(42,11,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda v1:PlacedT. lessEqual(x(Anchor(v1,TL)),IntV 9)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(42,11,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda v1:PlacedT. lessEqual(x(Anchor(v1,TL)),IntV 9)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(42,11,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda v1:PlacedT. lessEqual(x(Anchor(v1,TL)),IntV 9)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(38,13,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(38,13,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(38,13,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(38,13,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(38,13,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(38,13,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(38,13,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(39,12,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. equal(IntV 10,y(Anchor(v1,Center)))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(39,12,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. equal(IntV 10,y(Anchor(v1,Center)))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(39,12,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. equal(IntV 10,y(Anchor(v1,Center)))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(38,14,2,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. equal(add(cardinality(ObjectColors(objectOf(v1))),IntV 1),colorToInt(head(setToList(ObjectColors(objectOf(v1))))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(38,14,2,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. equal(add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV (-1)),cardinality(ObjectColors(objectOf(v1))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(37,12,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. equal(add(x(Anchor(v1,BR)),IntV 1),y(Anchor(head(objects(v0)),TL)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(37,12,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. equal(add(y(Anchor(head(objects(v0)),TL)),IntV (-1)),x(Anchor(v1,BR)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(38,14,2,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. equal(cardinality(ObjectColors(objectOf(v1))),add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV (-1)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(38,14,2,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. equal(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),add(cardinality(ObjectColors(objectOf(v1))),IntV 1))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(37,12,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. equal(x(Anchor(v1,BR)),add(y(Anchor(head(objects(v0)),TL)),IntV (-1)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(37,12,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. equal(y(Anchor(head(objects(v0)),TL)),add(x(Anchor(v1,BR)),IntV 1))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(39,12,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. equal(y(Anchor(v1,Center)),IntV 10)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(39,12,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. equal(y(Anchor(v1,Center)),IntV 10)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(39,12,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. equal(y(Anchor(v1,Center)),IntV 10)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(39,14,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. less(IntV 2,x(Anchor(v1,TL)))),tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(38,11,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. less(x(Anchor(v1,TL)),IntV 10)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(38,11,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. less(x(Anchor(v1,TL)),IntV 10)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(38,11,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. less(x(Anchor(v1,TL)),IntV 10)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(41,14,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. lessEqual(IntV 3,x(Anchor(v1,TL)))),tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(38,11,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. lessEqual(x(Anchor(v1,TL)),IntV 7)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(38,11,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. lessEqual(x(Anchor(v1,TL)),IntV 7)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(38,11,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. lessEqual(x(Anchor(v1,TL)),IntV 7)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(38,11,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. lessEqual(x(Anchor(v1,TL)),IntV 8)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(38,11,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. lessEqual(x(Anchor(v1,TL)),IntV 8)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(38,11,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. lessEqual(x(Anchor(v1,TL)),IntV 8)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(38,11,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. lessEqual(x(Anchor(v1,TL)),IntV 9)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(38,11,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. lessEqual(x(Anchor(v1,TL)),IntV 9)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(38,11,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. lessEqual(x(Anchor(v1,TL)),IntV 9)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(39,14,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(39,14,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(39,14,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(39,14,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(45,15,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda __r1b0:PlacedT. equal(IntV 2,colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))))),tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(45,15,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda __r1b0:PlacedT. equal(IntV 2,colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(45,15,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda __r1b0:PlacedT. equal(IntV 2,colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(45,15,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda __r1b0:PlacedT. equal(IntV 2,colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(45,15,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda __r1b0:PlacedT. equal(colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))),IntV 2)),tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(45,15,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda __r1b0:PlacedT. equal(colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))),IntV 2)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(45,15,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda __r1b0:PlacedT. equal(colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))),IntV 2)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(45,15,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda __r1b0:PlacedT. equal(colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))),IntV 2)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(43,11,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. equal(IntV 10,y(Anchor(v1,Center)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(44,12,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. equal(IntV 11,add(y(Anchor(v1,Center)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(44,12,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. equal(IntV 11,add(y(Anchor(v1,Center)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(44,12,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. equal(IntV 11,add(y(Anchor(v1,Center)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(44,12,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. equal(IntV 9,add(y(Anchor(v1,Center)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(44,12,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. equal(IntV 9,add(y(Anchor(v1,Center)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(44,12,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. equal(IntV 9,add(y(Anchor(v1,Center)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(43,13,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. equal(add(cardinality(ObjectColors(objectOf(head(objects(v0))))),IntV 1),colorToInt(head(setToList(ObjectColors(objectOf(v1))))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(43,14,2,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. equal(add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV (-1)),add(x(coord(IntV 0,IntV 0)),IntV 1))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(43,14,2,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. equal(add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV (-1)),add(y(coord(IntV 0,IntV 0)),IntV 1))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(43,13,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. equal(add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV (-1)),cardinality(ObjectColors(objectOf(head(objects(v0))))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(41,11,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. equal(add(x(Anchor(v1,BR)),IntV 1),add(y(Anchor(head(objects(v0)),Center)),IntV (-1)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(41,11,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. equal(add(x(Anchor(v1,Center)),IntV 1),add(y(Anchor(head(objects(v0)),TL)),IntV (-1)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(43,14,2,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. equal(add(x(coord(IntV 0,IntV 0)),IntV 1),add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV (-1)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(41,11,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. equal(add(y(Anchor(head(objects(v0)),Center)),IntV (-1)),add(x(Anchor(v1,BR)),IntV 1))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(41,11,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. equal(add(y(Anchor(head(objects(v0)),TL)),IntV (-1)),add(x(Anchor(v1,Center)),IntV 1))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(44,12,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. equal(add(y(Anchor(v1,Center)),IntV (-1)),IntV 9)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(44,12,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. equal(add(y(Anchor(v1,Center)),IntV (-1)),IntV 9)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(44,12,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. equal(add(y(Anchor(v1,Center)),IntV (-1)),IntV 9)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(44,12,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. equal(add(y(Anchor(v1,Center)),IntV 1),IntV 11)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(44,12,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. equal(add(y(Anchor(v1,Center)),IntV 1),IntV 11)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(44,12,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. equal(add(y(Anchor(v1,Center)),IntV 1),IntV 11)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(43,14,2,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. equal(add(y(coord(IntV 0,IntV 0)),IntV 1),add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV (-1)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(43,13,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. equal(cardinality(ObjectColors(objectOf(head(objects(v0))))),add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV (-1)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(43,13,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. equal(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),add(cardinality(ObjectColors(objectOf(head(objects(v0))))),IntV 1))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(43,11,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. equal(y(Anchor(v1,Center)),IntV 10)),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(44,14,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. less(IntV 1,add(x(Anchor(v1,TL)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(44,14,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. less(IntV 2,add(x(Anchor(v1,Center)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(44,14,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. less(IntV 2,add(x(Anchor(v1,TL)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(41,11,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. less(IntV 2,x(Anchor(v1,TL)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(41,11,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. less(IntV 2,x(Anchor(v1,TL)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(41,11,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. less(IntV 2,x(Anchor(v1,TL)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(43,11,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. less(add(x(Anchor(v1,TL)),IntV (-1)),IntV 7)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(43,11,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. less(add(x(Anchor(v1,TL)),IntV (-1)),IntV 7)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(43,11,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. less(add(x(Anchor(v1,TL)),IntV (-1)),IntV 7)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(43,11,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. less(add(x(Anchor(v1,TL)),IntV (-1)),IntV 8)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(43,11,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. less(add(x(Anchor(v1,TL)),IntV (-1)),IntV 8)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(43,11,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. less(add(x(Anchor(v1,TL)),IntV (-1)),IntV 8)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(43,11,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. less(add(x(Anchor(v1,TL)),IntV (-1)),IntV 9)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(43,11,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. less(add(x(Anchor(v1,TL)),IntV (-1)),IntV 9)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(43,11,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. less(add(x(Anchor(v1,TL)),IntV (-1)),IntV 9)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(47,15,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. less(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 3)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(47,15,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. less(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 3)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(47,15,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. less(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 3)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(44,14,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. lessEqual(IntV 2,add(x(Anchor(v1,TL)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(46,14,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. lessEqual(IntV 3,add(x(Anchor(v1,Center)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(46,14,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. lessEqual(IntV 3,add(x(Anchor(v1,TL)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(43,11,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. lessEqual(IntV 3,x(Anchor(v1,TL)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(43,11,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. lessEqual(IntV 3,x(Anchor(v1,TL)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(43,11,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. lessEqual(IntV 3,x(Anchor(v1,TL)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(43,11,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. lessEqual(add(x(Anchor(v1,TL)),IntV (-1)),IntV 6)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(43,11,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. lessEqual(add(x(Anchor(v1,TL)),IntV (-1)),IntV 6)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(43,11,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. lessEqual(add(x(Anchor(v1,TL)),IntV (-1)),IntV 6)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(43,11,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. lessEqual(add(x(Anchor(v1,TL)),IntV (-1)),IntV 7)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(43,11,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. lessEqual(add(x(Anchor(v1,TL)),IntV (-1)),IntV 7)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(43,11,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. lessEqual(add(x(Anchor(v1,TL)),IntV (-1)),IntV 7)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(43,11,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. lessEqual(add(x(Anchor(v1,TL)),IntV (-1)),IntV 8)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(43,11,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. lessEqual(add(x(Anchor(v1,TL)),IntV (-1)),IntV 8)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(43,11,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. lessEqual(add(x(Anchor(v1,TL)),IntV (-1)),IntV 8)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(45,15,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. lessEqual(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 2)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(45,15,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. lessEqual(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 2)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(45,15,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. lessEqual(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 2)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(44,14,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(44,14,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(44,14,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(44,14,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(45,15,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda __r1b0:PlacedT. equal(IntV 2,colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))))),sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(45,15,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda __r1b0:PlacedT. equal(IntV 2,colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))))),sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(45,15,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda __r1b0:PlacedT. equal(IntV 2,colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))))),sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(45,15,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda __r1b0:PlacedT. equal(IntV 2,colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))))),sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(45,15,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda __r1b0:PlacedT. equal(IntV 2,colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))))),sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(45,15,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda __r1b0:PlacedT. equal(IntV 2,colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))))),sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(45,15,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda __r1b0:PlacedT. equal(IntV 2,colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))))),sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(45,15,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda __r1b0:PlacedT. equal(colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))),IntV 2)),sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(45,15,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda __r1b0:PlacedT. equal(colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))),IntV 2)),sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(45,15,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda __r1b0:PlacedT. equal(colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))),IntV 2)),sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(45,15,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda __r1b0:PlacedT. equal(colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))),IntV 2)),sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(45,15,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda __r1b0:PlacedT. equal(colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))),IntV 2)),sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(45,15,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda __r1b0:PlacedT. equal(colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))),IntV 2)),sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(45,15,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda __r1b0:PlacedT. equal(colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))),IntV 2)),sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(43,13,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda v1:PlacedT. equal(add(colorToInt(background(v0)),IntV 1),add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV (-1)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(43,13,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda v1:PlacedT. equal(add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV (-1)),add(colorToInt(background(v0)),IntV 1))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(40,14,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(40,14,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(40,14,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(40,14,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(41,15,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda __r1b0:PlacedT. equal(IntV 2,colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))))),sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(41,15,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda __r1b0:PlacedT. equal(IntV 2,colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))))),sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(41,15,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda __r1b0:PlacedT. equal(IntV 2,colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))))),sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(41,15,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda __r1b0:PlacedT. equal(IntV 2,colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))))),sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(41,15,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda __r1b0:PlacedT. equal(IntV 2,colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))))),sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(41,15,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda __r1b0:PlacedT. equal(IntV 2,colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))))),sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(41,15,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda __r1b0:PlacedT. equal(IntV 2,colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))))),sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(41,15,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda __r1b0:PlacedT. equal(colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))),IntV 2)),sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(41,15,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda __r1b0:PlacedT. equal(colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))),IntV 2)),sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(41,15,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda __r1b0:PlacedT. equal(colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))),IntV 2)),sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(41,15,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda __r1b0:PlacedT. equal(colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))),IntV 2)),sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(41,15,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda __r1b0:PlacedT. equal(colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))),IntV 2)),sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(41,15,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda __r1b0:PlacedT. equal(colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))),IntV 2)),sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(41,15,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda __r1b0:PlacedT. equal(colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))),IntV 2)),sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(40,14,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. equal(add(colorToInt(background(v0)),IntV 1),add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV (-1)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(40,14,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. equal(add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV (-1)),add(colorToInt(background(v0)),IntV 1))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(40,14,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(40,14,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(40,14,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(40,14,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(40,14,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(40,14,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(40,14,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(41,13,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),filter((lambda v1:PlacedT. equal(IntV 10,y(Anchor(v1,Center)))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(41,13,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),filter((lambda v1:PlacedT. equal(IntV 10,y(Anchor(v1,Center)))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(41,13,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),filter((lambda v1:PlacedT. equal(IntV 10,y(Anchor(v1,Center)))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(40,15,2,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),filter((lambda v1:PlacedT. equal(add(cardinality(ObjectColors(objectOf(v1))),IntV 1),colorToInt(head(setToList(ObjectColors(objectOf(v1))))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(40,15,2,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),filter((lambda v1:PlacedT. equal(add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV (-1)),cardinality(ObjectColors(objectOf(v1))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(39,13,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),filter((lambda v1:PlacedT. equal(add(x(Anchor(v1,BR)),IntV 1),y(Anchor(head(objects(v0)),TL)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(39,13,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),filter((lambda v1:PlacedT. equal(add(y(Anchor(head(objects(v0)),TL)),IntV (-1)),x(Anchor(v1,BR)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(40,15,2,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),filter((lambda v1:PlacedT. equal(cardinality(ObjectColors(objectOf(v1))),add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV (-1)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(40,15,2,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),filter((lambda v1:PlacedT. equal(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),add(cardinality(ObjectColors(objectOf(v1))),IntV 1))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(39,13,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),filter((lambda v1:PlacedT. equal(x(Anchor(v1,BR)),add(y(Anchor(head(objects(v0)),TL)),IntV (-1)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(39,13,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),filter((lambda v1:PlacedT. equal(y(Anchor(head(objects(v0)),TL)),add(x(Anchor(v1,BR)),IntV 1))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(41,13,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),filter((lambda v1:PlacedT. equal(y(Anchor(v1,Center)),IntV 10)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(41,13,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),filter((lambda v1:PlacedT. equal(y(Anchor(v1,Center)),IntV 10)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(41,13,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),filter((lambda v1:PlacedT. equal(y(Anchor(v1,Center)),IntV 10)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(41,15,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),filter((lambda v1:PlacedT. less(IntV 2,x(Anchor(v1,TL)))),tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(40,12,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),filter((lambda v1:PlacedT. less(x(Anchor(v1,TL)),IntV 10)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(40,12,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),filter((lambda v1:PlacedT. less(x(Anchor(v1,TL)),IntV 10)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(40,12,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),filter((lambda v1:PlacedT. less(x(Anchor(v1,TL)),IntV 10)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(43,15,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),filter((lambda v1:PlacedT. lessEqual(IntV 3,x(Anchor(v1,TL)))),tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(40,12,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),filter((lambda v1:PlacedT. lessEqual(x(Anchor(v1,TL)),IntV 7)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(40,12,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),filter((lambda v1:PlacedT. lessEqual(x(Anchor(v1,TL)),IntV 7)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(40,12,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),filter((lambda v1:PlacedT. lessEqual(x(Anchor(v1,TL)),IntV 7)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(40,12,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),filter((lambda v1:PlacedT. lessEqual(x(Anchor(v1,TL)),IntV 8)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(40,12,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),filter((lambda v1:PlacedT. lessEqual(x(Anchor(v1,TL)),IntV 8)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(40,12,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),filter((lambda v1:PlacedT. lessEqual(x(Anchor(v1,TL)),IntV 8)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(40,12,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),filter((lambda v1:PlacedT. lessEqual(x(Anchor(v1,TL)),IntV 9)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(40,12,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),filter((lambda v1:PlacedT. lessEqual(x(Anchor(v1,TL)),IntV 9)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(40,12,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),filter((lambda v1:PlacedT. lessEqual(x(Anchor(v1,TL)),IntV 9)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(46,15,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda __r1b0:PlacedT. equal(IntV 1,add(colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))),IntV (-1)))),sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(46,15,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda __r1b0:PlacedT. equal(IntV 1,add(colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))),IntV (-1)))),sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(46,15,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda __r1b0:PlacedT. equal(IntV 1,add(colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))),IntV (-1)))),sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(46,15,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda __r1b0:PlacedT. equal(IntV 1,add(colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))),IntV (-1)))),sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(46,15,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda __r1b0:PlacedT. equal(IntV 1,add(colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))),IntV (-1)))),sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(46,15,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda __r1b0:PlacedT. equal(IntV 1,add(colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))),IntV (-1)))),sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(46,15,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda __r1b0:PlacedT. equal(IntV 1,add(colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))),IntV (-1)))),sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(46,15,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda __r1b0:PlacedT. equal(IntV 2,colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))))),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(46,15,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda __r1b0:PlacedT. equal(IntV 2,colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))))),sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(46,15,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda __r1b0:PlacedT. equal(IntV 2,colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))))),sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(46,15,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda __r1b0:PlacedT. equal(IntV 2,colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))))),sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(46,15,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda __r1b0:PlacedT. equal(IntV 2,colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))))),sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(46,15,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda __r1b0:PlacedT. equal(IntV 2,colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))))),sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(46,15,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda __r1b0:PlacedT. equal(IntV 2,colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))))),sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(48,15,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda __r1b0:PlacedT. equal(IntV 3,add(colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))),IntV 1))),sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(48,15,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda __r1b0:PlacedT. equal(IntV 3,add(colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))),IntV 1))),sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(48,15,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda __r1b0:PlacedT. equal(IntV 3,add(colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))),IntV 1))),sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(48,15,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda __r1b0:PlacedT. equal(IntV 3,add(colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))),IntV 1))),sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(48,15,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda __r1b0:PlacedT. equal(IntV 3,add(colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))),IntV 1))),sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(48,15,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda __r1b0:PlacedT. equal(IntV 3,add(colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))),IntV 1))),sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(48,15,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda __r1b0:PlacedT. equal(IntV 3,add(colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))),IntV 1))),sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(46,15,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda __r1b0:PlacedT. equal(add(colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))),IntV (-1)),IntV 1)),sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(46,15,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda __r1b0:PlacedT. equal(add(colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))),IntV (-1)),IntV 1)),sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(46,15,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda __r1b0:PlacedT. equal(add(colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))),IntV (-1)),IntV 1)),sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(46,15,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda __r1b0:PlacedT. equal(add(colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))),IntV (-1)),IntV 1)),sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(46,15,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda __r1b0:PlacedT. equal(add(colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))),IntV (-1)),IntV 1)),sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(46,15,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda __r1b0:PlacedT. equal(add(colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))),IntV (-1)),IntV 1)),sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(46,15,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda __r1b0:PlacedT. equal(add(colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))),IntV (-1)),IntV 1)),sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(46,15,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda __r1b0:PlacedT. equal(colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))),IntV 2)),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(46,15,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda __r1b0:PlacedT. equal(colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))),IntV 2)),sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(46,15,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda __r1b0:PlacedT. equal(colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))),IntV 2)),sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(46,15,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda __r1b0:PlacedT. equal(colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))),IntV 2)),sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(46,15,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda __r1b0:PlacedT. equal(colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))),IntV 2)),sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,BR)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(46,15,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda __r1b0:PlacedT. equal(colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))),IntV 2)),sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(46,15,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda __r1b0:PlacedT. equal(colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))),IntV 2)),sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(45,14,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. equal(add(cardinality(ObjectColors(objectOf(head(tail(objects(v0)))))),IntV 1),colorToInt(head(setToList(ObjectColors(objectOf(v1))))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(45,14,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. equal(add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV (-1)),cardinality(ObjectColors(objectOf(head(tail(objects(v0)))))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(48,15,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. equal(add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 1),IntV 3)),sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(48,15,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. equal(add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 1),IntV 3)),sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(48,15,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. equal(add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 1),IntV 3)),sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(48,15,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. equal(add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 1),IntV 3)),sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(48,15,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. equal(add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 1),IntV 3)),sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(48,15,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. equal(add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 1),IntV 3)),sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(48,15,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. equal(add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 1),IntV 3)),sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(43,12,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. equal(add(x(Anchor(v1,BR)),IntV 1),add(y(Anchor(head(tail(objects(v0))),TL)),IntV (-1)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(43,12,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. equal(add(y(Anchor(head(tail(objects(v0))),TL)),IntV (-1)),add(x(Anchor(v1,BR)),IntV 1))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(45,14,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. equal(cardinality(ObjectColors(objectOf(head(tail(objects(v0)))))),add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV (-1)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(45,14,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. equal(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),add(cardinality(ObjectColors(objectOf(head(tail(objects(v0)))))),IntV 1))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(44,13,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. less(x(Anchor(v1,TL)),cardinality(ObjectCells(objectOf(v1))))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(44,13,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. less(x(Anchor(v1,TL)),cardinality(ObjectCells(objectOf(v1))))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(44,13,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. less(x(Anchor(v1,TL)),cardinality(ObjectCells(objectOf(v1))))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(42,11,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. less(x(Anchor(v1,TL)),y(Anchor(v1,Center)))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(42,11,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. less(x(Anchor(v1,TL)),y(Anchor(v1,Center)))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(42,11,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. less(x(Anchor(v1,TL)),y(Anchor(v1,Center)))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(42,11,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. less(x(Anchor(v1,TL)),y(Anchor(v1,TL)))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(42,11,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. less(x(Anchor(v1,TL)),y(Anchor(v1,TL)))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(42,11,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. less(x(Anchor(v1,TL)),y(Anchor(v1,TL)))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(44,13,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. lessEqual(x(Anchor(v1,TL)),cardinality(ObjectCells(objectOf(v1))))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(44,13,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. lessEqual(x(Anchor(v1,TL)),cardinality(ObjectCells(objectOf(v1))))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(44,13,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. lessEqual(x(Anchor(v1,TL)),cardinality(ObjectCells(objectOf(v1))))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(42,11,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. lessEqual(x(Anchor(v1,TL)),y(Anchor(v1,Center)))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(42,11,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. lessEqual(x(Anchor(v1,TL)),y(Anchor(v1,Center)))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(42,11,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. lessEqual(x(Anchor(v1,TL)),y(Anchor(v1,Center)))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(42,11,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. lessEqual(x(Anchor(v1,TL)),y(Anchor(v1,TL)))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(42,11,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. lessEqual(x(Anchor(v1,TL)),y(Anchor(v1,TL)))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(42,11,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda v1:PlacedT. lessEqual(x(Anchor(v1,TL)),y(Anchor(v1,TL)))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(47,16,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda __r1b0:PlacedT. equal(IntV 2,colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))))),tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(47,16,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda __r1b0:PlacedT. equal(IntV 2,colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(47,16,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda __r1b0:PlacedT. equal(IntV 2,colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(47,16,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda __r1b0:PlacedT. equal(IntV 2,colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(47,16,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda __r1b0:PlacedT. equal(colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))),IntV 2)),tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(47,16,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda __r1b0:PlacedT. equal(colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))),IntV 2)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(47,16,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda __r1b0:PlacedT. equal(colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))),IntV 2)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(47,16,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda __r1b0:PlacedT. equal(colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))),IntV 2)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(45,12,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda v1:PlacedT. equal(IntV 10,y(Anchor(v1,Center)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(46,13,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda v1:PlacedT. equal(IntV 11,add(y(Anchor(v1,Center)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(46,13,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda v1:PlacedT. equal(IntV 11,add(y(Anchor(v1,Center)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(46,13,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda v1:PlacedT. equal(IntV 11,add(y(Anchor(v1,Center)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(46,13,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda v1:PlacedT. equal(IntV 9,add(y(Anchor(v1,Center)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(46,13,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda v1:PlacedT. equal(IntV 9,add(y(Anchor(v1,Center)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(46,13,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda v1:PlacedT. equal(IntV 9,add(y(Anchor(v1,Center)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(45,14,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda v1:PlacedT. equal(add(cardinality(ObjectColors(objectOf(head(objects(v0))))),IntV 1),colorToInt(head(setToList(ObjectColors(objectOf(v1))))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(45,15,2,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda v1:PlacedT. equal(add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV (-1)),add(x(coord(IntV 0,IntV 0)),IntV 1))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(45,15,2,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda v1:PlacedT. equal(add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV (-1)),add(y(coord(IntV 0,IntV 0)),IntV 1))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(45,14,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda v1:PlacedT. equal(add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV (-1)),cardinality(ObjectColors(objectOf(head(objects(v0))))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(43,12,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda v1:PlacedT. equal(add(x(Anchor(v1,BR)),IntV 1),add(y(Anchor(head(objects(v0)),Center)),IntV (-1)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(43,12,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda v1:PlacedT. equal(add(x(Anchor(v1,Center)),IntV 1),add(y(Anchor(head(objects(v0)),TL)),IntV (-1)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(45,15,2,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda v1:PlacedT. equal(add(x(coord(IntV 0,IntV 0)),IntV 1),add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV (-1)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(43,12,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda v1:PlacedT. equal(add(y(Anchor(head(objects(v0)),Center)),IntV (-1)),add(x(Anchor(v1,BR)),IntV 1))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(43,12,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda v1:PlacedT. equal(add(y(Anchor(head(objects(v0)),TL)),IntV (-1)),add(x(Anchor(v1,Center)),IntV 1))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(46,13,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda v1:PlacedT. equal(add(y(Anchor(v1,Center)),IntV (-1)),IntV 9)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(46,13,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda v1:PlacedT. equal(add(y(Anchor(v1,Center)),IntV (-1)),IntV 9)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(46,13,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda v1:PlacedT. equal(add(y(Anchor(v1,Center)),IntV (-1)),IntV 9)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(46,13,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda v1:PlacedT. equal(add(y(Anchor(v1,Center)),IntV 1),IntV 11)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(46,13,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda v1:PlacedT. equal(add(y(Anchor(v1,Center)),IntV 1),IntV 11)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(46,13,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda v1:PlacedT. equal(add(y(Anchor(v1,Center)),IntV 1),IntV 11)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(45,15,2,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda v1:PlacedT. equal(add(y(coord(IntV 0,IntV 0)),IntV 1),add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV (-1)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(45,14,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda v1:PlacedT. equal(cardinality(ObjectColors(objectOf(head(objects(v0))))),add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV (-1)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(45,14,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda v1:PlacedT. equal(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),add(cardinality(ObjectColors(objectOf(head(objects(v0))))),IntV 1))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(45,12,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda v1:PlacedT. equal(y(Anchor(v1,Center)),IntV 10)),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(46,15,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda v1:PlacedT. less(IntV 1,add(x(Anchor(v1,TL)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(46,15,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda v1:PlacedT. less(IntV 2,add(x(Anchor(v1,Center)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(46,15,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda v1:PlacedT. less(IntV 2,add(x(Anchor(v1,TL)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(43,12,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda v1:PlacedT. less(IntV 2,x(Anchor(v1,TL)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(43,12,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda v1:PlacedT. less(IntV 2,x(Anchor(v1,TL)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(43,12,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda v1:PlacedT. less(IntV 2,x(Anchor(v1,TL)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(45,12,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda v1:PlacedT. less(add(x(Anchor(v1,TL)),IntV (-1)),IntV 7)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(45,12,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda v1:PlacedT. less(add(x(Anchor(v1,TL)),IntV (-1)),IntV 7)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(45,12,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda v1:PlacedT. less(add(x(Anchor(v1,TL)),IntV (-1)),IntV 7)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(45,12,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda v1:PlacedT. less(add(x(Anchor(v1,TL)),IntV (-1)),IntV 8)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(45,12,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda v1:PlacedT. less(add(x(Anchor(v1,TL)),IntV (-1)),IntV 8)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(45,12,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda v1:PlacedT. less(add(x(Anchor(v1,TL)),IntV (-1)),IntV 8)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(45,12,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda v1:PlacedT. less(add(x(Anchor(v1,TL)),IntV (-1)),IntV 9)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(45,12,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda v1:PlacedT. less(add(x(Anchor(v1,TL)),IntV (-1)),IntV 9)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(45,12,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda v1:PlacedT. less(add(x(Anchor(v1,TL)),IntV (-1)),IntV 9)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,16,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda v1:PlacedT. less(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 3)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,16,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda v1:PlacedT. less(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 3)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(49,16,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda v1:PlacedT. less(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 3)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(46,15,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda v1:PlacedT. lessEqual(IntV 2,add(x(Anchor(v1,TL)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(48,15,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda v1:PlacedT. lessEqual(IntV 3,add(x(Anchor(v1,Center)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(48,15,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda v1:PlacedT. lessEqual(IntV 3,add(x(Anchor(v1,TL)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(45,12,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda v1:PlacedT. lessEqual(IntV 3,x(Anchor(v1,TL)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(45,12,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda v1:PlacedT. lessEqual(IntV 3,x(Anchor(v1,TL)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(45,12,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda v1:PlacedT. lessEqual(IntV 3,x(Anchor(v1,TL)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(45,12,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda v1:PlacedT. lessEqual(add(x(Anchor(v1,TL)),IntV (-1)),IntV 6)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(45,12,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda v1:PlacedT. lessEqual(add(x(Anchor(v1,TL)),IntV (-1)),IntV 6)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(45,12,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda v1:PlacedT. lessEqual(add(x(Anchor(v1,TL)),IntV (-1)),IntV 6)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(45,12,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda v1:PlacedT. lessEqual(add(x(Anchor(v1,TL)),IntV (-1)),IntV 7)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(45,12,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda v1:PlacedT. lessEqual(add(x(Anchor(v1,TL)),IntV (-1)),IntV 7)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(45,12,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda v1:PlacedT. lessEqual(add(x(Anchor(v1,TL)),IntV (-1)),IntV 7)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(45,12,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda v1:PlacedT. lessEqual(add(x(Anchor(v1,TL)),IntV (-1)),IntV 8)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(45,12,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda v1:PlacedT. lessEqual(add(x(Anchor(v1,TL)),IntV (-1)),IntV 8)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(45,12,3,3,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda v1:PlacedT. lessEqual(add(x(Anchor(v1,TL)),IntV (-1)),IntV 8)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(47,16,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda v1:PlacedT. lessEqual(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 2)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(47,16,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda v1:PlacedT. lessEqual(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 2)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(47,16,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),background(v0),filter((lambda v1:PlacedT. lessEqual(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 2)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(43,16,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda __r1b0:PlacedT. equal(IntV 2,colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))))),tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(43,16,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda __r1b0:PlacedT. equal(IntV 2,colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(43,16,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda __r1b0:PlacedT. equal(IntV 2,colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(43,16,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda __r1b0:PlacedT. equal(IntV 2,colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(43,16,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda __r1b0:PlacedT. equal(colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))),IntV 2)),tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(43,16,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda __r1b0:PlacedT. equal(colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))),IntV 2)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(43,16,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda __r1b0:PlacedT. equal(colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))),IntV 2)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(43,16,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda __r1b0:PlacedT. equal(colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))),IntV 2)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(41,12,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. equal(IntV 10,y(Anchor(v1,Center)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(42,13,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. equal(IntV 11,add(y(Anchor(v1,Center)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(42,13,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. equal(IntV 11,add(y(Anchor(v1,Center)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(42,13,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. equal(IntV 11,add(y(Anchor(v1,Center)),IntV 1))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(42,13,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. equal(IntV 9,add(y(Anchor(v1,Center)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(42,13,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. equal(IntV 9,add(y(Anchor(v1,Center)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(42,13,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. equal(IntV 9,add(y(Anchor(v1,Center)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(41,14,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. equal(add(cardinality(ObjectColors(objectOf(head(objects(v0))))),IntV 1),colorToInt(head(setToList(ObjectColors(objectOf(v1))))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(41,15,2,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. equal(add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV (-1)),add(x(coord(IntV 0,IntV 0)),IntV 1))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(41,15,2,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. equal(add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV (-1)),add(y(coord(IntV 0,IntV 0)),IntV 1))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(41,14,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. equal(add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV (-1)),cardinality(ObjectColors(objectOf(head(objects(v0))))))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(39,12,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. equal(add(x(Anchor(v1,BR)),IntV 1),add(y(Anchor(head(objects(v0)),Center)),IntV (-1)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(39,12,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. equal(add(x(Anchor(v1,Center)),IntV 1),add(y(Anchor(head(objects(v0)),TL)),IntV (-1)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(41,15,2,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. equal(add(x(coord(IntV 0,IntV 0)),IntV 1),add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV (-1)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(39,12,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. equal(add(y(Anchor(head(objects(v0)),Center)),IntV (-1)),add(x(Anchor(v1,BR)),IntV 1))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(39,12,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. equal(add(y(Anchor(head(objects(v0)),TL)),IntV (-1)),add(x(Anchor(v1,Center)),IntV 1))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(42,13,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. equal(add(y(Anchor(v1,Center)),IntV (-1)),IntV 9)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(42,13,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. equal(add(y(Anchor(v1,Center)),IntV (-1)),IntV 9)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(42,13,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. equal(add(y(Anchor(v1,Center)),IntV (-1)),IntV 9)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(42,13,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. equal(add(y(Anchor(v1,Center)),IntV 1),IntV 11)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(42,13,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. equal(add(y(Anchor(v1,Center)),IntV 1),IntV 11)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(42,13,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. equal(add(y(Anchor(v1,Center)),IntV 1),IntV 11)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(41,15,2,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. equal(add(y(coord(IntV 0,IntV 0)),IntV 1),add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV (-1)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(41,14,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. equal(cardinality(ObjectColors(objectOf(head(objects(v0))))),add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV (-1)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(41,14,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. equal(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),add(cardinality(ObjectColors(objectOf(head(objects(v0))))),IntV 1))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(41,12,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. equal(y(Anchor(v1,Center)),IntV 10)),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(42,15,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. less(IntV 1,add(x(Anchor(v1,TL)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(42,15,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. less(IntV 2,add(x(Anchor(v1,Center)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(42,15,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. less(IntV 2,add(x(Anchor(v1,TL)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(39,12,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. less(IntV 2,x(Anchor(v1,TL)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(39,12,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. less(IntV 2,x(Anchor(v1,TL)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(39,12,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. less(IntV 2,x(Anchor(v1,TL)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(41,12,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. less(add(x(Anchor(v1,TL)),IntV (-1)),IntV 7)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(41,12,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. less(add(x(Anchor(v1,TL)),IntV (-1)),IntV 7)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(41,12,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. less(add(x(Anchor(v1,TL)),IntV (-1)),IntV 7)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(41,12,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. less(add(x(Anchor(v1,TL)),IntV (-1)),IntV 8)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(41,12,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. less(add(x(Anchor(v1,TL)),IntV (-1)),IntV 8)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(41,12,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. less(add(x(Anchor(v1,TL)),IntV (-1)),IntV 8)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(41,12,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. less(add(x(Anchor(v1,TL)),IntV (-1)),IntV 9)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(41,12,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. less(add(x(Anchor(v1,TL)),IntV (-1)),IntV 9)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(41,12,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. less(add(x(Anchor(v1,TL)),IntV (-1)),IntV 9)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(45,16,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. less(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 3)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(45,16,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. less(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 3)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(45,16,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. less(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 3)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(42,15,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. lessEqual(IntV 2,add(x(Anchor(v1,TL)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(44,15,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. lessEqual(IntV 3,add(x(Anchor(v1,Center)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(44,15,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. lessEqual(IntV 3,add(x(Anchor(v1,TL)),IntV (-1)))),tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(41,12,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. lessEqual(IntV 3,x(Anchor(v1,TL)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(41,12,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. lessEqual(IntV 3,x(Anchor(v1,TL)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(41,12,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. lessEqual(IntV 3,x(Anchor(v1,TL)))),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(41,12,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. lessEqual(add(x(Anchor(v1,TL)),IntV (-1)),IntV 6)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(41,12,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. lessEqual(add(x(Anchor(v1,TL)),IntV (-1)),IntV 6)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(41,12,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. lessEqual(add(x(Anchor(v1,TL)),IntV (-1)),IntV 6)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(41,12,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. lessEqual(add(x(Anchor(v1,TL)),IntV (-1)),IntV 7)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(41,12,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. lessEqual(add(x(Anchor(v1,TL)),IntV (-1)),IntV 7)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(41,12,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. lessEqual(add(x(Anchor(v1,TL)),IntV (-1)),IntV 7)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(41,12,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. lessEqual(add(x(Anchor(v1,TL)),IntV (-1)),IntV 8)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(41,12,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. lessEqual(add(x(Anchor(v1,TL)),IntV (-1)),IntV 8)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(41,12,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. lessEqual(add(x(Anchor(v1,TL)),IntV (-1)),IntV 8)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(43,16,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. lessEqual(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 2)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(43,16,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. lessEqual(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 2)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(43,16,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda v1:PlacedT. lessEqual(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV 2)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(42,15,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,BR)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(42,15,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(42,15,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(42,15,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(43,16,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),filter((lambda __r1b0:PlacedT. equal(IntV 2,colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))))),sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(43,16,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),filter((lambda __r1b0:PlacedT. equal(IntV 2,colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))))),sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(43,16,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),filter((lambda __r1b0:PlacedT. equal(IntV 2,colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))))),sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(43,16,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),filter((lambda __r1b0:PlacedT. equal(IntV 2,colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))))),sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(43,16,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),filter((lambda __r1b0:PlacedT. equal(IntV 2,colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))))),sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(43,16,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),filter((lambda __r1b0:PlacedT. equal(IntV 2,colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))))),sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(43,16,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),filter((lambda __r1b0:PlacedT. equal(IntV 2,colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))))),sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(43,16,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),filter((lambda __r1b0:PlacedT. equal(colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))),IntV 2)),sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(43,16,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),filter((lambda __r1b0:PlacedT. equal(colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))),IntV 2)),sortBy((lambda key:PlacedT. x(Anchor(key,BR))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(43,16,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),filter((lambda __r1b0:PlacedT. equal(colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))),IntV 2)),sortBy((lambda key:PlacedT. x(Anchor(key,Center))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(43,16,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),filter((lambda __r1b0:PlacedT. equal(colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))),IntV 2)),sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(43,16,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),filter((lambda __r1b0:PlacedT. equal(colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))),IntV 2)),sortBy((lambda key:PlacedT. y(Anchor(key,BR))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(43,16,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),filter((lambda __r1b0:PlacedT. equal(colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))),IntV 2)),sortBy((lambda key:PlacedT. y(Anchor(key,Center))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(43,16,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),filter((lambda __r1b0:PlacedT. equal(colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))),IntV 2)),sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(41,14,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),filter((lambda v1:PlacedT. equal(add(colorToInt(background(v0)),IntV 1),add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV (-1)))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(41,14,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),filter((lambda v1:PlacedT. equal(add(colorToInt(head(setToList(ObjectColors(objectOf(v1))))),IntV (-1)),add(colorToInt(background(v0)),IntV 1))),objects(v0))))")
Selected AST; FV=[]; (lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),objects(v0))))
TaskInvented I0: (lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)); repeats=11; portfolio MDL saving=36
TaskInvented I1: (lambda __r1b0:PlacedT. equal(IntV 2,colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))))); repeats=4; portfolio MDL saving=17
TaskInvented I2: (lambda __r1b0:PlacedT. equal(colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))),IntV 2)); repeats=4; portfolio MDL saving=17
TaskInvented I3: (lambda __r1b0:PlacedT. equal(IntV 1,add(colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))),IntV (-1)))); repeats=3; portfolio MDL saving=14
TaskInvented I4: (lambda __r1b0:PlacedT. equal(IntV 3,add(colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))),IntV 1))); repeats=2; portfolio MDL saving=5
TaskInvented I5: (lambda __r1b0:PlacedT. equal(add(colorToInt(head(setToList(ObjectColors(objectOf(__r1b0))))),IntV (-1)),IntV 1)); repeats=2; portfolio MDL saving=5
Induced TSL=Signature(root VS) union inventions. BaseActivated=["Anchor","ObjectCells","ObjectColors","add","background","canvasSize","cardinality","colorToInt","contains","coord","equal","filter","head","height","index","lambda","less","lessEqual","literal","mkScene","objectOf","objects","setToList","sortBy","subtract","tail","width","x","y"]; TaskInvented=["I0","I1","I2","I3","I4","I5"]; StructuralPriorCount=0
```
