module Main where
import ARC.Dataset
import ARC.Evaluate
import ARC.JointEvaluate
import ARC.HierarchicalEvaluate
import ARC.LatentStress
import ARC.InducedEvaluate
import Synthesis.Induced.Learn
import qualified Synthesis.InducedR1.Learn as R1
import qualified Synthesis.InducedR1.Abstraction as R1
import qualified ARC.InducedR1Evaluate as R1
import qualified Synthesis.InducedR2.Learn as R2
import qualified ARC.InducedR2Evaluate as R2
import qualified Synthesis.FeaturePipeline as FP
import qualified Synthesis.Triggered as V4
import qualified ARC.TriggeredEvaluate as V4
import qualified ARC.TriggeredStress as V4
import qualified Synthesis.Triggered.Parallel as V4P
import qualified Synthesis.Collection as V5
import qualified ARC.CollectionEvaluate as V5
import qualified Synthesis.Collection.Front as V6
import qualified ARC.CollectionV6Evaluate as V6
import qualified ARC.CollectionV61Evaluate as V61
import qualified ARC.ArcTrainOnly as ATO
import qualified ARC.StageAEvaluate as SA
import qualified ARC.StageBEvaluate as SB
import Control.Concurrent (getNumCapabilities)
import Control.Exception (evaluate)
import GHC.Clock (getMonotonicTimeNSec)
import GHC.Stats (getRTSStatsEnabled,getRTSStats,RTSStats(..))
import System.Info (compilerName,fullCompilerVersion,arch,os)
import Data.Version (showVersion)
import System.IO (hPutStrLn,stderr)
import qualified Data.Map.Strict as Map
import Data.List (intercalate)
import System.Directory (createDirectoryIfMissing)
import Synthesis.Hierarchical
import Synthesis.Joint
import Synthesis.Search
import Latent.Encode
import System.Environment (getArgs)
import System.Exit (die)
import System.Directory (listDirectory)
import System.FilePath ((</>),takeExtension)
import Text.Read (readMaybe)
import Data.List (sort)
import System.IO (hSetBuffering,stdout,BufferMode(LineBuffering))

