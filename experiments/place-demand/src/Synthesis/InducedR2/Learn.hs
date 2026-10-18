module Synthesis.InducedR2.Learn where
import Language.Induced.Base
import Synthesis.InducedR1.Specification
import Synthesis.InducedR2.Observers
import Synthesis.InducedR2.Witness
import Synthesis.InducedR2.VersionSpace
import Synthesis.InducedR2.Diversity
import Synthesis.InducedR2.Sharing
import Synthesis.InducedR2.PortfolioCover
import Synthesis.InducedR2.AliasSharing
import qualified Synthesis.InducedR1.Observers as R1Observers
import Synthesis.InducedR1.Abstraction
import Synthesis.InducedR2.Coverage (functionObservers)
import qualified Synthesis.Induced.Witness as Old
import qualified Synthesis.Induced.Specification as Old
import qualified Synthesis.Induced.Observers as Old
import Latent.Grid
import Latent.Encode
import Latent.Render
import Latent.Correspondence (correspond,branches,truncated)
import qualified Latent.Object as O
import qualified Data.Map.Strict as M
import qualified Data.Set as S
import Data.IORef
import Data.List (sortOn,nubBy)
import Control.Monad (forM,when)
import Control.Exception (evaluate)
import GHC.Clock (getMonotonicTimeNSec)
import System.Environment (lookupEnv)
import System.IO (hFlush,stdout)

data InducedMode = InducedTSLFull | NoWitness | NoVersionSpaceSharing
  | NoTaskAbstraction | NoEffectPropagation | NoFVDependency
  | Full | NoDiversityPreservation | FixedAliasCap | NoLetSharing | NoGroundedLiteralPrior | BeamSearchLegacy | NoCounterfactualDiagnosis | NoPortfolioCover | NoOnlineAbstraction | PostHocOnly | NoAntiUnification | NoLambdaLifting | NoNewWitnessCoverage
  deriving (Eq,Ord,Show,Read,Enum,Bounded)
-- place-demand experiment switches. Off/Unidirectional reproduces the frozen
-- place-only Full path (B0). B1 = Bidirectional witnesses. B2 = B1 + DemandOn.
data DemandPolicy = DemandOff | DemandOn deriving (Eq,Ord,Show,Read,Enum,Bounded)
-- Round-2 switches. DeferNonLocal: left residuals whose base point depends on
-- no non-Scene variable are postponed to a second pass with its own work share
-- (never deleted). CoverLazy: extraction first materializes one complete
-- composition per node, then expands single-hole alternatives breadth-first.
data SchedulePolicy = ScheduleAll | DeferNonLocal deriving (Eq,Ord,Show,Read,Enum,Bounded)
data CoverPolicy = CoverRefine | CoverLazy deriving (Eq,Ord,Show,Read,Enum,Bounded)
-- Round-4 switch: order of the branches explored inside one Learn call.
-- CostOrder is the original (1 + sum of child cost estimates). UnsolvedFirst
-- is a single interpretable soft ordering on cheap, cached signals: fewer
-- children without a forward observation first, then more children already
-- solved in the memo, then the original cost, then the original index. It
-- removes nothing; each scored branch is charged one unit of work.
data BranchOrder = CostOrder | UnsolvedFirst deriving (Eq,Ord,Show,Read,Enum,Bounded)
data InducedConfig = InducedConfig
  { workBudget :: Int, depthBound :: Int, frontierBound :: Int
  , inducedCorrespondenceBudget :: Int, inducedEncoder :: EncoderConfig
  , structuralCostBound :: Int
  , saturationWorkBudget :: Int
  , abstractionLimits :: Limits
  , witnessPolicy :: WitnessPolicy
  , demandPolicy :: DemandPolicy
  , demandWorkBudget :: Int   -- total demand-expansion work, counted inside workBudget
  , demandOperandCap :: Int   -- operands per type offered to each typed generator
  , demandRounds :: Int       -- maximum resolve/retry rounds
  , schedulePolicy :: SchedulePolicy
  , deferredWorkBudget :: Int -- work share of the deferred pass, inside workBudget
  , coverPolicy :: CoverPolicy
  , branchOrder :: BranchOrder
  } deriving (Eq,Show)
defaultInduced :: InducedConfig
defaultInduced=InducedConfig 250000 7 32 32 defaultEncoder 96 25000 defaultLimits Unidirectional DemandOff 25000 24 3 ScheduleAll 62500 CoverRefine CostOrder
variantLabel :: InducedConfig -> String
variantLabel conf=base++(if schedulePolicy conf==DeferNonLocal then "Q" else "")++(if coverPolicy conf==CoverLazy then "X" else "")++(if branchOrder conf==UnsolvedFirst then "S" else "")
  where base=case (witnessPolicy conf,demandPolicy conf) of
          (Unidirectional,DemandOff)->"B0"; (Bidirectional,DemandOff)->"B1"; (Bidirectional,DemandOn)->"B2"
          (Unidirectional,DemandOn)->"B0+demand"
          (BidirectionalLocal,DemandOff)->"B1L"; (BidirectionalLocal,DemandOn)->"B2L"
          (BidirectionalUnpruned,DemandOff)->"B1U"; (BidirectionalUnpruned,DemandOn)->"B2U"
data InducedResult = InducedResult
  { inducedProgram :: Maybe Expr, inducedPortfolio :: [Expr], inducedSpace :: Space
  , inducedRoot :: NodeId, inducedSignature :: M.Map String [Support]
  , inducedInventions :: [Invention], inducedMetrics :: M.Map String Int
  , inducedSeconds :: Double, inducedTrace :: [String], inducedFailure :: String
  , inducedFailureEvidence :: String, inducedBounded :: Bool
  , inducedDemands :: [(DemandKey,DemandRecord)]
  }
data Engine = Engine
  { config :: InducedConfig, mode :: InducedMode, spaceRef :: IORef Space
  , memoRef :: IORef (M.Map String NodeId), metricsRef :: IORef (M.Map String Int)
  , traceRef :: IORef [String], poolRef :: IORef (M.Map String [Observed])
  , inventionsRef :: IORef [Invention]
  , activeRef :: IORef (S.Set String)
  , extractedRef :: IORef (M.Map NodeId [Expr])
  , matchRef :: IORef (M.Map String Bool)
  , supportedBaseRef :: IORef (Maybe (S.Set String))
  , queryRef :: IORef (M.Map NodeId [LearningTask])
  , exactTrainingRef :: IORef (Maybe [(Grid,Grid)])
  , exactCacheRef :: IORef (M.Map Expr Bool)
  -- place-demand (phase B) state. All of it is engine-local.
  , memoEpochRef :: IORef (M.Map String (S.Set DemandKey,Int))  -- demands observed under a memo key and the pool epoch at write time
  , demandStackRef :: IORef [S.Set DemandKey]                   -- demands registered by the Learn calls currently on the stack
  , demandRef :: IORef (M.Map DemandKey DemandRecord)           -- every registered demand, keyed by (pool key, missing type)
  , epochRef :: IORef Int                                        -- incremented whenever any observation pool grows
  , poolEnvRef :: IORef (M.Map String LearningTask)              -- representative task per pool key (environments for evaluation)
  , budgetCapRef :: IORef (Maybe Int)                            -- temporary work cap for the deferred pass
  }
-- Deferred-branch keys share the demand registry; the marker type PoseT is not
-- part of the Place language, so it cannot collide with a typed demand.
deferredMarker :: Type
deferredMarker=PoseT
deferredKey :: LearningTask -> DemandKey
deferredKey q="deferred:"++canonical q `seq` ("deferred:"++canonical q,deferredMarker)
-- A demand names the observation pool (environment key) and the operand type
-- the witness could not condition on. Its record tracks the resolution epoch.
type DemandKey=(String,Type)
data DemandRecord = DemandRecord
  { demandOrder :: Int, demandTasks :: S.Set String, demandSymbols :: S.Set String
  , demandResolvedEpoch :: Maybe Int, demandGrowth :: Maybe Int, demandStatus :: String
  } deriving (Eq,Show)

metricNames :: [String]
metricNames=words "branch_order_scored deferred_tasks deferred_branches deferred_released deferred_pass_work deferred_pass_memo_invalidations cover_lazy_candidates demands_registered demands_distinct demands_suspended demands_resumed demands_still_blocked demand_rounds demand_generated_terms demand_new_observations demand_new_vec_observations demand_new_coord_observations demand_new_int_observations demand_work demand_memo_invalidations demand_memo_reuse bidirectional_left_decompositions root_learning_tasks recursive_learning_tasks memoized_learning_tasks memo_queries memo_hits witness_calls lookahead_witness_calls successful_witness_decompositions failed_witness_decompositions version_space_nodes union_nodes join_nodes materialized_complete_asts materialized_child_asts structural_deduplications semantic_deduplications exact_verifier_calls propagation_steps branch_points expression_tests invented_abstractions induced_tsl_symbol_count base_symbols_activated base_symbols_rejected program_ast_length distinct_symbol_count first_solution_states total_expanded_work effect_pruned fv_bindings_eliminated witness_unavailable depth_cutoffs observer_terms bottom_up_terms structural_prior_count abstraction_rounds invention_expansion_tests invention_hits abstraction_discovery_work synthesis_work_after_discovery synthesis_work_before_discovery equivalence_classes structural_representatives max_representatives_per_class pruned_representatives cost_bound_reached cost_strata let_cse_sharing cse_nodes_saved grounded_expressions ungrounded_literal_cost extraction_work cycle_cutoffs"

