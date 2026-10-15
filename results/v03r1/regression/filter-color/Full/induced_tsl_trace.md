# LATIS v0.3R.1 induced TSL trace

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
Nonempty VS_contains node=9 children=[5,8]; conditional algebra witness; ObjectCells(objectOf(v1)) / head(setToList(ObjectCells(objectOf(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1)))))
MRV immediate domains=[(0,2),(1,1)]
Learn(CellT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get"]
Learn(SetT CellT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","cells","ObjectCells"]
Nonempty VS_contains node=14 children=[13,10]; conditional algebra witness; ObjectCells(objectOf(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1))) / head(setToList(ObjectCells(objectOf(v1))))
MRV immediate domains=[(0,1),(1,3)]
Learn(SetT ColorT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","ObjectColors"]
Learn(ColorT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","background"]
Nonempty VS_contains node=17 children=[15,16]; conditional algebra witness; ObjectColors(objectOf(v1)) / ColorV 2
MRV immediate domains=[(0,2),(1,1)]
Learn(ColorT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","background"]
Learn(SetT ColorT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","ObjectColors"]
Nonempty VS_contains node=22 children=[21,18]; conditional algebra witness; ObjectColors(objectOf(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1))) / head(setToList(ObjectColors(objectOf(v1))))
MRV immediate domains=[(0,3),(1,1)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=25 children=[24,23]; conditional algebra witness; IntV 2 / colorToInt(head(setToList(ObjectColors(objectOf(v1)))))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=32 children=[28,31]; conditional algebra witness; x(Anchor(v1,TL)) / x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),TL))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=39 children=[35,38]; conditional algebra witness; y(Anchor(v1,TL)) / y(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),TL))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=46 children=[42,45]; conditional algebra witness; x(Anchor(v1,TR)) / x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),TR))
MRV immediate domains=[(0,1),(1,2)]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=51 children=[47,50]; conditional algebra witness; x(Anchor(v1,Center)) / x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),Center))
MRV immediate domains=[(0,1),(1,3)]
Nonempty VS_equal node=52 children=[23,24]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(v1))))) / IntV 2
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_equal node=53 children=[31,28]; conditional algebra witness; x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),TL)) / x(Anchor(v1,TL))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_equal node=54 children=[38,35]; conditional algebra witness; y(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),TL)) / y(Anchor(v1,TL))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_equal node=55 children=[45,42]; conditional algebra witness; x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),TR)) / x(Anchor(v1,TR))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_equal node=56 children=[50,47]; conditional algebra witness; x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),Center)) / x(Anchor(v1,Center))
Nonempty VS_lambda node=58 children=[57]; function graph -> parameter binding and output points
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_filter node=62 children=[58,61]; filter exact multiplicity/order inverse; predicate consistency retained across duplicate inputs
MRV immediate domains=[(0,1),(1,2)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_filter node=66 children=[58,65]; filter exact multiplicity/order inverse; predicate consistency retained across duplicate inputs
MRV immediate domains=[(0,1),(1,1)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_filter node=68 children=[58,67]; filter exact multiplicity/order inverse; predicate consistency retained across duplicate inputs
MRV immediate domains=[(0,1),(1,2)]
Learn(ArrowT PlacedT BoolT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,176)]
Learn(BoolT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","contains","get","equal","less","lessEqual"]
MRV immediate domains=[(0,1),(1,2)]
Learn(SetT CellT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","cells","ObjectCells"]
Learn(CellT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get"]
Nonempty VS_contains node=9 children=[5,8]; conditional algebra witness; ObjectCells(objectOf(v1)) / head(setToList(ObjectCells(objectOf(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1)))))
MRV immediate domains=[(0,2),(1,1)]
Learn(CellT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get"]
Learn(SetT CellT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","cells","ObjectCells"]
Nonempty VS_contains node=14 children=[13,10]; conditional algebra witness; ObjectCells(objectOf(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1))) / head(setToList(ObjectCells(objectOf(v1))))
MRV immediate domains=[(0,1),(1,3)]
Learn(SetT ColorT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","ObjectColors"]
Learn(ColorT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","background"]
Nonempty VS_contains node=17 children=[15,16]; conditional algebra witness; ObjectColors(objectOf(v1)) / ColorV 2
MRV immediate domains=[(0,2),(1,1)]
Learn(ColorT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","background"]
Learn(SetT ColorT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","ObjectColors"]
Nonempty VS_contains node=22 children=[21,18]; conditional algebra witness; ObjectColors(objectOf(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1))) / head(setToList(ObjectColors(objectOf(v1))))
MRV immediate domains=[(0,3),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=25 children=[24,23]; conditional algebra witness; IntV 2 / colorToInt(head(setToList(ObjectColors(objectOf(v1)))))
MRV immediate domains=[(0,1),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=73 children=[69,72]; conditional algebra witness; cardinality(ObjectCells(objectOf(v1))) / cardinality(ObjectCells(objectOf(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1))))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=32 children=[28,31]; conditional algebra witness; x(Anchor(v1,TL)) / x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),TL))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=39 children=[35,38]; conditional algebra witness; y(Anchor(v1,TL)) / y(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),TL))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=46 children=[42,45]; conditional algebra witness; x(Anchor(v1,TR)) / x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),TR))
MRV immediate domains=[(0,1),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=51 children=[47,50]; conditional algebra witness; x(Anchor(v1,Center)) / x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),Center))
MRV immediate domains=[(0,1),(1,3)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=78 children=[74,77]; conditional algebra witness; y(Anchor(v1,Center)) / y(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),Center))
MRV immediate domains=[(0,1),(1,3)]
Nonempty VS_equal node=52 children=[23,24]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(v1))))) / IntV 2
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_equal node=79 children=[72,69]; conditional algebra witness; cardinality(ObjectCells(objectOf(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1)))) / cardinality(ObjectCells(objectOf(v1)))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_equal node=53 children=[31,28]; conditional algebra witness; x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),TL)) / x(Anchor(v1,TL))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_equal node=54 children=[38,35]; conditional algebra witness; y(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),TL)) / y(Anchor(v1,TL))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_equal node=55 children=[45,42]; conditional algebra witness; x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),TR)) / x(Anchor(v1,TR))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_equal node=56 children=[50,47]; conditional algebra witness; x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),Center)) / x(Anchor(v1,Center))
MRV immediate domains=[(0,3),(1,1)]
Nonempty VS_equal node=80 children=[77,74]; conditional algebra witness; y(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),Center)) / y(Anchor(v1,Center))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_less node=81 children=[28,69]; conditional algebra witness; x(Anchor(v1,TL)) / cardinality(ObjectCells(objectOf(v1)))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_less node=82 children=[28,35]; conditional algebra witness; x(Anchor(v1,TL)) / y(Anchor(v1,TL))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_less node=83 children=[28,74]; conditional algebra witness; x(Anchor(v1,TL)) / y(Anchor(v1,Center))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=87 children=[28,86]; conditional algebra witness; x(Anchor(v1,TL)) / y(Anchor(head(objects(v0)),TL))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=91 children=[28,90]; conditional algebra witness; x(Anchor(v1,TL)) / x(Anchor(head(objects(v0)),TR))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=95 children=[28,94]; conditional algebra witness; x(Anchor(v1,TL)) / y(Anchor(head(objects(v0)),Center))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=99 children=[28,98]; conditional algebra witness; x(Anchor(v1,TL)) / y(Anchor(index(objects(v0),IntV 1),Center))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=103 children=[28,102]; conditional algebra witness; x(Anchor(v1,TL)) / y(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),TL))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=107 children=[28,106]; conditional algebra witness; x(Anchor(v1,TL)) / x(Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),TL))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=111 children=[28,110]; conditional algebra witness; x(Anchor(v1,TL)) / y(Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),TL))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_less node=112 children=[28,72]; conditional algebra witness; x(Anchor(v1,TL)) / cardinality(ObjectCells(objectOf(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1))))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_less node=113 children=[28,38]; conditional algebra witness; x(Anchor(v1,TL)) / y(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),TL))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_less node=114 children=[28,45]; conditional algebra witness; x(Anchor(v1,TL)) / x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),TR))
MRV immediate domains=[(0,2),(1,3)]
Nonempty VS_less node=115 children=[28,77]; conditional algebra witness; x(Anchor(v1,TL)) / y(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),Center))
MRV immediate domains=[(0,2),(1,3)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=119 children=[28,118]; conditional algebra witness; x(Anchor(v1,TL)) / y(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),TL))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=123 children=[28,122]; conditional algebra witness; x(Anchor(v1,TL)) / x(Anchor(index(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)),IntV 1),Center))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=125 children=[28,124]; conditional algebra witness; x(Anchor(v1,TL)) / y(Anchor(index(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),IntV 1),TL))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_less node=126 children=[42,35]; conditional algebra witness; x(Anchor(v1,TR)) / y(Anchor(v1,TL))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_less node=127 children=[42,74]; conditional algebra witness; x(Anchor(v1,TR)) / y(Anchor(v1,Center))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_less node=128 children=[42,86]; conditional algebra witness; x(Anchor(v1,TR)) / y(Anchor(head(objects(v0)),TL))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_less node=129 children=[42,94]; conditional algebra witness; x(Anchor(v1,TR)) / y(Anchor(head(objects(v0)),Center))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_less node=130 children=[42,98]; conditional algebra witness; x(Anchor(v1,TR)) / y(Anchor(index(objects(v0),IntV 1),Center))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_less node=131 children=[42,102]; conditional algebra witness; x(Anchor(v1,TR)) / y(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),TL))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_less node=132 children=[42,106]; conditional algebra witness; x(Anchor(v1,TR)) / x(Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),TL))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_less node=133 children=[42,110]; conditional algebra witness; x(Anchor(v1,TR)) / y(Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),TL))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=137 children=[42,136]; conditional algebra witness; x(Anchor(v1,TR)) / x(Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),TR))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_less node=138 children=[42,38]; conditional algebra witness; x(Anchor(v1,TR)) / y(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),TL))
MRV immediate domains=[(0,2),(1,3)]
Nonempty VS_less node=139 children=[42,77]; conditional algebra witness; x(Anchor(v1,TR)) / y(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),Center))
MRV immediate domains=[(0,2),(1,3)]
Nonempty VS_less node=140 children=[42,118]; conditional algebra witness; x(Anchor(v1,TR)) / y(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),TL))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_less node=141 children=[42,124]; conditional algebra witness; x(Anchor(v1,TR)) / y(Anchor(index(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),IntV 1),TL))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_lessEqual node=142 children=[28,69]; conditional algebra witness; x(Anchor(v1,TL)) / cardinality(ObjectCells(objectOf(v1)))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_lessEqual node=143 children=[28,35]; conditional algebra witness; x(Anchor(v1,TL)) / y(Anchor(v1,TL))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_lessEqual node=144 children=[28,74]; conditional algebra witness; x(Anchor(v1,TL)) / y(Anchor(v1,Center))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_lessEqual node=145 children=[28,86]; conditional algebra witness; x(Anchor(v1,TL)) / y(Anchor(head(objects(v0)),TL))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_lessEqual node=146 children=[28,94]; conditional algebra witness; x(Anchor(v1,TL)) / y(Anchor(head(objects(v0)),Center))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_lessEqual node=147 children=[28,102]; conditional algebra witness; x(Anchor(v1,TL)) / y(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),TL))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_lessEqual node=148 children=[28,110]; conditional algebra witness; x(Anchor(v1,TL)) / y(Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),TL))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_lessEqual node=149 children=[28,72]; conditional algebra witness; x(Anchor(v1,TL)) / cardinality(ObjectCells(objectOf(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1))))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_lessEqual node=150 children=[28,31]; conditional algebra witness; x(Anchor(v1,TL)) / x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),TL))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_lessEqual node=151 children=[28,45]; conditional algebra witness; x(Anchor(v1,TL)) / x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),TR))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_lessEqual node=152 children=[28,50]; conditional algebra witness; x(Anchor(v1,TL)) / x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),Center))
MRV immediate domains=[(0,2),(1,3)]
Nonempty VS_lessEqual node=153 children=[28,118]; conditional algebra witness; x(Anchor(v1,TL)) / y(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),TL))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_lessEqual node=154 children=[28,124]; conditional algebra witness; x(Anchor(v1,TL)) / y(Anchor(index(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),IntV 1),TL))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_lessEqual node=155 children=[42,35]; conditional algebra witness; x(Anchor(v1,TR)) / y(Anchor(v1,TL))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_lessEqual node=156 children=[42,74]; conditional algebra witness; x(Anchor(v1,TR)) / y(Anchor(v1,Center))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_lessEqual node=157 children=[42,86]; conditional algebra witness; x(Anchor(v1,TR)) / y(Anchor(head(objects(v0)),TL))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_lessEqual node=158 children=[42,94]; conditional algebra witness; x(Anchor(v1,TR)) / y(Anchor(head(objects(v0)),Center))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_lessEqual node=159 children=[42,102]; conditional algebra witness; x(Anchor(v1,TR)) / y(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),TL))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_lessEqual node=160 children=[42,110]; conditional algebra witness; x(Anchor(v1,TR)) / y(Anchor(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))),TL))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_lessEqual node=161 children=[42,45]; conditional algebra witness; x(Anchor(v1,TR)) / x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),TR))
MRV immediate domains=[(0,2),(1,3)]
Nonempty VS_lessEqual node=162 children=[42,118]; conditional algebra witness; x(Anchor(v1,TR)) / y(Anchor(head(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),TL))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_lessEqual node=163 children=[42,124]; conditional algebra witness; x(Anchor(v1,TR)) / y(Anchor(index(tail(sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0))),IntV 1),TL))
Nonempty VS_lambda node=165 children=[164]; function graph -> parameter binding and output points
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_filter node=169 children=[165,168]; filter exact multiplicity/order inverse; predicate consistency retained across duplicate inputs
MRV immediate domains=[(0,1),(1,1)]
Learn(ArrowT PlacedT BoolT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,168)]
Learn(BoolT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","contains","get","equal","less","lessEqual"]
MRV immediate domains=[(0,1),(1,2)]
Learn(SetT CellT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","cells","ObjectCells"]
Learn(CellT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get"]
Nonempty VS_contains node=9 children=[5,8]; conditional algebra witness; ObjectCells(objectOf(v1)) / head(setToList(ObjectCells(objectOf(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1)))))
MRV immediate domains=[(0,2),(1,1)]
Learn(CellT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get"]
Learn(SetT CellT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","cells","ObjectCells"]
Nonempty VS_contains node=14 children=[13,10]; conditional algebra witness; ObjectCells(objectOf(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1))) / head(setToList(ObjectCells(objectOf(v1))))
MRV immediate domains=[(0,1),(1,3)]
Learn(SetT ColorT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","ObjectColors"]
Learn(ColorT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","background"]
Nonempty VS_contains node=17 children=[15,16]; conditional algebra witness; ObjectColors(objectOf(v1)) / ColorV 2
MRV immediate domains=[(0,2),(1,1)]
Learn(ColorT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","background"]
Learn(SetT ColorT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","ObjectColors"]
Nonempty VS_contains node=22 children=[21,18]; conditional algebra witness; ObjectColors(objectOf(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1))) / head(setToList(ObjectColors(objectOf(v1))))
MRV immediate domains=[(0,3),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=25 children=[24,23]; conditional algebra witness; IntV 2 / colorToInt(head(setToList(ObjectColors(objectOf(v1)))))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=32 children=[28,31]; conditional algebra witness; x(Anchor(v1,TL)) / x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),TL))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=39 children=[35,38]; conditional algebra witness; y(Anchor(v1,TL)) / y(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),TL))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=46 children=[42,45]; conditional algebra witness; x(Anchor(v1,TR)) / x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),TR))
MRV immediate domains=[(0,1),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=51 children=[47,50]; conditional algebra witness; x(Anchor(v1,Center)) / x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),Center))
MRV immediate domains=[(0,1),(1,3)]
Nonempty VS_equal node=52 children=[23,24]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(v1))))) / IntV 2
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_equal node=53 children=[31,28]; conditional algebra witness; x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),TL)) / x(Anchor(v1,TL))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_equal node=54 children=[38,35]; conditional algebra witness; y(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),TL)) / y(Anchor(v1,TL))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_equal node=55 children=[45,42]; conditional algebra witness; x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),TR)) / x(Anchor(v1,TR))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_equal node=56 children=[50,47]; conditional algebra witness; x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),Center)) / x(Anchor(v1,Center))
MRV immediate domains=[(0,3),(1,2)]
Nonempty VS_less node=170 children=[24,28]; conditional algebra witness; IntV 2 / x(Anchor(v1,TL))
MRV immediate domains=[(0,1),(1,2)]
Nonempty VS_less node=171 children=[23,28]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(v1))))) / x(Anchor(v1,TL))
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_less node=172 children=[23,47]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(v1))))) / x(Anchor(v1,Center))
MRV immediate domains=[(0,3),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=176 children=[175,42]; conditional algebra witness; cardinality(ObjectCells(objectOf(index(objects(v0),IntV 1)))) / x(Anchor(v1,TR))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=180 children=[179,28]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(head(objects(v0))))))) / x(Anchor(v1,TL))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=184 children=[183,28]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(index(objects(v0),IntV 1)))))) / x(Anchor(v1,TL))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_less node=185 children=[183,47]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(index(objects(v0),IntV 1)))))) / x(Anchor(v1,Center))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=189 children=[188,28]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(index(tail(objects(v0)),IntV 1)))))) / x(Anchor(v1,TL))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_less node=190 children=[188,42]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(index(tail(objects(v0)),IntV 1)))))) / x(Anchor(v1,TR))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_less node=191 children=[188,47]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(index(tail(objects(v0)),IntV 1)))))) / x(Anchor(v1,Center))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=195 children=[194,28]; conditional algebra witness; cardinality(ObjectCells(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))) / x(Anchor(v1,TL))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_less node=196 children=[194,42]; conditional algebra witness; cardinality(ObjectCells(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))) / x(Anchor(v1,TR))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_less node=197 children=[194,47]; conditional algebra witness; cardinality(ObjectCells(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))) / x(Anchor(v1,Center))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=201 children=[200,28]; conditional algebra witness; x(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),TL)) / x(Anchor(v1,TL))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=205 children=[204,28]; conditional algebra witness; x(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),Center)) / x(Anchor(v1,TL))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_less node=206 children=[204,47]; conditional algebra witness; x(Anchor(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))),Center)) / x(Anchor(v1,Center))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_less node=207 children=[31,42]; conditional algebra witness; x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),TL)) / x(Anchor(v1,TR))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_less node=208 children=[50,42]; conditional algebra witness; x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),Center)) / x(Anchor(v1,TR))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=212 children=[211,28]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))))))) / x(Anchor(v1,TL))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_less node=213 children=[211,47]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))))))) / x(Anchor(v1,Center))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=217 children=[216,28]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))))) / x(Anchor(v1,TL))
MRV immediate domains=[(0,1),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=218 children=[69,42]; conditional algebra witness; cardinality(ObjectCells(objectOf(v1))) / x(Anchor(v1,TR))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=222 children=[221,42]; conditional algebra witness; cardinality(ObjectCells(objectOf(head(objects(v0))))) / x(Anchor(v1,TR))
MRV immediate domains=[(0,3),(1,2)]
Nonempty VS_lessEqual node=223 children=[175,42]; conditional algebra witness; cardinality(ObjectCells(objectOf(index(objects(v0),IntV 1)))) / x(Anchor(v1,TR))
MRV immediate domains=[(0,3),(1,1)]
Nonempty VS_lessEqual node=224 children=[175,47]; conditional algebra witness; cardinality(ObjectCells(objectOf(index(objects(v0),IntV 1)))) / x(Anchor(v1,Center))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_lessEqual node=225 children=[188,28]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(index(tail(objects(v0)),IntV 1)))))) / x(Anchor(v1,TL))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_lessEqual node=226 children=[188,47]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(index(tail(objects(v0)),IntV 1)))))) / x(Anchor(v1,Center))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_lessEqual node=227 children=[194,28]; conditional algebra witness; cardinality(ObjectCells(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))) / x(Anchor(v1,TL))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_lessEqual node=228 children=[194,42]; conditional algebra witness; cardinality(ObjectCells(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))) / x(Anchor(v1,TR))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_lessEqual node=229 children=[194,47]; conditional algebra witness; cardinality(ObjectCells(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))) / x(Anchor(v1,Center))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_lessEqual node=230 children=[72,42]; conditional algebra witness; cardinality(ObjectCells(objectOf(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1)))) / x(Anchor(v1,TR))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_lessEqual node=231 children=[31,28]; conditional algebra witness; x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),TL)) / x(Anchor(v1,TL))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_lessEqual node=232 children=[31,42]; conditional algebra witness; x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),TL)) / x(Anchor(v1,TR))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_lessEqual node=233 children=[31,47]; conditional algebra witness; x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),TL)) / x(Anchor(v1,Center))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_lessEqual node=234 children=[45,42]; conditional algebra witness; x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),TR)) / x(Anchor(v1,TR))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_lessEqual node=235 children=[50,42]; conditional algebra witness; x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),Center)) / x(Anchor(v1,TR))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_lessEqual node=236 children=[50,47]; conditional algebra witness; x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),Center)) / x(Anchor(v1,Center))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_lessEqual node=237 children=[216,28]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))))) / x(Anchor(v1,TL))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_lessEqual node=238 children=[216,42]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))))) / x(Anchor(v1,TR))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_lessEqual node=239 children=[216,47]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))))) / x(Anchor(v1,Center))
Nonempty VS_lambda node=241 children=[240]; function graph -> parameter binding and output points
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_filter node=243 children=[241,242]; filter exact multiplicity/order inverse; predicate consistency retained across duplicate inputs
MRV immediate domains=[(0,1),(1,2)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_filter node=247 children=[58,246]; filter exact multiplicity/order inverse; predicate consistency retained across duplicate inputs
MRV immediate domains=[(0,1),(1,2)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_filter node=251 children=[58,250]; filter exact multiplicity/order inverse; predicate consistency retained across duplicate inputs
MRV immediate domains=[(0,1),(1,1)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_filter node=253 children=[58,252]; filter exact multiplicity/order inverse; predicate consistency retained across duplicate inputs
MRV immediate domains=[(0,1),(1,1)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_filter node=255 children=[58,254]; filter exact multiplicity/order inverse; predicate consistency retained across duplicate inputs
MRV immediate domains=[(0,1),(1,2)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_filter node=259 children=[241,258]; filter exact multiplicity/order inverse; predicate consistency retained across duplicate inputs
MRV immediate domains=[(0,1),(1,1)]
Learn(ArrowT PlacedT BoolT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,61)]
Learn(BoolT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","contains","get","equal","less","lessEqual"]
MRV immediate domains=[(0,1),(1,2)]
Learn(SetT CellT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","cells","ObjectCells"]
Learn(CellT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get"]
Nonempty VS_contains node=9 children=[5,8]; conditional algebra witness; ObjectCells(objectOf(v1)) / head(setToList(ObjectCells(objectOf(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1)))))
MRV immediate domains=[(0,2),(1,1)]
Learn(CellT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get"]
Learn(SetT CellT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","cells","ObjectCells"]
Nonempty VS_contains node=14 children=[13,10]; conditional algebra witness; ObjectCells(objectOf(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1))) / head(setToList(ObjectCells(objectOf(v1))))
MRV immediate domains=[(0,1),(1,3)]
Learn(SetT ColorT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","ObjectColors"]
Learn(ColorT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","background"]
Nonempty VS_contains node=17 children=[15,16]; conditional algebra witness; ObjectColors(objectOf(v1)) / ColorV 2
MRV immediate domains=[(0,2),(1,1)]
Learn(ColorT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","background"]
Learn(SetT ColorT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","ObjectColors"]
Nonempty VS_contains node=22 children=[21,18]; conditional algebra witness; ObjectColors(objectOf(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1))) / head(setToList(ObjectColors(objectOf(v1))))
MRV immediate domains=[(0,3),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=25 children=[24,23]; conditional algebra witness; IntV 2 / colorToInt(head(setToList(ObjectColors(objectOf(v1)))))
MRV immediate domains=[(0,1),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=73 children=[69,72]; conditional algebra witness; cardinality(ObjectCells(objectOf(v1))) / cardinality(ObjectCells(objectOf(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1))))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=32 children=[28,31]; conditional algebra witness; x(Anchor(v1,TL)) / x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),TL))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=39 children=[35,38]; conditional algebra witness; y(Anchor(v1,TL)) / y(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),TL))
MRV immediate domains=[(0,2),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=46 children=[42,45]; conditional algebra witness; x(Anchor(v1,TR)) / x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),TR))
MRV immediate domains=[(0,1),(1,2)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=51 children=[47,50]; conditional algebra witness; x(Anchor(v1,Center)) / x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),Center))
MRV immediate domains=[(0,1),(1,3)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_equal node=78 children=[74,77]; conditional algebra witness; y(Anchor(v1,Center)) / y(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),Center))
MRV immediate domains=[(0,1),(1,3)]
Nonempty VS_equal node=52 children=[23,24]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(v1))))) / IntV 2
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_equal node=79 children=[72,69]; conditional algebra witness; cardinality(ObjectCells(objectOf(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1)))) / cardinality(ObjectCells(objectOf(v1)))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_equal node=53 children=[31,28]; conditional algebra witness; x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),TL)) / x(Anchor(v1,TL))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_equal node=54 children=[38,35]; conditional algebra witness; y(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),TL)) / y(Anchor(v1,TL))
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_equal node=55 children=[45,42]; conditional algebra witness; x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),TR)) / x(Anchor(v1,TR))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_equal node=56 children=[50,47]; conditional algebra witness; x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),Center)) / x(Anchor(v1,Center))
MRV immediate domains=[(0,3),(1,1)]
Nonempty VS_equal node=80 children=[77,74]; conditional algebra witness; y(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),Center)) / y(Anchor(v1,Center))
MRV immediate domains=[(0,2),(1,1)]
Learn(IntT; observations=4; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","length","head","index","cardinality","get","add","subtract","multiply","x","y","dx","dy","width","height","colorToInt"]
Nonempty VS_less node=260 children=[194,69]; conditional algebra witness; cardinality(ObjectCells(objectOf(head(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))) / cardinality(ObjectCells(objectOf(v1)))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_less node=261 children=[31,69]; conditional algebra witness; x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),TL)) / cardinality(ObjectCells(objectOf(v1)))
MRV immediate domains=[(0,1),(1,3)]
Nonempty VS_lessEqual node=262 children=[23,24]; conditional algebra witness; colorToInt(head(setToList(ObjectColors(objectOf(v1))))) / IntV 2
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_lessEqual node=263 children=[72,69]; conditional algebra witness; cardinality(ObjectCells(objectOf(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1)))) / cardinality(ObjectCells(objectOf(v1)))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_lessEqual node=264 children=[31,69]; conditional algebra witness; x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),TL)) / cardinality(ObjectCells(objectOf(v1)))
MRV immediate domains=[(0,2),(1,1)]
Nonempty VS_lessEqual node=265 children=[50,69]; conditional algebra witness; x(Anchor(index(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)),IntV 1),Center)) / cardinality(ObjectCells(objectOf(v1)))
Nonempty VS_lambda node=267 children=[266]; function graph -> parameter binding and output points
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_filter node=269 children=[267,268]; filter exact multiplicity/order inverse; predicate consistency retained across duplicate inputs
Nonempty VS_mkScene node=271 children=[3,4,270]; mkScene residual: canonical correspondence + Render-validated paint order; branch=0
Nonempty VS_lambda node=272 children=[271]; function graph -> parameter binding and output points
Task TSL supported Base=["Anchor","ObjectCells","ObjectColors","canvasSize","cardinality","colorToInt","contains","equal","filter","head","index","lambda","less","lessEqual","literal","mkScene","objectOf","objects","setToList","sortBy","subtract","tail","x","y"]
Abstraction round=0; exact frontier=32; accepted=["I0","I1","I2","I3","I4","I5"]
Learn(ArrowT SceneT SceneT; observations=2; Gamma=[]); return-compatible=["lambda","head","index"]
MRV immediate domains=[(0,19)]
Learn(SceneT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["head","index","mkScene"]
MRV immediate domains=[(0,2),(1,3),(2,17)]
Learn(SizeT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["head","index","canvasSize"]
Learn(ColorT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["head","index"]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["filter","sortBy","head","tail","index","setToList","objects"]
MRV immediate domains=[(0,1),(1,2)]
Learn uses I0 by typed definition expansion; ArrowT PlacedT BoolT; observations=6; Gamma=[("v0",SceneT)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["filter","sortBy","head","tail","index","setToList","objects"]
Nonempty VS_filter node=274 children=[273,61]; filter exact multiplicity/order inverse; predicate consistency retained across duplicate inputs
MRV immediate domains=[(0,1),(1,2)]
Learn uses I0 by typed definition expansion; ArrowT PlacedT BoolT; observations=6; Gamma=[("v0",SceneT)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["filter","sortBy","head","tail","index","setToList","objects"]
Nonempty VS_filter node=275 children=[273,65]; filter exact multiplicity/order inverse; predicate consistency retained across duplicate inputs
MRV immediate domains=[(0,1),(1,1)]
Learn uses I0 by typed definition expansion; ArrowT PlacedT BoolT; observations=6; Gamma=[("v0",SceneT)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["filter","sortBy","head","tail","index","setToList","objects"]
Nonempty VS_filter node=276 children=[273,67]; filter exact multiplicity/order inverse; predicate consistency retained across duplicate inputs
MRV immediate domains=[(0,1),(1,2)]
Learn uses I0 by typed definition expansion; ArrowT PlacedT BoolT; observations=4; Gamma=[("v0",SceneT)]
Learn uses I1 by typed definition expansion; ArrowT PlacedT BoolT; observations=4; Gamma=[("v0",SceneT)]
Learn uses I2 by typed definition expansion; ArrowT PlacedT BoolT; observations=4; Gamma=[("v0",SceneT)]
Learn uses I3 by typed definition expansion; ArrowT PlacedT BoolT; observations=4; Gamma=[("v0",SceneT)]
Learn uses I4 by typed definition expansion; ArrowT PlacedT BoolT; observations=4; Gamma=[("v0",SceneT)]
Learn uses I5 by typed definition expansion; ArrowT PlacedT BoolT; observations=4; Gamma=[("v0",SceneT)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["filter","sortBy","head","tail","index","setToList","objects"]
Nonempty VS_filter node=283 children=[282,168]; filter exact multiplicity/order inverse; predicate consistency retained across duplicate inputs
MRV immediate domains=[(0,1),(1,1)]
Learn uses I0 by typed definition expansion; ArrowT PlacedT BoolT; observations=4; Gamma=[("v0",SceneT)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["filter","sortBy","head","tail","index","setToList","objects"]
Nonempty VS_filter node=284 children=[273,242]; filter exact multiplicity/order inverse; predicate consistency retained across duplicate inputs
MRV immediate domains=[(0,1),(1,2)]
Learn uses I0 by typed definition expansion; ArrowT PlacedT BoolT; observations=6; Gamma=[("v0",SceneT)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["filter","sortBy","head","tail","index","setToList","objects"]
Nonempty VS_filter node=285 children=[273,246]; filter exact multiplicity/order inverse; predicate consistency retained across duplicate inputs
MRV immediate domains=[(0,1),(1,2)]
Learn uses I0 by typed definition expansion; ArrowT PlacedT BoolT; observations=6; Gamma=[("v0",SceneT)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["filter","sortBy","head","tail","index","setToList","objects"]
Nonempty VS_filter node=286 children=[273,250]; filter exact multiplicity/order inverse; predicate consistency retained across duplicate inputs
MRV immediate domains=[(0,1),(1,1)]
Learn uses I0 by typed definition expansion; ArrowT PlacedT BoolT; observations=6; Gamma=[("v0",SceneT)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["filter","sortBy","head","tail","index","setToList","objects"]
Nonempty VS_filter node=287 children=[273,252]; filter exact multiplicity/order inverse; predicate consistency retained across duplicate inputs
MRV immediate domains=[(0,1),(1,1)]
Learn uses I0 by typed definition expansion; ArrowT PlacedT BoolT; observations=6; Gamma=[("v0",SceneT)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["filter","sortBy","head","tail","index","setToList","objects"]
Nonempty VS_filter node=288 children=[273,254]; filter exact multiplicity/order inverse; predicate consistency retained across duplicate inputs
MRV immediate domains=[(0,1),(1,2)]
Learn uses I0 by typed definition expansion; ArrowT PlacedT BoolT; observations=4; Gamma=[("v0",SceneT)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["filter","sortBy","head","tail","index","setToList","objects"]
Nonempty VS_filter node=289 children=[273,258]; filter exact multiplicity/order inverse; predicate consistency retained across duplicate inputs
MRV immediate domains=[(0,1),(1,1)]
Learn uses I0 by typed definition expansion; ArrowT PlacedT BoolT; observations=4; Gamma=[("v0",SceneT)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["filter","sortBy","head","tail","index","setToList","objects"]
Nonempty VS_filter node=290 children=[273,268]; filter exact multiplicity/order inverse; predicate consistency retained across duplicate inputs
Nonempty VS_mkScene node=292 children=[3,4,291]; mkScene residual: canonical correspondence + Render-validated paint order; branch=0
Nonempty VS_lambda node=293 children=[292]; function graph -> parameter binding and output points
Task TSL supported Base=["Anchor","ObjectCells","ObjectColors","canvasSize","cardinality","contains","filter","lambda","less","literal","mkScene","objectOf","objects","sortBy","subtract","tail","x","y"]
Abstraction round=1; exact frontier=32; accepted=[]
Exact original Render(P(Encode(x)))=y: True; MDL rank=(25,9,2,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(27,8,2,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(35,12,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(35,12,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(35,12,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(35,12,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(37,11,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(37,11,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(37,11,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(37,11,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(37,13,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(37,13,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(37,13,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(38,11,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda __r1b0:PlacedT. less(x(Anchor(__r1b0,BL)),IntV 10)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(38,11,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda __r1b0:PlacedT. less(x(Anchor(__r1b0,BL)),IntV 10)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(38,11,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda __r1b0:PlacedT. less(x(Anchor(__r1b0,BL)),IntV 9)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(38,11,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda __r1b0:PlacedT. less(x(Anchor(__r1b0,BL)),IntV 9)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(38,11,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda __r1b0:PlacedT. less(x(Anchor(__r1b0,TL)),IntV 10)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(38,11,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda __r1b0:PlacedT. less(x(Anchor(__r1b0,TL)),IntV 10)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(38,11,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda __r1b0:PlacedT. less(x(Anchor(__r1b0,TL)),IntV 9)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(38,11,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda __r1b0:PlacedT. less(x(Anchor(__r1b0,TL)),IntV 9)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(38,11,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda __r1b0:PlacedT. less(x(Anchor(__r1b0,TR)),IntV 10)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(38,11,3,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda __r1b0:PlacedT. less(x(Anchor(__r1b0,TR)),IntV 10)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(38,13,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(38,13,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(38,13,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TR)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(38,13,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(38,13,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(38,13,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TR)))),objects(v0)))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(39,12,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(39,12,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(39,12,3,2,"(lambda v0:SceneT. mkScene(SizeV (Dimensions {gridWidth = 18, gridHeight = 18}),ColorV 0,filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),tail(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))))))")
Selected AST; FV=[]; (lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),objects(v0))))
TaskInvented I0: (lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)); repeats=13; portfolio MDL saving=44
TaskInvented I1: (lambda __r1b0:PlacedT. less(x(Anchor(__r1b0,TL)),IntV 9)); repeats=2; portfolio MDL saving=1
TaskInvented I2: (lambda __r1b0:PlacedT. less(x(Anchor(__r1b0,TL)),IntV 10)); repeats=2; portfolio MDL saving=1
TaskInvented I3: (lambda __r1b0:PlacedT. less(x(Anchor(__r1b0,TR)),IntV 10)); repeats=2; portfolio MDL saving=1
TaskInvented I4: (lambda __r1b0:PlacedT. less(x(Anchor(__r1b0,BL)),IntV 9)); repeats=2; portfolio MDL saving=1
TaskInvented I5: (lambda __r1b0:PlacedT. less(x(Anchor(__r1b0,BL)),IntV 10)); repeats=2; portfolio MDL saving=1
Induced TSL=Signature(root VS) union inventions. BaseActivated=["Anchor","ObjectCells","ObjectColors","canvasSize","cardinality","contains","filter","lambda","less","literal","mkScene","objectOf","objects","sortBy","subtract","tail","x","y"]; TaskInvented=["I0","I1","I2","I3","I4","I5"]; StructuralPriorCount=0

```

## Supported map / scan rules

```text

```

## Final expression and free-variable dependencies

```text
(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),objects(v0))))
FV=[]
```

## Version space, inventions, induced TSL, exact verification and MDL

```json
{"task":"E:\\dev\\AI\\ARC-AGI-1\\results\\v03\\regression\\filter-color\\task.json","mode":"Full","train_exact":true,"heldout_exact":true,"heldout_available":true,"failure":"None","failure_evidence":"training exact; heldout is assessed only after MDL selection","program":"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),objects(v0))))","typed_ast":{"type":"ArrowT SceneT SceneT","expression":"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),objects(v0))))","free_variables":[],"binding_accesses":["__r1b0","v0"],"children":[{"type":"SceneT","expression":"mkScene(canvasSize(v0),ColorV 0,filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),objects(v0)))","free_variables":["v0"],"binding_accesses":["__r1b0","v0"],"children":[{"type":"SizeT","expression":"canvasSize(v0)","free_variables":["v0"],"binding_accesses":["v0"],"children":[{"type":"SceneT","expression":"v0","free_variables":["v0"],"binding_accesses":["v0"],"children":[]}]},{"type":"ColorT","expression":"ColorV 0","free_variables":[],"binding_accesses":[],"children":[]},{"type":"ListT PlacedT","expression":"filter((lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2)),objects(v0))","free_variables":["v0"],"binding_accesses":["__r1b0","v0"],"children":[{"type":"ArrowT PlacedT BoolT","expression":"(lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2))","free_variables":[],"binding_accesses":["__r1b0"],"children":[{"type":"BoolT","expression":"contains(ObjectColors(objectOf(__r1b0)),ColorV 2)","free_variables":["__r1b0"],"binding_accesses":["__r1b0"],"children":[{"type":"SetT ColorT","expression":"ObjectColors(objectOf(__r1b0))","free_variables":["__r1b0"],"binding_accesses":["__r1b0"],"children":[{"type":"ObjectT","expression":"objectOf(__r1b0)","free_variables":["__r1b0"],"binding_accesses":["__r1b0"],"children":[{"type":"PlacedT","expression":"__r1b0","free_variables":["__r1b0"],"binding_accesses":["__r1b0"],"children":[]}]}]},{"type":"ColorT","expression":"ColorV 2","free_variables":[],"binding_accesses":[],"children":[]}]}]},{"type":"ListT PlacedT","expression":"objects(v0)","free_variables":["v0"],"binding_accesses":["v0"],"children":[{"type":"SceneT","expression":"v0","free_variables":["v0"],"binding_accesses":["v0"],"children":[]}]}]}]}]},"portfolio_count":32,"version_space_derivations":54,"base_activated":[{"symbol":"Anchor","source":"BaseActivated","support":[{"specification":"ArrowT PlacedT BoolT; observations=4; Gamma=[(\"v0\",SceneT)]","witness":"definition expansion of task-local I5"},{"specification":"ArrowT PlacedT BoolT; observations=4; Gamma=[(\"v0\",SceneT)]","witness":"definition expansion of task-local I4"},{"specification":"ArrowT PlacedT BoolT; observations=4; Gamma=[(\"v0\",SceneT)]","witness":"definition expansion of task-local I3"},{"specification":"ArrowT PlacedT BoolT; observations=4; Gamma=[(\"v0\",SceneT)]","witness":"definition expansion of task-local I2"},{"specification":"ArrowT PlacedT BoolT; observations=4; Gamma=[(\"v0\",SceneT)]","witness":"definition expansion of task-local I1"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))); FV=[\"v0\"]"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TR)))),objects(v0))); FV=[\"v0\"]"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))); FV=[\"v0\"]"}]},{"symbol":"ObjectCells","source":"BaseActivated","support":[{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)); FV=[\"v0\"]"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))); FV=[\"v0\"]"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)); FV=[\"v0\"]"}]},{"symbol":"ObjectColors","source":"BaseActivated","support":[{"specification":"ArrowT PlacedT BoolT; observations=4; Gamma=[(\"v0\",SceneT)]","witness":"definition expansion of task-local I0"},{"specification":"ArrowT PlacedT BoolT; observations=6; Gamma=[(\"v0\",SceneT)]","witness":"definition expansion of task-local I0"}]},{"symbol":"canvasSize","source":"BaseActivated","support":[{"specification":"SizeT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; canvasSize(v0); FV=[\"v0\"]"}]},{"symbol":"cardinality","source":"BaseActivated","support":[{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)); FV=[\"v0\"]"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))); FV=[\"v0\"]"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)); FV=[\"v0\"]"}]},{"symbol":"contains","source":"BaseActivated","support":[{"specification":"ArrowT PlacedT BoolT; observations=4; Gamma=[(\"v0\",SceneT)]","witness":"definition expansion of task-local I0"},{"specification":"ArrowT PlacedT BoolT; observations=6; Gamma=[(\"v0\",SceneT)]","witness":"definition expansion of task-local I0"}]},{"symbol":"filter","source":"BaseActivated","support":[{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"filter exact multiplicity/order inverse; predicate consistency retained across duplicate inputs"}]},{"symbol":"lambda","source":"BaseActivated","support":[{"specification":"ArrowT SceneT SceneT; observations=2; Gamma=[]","witness":"function graph -> parameter binding and output points"},{"specification":"ArrowT PlacedT BoolT; observations=4; Gamma=[(\"v0\",SceneT)]","witness":"definition expansion of task-local I5"},{"specification":"ArrowT PlacedT BoolT; observations=4; Gamma=[(\"v0\",SceneT)]","witness":"definition expansion of task-local I4"},{"specification":"ArrowT PlacedT BoolT; observations=4; Gamma=[(\"v0\",SceneT)]","witness":"definition expansion of task-local I3"},{"specification":"ArrowT PlacedT BoolT; observations=4; Gamma=[(\"v0\",SceneT)]","witness":"definition expansion of task-local I2"},{"specification":"ArrowT PlacedT BoolT; observations=4; Gamma=[(\"v0\",SceneT)]","witness":"definition expansion of task-local I1"},{"specification":"ArrowT PlacedT BoolT; observations=4; Gamma=[(\"v0\",SceneT)]","witness":"definition expansion of task-local I0"},{"specification":"ArrowT PlacedT BoolT; observations=6; Gamma=[(\"v0\",SceneT)]","witness":"definition expansion of task-local I0"}]},{"symbol":"less","source":"BaseActivated","support":[{"specification":"ArrowT PlacedT BoolT; observations=4; Gamma=[(\"v0\",SceneT)]","witness":"definition expansion of task-local I5"},{"specification":"ArrowT PlacedT BoolT; observations=4; Gamma=[(\"v0\",SceneT)]","witness":"definition expansion of task-local I4"},{"specification":"ArrowT PlacedT BoolT; observations=4; Gamma=[(\"v0\",SceneT)]","witness":"definition expansion of task-local I3"},{"specification":"ArrowT PlacedT BoolT; observations=4; Gamma=[(\"v0\",SceneT)]","witness":"definition expansion of task-local I2"},{"specification":"ArrowT PlacedT BoolT; observations=4; Gamma=[(\"v0\",SceneT)]","witness":"definition expansion of task-local I1"}]},{"symbol":"literal","source":"BaseActivated","support":[{"specification":"ArrowT PlacedT BoolT; observations=4; Gamma=[(\"v0\",SceneT)]","witness":"definition expansion of task-local I5"},{"specification":"ArrowT PlacedT BoolT; observations=4; Gamma=[(\"v0\",SceneT)]","witness":"definition expansion of task-local I4"},{"specification":"ArrowT PlacedT BoolT; observations=4; Gamma=[(\"v0\",SceneT)]","witness":"definition expansion of task-local I3"},{"specification":"ArrowT PlacedT BoolT; observations=4; Gamma=[(\"v0\",SceneT)]","witness":"definition expansion of task-local I2"},{"specification":"ArrowT PlacedT BoolT; observations=4; Gamma=[(\"v0\",SceneT)]","witness":"definition expansion of task-local I1"},{"specification":"ArrowT PlacedT BoolT; observations=4; Gamma=[(\"v0\",SceneT)]","witness":"definition expansion of task-local I0"},{"specification":"ArrowT PlacedT BoolT; observations=6; Gamma=[(\"v0\",SceneT)]","witness":"definition expansion of task-local I0"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))); FV=[\"v0\"]"}]},{"symbol":"mkScene","source":"BaseActivated","support":[{"specification":"SceneT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"mkScene residual: canonical correspondence + Render-validated paint order; branch=0"}]},{"symbol":"objectOf","source":"BaseActivated","support":[{"specification":"ArrowT PlacedT BoolT; observations=4; Gamma=[(\"v0\",SceneT)]","witness":"definition expansion of task-local I0"},{"specification":"ArrowT PlacedT BoolT; observations=6; Gamma=[(\"v0\",SceneT)]","witness":"definition expansion of task-local I0"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)); FV=[\"v0\"]"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))); FV=[\"v0\"]"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0)); FV=[\"v0\"]"}]},{"symbol":"objects","source":"BaseActivated","support":[{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))); FV=[\"v0\"]"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TR)))),objects(v0))); FV=[\"v0\"]"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))); FV=[\"v0\"]"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)); FV=[\"v0\"]"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)); FV=[\"v0\"]"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TR)))),objects(v0)); FV=[\"v0\"]"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)); FV=[\"v0\"]"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TR)))),objects(v0)); FV=[\"v0\"]"}]},{"symbol":"sortBy","source":"BaseActivated","support":[{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))); FV=[\"v0\"]"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TR)))),objects(v0))); FV=[\"v0\"]"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))); FV=[\"v0\"]"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)); FV=[\"v0\"]"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)); FV=[\"v0\"]"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TR)))),objects(v0)); FV=[\"v0\"]"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)); FV=[\"v0\"]"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TR)))),objects(v0)); FV=[\"v0\"]"}]},{"symbol":"subtract","source":"BaseActivated","support":[{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))); FV=[\"v0\"]"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TR)))),objects(v0))); FV=[\"v0\"]"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))); FV=[\"v0\"]"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; sortBy((lambda key:PlacedT. subtract(IntV 0,cardinality(ObjectCells(objectOf(key))))),objects(v0)); FV=[\"v0\"]"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)); FV=[\"v0\"]"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TR)))),objects(v0)); FV=[\"v0\"]"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)); FV=[\"v0\"]"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TR)))),objects(v0)); FV=[\"v0\"]"}]},{"symbol":"tail","source":"BaseActivated","support":[{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))); FV=[\"v0\"]"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TR)))),objects(v0))); FV=[\"v0\"]"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))); FV=[\"v0\"]"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; tail(sortBy((lambda key:PlacedT. cardinality(ObjectCells(objectOf(key)))),objects(v0))); FV=[\"v0\"]"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; tail(sortBy((lambda key:PlacedT. x(Anchor(key,TR))),objects(v0))); FV=[\"v0\"]"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; tail(sortBy((lambda key:PlacedT. x(Anchor(key,TL))),objects(v0))); FV=[\"v0\"]"}]},{"symbol":"x","source":"BaseActivated","support":[{"specification":"ArrowT PlacedT BoolT; observations=4; Gamma=[(\"v0\",SceneT)]","witness":"definition expansion of task-local I5"},{"specification":"ArrowT PlacedT BoolT; observations=4; Gamma=[(\"v0\",SceneT)]","witness":"definition expansion of task-local I4"},{"specification":"ArrowT PlacedT BoolT; observations=4; Gamma=[(\"v0\",SceneT)]","witness":"definition expansion of task-local I3"},{"specification":"ArrowT PlacedT BoolT; observations=4; Gamma=[(\"v0\",SceneT)]","witness":"definition expansion of task-local I2"},{"specification":"ArrowT PlacedT BoolT; observations=4; Gamma=[(\"v0\",SceneT)]","witness":"definition expansion of task-local I1"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TR)))),objects(v0))); FV=[\"v0\"]"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; tail(sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TL)))),objects(v0))); FV=[\"v0\"]"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; sortBy((lambda key:PlacedT. subtract(IntV 0,x(Anchor(key,TR)))),objects(v0)); FV=[\"v0\"]"}]},{"symbol":"y","source":"BaseActivated","support":[{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; tail(sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0))); FV=[\"v0\"]"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,Center)))),objects(v0)); FV=[\"v0\"]"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TR)))),objects(v0)); FV=[\"v0\"]"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; sortBy((lambda key:PlacedT. subtract(IntV 0,y(Anchor(key,TL)))),objects(v0)); FV=[\"v0\"]"},{"specification":"ListT PlacedT; observations=2; Gamma=[(\"v0\",SceneT)]","witness":"exact forward-observation witness; sortBy((lambda key:PlacedT. y(Anchor(key,TL))),objects(v0)); FV=[\"v0\"]"}]}],"task_invented":[{"name":"I0","source":"TaskInvented","originating_ast":{"type":"ArrowT PlacedT BoolT","expression":"(lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2))","free_variables":[],"binding_accesses":["__r1b0"],"children":[{"type":"BoolT","expression":"contains(ObjectColors(objectOf(__r1b0)),ColorV 2)","free_variables":["__r1b0"],"binding_accesses":["__r1b0"],"children":[{"type":"SetT ColorT","expression":"ObjectColors(objectOf(__r1b0))","free_variables":["__r1b0"],"binding_accesses":["__r1b0"],"children":[{"type":"ObjectT","expression":"objectOf(__r1b0)","free_variables":["__r1b0"],"binding_accesses":["__r1b0"],"children":[{"type":"PlacedT","expression":"__r1b0","free_variables":["__r1b0"],"binding_accesses":["__r1b0"],"children":[]}]}]},{"type":"ColorT","expression":"ColorV 2","free_variables":[],"binding_accesses":[],"children":[]}]}]},"repeated_occurrences":13,"mdl_saving":44,"saving_scope":"exact-valid program portfolio","template":{"type":"ArrowT PlacedT BoolT","expression":"(lambda __r1b0:PlacedT. contains(ObjectColors(objectOf(__r1b0)),ColorV 2))","free_variables":[],"binding_accesses":["__r1b0"],"children":[{"type":"BoolT","expression":"contains(ObjectColors(objectOf(__r1b0)),ColorV 2)","free_variables":["__r1b0"],"binding_accesses":["__r1b0"],"children":[{"type":"SetT ColorT","expression":"ObjectColors(objectOf(__r1b0))","free_variables":["__r1b0"],"binding_accesses":["__r1b0"],"children":[{"type":"ObjectT","expression":"objectOf(__r1b0)","free_variables":["__r1b0"],"binding_accesses":["__r1b0"],"children":[{"type":"PlacedT","expression":"__r1b0","free_variables":["__r1b0"],"binding_accesses":["__r1b0"],"children":[]}]}]},{"type":"ColorT","expression":"ColorV 2","free_variables":[],"binding_accesses":[],"children":[]}]}]},"parameters":[],"expansion":"ordinary checked Base lambda/application; no invention-specific primitive or witness","evidence":"typed anti-unification/exact pattern; explicit lambda lifting; disjoint portfolio MDL; Base definition expansion"},{"name":"I1","source":"TaskInvented","originating_ast":{"type":"ArrowT PlacedT BoolT","expression":"(lambda __r1b0:PlacedT. less(x(Anchor(__r1b0,TL)),IntV 9))","free_variables":[],"binding_accesses":["__r1b0"],"children":[{"type":"BoolT","expression":"less(x(Anchor(__r1b0,TL)),IntV 9)","free_variables":["__r1b0"],"binding_accesses":["__r1b0"],"children":[{"type":"IntT","expression":"x(Anchor(__r1b0,TL))","free_variables":["__r1b0"],"binding_accesses":["__r1b0"],"children":[{"type":"CoordT","expression":"Anchor(__r1b0,TL)","free_variables":["__r1b0"],"binding_accesses":["__r1b0"],"children":[{"type":"PlacedT","expression":"__r1b0","free_variables":["__r1b0"],"binding_accesses":["__r1b0"],"children":[]},{"type":"AnchorT","expression":"TL","free_variables":[],"binding_accesses":[],"children":[]}]}]},{"type":"IntT","expression":"IntV 9","free_variables":[],"binding_accesses":[],"children":[]}]}]},"repeated_occurrences":2,"mdl_saving":1,"saving_scope":"exact-valid program portfolio","template":{"type":"ArrowT PlacedT BoolT","expression":"(lambda __r1b0:PlacedT. less(x(Anchor(__r1b0,TL)),IntV 9))","free_variables":[],"binding_accesses":["__r1b0"],"children":[{"type":"BoolT","expression":"less(x(Anchor(__r1b0,TL)),IntV 9)","free_variables":["__r1b0"],"binding_accesses":["__r1b0"],"children":[{"type":"IntT","expression":"x(Anchor(__r1b0,TL))","free_variables":["__r1b0"],"binding_accesses":["__r1b0"],"children":[{"type":"CoordT","expression":"Anchor(__r1b0,TL)","free_variables":["__r1b0"],"binding_accesses":["__r1b0"],"children":[{"type":"PlacedT","expression":"__r1b0","free_variables":["__r1b0"],"binding_accesses":["__r1b0"],"children":[]},{"type":"AnchorT","expression":"TL","free_variables":[],"binding_accesses":[],"children":[]}]}]},{"type":"IntT","expression":"IntV 9","free_variables":[],"binding_accesses":[],"children":[]}]}]},"parameters":[],"expansion":"ordinary checked Base lambda/application; no invention-specific primitive or witness","evidence":"typed anti-unification/exact pattern; explicit lambda lifting; disjoint portfolio MDL; Base definition expansion"},{"name":"I2","source":"TaskInvented","originating_ast":{"type":"ArrowT PlacedT BoolT","expression":"(lambda __r1b0:PlacedT. less(x(Anchor(__r1b0,TL)),IntV 10))","free_variables":[],"binding_accesses":["__r1b0"],"children":[{"type":"BoolT","expression":"less(x(Anchor(__r1b0,TL)),IntV 10)","free_variables":["__r1b0"],"binding_accesses":["__r1b0"],"children":[{"type":"IntT","expression":"x(Anchor(__r1b0,TL))","free_variables":["__r1b0"],"binding_accesses":["__r1b0"],"children":[{"type":"CoordT","expression":"Anchor(__r1b0,TL)","free_variables":["__r1b0"],"binding_accesses":["__r1b0"],"children":[{"type":"PlacedT","expression":"__r1b0","free_variables":["__r1b0"],"binding_accesses":["__r1b0"],"children":[]},{"type":"AnchorT","expression":"TL","free_variables":[],"binding_accesses":[],"children":[]}]}]},{"type":"IntT","expression":"IntV 10","free_variables":[],"binding_accesses":[],"children":[]}]}]},"repeated_occurrences":2,"mdl_saving":1,"saving_scope":"exact-valid program portfolio","template":{"type":"ArrowT PlacedT BoolT","expression":"(lambda __r1b0:PlacedT. less(x(Anchor(__r1b0,TL)),IntV 10))","free_variables":[],"binding_accesses":["__r1b0"],"children":[{"type":"BoolT","expression":"less(x(Anchor(__r1b0,TL)),IntV 10)","free_variables":["__r1b0"],"binding_accesses":["__r1b0"],"children":[{"type":"IntT","expression":"x(Anchor(__r1b0,TL))","free_variables":["__r1b0"],"binding_accesses":["__r1b0"],"children":[{"type":"CoordT","expression":"Anchor(__r1b0,TL)","free_variables":["__r1b0"],"binding_accesses":["__r1b0"],"children":[{"type":"PlacedT","expression":"__r1b0","free_variables":["__r1b0"],"binding_accesses":["__r1b0"],"children":[]},{"type":"AnchorT","expression":"TL","free_variables":[],"binding_accesses":[],"children":[]}]}]},{"type":"IntT","expression":"IntV 10","free_variables":[],"binding_accesses":[],"children":[]}]}]},"parameters":[],"expansion":"ordinary checked Base lambda/application; no invention-specific primitive or witness","evidence":"typed anti-unification/exact pattern; explicit lambda lifting; disjoint portfolio MDL; Base definition expansion"},{"name":"I3","source":"TaskInvented","originating_ast":{"type":"ArrowT PlacedT BoolT","expression":"(lambda __r1b0:PlacedT. less(x(Anchor(__r1b0,TR)),IntV 10))","free_variables":[],"binding_accesses":["__r1b0"],"children":[{"type":"BoolT","expression":"less(x(Anchor(__r1b0,TR)),IntV 10)","free_variables":["__r1b0"],"binding_accesses":["__r1b0"],"children":[{"type":"IntT","expression":"x(Anchor(__r1b0,TR))","free_variables":["__r1b0"],"binding_accesses":["__r1b0"],"children":[{"type":"CoordT","expression":"Anchor(__r1b0,TR)","free_variables":["__r1b0"],"binding_accesses":["__r1b0"],"children":[{"type":"PlacedT","expression":"__r1b0","free_variables":["__r1b0"],"binding_accesses":["__r1b0"],"children":[]},{"type":"AnchorT","expression":"TR","free_variables":[],"binding_accesses":[],"children":[]}]}]},{"type":"IntT","expression":"IntV 10","free_variables":[],"binding_accesses":[],"children":[]}]}]},"repeated_occurrences":2,"mdl_saving":1,"saving_scope":"exact-valid program portfolio","template":{"type":"ArrowT PlacedT BoolT","expression":"(lambda __r1b0:PlacedT. less(x(Anchor(__r1b0,TR)),IntV 10))","free_variables":[],"binding_accesses":["__r1b0"],"children":[{"type":"BoolT","expression":"less(x(Anchor(__r1b0,TR)),IntV 10)","free_variables":["__r1b0"],"binding_accesses":["__r1b0"],"children":[{"type":"IntT","expression":"x(Anchor(__r1b0,TR))","free_variables":["__r1b0"],"binding_accesses":["__r1b0"],"children":[{"type":"CoordT","expression":"Anchor(__r1b0,TR)","free_variables":["__r1b0"],"binding_accesses":["__r1b0"],"children":[{"type":"PlacedT","expression":"__r1b0","free_variables":["__r1b0"],"binding_accesses":["__r1b0"],"children":[]},{"type":"AnchorT","expression":"TR","free_variables":[],"binding_accesses":[],"children":[]}]}]},{"type":"IntT","expression":"IntV 10","free_variables":[],"binding_accesses":[],"children":[]}]}]},"parameters":[],"expansion":"ordinary checked Base lambda/application; no invention-specific primitive or witness","evidence":"typed anti-unification/exact pattern; explicit lambda lifting; disjoint portfolio MDL; Base definition expansion"},{"name":"I4","source":"TaskInvented","originating_ast":{"type":"ArrowT PlacedT BoolT","expression":"(lambda __r1b0:PlacedT. less(x(Anchor(__r1b0,BL)),IntV 9))","free_variables":[],"binding_accesses":["__r1b0"],"children":[{"type":"BoolT","expression":"less(x(Anchor(__r1b0,BL)),IntV 9)","free_variables":["__r1b0"],"binding_accesses":["__r1b0"],"children":[{"type":"IntT","expression":"x(Anchor(__r1b0,BL))","free_variables":["__r1b0"],"binding_accesses":["__r1b0"],"children":[{"type":"CoordT","expression":"Anchor(__r1b0,BL)","free_variables":["__r1b0"],"binding_accesses":["__r1b0"],"children":[{"type":"PlacedT","expression":"__r1b0","free_variables":["__r1b0"],"binding_accesses":["__r1b0"],"children":[]},{"type":"AnchorT","expression":"BL","free_variables":[],"binding_accesses":[],"children":[]}]}]},{"type":"IntT","expression":"IntV 9","free_variables":[],"binding_accesses":[],"children":[]}]}]},"repeated_occurrences":2,"mdl_saving":1,"saving_scope":"exact-valid program portfolio","template":{"type":"ArrowT PlacedT BoolT","expression":"(lambda __r1b0:PlacedT. less(x(Anchor(__r1b0,BL)),IntV 9))","free_variables":[],"binding_accesses":["__r1b0"],"children":[{"type":"BoolT","expression":"less(x(Anchor(__r1b0,BL)),IntV 9)","free_variables":["__r1b0"],"binding_accesses":["__r1b0"],"children":[{"type":"IntT","expression":"x(Anchor(__r1b0,BL))","free_variables":["__r1b0"],"binding_accesses":["__r1b0"],"children":[{"type":"CoordT","expression":"Anchor(__r1b0,BL)","free_variables":["__r1b0"],"binding_accesses":["__r1b0"],"children":[{"type":"PlacedT","expression":"__r1b0","free_variables":["__r1b0"],"binding_accesses":["__r1b0"],"children":[]},{"type":"AnchorT","expression":"BL","free_variables":[],"binding_accesses":[],"children":[]}]}]},{"type":"IntT","expression":"IntV 9","free_variables":[],"binding_accesses":[],"children":[]}]}]},"parameters":[],"expansion":"ordinary checked Base lambda/application; no invention-specific primitive or witness","evidence":"typed anti-unification/exact pattern; explicit lambda lifting; disjoint portfolio MDL; Base definition expansion"},{"name":"I5","source":"TaskInvented","originating_ast":{"type":"ArrowT PlacedT BoolT","expression":"(lambda __r1b0:PlacedT. less(x(Anchor(__r1b0,BL)),IntV 10))","free_variables":[],"binding_accesses":["__r1b0"],"children":[{"type":"BoolT","expression":"less(x(Anchor(__r1b0,BL)),IntV 10)","free_variables":["__r1b0"],"binding_accesses":["__r1b0"],"children":[{"type":"IntT","expression":"x(Anchor(__r1b0,BL))","free_variables":["__r1b0"],"binding_accesses":["__r1b0"],"children":[{"type":"CoordT","expression":"Anchor(__r1b0,BL)","free_variables":["__r1b0"],"binding_accesses":["__r1b0"],"children":[{"type":"PlacedT","expression":"__r1b0","free_variables":["__r1b0"],"binding_accesses":["__r1b0"],"children":[]},{"type":"AnchorT","expression":"BL","free_variables":[],"binding_accesses":[],"children":[]}]}]},{"type":"IntT","expression":"IntV 10","free_variables":[],"binding_accesses":[],"children":[]}]}]},"repeated_occurrences":2,"mdl_saving":1,"saving_scope":"exact-valid program portfolio","template":{"type":"ArrowT PlacedT BoolT","expression":"(lambda __r1b0:PlacedT. less(x(Anchor(__r1b0,BL)),IntV 10))","free_variables":[],"binding_accesses":["__r1b0"],"children":[{"type":"BoolT","expression":"less(x(Anchor(__r1b0,BL)),IntV 10)","free_variables":["__r1b0"],"binding_accesses":["__r1b0"],"children":[{"type":"IntT","expression":"x(Anchor(__r1b0,BL))","free_variables":["__r1b0"],"binding_accesses":["__r1b0"],"children":[{"type":"CoordT","expression":"Anchor(__r1b0,BL)","free_variables":["__r1b0"],"binding_accesses":["__r1b0"],"children":[{"type":"PlacedT","expression":"__r1b0","free_variables":["__r1b0"],"binding_accesses":["__r1b0"],"children":[]},{"type":"AnchorT","expression":"BL","free_variables":[],"binding_accesses":[],"children":[]}]}]},{"type":"IntT","expression":"IntV 10","free_variables":[],"binding_accesses":[],"children":[]}]}]},"parameters":[],"expansion":"ordinary checked Base lambda/application; no invention-specific primitive or witness","evidence":"typed anti-unification/exact pattern; explicit lambda lifting; disjoint portfolio MDL; Base definition expansion"}],"statistics":{"abstraction_discovery_work":10945,"abstraction_rounds":2,"base_symbols_activated":18,"base_symbols_rejected":46,"bottom_up_terms":0,"branch_points":6,"depth_cutoffs":0,"distinct_symbol_count":9,"effect_pruned":0,"exact_verifier_calls":32,"expression_tests":24556,"failed_witness_decompositions":0,"first_solution_states":38977,"fv_bindings_eliminated":9176,"induced_tsl_symbol_count":24,"invented_abstractions":6,"invention_expansion_tests":66,"invention_hits":16,"join_nodes":146,"lookahead_witness_calls":235,"materialized_child_asts":1514,"materialized_complete_asts":32,"memo_hits":227,"memo_queries":371,"memoized_learning_tasks":16,"observer_terms":2443,"program_ast_length":14,"propagation_steps":2456,"recursive_learning_tasks":371,"root_learning_tasks":1,"semantic_deduplications":0,"structural_deduplications":222,"structural_prior_count":0,"successful_witness_decompositions":192,"synthesis_work_after_discovery":1144,"synthesis_work_before_discovery":26888,"total_expanded_work":38977,"union_nodes":46,"version_space_nodes":293,"witness_calls":380,"witness_unavailable":121,"wall_clock_seconds":7.9239848},"bounded":false,"base_expressibility":"Expressible: exact Base program is constructive evidence","reachability":"Reachable within configured specification/witness/search bounds","configuration":{"work_budget":250000,"depth":7,"frontier":32,"correspondence_budget":32,"abstraction_limits":"Limits {maxRounds = 2, maxInventions = 6, maxAST = 96, maxParameters = 4}"},"mdl":{"score":25,"ast_length":14,"distinct_symbols":9,"portfolio_saving":49},"secondary_latent_path":"Base observer expressions only; v0.3 handwritten hierarchical codecs are legacy and are not called","predictions":[[[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,2,2,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,2,2,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]]]}
```

Limits: depth=7, extraction frontier=32; 64 witness decompositions/rule; 96 observer terms/type with 2 semantic alternatives. Forward observers are bounded Base subexpressions, not complete programs. The version space is the discovered bounded support, not all possible Base programs.

Abstraction is typed anti-unification plus explicit lambda lifting. MDL compares a nonoverlapping portfolio cover including definition and argument costs. Accepted definitions feed later Learn through checked Base expansion, with matching tests counted. Online rounds and all dictionary/AST/parameter bounds are finite. `I<n>` has no preassigned semantic label.

Legacy hierarchical codecs are retained in solve-v03 and measured separately. This solver constructs its grounded observations from Base expressions; richer local/global codec discovery remains a coverage limitation.
