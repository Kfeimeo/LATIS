module Synthesis.InducedR1.Abstraction where
import Language.Induced.Base
import qualified Data.Map.Strict as M
import qualified Data.Set as S
import Data.List (sortOn,nub)
import Control.Monad (foldM,guard)

data Invention = Invention
  { inventionName :: String, inventionBody :: Expr, inventionTemplate :: Expr
  , inventionParameters :: [(String,Type)], inventionOccurrences :: Int
  , inventionSaving :: Int, inventionEvidence :: String
  } deriving (Eq,Show)

data Limits = Limits { maxRounds :: Int, maxInventions :: Int, maxAST :: Int, maxParameters :: Int }
  deriving (Eq,Show)
defaultLimits :: Limits
defaultLimits=Limits 2 6 96 4

-- Binder normalization preserves free variables. Generated names are reserved
-- locally; inputs using them are rejected before discovery to prevent capture.
normalize :: Expr -> Expr
normalize expr=go M.empty (0::Int) expr
  where
    prefix=head [p | p<-iterate (++"_") "__r1b",all (\n->take (length p) n/=p) (S.toList (freeVars expr))]
    go env depth e=case exprNode e of
      Var n->variable (M.findWithDefault n n env) (exprType e)
      Lam n t b->let fresh=prefix++show depth in lambda fresh t (go (M.insert n fresh env) (depth+1) b)
      Let n a b->let fresh=prefix++show depth in binding fresh (go env depth a) (go (M.insert n fresh env) (depth+1) b)
      App a b->must (application (go env depth a) (go env depth b))
      Prim n as->must (call n (exprType e) (map (go env depth) as))
      _->e
    must=either error id

variables :: Expr -> M.Map String Type
variables e=M.unions (local:map variables (children e))
  where local=case exprNode e of Var n->M.singleton n (exprType e); _->M.empty