newEngine :: InducedMode -> InducedConfig -> IO Engine
newEngine runMode conf=Engine conf runMode <$> newIORef emptySpace <*> newIORef M.empty
    <*> newIORef (M.fromList [(n,0) | n<-metricNames]) <*> newIORef [] <*> newIORef M.empty <*> newIORef [] <*> newIORef S.empty <*> newIORef M.empty <*> newIORef M.empty <*> newIORef Nothing <*> newIORef M.empty <*> newIORef Nothing <*> newIORef M.empty
    <*> newIORef M.empty <*> newIORef [] <*> newIORef M.empty <*> newIORef 0 <*> newIORef M.empty <*> newIORef Nothing

rulesFor :: Engine -> IO [Primitive]
rulesFor engine=do
  allowed<-readIORef (supportedBaseRef engine)
  pure [p | p<-base,maybe True (S.member (primitiveName p)) allowed]

activateSupportedBase :: Engine -> Space -> NodeId -> IO ()
activateSupportedBase engine s root=when (root/=0) $ do
  let supported=S.fromList (M.keys (signature s root))
  old<-readIORef (supportedBaseRef engine)
  writeIORef (supportedBaseRef engine) (Just (maybe supported (`S.union` supported) old))
  note engine ("Task TSL supported Base="++show (S.toList supported))

-- Old coverage is a genuine ablation, with the same new search engine.
witnessFor :: Engine -> Int -> Primitive -> LearningTask -> [Observed] -> [Decomposition]
witnessFor engine remaining p q os
  | any isOrder (specification q) = if mode engine==NoNewWitnessCoverage then [] else witnessAt (witnessPolicy (config engine)) remaining (inducedCorrespondenceBudget (config engine)) p q os
  | mode engine/=NoNewWitnessCoverage=witnessAt (witnessPolicy (config engine)) remaining (inducedCorrespondenceBudget (config engine)) p q os
  | otherwise=map convert (Old.witness (inducedCorrespondenceBudget (config engine)) p oldQ oldPool)
  where
    isOrder r=case r of FunctionOrder _ _ _ _->True; _->False
    oldQ=Old.LearningTask (targetType q) (map oldObservation (specification q)) (environment q)
    oldObservation r=case r of
      Point e v->Old.Point e v
      FunctionPoint e x y->Old.FunctionPoint e x y
      FunctionOrder _ _ _ _->error "old witness does not support order specification"
    oldPool=[Old.Observed (observedExpr o) (observedValues o) | o<-os]
    convert d=Decomposition [LearningTask (Old.targetType c) [case r of Old.Point e v->Point e v; Old.FunctionPoint e x y->FunctionPoint e x y | r<-Old.specification c] (Old.environment c) | c<-Old.decompositionChildren d] (Old.decompositionBuild d) (Old.decompositionEvidence d)

-- No anonymous invention is installed as a new Base primitive. Instantiate
-- its closed definition with typed finite observations, then use ordinary
-- Base evaluation/graph checking. All such expansion tests count as work.
useInventions :: Engine -> LearningTask -> [Observed] -> IO [NodeId]
useInventions engine q pool=do
  invs<-readIORef (inventionsRef engine)
  fmap concat $ forM invs $ \inv->do
    let ps=inventionParameters inv
        args t=take 6 $ sortOn (\e->case exprNode e of Var _->(0::Int); _->1)
                         [observedExpr o | o<-pool,exprType (observedExpr o)==t]
        candidates=if exprType (inventionBody inv)==targetType q then [inventionBody inv]
                   else [e | as<-take 64 (sequence [args t | (_,t)<-ps]),Right e<-[expandUse inv as],exprType e==targetType q]
    fmap concat $ forM candidates $ \e->do
      bump engine "invention_expansion_tests" 1
      work engine (1+length (specification q))
      if not (matches q e) then pure [] else do
        bump engine "invention_hits" 1
        note engine ("Learn uses "++inventionName inv++" by typed definition expansion; "++summary q)
        i<-node engine ("invention:"++show e) (Leaf e) (Support (summary q) ("definition expansion of task-local "++inventionName inv))
        pure [i]
bump :: Engine -> String -> Int -> IO ()
bump engine key n=modifyIORef' (metricsRef engine) (M.insertWith (+) key n)
work :: Engine -> Int -> IO ()
work engine n=bump engine "total_expanded_work" n
exhausted :: Engine -> IO Bool
exhausted engine=do
  cap<-readIORef (budgetCapRef engine)
  spent<-M.findWithDefault 0 "total_expanded_work" <$> readIORef (metricsRef engine)
  pure (spent>=maybe (workBudget (config engine)) (min (workBudget (config engine))) cap)
