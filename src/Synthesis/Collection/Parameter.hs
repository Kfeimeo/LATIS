-- Stage D parameter adapter. Arithmetic remains Stage A/Language.ML.
module Synthesis.Collection.Parameter
  ( ParamLeaf(..), ParamContext(..), Refinement(..), Param, paramExpr, paramRefinement
  , checkedParam, evalParam, evalLeaf, paramInfo, synthesizeParam
  , Sharing(..), ParamPool(..), buildPool, evaluatePool, fitPool
  ) where

import Synthesis.Collection.Typed
import Synthesis.Collection.Referent
import Latent.Grid
import qualified Latent.Object as O
import qualified Data.Map.Strict as M
import qualified Data.Set as S
import Data.List (foldl', nub)

-- Scope is part of the leaf constructor. No implicit list index or Previous.
data ParamLeaf = CurrentX | CurrentY | CurrentWidth | CurrentHeight | CurrentColor
  | InputWidth | InputHeight | WholeCount | WholeColors | SelectedCount
  | OutputWidth | OutputHeight | WholeObjectColors | LegacyFitAcross Int | LegacyFitDown Int
  | WholeMinX | WholeMinY | WholeMaxX | WholeMaxY | SelectedMinX | SelectedMinY | SelectedMaxX | SelectedMaxY
  deriving (Eq,Ord,Show)
data ParamContext = ParamContext
  { pcInput :: Dimensions, pcOutput :: Dimensions, pcWhole :: [O.Object]
  , pcSelected :: [O.Object], pcCurrent :: O.Object } deriving (Eq,Show)
data Refinement = IntegerParam | PositiveCount | ArcColor | BooleanParam deriving (Eq,Ord,Show)
-- Constructor deliberately private: expressions must pass structural typing.
data Param = Param Refinement (TExpr ParamLeaf) deriving (Eq,Ord,Show)
-- Ordinary functions, not exported record labels: record update must not be
-- able to bypass checkedParam when the constructor is hidden.
paramRefinement :: Param -> Refinement
paramRefinement (Param r _)=r
paramExpr :: Param -> TExpr ParamLeaf
paramExpr (Param _ e)=e
checkedParam :: Refinement -> TExpr ParamLeaf -> Either String Param
checkedParam r e=do
  ty<-typeOfTerm (const TyInt) (lambdaFromTyped e)
  if ty==(if r==BooleanParam then TyBool else TyInt) then Right (Param r e)
    else Left "parameter type mismatch"

evalLeaf :: ParamContext -> ParamLeaf -> Either String TVal
evalLeaf c l=VI <$> case l of
  CurrentX->Right (cx (O.position o)); CurrentY->Right (cy (O.position o))
  CurrentWidth->Right (O.width o); CurrentHeight->Right (O.height o)
  CurrentColor->maybe (Left "current colour is not unique") Right (O.color o)
  InputWidth->Right (gridWidth (pcInput c)); InputHeight->Right (gridHeight (pcInput c))
  OutputWidth->Right (gridWidth (pcOutput c)); OutputHeight->Right (gridHeight (pcOutput c))
  WholeCount->Right (length (pcWhole c)); SelectedCount->Right (length (pcSelected c))
  WholeColors->Right (length (nub [col | ob<-pcWhole c, (_,col)<-O.absolutePixels ob]))
  WholeObjectColors->Right (length (nub [col | ob<-pcWhole c, Just col<-[O.color ob]]))
  LegacyFitAcross g->quotient (gridWidth (pcOutput c)-cx (O.position o)) (O.width o+g)
  LegacyFitDown g->quotient (gridHeight (pcOutput c)-cy (O.position o)) (O.height o+g)
  WholeMinX->bound minimum cx (pcWhole c)
  WholeMinY->bound minimum cy (pcWhole c)
  WholeMaxX->bound maximum cx (pcWhole c)
  WholeMaxY->bound maximum cy (pcWhole c)
  SelectedMinX->bound minimum cx (pcSelected c)
  SelectedMinY->bound minimum cy (pcSelected c)
  SelectedMaxX->bound maximum cx (pcSelected c)
  SelectedMaxY->bound maximum cy (pcSelected c)
  where o=pcCurrent c
        quotient _ 0=Left "legacy fit: division by zero"
        quotient a b=Right (a `div` b)
        bound f axis os=case [axis p | ob<-os,(p,_)<-O.absolutePixels ob] of []->Left "empty set bounds"; vs->Right (f vs)
refine :: Refinement -> TVal -> Either String TVal
refine IntegerParam v@(VI _)=Right v
refine PositiveCount v@(VI n) | n>=1=Right v
refine ArcColor v@(VI n) | n>=0 && n<=9=Right v
refine BooleanParam v@(VB _)=Right v
refine r _=Left ("parameter refinement failed: "++show r)
evalParam :: ParamContext -> Param -> Either String TVal
evalParam c (Param r e)=evalT (evalLeaf c) e >>= refine r

paramInfo :: LeafInfo ParamLeaf
paramInfo=LeafInfo (const TyInt) show scope pre partial determined
  where
    scope l | l `elem` [CurrentX,CurrentY,CurrentWidth,CurrentHeight,CurrentColor]="CurrentObject"
            | l `elem` [SelectedCount,SelectedMinX,SelectedMinY,SelectedMaxX,SelectedMaxY]="SelectedSet"
            | l `elem` [OutputWidth,OutputHeight]="OutputSize(InputRule)"
            | l `elem` [WholeCount,WholeColors,WholeObjectColors,WholeMinX,WholeMinY,WholeMaxX,WholeMaxY]="WholeInputSet"
            | otherwiseLegacy l="OutputSize/InputObject (legacy quotient)"
            | otherwise="InputGrid"
    otherwiseLegacy (LegacyFitAcross _)=True
    otherwiseLegacy (LegacyFitDown _)=True
    otherwiseLegacy _=False
    pre CurrentColor=["unique colour"]
    pre l | l `elem` [WholeMinX,WholeMinY,WholeMaxX,WholeMaxY,SelectedMinX,SelectedMinY,SelectedMaxX,SelectedMaxY]=["nonempty source set"]
    pre _=[]
    partial l=not (null (pre l)) || otherwiseLegacy l
    determined l=l `elem` [CurrentWidth,CurrentHeight]

-- Only use this interface where parameter labels have an independent witness.
-- Unsupervised grid goals must enumerate parameters and check the final grid.
synthesizeParam :: HoleConfig -> [ParamLeaf] -> Refinement -> [(ParamContext,TVal)] -> TypedResult ParamLeaf
synthesizeParam hc leaves r rows=synthesizeTyped hc show
  (enumerateTemplates hc [(l,TyInt) | l<-leaves] (if r==BooleanParam then TyBool else TyInt))
  [(evalLeaf c,v) | (c,v)<-rows]

data Sharing = SharedParamVSA | NoParamVSA deriving (Eq,Show)
data ParamPool = ParamPool
  { ppCandidates :: [Param], ppRoots :: [Int], ppDAG :: VSA ParamLeaf
  , ppUnion :: Int, ppDeferred :: [Param] } deriving (Eq,Show)
-- Exact AST identity only. No denotation-based representative collapse.
buildPool :: Int -> [Param] -> ParamPool
buildPool cap candidates=ParamPool kept roots dag union deferred
  where
    unique=S.toAscList (S.fromList candidates)
    (kept,deferred)=splitAt (max 0 cap) unique
    terms=map (lambdaFromTyped . paramExpr) kept
    (roots,plain)=foldl' (\(rs,v) t->let (i,v')=intern t v in (rs++[i],v')) ([],emptyVSA) terms
    (union,dag)=factorClass terms plain
-- Factored union is for storage/coverage; evaluate concrete roots, not unions.
-- Returned work counts actual nodes interpreted, including factorization nodes.
evaluatePool :: Sharing -> ParamPool -> ParamContext -> ([Either String TVal],Int)
evaluatePool NoParamVSA p c=(map (evalParam c) (ppCandidates p),sum (map (tLength . paramExpr) (ppCandidates p)))
evaluatePool SharedParamVSA p c=
  let (table,work)=evaluateDAG (ppDAG p) (evalLeaf c)
  in (zipWith (\q i->M.findWithDefault (Left "missing parameter root") i table >>= refine (paramRefinement q)) (ppCandidates p) (ppRoots p),work)

-- A supervised parameter subgoal only. Selection actually reads the shared
-- table when sharing is enabled; this is not a logging-only VSA.
fitPool :: Sharing -> ParamPool -> [(ParamContext,TVal)] -> ([Param],Int)
fitPool sharing p rows=
  let evaluations=[(evaluatePool sharing p c,target) | (c,target)<-rows]
      fits=[q | (i,q)<-zip [0..] (ppCandidates p), all (\((vs,_),target)->vs!!i==Right target) evaluations]
  in (fits,sum [work | ((_,work),_)<-evaluations])
