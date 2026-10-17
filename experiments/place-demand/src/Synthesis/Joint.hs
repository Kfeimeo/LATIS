module Synthesis.Joint where
import Synthesis.Constraint.State
import Synthesis.Constraint.Propagate
import Synthesis.Constraint.Metrics
import Synthesis.Search.Memo
import Synthesis.Search (SearchConfig(..),seconds,opEffects)
import Synthesis.Skeleton
import Synthesis.Dependency
import Synthesis.Verify
import Synthesis.MDL
import Synthesis.Expression.FreeVars
import Latent.Encode
import Latent.Correspondence
import qualified Data.Map.Strict as M
import qualified Data.Set as S
import Data.List (minimumBy,sortOn)
import Data.Ord (comparing)
import GHC.Clock (getMonotonicTimeNSec)
import Control.Exception (evaluate)

data JointResult = JointResult
  { jointSolution :: Maybe Program, jointMetrics :: Metrics, jointTrace :: [String]
  , finalState :: ConstraintState, jointLimitations :: [String], jointValid :: [Program] }

jointSearch :: JointMode -> SearchConfig -> [TrainingPair] -> IO JointResult
jointSearch mode config pairs = do
  start<-getMonotonicTimeNSec
  let prepared=[(encode (encoder config) x,y) | (x,y)<-pairs]
      latent=[(x,encode (encoder config) y) | (x,y)<-prepared]
      graphs=[correspond (correspondenceBudget config) x y | (x,y)<-latent]
      raw=take (correspondenceBudget config+1) (sequence (map branches graphs))
      bundles=[[(x,y,c) | ((x,y),c)<-zip latent cs] | cs<-take (correspondenceBudget config) raw,not (null pairs)]
      extras=detectFold latent++detectIteration latent
      (s0,e0)=initialState mode bundles extras
      preparation=sum (map (length . edges) graphs)+length bundles
      e1=count (charge preparation) e0
      notes=concatMap diagnostics graphs++["CurrentlyUnsupported: combined correspondence budget clipped" | length raw>correspondenceBudget config]
  _<-evaluate preparation
  (s,e,valid)<-frontier start prepared s0 e1 []
  end<-getMonotonicTimeNSec
  let chosen=case valid of []->Nothing; _->Just (minimumBy (comparing (totalCost . objective 1 2)) valid)
      facts=S.toList (dependencyInformation s)
      metrics=(counters e) {totalSeconds=seconds start end,dependenciesDerived=length facts,
        expressionDependenciesDerived=length [r | r<-facts,derivedBy (provenance r)=="expression-free-variables"],
        dependencyEdgesDerived=length [r | r<-facts,derivedBy (provenance r)=="expression-dependency-edge"]}
      trace=reverse (events e)++map (\r->"Constraint "++show r) (S.toList (constraintSet s))++
        ["Final exact-valid MDL: "++maybe "none" (show . objective 1 2) chosen]
  pure (JointResult chosen metrics trace s (notes++["No exact-valid program in the preserved bounded grammar" | null valid]) valid)
  where
    halted e valid = expanded (counters e)>=stateBudget config || length valid>=solutionLimit config
    frontier begin prepared s e valid
      | halted e valid = pure (s,markStop e valid,valid)
      | otherwise = do
          let (fixed,e1)=propagateToFixpoint mode s e
          (e2,found)<-dfs begin prepared fixed e1 valid
          if halted e2 found then pure (fixed,markStop e2 found,found)
          else case advanceFrontier fixed of
            Nothing -> pure (fixed,count (\m->m {exhaustive=True}) e2,found)
            Just next ->
              let proofs=[record StructuralConstraint ("active frontier exhausted at cursors="++show [(nodeId n,scopeCursor n) | n<-M.elems (nodes f)])
                    "frontier-exhaustion" f Nothing ["DFS returned below budget and solution limit","all smaller-context assignments visited; valid solutions retained","no unvisited satisfying assignment remains in this frontier"]
                    | f<-partialProgram fixed,not (S.null (families f))]
              in frontier begin prepared (addRecords proofs next) (emit "Deferred context frontier: all active assignments visited; retain previous candidates and expand one domain" e2) found
    markStop e valid=count (\m->m {exhaustedBudget=expanded m>=stateBudget config,stoppedAtSolutionLimit=length valid>=solutionLimit config}) e
    dfs begin prepared s e valid
      | halted e valid = pure (markStop e valid,valid)
      | otherwise = do
        let (fixed,e0)=propagateToFixpoint mode s e
            key=normalizedState fixed
            hit=mode/=NoMemoization && seenPartial key (memo e0)
            e1=count (\m->(charge 1 m) {partialStates=partialStates m+1,partialMemoQueries=partialMemoQueries m+1,
                    partialMemoHits=partialMemoHits m+if hit then 1 else 0})
               e0 {memo=if mode==NoMemoization then memo e0 else rememberPartial key (memo e0)}
        if hit then pure (emit "Partial state memo hit" e1,valid)
        else case branchVariable fixed of
          Dead -> pure (e1,valid)
          Complete p -> verifyOne begin prepared p e1 valid
          Branch label variants isSkeleton -> do
            let n=length variants
                e2=emit ("MRV branch "++label++" domain="++show n++" fixed point reached")
                  $ count (\m->m {branchPoints=branchPoints m+1,branchDomainTotal=branchDomainTotal m+n,
                    maximumBranchDomain=max n (maximumBranchDomain m),skeletonBranches=skeletonBranches m+if isSkeleton then 1 else 0}) e1
            foldIO (\(en,vs) next -> if halted en vs then pure (en,vs)
               else dfs begin prepared next (count (\m->(charge 1 m) {branchAssignments=branchAssignments m+1}) en) vs) (e2,valid) variants
    verifyOne begin prepared p e valid = do
      let key=programText p
          cached=if mode==NoMemoization then Nothing else M.lookup key (programCache (memo e))
      good<-case cached of Just b->pure b; Nothing->evaluate (verifyLatent prepared p)
      now<-getMonotonicTimeNSec
      let fresh=case cached of Nothing->1; _->0
          first=good && firstExpanded (counters e)==Nothing
          e1=emit ("Exact verifier "++show good++" memo="++show (fresh==0)++" program="++key++" MDL="++show (objective 1 2 p))
            $ count (\m->(charge fresh m) {verifierCalls=verifierCalls m+fresh,programMemoQueries=programMemoQueries m+1,
              programMemoHits=programMemoHits m+1-fresh,firstExpanded=if first then Just (expanded m+fresh) else firstExpanded m,
              firstSeconds=if first then Just (seconds begin now) else firstSeconds m,
              firstPreviousExpansions=if first then Just (previousExpansions m) else firstPreviousExpansions m,
              firstGridExpansions=if first then Just (gridExpansions m) else firstGridExpansions m,
              firstContextExpansions=if first then Just (contextExpansions m) else firstContextExpansions m,
              firstExpressionTests=if first then Just (expressionTests m) else firstExpressionTests m}) e
                {memo=if mode==NoMemoization then memo e else (memo e) {programCache=M.insert key good (programCache (memo e))}}
      pure (e1,if good && key `notElem` map programText valid then p:valid else valid)

