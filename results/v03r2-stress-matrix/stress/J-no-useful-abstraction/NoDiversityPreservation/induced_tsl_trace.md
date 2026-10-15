# LATIS v0.3R.2
StructuralPriorCount=0. Counterfactual labels never guide synthesis.
```text
Root specification Q0: ArrowT SceneT SceneT; observations=2; Gamma=[]. Original Grid targets reserved for exact verification.
Learn(ArrowT SceneT SceneT; observations=2; Gamma=[]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,2)]
Learn(SceneT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","mkScene"]
MRV immediate domains=[(0,2),(1,2),(2,4)]
Learn(SizeT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","head","index","get","size","canvasSize"]
Learn(ColorT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","background"]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,1)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1)]
Learn(ArrowT PlacedT PlacedT; observations=6; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,1)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,1),(1,1)]
Learn(PlacedT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Learn(VecT; observations=6; Gamma=[("v0",SceneT),("v1",PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_Translate node=7 children=[5,6]; Translate: v_i=Anchor(target_i,TL)-Anchor(source_i,TL); Vec specification=[Vec 1 0,Vec 1 0,Vec 1 0,Vec 1 0,Vec 1 0,Vec 1 0]
Nonempty VS_lambda node=8 children=[7]; function graph -> parameter binding and output points
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_map node=10 children=[8,9]; map witness: corresponding f(x_i)=y_i; element instances=6
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,1)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,1),(1,1)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_Translate node=12 children=[11,6]; Translate: v_i=Anchor(target_i,TL)-Anchor(source_i,TL); Vec specification=[Vec 1 0,Vec 1 0,Vec 1 0,Vec 1 0]
Nonempty VS_lambda node=13 children=[12]; function graph -> parameter binding and output points
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,1),(1,1)]
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Learn(VecT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_Translate node=15 children=[14,6]; Translate: v_i=Anchor(target_i,TL)-Anchor(source_i,TL); Vec specification=[Vec 1 0,Vec 1 0]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_scan node=17 children=[13,15,16]; scan witness: output head is seed; ((y_(i-1),x_i),y_i)=[(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 12, cy = 8}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 4, cy = 4}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 5, cy = 4}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 5, cy = 4}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3)], orientation = 0})) (PlacedV (Object {objectId = 0, position = Coord {cx = 2, cy = 3}, geometry = fromList [(Coord {cx = 0, cy = 0},1)], orientation = 0})),PlacedV (Object {objectId = 0, position = Coord {cx = 3, cy = 3}, geometry = fromList [(Coord {cx = 0, cy = 0},1)], orientation = 0})),(PairV (PlacedV (Object {objectId = 2, position = Coord {cx = 14, cy = 7}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 7, cy = 4}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 8, cy = 4}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 8, cy = 4}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3)], orientation = 0})) (PlacedV (Object {objectId = 0, position = Coord {cx = 4, cy = 2}, geometry = fromList [(Coord {cx = 0, cy = 0},1)], orientation = 0})),PlacedV (Object {objectId = 0, position = Coord {cx = 5, cy = 2}, geometry = fromList [(Coord {cx = 0, cy = 0},1)], orientation = 0}))]; includes-seed convention; no task classifier
Nonempty VS_mkScene node=19 children=[3,4,18]; mkScene residual: canonical correspondence + Render-validated paint order; branch=0
MRV immediate domains=[(0,2),(1,2),(2,4)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
MRV immediate domains=[(0,1),(1,1)]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_map node=21 children=[8,20]; map witness: corresponding f(x_i)=y_i; element instances=6
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,1)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,1),(1,1)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Learn(VecT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","vec","coordDelta","vecAdd","scale"]
Nonempty VS_Translate node=12 children=[11,6]; Translate: v_i=Anchor(target_i,TL)-Anchor(source_i,TL); Vec specification=[Vec 1 0,Vec 1 0,Vec 1 0,Vec 1 0]
Nonempty VS_lambda node=13 children=[12]; function graph -> parameter binding and output points
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
MRV immediate domains=[(0,1),(1,1)]
Learn(PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Nonempty VS_Translate node=23 children=[22,6]; Translate: v_i=Anchor(target_i,TL)-Anchor(source_i,TL); Vec specification=[Vec 1 0,Vec 1 0]
Learn(ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","map","filter","fold","scan","zipWith","sortBy","head","tail","index","concat","setToList","get","objects"]
Nonempty VS_scan node=25 children=[13,23,24]; scan witness: output head is seed; ((y_(i-1),x_i),y_i)=[(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 3, cy = 3}, geometry = fromList [(Coord {cx = 0, cy = 0},1)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 4, cy = 4}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 5, cy = 4}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 5, cy = 4}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 11, cy = 8}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 12, cy = 8}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6)], orientation = 0})),(PairV (PlacedV (Object {objectId = 0, position = Coord {cx = 5, cy = 2}, geometry = fromList [(Coord {cx = 0, cy = 0},1)], orientation = 0})) (PlacedV (Object {objectId = 1, position = Coord {cx = 7, cy = 4}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3)], orientation = 0})),PlacedV (Object {objectId = 1, position = Coord {cx = 8, cy = 4}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3)], orientation = 0})),(PairV (PlacedV (Object {objectId = 1, position = Coord {cx = 8, cy = 4}, geometry = fromList [(Coord {cx = 0, cy = 0},3),(Coord {cx = 0, cy = 1},3)], orientation = 0})) (PlacedV (Object {objectId = 2, position = Coord {cx = 13, cy = 7}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6)], orientation = 0})),PlacedV (Object {objectId = 2, position = Coord {cx = 14, cy = 7}, geometry = fromList [(Coord {cx = 0, cy = 0},6),(Coord {cx = 0, cy = 1},6),(Coord {cx = 0, cy = 2},6)], orientation = 0}))]; includes-seed convention; no task classifier
MRV immediate domains=[(0,1),(1,1)]
map witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
MRV immediate domains=[(0,1),(1,1),(2,1)]
Learn(ArrowT (PairT PlacedT PlacedT) PlacedT; observations=4; Gamma=[("v0",SceneT)]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,0)]
Learn(PlacedT; observations=4; Gamma=[("v0",SceneT),("v1",PairT PlacedT PlacedT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","place","Translate","TransformD4","Recolor"]
Effect propagation rejects Translate under conditional observed-input domain
Effect propagation rejects TransformD4 under conditional observed-input domain
Effect propagation rejects Recolor under conditional observed-input domain
scan witness rejected: child VS empty; ListT PlacedT; observations=2; Gamma=[("v0",SceneT)]
Nonempty VS_mkScene node=27 children=[3,4,26]; mkScene residual: canonical correspondence + Render-validated paint order; branch=0
Nonempty VS_lambda node=29 children=[28]; function graph -> parameter binding and output points
Task TSL supported Base=["ObjectCells","Translate","canvasSize","cardinality","head","index","lambda","literal","map","mkScene","objectOf","objects","scan","snd","sortBy","subtract","tail"]
Cost saturation C=1..96 root representatives=[(1,0),(2,0),(3,0),(4,0),(5,0),(6,0),(7,0),(8,0),(9,0),(10,0),(11,0),(12,0),(13,1),(14,1),(15,1),(16,1),(17,1),(18,1),(19,1),(20,1),(21,1),(22,1),(23,1),(24,1),(25,1),(26,1),(27,1),(28,1),(29,1),(30,1),(31,1),(32,1),(33,1),(34,1),(35,1),(36,1),(37,1),(38,1),(39,1),(40,1),(41,1),(42,1),(43,1),(44,1),(45,1),(46,1),(47,1),(48,1),(49,1),(50,1),(51,1),(52,1),(53,1),(54,1),(55,1),(56,1),(57,1),(58,1),(59,1),(60,1),(61,1),(62,1),(63,1),(64,1),(65,1),(66,1),(67,1),(68,1),(69,1),(70,1),(71,1),(72,1),(73,1),(74,1),(75,1),(76,1),(77,1),(78,1),(79,1),(80,1),(81,1),(82,1),(83,1),(84,1),(85,1),(86,1),(87,1),(88,1),(89,1),(90,1),(91,1),(92,1),(93,1),(94,1),(95,1),(96,1)]
Abstraction round=0; exact frontier=1; accepted=[]
Exact original Render(P(Encode(x)))=y: True; MDL rank=(23,7,2,1,"(lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 0))),objects(v0))))")
Selected AST; FV=[]; (lambda v0:SceneT. mkScene(canvasSize(v0),ColorV 0,map((lambda v1:PlacedT. Translate(v1,VecV (Vec 1 0))),objects(v0))))
Induced TSL=Signature(root VS) union inventions. BaseActivated=["ObjectCells","Translate","canvasSize","cardinality","head","index","lambda","literal","map","mkScene","objectOf","objects","scan","snd","sortBy","subtract","tail"]; TaskInvented=[]; StructuralPriorCount=0
```
