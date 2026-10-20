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
  ,"latis solve-v04 --task PATH --out results/v04/task --mode Full --feature-budget 12000 --construction-budget 12000 --feature-depth 4 --budget 250000"
  ,"latis v04-stress --out results/v04/stress (all ten front-end ablations; R2 fallback audited separately)"
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
main :: IO ()
main = do
  hSetBuffering stdout LineBuffering
  args <- getArgs
  case args of
    [] -> putStr usage
    "solve-v04":rest -> do
      runMode <- maybe (die "Invalid v04 --mode") pure (readMaybe (option "--mode" "Full" rest))
      budget <- number "--budget" 250000 rest
      featureBudget <- number "--feature-budget" 12000 rest
      construction <- number "--construction-budget" 12000 rest
      selection <- number "--selection-budget" 100000 rest
      depth <- number "--feature-depth" 4 rest
      task <- loadTask (option "--task" "data/03560426.json" rest) >>= either die pure
      let conf=V4.defaultConfig {V4.sourceBudget=featureBudget,V4.constructBudget=construction,V4.selectionBudget=selection
            ,V4.maxDepth=depth,V4.r2Config=R2.defaultInduced {R2.workBudget=budget}}
      r <- V4.solve runMode conf (training task)
      V4.save (option "--out" "results/v04/task" rest) runMode conf task r
      putStrLn ("v0.4 front="++V4.frontFailure (V4.front r)++"; fallback="++V4.fallbackReason r)
    "v04-stress":rest -> V4.runMatrix (option "--out" "results/v04/stress" rest) V4.defaultConfig
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
