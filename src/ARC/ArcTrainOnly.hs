{-# LANGUAGE ScopedTypeVariables #-}
-- Real ARC-AGI-1 train-only fallback experiment (evaluation only).
--
-- One invocation runs exactly ONE stage on ONE task file and writes a single
-- JSON record.  The stages are deliberately separate processes so that the R2
-- stage can never inherit state from an interrupted Feature stage:
--
--   feature      the current v0.6.1 collection front end (SafeOnline, v61Config)
--   feature-v04  the v0.4 triggered typed feature front (diagnostic column only;
--                it never influences the fallback decision)
--   r2           the existing R2 induced search with its default budget
--   stage-a-<C>  Stage A front end under configuration C (ARC.StageAEvaluate:
--                BaselineV061 | GridSizeOnly | TypedNaryOnly | FullA |
--                NoFeatureArg | NoConstantArg | FullAMinusParity); the same
--                SafeOnline search with a different Stage A block
--
-- Leak guard: the task file must contain an EMPTY "test" array.  A file with
-- test pairs is refused (exit code 3) before any search runs.  Success is
-- defined only as train-exact: the returned program is re-executed on every
-- training input by this module and must reproduce every training output.
module ARC.ArcTrainOnly (Stage(..), parseStage, stageName, runStage, frontConfig, r2Config, v04Config) where
import ARC.Dataset
import ARC.Evaluate (jsonString)
import ARC.InducedR1Evaluate (objectJSON, arrayJSON, boolJSON)
import qualified Synthesis.Collection.Front as F
import qualified ARC.CollectionV61Evaluate as V61
import qualified ARC.StageAEvaluate as SA
import qualified ARC.StageBEvaluate as SB
import qualified Synthesis.Triggered as V4
import qualified Synthesis.InducedR2.Learn as R2
import Language.Induced.Base (exprText)
import Latent.Grid
import Latent.Encode (encode)
import qualified Latent.Object as O
import Control.Exception (SomeException, AsyncException(..), try, evaluate, fromException)
import System.Timeout (timeout)
import GHC.Clock (getMonotonicTimeNSec)
import qualified Data.Map.Strict as M
import Data.List (isPrefixOf, stripPrefix)
import GHC.Stats (getRTSStatsEnabled, getRTSStats, RTSStats(..))
import System.Directory (createDirectoryIfMissing)
import System.FilePath ((</>), takeBaseName)
import System.Exit (exitWith, ExitCode(..))

--   stage-b-<C>  Stage B front end under configuration C (ARC.StageBEvaluate:
--                BaselineA | B0Only | NoStructuralGeneralization | NoSharedVSA |
--                NoHierarchy | FullB | FullB-SpecificFirst | FullB-CostFirst |
--                FullB-Interleaved); same search, same isolation, extra JSON
data Stage = FeatureStage | FeatureV04Stage | R2Stage | StageAStage String | StageBStage String deriving (Eq,Show)
parseStage :: String -> Maybe Stage
parseStage "feature"=Just FeatureStage
parseStage "feature-v04"=Just FeatureV04Stage
parseStage "r2"=Just R2Stage
parseStage s=case (stripPrefix "stage-a-" s,stripPrefix "stage-b-" s) of
  (Just c,_) | Just _<-SA.configByName c->Just (StageAStage c)
  (_,Just c) | Just _<-SB.configByNameB c->Just (StageBStage c)
  _->Nothing
stageName :: Stage -> String
stageName FeatureStage="feature"
stageName FeatureV04Stage="feature-v04"
stageName R2Stage="r2"
stageName (StageAStage c)="stage-a-"++c
stageName (StageBStage c)="stage-b-"++c

-- Budgets are the existing defaults of the respective entries; they are fixed
-- here and recorded verbatim in every result file.
frontConfig :: F.Config
frontConfig=V61.v61Config
v04Config :: V4.Config
v04Config=F.legacyConfig frontConfig
r2Config :: R2.InducedConfig
r2Config=V4.r2Config v04Config

-- Outcome of one timed stage.
data Outcome = Outcome
  { oStatus :: String          -- train_exact | no_solution | timeout | unsupported | runtime_error
  , oDetail :: String
  , oProgram :: Maybe String
  , oWork :: Int
  , oCounters :: M.Map String Int
  , oExtra :: [(String,String)] }

-- Front-end precondition rejections are reported as "unsupported" (the input
-- is outside the stage's interface); everything else without a program is a
-- search failure ("no_solution").  The raw failure string is always kept.
frontUnsupported :: String -> Bool
frontUnsupported why=any (`isPrefixOf` why) ["layout:","grounding:"]
-- Stage A: "size:" is a search failure (the canvas change entered synthesis
-- and no uniform size expression was found), not an interface rejection.
v04Unsupported :: String -> Bool
v04Unsupported why=any (`isPrefixOf` why) ["grounding:","empty training specification","invalid configuration"]

timed :: Int -> IO a -> IO (Either SomeException (Maybe a))
timed ms act=try (timeout (ms*1000) act)

settle :: Either SomeException (Maybe Outcome) -> Outcome
settle (Right (Just o))=o
settle (Right Nothing)=Outcome "timeout" "wall-clock timeout" Nothing 0 M.empty []
settle (Left e)=case fromException e of
  Just HeapOverflow->Outcome "runtime_error" "heap overflow (RTS -M limit)" Nothing 0 M.empty []
  Just StackOverflow->Outcome "runtime_error" "stack overflow" Nothing 0 M.empty []
  _->Outcome "runtime_error" (take 2000 (show e)) Nothing 0 M.empty []

trainExactOn :: [(Grid,Grid)] -> (Grid -> Either String Grid) -> Bool
trainExactOn pairs run=all (\(x,y)->run x==Right y) pairs

runFeature :: Int -> [(Grid,Grid)] -> IO Outcome
runFeature ms pairs=settle <$> timed ms (do
  let f=F.frontSearch F.SafeOnline frontConfig pairs
  _<-evaluate (length (show f))
  let g=F.graph f
      o=case F.program f of
        Just p | trainExactOn pairs (F.runProgram p)->Outcome "train_exact" "None" (Just (show p)) (F.metric "search_work" g) (F.counters g) []
               | otherwise->Outcome "no_solution" ("program returned but not train-exact: "++F.failure f) (Just (show p)) (F.metric "search_work" g) (F.counters g) []
        Nothing->Outcome (if frontUnsupported (F.failure f) then "unsupported" else "no_solution") (F.failure f) Nothing (F.metric "search_work" g) (F.counters g) []
  _<-evaluate (length (oStatus o)+length (oDetail o)+maybe 0 length (oProgram o)+oWork o)
  pure o {oExtra=[("trace_lines",show (length (F.trace g))),("semantic_classes",show (length (F.classes g)))]})

-- Stage A stage: same timing, leak guard and train-exact re-check as the
-- feature stage; the JSON additionally separates SizeRule-exact, grid
-- realization and whole-grid exactness and records the hole bindings.
runStageA :: String -> Int -> [(Grid,Grid)] -> IO Outcome
runStageA cfgName=runConfigured (maybe (error ("unknown Stage A configuration "++cfgName)) id (SA.configByName cfgName)) False
-- Stage B stage: identical timing/guards; the JSON additionally carries the
-- Stage B metrics and the referent graph summaries (witness samples).
runStageB :: String -> Int -> [(Grid,Grid)] -> IO Outcome
runStageB cfgName=runConfigured (maybe (error ("unknown Stage B configuration "++cfgName)) id (SB.configByNameB cfgName)) True
runConfigured :: F.Config -> Bool -> Int -> [(Grid,Grid)] -> IO Outcome
runConfigured conf stageB ms pairs=settle <$> timed ms (do
  let f=F.frontSearch F.SafeOnline conf pairs
  _<-evaluate (length (show f))
  let g=F.graph f
      m k=F.metric k g
      o=case F.program f of
        Just p | trainExactOn pairs (F.runProgram p)->Outcome "train_exact" "None" (Just (show p)) (m "search_work") (F.counters g) []
               | otherwise->Outcome "no_solution" ("program returned but not train-exact: "++F.failure f) (Just (show p)) (m "search_work") (F.counters g) []
        Nothing->Outcome (if frontUnsupported (F.failure f) then "unsupported" else "no_solution") (F.failure f) Nothing (m "search_work") (F.counters g) []
  _<-evaluate (length (oStatus o)+length (oDetail o)+maybe 0 length (oProgram o)+oWork o)
  statsOn<-getRTSStatsEnabled
  mem<-if statsOn then (\st->[("rts_max_live_bytes",show (max_live_bytes st)),("rts_max_mem_in_use_bytes",show (max_mem_in_use_bytes st))]) <$> getRTSStats
       else pure [("rts_max_live_bytes","null"),("rts_max_mem_in_use_bytes","null")]
  pure o {oExtra=[("trace_lines",show (length (F.trace g))),("semantic_classes",show (length (F.classes g)))
    ,("failure_stage",jsonString (SA.failureStage (F.failure f)))
    ,("size_rule_exact",boolJSON (m "size_rule_exact">0)),("canvas_changed",boolJSON (any (\(x,y)->dimensions x/=dimensions y) pairs))
    ,("grid_realization_ok",boolJSON (m "grid_realization_ok">0)),("grid_realizations_attempted",show (m "grid_realizations_attempted"))
    ,("realization_render_errors",show (m "realization_render_errors")),("realization_mismatches",show (m "realization_mismatches"))
    ,("size_rule",SA.sizeRuleJSON g (F.program f))
    ,("typed_holes",objectJSON [(k,show (m k)) | k<-words "typed_hole_slots_triggered typed_hole_templates typed_hole_evaluations typed_hole_fits typed_hole_constant_fits typed_hole_feature_fits typed_hole_truncations"])
    ,("hole_bindings",arrayJSON (maybe [] (map jsonString . SA.typedBindings) (F.program f)))
    ,("typed_slot_features",SA.stageAFeaturesJSON g)
    ,("semantic_classes_detail",arrayJSON [objectJSON [("slot",jsonString (F.scSlotName c)),("representatives",arrayJSON (map jsonString (F.scRepTexts c))),("selected",jsonString (F.scSelectedText c))] | c<-F.classes g])
    ,("memory_note",jsonString "RTS max_live_bytes / max_mem_in_use_bytes are process-wide maxima (requires +RTS -T); not a per-search peak")]
    ++(if stageB then [("stage_b",SB.stageBMetricsJSON g),("referents",SB.referentsJSON g)] else [])++mem})
runV04 :: Int -> [(Grid,Grid)] -> IO Outcome
runV04 ms pairs=settle <$> timed ms (do
  let f=V4.frontSearch V4.Full v04Config pairs
  _<-evaluate (length (show f))
  let g=V4.graph f
      o=case V4.frontProgram f of
        Just p | trainExactOn pairs (V4.runProgram p)->Outcome "train_exact" "None" (Just (show p)) (V4.metric "search_work" g) (V4.counters g) []
               | otherwise->Outcome "no_solution" ("program returned but not train-exact: "++V4.frontFailure f) (Just (show p)) (V4.metric "search_work" g) (V4.counters g) []
        Nothing->Outcome (if v04Unsupported (V4.frontFailure f) then "unsupported" else "no_solution") (V4.frontFailure f) Nothing (V4.metric "search_work" g) (V4.counters g) []
  _<-evaluate (length (oStatus o)+length (oDetail o)+maybe 0 length (oProgram o)+oWork o)
  pure o {oExtra=[("optimal_within_graph",boolJSON (V4.optimalWithinGraph f))]})

runR2 :: Int -> [(Grid,Grid)] -> IO Outcome
runR2 ms pairs=settle <$> timed ms (do
  r<-R2.inducedSearch R2.Full r2Config pairs
  let train=maybe False (\p->trainExactOn pairs (R2.predictInduced r2Config p)) (R2.inducedProgram r)
      prog=fmap exprText (R2.inducedProgram r)
      work=M.findWithDefault 0 "total_expanded_work" (R2.inducedMetrics r)
      o=case R2.inducedProgram r of
        Just _ | train->Outcome "train_exact" "None" prog work (R2.inducedMetrics r) []
               | otherwise->Outcome "no_solution" ("program returned but not train-exact: "++R2.inducedFailure r) prog work (R2.inducedMetrics r) []
        Nothing->Outcome (if R2.inducedFailure r=="empty training specification" then "unsupported" else "no_solution") (R2.inducedFailure r) Nothing work (R2.inducedMetrics r) []
  _<-evaluate (length (oStatus o)+length (oDetail o)+maybe 0 length (oProgram o)+oWork o+length (show (oCounters o))+length (R2.inducedFailureEvidence r))
  pure o {oExtra=[("failure_evidence",jsonString (take 4000 (R2.inducedFailureEvidence r))),("bounded",boolJSON (R2.inducedBounded r))
                 ,("portfolio_count",show (length (R2.inducedPortfolio r))),("inventions",show (length (R2.inducedInventions r)))
                 ,("internal_seconds",show (R2.inducedSeconds r)),("trace_lines",show (length (R2.inducedTrace r)))]})

-- Cheap structural facts about the training pairs (no search involved).
diagnostics :: [(Grid,Grid)] -> IO String
diagnostics pairs=do
  let enc=R2.inducedEncoder r2Config
      dims g=let Dimensions w h=dimensions g in arrayJSON [show w,show h]
      cnt g=length (O.objects (encode enc g))
      d=objectJSON [("train_pairs",show (length pairs))
        ,("input_dims",arrayJSON [dims x | (x,_)<-pairs]),("output_dims",arrayJSON [dims y | (_,y)<-pairs])
        ,("same_canvas",boolJSON (all (\(x,y)->dimensions x==dimensions y) pairs))
        ,("input_object_counts",arrayJSON [show (cnt x) | (x,_)<-pairs]),("output_object_counts",arrayJSON [show (cnt y) | (_,y)<-pairs])
        ,("equal_object_counts",boolJSON (all (\(x,y)->cnt x==cnt y) pairs))]
  r<-try (evaluate (length d)) :: IO (Either SomeException Int)
  pure (either (\e->objectJSON [("error",jsonString (take 500 (show e)))]) (const d) r)

configText :: Stage -> String
configText FeatureStage=show frontConfig
configText FeatureV04Stage=show v04Config
configText R2Stage=show r2Config
configText (StageAStage c)=maybe "unknown" show (SA.configByName c)
configText (StageBStage c)=maybe "unknown" show (SB.configByNameB c)

runStage :: Stage -> FilePath -> FilePath -> Int -> IO ()
runStage stage taskPath out ms=do
  createDirectoryIfMissing True out
  let file=out </> (stageName stage++".json")
      base status detail extra seconds=objectJSON ([("stage",jsonString (stageName stage)),("task_file",jsonString taskPath)
        ,("status",jsonString status),("detail",jsonString detail),("train_exact",boolJSON (status=="train_exact"))
        ,("timed_out",boolJSON (status=="timeout")),("timeout_ms",show ms),("wall_clock_seconds",show seconds)
        ,("config",jsonString (configText stage))]++extra)++"\n"
  let rename t=t {taskId=takeBaseName taskPath}
  loaded<-try (fmap (fmap rename) (loadTask taskPath)) :: IO (Either SomeException (Either String Task))
  case loaded of
    Left e->writeFile file (base "unsupported" ("task file unreadable: "++take 500 (show e)) [("task",jsonString (takeBaseName taskPath))] (0::Double))
    Right (Left err)->writeFile file (base "unsupported" ("task file rejected by parser: "++err) [("task",jsonString (takeBaseName taskPath))] (0::Double))
    Right (Right task)
      | not (null (tests task))->do
          writeFile file (base "refused_test_pairs" "leak guard: task file contains test pairs; stages accept train-only files" [("task",jsonString (taskId task))] (0::Double))
          exitWith (ExitFailure 3)
      | otherwise->do
          let pairs=training task
          diag<-diagnostics pairs
          start<-getMonotonicTimeNSec
          o<-case stage of FeatureStage->runFeature ms pairs; FeatureV04Stage->runV04 ms pairs; R2Stage->runR2 ms pairs; StageAStage c->runStageA c ms pairs; StageBStage c->runStageB c ms pairs
          end<-getMonotonicTimeNSec
          let seconds=fromIntegral (end-start)/1e9 :: Double
          writeFile file (base (oStatus o) (oDetail o)
            ([("task",jsonString (taskId task)),("program",maybe "null" jsonString (oProgram o)),("search_work",show (oWork o))
             ,("counters",objectJSON [(k,show v) | (k,v)<-M.toAscList (oCounters o)]),("diagnostics",diag)]++oExtra o) seconds)
          -- Every outcome (including runtime_error) is a normal exit with the
          -- status in the JSON; only the leak guard uses a non-zero exit code.
          putStrLn (taskId task++" "++stageName stage++" "++oStatus o++" work="++show (oWork o)++" seconds="++show seconds++" "++take 120 (oDetail o))
