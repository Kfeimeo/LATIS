module Synthesis.InducedR1.Learn where
import Language.Induced.Base
import Synthesis.InducedR1.Specification
import Synthesis.InducedR1.Observers
import Synthesis.InducedR1.Witness
import Synthesis.Induced.VersionSpace
import Synthesis.InducedR1.Abstraction
import Synthesis.InducedR1.Coverage (functionObservers)
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

data InducedMode = InducedTSLFull | NoWitness | NoVersionSpaceSharing
  | NoTaskAbstraction | NoEffectPropagation | NoFVDependency
  | Full | NoOnlineAbstraction | PostHocOnly | NoAntiUnification | NoLambdaLifting | NoNewWitnessCoverage
  deriving (Eq,Ord,Show,Read,Enum,Bounded)
data InducedConfig = InducedConfig
  { workBudget :: Int, depthBound :: Int, frontierBound :: Int
  , inducedCorrespondenceBudget :: Int, inducedEncoder :: EncoderConfig
  , abstractionLimits :: Limits
  } deriving (Eq,Show)
defaultInduced :: InducedConfig
defaultInduced=InducedConfig 250000 7 32 32 defaultEncoder defaultLimits
data InducedResult = InducedResult
  { inducedProgram :: Maybe Expr, inducedPortfolio :: [Expr], inducedSpace :: Space
  , inducedRoot :: NodeId, inducedSignature :: M.Map String [Support]
  , inducedInventions :: [Invention], inducedMetrics :: M.Map String Int
  , inducedSeconds :: Double, inducedTrace :: [String], inducedFailure :: String
  , inducedFailureEvidence :: String, inducedBounded :: Bool
  }
data Engine = Engine
  { config :: InducedConfig, mode :: InducedMode, spaceRef :: IORef Space
  , memoRef :: IORef (M.Map String NodeId), metricsRef :: IORef (M.Map String Int)
  , traceRef :: IORef [String], poolRef :: IORef (M.Map String [Observed])
  , inventionsRef :: IORef [Invention]
  , supportedBaseRef :: IORef (Maybe (S.Set String))
  }

metricNames :: [String]
metricNames=words "root_learning_tasks recursive_learning_tasks memoized_learning_tasks memo_queries memo_hits witness_calls lookahead_witness_calls successful_witness_decompositions failed_witness_decompositions version_space_nodes union_nodes join_nodes materialized_complete_asts materialized_child_asts structural_deduplications semantic_deduplications exact_verifier_calls propagation_steps branch_points expression_tests invented_abstractions induced_tsl_symbol_count base_symbols_activated base_symbols_rejected program_ast_length distinct_symbol_count first_solution_states total_expanded_work effect_pruned fv_bindings_eliminated witness_unavailable depth_cutoffs observer_terms bottom_up_terms structural_prior_count abstraction_rounds invention_expansion_tests invention_hits abstraction_discovery_work synthesis_work_after_discovery synthesis_work_before_discovery"

newEngine :: InducedMode -> InducedConfig -> IO Engine
newEngine runMode conf=Engine conf runMode <$> newIORef emptySpace <*> newIORef M.empty
    <*> newIORef (M.fromList [(n,0) | n<-metricNames]) <*> newIORef [] <*> newIORef M.empty <*> newIORef [] <*> newIORef Nothing

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
witnessFor :: Engine -> Primitive -> LearningTask -> [Observed] -> [Decomposition]
witnessFor engine p q os
  | any isOrder (specification q) = if mode engine==NoNewWitnessCoverage then [] else witness (inducedCorrespondenceBudget (config engine)) p q os
  | mode engine/=NoNewWitnessCoverage=witness (inducedCorrespondenceBudget (config engine)) p q os
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
exhausted engine=(>=workBudget (config engine)) . M.findWithDefault 0 "total_expanded_work" <$> readIORef (metricsRef engine)
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
  let key=show (M.toAscList (environment q))++show [(M.toAscList env) | (env,_)<-points q]
  cache<-readIORef (poolRef engine)
  case M.lookup key cache of
    Just os->pure os
    Nothing->do
      let sampleRows=case points q of
            []->[(env,x) | FunctionPoint env x _<-specification q]
            rs->rs
          observedQ=case sampleRows of (_,x):_->pointTask (valueType x) sampleRows; _->q
          os=observations observedQ
      _<-evaluate (length os)
      bump engine "observer_terms" (length os)
      modifyIORef' (poolRef engine) (M.insert key os)
      pure os

