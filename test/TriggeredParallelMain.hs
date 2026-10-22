-- Parallel source-closure tests. The pure `sourceClosure`/`frontSearch` is
-- the reference; every scheduler run must reproduce it exactly once the
-- physical `parallel_*` counters are stripped.
module Main where
import Synthesis.Triggered
import Synthesis.Triggered.Parallel
import ARC.TriggeredStress (stressTasks,grid,mkTask)
import ARC.Dataset
import Language.Induced.Base (Type(..))
import Latent.Grid (Grid)
import Latent.Encode (encode,defaultEncoder)
import qualified Synthesis.InducedR2.Learn as R2
import qualified Data.Map.Strict as M
import qualified Data.Set as S
import Control.Concurrent
import Control.Exception hiding (assert)
import Control.Monad
import Data.IORef
import Data.List (isSuffixOf)
import System.Timeout (timeout)
import GHC.Conc (threadStatus,ThreadStatus(..))

assert :: String -> Bool -> IO ()
assert s ok=unless ok (error ("FAIL "++s)) >> putStrLn ("PASS "++s)

modes :: [Mode]
modes=[m | m<-[minBound..maxBound],m/=R2FallbackOnly]
task :: String -> Task
task name=maybe (error ("unknown stress task "++name)) id (lookup name stressTasks)
pairsOf :: String -> [(Grid,Grid)]
pairsOf=training . task
configFor :: String -> Config
configFor name=defaultConfig {noiseOperators=if take 1 name=="D" then 200 else 0}

schedulers :: [Parallel]
schedulers=[Parallel 1 4 256,Parallel 2 8 256,Parallel 4 16 256]

sameFront :: FrontResult -> FrontResult -> Bool
sameFront a b=frontProgram a==frontProgram b && frontFailure a==frontFailure b
  && optimalWithinGraph a==optimalWithinGraph b && stripPhysical (graph a)==graph b

-- Physical counters must account for every submission exactly once.
accounted :: Parallel -> Graph -> Bool
accounted par g=and
  [m "parallel_submitted"==m "parallel_consumed"+m "parallel_discarded"
  ,m "parallel_discarded"==m "parallel_discarded_evaluated"+m "parallel_discarded_cancelled"
  ,m "parallel_actual_evaluations"==m "parallel_consumed"+m "parallel_inline_evaluations"+m "parallel_discarded_evaluated"
  ,m "parallel_consumed"+m "parallel_inline_evaluations"==m "operator_applications"
  ,m "parallel_discarded"<=speculationCap par
  ,m "parallel_max_inflight"<=window par
  ,m "parallel_stale"==0 && m "parallel_discarded_stale"==0 && m "parallel_unplanned_evaluations"==0]
  where m k=metric k g

runPar :: Parallel -> Mode -> Config -> [(Grid,Grid)] -> IO FrontResult
runPar par mode conf ps=fst <$> frontSearchWith noHooks par mode conf ps

checkAgainstSerial :: String -> Mode -> Config -> [(Grid,Grid)] -> IO ()
checkAgainstSerial label mode conf ps=do
  let ref=frontSearch mode conf ps
  forM_ schedulers $ \par->do
    f<-runPar par mode conf ps
    unless (sameFront f ref) (error ("FAIL "++label++" "++show mode++" workers="++show (workers par)++": differs from serial reference"))
    unless (accounted par (graph f)) (error ("FAIL "++label++" "++show mode++" workers="++show (workers par)++": physical accounting "++show (M.filterWithKey (\k _->take 9 k=="parallel_") (counters (graph f)))))
  putStrLn ("PASS "++label++" "++show mode++" serial == scheduler(1,2,4)")

waitDead :: [ThreadId] -> IO Bool
waitDead tids=go (200::Int)
  where go 0=pure False
        go n=do
          ss<-mapM threadStatus tids
          if all (`elem` [ThreadFinished,ThreadDied]) ss then pure True else threadDelay 10000 >> go (n-1)

