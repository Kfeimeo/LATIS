-- Scope-safe CSE, using only the existing Base let constructor.
module Synthesis.InducedR2.Sharing where
import Language.Induced.Base
import qualified Data.Map.Strict as M
import qualified Data.Set as S
import Data.List (sortOn)
import Data.List (isPrefixOf)

share :: Expr -> Expr
share expression=common (unshareGenerated expression)
  where
    common e=case sortOn (negate . saving) candidates of
      a:_ | saving a>0->let { n=fresh e; rewritten=replaceScoped a (variable n (exprType a)) e }
                       in binding n (share a) (share rewritten)
      _->rebuild e (map share (children e))
      where
        counts=M.fromListWith (+) [(x,1::Int) | x<-descendants e,exprLength x>=3,not (isBinder x)]
        candidates=[x | (x,n)<-M.toList counts,n>1
                      ,freeVars x `S.isSubsetOf` freeVars e,not (isBinder x),strictOccurrences x e>0]
        saving a=(scopedOccurrences a e-1)*(exprLength a-1)-2
    isBinder e=case exprNode e of Lam _ _ _->True; Let _ _ _->True; _->False
    fresh e=head ["__cse"++show i | i<-[0::Int ..],S.notMember ("__cse"++show i) (allNames e)]

descendants :: Expr -> [Expr]
descendants e=concatMap (\x->x:descendants x) (children e)
allNames :: Expr -> S.Set String
allNames e=S.unions (name:S.toList (S.fromList (map allNames (children e))))
  where name=case exprNode e of Var n->S.singleton n; Lam n _ _->S.singleton n; Let n _ _->S.singleton n; _->S.empty
rebuild :: Expr -> [Expr] -> Expr
rebuild e es=case (exprNode e,es) of
  (Lam n t _,[b])->lambda n t b
  (Let n _ _,[a,b])->binding n a b
  (App _ _,[a,b])->either error id (application a b)
  (Prim n _,_)->either error id (call n (exprType e) es)
  _->e
replaceScoped :: Expr -> Expr -> Expr -> Expr
replaceScoped old new e
  | e==old=new
  | otherwise=case exprNode e of
      Lam n _ _ | S.member n (freeVars old)->e
      Let n a b | S.member n (freeVars old)->binding n (replaceScoped old new a) b
      _->rebuild e (map (replaceScoped old new) (children e))
scopedOccurrences :: Expr -> Expr -> Int
scopedOccurrences target e
  | target==e=1
  | otherwise=case exprNode e of
      Lam n _ _ | S.member n (freeVars target)->0
      Let n a _ | S.member n (freeVars target)->scopedOccurrences target a
      _->sum (map (scopedOccurrences target) (children e))
strictOccurrences :: Expr -> Expr -> Int
strictOccurrences target e
  | target==e=1
  | otherwise=case exprNode e of
      Lam _ _ _->0
      Prim "if" (condition:_)->strictOccurrences target condition
      _->sum (map (strictOccurrences target) (children e))
-- Undo only compiler-generated, definitely-used bindings before computing a
-- larger common DAG. This avoids locally optimal lets trapping global CSE.
-- A user binding or a lazy-only initializer keeps its original strictness.
unshareGenerated :: Expr -> Expr
unshareGenerated original=case exprNode e of
  Let n a b | "__cse" `isPrefixOf` n,strictOccurrences (variable n (exprType a)) b>0
    ->unshareGenerated (replaceScoped (variable n (exprType a)) a b)
  _->e
  where e=rebuild original (map unshareGenerated (children original))
sharingCount :: Expr -> Int
sharingCount e=(case exprNode e of Let _ _ _->1; _->0)+sum (map sharingCount (children e))
sharingSaving :: Expr -> Int
sharingSaving e=exprLength e-exprLength (share e)
