-- LATIS v0.4 parallel candidate evaluation for the source closure.
--
-- The pure `Synthesis.Triggered.sourceClosure` remains the behavioural
-- reference. This module re-expresses its control flow as a single
-- authoritative scheduler thread plus a bounded pool of workers that only
-- evaluate candidate terms across all training cases. Workers never see the
-- graph; the scheduler recomputes every candidate's validity, trigger,
-- definition cost, budget and freeze status from the committed graph before
-- using a result, so completion order cannot change feature IDs, matches,
-- metrics, programs or fallback decisions.
module Synthesis.Triggered.Parallel
  ( Parallel(..), serialParallel, defaultParallel, validateParallel
  , Hooks(..), noHooks
  , sourceClosureIO, sourceClosureWith
  , frontSearchIO, frontSearchWith, solveWith
  , parallelPrefix, stripPhysical, forceCases
  ) where

import Synthesis.Triggered
import Language.Induced.Base (Type(..),Value(..))
import Latent.Grid (Grid)
import qualified Latent.Object as O
import qualified Data.Map.Strict as M
import qualified Data.Set as S
import qualified Data.Sequence as Seq
import Data.Sequence (Seq,(|>),ViewL(..),viewl)
import Data.Foldable (toList)
import Control.Concurrent (forkIO,killThread,ThreadId)
import Control.Concurrent.MVar
import Control.Concurrent.STM
import Control.Exception
import Control.Monad (foldM,forM_)
import Data.IORef
import GHC.Clock (getMonotonicTimeNSec)

-- | Physical execution settings for one task's source closure. Nothing in
-- the logical search (candidate order, charged work, feature IDs, matches,
-- selected program, fallback) depends on these values.
data Parallel = Parallel
  { workers :: Int        -- ^ worker threads evaluating candidate terms; 1 runs the pure serial reference
  , window :: Int         -- ^ lookahead bound: speculative candidates submitted but not yet consumed or discarded
  , speculationCap :: Int -- ^ hard bound on discarded speculative submissions per task; afterwards evaluation is inline
  } deriving (Eq,Show)

serialParallel :: Parallel
serialParallel=Parallel 1 0 0
defaultParallel :: Int -> Parallel
defaultParallel n=Parallel n (4*max 1 n) 256
validateParallel :: Parallel -> Either String Parallel
validateParallel p
  | workers p<1=Left "workers must be a positive integer"
  | workers p>1 && window p<1=Left "window must be positive when workers>1"
  | speculationCap p<0=Left "speculation cap must be non-negative"
  | otherwise=Right p

-- | Test instrumentation. Hooks run inside worker threads; the default is inert.
data Hooks = Hooks
  { onWorkers :: [ThreadId] -> IO ()
  , onSubmit :: Int -> Term -> IO ()        -- ^ scheduler side, right after enqueuing a speculation
  , beforeEvaluate :: Int -> Term -> IO ()  -- ^ worker side: global submission number, candidate term
  , afterEvaluate :: Int -> Term -> IO () }
noHooks :: Hooks
noHooks=Hooks (const (pure ())) (\_ _->pure ()) (\_ _->pure ()) (\_ _->pure ())

-- | Counter prefix of every physical (non-logical) execution metric.
parallelPrefix :: String
parallelPrefix="parallel_"
-- | Removes the physical execution counters; the remainder must equal the
-- serial reference graph exactly.
stripPhysical :: Graph -> Graph
stripPhysical g=g {counters=M.filterWithKey (\k _->take (length parallelPrefix) k/=parallelPrefix) (counters g)}

-- | Forces a cross-case evaluation result completely inside the worker so the
-- scheduler never finishes a worker's computation through a leftover thunk.
-- Object and Coord are field-strict with spine-strict maps, so WHNF suffices;
-- any other value is forced through its Show instance.
forceCases :: Either String [Value] -> Either String [Value]
forceCases r=case r of
  Left s->length s `seq` r
  Right vs->foldr (\v acc->forceValue v `seq` acc) () vs `seq` r
  where
    forceValue v=case v of
      ObjectV o->o `seq` ()
      CoordV c->c `seq` ()
      IntV n->n `seq` ()
      ColorV n->n `seq` ()
      BoolV b->b `seq` ()
      _->length (show v) `seq` ()