note :: Engine -> String -> IO ()
note engine s=modifyIORef' (traceRef engine) (\xs->if length xs<2500 then s:xs else xs)
node :: Engine -> String -> VSNode -> Support -> IO NodeId
node engine key n why=do
  store<-readIORef (spaceRef engine)
  let (i,store')=insertNode (mode engine/=NoVersionSpaceSharing) key n why store
  writeIORef (spaceRef engine) store'
  pure i
poolFor :: Engine -> LearningTask -> IO [Observed]
poolFor engine q=do
  let key=poolKey q
  cache<-readIORef (poolRef engine)
  case M.lookup key cache of
    Just os->pure os
    Nothing->do
      let sampleRows=case points q of
            []->[(env,x) | FunctionPoint env x _<-specification q]
            rs->rs
          observedQ=case sampleRows of (_,x):_->pointTask (valueType x) sampleRows; _->q
          raw=rawObservations observedQ
          os=selectPool engine raw
      _<-evaluate (length os)
      bump engine "pruned_representatives" (length raw-length os)
      bump engine "observer_terms" (length os)
      modifyIORef' (poolRef engine) (M.insert key os)
      modifyIORef' (poolEnvRef engine) (M.insertWith (\_ old->old) key observedQ)
      pure os
poolKey :: LearningTask -> String
poolKey q=show (M.toAscList (environment q))++show [(M.toAscList env) | (env,_)<-points q]

matchObservation :: Engine -> LearningTask -> Observed -> IO Bool
matchObservation engine q o=do
  cache<-readIORef (matchRef engine)
  -- Point matching depends only on required and observed value vectors. Do
  -- not duplicate the (potentially huge) full scene environment in every key.
  let cacheKey=show (targetType q,map (valueKey . snd) (points q),exprType (observedExpr o),map valueKey (observedValues o))
  case M.lookup cacheKey cache of
    Just yes->work engine 1 >> pure yes
    Nothing->do
      yes<-matchObservationFresh engine q o
      modifyIORef' (matchRef engine) (M.insert cacheKey yes)
      pure yes
matchObservationFresh :: Engine -> LearningTask -> Observed -> IO Bool
matchObservationFresh engine q o=do
  let rows=zip (points q) (observedValues o)
      fv=freeVars (observedExpr o)
      key ((env,_),_)=show [(n,valueKey v) | (n,v)<-M.toAscList env,S.member n fv]
      -- Dependency projection is valid only if the projected row has a single
      -- required output; conflicting labels must not be silently coalesced.
      grouped=M.fromListWith (++) [(key r,[r]) | r<-rows]
      selected=if mode engine==NoFVDependency then rows else concatMap pick (M.elems grouped)
      pick rs=if S.size (S.fromList [valueKey y | ((_,y),_)<-rs])==1 then take 1 rs else rs
  let checked=prefix selected
      prefix []=[]
      prefix (r@((_,y),v):rs)=r:if equivalent v y then prefix rs else []
  bump engine "expression_tests" (length checked)
  bump engine "fv_bindings_eliminated" (length rows-length selected)
  work engine (length checked)
  pure (all (\((_,y),v)->equivalent v y) selected)

learn :: Engine -> Int -> LearningTask -> IO NodeId
learn engine remaining q=do
  stop<-exhausted engine
  invs<-readIORef (inventionsRef engine)
  if stop || remaining<0 then pure 0 else if null invs || not (onlineEnabled (mode engine)) then learnBase engine remaining q else do
    pool<-poolFor engine q
    allowed<-readIORef (supportedBaseRef engine)
    ids<-useInventions engine q [o | o<-pool,maybe True (symbols (observedExpr o) `S.isSubsetOf`) allowed]
    baseRoot<-learnBase engine remaining q
    case filter (/=0) (baseRoot:ids) of
      []->pure 0
      [i]->pure i
      allIds->node engine ("macro-union:"++show allIds) (Union (filter (/=0) (baseRoot:ids))) (Support (summary q) "nonempty definition-expanded task inventions")

learnBase :: Engine -> Int -> LearningTask -> IO NodeId
learnBase engine remaining q=do
  debug<-lookupEnv "LATIS_R2_DEBUG"
  when (debug==Just "1") $ do
    current<-readIORef (metricsRef engine)
    putStrLn ("Learn cost-credit="++show remaining++" work="++show (M.findWithDefault 0 "total_expanded_work" current)++" "++summary q)
    hFlush stdout
  bump engine "recursive_learning_tasks" 1
  bump engine "memo_queries" 1
  work engine 1
  memo<-readIORef (memoRef engine)
  invs<-readIORef (inventionsRef engine)
  active<-readIORef (supportedBaseRef engine)
  let key=show (length invs,remaining,fmap S.toAscList active)++":"++canonical q
  stale<-memoStale engine key
  case if mode engine==NoVersionSpaceSharing || stale then Nothing else M.lookup key memo of
    Just i->do
      bump engine "memo_hits" 1
      -- A memo hit must still report the demands its subtree registered,
      -- so an enclosing task is re-learned if those demands are resolved.
      epochs<-readIORef (memoEpochRef engine)
      case M.lookup key epochs of
        Just (ds,_) | not (S.null ds)->bump engine "demand_memo_reuse" 1 >> modifyIORef' (demandStackRef engine) (pushDemands ds)
        _->pure ()
      pure i
    Nothing->do
      activeTasks<-readIORef (activeRef engine)
      stopBudget<-exhausted engine
      let cycleKey=canonical q
          cyclic=S.member cycleKey activeTasks
          stop=stopBudget || cyclic
      when cyclic (bump engine "cycle_cutoffs" 1)
      if stop || remaining<0 || null (specification q) then do
        when (remaining<0) (bump engine "depth_cutoffs" 1)
        pure 0
      else do
        modifyIORef' (activeRef engine) (S.insert (canonical q))
        modifyIORef' (demandStackRef engine) (S.empty:)
        observedPool<-poolFor engine q
        when (debug==Just "1") (putStrLn ("pool="++show (length observedPool)) >> hFlush stdout)
        allowed<-readIORef (supportedBaseRef engine)
        rules<-rulesFor engine
        let shared=case map snd (points q) of
              y:ys | targetType q `elem` [BoolT,IntT,ColorT,CoordT,VecT,SizeT,AnchorT,D4T] && all (equivalent y) ys -> [Observed (literal y) (y:ys)]
              _->[]
            pool=[o | o<-observedPool++shared,maybe True (symbols (observedExpr o) `S.isSubsetOf`) allowed]
            inversePool=semanticPool pool
        let orderSamples=[(env,x) | FunctionOrder env x _ _<-specification q]++[(env,y) | FunctionOrder env _ y _<-specification q]
            keyCandidates=case targetType q of
              ArrowT a IntT | not (null orderSamples)->[f | f<-functionObservers a IntT orderSamples
                 ,maybe True (symbols f `S.isSubsetOf`) allowed,matches q f]
              _->[]
        keyIds<-forM keyCandidates $ \e->do
          work engine (length (specification q))
          i<-node engine ("key:"++show e) (Leaf e) (Support (summary q) "relational key specification checked by Base evaluation")
          modifyIORef' (spaceRef engine) (annotate q i)
          pure i
        matchingExpressions<-matchingObserved engine q pool
        observedIds<-forM matchingExpressions $ \e->do
          i<-node engine ("leaf:"++show e) (Leaf e)
            (Support (summary q) ("exact forward-observation witness; "++exprText e++"; FV="++show (S.toList (freeVars e))))
          modifyIORef' (spaceRef engine) (annotateVerified q i)
          pure i
        let leafIds=keyIds++observedIds
            compatible=[p | p<-rules,not (null (instances (primitiveName p) (targetType q)))]
            -- A witnessed forward observation closes this subproblem. This
            -- finite terminal policy avoids infinitely many identities (e.g.
            -- Translate(x,0)); it is a search restriction, not a proof that
            -- all longer programs are dominated or unsupported.
            forwardGround=any (/=0) leafIds
            forwardMatches o=exprType (observedExpr o)==targetType q && not (null (points q))
              && length (observedValues o)==length (points q) && and (zipWith equivalent (observedValues o) (map snd (points q)))
            groundedMatch=any (\o->not (S.null (freeVars (observedExpr o))) && forwardMatches o) pool
            unexplainedForward=any (\o->ungroundedCost (observedExpr o)>0 && forwardMatches o) pool
        note engine ("Learn("++summary q++"); return-compatible="++show (map primitiveName compatible))
        decompositions<-forM compatible $ \p->do
          work engine 1
          bump engine "propagation_steps" 1
          if mode engine/=NoEffectPropagation && effectContradiction p q pool then do
            bump engine "effect_pruned" 1
            note engine ("Effect propagation rejects "++primitiveName p++" under conditional observed-input domain")
            pure []
          else if (mode engine==NoLetSharing && primitiveName p=="let") || (forwardGround && (mode engine==BeamSearchLegacy || groundedMatch || not unexplainedForward
                    || primitiveName p `notElem` words "coordDelta coordAdd vecAdd coord vec size")) || remaining==0 then pure []
          else do
            bump engine "witness_calls" 1
            let ds=nubBy (\a b->map canonical (decompositionChildren a)==map canonical (decompositionChildren b)) (witnessFor engine remaining p q inversePool)
            when (debug==Just "1") (putStrLn ("witness "++primitiveName p++" "++show (length ds)) >> hFlush stdout)
            when (null ds) (bump engine "witness_unavailable" 1)
            bump engine "bidirectional_left_decompositions" (length [() | d<-ds,isLeftResidual d])
            when (demandPolicy (config engine)==DemandOn) $
              mapM_ (registerDemand engine q (primitiveName p)) (missingOperands p q inversePool)
            -- DeferNonLocal: postpone tagged branches unless this task's
            -- deferral has been released by the second pass.
            released<-if schedulePolicy (config engine)/=DeferNonLocal then pure True else do
              demands<-readIORef (demandRef engine)
              pure (maybe False ((/=Nothing) . demandResolvedEpoch) (M.lookup (deferredKey q) demands))
            let (deferred,immediate)=if released then ([],ds) else span' isDeferred ds
            when (not (null deferred)) $ do
              bump engine "deferred_branches" (length deferred)
              registerDeferred engine q (primitiveName p) (length deferred)
            pure [(p,d) | d<-immediate]
        let branches=concat decompositions
        when (length branches>1) (bump engine "branch_points" 1)
        scheduled<-forM (zip [0::Int ..] branches) $ \(idx,branch@(_,d))->do
          costs<-forM (decompositionChildren d) (estimateCost engine)
          if branchOrder (config engine)==CostOrder then pure ((1+sum costs,0,0,idx),branch) else do
            -- cheap cached signals only; one unit of work per scored branch
            work engine 1
            bump engine "branch_order_scored" 1
            signals<-forM (decompositionChildren d) $ \c->do
              childPool<-poolFor engine c
              let ys=map snd (points c)
                  matched=any (\o->exprType (observedExpr o)==targetType c && length (observedValues o)==length ys && and (zipWith equivalent (observedValues o) ys)) childPool
                        || (case ys of y:rest->targetType c `elem` [BoolT,IntT,ColorT,CoordT,VecT,SizeT,AnchorT,D4T] && all (equivalent y) rest; _->False)
                  childKey=show (length invs,remaining-1,fmap S.toAscList active)++":"++canonical c
              solved<-maybe False (/=0) . M.lookup childKey <$> readIORef (memoRef engine)
              pure (matched,solved)
            let unsolved=length [() | (m,sv)<-signals,not m,not sv]
                cached=length [() | (_,sv)<-signals,sv]
            pure ((unsolved,negate cached,1+sum costs,idx),branch)
        -- MRV: solve the most constrained child first. Operator traversal is
        -- driven solely by return types/witness results, never task classes.
        joinIds<-forM (map snd (sortOn fst scheduled)) $ \(p,d)->do
          stop'<-exhausted engine
          if stop' then pure 0 else do
            let cs=decompositionChildren d
            domains<-forM (zip [0::Int ..] cs) $ \(idx,c)->do
              childPool<-poolFor engine c
              let forwardCount=length [() | o<-childPool,exprType (observedExpr o)==targetType c
                                      ,and (zipWith equivalent (observedValues o) (map snd (points c)))]
                  scalarShared=case map snd (points c) of
                    y:ys | targetType c `elem` [BoolT,IntT,ColorT,CoordT,VecT,SizeT,AnchorT,D4T] && all (equivalent y) ys->1
                    _->0
              witnessSizes<-if forwardCount+scalarShared>0 then pure [] else forM
                [op | op<-rules,not (null (instances (primitiveName op) (targetType c)))
                 ,mode engine==NoEffectPropagation || not (effectContradiction op c childPool)] $ \op->do
                  bump engine "witness_calls" 1
                  bump engine "lookahead_witness_calls" 1
                  work engine 1
                  pure (length (witnessFor engine (remaining-1) op c (semanticPool childPool)))
              let witnessCount=sum witnessSizes
              -- MRV uses the surviving immediate forward/witness domain.
              -- This lookahead supplies an estimate, not the cardinality of
              -- an unconstructed recursive version space.
              pure (forwardCount+scalarShared+witnessCount,idx,c)
            let ordered=[(idx,c) | (_,idx,c)<-sortOn (\(size,idx,_)->(size,idx)) domains]
            note engine ("MRV immediate domains="++show [(idx,size) | (size,idx,_)<-domains])
            solved<-solveChildren forwardGround [] ordered
            if any ((==0) . snd) solved || length solved/=length cs then do
              bump engine "failed_witness_decompositions" 1
              when (primitiveName p `elem` ["map","scan"]) (note engine (primitiveName p++" witness rejected: child VS empty; "++summary q))
              pure 0
            else do
              bump engine "successful_witness_decompositions" 1
              let ids=map snd (sortOn fst solved)
                  why=Support (summary q) (decompositionEvidence d)
                  label=primitiveName p++":"++show (targetType q,M.toAscList (environment q))
              i<-if mode engine==NoVersionSpaceSharing then eagerJoin engine q p d ids why else
                node engine ("join:"++label++show ids) (Join label ids (decompositionBuild d)) why
              note engine ("Nonempty VS_"++primitiveName p++" node="++show i++" children="++show ids++"; "++decompositionEvidence d)
              pure i
        modifyIORef' (activeRef engine) (S.delete (canonical q))
        let ids=S.toList (S.fromList (filter (/=0) (leafIds++joinIds)))
        i<-case ids of
          []->pure 0
          [x]->pure x
          _->node engine ("union:"++show ids) (Union ids) (Support (summary q) "union of nonempty correlated alternatives")
        frame<-popDemands engine
        epochNow<-readIORef (epochRef engine)
        when (mode engine/=NoVersionSpaceSharing) $ do
          modifyIORef' (memoRef engine) (M.insert key i)
          modifyIORef' (memoEpochRef engine) (M.insert key (frame,epochNow))
        modifyIORef' (spaceRef engine) (annotateVerified q i)
        when (i/=0) (modifyIORef' (queryRef engine) (M.insertWith (\new old->S.toList (S.fromList (new++old))) i [q]))
        pure i
  where
    solveChildren _ acc []=pure acc
    solveChildren grounded acc ((idx,c):cs)=do
      i<-if grounded then learnForward engine c else learn engine (remaining-1) c
      if i==0 then pure ((idx,0):acc) else solveChildren grounded ((idx,i):acc) cs

-- ---------------------------------------------------------------------------
-- place-demand phase B: demand bookkeeping and bounded typed domain growth.
-- ---------------------------------------------------------------------------
isDeferred :: Decomposition -> Bool
isDeferred d=take 18 (decompositionEvidence d)=="deferred-nonlocal:"
isLeftResidual :: Decomposition -> Bool
isLeftResidual d=let e=decompositionEvidence d in take 36 e=="coordinate/vector inverse: condition" || take 18 e=="deferred-nonlocal:"
span' :: (a->Bool) -> [a] -> ([a],[a])
span' f xs=(filter f xs,filter (not . f) xs)
registerDeferred :: Engine -> LearningTask -> String -> Int -> IO ()
registerDeferred engine q sym count=do
  let key=deferredKey q
  modifyIORef' (demandRef engine) (\m->case M.lookup key m of
    Just r->M.insert key r {demandSymbols=S.insert sym (demandSymbols r)} m
    Nothing->M.insert key (DemandRecord (M.size m) (S.singleton (summary q)) (S.singleton sym) Nothing Nothing "deferred: non-local left residual branches postponed") m)
  modifyIORef' (demandStackRef engine) (pushDemands (S.singleton key))
  note engine ("Deferred "++show count++" non-local residual branches of "++sym++"; "++summary q)
-- Second pass: release every deferred task at once (epoch+1 so their memo
-- entries become stale), cap the work at the deferred share, re-enter Learn.
releaseDeferred :: Engine -> IO Int
releaseDeferred engine=do
  demands<-readIORef (demandRef engine)
  let pending=[k | (k,r)<-M.toList demands,snd k==deferredMarker,demandResolvedEpoch r==Nothing]
  if null pending then pure 0 else do
    modifyIORef' (epochRef engine) (+1)
    epochNow<-readIORef (epochRef engine)
    modifyIORef' (demandRef engine) (\m->foldr (M.adjust (\r->r {demandResolvedEpoch=Just epochNow,demandGrowth=Just 1,demandStatus="released: deferred branches explored in the second pass"})) m pending)
    pure (length pending)
pushDemands :: S.Set DemandKey -> [S.Set DemandKey] -> [S.Set DemandKey]
pushDemands ds (f:fs)=S.union f ds:fs
pushDemands _ []=[]
-- Pop the current frame; the enclosing task inherits the demands transitively.
popDemands :: Engine -> IO (S.Set DemandKey)
popDemands engine=do
  stack<-readIORef (demandStackRef engine)
  case stack of
    f:fs->writeIORef (demandStackRef engine) (pushDemands f fs) >> pure f
    []->pure S.empty
registerDemand :: Engine -> LearningTask -> String -> Type -> IO ()
registerDemand engine q sym t=do
  let key=(poolKey q,t)
  bump engine "demands_registered" 1
  modifyIORef' (demandRef engine) (\m->case M.lookup key m of
    Just r->M.insert key r {demandTasks=S.insert (summary q) (demandTasks r),demandSymbols=S.insert sym (demandSymbols r)} m
    Nothing->M.insert key (DemandRecord (M.size m) (S.singleton (summary q)) (S.singleton sym) Nothing Nothing "pending") m)
  modifyIORef' (demandStackRef engine) (pushDemands (S.singleton key))
  note engine ("Demand registered: "++sym++" lacks a conditioning operand of type "++show t++" in pool "++take 48 (fst key)++"...; "++summary q)
