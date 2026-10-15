# LATIS v0.3R.2
StructuralPriorCount=0. Counterfactual labels never guide synthesis.
```text
Root specification Q0: ArrowT SceneT SceneT; observations=2; Gamma=[]. Original Grid targets reserved for exact verification.
Learn(ArrowT SceneT SceneT; observations=2; Gamma=[]); return-compatible=["lambda","application","let","if","fst","snd","fold","head","index","get"]
MRV immediate domains=[(0,1)]
Learn(SceneT; observations=2; Gamma=[("v0",SceneT)]); return-compatible=["application","let","if","fst","snd","fold","argminBy","argmaxBy","head","index","get","mkScene"]
Nonempty VS_lambda node=2 children=[1]; function graph -> parameter binding and output points
Task TSL supported Base=["lambda"]
Cost saturation C=1..0 root representatives=[]
Abstraction round=0; exact frontier=1; accepted=[]
Exact original Render(P(Encode(x)))=y: True; MDL rank=(4,1,1,0,"(lambda v0:SceneT. v0)")
Selected AST; FV=[]; (lambda v0:SceneT. v0)
Induced TSL=Signature(root VS) union inventions. BaseActivated=["lambda"]; TaskInvented=[]; StructuralPriorCount=0
```
