module Synthesis.InducedR1.Specification where
import Language.Induced.Base
import qualified Data.Map.Strict as M
import qualified Data.Set as S
import Data.List (sort,intercalate)

-- Ordering constraints avoid inventing exact ranks that a real key function
-- need not produce. True denotes strict <, False denotes <= (stable ties).
data Observation = Point Env Value | FunctionPoint Env Value Value
  | FunctionOrder Env Value Value Bool deriving (Eq,Ord,Show)
data LearningTask = LearningTask
  { targetType :: Type, specification :: [Observation], environment :: M.Map String Type
  } deriving (Eq,Ord,Show)
pointTask :: Type -> [(Env,Value)] -> LearningTask
pointTask t rows=LearningTask t [Point e v | (e,v)<-rows] (case rows of (e,_):_->M.map valueType e; _->M.empty)
functionTask :: Type -> Type -> [(Env,Value,Value)] -> LearningTask
functionTask a b rows=LearningTask (ArrowT a b) [FunctionPoint e x y | (e,x,y)<-rows]
  (case rows of (e,_,_):_->M.map valueType e; _->M.empty)
points :: LearningTask -> [(Env,Value)]
points q=[(e,v) | Point e v<-specification q]
canonical :: LearningTask -> String
canonical q=show (targetType q,M.toAscList (environment q))++intercalate "|" (sort (S.toList (S.fromList (map key (specification q)))))
  where envKey e=show [(n,valueKey v) | (n,v)<-M.toAscList e]
        key (Point e y)=envKey e++"=>"++valueKey y
        key (FunctionPoint e x y)=envKey e++":"++valueKey x++"=>"++valueKey y
        key (FunctionOrder e x y strict)=envKey e++":"++valueKey x++"<"++show strict++valueKey y
summary :: LearningTask -> String
summary q=show (targetType q)++"; observations="++show (length (specification q))++"; Gamma="++show (M.toAscList (environment q))
matches :: LearningTask -> Expr -> Bool
matches q e=exprType e==targetType q && all check (specification q)
  where check (Point env y)=either (const False) (`equivalent` y) (evalValue env e)
        check (FunctionPoint env x y)=case eval (M.map Ground env) e >>= (\f->applyRuntime f (Ground x)) of
          Right (Ground v)->equivalent v y; _->False
        check (FunctionOrder env x y strict)=case (keyAt env x,keyAt env y) of
          (Right (Ground (IntV a)),Right (Ground (IntV b)))->if strict then a<b else a<=b
          _->False
        keyAt env x=eval (M.map Ground env) e >>= (\f->applyRuntime f (Ground x))

data Decomposition = Decomposition
  { decompositionChildren :: [LearningTask], decompositionBuild :: [Expr] -> Either String Expr
  , decompositionEvidence :: String
  }