-- A memo entry is stale when a demand registered in its subtree was resolved
-- WITH growth after the entry was written. Resolutions without growth never
-- wake anything, and a rewritten entry carries the new epoch.
memoStale :: Engine -> String -> IO Bool
memoStale engine key=do
  epochs<-readIORef (memoEpochRef engine)
  case M.lookup key epochs of
    Nothing->pure False
    Just (ds,written) | S.null ds->pure False
    Just (ds,written)->do
      demands<-readIORef (demandRef engine)
      pure (any (\d->case M.lookup d demands >>= demandResolvedEpoch of Just e->e>written; Nothing->False) (S.toList ds))
demandMetric :: Engine -> String -> IO Int
demandMetric engine n=M.findWithDefault 0 n <$> readIORef (metricsRef engine)
-- Typed forward generation by signature only: pure Observe-effect Base
-- operators of arity 1 or 2 whose result type is the demanded type and whose
-- operand types are first-order and present in the pool. Operands per type are
-- the cap best-ranked pool observations (ordinary grounded MDL rank). This is
-- one composition layer over existing observations, never a Cartesian
-- enumeration over all types, and no task identity or target is consulted.
demandTerms :: Int -> Type -> [Observed] -> [Expr]
demandTerms cap t pool=
  [e | p<-base,primitiveEffect p==Observe,primitiveName p `notElem` ["literal","none","some","get","range"]
     ,ts<-instances (primitiveName p) t,length ts `elem` [1,2],all firstOrder ts
     ,all (\u->M.member u ranked) ts
     ,args<-sequence [M.findWithDefault [] u ranked | u<-ts]
     ,Right e<-[call (primitiveName p) t args],S.notMember e existing]
  where
    firstOrder u=case u of ArrowT _ _->False; _->True
    existing=S.fromList (map observedExpr pool)
    ranked=M.map (take cap . map observedExpr . sortOn (rankWith True . observedExpr))
             (M.fromListWith (flip (++)) [(exprType (observedExpr o),[o]) | o<-pool])