data Outcome = Evaluated (Either String [Value]) | Skipped | Crashed SomeException
data Request = Request { reqIndex :: !Int, reqSerial :: !Int, reqSource :: !Int, reqTerm :: Term
  , reqCancelled :: IORef Bool, reqOutcome :: MVar Outcome }
data Planned = Planned { plannedIndex :: !Int, plannedKey :: (Int,String), plannedTerm :: Term }

-- Worker loop: pure evaluation only. A cancelled request is skipped; a
-- synchronous exception is reported through the request so the scheduler
-- rethrows it; asynchronous exceptions (killThread) terminate the worker.
worker :: Hooks -> (Term -> Either String [Value]) -> TBQueue Request -> IO ()
worker hooks evalCases queue=loop
  where
    loop=do
      req<-atomically (readTBQueue queue)
      cancelled<-readIORef (reqCancelled req)
      outcome<-if cancelled then pure Skipped else
        (do beforeEvaluate hooks (reqSerial req) (reqTerm req)
            r<-evaluate (forceCases (evalCases (reqTerm req)))
            afterEvaluate hooks (reqSerial req) (reqTerm req)
            pure (Evaluated r))
        `catch` \e->case fromException e of
          Just (SomeAsyncException _)->throwIO e
          Nothing->pure (Crashed e)
      putMVar (reqOutcome req) outcome
      loop

withPool :: Hooks -> Int -> Int -> (Term -> Either String [Value]) -> (TBQueue Request -> IO a) -> IO a
withPool hooks n capacity evalCases body=do
  queue<-newTBQueueIO (fromIntegral (max 1 capacity))
  bracket (do tids<-mapM (const (forkIO (worker hooks evalCases queue))) [1..n]
              onWorkers hooks tids
              pure tids)
          (mapM_ killThread)
          (const (body queue))

data Sched = Sched
  { sGraph :: !Graph
  , sInflight :: !(Seq Request)         -- submitted, plan order, neither consumed nor discarded
  , sRemaining :: [Planned]             -- planned for this depth, not submitted
  , sIndex :: !(M.Map (Int,String) Int) -- (source feature, operator) -> plan position
  , sDropped :: [Request]               -- discarded submissions, resolved at the end
  , sDiscarded :: !Int
  , sSerial :: !Int }

setMax :: String -> Int -> Graph -> Graph
setMax k n g=g {counters=M.insertWith max k n (counters g)}

-- | Source closure with `workers<=1` routed to the pure serial reference.
sourceClosureIO :: Parallel -> Mode -> Config -> [O.Scene] -> Layout -> Graph -> IO Graph
sourceClosureIO par mode conf inputs layout start
  | workers par<=1=pure (sourceClosure mode conf inputs layout start)
  | otherwise=sourceClosureWith noHooks par mode conf inputs layout start

