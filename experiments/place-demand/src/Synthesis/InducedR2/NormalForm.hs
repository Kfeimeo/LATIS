-- Universal Base equalities only. Original leaves/signatures remain in the
-- VSA; extraction shares these proven-equivalent computational forms. None
-- of these rewrites is justified merely by equality on training examples.
module Synthesis.InducedR2.NormalForm where
import Language.Induced.Base
import Synthesis.InducedR2.Sharing (rebuild)

normalForm :: Expr -> Expr
normalForm original=rewrite (rebuild original (map normalForm (children original)))
  where
    op n t xs=either (const original) id (call n t xs)
    rewrite e=case exprNode e of
      Prim "add" [a,b] | zero b->a
      Prim "add" [a,b] | zero a->b
      Prim "subtract" [a,b] | zero b->a
      Prim "subtract" [a,b] | Lit (IntV i)<-exprNode b->op "add" IntT [a,literal (IntV (negate i))]
      Prim "multiply" [a,b] | one b->a
      Prim "multiply" [a,b] | one a->b
      Prim "index" [xs,i] | zero i->op "head" (exprType e) [xs]
      Prim "index" [xs,i] | one i->op "head" (exprType e) [op "tail" (exprType xs) [xs]]
      Prim axis [anch] | axis `elem` ["x","y"],Prim "Anchor" [p,a]<-exprNode anch,Lit (AnchorV i)<-exprNode a
        ->let j=case (axis,i) of ("x",2)->0; ("x",1)->3; ("y",1)->0; ("y",2)->3; _->i
          in op axis IntT [op "Anchor" CoordT [p,literal (AnchorV j)]]
      _->e
    zero e=exprNode e==Lit (IntV 0)
    one e=exprNode e==Lit (IntV 1)