supportedDemandTypes :: [Type]
supportedDemandTypes=[CoordT,VecT,IntT]
-- Resolve every pending demand once, in registration order, within the demand
-- work budget (itself inside the global budget). Returns the number of pools
-- that actually grew. Generation, evaluation, indexing and deduplication are
-- all charged as work. A pool key/type pair is resolved at most once.
resolveDemands :: Engine -> IO Int
resolveDemands engine=do
  demands<-readIORef (demandRef engine)
  let pending=sortOn (demandOrder . snd) [(k,r) | (k,r)<-M.toList demands,demandResolvedEpoch r==Nothing]
  fmap sum $ forM pending $ \((key,t),_)->do
    stop<-exhausted engine
    spent<-demandMetric engine "demand_work"
    epochNow<-readIORef (epochRef engine)
    let conf=config engine
        finish status growth epochAt=modifyIORef' (demandRef engine) (M.adjust (\r->r {demandResolvedEpoch=Just epochAt,demandGrowth=Just growth,demandStatus=status}) (key,t))
    if stop || spent>=demandWorkBudget conf then do
      modifyIORef' (demandRef engine) (M.adjust (\r->r {demandStatus="suspended: demand work budget or global budget exhausted"}) (key,t))
      pure 0
    else if t `notElem` supportedDemandTypes then finish ("still-blocked: unsupported demand type "++show t) 0 epochNow >> pure 0
    else do
      pools<-readIORef (poolRef engine)
      tasks<-readIORef (poolEnvRef engine)
      case (M.lookup key pools,M.lookup key tasks) of
        (Just pool,Just rq)->do
          let envs=map fst (points rq)
              allowance=max 0 (min (demandWorkBudget conf-spent) (workBudget conf-0))
              terms=take allowance (demandTerms (demandOperandCap conf) t pool)
              fresh=concatMap (observeTerm envs) terms
              merged=selectPool engine (pool++fresh)
              before=S.fromList [(exprType (observedExpr o),observedExpr o) | o<-pool]
              added=[o | o<-merged,S.notMember (exprType (observedExpr o),observedExpr o) before]
              ofType u=length [() | o<-added,exprType (observedExpr o)==u]
              growth=length added
          _<-evaluate growth
          let units=length terms+growth
          work engine units
          bump engine "demand_work" units
          bump engine "demand_generated_terms" (length terms)
          bump engine "demand_new_observations" growth
          bump engine "demand_new_vec_observations" (ofType VecT)
          bump engine "demand_new_coord_observations" (ofType CoordT)
          bump engine "demand_new_int_observations" (ofType IntT)
          if growth>0 then do
            modifyIORef' (poolRef engine) (M.insert key merged)
            modifyIORef' (epochRef engine) (+1)
            finish "resumed: pool grew" growth (epochNow+1)
            note engine ("Demand resolved: type "++show t++" generated="++show (length terms)++" new observations="++show growth++" (VecT="++show (ofType VecT)++", CoordT="++show (ofType CoordT)++", IntT="++show (ofType IntT)++"); epoch="++show (epochNow+1))
            pure 1
          else do
            finish "still-blocked: no new typed observation within cap" 0 epochNow
            note engine ("Demand still blocked: type "++show t++" generated="++show (length terms)++" no new observation")
            pure 0
        _->finish "still-blocked: pool or environment missing" 0 epochNow >> pure 0
countStaleMemo :: Engine -> IO Int
countStaleMemo engine=do
  epochs<-readIORef (memoEpochRef engine)
  length . filter id <$> mapM (memoStale engine) (M.keys epochs)
-- Deduction with demand rounds: learn, resolve pending demands, re-enter Learn
-- from the root (memo hits cover unaffected subtasks; stale entries are the
-- affected ones), and union the roots so every earlier alternative survives.
-- No round starts without pending demands, and no re-entry without growth.
learnWithDemands :: Engine -> LearningTask -> IO NodeId
learnWithDemands engine q=do
  root0<-learn engine (depthBound (config engine)) q
  rootD<-if demandPolicy (config engine)/=DemandOn then pure root0 else go (1::Int) root0
  if schedulePolicy (config engine)/=DeferNonLocal then pure rootD else do
    released<-releaseDeferred engine
    bump engine "deferred_tasks" released
    bump engine "deferred_released" released
    stop<-exhausted engine
    if released==0 || stop then pure rootD else do
      stale<-countStaleMemo engine
      bump engine "deferred_pass_memo_invalidations" stale
      before<-M.findWithDefault 0 "total_expanded_work" <$> readIORef (metricsRef engine)
      writeIORef (budgetCapRef engine) (Just (before+deferredWorkBudget (config engine)))
      note engine ("Deferred pass: released="++show released++" stale memo="++show stale++" share="++show (deferredWorkBudget (config engine)))
      root'<-learn engine (depthBound (config engine)) q
      writeIORef (budgetCapRef engine) Nothing
      after<-M.findWithDefault 0 "total_expanded_work" <$> readIORef (metricsRef engine)
      bump engine "deferred_pass_work" (after-before)
      if root'==rootD || root'==0 then pure rootD
        else if rootD==0 then pure root'
        else node engine ("deferred-union:"++show (rootD,root')) (Union [rootD,root']) (Support (summary q) "retain first-pass alternatives; add alternatives reachable through deferred non-local residual branches")
  where
    go r root
      | r>demandRounds (config engine)=pure root
      | otherwise=do
          stop<-exhausted engine
          demands<-readIORef (demandRef engine)
          let pending=M.size (M.filter ((==Nothing) . demandResolvedEpoch) demands)
          if stop || pending==0 then pure root else do
            grown<-resolveDemands engine
            bump engine "demand_rounds" 1
            if grown==0 then pure root else do
              stale<-countStaleMemo engine
              bump engine "demand_memo_invalidations" stale
              note engine ("Demand round "++show r++": pools grown="++show grown++"; stale memo entries="++show stale)
              root'<-learn engine (depthBound (config engine)) q
              merged<-if root'==root || root'==0 then pure root
                      else if root==0 then pure root'
                      else node engine ("demand-union:"++show (root,root')) (Union [root,root']) (Support (summary q) "retain pre-expansion alternatives; add alternatives reachable after typed domain growth")
              go (r+1) merged
demandSummary :: Engine -> IO [(DemandKey,DemandRecord)]
demandSummary engine=do
  demands<-readIORef (demandRef engine)
  let rows=sortOn (demandOrder . snd) (M.toList demands)
  bump engine "demands_distinct" (length rows)
  bump engine "demands_resumed" (length [() | (_,r)<-rows,maybe False (>0) (demandGrowth r)])
  bump engine "demands_still_blocked" (length [() | (_,r)<-rows,demandResolvedEpoch r/=Nothing,maybe True (==0) (demandGrowth r)])
  bump engine "demands_suspended" (length [() | (_,r)<-rows,demandResolvedEpoch r==Nothing])
  pure rows

eagerJoin :: Engine -> LearningTask -> Primitive -> Decomposition -> [NodeId] -> Support -> IO NodeId
eagerJoin engine q p d ids why=do
  s<-readIORef (spaceRef engine)
  let frontier=frontierBound (config engine)
      parts=[fst (materialize frontier s i) | i<-ids]
      es=[e | args<-take (frontier*frontier) (sequence parts),Right e<-[decompositionBuild d args],matches q e]
  bump engine "materialized_child_asts" (length es)
  bump engine "materialized_complete_asts" (length [e | e<-es,exprType e==ArrowT SceneT SceneT])
  leaves<-traverse (\e->node engine ("eager:"++show e) (Leaf e) why) es
  case leaves of
    []->pure 0
    [i]->pure i
    _->node engine ("eager-union:"++primitiveName p++show leaves) (Union leaves) why

predictInduced :: InducedConfig -> Expr -> Grid -> Either String Grid
predictInduced conf p x=do
  _<-typeCheck M.empty p
  let z=encode (inducedEncoder conf) x
  y<-runFunction p (SceneV z)
  case y of SceneV s->render s; _->Left "program did not return Scene"

