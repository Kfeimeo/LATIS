# LATIS v0.3R.2
StructuralPriorCount=0. Counterfactual labels never guide synthesis.
```text
Root specification Q0: ArrowT SceneT SceneT; observations=2; Gamma=[]. Original Grid targets reserved for exact verification.
Learn(ArrowT SceneT SceneT; observations=2; Gamma=[]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,1)]
Learn(SceneT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","mkScene"]
MRV immediate domains=[(0,2),(1,2),(2,1)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,1)]
Learn(ArrowT PlacedT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,1)]
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,1),(1,1)]
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Learn(VecT; observations=2; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_coordDelta node=9 children=[5,8]; indexed algebra inverse; child equivalence classes retain all structural representatives
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_coordDelta node=16 children=[12,15]; indexed algebra inverse; child equivalence classes retain all structural representatives
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_coordDelta node=23 children=[19,22]; indexed algebra inverse; child equivalence classes retain all structural representatives
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_coordDelta node=30 children=[26,29]; indexed algebra inverse; child equivalence classes retain all structural representatives
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_vec node=35 children=[32,34]; component projection of output specification
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_vecAdd node=40 children=[37,39]; coordinate/vector inverse: condition on right operand and deduce left component specification
Nonempty VS_Translate node=42 children=[1,41]; Translate: v_i=Anchor(target_i,TL)-Anchor(source_i,TL); Vec specification=[Vec 2 0,Vec 2 0]
Nonempty VS_lambda node=43 children=[42]; function graph -> parameter binding and output points
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_map node=45 children=[43,44]; map witness: corresponding f(x_i)=y_i; element instances=2
Learn(SizeT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","size","canvasSize"]
Learn(ColorT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","background"]
Nonempty VS_mkScene node=50 children=[48,49,45]; mkScene residual: canonical correspondence + Render-validated paint order; branch=0
Nonempty VS_lambda node=51 children=[50]; function graph -> parameter binding and output points
Task TSL supported Base=["Translate","add","canvasSize","coord","coordDelta","height","lambda","literal","map","mkScene","objects","vec","vecAdd","width"]
Cost saturation C=1..96 root representatives=[(1,0),(2,0),(3,0),(4,0),(5,0),(6,0),(7,0),(8,0),(9,0),(10,0),(11,0),(12,0),(13,0),(14,0),(15,0),(16,0),(17,0),(18,0),(19,0),(20,0),(21,0),(22,0),(23,0),(24,0),(25,0),(26,0),(27,1),(28,1),(29,1),(30,1),(31,1),(32,1),(33,1),(34,1),(35,1),(36,1),(37,1),(38,1),(39,1),(40,1),(41,1),(42,1),(43,1),(44,1),(45,1),(46,1),(47,1),(48,1),(49,1),(50,1),(51,1),(52,1),(53,1),(54,1),(55,1),(56,1),(57,1),(58,1),(59,1),(60,1),(61,1),(62,1),(63,1),(64,1),(65,1),(66,1),(67,1),(68,1),(69,1),(70,1),(71,1),(72,1),(73,1),(74,1),(75,1),(76,1),(77,1),(78,1),(79,1),(80,1),(81,1),(82,1),(83,1),(84,1),(85,1),(86,1),(87,1),(88,1),(89,1),(90,1),(91,1),(92,1),(93,1),(94,1),(95,1),(96,1)]
Abstraction round=0; exact frontier=1; accepted=[]
Exact original Render(P(Encode(x)))=y: True; MDL rank=(40,11,3,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. Translate(v1,coordDelta(coord(add(width(canvasSize(v0)),IntV 1),IntV 0),coord(add(width(canvasSize(v0)),IntV (-1)),IntV 0)))),objects(v0))))")
Selected AST; FV=[]; (lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. Translate(v1,coordDelta(coord(add(width(canvasSize(v0)),IntV 1),IntV 0),coord(add(width(canvasSize(v0)),IntV (-1)),IntV 0)))),objects(v0))))
Induced TSL=Signature(root VS) union inventions. BaseActivated=["Translate","add","canvasSize","coord","coordDelta","height","lambda","literal","map","mkScene","objects","vec","vecAdd","width"]; TaskInvented=[]; StructuralPriorCount=0
```