matchObservation :: Engine -> LearningTask -> Observed -> IO Bool
matchObservation engine q o=do
  let rows=zip (points q) (observedValues o)
      fv=freeVars (observedExpr o)
      key ((env,_),_)=show [(n,valueKey v) | (n,v)<-M.toAscList env,S.member n fv]
      -- Dependency projection is valid only if the projected row has a single
      -- required output; conflicting labels must not be silently coalesced.
      grouped=M.fromListWith (++) [(key r,[r]) | r<-rows]
      selected=if mode engine==NoFVDependency then rows else concatMap pick (M.elems grouped)
      pick rs=if S.size (S.fromList [valueKey y | ((_,y),_)<-rs])==1 then take 1 rs else rs
  bump engine "expression_tests" (length selected)
  bump engine "fv_bindings_eliminated" (length rows-length selected)
  work engine (length selected)
  pure (all (\((_,y),v)->equivalent v y) selected)

learn :: Engine -> Int -> LearningTask -> IO NodeId
learn engine remaining q=do
  stop<-exhausted engine
  invs<-readIORef (inventionsRef engine)
  if stop || remaining<0 then pure 0 else if null invs || not (onlineEnabled (mode engine)) then learnBase engine remaining q else do
    pool<-poolFor engine q
    allowed<-readIORef (supportedBaseRef engine)
    ids<-useInventions engine q [o | o<-pool,maybe True (symbols (observedExpr o) `S.isSubsetOf`) allowed]
    case ids of
      []->learnBase engine remaining q
      [i]->pure i
      _->node engine ("macro-union:"++show ids) (Union ids) (Support (summary q) "nonempty definition-expanded task inventions")

