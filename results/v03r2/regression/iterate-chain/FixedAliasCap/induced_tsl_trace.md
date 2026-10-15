# LATIS v0.3R.2
StructuralPriorCount=0. Counterfactual labels never guide synthesis.
```text
Root specification Q0: ArrowT SceneT SceneT; observations=2; Gamma=[]. Original Grid targets reserved for exact verification.
Learn(ArrowT SceneT SceneT; observations=2; Gamma=[]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,1)]
Learn(SceneT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","mkScene"]
MRV immediate domains=[(0,2),(1,3),(2,1)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,2)]
Learn(ArrowT PlacedT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,1)]
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,2),(1,1)]
Learn(VecT; observations=2; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
MRV immediate domains=[(0,3),(1,3)]
Nonempty VS_vec node=8 children=[4,7]; component projection of output specification
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_coordDelta node=15 children=[11,14]; indexed algebra inverse; child equivalence classes retain all structural representatives
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_coordDelta node=22 children=[18,21]; indexed algebra inverse; child equivalence classes retain all structural representatives
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_coordDelta node=29 children=[25,28]; indexed algebra inverse; child equivalence classes retain all structural representatives
MRV immediate domains=[(0,2),(1,2)]
Nonempty VS_coordDelta node=36 children=[32,35]; indexed algebra inverse; child equivalence classes retain all structural representatives
MRV immediate domains=[(0,1),(1,1)]
Nonempty VS_vecAdd node=41 children=[38,40]; coordinate/vector inverse: condition on right operand and deduce left component specification
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Nonempty VS_Translate node=46 children=[45,42]; Translate: v_i=Anchor(target_i,TL)-Anchor(source_i,TL); Vec specification=[Vec 2 0,Vec 2 0]
Nonempty VS_lambda node=47 children=[46]; function graph -> parameter binding and output points
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_map node=51 children=[47,50]; map witness: corresponding f(x_i)=y_i; element instances=2
Learn(SizeT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","size","canvasSize"]
Learn(ColorT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","background"]
Nonempty VS_mkScene node=58 children=[54,57,51]; mkScene residual: canonical correspondence + Render-validated paint order; branch=0
Nonempty VS_lambda node=59 children=[58]; function graph -> parameter binding and output points
Task TSL supported Base=["ObjectCells","ObjectColors","Translate","add","background","canvasSize","cardinality","colorToInt","coord","coordDelta","head","height","lambda","literal","map","mkScene","objectOf","objects","sortBy","vec","vecAdd","width"]
Cost saturation C=1..96 root representatives=[(1,0),(2,0),(3,0),(4,0),(5,0),(6,0),(7,0),(8,0),(9,0),(10,0),(11,0),(12,0),(13,0),(14,0),(15,0),(16,0),(17,0),(18,0),(19,0),(20,1),(21,2),(22,2),(23,2),(24,2),(25,2),(26,2),(27,2),(28,2),(29,2),(30,2),(31,2),(32,2),(33,2),(34,2),(35,2),(36,2),(37,2),(38,2),(39,2),(40,2),(41,2),(42,2),(43,2),(44,2),(45,2),(46,2),(47,2),(48,2),(49,2),(50,2),(51,2),(52,2),(53,2),(54,2),(55,2),(56,2),(57,2),(58,2),(59,2),(60,2),(61,2),(62,2),(63,2),(64,2),(65,2),(66,2),(67,2),(68,2),(69,2),(70,2),(71,2),(72,2),(73,2),(74,2),(75,2),(76,2),(77,2),(78,2),(79,2),(80,2),(81,2),(82,2),(83,2),(84,2),(85,2),(86,2),(87,2),(88,2),(89,2),(90,2),(91,2),(92,2),(93,2),(94,2),(95,2),(96,2)]
Abstraction round=0; exact frontier=2; accepted=["I0"]
Learn uses I0 by typed definition expansion; ArrowT PlacedT PlacedT; observations=2; Gamma=[("v0",SceneT)]
Task TSL supported Base=["ObjectCells","ObjectColors","Translate","add","background","canvasSize","cardinality","colorToInt","coord","coordDelta","head","height","lambda","literal","map","mkScene","objectOf","objects","sortBy","vec","vecAdd","width"]
Cost saturation C=1..96 root representatives=[(1,0),(2,0),(3,0),(4,0),(5,0),(6,0),(7,0),(8,0),(9,0),(10,0),(11,0),(12,0),(13,0),(14,0),(15,0),(16,0),(17,0),(18,0),(19,0),(20,1),(21,2),(22,2),(23,2),(24,2),(25,2),(26,2),(27,2),(28,2),(29,2),(30,2),(31,2),(32,2),(33,2),(34,2),(35,2),(36,2),(37,2),(38,2),(39,2),(40,2),(41,2),(42,2),(43,2),(44,2),(45,2),(46,2),(47,2),(48,2),(49,2),(50,2),(51,2),(52,2),(53,2),(54,2),(55,2),(56,2),(57,2),(58,2),(59,2),(60,2),(61,2),(62,2),(63,2),(64,2),(65,2),(66,2),(67,2),(68,2),(69,2),(70,2),(71,2),(72,2),(73,2),(74,2),(75,2),(76,2),(77,2),(78,2),(79,2),(80,2),(81,2),(82,2),(83,2),(84,2),(85,2),(86,2),(87,2),(88,2),(89,2),(90,2),(91,2),(92,2),(93,2),(94,2),(95,2),(96,2)]
Abstraction round=1; exact frontier=2; accepted=[]
Cost saturation C=1..96 root representatives=[(1,0),(2,0),(3,0),(4,0),(5,0),(6,0),(7,0),(8,0),(9,0),(10,0),(11,0),(12,0),(13,0),(14,0),(15,0),(16,0),(17,0),(18,0),(19,0),(20,1),(21,2),(22,2),(23,2),(24,2),(25,2),(26,2),(27,2),(28,2),(29,2),(30,2),(31,2),(32,2),(33,2),(34,2),(35,2),(36,2),(37,2),(38,2),(39,2),(40,2),(41,2),(42,2),(43,2),(44,2),(45,2),(46,2),(47,2),(48,2),(49,2),(50,2),(51,2),(52,2),(53,2),(54,2),(55,2),(56,2),(57,2),(58,2),(59,2),(60,2),(61,2),(62,2),(63,2),(64,2),(65,2),(66,2),(67,2),(68,2),(69,2),(70,2),(71,2),(72,2),(73,2),(74,2),(75,2),(76,2),(77,2),(78,2),(79,2),(80,2),(81,2),(82,2),(83,2),(84,2),(85,2),(86,2),(87,2),(88,2),(89,2),(90,2),(91,2),(92,2),(93,2),(94,2),(95,2),(96,2)]
Exact original Render(P(Encode(x)))=y: True; MDL rank=(33,12,2,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda __r1b0:PlacedT. Translate(__r1b0,vec(add(cardinality(ObjectColors(objectOf(__r1b0))),IntV 1),IntV 0))),objects(v0))))")
Exact original Render(P(Encode(x)))=y: True; MDL rank=(35,13,2,0,"(lambda v0:SceneT. mkScene(canvasSize(v0),background(v0),map((lambda __r1b0:PlacedT. Translate(__r1b0,vec(add(cardinality(ObjectColors(objectOf(__r1b0))),IntV 1),IntV 0))),objects(v0))))")
Selected AST; FV=[]; (lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda __r1b0:PlacedT. Translate(__r1b0,vec(add(cardinality(ObjectColors(objectOf(__r1b0))),IntV 1),IntV 0))),objects(v0))))
TaskInvented I0: (lambda __r1b0:PlacedT. Translate(__r1b0,vec(add(cardinality(ObjectColors(objectOf(__r1b0))),IntV 1),IntV 0))); repeats=2; portfolio MDL saving=5
Induced TSL=Signature(root VS) union inventions. BaseActivated=["ObjectCells","ObjectColors","Translate","add","background","canvasSize","cardinality","colorToInt","coord","coordDelta","head","height","lambda","literal","map","mkScene","objectOf","objects","sortBy","vec","vecAdd","width"]; TaskInvented=["I0"]; StructuralPriorCount=0
```
