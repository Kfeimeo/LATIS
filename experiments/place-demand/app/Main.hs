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
import qualified Synthesis.InducedR2.Witness as R2W
import qualified ARC.InducedR2Evaluate as R2
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
  ,"latis solve-v03r --task PATH --out results/v03r/task"
  ,"latis solve-v03r1 --task PATH --out results/v03r1/task --mode Full"
  ,"latis solve-v03r2 --task PATH --out results/v03r2/task --mode Full --cost 96"
  ,"place-demand switches: --witness unidirectional|bidirectional --demand off|on --demand-budget 25000 --demand-operands 24 --demand-rounds 3 (B0 = defaults; B1 = bidirectional; B2 = bidirectional + demand on)"
  ,"place-demand round 2: --schedule all|defer-nonlocal --deferred-budget 62500 --cover refine|lazy (Q = defer-nonlocal, X = lazy cover)"
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
    "solve-v03r2":rest -> do
      runMode <- maybe (die "Invalid v03r2 --mode") pure (readMaybe (option "--mode" "Full" rest))
      budget <- number "--budget" 250000 rest
      cost <- number "--cost" 96 rest
      saturation <- number "--saturation-budget" 25000 rest
      branches' <- number "--branches" 32 rest
      task <- loadTask (option "--task" "data/03560426.json" rest) >>= either die pure
      witnessPolicy' <- case option "--witness" "unidirectional" rest of
        "unidirectional" -> pure R2W.Unidirectional
        "bidirectional" -> pure R2W.Bidirectional
        "bidirectional-local" -> pure R2W.BidirectionalLocal
        "bidirectional-unpruned" -> pure R2W.BidirectionalUnpruned
        _ -> die "--witness requires unidirectional|bidirectional"
      demandPolicy' <- case option "--demand" "off" rest of
        "off" -> pure R2.DemandOff
        "on" -> pure R2.DemandOn
        _ -> die "--demand requires off|on"
      demandBudget <- number "--demand-budget" 25000 rest
      demandOperands <- number "--demand-operands" 24 rest
      demandRounds' <- number "--demand-rounds" 3 rest
      schedule' <- case option "--schedule" "all" rest of
        "all" -> pure R2.ScheduleAll
        "defer-nonlocal" -> pure R2.DeferNonLocal
        _ -> die "--schedule requires all|defer-nonlocal"
      deferredBudget <- number "--deferred-budget" 62500 rest
      cover' <- case option "--cover" "refine" rest of
        "refine" -> pure R2.CoverRefine
        "lazy" -> pure R2.CoverLazy
        _ -> die "--cover requires refine|lazy"
      let conf=R2.defaultInduced {R2.workBudget=budget,R2.structuralCostBound=cost,R2.saturationWorkBudget=saturation,R2.inducedCorrespondenceBudget=branches'
            ,R2.witnessPolicy=witnessPolicy',R2.demandPolicy=demandPolicy',R2.demandWorkBudget=demandBudget,R2.demandOperandCap=demandOperands,R2.demandRounds=demandRounds'
            ,R2.schedulePolicy=schedule',R2.deferredWorkBudget=deferredBudget,R2.coverPolicy=cover'}
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