-- First-order typed anti-unification under aligned binders. A mismatch that
-- depends on a local binder is rejected (no unsafe capture or higher-order AU).
-- Identical mismatch pairs share one parameter; types never unify implicitly.
antiUnify :: Expr -> Expr -> Maybe Expr
antiUnify a b=do
  guard (all (\n->take 5 n/="__r1h") (S.toList (S.union (freeVars a) (freeVars b))))
  fst <$> go S.empty M.empty (normalize a) (normalize b)
  where
    go bound holes x y
      | exprType x/=exprType y=Nothing
      | x==y=Just (x,holes)
      | otherwise=case (exprNode x,exprNode y) of
          (Prim n xs,Prim m ys) | n==m && length xs==length ys->do
            (zs,h)<-walk bound holes (zip xs ys)
            z<-either (const Nothing) Just (call n (exprType x) zs)
            pure (z,h)
          (App f u,App g v)->do
            (zs,h)<-walk bound holes [(f,g),(u,v)]
            case zs of
              [f',u']->do
                z<-either (const Nothing) Just (application f' u')
                pure (z,h)
              _->Nothing
          (Lam n t u,Lam m s v) | n==m && t==s->do
            (z,h)<-go (S.insert n bound) holes u v
            pure (lambda n t z,h)
          (Let n u v,Let m w z) | n==m->do
            (a',h)<-go bound holes u w
            (b',h')<-go (S.insert n bound) h v z
            pure (binding n a' b',h')
          _->do
            guard (S.null (S.intersection bound (S.union (freeVars x) (freeVars y))))
            let key=(x,y); name=M.findWithDefault ("__r1h"++show (M.size holes)) key holes
            pure (variable name (exprType x),M.insert key name holes)
    walk _ h []=Just ([],h)
    walk bs h ((x,y):rest)=do
      (z,h')<-go bs h x y
      (zs,h'')<-walk bs h' rest
      pure (z:zs,h'')

-- Lambda lifting is the only way an open template becomes a definition.
liftTemplate :: Bool -> Limits -> Expr -> Maybe (Expr,[(String,Type)])
liftTemplate lifting lim e=do
  let ps=[(n,t) | (n,t)<-M.toAscList (variables e),S.member n (freeVars e)]
      def=foldr (uncurry lambda) e ps
  guard (lifting || null ps)
  guard (length ps<=maxParameters lim && exprLength def<=maxAST lim)
  guard (S.null (freeVars def) && typeCheck M.empty def==Right (exprType def))
  pure (def,ps)

matchTemplate :: Invention -> Expr -> Maybe [Expr]
matchTemplate inv target=do
  subst<-go S.empty M.empty (inventionTemplate inv) (normalize target)
  traverse (\(n,_)->M.lookup n subst) (inventionParameters inv)
  where
    holes=S.fromList (map fst (inventionParameters inv))
    go bound subst p t
      | exprType p/=exprType t=Nothing
      | Var n<-exprNode p,S.member n holes=do
        guard (S.null (S.intersection bound (freeVars t)))
        case M.lookup n subst of
          Nothing->Just (M.insert n t subst)
          Just old | old==t->Just subst
          _->Nothing
      | otherwise=case (exprNode p,exprNode t) of
          (Var n,Var m) | n==m->Just subst
          (Lit a,Lit b) | a==b->Just subst
          (Prim n xs,Prim m ys) | n==m && length xs==length ys->foldM (\s (a,b)->go bound s a b) subst (zip xs ys)
          (App a b,App c d)->go bound subst a c >>= \s->go bound s b d
          (Lam n a b,Lam m c d) | n==m && a==c->go (S.insert n bound) subst b d
          (Let n a b,Let m c d) | n==m->go bound subst a c >>= \s->go (S.insert n bound) s b d
          _->Nothing

-- A compact reference costs 2 plus its explicit argument ASTs. Choose a
-- nonoverlapping cover, so nested occurrences are never double-counted.
encodedLength :: [Invention] -> Expr -> Int
encodedLength invs e=minimum ((1+sum (map (encodedLength invs) (children e))):
  [2+sum (map exprLength args) | i<-invs,Just args<-[matchTemplate i e]])
dictionaryCost :: [Invention] -> Int
dictionaryCost=sum . map ((+2) . exprLength . inventionBody)
portfolioCost :: [Invention] -> [Expr] -> Int
portfolioCost invs ps=dictionaryCost invs+sum (map (encodedLength invs) ps)

discoverOnline :: Bool -> Bool -> Limits -> [Invention] -> [Expr] -> [Invention]
discoverOnline au lifting lim old programs=fst (discoverOnlineCounted au lifting lim old programs)

-- Logical discovery units: input AST visits, AU pair attempts, lifting
-- attempts, and portfolio-program MDL evaluations. These are NOT CPU
-- instructions; timings must be reported separately from synthesis states.
discoverOnlineCounted :: Bool -> Bool -> Limits -> [Invention] -> [Expr] -> ([Invention],Int)
discoverOnlineCounted au lifting lim old programs=
  let (accepted,scoreUnits)=choose old (maxInventions lim-length old)
  in (accepted,sum (map exprLength ps)+(if au then length pairDomain else 0)+length patterns+scoreUnits)
  where
    ps=S.toList (S.fromList programs)
    terms e=e:concatMap terms (children e)
    ts=take 160 $ nub [normalize e | p<-ps,e<-terms p,exprLength e>=6,exprLength e<=maxAST lim
                         ,exprType e/=ArrowT SceneT SceneT]
    pairDomain=take 512 [(a,b) | (i,a)<-zip [0::Int ..] ts,b<-drop (i+1) ts,exprType a==exprType b]
    patterns=nub (ts++[p | au,(a,b)<-pairDomain,Just p<-[antiUnify a b],exprLength p>=6])
    raw=[Invention "" def p params count 0 "typed anti-unification/exact pattern; explicit lambda lifting; disjoint portfolio MDL; Base definition expansion"
         | p<-patterns,Just (def,params)<-[liftTemplate lifting lim p],exprType def/=ArrowT SceneT SceneT
         ,let proto=Invention "" def p params 0 0 ""
              count=length [() | prog<-ps,e<-terms prog,Just _<-[matchTemplate proto e]]
         ,count>=2]
    choose accepted left
      | left<=0=([],0)
      | otherwise=case sortOn (\(saving,i)->(if null (inventionParameters i) && isFunction (inventionBody i) then (0::Int) else 1
                            ,exprLength (inventionBody i),negate saving)) scored of
          []->([],scoreCost)
          (saving,i):_->let named=i {inventionName="I"++show (length accepted),inventionSaving=saving}
                            (rest,units)=choose (accepted++[named]) (left-1)
                        in (named:rest,scoreCost+units)
      where
        before=portfolioCost accepted ps
        eligible=[i | i<-raw,all ((/=normalize (inventionBody i)) . normalize . inventionBody) accepted]
        scoreCost=(1+length eligible)*length ps
        scored=[(saving,i) | i<-eligible
                           ,let saving=before-portfolioCost (accepted++[i]) ps,saving>0]
    isFunction e=case exprType e of ArrowT _ _->True; _->False

-- References are represented by ordinary typed application, and evaluated by
-- the unchanged Base kernel. There is no invention-specific inverse semantics.
expandUse :: Invention -> [Expr] -> Either String Expr
expandUse i=foldM application (inventionBody i)

alpha :: Expr -> String
alpha=show . normalize