usage :: String
usage = unlines
  ["LATIS v0.2A (Haskell, symbolic; v0.1 baseline preserved)"
  ,"latis solve-collection --task data/03560426.json --out results/collection/task --mode Full"
  ,"latis collection-experiment --out results/collection (seven ablations; actual unchanged R2 fallback)"
  ,"latis solve-collection-v6 --task data/03560426.json --out results/v06/task --mode Full"
  ,"latis collection-v6-experiment --out results/v06 (eleven ablations incl. counterfactual/online abstraction; actual unchanged R2 fallback)"
  ,"latis solve-collection-v61 --task data/03560426.json --out results/v061/task --mode SafeOnline"
  ,"latis collection-v61-experiment --out results/v061 [--repeats 5] (SafeOnline reuse, misleading/paired tasks, nine ablations)"
  ,"latis collection-v61-battery --out results/v061/battery [--seed-base 2000] [--per-family 20] (seeded metamorphic battery, front-end only)"
  ,"latis arc-train-only-stage --stage feature|feature-v04|r2|stage-a-<Config> --task TRAIN_ONLY.json --out DIR [--timeout-ms N] (one stage, one task; train-only file required)"
  ,"latis stage-a-mechanism --out results/stage_a/mechanism [--per-family 3] (Stage A synthetic mechanism tasks x ablation configs + v0.6.1 regression rows)"
  ,"latis stage-a-solve --task PATH --out DIR --config FullA (one task, one Stage A configuration; writes solution.json/derivation_graph.json/trace.txt)"
  ,"latis stage-b-mechanism --out results/stage_b/mechanism [--per-family 3] (Stage B synthetic mechanism tasks x ablation configs + Stage A regression rows)"
  ,"latis stage-b-solve --task PATH --out DIR --config FullB (one task, one Stage B configuration; writes solution.json/derivation_graph.json/trace.txt)"
  ,"latis solve-v04 --task PATH --out results/v04/task --mode Full --feature-budget 12000 --construction-budget 12000 --feature-depth 4 --budget 250000"
  ,"         --workers 1 [--window 4*workers] [--speculation-cap 256]   (source-closure candidate evaluation; pair --workers N with +RTS -N<N> -RTS)"
  ,"latis v04-stress --out results/v04/stress [--workers N] (all ten front-end ablations, matrix sequential; R2 fallback audited separately)"
  ,"latis v04-bench --out results/v04-parallel/bench --workers N [--repeats 7] [--warmup 2] [--mode Full] [--tasks A-match-pruning,...] [--task PATH]"
  ,"latis v04-r2-stress --out results/v04/r2-baseline (actual R2FallbackOnly comparison on A-G)"
  ,"latis solve-features --task PATH --out results/features/task --budget 20000 --construction-budget 20000 --composition-depth 2"
  ,"latis solve-v03r --task PATH --out results/v03r/task"
  ,"latis solve-v03r1 --task PATH --out results/v03r1/task --mode Full"
  ,"latis solve-v03r2 --task PATH --out results/v03r2/task --mode Full --cost 96"
    ,"v03R.2 modes: Full|NoDiversityPreservation|FixedAliasCap|NoLetSharing|NoGroundedLiteralPrior|BeamSearchLegacy|NoCounterfactualDiagnosis|NoPortfolioCover"
    ,"v03R.2 bounds: --budget 250000 --cost 96 --saturation-budget 25000 --branches 32; deductive safety guard remains 7"
  ,"v03R.1 modes: Full|NoOnlineAbstraction|PostHocOnly|NoAntiUnification|NoLambdaLifting|NoNewWitnessCoverage"
  ,"v03R.1 bounds: --rounds 2 --inventions 6 --ast-size 96 --parameters 4; same budget/depth/frontier/branches flags"
  ,"v03R --mode: InducedTSLFull|NoWitness|NoVersionSpaceSharing|NoTaskAbstraction|NoEffectPropagation|NoFVDependency"
  ,"v03R bounds: --budget 250000 --depth 7 --frontier 32 --branches 32"
  ,"latis solve-v03 --task PATH --out results/v03/task"
  ,"latis v03-stress | v03-regression | v03-ablation --out PATH"
  ,"V03 --mode: V03Full|NoLocalLatent|NoGlobalLatent|NoFusion|NoLatentMDL|EagerLatentEnumeration|NoProgramToLatent|LatentDisabled"
  ,"latis solve-v02a (alias of joint-solve)"
  ,"latis joint-solve --task data/03560426.json --out results/03560426"
  ,"latis joint-benchmark --out results/03560426 --repeats 5"
  ,"latis joint-suite --out results/v02a/synthetic"
  ,"latis joint-stress --out results/v02a/stress"
  ,"latis joint-stress-benchmark --out results/v02a/stress --repeats 5"
  ,"Joint --mode: JointConstraint|NoBidirectionalSkeleton|NoWitnessFirst|NoLazyContext|NoStructuralDominance|NoMemoization"
  ,"latis solve --task data/03560426.json --out results/03560426"
  ,"latis benchmark --task data/03560426.json --out results/03560426 --repeats 3"
  ,"latis suite --out results/synthetic"
  ,"latis evaluate --data PATH --out results/dataset --limit 20"
  ,"Options: --mode Full|NoEffect|NoDependency|NoWitness|Direct --budget 1000000"
  ,"         --radius 2 --branches 256 --solutions 128 --connectivity 4|8"]
option :: String -> String -> [String] -> String
option key fallback args = case dropWhile (/=key) args of _:value:_ -> value; _ -> fallback
number :: String -> Int -> [String] -> IO Int
number key fallback args = case readMaybe (option key (show fallback) args) of
  Just n | n > 0 -> pure n
  _ -> die (key++" requires a positive integer")
count :: String -> Int -> [String] -> IO Int
count key fallback args = case readMaybe (option key (show fallback) args) of
  Just n | n >= 0 -> pure n
  _ -> die (key++" requires a non-negative integer")