main :: IO ()
main=do
  -- 1/2/5. Every stress task x every front-end mode: success, failure and
  -- fallback cases, aliases, dedup, matches, evidence, IDs, logical work.
  forM_ stressTasks $ \(name,t)->forM_ modes $ \mode->checkAgainstSerial name mode (configFor name) (training t)
  -- CLI default path: workers=1 bypasses the scheduler entirely.
  (f1,_)<-frontSearchIO (defaultParallel 1) Full defaultConfig (pairsOf "C-depth-three")
  assert "workers=1 is the pure serial reference" (f1==frontSearch Full defaultConfig (pairsOf "C-depth-three"))
  assert "validateParallel rejects bad settings" (all (either (const True) (const False) . validateParallel)
    [Parallel 0 4 1,Parallel 2 0 1,Parallel 2 4 (-1)] && either (const False) (const True) (validateParallel (defaultParallel 4)))

  -- 6. Budget boundaries, including zero and less than one cross-case evaluation.
  let boundaries name mode budgets=forM_ budgets $ \b->do
        let conf=(configFor name) {sourceBudget=b}
            ref=frontSearch mode conf (pairsOf name)
        forM_ schedulers $ \par->do
          f<-runPar par mode conf (pairsOf name)
          unless (sameFront f ref && accounted par (graph f)) (error ("FAIL budget "++name++" "++show mode++" budget="++show b++" workers="++show (workers par)))
          when (metric "source_search_work" (graph f)>b) (error ("FAIL over-committed budget "++show b))
        putStrLn ("PASS budget boundary "++name++" "++show mode++" budget="++show b++" work="++show (metric "search_work" (graph ref)))
  boundaries "C-depth-three" Full [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,20,50,100,500,1000,3677,3678,3679]
  boundaries "A-match-pruning" NoMatchedFeaturePruning [0,1,2,5,6,7,61,62,100,4712,4713,4714]
  boundaries "F-intensional-ref" Full [0,1,2,6,7,8,9,100,9950,9951,9952]
  let tiny=frontSearch Full (defaultConfig {sourceBudget=1}) (pairsOf "C-depth-three")
  assert "budget below one cross-case evaluation commits nothing" (metric "source_search_work" (graph tiny)==0 && metric "operator_applications" (graph tiny)==0)
  tinyPar<-runPar (Parallel 4 16 256) Full (defaultConfig {sourceBudget=1}) (pairsOf "C-depth-three")
  assert "speculation under an exhausted budget is discarded, not committed"
    (metric "source_search_work" (graph tinyPar)==0 && metric "parallel_consumed" (graph tinyPar)==0 && metric "parallel_discarded" (graph tinyPar)==metric "parallel_submitted" (graph tinyPar))

  -- 3. A committed candidate changes what later candidates are allowed to do:
  -- role 7's expansion explains role 8's target, so role 8's planned
  -- speculations are invalid at commit time and must be discarded. (The
  -- freeze guard itself is re-read from the authoritative graph on every
  -- commit; a source cannot become frozen by its own expansion because
  -- goals are fixed, so that guard is covered by the mode equalities above.)
  -- Roles 6 and 7 shift left (role 6's expansion explains both position
  -- targets, so role 7's position source has no jobs); role 8 is recoloured,
  -- so its Object source still expands afterwards.
  let mixed k=let ps=[(2*c,2+k,c) | c<-[1..8]] in (grid 24 10 ps,grid 24 10 [(x-if c==6||c==7 then 1 else 0,y,if c==8 then 9 else c) | (x,y,c)<-ps])
      left=training (mkTask "L" [mixed 0,mixed 1] (mixed 2))
      leftRef=frontSearch Full defaultConfig left
  assert "invalidation fixture: serial skips the explained source and continues" (metric "frontier_depth_1" (graph leftRef)==3 && metric "operator_applications" (graph leftRef)==25 && frontFailure leftRef=="None")
  forM_ [Parallel 2 8 256,Parallel 4 16 256] $ \par->do
    leftPar<-runPar par Full defaultConfig left
    assert ("speculations invalidated by an earlier commit are discarded (workers="++show (workers par)++")")
      (sameFront leftPar leftRef && metric "parallel_discarded_invalid" (graph leftPar)>=1 && metric "parallel_consumed" (graph leftPar)+metric "parallel_inline_evaluations" (graph leftPar)==25
       && metric "parallel_discarded_depth_end" (graph leftPar)==0)
  leftUnpruned<-runPar (Parallel 2 8 256) NoMatchedFeaturePruning defaultConfig left
  assert "ablation without pruning keeps the same candidates as serial" (sameFront leftUnpruned (frontSearch NoMatchedFeaturePruning defaultConfig left))

  -- 4. First-definition cost is charged once per operator in commit order.
  forM_ [Parallel 2 8 256,Parallel 4 16 256] $ \par->do
    b<-runPar par Full defaultConfig (pairsOf "B-transform-reuse")
    let g=graph b
        used=S.toList (usedDefinitions g)
    assert ("definition build cost charged once per operator (workers="++show (workers par)++")")
      (metric "unique_transforms" g==length used && metric "definition_build_work" g==sum [definitionCost (definitions g M.! n) | n<-used]
       && metric "transform_cache_hits" g+metric "unique_transforms" g==metric "operator_applications" g && metric "transform_cache_hits" g>0)
    nr<-runPar par NoTransformReuse defaultConfig (pairsOf "B-transform-reuse")
    assert ("NoTransformReuse charges every application (workers="++show (workers par)++")")
      (metric "transform_cache_hits" (graph nr)==0 && sameFront nr (frontSearch NoTransformReuse defaultConfig (pairsOf "B-transform-reuse")))

  -- 5. Real evaluation failures are charged, counted and never become features.
  let enc=defaultEncoder
      ins=map (encode enc . fst) (pairsOf "B-transform-reuse"); outs=map (encode enc . snd) (pairsOf "B-transform-reuse")
      broken=Operator "Broken" [CoordT] CoordT Displacement (Turn 1) 3 0 []
      g0=either error id (initial ins outs (operators 0++[broken]))
      conf5=defaultConfig {sourceBudget=2000}
      refBroken=sourceClosure NoMatchedFeaturePruning conf5 ins closureLayout g0
  assert "broken operator produces evaluation failures" (metric "evaluation_failures" refBroken>0 && all ((/="Broken") . edgeProgram) (edges refBroken))
  forM_ schedulers $ \par->do
    gb<-sourceClosureWith noHooks par NoMatchedFeaturePruning conf5 ins closureLayout g0
    assert ("evaluation failures identical under workers="++show (workers par)) (stripPhysical gb==refBroken && accounted par gb)

  -- 7. Worker exceptions propagate, threads are cleaned up, no deadlock.
  tids<-newIORef []
  let boom=noHooks {onWorkers=writeIORef tids,beforeEvaluate= \n _->when (n==3) (throwIO (ErrorCall "boom"))}
  r<-timeout 60000000 (try (frontSearchWith boom (Parallel 2 8 256) Full defaultConfig (pairsOf "F-intensional-ref")))
  assert "worker exception propagates to the caller" (case r of Just (Left (ErrorCall "boom"))->True; _->False)
  dead<-readIORef tids >>= waitDead
  assert "worker threads are terminated after the exception" dead
  -- An exception inside a speculation that is later discarded must not be swallowed.
  started<-newEmptyMVar
  tids2<-newIORef []
  let lateBoom=noHooks {onWorkers=writeIORef tids2
        ,onSubmit= \n _->when (n==0) (takeMVar started)
        ,beforeEvaluate= \n _->when (n==0) (putMVar started () >> throwIO (ErrorCall "late"))}
  r2<-timeout 60000000 (try (frontSearchWith lateBoom (Parallel 2 8 256) Full (defaultConfig {sourceBudget=1}) (pairsOf "F-intensional-ref")))
  assert "exception in a discarded speculation still propagates" (case r2 of Just (Left (ErrorCall "late"))->True; _->False)
  dead2<-readIORef tids2 >>= waitDead
  assert "worker threads are terminated after a late exception" dead2

  -- 8. Pool, window and speculation-cap bounds.
  active<-newIORef (0::Int); peak<-newIORef (0::Int); seen<-newIORef S.empty
  let observe=noHooks
        {beforeEvaluate= \_ _->do
            tid<-myThreadId
            atomicModifyIORef' seen (\s->(S.insert (show tid) s,()))
            a<-atomicModifyIORef' active (\a->(a+1,a+1))
            atomicModifyIORef' peak (\p->(max p a,()))
        ,afterEvaluate= \_ _->atomicModifyIORef' active (\a->(a-1,()))}
      refF=frontSearch Full defaultConfig (pairsOf "F-intensional-ref")
  (fo,_)<-frontSearchWith observe (Parallel 4 16 256) Full defaultConfig (pairsOf "F-intensional-ref")
  threads<-readIORef seen; p<-readIORef peak
  assert "at most `workers` threads evaluate" (S.size threads<=4 && p<=4 && sameFront fo refF)
  assert "pending speculation never exceeds the window" (metric "parallel_max_inflight" (graph fo)<=16)
  (fw,_)<-frontSearchWith noHooks (Parallel 4 2 256) Full defaultConfig (pairsOf "F-intensional-ref")
  assert "a window of two bounds in-flight speculation to two" (metric "parallel_max_inflight" (graph fw)<=2 && sameFront fw refF)
  (fc0,_)<-frontSearchWith noHooks (Parallel 4 16 0) Full defaultConfig (pairsOf "F-intensional-ref")
  assert "speculation cap zero disables speculation and keeps the result"
    (metric "parallel_submitted" (graph fc0)==0 && metric "parallel_inline_evaluations" (graph fc0)==metric "operator_applications" refFGraph && sameFront fc0 refF)
  (fc3,_)<-frontSearchWith noHooks (Parallel 4 16 3) Full defaultConfig (pairsOf "F-intensional-ref")
  assert "speculation cap bounds discarded work on a budget-limited task"
    (metric "parallel_discarded" (graph fc3)<=3 && metric "parallel_cap_refusals" (graph fc3)>0 && sameFront fc3 refF)
  (lc3,_)<-frontSearchWith noHooks (Parallel 4 16 3) Full defaultConfig left
  assert "exhausted speculation cap degrades to inline evaluation with the serial result"
    (metric "parallel_discarded" (graph lc3)<=3 && metric "parallel_cap_refusals" (graph lc3)>0 && metric "parallel_inline_evaluations" (graph lc3)>0
     && metric "parallel_consumed" (graph lc3)>0 && sameFront lc3 leftRef)

  -- 9. Controlled completion-order disturbance: the first speculation cannot
  -- finish before the second has completed, so two evaluations overlap.
  gate<-newEmptyMVar
  active2<-newIORef (0::Int); peak2<-newIORef (0::Int)
  let disturb=noHooks
        {beforeEvaluate= \n _->do
            a<-atomicModifyIORef' active2 (\a->(a+1,a+1))
            atomicModifyIORef' peak2 (\q->(max q a,()))
            when (n==0) (takeMVar gate)
        ,afterEvaluate= \n _->do
            atomicModifyIORef' active2 (\a->(a-1,()))
            when (n==1) (putMVar gate ())}
  rd<-timeout 60000000 (frontSearchWith disturb (Parallel 2 4 256) Full defaultConfig (pairsOf "F-intensional-ref"))
  p2<-readIORef peak2
  assert "out-of-order completion still yields the serial result" (maybe False (\(fd,_)->sameFront fd refF) rd)
  assert "two candidate evaluations actually overlapped" (p2>=2)
  -- Scheduling noise through yields (no sleeps) across repeated runs.
  let noisy=noHooks {beforeEvaluate= \n _->replicateM_ (n `mod` 7) yield,afterEvaluate= \n _->replicateM_ (n `mod` 3) yield}
  noisyRuns<-forM [1..5::Int] $ \_->fst <$> frontSearchWith noisy (Parallel 4 16 256) Full defaultConfig (pairsOf "C-depth-three")
  assert "repeated noisy runs are identical to serial" (all (`sameFront` frontSearch Full defaultConfig (pairsOf "C-depth-three")) noisyRuns)

  -- Whole solve including the unchanged R2 fallback.
  sPar<-solveWith (Parallel 2 8 256) Full defaultConfig (pairsOf "G-invalid-abstraction")
  sRef<-solve Full defaultConfig (pairsOf "G-invalid-abstraction")
  assert "solveWith reproduces the fallback decision and R2 outcome"
    (fallbackReason sPar==fallbackReason sRef && sameFront (front sPar) (front sRef)
     && fmap R2.inducedFailure (fallback sPar)==fmap R2.inducedFailure (fallback sRef)
     && fmap logical (fallback sPar)==fmap logical (fallback sRef))
  putStrLn "triggered-parallel-tests complete"
  where refFGraph=graph (frontSearch Full defaultConfig (pairsOf "F-intensional-ref"))
        -- R2 records wall-clock milliseconds in its counters; everything else is logical.
        logical r=M.filterWithKey (\k _->not ("milliseconds" `isSuffixOf` k)) (R2.inducedMetrics r)
