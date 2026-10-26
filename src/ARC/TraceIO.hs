{-# LANGUAGE ScopedTypeVariables #-}
-- Single-IO search trace driver and read-only candidate replay.
--
--   trace-io      runs the unchanged front-end search (FrontSearch SafeOnline,
--                 a named Stage D configuration with D+ diagnostics on) on
--                 either every training pair (inspect-pair) or one training
--                 pair (solve-single-pair), and writes the JSONL event sink,
--                 the solver record, the grids and the witnesses. In
--                 solve-single-pair the found program is evaluated on the
--                 remaining training pairs only AFTER the search returned;
--                 that post-hoc result never reaches the search.
--   trace-replay  decodes saved candidate ASTs (structured JSON), re-checks
--                 every parameter with checkedParam, and executes them with the
--                 real executor/renderer on saved training inputs. It never
--                 runs a search.
--
-- Leak guard as in ARC.ArcTrainOnly: a task file with test pairs is refused
-- (exit code 3) before anything runs.
module ARC.TraceIO (runTraceIO, runTraceReplay) where
import ARC.Dataset
import qualified Synthesis.Collection.Front as F
import qualified Synthesis.Collection.Diagnostics as DG
import Synthesis.Collection.Diagnostics (jstr, jobj, jarr, jbool, jmaybe)
import Synthesis.Collection.Relation
import Synthesis.Collection.Parameter
import Synthesis.Collection.Typed (TExpr(..), TVal(..), TOp(..), opName)
import Synthesis.Collection.Shape (applyDiagonalView, maskCells, DiagonalChain(..), DiagonalRejection(..))
import Synthesis.Collection.Unified (StageD(..))
import Synthesis.Collection.ContentFirst (planJSON, OutputSpec, ContentFirstPlan(..), SelectionPlan(..), SelectionMode(..), ContentConstruction(..), deriveOutputSpec, renderOutputSpec, specEmitted, specWitnessJSON, planText)
import Latent.Encode (encoderBackground)
import qualified ARC.StageAEvaluate as SA
import qualified ARC.StageBEvaluate as SB
import qualified ARC.StageCEvaluate as SC
import qualified ARC.StageDEvaluate as SD
import qualified ARC.ContentFirstEvaluate as CFE
import qualified Synthesis.Triggered as V4
import qualified Synthesis.InducedR2.Learn as R2
import Latent.Grid
import Latent.Encode (encode, EncoderConfig)
import Latent.Render (render)
import qualified Latent.Object as O
import qualified Data.Map.Strict as M
import qualified Data.Set as S
import Control.Exception (SomeException, AsyncException(..), try, evaluate, fromException)
import Control.Monad (forM, when, unless)
import System.Timeout (timeout)
import GHC.Clock (getMonotonicTimeNSec)
import GHC.Stats (getRTSStatsEnabled, getRTSStats, RTSStats(..))
import System.Directory (createDirectoryIfMissing)
import System.FilePath ((</>), takeBaseName)
import System.Exit (exitWith, ExitCode(..))
import System.IO (hPutStrLn, stderr)
import Debug.Trace (traceEventIO)
import Text.Read (readMaybe)
import Data.List (isPrefixOf)
import Data.Maybe (isJust)

levelOf :: String -> Maybe Int
levelOf s=lookup s [("summary",DG.levelSummary),("branches",DG.levelBranches),("candidates",DG.levelCandidates),("full",DG.levelFull)]

encoderOf :: F.Config -> EncoderConfig
encoderOf conf=R2.inducedEncoder (V4.r2Config (F.legacyConfig conf))
-- The scene exactly as the search encodes an input (encoder, diagonal view,
-- enumeration permutation; see Front.frontSearch).
sceneOf :: F.Config -> Grid -> (O.Scene,[DiagonalChain],[DiagonalRejection])
sceneOf conf g=
  let s0=encode (encoderOf conf) g
      (s1,ch,rj)=if F.scDiagonalView (F.stageC conf) then let (os,c,r)=applyDiagonalView (O.objects s0) in (s0 {O.objects=os},c,r) else (s0,[],[])
  in (s1 {O.objects=F.permuteObjects (F.enumerationSeed conf) (O.objects s1)},ch,rj)

gridJ :: Grid -> String
gridJ g=jarr [jarr (map show r) | r<-rows g]
dimsJ :: Dimensions -> String
dimsJ (Dimensions w h)=jarr [show w,show h]
objectFullJ :: O.Object -> String
objectFullJ o=jobj [("id",show (O.objectId o)),("color",jmaybe show (O.color o)),("colors",show (S.toList (O.colors o)))
  ,("bbox",jarr (map show [cx (O.position o),cy (O.position o),O.width o,O.height o])),("size_sig",jarr [show (O.width o),show (O.height o)])
  ,("pixel_count",show (O.size o)),("mask",jarr [jarr [show x,show y] | (x,y)<-maskCells (objMask o)])
  ,("mask_hash",jstr (DG.stableHash (show (maskCells (objMask o)))))
  ,("pixels",jarr [jarr [show (cx p),show (cy p),show c] | (p,c)<-O.absolutePixels o])]
emissionJ :: EmittedObject -> String
emissionJ e=jobj [("sources",show (eoSources e)),("origin",jstr (eoOrigin e)),("object",objectFullJ (eoObject e))]
diffJ :: Grid -> Grid -> [(String,String)]
diffJ g t=case gridDiffCount g t of
  Nothing->[("dims_match","false"),("diff_cells","null"),("diff_coords","null")]
  Just n->[("dims_match","true"),("diff_cells",show n)
          ,("diff_coords",jarr [jarr [show x,show y] | (y,(ra,rb))<-zip [0::Int ..] (zip (rows g) (rows t)),(x,(a,b))<-zip [0::Int ..] (zip ra rb),a/=b])]

data Opts = Opts { oTask, oMode, oConfig :: String, oPair, oLevel, oMs, oMaxEvents, oMaxBytes, oSample :: Int, oPosthoc :: Bool }

failRun :: FilePath -> Int -> String -> IO a
failRun out code msg=do
  createDirectoryIfMissing True out
  writeFile (out </> "trace_io_error.json") (jobj [("error",jstr msg),("exit_code",show code)]++"\n")
  hPutStrLn stderr ("trace-io: "++msg)
  exitWith (ExitFailure code)

validGrid :: Grid -> Maybe String
validGrid g=let Dimensions w h=dimensions g in if w<1 || h<1 || w>30 || h>30 then Just ("grid size "++show (w,h)++" outside ARC 1..30") else Nothing

runTraceIO :: (String -> String -> String) -> IO ()
runTraceIO opt=do
  let num k d=maybe d id (readMaybe (opt k (show d)))
      out=opt "--out" ""
  when (null out) (hPutStrLn stderr "trace-io: --out is required" >> exitWith (ExitFailure 2))
  level<-maybe (failRun out 2 "--trace-level must be summary|branches|candidates|full") pure (levelOf (opt "--trace-level" "candidates"))
  let o=Opts (opt "--task" "") (opt "--mode" "inspect-pair") (opt "--config" "FullD") (num "--pair-index" 0) level (num "--timeout-ms" 300000)
            (num "--max-events" 250000) (num "--max-bytes" 268435456) (max 1 (num "--sample-candidates" 1)) (opt "--posthoc" "on"/="off")
  when (null (oTask o)) (failRun out 2 "--task is required")
  unless (oMode o `elem` ["inspect-pair","solve-single-pair"]) (failRun out 2 ("unknown --mode "++oMode o++" (inspect-pair|solve-single-pair)"))
  conf0<-maybe (failRun out 2 ("unknown Stage D configuration "++oConfig o)) pure (SD.configByNameD (oConfig o))
  loaded<-try (loadTask (oTask o)) :: IO (Either SomeException (Either String Task))
  task<-case loaded of
    Left e->failRun out 2 ("task file unreadable: "++take 300 (show e))
    Right (Left e)->failRun out 2 ("task file rejected by parser: "++e)
    Right (Right t)->pure t {taskId=takeBaseName (oTask o)}
  unless (null (tests task)) (failRun out 3 "leak guard: task file contains test pairs; trace-io accepts train-only files (test: [])")
  let pairs=training task
      k=oPair o
  when (k<0 || k>=length pairs) (failRun out 2 ("--pair-index "++show k++" out of range: task has "++show (length pairs)++" training pairs (0.."++show (length pairs-1)++")"))
  case [(i,e) | (i,(x,y))<-zip [0::Int ..] pairs,Just e<-[validGrid x,validGrid y]] of
    (i,e):_->failRun out 2 ("training pair "++show i++": "++e)
    []->pure ()
  createDirectoryIfMissing True out
  let single=oMode o=="solve-single-pair"
      used=if single then [k] else [0..length pairs-1]
      searchPairs=[pairs!!i | i<-used]
      forced=not (sdDiagnostics (F.stageD conf0))
      conf=conf0 {F.stageD=(F.stageD conf0) {sdDiagnostics=True}}
      meta=[("task_id",jstr (taskId task)),("task_file",jstr (oTask o)),("mode",jstr (oMode o)),("pair_index",show k),("pairs_used_in_search",show used)
           ,("train_pairs_in_task",show (length pairs)),("config",jstr (oConfig o)),("diagnostics_forced_on",jbool forced)
           ,("trace_level",show (oLevel o)),("timeout_ms",show (oMs o))]
  writeFile (out </> "run_status.json") (jobj (("state",jstr "running"):meta)++"\n")
  opened<-DG.configureTrace (DG.TraceSettings (oLevel o) (Just (out </> "search_events.jsonl")) (oMaxEvents o) (oMaxBytes o) (oSample o))
  either (failRun out 4) pure opened
  DG.resetDiagnostics
  DG.traceRecord (("scope",jstr "Run"):("kind",jstr "entered"):("branch_id",jstr "task"):("parent_branch_id","null"):meta)
  start<-getMonotonicTimeNSec
  result<-try (timeout (oMs o*1000) (do
    traceEventIO "latis-search-start"
    let f=F.frontSearch F.SafeOnline conf searchPairs
    _<-evaluate (length (show f))
    traceEventIO "latis-search-end"
    pure f)) :: IO (Either SomeException (Maybe F.Front))
  end<-getMonotonicTimeNSec
  let seconds=fromIntegral (end-start)/1e9 :: Double
      exactLabel=if single then "pair_exact" else "train_exact"
      (status,detail,front)=case result of
        Right (Just f)->case F.program f of
          Just p | all (\(x,y)->F.runProgram p x==Right y) searchPairs->(exactLabel,"None",Just f)
                 | otherwise->("no_solution","program returned but not exact on the search pairs: "++F.failure f,Just f)
          Nothing->(if any (`isPrefixOf` F.failure f) ["layout:","grounding:"] then "unsupported" else "no_solution",F.failure f,Just f)
        Right Nothing->("timeout","wall-clock timeout",Nothing)
        Left e->("runtime_error",case fromException e of
          Just HeapOverflow->"heap overflow (RTS -M limit)"
          Just StackOverflow->"stack overflow"
          _->take 2000 (show e),Nothing)
      program=front >>= F.program
      g=fmap F.graph front
      m key=maybe 0 (F.metric key) g
  diagCost<-DG.diagnosticStats
  statsOn<-getRTSStatsEnabled
  mem<-if statsOn then (\st->[("rts_max_live_bytes",show (max_live_bytes st)),("rts_max_mem_in_use_bytes",show (max_mem_in_use_bytes st))]) <$> getRTSStats
       else pure [("rts_max_live_bytes","null"),("rts_max_mem_in_use_bytes","null")]
  DG.traceRecord [("scope",jstr "Run"),("kind",jstr "terminal"),("branch_id",jstr "task"),("outcome",jstr status),("reason",jstr detail)
    ,("search_work",if isJust front then show (m "search_work") else "null"),("first_solution_work",if isJust program then show (m "first_solution_work") else "null")
    ,("wall_seconds",show seconds),("label_scope",jstr (if single then "single training pair only (never ARC solved)" else "all training pairs"))]
  -- Post-hoc, read-only: the program is fixed; nothing here reaches the search.
  posthoc<-if not single || not (oPosthoc o) then pure "null" else case program of
    Nothing->pure (jobj [("performed",jbool False),("reason",jstr "no pair_exact program")])
    Just p->do
      rs<-forM [(j,pairs!!j) | j<-[0..length pairs-1],j/=k] $ \(j,(x,y))->do
        r<-try (evaluate (F.runProgram p x)) :: IO (Either SomeException (Either String Grid))
        pure $ case r of
          Left e->jobj [("pair_index",show j),("outcome",jstr "runtime_error"),("reason",jstr (take 300 (show e)))]
          Right (Left e)->jobj [("pair_index",show j),("outcome",jstr "execution_failed"),("reason",jstr e)]
          Right (Right gr)->jobj ([("pair_index",show j),("outcome",jstr (if gr==y then "match" else "mismatch")),("predicted",gridJ gr)]++diffJ gr y)
      let matches=length [() | (j,(x,y))<-zip [0::Int ..] pairs,j/=k,F.runProgram p x==Right y]
      pure (jobj [("performed",jbool True),("used_in_search",jbool False),("used_for_ranking_or_selection",jbool False)
        ,("note",jstr "evaluated after the single-pair search returned; reported separately from pair_exact; not train_exact")
        ,("other_pairs",show (length pairs-1)),("matching_other_pairs",show matches),("all_other_pairs_match",jbool (matches==length pairs-1)),("pairs",jarr rs)])
  sinkStats<-DG.closeTrace
  writeFile (out </> "trace_sink.json") (sinkStats++"\n")
  let transformAst=case program >>= F.progTransform of Just t->transformJSON t; Nothing->"null"
      record=jobj (meta++
        [("status",jstr status),("result_label",jstr status),("exact_scope",jstr (if single then "pair_exact: the single selected training pair only" else "train_exact: every training pair"))
        ,("detail",jstr detail),("wall_clock_seconds",show seconds)
        ,("program",jmaybe (jstr . show) program),("program_kind",jstr (case program of Nothing->"none"; Just p->if isJust (F.progContentFirst p) then "content_first_output_spec" else if isJust (F.progTransform p) then "object_transform" else "ordered_sequence_body"))
        ,("content_first_plan",jmaybe planJSON (program >>= F.progContentFirst))
        ,("program_transform_ast",transformAst),("program_transform_id",maybe "null" (jstr . DG.stableHash . show) (program >>= F.progTransform))
        ,("search_work",if isJust front then show (m "search_work") else "null")
        ,("counters",case g of Just gr->jobj [(key,show v) | (key,v)<-M.toAscList (F.counters gr)]; Nothing->"null")
        ,("posthoc_validation",posthoc),("diagnostic_overhead",diagCost),("trace_sink",sinkStats),("config_text",jstr (show conf))]
        ++mem++case (front,g) of
          (Just f,Just gr)->
            [("failure_stage",jstr (SA.failureStage (F.failure f))),("size_rule",SA.sizeRuleJSON gr program)
            ,("hole_bindings",jarr (maybe [] (map jstr . SA.typedBindings) program))
            ,("stage_b",SB.stageBMetricsJSON gr),("stage_c",SC.stageCMetricsJSON gr),("relations",SC.relationsJSON gr),("shapes",SC.shapesJSON gr)
            ,("stage_d",SD.stageDMetricsJSON gr),("parameter_goals",SD.goalsJSON gr)
            ,("content_first",CFE.contentFirstJSON searchPairs gr program)
            ,("trace_lines",jarr (map jstr (F.trace gr)))]
          _->[("failure_stage","null"),("size_rule","null"),("stage_d","null"),("parameter_goals","[]"),("content_first","null"),("trace_lines","[]")])
  writeFile (out </> "solver_record.json") (record++"\n")
  -- Grids and encodings; Predicted only where the selected program executed.
  gridsOut<-forM (zip [0::Int ..] pairs) $ \(j,(x,y))->do
    let (sx,chains,rejs)=sceneOf conf x
        (sy,_,_)=sceneOf conf y
        plain=encode (encoderOf conf) x
        inSearch=j `elem` used
    predicted<-case program of
      Nothing->pure (jobj [("available",jbool False),("reason",jstr (if status=="timeout" then "search timed out before a program existed" else "no program was found; nothing was rendered"))])
      Just p->do
        r<-try (evaluate (F.runProgramEvidence p x)) :: IO (Either SomeException (Either String ([EmittedObject],RenderWitness)))
        pure $ case r of
          Left e->jobj [("available",jbool False),("reason",jstr ("runtime error: "++take 300 (show e)))]
          Right (Left e)->jobj [("available",jbool False),("reason",jstr ("execution failed: "++e))]
          Right (Right (es,rw))->jobj ([("available",jbool True),("source",jstr (if inSearch then "selected program, same executor as search (runProgramEvidence)" else "post-hoc execution on a pair NOT used in the search"))
            ,("used_in_search",jbool inSearch),("grid",gridJ (renderResult rw)),("emitted_objects",jarr (map emissionJ es))
            ,("reencoded_objects",jarr (map objectFullJ (O.objects (encode (encoderOf conf) (renderResult rw)))))
            ,("render_witness_valid",jbool (verifyRenderWitness (dimensions (renderResult rw)) (O.background sx) es rw))]++diffJ (renderResult rw) y)
    pure (jobj [("pair_index",show j),("used_in_search",jbool inSearch),("case_index",maybe "null" show (lookup j (zip used [0::Int ..])))
      ,("input",gridJ x),("output",gridJ y),("input_dims",dimsJ (dimensions x)),("output_dims",dimsJ (dimensions y))
      ,("encoding",jobj [("encoder",jstr (show (encoderOf conf))),("background",show (O.background sx)),("connectivity_objects",jarr (map objectFullJ (O.objects plain)))
         ,("diagonal_view_enabled",jbool (F.scDiagonalView (F.stageC conf))),("search_objects",jarr (map objectFullJ (O.objects sx)))
         ,("diagonal_chains",jarr [jobj [("color",show (dcColor c)),("pixels",jarr [jarr [show (cx p),show (cy p)] | p<-dcPixels c]),("sources",show (dcSources c))] | c<-chains])
         ,("diagonal_rejections",jarr [jobj [("color",show (drColor r)),("reason",jstr (drReason r))] | r<-rejs])])
      ,("output_encoding",jobj [("search_objects",jarr (map objectFullJ (O.objects sy))),("note",jstr "training target encoding; never a program input")])
      ,("predicted",predicted)])
  writeFile (out </> "grids.json") (jobj (meta++[("pairs",jarr gridsOut)])++"\n")
  witnesses<-try (evaluate (let w=SD.witnessesJSON searchPairs program in length w `seq` w)) :: IO (Either SomeException String)
  writeFile (out </> "witnesses.json") (jobj (meta++[("search_pair_indices",show used),("execution_witnesses",either (\e->jobj [("error",jstr (take 300 (show e)))]) id witnesses)
    ,("relations",maybe "[]" SC.relationsJSON g),("parameter_goals",maybe "[]" SD.goalsJSON g)])++"\n")
  writeFile (out </> "run_status.json") (jobj (("state",jstr "completed"):("status",jstr status):meta)++"\n")
  putStrLn (taskId task++" trace-io "++oMode o++" pair="++show k++" "++status++" work="++show (m "search_work")++" seconds="++show seconds++" "++take 160 detail)

-- ---------------------------------------------------------------------------
-- Replay: structured AST -> ObjectTransform (checked), real execution.

decodeTransform :: JSON -> Either String ObjectTransform
decodeTransform j=do
  sel<-field "selector" j >>= decodeSelector
  others<-field "others" j >>= str >>= \s->case s of "DropOthers"->Right DropOthers; "KeepOthers"->Right KeepOthers; _->Left ("unknown others "++s)
  body<-field "body" j >>= decodeBody
  Right (ObjectTransform sel others body)
-- Content-first plan AST (planJSON): {"kind":"ContentFirst","selection":{"mode","selector"},"construction"}.
decodeContentFirst :: JSON -> Either String ContentFirstPlan
decodeContentFirst j=do
  selection<-field "selection" j
  mode<-field "mode" selection >>= str >>= \m->case m of "SelectUnique"->Right SelectUnique; "SelectNonEmpty"->Right SelectNonEmpty; _->Left ("unknown selection mode "++m)
  sel<-field "selector" selection >>= decodeSelector
  construction<-field "construction" j >>= str >>= \c->case c of "CropInputWindow"->Right CropInputWindow; "EmitSelectedWithOwnCanvas"->Right EmitSelectedWithOwnCanvas; _->Left ("unknown construction "++c)
  Right (ContentFirstPlan (SelectionPlan mode sel) construction)
isContentFirstAst :: JSON -> Bool
isContentFirstAst j=either (const False) (=="ContentFirst") (field "kind" j >>= str)
str :: JSON -> Either String String
str (JString s)=Right s
str _=Left "expected JSON string"
kindOf :: JSON -> Either String String
kindOf j=field "kind" j >>= str
intF :: String -> JSON -> Either String Int
intF k j=field k j >>= asInt
decodeSelector :: JSON -> Either String Selector
decodeSelector j=kindOf j >>= \k->case k of
  "AllObjects"->Right AllObjects
  "FilterBy"->FilterBy <$> (field "pred" j >>= decodePred)
  _->Left ("unknown selector "++k)
decodePred :: JSON -> Either String Pred
decodePred j=kindOf j >>= \k->case k of
  "ColorIs"->ColorIs <$> intF "color" j
  "NotP"->NotP <$> (field "pred" j >>= decodePred)
  _->maybe (Left ("unknown predicate "++k)) Right (lookup k [(show p,p) | p<-[IsMaxArea,IsMinArea,IsRect,IsSquare,IsShell,IsDiagonal,IsTriangle,ColorMostFrequent,ColorLeastFrequent]])
decodePer :: JSON -> Either String PerObject
decodePer j=kindOf j >>= \k->case k of
  "Keep"->Right Keep
  "FillBBox"->Right FillBBox
  "RecolorTo"->RecolorTo <$> intF "color" j
  "Hollow"->Hollow <$> intF "thickness" j
  "Replicate"->Replicate <$> (field "count" j >>= decodeCount) <*> (field "offset" j >>= decodeOffset)
  _->Left ("unknown per-object body "++k)
decodeCount :: JSON -> Either String CountExpr
decodeCount j=kindOf j >>= \k->case k of
  "KConst"->KConst <$> intF "n" j
  "KCountObjects"->Right KCountObjects
  "KCountColors"->Right KCountColors
  "KFitAcross"->KFitAcross <$> intF "gap" j
  "KFitDown"->KFitDown <$> intF "gap" j
  _->Left ("unknown count "++k)
decodeOffset :: JSON -> Either String OffsetExpr
decodeOffset j=do
  k<-kindOf j; g<-intF "gap" j
  maybe (Left ("unknown offset "++k)) (\c->Right (c g)) (lookup k [("StepRight",StepRight),("StepDown",StepDown),("StepLeft",StepLeft),("StepUp",StepUp),("StepDiagonal",StepDiagonal)])
decodeMerge :: String -> Either String MergeMode
decodeMerge "MergeUnion"=Right MergeUnion
decodeMerge "MergeFillBBox"=Right MergeFillBBox
decodeMerge s=Left ("unknown merge mode "++s)
decodeBody :: JSON -> Either String TBody
decodeBody j=kindOf j >>= \k->case k of
  "MapEach"->MapEach <$> (field "per_object" j >>= decodePer)
  "MergeSelected"->field "mode" j >>= str >>= fmap MergeSelected . decodeMerge
  "CropSelected"->Right CropSelected
  "Pipeline"->Pipeline <$> (field "steps" j >>= asArray >>= traverse decodeStep)
  "MigratedBody"->MigratedBody <$> (field "legacy" j >>= decodeBody) <*> (field "steps" j >>= asArray >>= traverse decodeStep)
  _->Left ("unknown body "++k)
decodeStep :: JSON -> Either String TransformStep
decodeStep j=do
  op<-field "op" j >>= str
  let params=field "params" j >>= asArray >>= traverse decodeParam
  case op of
    "MapPosition"->params >>= \ps->case ps of [x,y]->Right (MapPosition x y); _->Left "MapPosition arity"
    "MapColor"->params >>= \ps->case ps of [c]->Right (MapColor c); _->Left "MapColor arity"
    "Copies"->params >>= \ps->case ps of [n,x,y]->Right (Copies n x y); _->Left "Copies arity"
    "LegacyStep"->LegacyStep <$> (field "per_object" j >>= decodePer)
    "SetMerge"->field "mode" j >>= str >>= fmap SetMerge . decodeMerge
    "SetCrop"->Right SetCrop
    _->Left ("unknown step "++op)
-- Every decoded parameter passes the solver's own structural type check.
decodeParam :: JSON -> Either String Param
decodeParam j=do
  r<-field "refinement" j >>= str
  ref<-maybe (Left ("unknown refinement "++r)) Right (lookup r [(show x,x) | x<-[IntegerParam,PositiveCount,ArcColor,BooleanParam]])
  e<-field "expr" j >>= decodeExpr
  either (\err->Left ("checkedParam rejected decoded parameter: "++err)) Right (checkedParam ref e)
decodeExpr :: JSON -> Either String (TExpr ParamLeaf)
decodeExpr j@(JObject kv)
  | Just l<-lookup "leaf" kv=str l >>= \name->case name of
      "LegacyFitAcross"->TLeaf . LegacyFitAcross <$> intF "gap" j
      "LegacyFitDown"->TLeaf . LegacyFitDown <$> intF "gap" j
      _->maybe (Left ("unknown leaf "++name)) (Right . TLeaf) (lookup name [(show l',l') | l'<-leaves])
  | Just c<-lookup "const" kv=case c of JInt n->Right (TConst (VI n)); JBool b->Right (TConst (VB b)); _->Left "bad constant"
  | Just h<-lookup "hole" kv=THole <$> asInt h
  | Just o<-lookup "op" kv=do
      name<-str o
      op<-maybe (Left ("unknown operator "++name)) Right (lookup name [(opName x,x) | x<-[minBound..maxBound::TOp]])
      TApp op <$> (field "args" j >>= asArray >>= traverse decodeExpr)
  where leaves=[CurrentX,CurrentY,CurrentWidth,CurrentHeight,CurrentColor,InputWidth,InputHeight,WholeCount,WholeColors,SelectedCount
               ,OutputWidth,OutputHeight,WholeObjectColors,WholeMinX,WholeMinY,WholeMaxX,WholeMaxY,SelectedMinX,SelectedMinY,SelectedMaxX,SelectedMaxY]
decodeExpr _=Left "expression must be an object"

valueJ :: TVal -> String
valueJ (VI n)=show n
valueJ (VB b)=jbool b

replayOne :: F.Config -> [(Grid,Grid)] -> JSON -> IO String
replayOne conf pairs req=do
  let rid=either (const "null") jstr (field "request_id" req >>= str)
      cid=either (const "null") jstr (field "candidate_id" req >>= str)
  if either (const False) isContentFirstAst (field "ast" req) then replayContentFirst conf pairs req rid cid else
   case field "ast" req >>= decodeTransform of
    Left e->pure (jobj [("request_id",rid),("candidate_id",cid),("decode_ok","false"),("decode_error",jstr e),("verdict",jstr "unverifiable")])
    Right t->do
      cases<-either (const (pure [])) pure (field "pairs" req >>= asArray)
      results<-forM cases $ \c->do
        let pj=either (const (-1)) id (intF "pair_index" c)
            dimsE=field "output_dims" c >>= asArray >>= traverse asInt
        case (pj>=0 && pj<length pairs,dimsE) of
          (False,_)->pure (jobj [("pair_index",show pj),("outcome",jstr "unverifiable"),("reason",jstr "pair index outside the task")])
          (_,Right [w,h])->do
            let (x,y)=pairs!!pj
                (scene,_,_)=sceneOf conf x
                dims=Dimensions w h
                objs=O.objects scene
                pipeline=case otBody t of Pipeline _->True; MigratedBody _ _->True; _->False
            r<-try (evaluate (let v=runOne pipeline t scene dims objs in length (show v) `seq` v)) :: IO (Either SomeException (Either (String,String) (Maybe PipelineWitness,[EmittedObject],RenderWitness)))
            pure $ case r of
              Left e->jobj [("pair_index",show pj),("outcome",jstr "runtime_error"),("reason",jstr (take 300 (show e)))]
              Right (Left (stage,reason))->jobj [("pair_index",show pj),("outcome",jstr stage),("reason",jstr reason),("grid","null"),("grid_hash","null")]
              Right (Right (pw,es,rw))->
                let gr=renderResult rw
                in jobj ([("pair_index",show pj),("outcome",jstr (if gr==y then "exact" else "render_mismatch")),("reason",jstr "")
                  ,("grid",gridJ gr),("grid_hash",jstr (DG.stableHash (show (rows gr)))),("output_dims",dimsJ dims)
                  ,("steps",case pw of
                      Nothing->"null"
                      Just pwit->jarr [jobj [("ordinal",show (swStep s)),("input",jarr (map emissionJ (swInput s))),("output",jarr (map emissionJ (swOutput s)))
                        ,("bindings",jarr [jarr (map valueJ b) | b<-swBindings s])] | s<-pwSteps pwit])
                  ,("emitted_objects",jarr (map emissionJ es)),("reencoded_objects",jarr (map objectFullJ (O.objects (encode (encoderOf conf) gr))))
                  ,("render_witness_valid",jbool (verifyRenderWitness dims (O.background scene) es rw))
                  ,("input_objects",jarr (map objectFullJ objs))]++diffJ gr y)
          _->pure (jobj [("pair_index",show pj),("outcome",jstr "unverifiable"),("reason",jstr "output_dims missing")])
      pure (jobj [("request_id",rid),("candidate_id",cid),("decode_ok","true"),("decoded_id",jstr (DG.stableHash (show t))),("decoded_text",jstr (transformText t)),("cases",jarr results)])
  where
    runOne True t scene dims objs=do
      w<-either (\e->Left ("execution_invalid",e)) Right (executePipeline t (O.canvas scene) dims objs)
      rw<-either (\e->Left ("render_invalid",e)) Right (renderWitness dims (O.background scene) (pwEmitted w))
      Right (Just w,pwEmitted w,rw)
    runOne False t scene dims objs=do
      es<-either (\e->Left ("execution_invalid",e)) Right (emitObjects t dims objs)
      rw<-either (\e->Left ("render_invalid",e)) Right (renderWitness dims (O.background scene) es)
      _<-either (\e->Left ("render_invalid",e)) Right (render (O.Scene dims (O.background scene) (map eoObject es)))
      Right (Nothing,es,rw)

-- Content-first replay: the plan is executed on the saved training INPUT only
-- (selection -> bounds -> dimensions -> content); the target is compared
-- afterwards. output_dims of the request are ignored (they are derived).
replayContentFirst :: F.Config -> [(Grid,Grid)] -> JSON -> String -> String -> IO String
replayContentFirst conf pairs req rid cid=case field "ast" req >>= decodeContentFirst of
  Left e->pure (jobj [("request_id",rid),("candidate_id",cid),("decode_ok","false"),("decode_error",jstr e),("verdict",jstr "unverifiable")])
  Right plan->do
    cases<-either (const (pure [])) pure (field "pairs" req >>= asArray)
    let bg=encoderBackground (encoderOf conf)
    results<-forM cases $ \c->do
      let pj=either (const (-1)) id (intF "pair_index" c)
      if pj<0 || pj>=length pairs then pure (jobj [("pair_index",show pj),("outcome",jstr "unverifiable"),("reason",jstr "pair index outside the task")]) else do
        let (x,y)=pairs!!pj
            (scene,_,_)=sceneOf conf x
        r<-try (evaluate (let v=deriveOutputSpec plan bg x scene >>= \sp->fmap (\g->(sp,g)) (renderOutputSpec bg sp) in length (show v) `seq` v)) :: IO (Either SomeException (Either String (OutputSpec,Grid)))
        pure $ case r of
          Left e->jobj [("pair_index",show pj),("outcome",jstr "runtime_error"),("reason",jstr (take 300 (show e)))]
          Right (Left e)->jobj [("pair_index",show pj),("outcome",jstr (if "selection" `isPrefixOf` e then "selection_failed" else "execution_invalid")),("reason",jstr e),("grid","null"),("grid_hash","null")]
          Right (Right (sp,gr))->jobj ([("pair_index",show pj),("outcome",jstr (if gr==y then "exact" else "render_mismatch")),("reason",jstr "")
            ,("grid",gridJ gr),("grid_hash",jstr (DG.stableHash (show (rows gr)))),("output_dims",dimsJ (dimensions gr)),("output_dims_source",jstr "derived from the input-side selection (content-first)")
            ,("output_spec",specWitnessJSON sp),("emitted_objects",jarr (map emissionJ (specEmitted sp)))
            ,("reencoded_objects",jarr (map objectFullJ (O.objects (encode (encoderOf conf) gr))))
            ,("input_objects",jarr (map objectFullJ (O.objects scene)))]++diffJ gr y)
    pure (jobj [("request_id",rid),("candidate_id",cid),("decode_ok","true"),("decoded_id",jstr (DG.stableHash (show plan))),("decoded_text",jstr (planText plan)),("decoded_kind",jstr "ContentFirst"),("cases",jarr results)])

runTraceReplay :: (String -> String -> String) -> IO ()
runTraceReplay opt=do
  let out=opt "--out" ""
  when (null out) (hPutStrLn stderr "trace-replay: --out is required" >> exitWith (ExitFailure 2))
  conf<-maybe (hPutStrLn stderr "trace-replay: unknown --config" >> exitWith (ExitFailure 2)) pure (SD.configByNameD (opt "--config" "FullD"))
  task<-loadTask (opt "--task" "") >>= either (\e->hPutStrLn stderr ("trace-replay: "++e) >> exitWith (ExitFailure 2)) pure
  unless (null (tests task)) (hPutStrLn stderr "trace-replay: leak guard: test pairs present" >> exitWith (ExitFailure 3))
  source<-readFile (opt "--requests" "")
  reqs<-either (\e->hPutStrLn stderr ("trace-replay: requests: "++e) >> exitWith (ExitFailure 2)) pure (parseJSONText source >>= field "requests" >>= asArray)
  rs<-mapM (replayOne conf (training task)) reqs
  writeFile out (jobj [("replay_executor",jstr "Relation.executePipeline/emitObjects + renderWitness (no search)"),("encoder",jstr (show (encoderOf conf))),("results",jarr rs)]++"\n")
  putStrLn ("trace-replay: "++show (length rs)++" requests -> "++out)