inducedSearch :: InducedMode -> InducedConfig -> [(Grid,Grid)] -> IO InducedResult
inducedSearch runMode conf pairs=do
  started<-getMonotonicTimeNSec
  engine<-newEngine runMode conf
  writeIORef (exactTrainingRef engine) (Just pairs)
  bump engine "root_learning_tasks" 1
  let encoded=if null pairs then Left "empty training specification" else Right [(encode (inducedEncoder conf) x,encode (inducedEncoder conf) y) | (x,y)<-pairs]
  (root,encodingError)<-case encoded of
    Left err->pure (0,Just err)
    Right zs->do
      let q=functionTask SceneT SceneT [(M.empty,SceneV x,SceneV y) | (x,y)<-zs]
      note engine ("Root specification Q0: "++summary q++". Original Grid targets reserved for exact verification.")
      i<-if runMode==NoWitness then bottomUp engine zs else learnLoop engine q
      pure (i,Nothing)
  s<-readIORef (spaceRef engine)
  (candidates,astWork)<-extract engine s root
  bump engine "materialized_child_asts" astWork
  when (runMode/=NoVersionSpaceSharing) (bump engine "materialized_complete_asts" (length candidates))
  valid<-fmap concat $ forM candidates $ \p->do
    ok<-verifyTraining engine p
    note engine ("Exact original Render(P(Encode(x)))=y: "++show ok++"; MDL rank="++show (rank p))
    when ok $ do
      countersNow<-readIORef (metricsRef engine)
      when (M.findWithDefault 0 "first_solution_states" countersNow==0) (bump engine "first_solution_states" (M.findWithDefault 0 "total_expanded_work" countersNow))
    pure [p | ok]
  let chosen=case sortOn (ranking engine) valid of p:_->Just p; _->Nothing
      sig=signature s root
      rootQ=functionTask SceneT SceneT [(M.empty,SceneV (encode (inducedEncoder conf) x),SceneV (encode (inducedEncoder conf) y)) | (x,y)<-pairs]
  certified<-forM valid $ \p->do
    i<-node engine ("root-certificate:"++show p) (Leaf p) (Support (summary rootQ) "Base AST obtained by DAG coverage/cost saturation/shared-initializer class substitution; original training Grid exact-verified")
    modifyIORef' (spaceRef engine) (annotateVerified rootQ i)
    pure i
  certifiedRoot<-if null certified then pure root else node engine ("certified-root:"++show (root:certified)) (Union (filter (/=0) (root:certified))) (Support (summary rootQ) "preserve original symbolic VSA and all exact-verified structural root representatives")
  currentSpace<-readIORef (spaceRef engine)
  let classes=equivalenceClasses currentSpace
      finalSig=signature currentSpace certifiedRoot
  bump engine "equivalence_classes" (M.size classes)
  bump engine "structural_representatives" (sum (map M.size (M.elems classes)))
  bump engine "max_representatives_per_class" (maximum (0:map M.size (M.elems classes)))
  forM valid $ \p->do
    bump engine "let_cse_sharing" (sharingCount p)
    bump engine "cse_nodes_saved" (exprLength (unshareGenerated p)-exprLength p)
    bump engine "ungrounded_literal_cost" (ungroundedCost p)
    when (ungroundedCost p==0) (bump engine "grounded_expressions" 1)
  inventions<-readIORef (inventionsRef engine)
  memo<-readIORef (memoRef engine)
  bump engine "memoized_learning_tasks" (M.size memo)
  bump engine "version_space_nodes" (M.size (nodes currentSpace))
  bump engine "union_nodes" (length [() | Union _<-M.elems (nodes currentSpace)])
  bump engine "join_nodes" (length [() | Join _ _ _<-M.elems (nodes currentSpace)])
  bump engine "structural_deduplications" (structuralDuplicates currentSpace)
  bump engine "base_symbols_activated" (M.size finalSig)
  bump engine "base_symbols_rejected" (length base-M.size (M.filterWithKey (\n _->n `elem` map primitiveName base) finalSig))
  bump engine "invented_abstractions" (length inventions)
  bump engine "induced_tsl_symbol_count" (M.size finalSig+length inventions)
  case chosen of
    Nothing->pure ()
    Just p->do
      bump engine "program_ast_length" (exprLength p)
      bump engine "selected_mdl_cost" (let (cost,_,_)=ranking engine p in cost)
      bump engine "selected_let_bindings" (sharingCount p)
      bump engine "selected_cse_nodes_saved" (exprLength (unshareGenerated p)-exprLength p)
      bump engine "selected_ungrounded_literal_cost" (ungroundedCost p)
      bump engine "distinct_symbol_count" (S.size (symbols p))
      counters<-readIORef (metricsRef engine)
      pure () -- first solution recorded during cost-stratified verification
      note engine ("Selected AST; FV="++show (S.toList (freeVars p))++"; "++exprText p)
  bounded<-exhausted engine
  demandRows<-demandSummary engine
  _<-forM inventions $ \i->note engine ("TaskInvented "++inventionName i++": "++exprText (inventionBody i)++"; repeats="++show (inventionOccurrences i)++"; portfolio MDL saving="++show (inventionSaving i))
  note engine ("Induced TSL=Signature(root VS) union inventions. BaseActivated="++show (M.keys finalSig)++"; TaskInvented="++show (map inventionName inventions)++"; StructuralPriorCount=0")
  counters<-readIORef (metricsRef engine)
  trace<-reverse <$> readIORef (traceRef engine)
  let graphs=case encoded of Right zs->[correspond (inducedCorrespondenceBudget conf) a b | (a,b)<-zs]; _->[]
      missingGrounding=any (null . branches) graphs
      missingConstructor=case encoded of
        Right zs->any (\(a,b)->any (\o->all (\x->all (\i->O.shape (d4 x i)/=O.shape o) [0..7]) (O.objects a)) (O.objects b)) zs
        _->False
      failure=case (chosen,encodingError,bounded) of
        (Just _,_,_)->"None"; (_,Just _,_)->"ImplementationBug"
        (_,_,True)->"SearchFailure"
        _ | runMode==NoWitness->"SearchFailure"
          | root/=0->"SearchFailure"
          | any truncated graphs->"SearchFailure"
          | missingGrounding&&missingConstructor->"BaseExpressibilityUnknown"
          | missingGrounding->"SpecificationRepresentationMissing"
          | otherwise->"WitnessMissing"
      evidence=case encodingError of
        Just err->err
        _ | chosen/=Nothing->"training exact; heldout is assessed only after MDL selection"
          | bounded->"finite expanded-work budget reached; no impossibility claim"
          | runMode==NoWitness&&chosen==Nothing->"finite bottom-up type beams/depth exhausted without an exact program; no impossibility claim"
          | chosen==Nothing&&root/=0->"nonempty symbolic root VSA; bounded cost/portfolio extraction did not produce an exact complete program; search/materialization failure, not a missing Base or witness certificate"
          | chosen==Nothing&&missingGrounding&&missingConstructor->"canonical correspondence absent; intrinsic output outside source D4 closure. Expressible(Base) is UNKNOWN: cloning/tiling programs are not disproved. Reachable(Base,Spec,Witness) failed in the bounded grounded domain. No Base impossibility certificate."
          | chosen==Nothing&&missingGrounding->"no canonical object correspondence in the bounded visibility/D4/color domain; residual specification representation is missing"
          | chosen==Nothing->"no supported complete program under partial witnesses, finite observation domains, depth and frontier bounds; witness-coverage diagnosis within these bounds, not a claim Base cannot express the task"
          | otherwise->"training exact; heldout is assessed only after MDL selection"
  _<-evaluate (length failure+length evidence)
  finished<-getMonotonicTimeNSec
  pure (InducedResult chosen valid currentSpace certifiedRoot finalSig inventions counters (fromIntegral (finished-started)/1e9) trace failure evidence bounded demandRows)

onlineEnabled :: InducedMode -> Bool
onlineEnabled m=m `notElem` [NoOnlineAbstraction,PostHocOnly,NoTaskAbstraction,NoWitness]

verifyTraining :: Engine -> Expr -> IO Bool
verifyTraining engine p=do
  cache<-readIORef (exactCacheRef engine)
  case M.lookup p cache of
    Just ok->pure ok
    Nothing->do
      pairs<-readIORef (exactTrainingRef engine)
      case pairs of
        Nothing->pure True -- non-Grid task-local unit sessions use matches(q)
        Just rows->do
          started<-getMonotonicTimeNSec
          bump engine "exact_verifier_calls" 1
          let ok=typeCheck M.empty p==Right (ArrowT SceneT SceneT) && all (\(x,y)->predictInduced (config engine) p x==Right y) rows
          _<-evaluate ok
          finished<-getMonotonicTimeNSec
          bump engine "verification_milliseconds" (fromIntegral ((finished-started) `div` 1000000))
          modifyIORef' (exactCacheRef engine) (M.insert p ok)
          when ok $ do
            counters<-readIORef (metricsRef engine)
            when (M.findWithDefault 0 "first_solution_states" counters==0) (bump engine "first_solution_states" (M.findWithDefault 0 "total_expanded_work" counters))
          pure ok

-- Finite loop. The first pass bootstraps support over the fixed Base; subsequent
-- passes use supported Base symbols plus definitions. This restriction is
-- task-local reachability, never a proof about Base expressibility.
-- Dictionaries are engine-local and never survive inducedSearch calls.
learnLoop :: Engine -> LearningTask -> IO NodeId
learnLoop engine q=go 0 Nothing
  where
    go roundNo supplied=do
      before<-M.findWithDefault 0 "total_expanded_work" <$> readIORef (metricsRef engine)
      deductionStart<-getMonotonicTimeNSec
      root<-case supplied of Just i->pure i; _->learnWithDemands engine q
      deductionEnd<-getMonotonicTimeNSec
      bump engine "deduction_milliseconds" (fromIntegral ((deductionEnd-deductionStart) `div` 1000000))
      s<-readIORef (spaceRef engine)
      activateSupportedBase engine s root
      (frontier,extraction)<-extract engine s root
      valid<-fmap concat $ forM (filter (matches q) frontier) $ \p->do ok<-verifyTraining engine p; pure [p | ok]
      modifyIORef' (supportedBaseRef engine) (fmap (`S.union` S.unions (map symbols valid)))
      bump engine "materialized_child_asts" extraction
      after<-M.findWithDefault 0 "total_expanded_work" <$> readIORef (metricsRef engine)
      bump engine (if roundNo==0 then "synthesis_work_before_discovery" else "synthesis_work_after_discovery") (after-before)
      stopBeforeDiscovery<-exhausted engine
      if stopBeforeDiscovery || mode engine `elem` [NoOnlineAbstraction,NoTaskAbstraction,NoWitness] || roundNo>=maxRounds (abstractionLimits (config engine)) then pure root else do
        old<-readIORef (inventionsRef engine)
        discoveryStart<-getMonotonicTimeNSec
        let (accepted,discoveryUnits)=discoverOnlineCounted (mode engine/=NoAntiUnification) (mode engine/=NoLambdaLifting)
                       (abstractionLimits (config engine)) old (take 32 valid)
        _<-evaluate (length accepted+discoveryUnits)
        discoveryEnd<-getMonotonicTimeNSec
        bump engine "discovery_milliseconds" (fromIntegral ((discoveryEnd-discoveryStart) `div` 1000000))
        bump engine "abstraction_discovery_work" discoveryUnits
        work engine discoveryUnits
        bump engine "abstraction_rounds" 1
        note engine ("Abstraction round="++show roundNo++"; exact frontier="++show (length valid)++"; accepted="++show (map inventionName accepted))
        writeIORef (inventionsRef engine) (old++accepted)
        stop<-exhausted engine
        if null accepted || not (onlineEnabled (mode engine)) || stop then pure root else do
          -- Add definition-expanded alternatives to the actual previously
          -- learned demands, preserving every earlier Base representative.
          -- Shared nodes require an invention to satisfy ALL recorded contexts.
          feedbackBefore<-M.findWithDefault 0 "total_expanded_work" <$> readIORef (metricsRef engine)
          updated<-learnFeedback engine root
          feedbackAfter<-M.findWithDefault 0 "total_expanded_work" <$> readIORef (metricsRef engine)
          bump engine "synthesis_work_after_discovery" (feedbackAfter-feedbackBefore)
          later<-go (roundNo+1) (Just updated)
          if later==0 then pure root else node engine ("round-union:"++show (root,later)) (Union [root,later]) (Support (summary q) "retain pre-feedback alternatives")

