-- LATIS v0.6: online semantic abstraction. Repeated semantic-cohesive
-- subgraphs of the PARTIAL derivation graph are anti-unified during search,
-- scored by a utility with explicit components, promoted into VisibleOps and
-- then reused by later compatible subgoals of the same synthesis run.
module Synthesis.Collection.Online
  ( Param(..), RNode(..), Utility(..), Abstraction(..), antiUnify, utility, scalarNodes, alignmentNodes, cohesive
  ) where

import Synthesis.Collection.Indexed
import Synthesis.Collection.Counterfactual
import Synthesis.Collection.Typed (renderT, tLeaves)
import Data.List (nub, transpose)

-- Parameters a node may carry. PConcrete marks a concrete object ID or a
-- case-specific coordinate: such a parameter can never become a free
-- abstraction parameter, so a subgraph carrying it is rejected.
data Param = PConst Int | PConcept String | PRef String | PAlign String | PAbs String | PConcrete String deriving (Eq,Ord,Show)
data RNode = RNode { rnId :: String, rnOp :: String, rnParams :: [Param], rnDeps :: [String], rnSlice :: String } deriving (Eq,Ord,Show)
data Utility = Utility
  { uOccurrence, uNodesHidden, uBoundary, uEstimatedSaved, uActualReuse
  , uCompression, uSearchReduction, uReuse, uDecoupling, uCohesion, uInterface, uTotal, uThreshold :: Int, uAccepted :: Bool } deriving (Eq,Show)
data Abstraction = Abstraction
  { absName, absFamily, absContract :: String, absInputTypes :: [String], absOutputType :: String
  , absFreeParams :: [(String,String)], absHidden :: [RNode], absDependencies, absOntologySlice, absWitness, absProvenance :: [String]
  , absDefinitionCost, absCallCost :: Int, absUtility :: Utility, absDiscoveryStep, absPromotionStep :: Int
  , absFirstReuseStep :: Maybe Int, absReuseCount, absSaved :: Int, absDef :: Maybe AbsDef } deriving (Eq,Show)

-- Instance subgraphs of a scalar expression (one per training case). Current,
-- Previous, Scene and InputSet references are external inputs of the subgraph.
scalarNodes :: String -> Scalar -> [RNode]
scalarNodes prefix e=snd (go "r" e)
  where
    go path (Lit n)=(path,[RNode (prefix++path) "Literal" [PConst n] [] "scalar"])
    go path (ConstVar i)=(path,[RNode (prefix++path) "Constant" [PConcept ("?c"++show i)] [] "scalar"])
    go path (Call n args)=(path,[RNode (prefix++path) "Call" (PAbs n:map arg args) ["abstraction:"++n] "scalar"])
    -- a typed-hole expression is one refinement node; its leaves are its external references
    go path (Typed t)=(path,[RNode (prefix++path) "TypedExpr" [PConcept (renderT slotLeafName t)]
                             (nub (concat [case l of LeafAtom a->take 1 (deps a); LeafGrid _->["ref:Scene"] | l<-tLeaves t])) "scalar"])
    go path (Plus a b)=let (pa,na)=go (path++"l") a; (pb,nb)=go (path++"r") b
                       in (path,na++nb++[RNode (prefix++path) "Plus" [] [prefix++pa,prefix++pb] "scalar"])
    go path (Atom a)=(path,[RNode (prefix++path) (op a) (params a) (deps a) "scalar"])
    arg (ArgAxis a)=PConcept (show a)
    arg (ArgInt n)=PConst n
    op (Pos _ _)="Observe Position"
    op (Ext _ _)="Observe Extent"
    op (SceneLow _)="SceneReferent Low"
    op (SceneHigh _)="SceneReferent High"
    op (SetMin _)="Aggregate Min"
    op CountObjects="Aggregate Count"
    op CountShapes="Aggregate CountShapes"
    op (Max _ _)="Observe BoundsMax"
    op (SetMax _)="Aggregate Max"
    params (Pos w a)=[PRef (show w),axis a]
    params (Ext w a)=[PRef (show w),axis a]
    params (Max w a)=[PRef (show w),axis a]
    params (SceneLow a)=[PRef "Scene",axis a]
    params (SceneHigh a)=[PRef "Scene",axis a]
    params (SetMin a)=[PRef "InputSet",axis a]
    params (SetMax a)=[PRef "InputSet",axis a]
    params _=[PRef "InputSet"]
    axis (Ax x)=PConcept (show x)
    axis (AxisVar i)=PConcept ("?axis"++show i)
    deps (Pos w _)=["ref:"++show w]
    deps (Ext w _)=["ref:"++show w]
    deps (Max w _)=["ref:"++show w]
    deps (SceneLow _)=["ref:Scene"]
    deps (SceneHigh _)=["ref:Scene"]
    deps _=["ref:InputSet"]