learnBase :: Engine -> Int -> LearningTask -> IO NodeId
learnBase engine remaining q=do
  bump engine "recursive_learning_tasks" 1
  bump engine "memo_queries" 1
  work engine 1
  memo<-readIORef (memoRef engine)
  invs<-readIORef (inventionsRef engine)
  active<-readIORef (supportedBaseRef engine)
  let key=show (length invs,remaining,fmap S.toAscList active)++":"++canonical q
  case if mode engine==NoVersionSpaceSharing then Nothing else M.lookup key memo of
    Just i->bump engine "memo_hits" 1 >> pure i
    Nothing->do
      stop<-exhausted engine
      if stop || remaining<0 || null (specification q) then do
        when (remaining<0) (bump engine "depth_cutoffs" 1)
        pure 0
      else do
        observedPool<-poolFor engine q
        allowed<-readIORef (supportedBaseRef engine)
        rules<-rulesFor engine
        let shared=case map snd (points q) of
              y:ys | targetType q `elem` [BoolT,IntT,ColorT,CoordT,VecT,SizeT,AnchorT,D4T] && all (equivalent y) ys -> [Observed (literal y) (y:ys)]
              _->[]
            pool=dedup 96 [o | o<-observedPool++shared,maybe True (symbols (observedExpr o) `S.isSubsetOf`) allowed]
        let orderSamples=[(env,x) | FunctionOrder env x _ _<-specification q]++[(env,y) | FunctionOrder env _ y _<-specification q]
            keyCandidates=case targetType q of
              ArrowT a IntT | not (null orderSamples)->[f | f<-functionObservers a IntT orderSamples
                 ,maybe True (symbols f `S.isSubsetOf`) allowed,matches q f]
              _->[]
        keyIds<-forM keyCandidates $ \e->do
          work engine (length (specification q))
          node engine ("key:"++show e) (Leaf e) (Support (summary q) "relational key specification checked by Base evaluation")
        observedIds<-forM [o | o<-pool,exprType (observedExpr o)==targetType q] $ \o->do
          yes<-matchObservation engine q o
          if not yes then pure 0 else node engine ("leaf:"++show (observedExpr o)) (Leaf (observedExpr o))
            (Support (summary q) ("exact forward-observation witness; "++exprText (observedExpr o)++"; FV="++show (S.toList (freeVars (observedExpr o)))))
        let leafIds=keyIds++observedIds
            compatible=[p | p<-rules,not (null (instances (primitiveName p) (targetType q)))]
            -- A witnessed forward observation closes this subproblem. This
            -- finite terminal policy avoids infinitely many identities (e.g.
            -- Translate(x,0)); it is a search restriction, not a proof that
            -- all longer programs are dominated or unsupported.
            forwardGround=any (/=0) leafIds
        note engine ("Learn("++summary q++"); return-compatible="++show (map primitiveName compatible))
        decompositions<-forM compatible $ \p->do
          work engine 1
          bump engine "propagation_steps" 1
          if mode engine/=NoEffectPropagation && effectContradiction p q pool then do
            bump engine "effect_pruned" 1
            note engine ("Effect propagation rejects "++primitiveName p++" under conditional observed-input domain")
            pure []
          else if forwardGround || remaining==0 then pure []
          else do
            bump engine "witness_calls" 1
            let ds=nubBy (\a b->map canonical (decompositionChildren a)==map canonical (decompositionChildren b)) (witnessFor engine p q pool)
            when (null ds) (bump engine "witness_unavailable" 1)
            pure [(p,d) | d<-ds]
        let branches=concat decompositions
        when (length branches>1) (bump engine "branch_points" 1)
        -- MRV: solve the most constrained child first. Operator traversal is
        -- driven solely by return types/witness results, never task classes.
        joinIds<-forM branches $ \(p,d)->do
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
                  pure (length (witnessFor engine op c childPool))
              let witnessCount=sum witnessSizes
              -- MRV uses the surviving immediate forward/witness domain.
              -- This lookahead supplies an estimate, not the cardinality of
              -- an unconstructed recursive version space.
              pure (forwardCount+scalarShared+witnessCount,idx,c)
            let ordered=[(idx,c) | (_,idx,c)<-sortOn (\(size,idx,_)->(size,idx)) domains]
            note engine ("MRV immediate domains="++show [(idx,size) | (size,idx,_)<-domains])
            solved<-solveChildren [] ordered
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
        let ids=S.toList (S.fromList (filter (/=0) (leafIds++joinIds)))
        i<-case ids of
          []->pure 0
          [x]->pure x
          _->node engine ("union:"++show ids) (Union ids) (Support (summary q) "union of nonempty correlated alternatives")
        when (mode engine/=NoVersionSpaceSharing) (modifyIORef' (memoRef engine) (M.insert key i))
        pure i
  where
    solveChildren acc []=pure acc
    solveChildren acc ((idx,c):cs)=do
      i<-learn engine (remaining-1) c
      if i==0 then pure ((idx,0):acc) else solveChildren ((idx,i):acc) cs

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
  let (candidates,astWork)=materialize (frontierBound conf) s root
  bump engine "materialized_child_asts" astWork
  when (runMode/=NoVersionSpaceSharing) (bump engine "materialized_complete_asts" (length candidates))
  valid<-fmap concat $ forM candidates $ \p->do
    bump engine "exact_verifier_calls" 1
    let ok=typeCheck M.empty p==Right (ArrowT SceneT SceneT) &&
           all (\(x,y)->predictInduced conf p x==Right y) pairs
    _<-evaluate ok
    note engine ("Exact original Render(P(Encode(x)))=y: "++show ok++"; MDL rank="++show (rank p))
    pure [p | ok]
  let chosen=case sortOn rank valid of p:_->Just p; _->Nothing
      sig=signature s root
  inventions<-readIORef (inventionsRef engine)
  memo<-readIORef (memoRef engine)
  bump engine "memoized_learning_tasks" (M.size memo)
  bump engine "version_space_nodes" (M.size (nodes s))
  bump engine "union_nodes" (length [() | Union _<-M.elems (nodes s)])
  bump engine "join_nodes" (length [() | Join _ _ _<-M.elems (nodes s)])
  bump engine "structural_deduplications" (structuralDuplicates s)
  bump engine "base_symbols_activated" (M.size sig)
  bump engine "base_symbols_rejected" (length base-M.size (M.filterWithKey (\n _->n `elem` map primitiveName base) sig))
  bump engine "invented_abstractions" (length inventions)
  bump engine "induced_tsl_symbol_count" (M.size sig+length inventions)
  case chosen of
    Nothing->pure ()
    Just p->do
      bump engine "program_ast_length" (exprLength p)
      bump engine "distinct_symbol_count" (S.size (symbols p))
      counters<-readIORef (metricsRef engine)
      bump engine "first_solution_states" (M.findWithDefault 0 "total_expanded_work" counters)
      note engine ("Selected AST; FV="++show (S.toList (freeVars p))++"; "++exprText p)
  bounded<-exhausted engine
  _<-forM inventions $ \i->note engine ("TaskInvented "++inventionName i++": "++exprText (inventionBody i)++"; repeats="++show (inventionOccurrences i)++"; portfolio MDL saving="++show (inventionSaving i))
  note engine ("Induced TSL=Signature(root VS) union inventions. BaseActivated="++show (M.keys sig)++"; TaskInvented="++show (map inventionName inventions)++"; StructuralPriorCount=0")
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
          | any truncated graphs->"SearchFailure"
          | missingGrounding&&missingConstructor->"BaseExpressibilityUnknown"
          | missingGrounding->"SpecificationRepresentationMissing"
          | otherwise->"WitnessMissing"
      evidence=case encodingError of
        Just err->err
        _ | bounded->"finite expanded-work budget reached; no impossibility claim"
          | runMode==NoWitness&&chosen==Nothing->"finite bottom-up type beams/depth exhausted without an exact program; no impossibility claim"
          | chosen==Nothing&&missingGrounding&&missingConstructor->"canonical correspondence absent; intrinsic output outside source D4 closure. Expressible(Base) is UNKNOWN: cloning/tiling programs are not disproved. Reachable(Base,Spec,Witness) failed in the bounded grounded domain. No Base impossibility certificate."
          | chosen==Nothing&&missingGrounding->"no canonical object correspondence in the bounded visibility/D4/color domain; residual specification representation is missing"
          | chosen==Nothing->"no supported complete program under partial witnesses, finite observation domains, depth and frontier bounds; witness-coverage diagnosis within these bounds, not a claim Base cannot express the task"
          | otherwise->"training exact; heldout is assessed only after MDL selection"
  _<-evaluate (length failure+length evidence)
  finished<-getMonotonicTimeNSec
  pure (InducedResult chosen valid s root sig inventions counters (fromIntegral (finished-started)/1e9) trace failure evidence bounded)

onlineEnabled :: InducedMode -> Bool
onlineEnabled m=m `notElem` [NoOnlineAbstraction,PostHocOnly,NoTaskAbstraction,NoWitness]

-- Finite loop. The first pass bootstraps support over the fixed Base; subsequent
-- passes use supported Base symbols plus definitions. This restriction is
-- task-local reachability, never a proof about Base expressibility.
-- Dictionaries are engine-local and never survive inducedSearch calls.
learnLoop :: Engine -> LearningTask -> IO NodeId
learnLoop engine q=go 0
  where
    go roundNo=do
      before<-M.findWithDefault 0 "total_expanded_work" <$> readIORef (metricsRef engine)
      root<-learn engine (depthBound (config engine)) q
      s<-readIORef (spaceRef engine)
      activateSupportedBase engine s root
      let (frontier,extraction)=materialize (frontierBound (config engine)) s root
          valid=filter (matches q) frontier
      bump engine "materialized_child_asts" extraction
      after<-M.findWithDefault 0 "total_expanded_work" <$> readIORef (metricsRef engine)
      bump engine (if roundNo==0 then "synthesis_work_before_discovery" else "synthesis_work_after_discovery") (after-before)
      if mode engine `elem` [NoOnlineAbstraction,NoTaskAbstraction,NoWitness] || roundNo>=maxRounds (abstractionLimits (config engine)) then pure root else do
        old<-readIORef (inventionsRef engine)
        let (accepted,discoveryUnits)=discoverOnlineCounted (mode engine/=NoAntiUnification) (mode engine/=NoLambdaLifting)
                       (abstractionLimits (config engine)) old valid
        bump engine "abstraction_discovery_work" discoveryUnits
        work engine discoveryUnits
        bump engine "abstraction_rounds" 1
        note engine ("Abstraction round="++show roundNo++"; exact frontier="++show (length valid)++"; accepted="++show (map inventionName accepted))
        writeIORef (inventionsRef engine) (old++accepted)
        stop<-exhausted engine
        if null accepted || not (onlineEnabled (mode engine)) || stop then pure root else do
          -- Cached support was learned under an older TSL; relearn with new
          -- definitions. Reusing those results would hide feedback cost.
          writeIORef (memoRef engine) M.empty
          go (roundNo+1)

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
    let valid=filter (matches q) (fst (materialize (frontierBound conf) s root))
    after<-M.findWithDefault 0 "total_expanded_work" <$> readIORef (metricsRef engine)
    bump engine (if idx==0 then "synthesis_work_before_discovery" else "synthesis_work_after_discovery") (after-before)
    if idx>=maxRounds (abstractionLimits conf) || runMode `elem` [NoOnlineAbstraction,NoTaskAbstraction] then pure valid else do
      old<-readIORef (inventionsRef engine)
      let (accepted,units)=discoverOnlineCounted (runMode/=NoAntiUnification) (runMode/=NoLambdaLifting) (abstractionLimits conf) old valid
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