-- Incremental task-local Learn: retain its existing deductive VSA and add the
-- newly available dictionary branch through ordinary typed definition expansion.
-- No invention has a custom witness. Rebuilding parent edges exposes these
-- alternatives to subsequent extraction without replaying unchanged Base work.
learnFeedback :: Engine -> NodeId -> IO NodeId
learnFeedback engine root=do
  original<-readIORef (spaceRef engine)
  queries<-readIORef (queryRef engine)
  replacements<-fmap M.fromList $ fmap concat $ forM (M.toAscList queries) $ \(i,qs)->do
    stop<-exhausted engine
    let useful=[q | q<-qs,case targetType q of ArrowT _ _->targetType q/=ArrowT SceneT SceneT; _->False]
        types=M.fromListWith S.union [(name,S.singleton t) | q<-useful,(name,t)<-M.toList (environment q)]
    if stop || S.notMember i (reachable original root) || null useful || any ((/=1) . S.size) (M.elems types) then pure [] else do
      let first=head useful
          combined=LearningTask (targetType first) (S.toList (S.fromList (concatMap specification useful))) (M.map S.findMin types)
      bump engine "recursive_learning_tasks" 1
      work engine 1
      pool<-poolFor engine combined
      ids<-useInventions engine combined pool
      if null ids then pure [] else do
        replacement<-node engine ("feedback-choice:"++show (i,ids)) (Union (i:ids)) (Support (summary combined) "Learn: prior VSA plus newly available definition-expanded task inventions; all contexts checked")
        modifyIORef' (spaceRef engine) (annotateVerified combined replacement)
        pure [(i,replacement)]
  rebuilt<-newIORef M.empty
  let walk i=case M.lookup i replacements of
        Just new->pure new
        Nothing->do
          cache<-readIORef rebuilt
          case M.lookup i cache of
            Just new->pure new
            Nothing->do
              new<-case M.lookup i (nodes original) of
                Just (Join label cs assemble)->do
                  changed<-mapM walk cs
                  if changed==cs then pure i else node engine ("feedback-join:"++show (i,changed)) (Join label changed assemble) (Support "incremental task-local Learn" "same Base witness; dictionary alternatives propagated through correlated child edges")
                Just (Union cs)->do
                  changed<-mapM walk cs
                  if changed==cs then pure i else node engine ("feedback-union:"++show (i,changed)) (Union changed) (Support "incremental task-local Learn" "preserve all prior structural alternatives")
                _->pure i
              modifyIORef' rebuilt (M.insert i new)
              pure new
  walk root

-- A sequence of related demands is ONE task-local synthesis session. Earlier
-- frontiers alone train inventions; later specifications/outputs never enter
-- discovery early. This exposes actual subsequent subproblem work, including
-- all definition-expansion tests, without a cross-task library.
learnTaskSequence :: InducedMode -> InducedConfig -> [LearningTask]
                  -> IO ([[Expr]],[Invention],M.Map String Int,[String])
learnTaskSequence runMode conf qs=do
  engine<-newEngine runMode conf
  portfolios<-forM (zip [0::Int ..] qs) $ \(idx,q)->do
    before<-M.findWithDefault 0 "total_expanded_work" <$> readIORef (metricsRef engine)
    root<-learn engine (depthBound conf) q
    s<-readIORef (spaceRef engine)
    activateSupportedBase engine s root
    (frontier,_)<-extract engine s root
    let valid=filter (matches q) frontier
    after<-M.findWithDefault 0 "total_expanded_work" <$> readIORef (metricsRef engine)
    bump engine (if idx==0 then "synthesis_work_before_discovery" else "synthesis_work_after_discovery") (after-before)
    if idx>=maxRounds (abstractionLimits conf) || runMode `elem` [NoOnlineAbstraction,NoTaskAbstraction] then pure valid else do
      old<-readIORef (inventionsRef engine)
      let (accepted,units)=discoverOnlineCounted (runMode/=NoAntiUnification) (runMode/=NoLambdaLifting) (abstractionLimits conf) old (take 32 valid)
      work engine units
      bump engine "abstraction_discovery_work" units
      bump engine "abstraction_rounds" 1
      writeIORef (inventionsRef engine) (old++accepted)
      note engine ("session demand="++show idx++"; accepted="++show (map inventionName accepted))
      pure valid
  invs<-readIORef (inventionsRef engine)
  bump engine "invented_abstractions" (length invs)
  memo<-readIORef (memoRef engine)
  bump engine "memoized_learning_tasks" (M.size memo)
  s<-readIORef (spaceRef engine)
  bump engine "version_space_nodes" (M.size (nodes s))
  metrics<-readIORef (metricsRef engine)
  trace<-reverse <$> readIORef (traceRef engine)
  pure (portfolios,invs,metrics,trace)

