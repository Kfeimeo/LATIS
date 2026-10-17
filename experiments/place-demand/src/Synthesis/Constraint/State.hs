{-# LANGUAGE GADTs #-}
module Synthesis.Constraint.State where
import Latent.Grid
import Latent.Object
import Latent.Correspondence
import Language.DSA
import Language.Effect
import Synthesis.Hole
import Synthesis.Dependency (LatentExample)
import Synthesis.Skeleton
import Synthesis.Expression.FreeVars
import qualified Data.Map.Strict as M
import qualified Data.Set as S
import Data.List (sort,intercalate)

data Role = Body | Initial | Step deriving (Eq,Ord,Show)
data Family = MapFamily | ScanFamily | FilterFamily | FoldFamily | IterateFamily deriving (Eq,Ord,Show)
data ConstraintKind = TypeConstraint | ValueConstraint | EffectConstraint | DependencyConstraint | StructuralConstraint
  deriving (Eq,Ord,Show)
data Provenance = Provenance
  { derivedBy :: String, correspondenceBranch :: Int, trainingPair :: Maybe Int
  , objectMatch :: Maybe Int, premises :: [String]
  } deriving (Eq,Ord,Show)
data ConstraintRecord = ConstraintRecord
  { constraintKind :: ConstraintKind, proposition :: String, provenance :: Provenance }
  deriving (Eq,Ord,Show)
data Instance = Instance
  { instanceContext :: Context, instanceTarget :: Object, pairNumber :: Int, matchNumber :: Int }
  deriving (Eq,Show)

-- Parameter alternatives remain typed. No string is evaluated as an AST.
data Payload where
  Uninstantiated :: Payload
  VectorPayload :: Hole Vec -> [Param Vec] -> Payload
  ColorPayload :: Hole Int -> [Param Int] -> Payload
  FixedPayload :: Action -> Payload
  RejectedPayload :: String -> Payload

data Node = Node
  { nodeId :: String, nodeRole :: Role, nodeOperator :: Operator, nodeInstances :: [Instance]
  , nodePayload :: Payload, scopePlan :: [Scope], scopeCursor :: Int
  , testedTerms :: S.Set String, passedTerms :: S.Set String, nodeReady :: Bool
  , selectedTerm :: Maybe String, witnessDone :: Bool
  }
data Frame = Frame
  { frameId :: String, branchId :: Int, frameOrder :: Order, frameExamples :: [LatentExample]
  , families :: S.Set Family, operatorDomains :: M.Map Role [Operator]
  , nodes :: M.Map (Role,Operator) Node, predicates :: [Predicate], macro :: Maybe Program
  , dominancePairs :: S.Set (String,String), contradictionRecorded :: Bool
  }

-- Sigma=(P,Gamma,C,D,R,M). P is the guarded frame table; Gamma is the typed
-- node environment in those frames. Shared value records carry provenance.
data ConstraintState = ConstraintState
  { partialProgram :: [Frame]
  , constraintSet :: S.Set ConstraintRecord
  , dependencyInformation :: S.Set ConstraintRecord
  , residualSpecification :: M.Map String Effect
  , correspondenceDomain :: M.Map Int [Correspondence]
  , atFixedPoint :: Bool
  }

gamma :: ConstraintState -> [SomeHole]
gamma state = concatMap (concatMap binding . M.elems . nodes) (partialProgram state)
  where binding n = case nodePayload n of
          VectorPayload h _ -> [SomeHole h]
          ColorPayload h _ -> [SomeHole h]
          _ -> []
record :: ConstraintKind -> String -> String -> Frame -> Maybe Instance -> [String] -> ConstraintRecord
record kind text rule frame sample parents = ConstraintRecord kind text
  (Provenance rule (branchId frame) (pairNumber <$> sample) (matchNumber <$> sample) parents)
addRecords :: [ConstraintRecord] -> ConstraintState -> ConstraintState
addRecords records state = state {constraintSet=constraintSet state `S.union` S.fromList records,
  dependencyInformation=dependencyInformation state `S.union` S.fromList [r | r <- records, constraintKind r == DependencyConstraint]}

roleNeeded :: S.Set Family -> Role -> Bool
roleNeeded fs Body = S.member MapFamily fs
roleNeeded fs _ = S.member ScanFamily fs
nodeActions :: Node -> [Action]
nodeActions n = filter chosen $ case nodePayload n of
  VectorPayload _ ps -> map Move ps
  ColorPayload _ ps -> map Paint ps
  FixedPayload a -> [a]
  _ -> []
  where chosen a = maybe True (==actionText a) (selectedTerm n)
roleActions :: Frame -> Role -> [Action]
roleActions frame role = [a | op <- M.findWithDefault [] role (operatorDomains frame),
  Just n <- [M.lookup (role,op) (nodes frame)], nodeReady n, a <- nodeActions n]
rolePending :: Frame -> Role -> Bool
rolePending frame role = or [not (nodeReady n) | op <- M.findWithDefault [] role (operatorDomains frame),
  Just n <- [M.lookup (role,op) (nodes frame)]]
roleHasFuture :: Frame -> Role -> Bool
roleHasFuture frame role = or [scopeCursor n < length (scopePlan n) | op <- M.findWithDefault [] role (operatorDomains frame),
  Just n <- [M.lookup (role,op) (nodes frame)]]
scanPairs :: Frame -> [(Action,Action)]
scanPairs frame = [(a,b) | a <- roleActions frame Initial, b <- roleActions frame Step,
  not (S.member (actionText a,actionText b) (dominancePairs frame))]
activeFamilies :: Frame -> [Family]
activeFamilies frame = [family | family <- S.toList (families frame), active family]
  where active MapFamily = not (null (roleActions frame Body))
        active ScanFamily = not (null (scanPairs frame))
        active FilterFamily = not (null (predicates frame))
        active _ = macroPresent frame

-- Program has intentionally no Eq instance in v0.1; compare its structural form.
-- Avoid inventing an equality instance for the preserved language.
macroPresent :: Frame -> Bool
macroPresent = maybe False (const True) . macro

frameSummary :: Frame -> String
frameSummary f = frameId f ++ " M="++show (branchId f)++" order="++show (frameOrder f)++" structures="++show (S.toList (families f))++
  " active="++show (activeFamilies f)++" operators="++show (M.toList (operatorDomains f))++" holes="++
  show [(nodeId n,show (nodeOperator n),map actionText (nodeActions n),scopeCursor n) | n <- M.elems (nodes f)]

-- Compare domain data directly. Rendering an audit trace is not a propagation
-- operation and must not dominate fixedpoint detection.
frameProgress :: Frame -> (S.Set Family,M.Map Role [Operator],S.Set (String,String),
  [(String,Int,Bool,Bool,Maybe String,S.Set String,S.Set String,[String],String)],[Predicate])
frameProgress f=(families f,operatorDomains f,dominancePairs f,
  [(nodeId n,scopeCursor n,nodeReady n,witnessDone n,selectedTerm n,testedTerms n,passedTerms n,map actionText (nodeActions n),tag n) | n<-M.elems (nodes f)],predicates f)
  where tag n=case nodePayload n of Uninstantiated->"fresh"; RejectedPayload s->s; _->"typed"
sameState :: ConstraintState -> ConstraintState -> Bool
sameState a b=map frameProgress (partialProgram a)==map frameProgress (partialProgram b) &&
  constraintSet a==constraintSet b && correspondenceDomain a==correspondenceDomain b

stateSignature :: ConstraintState -> String
stateSignature state = show (map frameSignature (partialProgram state),S.toList (constraintSet state),atFixedPoint state)
  where frameSignature f = (frameId f,S.toList (families f),M.toList (operatorDomains f),S.toList (dominancePairs f),
          [(nodeId n,payloadTag n,map actionText (nodeActions n),scopeCursor n,nodeReady n,witnessDone n,S.toList (testedTerms n),selectedTerm n) | n <- M.elems (nodes f)],map show (predicates f))
        payloadTag n = case nodePayload n of Uninstantiated -> "fresh"; RejectedPayload s -> "rejected:"++s; _ -> "typed"

-- Memoize the active finite CSP. Deferred scopes are processed by the outer
-- exhaustive frontier, even when this active table was already searched.
normalizedState :: ConstraintState -> String
normalizedState state = intercalate "\n" (sort
  [show (branchId f,frameOrder f,activeFamilies f) ++ ":" ++ show
    [(r,op,map actionText (nodeActions n)) | ((r,op),n) <- M.toList (nodes f), roleNeeded (S.fromList (activeFamilies f)) r,
      op `elem` M.findWithDefault [] r (operatorDomains f)] ++ ":" ++ show (map show (predicates f)) ++ ":" ++ maybe "" programText (macro f)
    ++ ":" ++ show (map correspondencePairs [c | (_,_,c) <- frameExamples f])
    ++ ":canvas="++show [(canvas x,background x,canvas y,background y) | (x,y,_)<-frameExamples f]
    ++ ":forbidden-scan-pairs="++show (S.toList (dominancePairs f))
   | f <- partialProgram state, not (null (activeFamilies f))])

scopeFor :: Bool -> Bool -> Role -> [Scope]
scopeFor bidirectional lazy role
  | not lazy = [maximumScope]
  | bidirectional && role /= Step = [currentScope,gridScope]
  | otherwise = [currentScope,previousScope,gridScope,fullScope]
  where maximumScope = if bidirectional && role /= Step then gridScope else fullScope