-- Instance subgraph of one explained alignment attempt for one case.
alignmentNodes :: String -> KeyExpr -> KeyExpr -> [RNode]
alignmentNodes prefix kIn kOut=
  [RNode (prefix++"order-in") "OrderBy" [PConcept (show kIn),PConcept "InputSet"] ["set:Input"] "alignment"
  ,RNode (prefix++"order-out") "OrderBy" [PConcept (show kOut),PConcept "OutputSet"] ["set:Output"] "alignment"
  ,RNode (prefix++"rank-align") "RankAlign" [] [prefix++"order-in",prefix++"order-out"] "alignment"]

-- Typed/relational anti-unification of instance subgraphs. Positions must
-- agree on operation, dependency structure and ontology slice; parameters that
-- differ become free parameters of the matching kind, equal Concepts and
-- Constants are generalized too (typed parametrization), Refs/Alignments/
-- Abstractions stay bound, and a concrete capture rejects the candidate.
antiUnify :: [(String,[RNode])] -> Either String ([RNode],[(String,String)])
antiUnify [] = Left "no instances"
antiUnify tagged@((_,first):_)
  | any ((/=length first) . length . snd) tagged = Left "instances differ in shape"
  | otherwise = fmap finish (traverse node (zip [0::Int ..] (transpose stripped)))
  where
    strip tag s=if take (length tag) s==tag then drop (length tag) s else s
    stripped=[[n {rnId=strip tag (rnId n), rnDeps=map (strip tag) (rnDeps n)} | n<-ns] | (tag,ns)<-tagged]
    node (i,column)
      | length (nub (map rnOp column))/=1 = Left ("operation mismatch at node "++show i)
      | length (nub (map rnId column))/=1 || length (nub (map rnDeps column))/=1 = Left ("dependency structure mismatch at node "++show i)
      | length (nub (map rnSlice column))/=1 = Left ("ontology slice mismatch at node "++show i)
      | otherwise = do
          ps <- traverse param (zip [0::Int ..] (transpose (map rnParams column)))
          let n=head column
          pure (n {rnParams=map fst ps},concatMap snd ps)
      where
        param (j,values)
          | any concrete values = Left "concrete object ID or case-specific coordinate capture"
          | all isConst values = Right (PConcept ("?"++show i++"_"++show j),[("p"++show i++"_"++show j,"Constant")])
          | all isConcept values = Right (PConcept ("?"++show i++"_"++show j),[("p"++show i++"_"++show j,"Concept")])
          | length (nub values)==1 = Right (head values,[])
          | otherwise = Left ("bound parameter differs across instances at node "++show i)
        concrete (PConcrete _)=True
        concrete _=False
        isConst (PConst _)=True
        isConst _=False
        isConcept (PConcept _)=True
        isConcept _=False
    finish xs=(map fst xs,concatMap snd xs)

-- Utility(I) = a*Compression + b*SearchReduction + c*Reuse + d*Decoupling
--            + e*SemanticCohesion - m*InterfaceCost, with (a,b,c,d,e,m)=(1,1,1,1,2,1).
utility :: Int -> Int -> Int -> [RNode] -> [(String,String)] -> Utility
utility threshold remaining occurrences pattern params=
  let nodesHidden=length pattern
      ids=map rnId pattern
      externalInputs=nub [d | n<-pattern, d<-rnDeps n, d `notElem` ids]
      boundary=length externalInputs+1+length params
      compression=occurrences*nodesHidden-(nodesHidden+occurrences)
      searchReduction=(nodesHidden-1)*remaining
      intermediates=length [() | n<-pattern, rnId n `elem` concatMap rnDeps pattern]
      cohesion=if length (nub (map rnSlice pattern))==1 then 1 else 0
      total=compression+searchReduction+0+intermediates+2*cohesion-boundary
  in Utility occurrences nodesHidden boundary ((nodesHidden-1)*max 1 remaining) 0 compression searchReduction 0 intermediates cohesion boundary total threshold (total>=threshold)

-- Final wrapping check (same as v0.5): a connected subgraph whose internal
-- dependencies all exist and whose intermediate nodes are only used inside.
cohesive :: [RNode] -> Bool
cohesive ns=length ns>=4 && all (\n->all (\d->d `elem` names || external d) (rnDeps n)) ns
  && all (\n->rnOp n=="Realize" || any (elem (rnId n) . rnDeps) ns) ns
  where names=map rnId ns
        external d=take 4 d=="ref:" || take 4 d=="set:" || take 12 d=="abstraction:"