foldIO :: (a -> b -> IO a) -> a -> [b] -> IO a
foldIO _ a []=pure a
foldIO f a (b:bs)=f a b >>= \next->foldIO f next bs

data Decision = Dead | Complete Program | Branch String [ConstraintState] Bool
-- Guarded variables are resolved before their conditional holes. Among live
-- holes MRV chooses size, then actual structural/MDL/free-variable preferences.
branchVariable :: ConstraintState -> Decision
branchVariable state = case sortOn frameRank [f | f<-partialProgram state,not (null (activeFamilies f))] of
  [] -> Dead
  fs@(_:_:_) -> Branch "correspondence/order" [state {partialProgram=[f],atFixedPoint=False} | f<-fs] False
  [f] -> case activeFamilies f of
    [] -> Dead
    kinds@(_:_:_) -> Branch "skeleton" [state {partialProgram=[f {families=S.singleton k}],atFixedPoint=False} | k<-kinds] True
    [MapFamily] -> actions f Body (MapP (frameOrder f))
    [ScanFamily] ->
      let as=roleActions f Initial; bs=roleActions f Step
      in case (as,bs) of
         ([a],[b]) -> Complete (ScanP (frameOrder f) a b)
         _ -> let role=if length as>1 && (length bs<=1 || length as<=length bs) then Initial else Step
              in actions f role (\_ -> IdentityP)
    [FilterFamily] -> case predicates f of
      [p] -> Complete (FilterP p)
      ps -> Branch "predicate" [state {partialProgram=[f {predicates=[p]}],atFixedPoint=False} | p<-ps] False
    _ -> maybe Dead Complete (macro f)
  where
    frameRank f=(length (activeFamilies f),case frameOrder f of LeftToRight->0::Int; _->1,frameId f)
    actions f role build=case sortOn actionRank (roleActions f role) of
      [] -> Dead
      [a] -> if role==Body then Complete (build a) else
        let other=if role==Initial then Step else Initial in case roleActions f other of
          [b] -> Complete (if role==Initial then ScanP (frameOrder f) a b else ScanP (frameOrder f) b a)
          _ -> actions f other (\_->IdentityP)
      as -> Branch ("typed expression/operator "++show role) [state {partialProgram=[select f role a],atFixedPoint=False} | a<-as] False
    select f role a=f {operatorDomains=M.insert role [actionOperator a] (operatorDomains f),
      nodes=M.adjust (\n->n {selectedTerm=Just (actionText a)}) (role,actionOperator a) (nodes f)}
    actionRank a=(actionLength a,S.size (actionFreeVars a),S.size (opEffects (actionOperator a)),S.size (actionSymbols a),actionText a)