-- Generic finite bottom-up ablation, independent of output specifications.
-- Type-indexed beams intentionally bound products. Lambda body candidates are
-- generated from input-grounded environments and the SAME Base; no witness is
-- invoked. Higher-order operands may therefore be reached at shallow depths,
-- without providing a complete task skeleton to the enumerator.
bottomUp :: Engine -> [(O.Scene,O.Scene)] -> IO NodeId
bottomUp engine zs=do
  let input=variable "v0" SceneT
      rows=[(M.singleton "v0" (SceneV x),SceneV y) | (x,y)<-zs]
      q=pointTask SceneT rows
      seed=map observedExpr (observations q)
      objects'=[PlacedV o | (s,_)<-zs,o<-O.objects s]
      domains=[(PlacedT,objects'),(PairT PlacedT PlacedT,[PairV a b | a<-objects',b<-objects'])
              ,(IntT,map IntV [-2..2])]
      universe=[BoolT,IntT,ColorT,CoordT,VecT,SizeT,SceneT,PlacedT,ObjectT,ListT PlacedT,ListT IntT,SetT ColorT
               ,ArrowT PlacedT PlacedT,ArrowT PlacedT BoolT,ArrowT PlacedT IntT,ArrowT (PairT PlacedT PlacedT) PlacedT]
      beam xs=M.map (take 8 . sortOn rank . S.toList . S.fromList) (M.fromListWith (++) [(exprType e,[e]) | e<-xs])
      arguments pools ts=take 64 (sequence [M.findWithDefault [] t pools | t<-ts])
      generated pools=[e | p<-base,primitiveName p `notElem` ["lambda","let","application"],t<-universe
                       ,ts<-instances (primitiveName p) t,args<-arguments pools ts,Right e<-[call (primitiveName p) t args],exprLength e<=40]
  bodySeeds<-fmap concat $ forM [(t,vs) | (t,vs)<-domains,not (null vs)] $ \(t,vs)->do
    let bodyQ=pointTask t [(M.fromList [("v0",SceneV s),("u",a)],a) | (s,_)<-take 1 zs,a<-take 12 vs]
        initial=map observedExpr (observations bodyQ)
    bodies<-enumerateBodies engine bodyQ (min 3 (depthBound (config engine))) (workBudget (config engine) `div` 6) generated beam initial
    pure [lambda "u" t e | e<-bodies,exprLength e<=24]
  _<-evaluate input
  note engine "NoWitness: finite bottom-up typed Base enumeration; beam=8/type, products=64/operator-instance, iterations=depth bound; targets used only for final acceptance"
  go q 0 (beam (seed++bodySeeds)) S.empty [] universe generated beam
  where
    go q depth pools seen valid universe generated beam
      | depth>=depthBound (config engine)=finish valid
      | otherwise=do
          stop<-exhausted engine
          if stop then finish valid else do
            let fresh=take (max 0 (workBudget (config engine)-S.size seen)) [e | e<-generated pools,not (S.member e seen)]
            checked<-forM fresh $ \e->do
              work engine 1
              bump engine "bottom_up_terms" 1
              bump engine "expression_tests" (length (points q))
              let values=traverse (\(env,_)->evalValue env e) (points q)
              case values of
                Right vs->pure [(e,vs)]
                _ | ArrowT _ _<-exprType e->pure [(e,[])]
                _->pure []
            let usable=concat checked
                accepted=[lambda "v0" SceneT e | (e,vs)<-usable,exprType e==SceneT,and (zipWith equivalent vs (map snd (points q)))]
                semantic=M.elems (M.fromListWith (\a b->if rank (fst a)<=rank (fst b) then a else b)
                  [((exprType e,if null vs then exprText e else show (map valueKey vs)),(e,vs)) | (e,vs)<-usable])
            bump engine "semantic_deduplications" (length usable-length semantic)
            go q (depth+1) (beam (concat (M.elems pools)++map fst semantic)) (S.union seen (S.fromList fresh)) (valid++accepted) universe generated beam
    finish valid=do
      ids<-traverse (\e->node engine ("bottom-up:"++show e) (Leaf e) (Support "root IO specification" "finite typed forward enumeration; no witness backpropagation")) (take (frontierBound (config engine)) (sortOn rank valid))
      if null ids then pure 0 else node engine ("bottom-up-union:"++show ids) (Union ids) (Support "root" "exact observation acceptance")

-- The same bottom-up expansion under a typed lambda parameter. Only input
-- values ground these environments; no target/witness/privileged function
-- body is supplied. Products and beams are identical to root enumeration.
enumerateBodies :: Engine -> LearningTask -> Int -> Int
  -> (M.Map Type [Expr] -> [Expr]) -> ([Expr] -> M.Map Type [Expr]) -> [Expr] -> IO [Expr]
enumerateBodies engine q rounds limit generate beam initial=go rounds 0 S.empty (beam initial)
  where
    go 0 _ _ pools=pure (concat (M.elems pools))
    go n used seen pools=do
      stop<-exhausted engine
      if stop||used>=limit then pure (concat (M.elems pools)) else do
        let fresh=take (limit-used) [e | e<-generate pools,not (S.member e seen)]
        good<-fmap concat $ forM fresh $ \e->do
          work engine 1
          bump engine "bottom_up_terms" 1
          bump engine "expression_tests" (length (points q))
          pure [e | all (\(env,_)->case evalValue env e of Right _->True; _->False) (points q)]
        go (n-1) (used+length fresh) (S.union seen (S.fromList fresh)) (beam (concat (M.elems pools)++good))


diverseEnabled :: Engine -> Bool
diverseEnabled e=mode e `notElem` [NoDiversityPreservation,FixedAliasCap,BeamSearchLegacy]
ranking :: Engine -> Expr -> (Int,Int,String)
ranking e=rankWith (mode e/=NoGroundedLiteralPrior)
selectPool :: Engine -> [Observed] -> [Observed]
selectPool e
  | mode e==BeamSearchLegacy=r1ObserversToR2 . R1Observers.dedup 96 . r2ObserversToR1
  | otherwise=selectObserved (diverseEnabled e) (if mode e==NoDiversityPreservation then 1 else 2)
  where
    r1ObserversToR2=map (\o->Observed (R1Observers.observedExpr o) (R1Observers.observedValues o))
    r2ObserversToR1=map (\o->R1Observers.Observed (observedExpr o) (observedValues o))
-- Inverse domains need denotations, not duplicate syntax. Child VSA keeps the
-- entire signature class, so deduplication HERE does not discard hypotheses.
semanticPool :: [Observed] -> [Observed]
semanticPool os=M.elems (M.fromListWith better [( (exprType (observedExpr o),map valueKey (observedValues o)),o) | o<-os])
  where better a b=if exprLength (observedExpr a)<=exprLength (observedExpr b) then a else b
estimateCost :: Engine -> LearningTask -> IO Int
estimateCost engine q=case targetType q of
  ArrowT _ _->pure 2
  _->do
    pool<-poolFor engine q
    let ys=map snd (points q)
        matched=[e | o<-pool,let e=observedExpr o,exprType e==targetType q
                     ,length (observedValues o)==length ys,and (zipWith equivalent (observedValues o) ys)]
        shared=case ys of y:rest | all (equivalent y) rest && targetType q `elem` [IntT,BoolT,ColorT,VecT,CoordT,SizeT,AnchorT,D4T]->[literal y]; _->[]
        costs=[cost | e<-matched++shared,let (cost,_,_)=ranking engine e]
    pure (minimum (if null costs then [3] else costs))
learnForward :: Engine -> LearningTask -> IO NodeId
learnForward engine q=do
  pool<-poolFor engine q
  let shared=case map snd (points q) of
        y:ys | targetType q `elem` [BoolT,IntT,ColorT,CoordT,VecT,SizeT,AnchorT,D4T] && all (equivalent y) ys->[Observed (literal y) (y:ys)]
        _->[]
      functions=case targetType q of
        ArrowT a b->functionObservers a b ([(env,x) | FunctionPoint env x _<-specification q]++[(env,x) | FunctionOrder env x _ _<-specification q])
        _->[]
      candidates=[o | o<-pool++shared,exprType (observedExpr o)==targetType q]
  matching<-matchingObserved engine q candidates
  goodFunctions<-fmap concat $ forM functions $ \f->do
    work engine (1+length (specification q))
    pure [f | matches q f]
  ids<-forM (matching++goodFunctions) $ \e->do
      i<-node engine ("forward:"++show e) (Leaf e) (Support (summary q) "typed forward coverage; structural representative")
      modifyIORef' (spaceRef engine) (annotateVerified q i)
      pure i
  if null ids then pure 0 else node engine ("forward-union:"++show ids) (Union ids) (Support (summary q) "observational class with all distinct signatures")
matchingObserved :: Engine -> LearningTask -> [Observed] -> IO [Expr]
matchingObserved engine q pool=fmap concat $ forM classes $ \os->case os of
  []->pure []
  first:_->do
    yes<-matchObservation engine q first
    pure [observedExpr o | yes,o<-os]
  where
    classes=M.elems (M.fromListWith (++) [(map valueKey (observedValues o),[o]) | o<-pool,exprType (observedExpr o)==targetType q])
extract :: Engine -> Space -> NodeId -> IO ([Expr],Int)
extract engine store root=do
  cached<-readIORef (extractedRef engine)
  case M.lookup root cached of
    Just es->pure (es,0)
    Nothing->extractFresh engine store root cached
extractFresh :: Engine -> Space -> NodeId -> M.Map NodeId [Expr] -> IO ([Expr],Int)
extractFresh engine store root cached=do
  extractionStart<-getMonotonicTimeNSec
  debug<-lookupEnv "LATIS_R2_DEBUG"
  when (debug==Just "1") (putStrLn ("Extract root="++show root++" nodes="++show (M.size (nodes store))) >> hFlush stdout)
  counters<-readIORef (metricsRef engine)
  let allowance=max 0 (workBudget (config engine)-M.findWithDefault 0 "total_expanded_work" counters)
      bound=structuralCostBound (config engine)
      aliasCap=case mode engine of NoDiversityPreservation->1; FixedAliasCap->2; _->0
      sharing=mode engine/=NoLetSharing
      prior=mode engine/=NoGroundedLiteralPrior
  (covered,coverUnits)<-if mode engine `elem` [BeamSearchLegacy,NoPortfolioCover] then pure ([],0)
    else (if coverPolicy (config engine)==CoverLazy then coverLazy else coverPortfolio) aliasCap sharing prior bound (min allowance (workBudget (config engine) `div` 20)) store root
  when (coverPolicy (config engine)==CoverLazy) (bump engine "cover_lazy_candidates" (length covered))
  (correlated,correlatedUnits)<-if not sharing || mode engine `elem` [BeamSearchLegacy,NoPortfolioCover] then pure ([],0)
    else sharedAliasProposals prior bound (min (allowance-coverUnits) (workBudget (config engine) `div` 20)) store covered
  let (fresh,units,reached,strata)=if mode engine==BeamSearchLegacy then let (xs,n)=materialize (frontierBound (config engine)) store root in (xs,n,0,[])
             else saturatePolicy (case mode engine of NoDiversityPreservation->1; FixedAliasCap->2; _->0)
                    sharing prior bound (min (saturationWorkBudget (config engine)) (allowance-coverUnits-correlatedUnits)) store root
      old=case M.lookup root (nodes store) of Just (Union cs)->concat [M.findWithDefault [] i cached | i<-cs]; _->[]
      es=representatives prior (old++covered++correlated++fresh)
  _<-evaluate (length es)
  extractionEnd<-getMonotonicTimeNSec
  bump engine "extraction_milliseconds" (fromIntegral ((extractionEnd-extractionStart) `div` 1000000))
  when (debug==Just "1") (putStrLn ("Extract completed representatives="++show (length es)++" work="++show units++" cost="++show reached) >> hFlush stdout)
  work engine (coverUnits+correlatedUnits+units)
  bump engine "portfolio_cover_work" coverUnits
  bump engine "shared_alias_work" correlatedUnits
  bump engine "extraction_work" (coverUnits+correlatedUnits+units)
  modifyIORef' (metricsRef engine) (M.insertWith max "cost_bound_reached" reached)
  bump engine "cost_strata" (length strata)
  note engine ("Cost saturation C=1.."++show reached++" root representatives="++show strata)
  modifyIORef' (extractedRef engine) (M.insert root es)
  pure (sortOn (ranking engine) es,coverUnits+correlatedUnits+units)