-- | The scheduler. Always uses the worker pool, even for one worker (tests).
sourceClosureWith :: Hooks -> Parallel -> Mode -> Config -> [O.Scene] -> Layout -> Graph -> IO Graph
sourceClosureWith hooks par mode conf inputs layout start=
  withPool hooks (max 1 (workers par)) (window par) evalCases $ \queue->do
    st<-loop queue 1 (Sched (settings start) Seq.empty [] M.empty [] 0 0)
    finalize st
  where
    defs=definitions start
    evalCases term=traverse (\s->evalTerm defs s layout M.empty term) inputs
    index=operatorIndex (M.elems defs)
    typeCounts=M.fromListWith (+) [(t,1::Int) | p<-M.elems defs,t<-take 1 (argTypes p)]
    expandFrozen=mode `elem` [NoMatchedFeaturePruning,DirectBaseExpansion]
    settings=inc "parallel_workers" (workers par) . inc "parallel_window" (window par)
      . inc "parallel_speculation_cap" (speculationCap par)

    -- Depth loop: identical guards and bookkeeping to the serial reference.
    loop queue depth st
      | depth>maxDepth conf || null (unmatched g) || metric "search_work" g>=sourceBudget conf=pure st
      | otherwise=do
        let frontier=[featureId f | f<-M.elems (features g),featureDepth f==depth-1,expandFrozen || status f==Unmatched]
            g0=inc ("frontier_depth_"++show depth) (length frontier) g
            plan=planDepth g0 frontier
        st1<-topUp queue st {sGraph=inc "parallel_planned" (length plan) g0,sRemaining=plan,sInflight=Seq.empty
                            ,sIndex=M.fromList [(plannedKey q,plannedIndex q) | q<-plan]}
        st2<-foldM (expandStep queue depth) st1 frontier
        st3<-dropAll st2
        let g1=sGraph st3
            g2=inc ("matched_features_by_depth_"++show depth) (length (matches g1)-length (matches g)) g1
        if M.size (features g2)==M.size (features g) then pure st3 {sGraph=g2} else loop queue (depth+1) st3 {sGraph=g2}
      where g=sGraph st

    -- Read-only plan from the snapshot at depth start. It authorises nothing:
    -- every entry is re-derived from the committed graph before use.
    planDepth g frontier=[Planned i (fid,opName p) term
      | (i,(fid,p,term))<-zip [0..] [(featureId f,p,term) | fid<-frontier,Just f<-[M.lookup fid (features g)]
                                    ,expandFrozen || status f/=Frozen
                                    ,(_,p)<-jobsFor g f,Just term<-[candidateTerm g f p]]]
    jobsFor g f=M.elems (M.fromListWith (\a _->a) [(opName p,(t,p)) | (t,ps)<-visible mode index g f,p<-ps])
    readonlyArgs g f p=case drop 1 (argTypes p) of
      []->Just []
      [ObjectT]->case [q | q<-M.elems (features g),featureDepth q==0,semanticRole q==semanticRole f,featureType q==ObjectT] of
        q:_->Just [q]; _->Nothing
      _->Nothing
    candidateTerm g f p=fmap (\ro->Invoke (opName p) (map expression (f:ro))) (readonlyArgs g f p)

    -- After a source's expansion ends, any speculation still planned for it
    -- is invalid by the serial rules (frozen source, explained targets, or
    -- budget) and is discarded before the next source is considered.
    expandStep queue depth st fid=(>>= dropSource fid) $ case M.lookup fid (features g) of
        Nothing->pure st
        Just f | status f==Frozen && not expandFrozen->pure st
        Just f->do
          let jobs=jobsFor g f
              typed=M.findWithDefault 0 (featureType f) typeCounts
              g0=inc "visible_opportunities" (length jobs) . inc "type_compatible_opportunities" typed
                 . inc "visibility_size" (length jobs) $ g
          foldM (applyStep queue depth f) st {sGraph=g0} jobs
      where g=sGraph st

    -- Commit of one candidate, in serial order, against the authoritative graph.
    applyStep queue depth f st (goal,p)
      | metric "search_work" g+applicationCost>sourceBudget conf=pure st
      | status (features g M.! featureId f)==Frozen && not expandFrozen=pure st
      | otherwise=case readonlyArgs g f p of
          Nothing->pure st
          Just readonly->do
            let args=f:readonly
                term=Invoke (opName p) (map expression args)
                reason=if mode `elem` [NoVisibility,DirectBaseExpansion] then FailureTrigger "ablation: explicitly widen visible type slice"
                       else if null readonly then NeedTransform (resultType p) else NeedRelation
                proof=Evidence reason goal (show (argTypes p)++" -> "++show (resultType p)) (show (opSlice p)) (show (map featureId args))
                argProofs=[Evidence (if i==0 then NeedExplain (featureType q) else NeedRef (featureType q)) goal
                            (show (featureType q)) (show (opSlice p)) ("read-only dependency "++show (featureId q)) | (i,q)<-zip [0::Int ..] args]
                          ++[Evidence (NeedRef ty) goal (show ty) (show (opSlice p)) ("Constant "++value)
                            | (ty,value)<-case action p of
                                Turn k->[(IntT,show k)]; Paint c->[(ColorT,show c)]
                                Step x y->[(IntT,show x),(IntT,show y)]; AnchorOffset a->[(IntT,show a)]; _->[]]
                used=S.member (opName p) (usedDefinitions g)
                g0=inc "operator_applications" 1 . inc "search_work" applicationCost
                  . inc "definition_build_work" buildCost
                  . inc "expanded_frozen_features" (if status f==Frozen then 1 else 0)
                  . inc (if used && mode/=NoTransformReuse then "transform_cache_hits" else "unique_transforms") 1 $
                    g {usedDefinitions=S.insert (opName p) (usedDefinitions g)}
            (result,st1)<-obtain st {sGraph=g0} (featureId f,opName p) term
            let g1=sGraph st1
                g2=case result of
                  Left _->inc "evaluation_failures" 1 g1
                  Right vs->let fresh=Feature 0 (resultType p) vs term (semanticRole f)
                                    (concatMap history args++[opName p]) (sum (map featureCost args)+1) Unmatched depth
                                (i,g')=insertFeature fresh g1
                                edge=Edge (map featureId args) i (opName p) proof argProofs
                            in inc ("generated_features_by_depth_"++show depth) (M.size (features g')-M.size (features g))
                                 (rematch g' {edges=edges g'++[edge]})
            topUp queue st1 {sGraph=g2}
      where
        g=sGraph st
        buildCost=if mode/=NoTransformReuse && S.member (opName p) (usedDefinitions g) then 0 else definitionCost p
        applicationCost=length inputs+buildCost

    -- Supplies the cross-case result for the candidate the scheduler is about
    -- to commit: a speculation whose term matches the authoritative term, or
    -- an inline evaluation. Everything planned before it is discarded.
    obtain st key term=case M.lookup key (sIndex st) of
      Nothing->inline st {sGraph=inc "parallel_unplanned_evaluations" 1 (sGraph st)}
      Just i->do
        st1<-dropBefore i st
        case viewl (sInflight st1) of
          r :< rest | reqIndex r==i->
            if reqTerm r/=term then discard "stale" r st1 {sInflight=rest} >>= inline
            else do
              o<-readMVar (reqOutcome r)
              case o of
                Evaluated v->pure (v,st1 {sInflight=rest,sGraph=inc "parallel_consumed" 1 (sGraph st1)})
                Crashed e->throwIO e
                Skipped->inline st1 {sInflight=rest}
          _->case sRemaining st1 of
            q:qs | plannedIndex q==i->inline st1 {sRemaining=qs}
            _->inline st1
      where
        inline st'=do
          v<-evaluate (forceCases (evalCases term))
          pure (v,st' {sGraph=inc "parallel_inline_evaluations" 1 (sGraph st')})

    dropBefore i st=do
      let (dead,live)=Seq.spanl ((<i) . reqIndex) (sInflight st)
          (deadPlan,livePlan)=span ((<i) . plannedIndex) (sRemaining st)
      st'<-foldM (\s r->discard "invalid" r s) st {sInflight=live,sRemaining=livePlan} (toList dead)
      pure st' {sGraph=inc "parallel_planned_skipped" (length deadPlan) (sGraph st')}
    dropSource fid st=do
      let (dead,live)=Seq.spanl ((==fid) . reqSource) (sInflight st)
          (deadPlan,livePlan)=span ((==fid) . fst . plannedKey) (sRemaining st)
      st'<-foldM (\s r->discard "invalid" r s) st {sInflight=live,sRemaining=livePlan} (toList dead)
      pure st' {sGraph=inc "parallel_planned_skipped" (length deadPlan) (sGraph st')}
    dropAll st=do
      st'<-foldM (\s r->discard "depth_end" r s) st (toList (sInflight st))
      pure st' {sInflight=Seq.empty,sRemaining=[],sIndex=M.empty
               ,sGraph=inc "parallel_planned_skipped" (length (sRemaining st)) (sGraph st')}
    discard why r st=do
      writeIORef (reqCancelled r) True
      pure st {sDropped=r:sDropped st,sDiscarded=sDiscarded st+1
              ,sGraph=inc "parallel_discarded" 1 (inc ("parallel_discarded_"++why) 1 (sGraph st))}

    -- Fills the lookahead window. Submission is allowed only while every
    -- in-flight entry could still be discarded without exceeding the cap, so
    -- `parallel_discarded <= speculationCap` holds unconditionally.
    topUp queue st=case sRemaining st of
      []->pure st
      q:qs
        | Seq.length (sInflight st)>=window par->pure st
        | sDiscarded st+Seq.length (sInflight st)>=speculationCap par->pure st {sGraph=inc "parallel_cap_refusals" 1 (sGraph st)}
        | otherwise->do
          c<-newIORef False; v<-newEmptyMVar
          let r=Request (plannedIndex q) (sSerial st) (fst (plannedKey q)) (plannedTerm q) c v
          atomically (writeTBQueue queue r)
          onSubmit hooks (sSerial st) (plannedTerm q)
          let inflight=sInflight st|>r
          topUp queue st {sRemaining=qs,sInflight=inflight,sSerial=sSerial st+1
                         ,sGraph=setMax "parallel_max_inflight" (Seq.length inflight) (inc "parallel_submitted" 1 (sGraph st))}

    -- Resolves every discarded submission so wasted work is counted exactly
    -- and a crash inside a discarded speculation still propagates.
    finalize st=do
      outcomes<-mapM (readMVar . reqOutcome) (reverse (sDropped st))
      forM_ [e | Crashed e<-outcomes] throwIO
      let evaluated=length [() | Evaluated _<-outcomes]
          cancelled=length [() | Skipped<-outcomes]
          g=sGraph st
          actual=metric "parallel_consumed" g+metric "parallel_inline_evaluations" g+evaluated
      pure (inc "parallel_discarded_evaluated" evaluated . inc "parallel_discarded_cancelled" cancelled
            . inc "parallel_actual_evaluations" actual $ g)

frontSearchWith :: Hooks -> Parallel -> Mode -> Config -> [(Grid,Grid)] -> IO (FrontResult,Double)
frontSearchWith hooks par mode conf pairs=case frontPrepare mode conf pairs of
  Left r->pure (r,0)
  Right p->do
    t0<-getMonotonicTimeNSec
    g<-sourceClosureWith hooks par mode conf (preparedInputs p) closureLayout (preparedGraph p)
    forceClosure g
    t1<-getMonotonicTimeNSec
    pure (frontFinish mode conf pairs p g,fromIntegral (t1-t0)/1e9)

-- | Front-end only (no R2), returning the closure wall-clock separately.
frontSearchIO :: Parallel -> Mode -> Config -> [(Grid,Grid)] -> IO (FrontResult,Double)
frontSearchIO par mode conf pairs
  | workers par<=1=case frontPrepare mode conf pairs of
      Left r->pure (r,0)
      Right p->do
        t0<-getMonotonicTimeNSec
        let g=sourceClosure mode conf (preparedInputs p) closureLayout (preparedGraph p)
        forceClosure g
        t1<-getMonotonicTimeNSec
        pure (frontFinish mode conf pairs p g,fromIntegral (t1-t0)/1e9)
  | otherwise=frontSearchWith noHooks par mode conf pairs

solveWith :: Parallel -> Mode -> Config -> [(Grid,Grid)] -> IO Result
solveWith par mode conf=solveClosure (sourceClosureIO par mode conf) mode conf
