module Synthesis.Induced.Abstraction where
import Language.Induced.Base
import qualified Data.Map.Strict as M
import qualified Data.Set as S
import Data.List (sortOn)

data Invention = Invention
  { inventionName :: String, inventionBody :: Expr, inventionOccurrences :: Int
  , inventionSaving :: Int, inventionEvidence :: String
  } deriving (Eq,Show)

-- Discovery is run ONLY after synthesis/exact verification. Repeated,
-- alpha-normalized lambda subtrees in the supported program portfolio supply
-- the evidence. Names are anonymous; a human may subsequently call one Attach.
-- Savings refer to the portfolio, not the single winning program. A one-use
-- lambda is not claimed to compress its already compact map/scan AST.
discover :: [Expr] -> [Invention]
discover programs=zipWith name [0::Int ..] selected
  where
    terms e=e:concatMap terms (children e)
    candidates=[e | p<-S.toList (S.fromList programs),e<-terms p,case exprNode e of Lam _ _ _->True; _->False
                   ,exprLength e>=8,not (S.null (symbols e)),S.null (freeVars e)]
    grouped=M.fromListWith (++) [(alpha e,[e]) | e<-candidates]
    scored=[(saving,e,length es) | es@(e:_)<-M.elems grouped,let count=length es
           ,let len=exprLength e,let saving=count*len-(len+2+count*2),count>=2,saving>0]
    -- Avoid duplicate whole-program/root lambdas and overlapping inventions:
    -- prefer the shortest useful repeated binding; whole Scene programs are
    -- excluded because dictionary entry costs would hide the experiment.
    selected=take 8 $ sortOn (\(saving,e,_)->(exprLength e,negate saving))
      [r | r@(_,e,_)<-scored,exprType e/=ArrowT SceneT SceneT]
    name i (saving,e,count)=Invention ("I"++show i) e count saving
      "exact repeated alpha-equivalent lambda subtrees across distinct exact-valid portfolio programs; definition cost=L+2, reference cost=2; no preassigned semantic label"

alpha :: Expr -> String
alpha=go M.empty (0::Int)
  where
    go env depth e=case exprNode e of
      Var n->M.findWithDefault n n env
      Lam n t b->"lambda:"++show t++"("++go (M.insert n ("#"++show depth) env) (depth+1) b++")"
      Let n a b->"let("++go env depth a++","++go (M.insert n ("#"++show depth) env) (depth+1) b++")"
      Lit v->show v
      App a b->"app("++go env depth a++","++go env depth b++")"
      Prim n as->n++show (map (go env depth) as)