splitOn :: Char -> String -> [String]
splitOn c s = case break (==c) s of (a,[]) -> [a]; (a,_:b) -> a:splitOn c b
-- Worker threads are not RTS capabilities: without +RTS -N<k> the workers
-- share one OS thread and only interleave, so the pairing is reported.
parallelOptions :: [String] -> IO V4P.Parallel
parallelOptions rest = do
  workers' <- number "--workers" 1 rest
  window' <- number "--window" (4*workers') rest
  cap <- count "--speculation-cap" 256 rest
  par <- either die pure (V4P.validateParallel (V4P.Parallel workers' window' cap))
  caps <- getNumCapabilities
  if workers' > 1 && caps < workers'
    then hPutStrLn stderr ("warning: --workers "++show workers'++" but the RTS has "++show caps++" capabilit"++(if caps==1 then "y" else "ies")
      ++"; run with +RTS -N"++show workers'++" -RTS for actual parallel evaluation")
    else hPutStrLn stderr ("workers="++show workers'++" capabilities="++show caps++" window="++show window'++" speculation_cap="++show cap)
  pure par
v04Config :: [String] -> IO V4.Config
v04Config rest = do
  budget <- number "--budget" 250000 rest
  featureBudget <- number "--feature-budget" 12000 rest
  construction <- number "--construction-budget" 12000 rest
  selection <- number "--selection-budget" 100000 rest
  depth <- number "--feature-depth" 4 rest
  pure V4.defaultConfig {V4.sourceBudget=featureBudget,V4.constructBudget=construction,V4.selectionBudget=selection
    ,V4.maxDepth=depth,V4.r2Config=R2.defaultInduced {R2.workBudget=budget}}
main :: IO ()
main = do
  hSetBuffering stdout LineBuffering
  args <- getArgs
  case args of
    [] -> putStr usage
    "solve-collection":rest -> do
      mode <- maybe (die "Invalid collection --mode") pure (readMaybe (option "--mode" "Full" rest))
      legacy <- v04Config rest
      task <- loadTask (option "--task" "data/03560426.json" rest) >>= either die pure
      _ <- V5.runTask (option "--out" "results/collection/task" rest) mode V5.defaultConfig {V5.legacyConfig=legacy} task
      pure ()
    "collection-experiment":rest -> do
      legacy <- v04Config rest
      mechanismBudget <- number "--mechanism-budget" 25000 rest
      task <- loadTask (option "--task" "data/03560426.json" rest) >>= either die pure
      V5.runMatrix (option "--out" "results/collection" rest) mechanismBudget V5.defaultConfig {V5.legacyConfig=legacy} task
    "solve-collection-v6":rest -> do
      mode <- maybe (die "Invalid collection-v6 --mode") pure (readMaybe (option "--mode" "Full" rest))
      legacy <- v04Config rest
      task <- loadTask (option "--task" "data/03560426.json" rest) >>= either die pure
      _ <- V6.runTask (option "--out" "results/v06/task" rest) mode V6.defaultConfig {V6.legacyConfig=legacy} task
      pure ()
    "collection-v6-experiment":rest -> do
      legacy <- v04Config rest
      mechanismBudget <- number "--mechanism-budget" 25000 rest
      task <- loadTask (option "--task" "data/03560426.json" rest) >>= either die pure
      V6.runMatrix (option "--out" "results/v06" rest) mechanismBudget V6.defaultConfig {V6.legacyConfig=legacy} task
    "solve-collection-v61":rest -> do
      mode <- maybe (die "Invalid collection-v61 --mode") pure (readMaybe (option "--mode" "SafeOnline" rest))
      legacy <- v04Config rest
      repeats <- number "--repeats" 5 rest
      task <- loadTask (option "--task" "data/03560426.json" rest) >>= either die pure
      _ <- V61.runTask61 (option "--out" "results/v061/task" rest) repeats mode V61.v61Config {V6.legacyConfig=legacy} task
      pure ()
    "collection-v61-experiment":rest -> do
      legacy <- v04Config rest
      mechanismBudget <- number "--mechanism-budget" 25000 rest
      repeats <- number "--repeats" 5 rest
      task <- loadTask (option "--task" "data/03560426.json" rest) >>= either die pure
      V61.runMatrix61 (option "--out" "results/v061" rest) mechanismBudget repeats V61.v61Config {V6.legacyConfig=legacy} task
    "collection-v61-battery":rest -> do
      legacy <- v04Config rest
      seedBase <- number "--seed-base" 2000 rest
      perFamily <- number "--per-family" 20 rest
      V61.runBattery (option "--out" "results/v061/battery" rest) seedBase perFamily V61.v61Config {V6.legacyConfig=legacy}
    "stage-a-mechanism":rest -> do
      per <- number "--per-family" 3 rest
      vertical <- loadTask (option "--task" "data/03560426.json" rest) >>= either die pure
      SA.runMechanism (option "--out" "results/stage_a/mechanism" rest) per vertical
    "stage-a-solve":rest -> do
      let cfgName=option "--config" "FullA" rest
      conf <- maybe (die ("Invalid --config; one of "++unwords SA.configNames)) pure (SA.configByName cfgName)
      task <- loadTask (option "--task" "data/03560426.json" rest) >>= either die pure
      let out=option "--out" "results/stage_a/single" rest
      createDirectoryIfMissing True out
      (f,secs) <- SA.runFront conf (training task)
      writeFile (out </> "solution.json") (SA.frontJSON cfgName task f secs++"\n")
      writeFile (out </> "derivation_graph.json") (V6.graphJSON (V6.graph f)++"\n")
      writeFile (out </> "trace.txt") (unlines (V6.trace (V6.graph f)++[V6.failure f]))
      putStrLn (taskId task++" "++cfgName++" train="++show (SA.trainExactOf task f)++" held="++show (SA.heldExactOf task f)++" "++V6.failure f)
    "stage-b-mechanism":rest -> do
      per <- number "--per-family" 3 rest
      vertical <- loadTask (option "--task" "data/03560426.json" rest) >>= either die pure
      SB.runMechanismB (option "--out" "results/stage_b/mechanism" rest) per vertical
    "stage-b-solve":rest -> do
      let cfgName=option "--config" "FullB" rest
      conf <- maybe (die ("Invalid --config; one of "++unwords SB.configNamesB)) pure (SB.configByNameB cfgName)
      task <- loadTask (option "--task" "data/03560426.json" rest) >>= either die pure
      let out=option "--out" "results/stage_b/single" rest
      createDirectoryIfMissing True out
      (f,secs) <- SA.runFront conf (training task)
      writeFile (out </> "solution.json") (SB.frontJSONB cfgName task f secs++"\n")
      writeFile (out </> "derivation_graph.json") (V6.graphJSON (V6.graph f)++"\n")
      writeFile (out </> "trace.txt") (unlines (V6.trace (V6.graph f)++[V6.failure f]))
      putStrLn (taskId task++" "++cfgName++" train="++show (SA.trainExactOf task f)++" held="++show (SA.heldExactOf task f)++" "++V6.failure f)
    "arc-train-only-stage":rest -> do
      stage <- maybe (die "Invalid --stage (feature|feature-v04|r2|stage-a-<Config>|stage-b-<Config>)") pure (ATO.parseStage (option "--stage" "feature" rest))
      ms <- number "--timeout-ms" 60000 rest
      case (option "--task" "" rest,option "--out" "" rest) of
        ("",_) -> die "--task is required"
        (_,"") -> die "--out is required"
        (task,out) -> ATO.runStage stage task out ms
    "solve-v04":rest -> do
      runMode <- maybe (die "Invalid v04 --mode") pure (readMaybe (option "--mode" "Full" rest))
      conf <- v04Config rest
      par <- parallelOptions rest
      task <- loadTask (option "--task" "data/03560426.json" rest) >>= either die pure
      r <- V4P.solveWith par runMode conf (training task)
      V4.saveWith par (option "--out" "results/v04/task" rest) runMode conf task r
      putStrLn ("v0.4 front="++V4.frontFailure (V4.front r)++"; fallback="++V4.fallbackReason r
        ++"; closure_seconds="++show (V4.closureSeconds r)++"; actual_evaluations="++show (V4.metric "parallel_actual_evaluations" (V4.graph (V4.front r))))
    "v04-stress":rest -> do
      par <- parallelOptions rest
      V4.runMatrixWith par (option "--out" "results/v04/stress" rest) V4.defaultConfig
    "v04-bench":rest -> do
      runMode <- maybe (die "Invalid v04 --mode") pure (readMaybe (option "--mode" "Full" rest))
      conf <- v04Config rest
      par <- parallelOptions rest
      repeats <- number "--repeats" 7 rest
      warmup <- count "--warmup" 2 rest
      let out=option "--out" "results/v04-parallel/bench" rest
          wanted=case option "--tasks" "" rest of ""->map fst V4.stressTasks; s'->splitOn ',' s'
      extra <- case option "--task" "" rest of ""->pure []; path->(\t->[(taskId t,t)]) <$> (loadTask path >>= either die pure)
      let tasks'=[(n,t) | (n,t)<-V4.stressTasks,n `elem` wanted]++extra
      caps <- getNumCapabilities
      statsOn <- getRTSStatsEnabled
      createDirectoryIfMissing True out
      let header="task,mode,workers,window,speculation_cap,capabilities,repeat,closure_seconds,front_seconds,eval_only_seconds,eval_terms,search_work,operator_applications,actual_evaluations,consumed,inline,discarded,discarded_evaluated,discarded_cancelled,cap_refusals,max_live_bytes,max_mem_in_use_bytes,mutator_cpu_ns,gc_cpu_ns"
      rows <- fmap concat $ mapM (\(name,task)->do
        let c=conf {V4.noiseOperators=if take 1 name=="D" then 200 else 0}
            one i=do
              s0 <- if statsOn then Just <$> getRTSStats else pure Nothing
              t0 <- getMonotonicTimeNSec
              (f,closureTime) <- V4P.frontSearchIO par runMode c (training task)
              _ <- evaluate (V4.metric "search_work" (V4.graph f)+length (show (V4.frontProgram f))+length (V4.frontFailure f))
              t1 <- getMonotonicTimeNSec
              s1 <- if statsOn then Just <$> getRTSStats else pure Nothing
              -- Evaluation-only profile: re-evaluate every committed closure
              -- term serially, outside the scheduler, to bound the fraction
              -- of closure time that worker threads can absorb at all.
              let g=V4.graph f
                  m k=show (V4.metric k g)
                  defs=V4.definitions g
                  scenes=map (encode (R2.inducedEncoder (V4.r2Config c)) . fst) (training task)
                  terms=[V4.expression ft | ft<-Map.elems (V4.features g),V4.featureDepth ft>0,V4.featureDepth ft<=V4.maxDepth c]
              e0 <- getMonotonicTimeNSec
              mapM_ (\t->evaluate (V4P.forceCases (traverse (\sc->V4.evalTerm defs sc V4.closureLayout Map.empty t) scenes))) terms
              e1 <- getMonotonicTimeNSec
              let mem f' = maybe "" (show . f') s1
                  delta f' = case (s0,s1) of (Just a,Just b)->show (f' b-f' a); _->""
              pure (closureTime,intercalate "," ([name,show runMode,show (V4P.workers par),show (V4P.window par),show (V4P.speculationCap par),show caps,show i
                ,show closureTime,show (fromIntegral (t1-t0)/1e9 :: Double),show (fromIntegral (e1-e0)/1e9 :: Double),show (length terms),m "search_work",m "operator_applications"
                ,if V4P.workers par<=1 then m "operator_applications" else m "parallel_actual_evaluations"
                ,m "parallel_consumed",m "parallel_inline_evaluations",m "parallel_discarded",m "parallel_discarded_evaluated",m "parallel_discarded_cancelled",m "parallel_cap_refusals"
                ,mem max_live_bytes,mem max_mem_in_use_bytes,delta mutator_cpu_ns,delta gc_cpu_ns]))
        mapM_ (\i->one (negate i)) [1..warmup]
        rs <- mapM one [1..repeats]
        let times=sort (map fst rs)
            median=times !! (length times `div` 2)
        putStrLn (name++" workers="++show (V4P.workers par)++" median_closure_seconds="++show median++" min="++show (minimum times)++" max="++show (maximum times))
        pure (map snd rs)) tasks'
      let file=out </> ("bench-workers"++show (V4P.workers par)++"-caps"++show caps++".csv")
      writeFile file (unlines (header:rows))
      writeFile (out </> ("env-workers"++show (V4P.workers par)++"-caps"++show caps++".txt")) (unlines
        ["compiler="++compilerName++"-"++showVersion fullCompilerVersion,"arch="++arch,"os="++os,"capabilities="++show caps
        ,"rts_stats_enabled="++show statsOn,"parallel="++show par,"config="++show conf,"mode="++show runMode,"repeats="++show repeats,"warmup="++show warmup])
      putStrLn ("wrote "++file)
    "v04-r2-stress":rest -> V4.runFallbackMatrix (option "--out" "results/v04/r2-baseline" rest) V4.defaultConfig
    "solve-features":rest -> do
      budget <- number "--budget" 20000 rest
      construction <- number "--construction-budget" 20000 rest
      depth <- number "--composition-depth" 2 rest
      task <- loadTask (option "--task" "data/03560426.json" rest) >>= either die pure
      let conf=FP.defaultConfig {FP.transformBudget=budget,FP.constructionBudget=construction,FP.compositionDepth=depth}
          result=FP.synthesize conf FP.defaultLibrary (training task)
          out=option "--out" "results/features/task" rest
          predictions=[maybe (Left "no exact training program") (\p->FP.runProgram p (testInput t)) (FP.program result) | t<-tests task]
          jsonPrediction p=case p of Right g->jsonGrid g; Left _->"null"
      createDirectoryIfMissing True out
      writeFile (out </> "feature_trace.txt") (unlines
        (["failure="++FP.failure result,"transform_work="++show (FP.transformWork result)
         ,"construction_work="++show (FP.constructionWork result),"reused_programs="++show (FP.reusedPrograms result)
         ,"unresolved="++show (FP.unresolved result)]++FP.trace result
         ++[show f++" = "++show rule | (f,rule)<-Map.toAscList (FP.resolved result)]
         ++["prediction "++show i++": "++either id (const "success") p | (i,p)<-zip [0::Int ..] predictions]))
      writeFile (out </> "predictions.json") ("["++intercalate "," (map jsonPrediction predictions)++"]\n")
      putStrLn ("Feature pipeline: "++FP.failure result++"; transform work="++show (FP.transformWork result)
        ++"; construction work="++show (FP.constructionWork result))
    "solve-v03r2":rest -> do
      runMode <- maybe (die "Invalid v03r2 --mode") pure (readMaybe (option "--mode" "Full" rest))
      budget <- number "--budget" 250000 rest
      cost <- number "--cost" 96 rest
      saturation <- number "--saturation-budget" 25000 rest
      branches' <- number "--branches" 32 rest
      task <- loadTask (option "--task" "data/03560426.json" rest) >>= either die pure
      let conf=R2.defaultInduced {R2.workBudget=budget,R2.structuralCostBound=cost,R2.saturationWorkBudget=saturation,R2.inducedCorrespondenceBudget=branches'}
      r <- R2.inducedSearch runMode conf (training task)
      R2.saveInduced (option "--out" "results/v03r2/03560426" rest) runMode conf task r
      putStrLn ("v03R.2 "++R2.inducedFailure r++" "++show (R2.inducedMetrics r))
    "solve-v03r1":rest -> do
      runMode <- maybe (die "Invalid v03r1 --mode") pure (readMaybe (option "--mode" "Full" rest))
      budget <- number "--budget" 250000 rest
      depth <- number "--depth" 7 rest
      frontier <- number "--frontier" 32 rest
      branches' <- number "--branches" 32 rest
      rounds <- number "--rounds" 2 rest
      invs <- number "--inventions" 6 rest
      ast <- number "--ast-size" 96 rest
      params <- number "--parameters" 4 rest
      task <- loadTask (option "--task" "data/03560426.json" rest) >>= either die pure
      let conf=R1.defaultInduced {R1.workBudget=budget,R1.depthBound=depth,R1.frontierBound=frontier
            ,R1.inducedCorrespondenceBudget=branches',R1.abstractionLimits=R1.Limits rounds invs ast params}
      r <- R1.inducedSearch runMode conf (training task)
      R1.saveInduced (option "--out" "results/v03r1/03560426" rest) runMode conf task r
      putStrLn ("v03R.1 "++R1.inducedFailure r++" "++show (R1.inducedMetrics r))
    "solve-v03r":rest -> do
      runMode <- maybe (die "Invalid v03r --mode") pure (readMaybe (option "--mode" "InducedTSLFull" rest))
      budget <- number "--budget" 250000 rest
      depth <- number "--depth" 7 rest
      frontier <- number "--frontier" 32 rest
      branches' <- number "--branches" 32 rest
      task <- loadTask (option "--task" "data/03560426.json" rest) >>= either die pure
      let conf=defaultInduced {workBudget=budget,depthBound=depth,frontierBound=frontier,inducedCorrespondenceBudget=branches'}
          out=option "--out" "results/v03r/03560426" rest
      r <- inducedSearch runMode conf (training task)
      saveInduced out runMode conf task r
      putStrLn ("v03R "++inducedFailure r++" "++show (inducedMetrics r))
    command:rest | command `elem` ["solve-v03","v03-stress","v03-regression","v03-ablation"] -> do
      mode <- maybe (die "Invalid v03 --mode") pure (readMaybe (option "--mode" "V03Full" rest))
      budget <- number "--budget" 1000000 rest
      solutions' <- number "--solutions" 100000 rest
      branches' <- number "--branches" 256 rest
      let config=defaultSearch {stateBudget=budget,solutionLimit=solutions',correspondenceBudget=branches'}
          out=option "--out" "results/v03" rest
      case command of
        "v03-stress" -> suiteV03 mode config out latentStressTasks
        "v03-regression" -> regressionV03 config out
        "v03-ablation" -> ablationV03 config out
        _ -> do
          task <- loadTask (option "--task" "data/03560426.json" rest) >>= either die pure
          r <- hierarchicalSearch mode config (training task)
          saveV03 out mode config task r
          print (hierarchicalMetrics r)
          putStrLn (maybe "UNSOLVED" show (selectedRoute r))
    command:rest | command `elem` ["solve-v02a","joint-solve","joint-benchmark","joint-suite","joint-stress","joint-stress-benchmark"] -> do
      mode <- maybe (die "Invalid joint --mode") pure (readMaybe (option "--mode" "JointConstraint" rest))
      budget <- number "--budget" 1000000 rest
      solutions' <- number "--solutions" 100000 rest
      branches' <- number "--branches" 256 rest
      let config=defaultSearch {stateBudget=budget,solutionLimit=solutions',correspondenceBudget=branches'}
          out=option "--out" "results/v02a" rest
      case command of
        "joint-suite" -> jointSuite mode config out syntheticTasks
        "joint-stress" -> jointSuite mode config out stressTasks
        "joint-stress-benchmark" -> do
          repeats<-number "--repeats" 5 rest
          mapM_ (\task->jointBenchmark config repeats (out </> taskId task) task) stressTasks
        "joint-benchmark" -> do
          repeats<-number "--repeats" 5 rest
          task<-loadTask (option "--task" "data/03560426.json" rest) >>= either die pure
          jointBenchmark config repeats out task
        _ -> do
          task<-loadTask (option "--task" "data/03560426.json" rest) >>= either die pure
          r<-jointSearch mode config (training task)
          saveJoint out mode config task r
          print (jointMetrics r)
          putStrLn (maybe "UNSOLVED" show (jointSolution r))
    command:rest | command `elem` ["solve","benchmark","suite","evaluate"] -> do
      mode <- maybe (die "Invalid --mode") pure (readMaybe (option "--mode" "Full" rest))
      budget <- number "--budget" 1000000 rest
      branches' <- number "--branches" 256 rest
      radius <- number "--radius" 2 rest
      solutions' <- number "--solutions" 128 rest
      conn <- case option "--connectivity" "4" rest of "4" -> pure Four; "8" -> pure Eight; _ -> die "--connectivity must be 4 or 8"
      let config = defaultSearch {searchMode=mode,stateBudget=budget,correspondenceBudget=branches',constantRadius=radius,solutionLimit=solutions',encoder=EncoderConfig conn 0}
          out = option "--out" "results/run" rest
          path = option "--task" "data/03560426.json" rest
      case command of
        "suite" -> evaluateTasks config out syntheticTasks
        "evaluate" -> do
          let dir = option "--data" "data" rest
          limit <- number "--limit" 20 rest
          paths <- take limit . sort . filter ((==".json") . takeExtension) <$> listDirectory dir
          tasks' <- traverse (\p -> loadTask (dir </> p) >>= either die pure) paths
          evaluateTasks config out tasks'
        "benchmark" -> do
          repeats <- number "--repeats" 3 rest
          task <- loadTask path >>= either die pure
          _ <- benchmark config repeats out task
          pure ()
        _ -> do
          task <- loadTask path >>= either die pure
          result <- search config (training task)
          saveResult out config task result
          putStrLn (maybe "UNSOLVED" show (solution result))
          print (statistics result)
    _ -> die usage
