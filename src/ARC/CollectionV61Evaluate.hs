-- LATIS v0.6.1 experiment entry: SafeOnline reuse, abstraction-misleading
-- tasks, paired non-identifiable tasks and the seeded metamorphic battery.
-- The v0.6 entry (ARC.CollectionV6Evaluate) is unchanged in behaviour.
module ARC.CollectionV61Evaluate where
import Synthesis.Collection.Front
import Synthesis.Collection.Indexed
import Synthesis.Collection.Counterfactual
import qualified Synthesis.Triggered as V4
import qualified Synthesis.InducedR2.Learn as R2
import qualified ARC.InducedR2Evaluate as R2
import ARC.CollectionV6Evaluate (graphJSON, auditJSON, deferredJSON, stressTasks, Ob(..), rectOb, inputGrid, chainOutput, grid, placeOb)
import ARC.CollectionV61Generate
import ARC.Dataset
import ARC.Evaluate (jsonString)
import ARC.InducedR1Evaluate (objectJSON,arrayJSON,boolJSON)
import Latent.Grid
import Control.Exception (evaluate)
import Control.Monad (forM, forM_)
import GHC.Clock (getMonotonicTimeNSec)
import GHC.Stats (getRTSStatsEnabled, getRTSStats, RTSStats(..))
import qualified Data.Map.Strict as M
import System.Directory (createDirectoryIfMissing)
import System.FilePath ((</>))
import Data.List (intercalate, sort, sortOn)

v61Modes :: [Mode]
v61Modes=[SafeOnline,ExclusiveReuseLegacy,NoOnlineAbstraction,PostHocOnly,NoCounterfactual,NoIntensionalityPrior
  ,CollapseByTrainingDenotation,FixedAlignmentKeys,NoDependentIndex]
v61Config :: Config
v61Config=defaultConfig {reusePolicy=SafeReuse}

-- Abstraction-misleading and paired tasks (canvas 30x30, shared helpers).
-- Rule for G/H: the first item (by X) moves to (GridLeft,GridTop); every
-- following item is placed at x = PrevRight+2 and KEEPS ITS INPUT ROW.
stairChain :: [Ob] -> Grid
stairChain obs=grid (concat (go Nothing (sortOn obX obs)))
  where go _ []=[]
        go Nothing (o:os)=placeOb (0,0) o:go (Just (0,o)) os
        go (Just (x,p)) (o:os)=let q=(x+obW p+1,obY o) in placeOb q o:go (Just (fst q,o)) os
mkTask :: String -> [[Ob]] -> [Ob] -> ([Ob] -> Grid) -> Task
mkTask name train held out=Task name [(inputGrid obs,out obs) | obs<-train] [TestPair (inputGrid held) (Just (out held))]
misleadingTasks :: [(String,Task)]
misleadingTasks=
  -- G: training rows form a staircase (row k for rank k, heights 1), so the
  -- anchor pattern promoted on the x axis, Call(I_k)(AY,0) = PrevY+PrevH, also
  -- fits the following-AY slot. The residual grammar contains CurrentY, which
  -- the prior prefers once it is visible; the heldout rows are not a staircase.
  [("G-nonunique-reuse",mkTask "G-nonunique-reuse" [g1,g2] gH stairChain)
  -- H: the preferred Call branch fits case 1 (staircase) but not case 2.
  ,("H-partial-reuse",mkTask "H-partial-reuse" [g1,h2] gH stairChain)
  -- P: paired tasks with IDENTICAL training grids and different true rules.
  ,("P-gridleft",mkTask "P-gridleft" [p1,p2] pH (chainOutput obX))
  ,("P-currentx",mkTask "P-currentx" [p1,p2] pH chainFromCurrent)]
  where
    g1=[rectOb (3,5) 2 1 1,rectOb (8,1) 3 1 2,rectOb (14,2) 1 1 3]
    g2=[rectOb (2,6) 1 1 4,rectOb (6,1) 2 1 6,rectOb (11,2) 3 1 7,rectOb (17,3) 2 1 8]
    gH=[rectOb (4,5) 2 2 1,rectOb (9,2) 1 1 2,rectOb (13,7) 3 2 3,rectOb (19,3) 2 1 5]
    h2=[rectOb (2,6) 1 1 4,rectOb (6,3) 2 1 6,rectOb (11,8) 3 1 7]
    p1=[rectOb (0,24) 2 2 1,rectOb (5,25) 3 1 2,rectOb (11,23) 1 3 3]
    p2=[rectOb (0,20) 1 2 4,rectOb (4,25) 2 1 6,rectOb (9,22) 2 2 7,rectOb (15,25) 1 1 8]
    pH=[rectOb (3,25) 2 1 1,rectOb (8,24) 1 2 2,rectOb (13,23) 2 2 3,rectOb (20,25) 3 1 5,rectOb (26,25) 1 1 6]
    -- chain whose first item keeps its input x (CurrentX) and starts at row 0
    chainFromCurrent obs=grid (concat (go Nothing (sortOn obX obs)))
      where go _ []=[]
            go Nothing (o:os)=placeOb (obX o,0) o:go (Just (obX o,0,o)) os
            go (Just (x,y,p)) (o:os)=let q=(x+obW p,y+obH p) in placeOb q o:go (Just (fst q,snd q,o)) os
v61Tasks :: Task -> [(String,Task)]
v61Tasks vertical=stressTasks++misleadingTasks++[("03560426",vertical {taskId="03560426"})]
pairedHypotheses :: String -> Maybe (String,[(String,String)])
pairedHypotheses "P-gridleft"=Just ("Atom (SceneLow (Ax AX))",known)
pairedHypotheses "P-currentx"=Just ("Atom (Pos Current (Ax AX))",known)
pairedHypotheses _=Nothing
known :: [(String,String)]
known=[("GridLeft","Atom (SceneLow (Ax AX))"),("CurrentX","Atom (Pos Current (Ax AX))")]

median :: [Double] -> Double
median xs=let s=sort xs; n=length s in if n==0 then 0 else if odd n then s !! (n `div` 2) else (s !! (n `div` 2-1)+s !! (n `div` 2))/2
timeFront :: Int -> Mode -> Config -> [(Grid,Grid)] -> IO (Front,Double)
timeFront repeats mode conf pairs=do
  ts<-forM [1..max 1 repeats] $ \i->do
    start<-getMonotonicTimeNSec
    -- the input depends on the repeat index so GHC cannot share one thunk
    let f=frontSearch mode conf (if i<(0::Int) then [] else pairs)
    _<-evaluate (length (show f))
    end<-getMonotonicTimeNSec
    pure (fromIntegral (end-start)/1e9 :: Double)
  pure (frontSearch mode conf pairs,median ts)
memoryJSON :: IO String
memoryJSON=do
  enabled<-getRTSStatsEnabled
  if not enabled then pure (objectJSON [("rts_stats_enabled",boolJSON False),("note",jsonString "run with +RTS -T -RTS to record peak memory")])
    else do s<-getRTSStats
            pure (objectJSON [("rts_stats_enabled",boolJSON True),("max_live_bytes",show (max_live_bytes s)),("max_mem_in_use_bytes",show (max_mem_in_use_bytes s))
              ,("note",jsonString "process-wide maxima up to this point, not per-run")])

pairedJSON :: Task -> Graph -> Bool -> String
pairedJSON task g heldExact=case pairedHypotheses (taskId task) of
  Nothing->"null"
  Just (oracle,hyps)->
    let cls=[c | c<-classes g, scSlot c=="first-AX"]
        reps=concatMap scReps cls
        present=[(n,e) | (n,e)<-hyps, any ((==e) . show . repExpr) reps]
        sigOf e=[repCF r | r<-reps, show (repExpr r)==e]
        distinguished=length [() | (i,(_,a))<-zip [0::Int ..] hyps, (j,(_,b))<-zip [0..] hyps, i<j, sigOf a/=[] && sigOf b/=[] && sigOf a/=sigOf b]
        selected=case cls of c:_->show (scSelected c); []->"none"
    in objectJSON [("identifiability",jsonString "non_identifiable_from_train"),("paired_with",jsonString (if taskId task=="P-gridleft" then "P-currentx" else "P-gridleft"))
      ,("oracle_hypothesis",jsonString oracle),("oracle_in_candidate_set",boolJSON (any ((==oracle) . snd) present))
      ,("known_hypotheses",arrayJSON [objectJSON [("name",jsonString n),("expression",jsonString e),("survived",boolJSON (any ((==e) . snd) present))
          ,("counterfactual_signature",arrayJSON (concat [map (either jsonString show) s | s<-take 1 (sigOf e)]))
          ,("cost",case [repCost r | r<-reps, show (repExpr r)==e] of c:_->show (ccTotal c); []->"null")] | (n,e)<-hyps])
      ,("hypothesis_survival_recall",show (fromIntegral (length present)/fromIntegral (max 1 (length hyps)) :: Double))
      ,("counterfactual_distinguished_pairs",show distinguished),("selected_candidate",jsonString selected)
      ,("selected_program_accuracy",boolJSON heldExact)
      ,("note",jsonString "heldout output is used for scoring only; counterfactuals carry no targets")]

workJSON :: Graph -> String
workJSON g=objectJSON ([(k,show (metric k g)) | k<-words "first_solution_work total_work_to_exhaustion completion_work operator_applications refinement_expansions diagnostic_operator_applications call_attempts reuse_attempts reuse_hits deferred_candidates resumed_candidates resume_events resume_retries recovered_solutions reselected_after_completion exclusive_reuse_missed_candidates exclusive_reuse_missed_solutions alignment_candidates_remaining rank_reuse_witnesses_verified online_abstraction_reuses refinement_expansions_saved"]
  ++[("never_explored_due_to_early_success",jsonString ("alignment candidates remaining after success: "++show (metric "alignment_candidates_remaining" g)))])

csv61 :: [String]
csv61=words "search_work first_solution_work total_work_to_exhaustion completion_work operator_applications refinement_expansions call_attempts reuse_attempts reuse_hits deferred_candidates resumed_candidates resume_events recovered_solutions reselected_after_completion exclusive_reuse_missed_candidates exclusive_reuse_missed_solutions alignment_candidates_remaining online_abstractions_accepted online_abstraction_reuses refinement_expansions_saved semantic_classes representatives counterfactual_splits premature_collapses synthesized_keys_accepted ordering_ties_rejected alignment_witnesses rank_reuse_witnesses_verified ConcreteCrossItemEdgeCount_high_level UntriggeredExpansionCount expanded_frozen_features rejected_size_comparisons fallback_count"

runTask61 :: FilePath -> Int -> Mode -> Config -> Task -> IO String
runTask61 out repeats mode conf task=do
  createDirectoryIfMissing True out
  start<-getMonotonicTimeNSec
  (f,medianSeconds)<-timeFront repeats mode conf (training task)
  frontEnd<-getMonotonicTimeNSec
  old<-case program f of
    Just _->pure Nothing
    Nothing->Just <$> R2.inducedSearch R2.Full (V4.r2Config (legacyConfig conf)) (training task)
  end<-getMonotonicTimeNSec
  mem<-memoryJSON
  let predict x=case program f of
        Just p->runProgram p x
        Nothing->case old >>= R2.inducedProgram of
          Nothing->Left "frontend and fallback failed"
          Just p->R2.predictInduced (V4.r2Config (legacyConfig conf)) p x
      trainExact=all (\(x,y)->predict x==Right y) (training task)
      heldExact=not (null (tests task)) && all (\t->maybe False (\y->predict (testInput t)==Right y) (testOutput t)) (tests task)
      frontTrain=maybe False (\p->all (\(x,y)->runProgram p x==Right y) (training task)) (program f)
      frontHeld=maybe False (\p->not (null (tests task)) && all (\t->maybe False (\y->runProgram p (testInput t)==Right y) (testOutput t)) (tests task)) (program f)
      fallbackCount=maybe 0 (const 1) old :: Int
      g=(graph f) {counters=M.insert "fallback_count" fallbackCount (counters (graph f))}
      solution=objectJSON [("version",jsonString "LATIS-collection-v0.6.1-experiment"),("task",jsonString (taskId task)),("mode",jsonString (show mode))
        ,("reuse_policy",jsonString (if safePolicy mode conf then "SafeReuse" else "ExclusiveReuse"))
        ,("configuration",jsonString (show conf)),("front_success",boolJSON frontTrain),("front_train_exact",boolJSON frontTrain),("front_heldout_exact",boolJSON frontHeld)
        ,("train_exact",boolJSON trainExact),("heldout_exact",boolJSON heldExact),("front_failure",jsonString (failure f))
        ,("program",maybe "null" (jsonString . show) (program f))
        ,("metrics",objectJSON [(k,show v) | (k,v)<-M.toList (counters g)])
        ,("audit",auditJSON g (program f))
        ,("candidate_recovery",arrayJSON (map deferredJSON (deferred g)))
        ,("work_accounting",workJSON g)
        ,("paired_ambiguity",pairedJSON task g frontHeld)
        ,("r2_search_work",show (maybe 0 (M.findWithDefault 0 "total_expanded_work" . R2.inducedMetrics) old))
        ,("front_seconds_median",show medianSeconds),("front_repeats",show repeats)
        ,("front_seconds",show (fromIntegral (frontEnd-start)/1e9 :: Double)),("total_seconds",show (fromIntegral (end-start)/1e9 :: Double))
        ,("memory",mem)
        ,("predictions",arrayJSON [either (const "null") jsonGrid (predict (testInput t)) | t<-tests task])]
  writeFile (out </> "solution.json") (solution++"\n")
  writeFile (out </> "derivation_graph.json") (graphJSON g++"\n")
  writeFile (out </> "trace.txt") (unlines (trace g++[failure f]))
  case old of Nothing->pure (); Just r->R2.saveInduced (out </> "r2-fallback") R2.Full (V4.r2Config (legacyConfig conf)) task r
  putStrLn (taskId task++" "++show mode++" front="++show frontTrain++" held="++show frontHeld++" final="++show (trainExact,heldExact)++" "++failure f)
  pure (intercalate "," ([taskId task,show mode,show frontTrain,show frontHeld,show trainExact,show heldExact,show medianSeconds]++[show (metric k g) | k<-csv61]))

runMatrix61 :: FilePath -> Int -> Int -> Config -> Task -> IO ()
runMatrix61 out mechanismBudget repeats conf vertical=do
  createDirectoryIfMissing True out
  let tasks=v61Tasks vertical
  -- the paired tasks must share their training grids exactly
  case (lookup "P-gridleft" tasks,lookup "P-currentx" tasks) of
    (Just a,Just b) | training a==training b -> putStrLn "paired tasks share identical training grids"
    _ -> error "paired tasks must have identical training"
  rs<-forM tasks $ \(name,t)->do
    let legacy=legacyConfig conf
        cfg=if name=="03560426" then conf else conf {legacyConfig=legacy {V4.r2Config=(V4.r2Config legacy) {R2.workBudget=mechanismBudget}}}
    forM v61Modes $ \mode->runTask61 (out </> name </> show mode) repeats mode cfg t
  writeFile (out </> "metrics.csv") (unlines (("task,mode,front_train,front_heldout,train_exact,heldout_exact,front_seconds_median,"++intercalate "," csv61):concat rs))

-- Metamorphic battery: seeded instances per family, modes and variants,
-- without the R2 fallback (front-end only; fallback_needed is reported).
batteryModes :: [Mode]
batteryModes=[SafeOnline,ExclusiveReuseLegacy,NoOnlineAbstraction,NoCounterfactual]
runBattery :: FilePath -> Int -> Int -> Config -> IO ()
runBattery out seedBase perFamily conf=do
  createDirectoryIfMissing True out
  rows<-forM [minBound..maxBound] $ \fam->do
    let (instances,rejected)=generateValid fam (seedBase+1000*fromEnum fam) perFamily (perFamily*12)
    putStrLn (familyName fam++": "++show (length instances)++" valid instances, "++show (length rejected)++" rejected")
    perInstance<-forM instances $ \ins->do
      let task=instanceTask ins
          key f=case [ws | ws<-alignmentEvidence (graph f), not (null ws)] of
            []->"none"
            cs->let (a,b)=alignmentExpression (head (last cs)) in show a++" -> "++show b
          predictOf f=[runProgram p (testInput t) | Just p<-[program f], t<-tests task]
          heldExactOf f=maybe False (\p->all (\t->maybe False (\y->runProgram p (testInput t)==Right y) (testOutput t)) (tests task)) (program f)
          trainExactOf f=maybe False (\p->all (\(x,y)->runProgram p x==Right y) (training task)) (program f)
          base=[(mode,"plain",frontSearch mode conf (training task),task) | mode<-batteryModes]
          permuted=(SafeOnline,"permuted",frontSearch SafeOnline conf {enumerationSeed=Just (insSeed ins)} (training task),task)
          translated=case [v | d<-[(1,0),(0,1),(1,1),(-1,0),(0,-1)], Right v<-[translatedInstance d ins]] of
            (v:_)->let t'=instanceTask v in Just (SafeOnline,"translated",frontSearch SafeOnline conf (training t'),t')
            []->Nothing
          runs=base++[permuted]++maybe [] (:[]) translated
          safeF=case [f | (SafeOnline,"plain",f,_)<-runs] of f:_->f; []->error "safe run missing"
          noF=case [f | (NoOnlineAbstraction,"plain",f,_)<-runs] of f:_->f; []->error "noonline run missing"
          permF=case [f | (_,"permuted",f,_)<-runs] of f:_->f; []->error "permuted run missing"
          safeSolves=trainExactOf safeF
          props=[("permutation_invariant",predictOf safeF==predictOf permF && key safeF==key permF)
                ,("translation_equivariant",maybe True (\(_,_,f,t')->key f==key safeF && trainExactOf' f t'==safeSolves) translated)
                ,("safe_solves_iff_noonline",safeSolves==trainExactOf noF)
                ,("safe_prediction_equals_noonline",predictOf safeF==predictOf noF)
                ,("safe_key_equals_noonline",key safeF==key noF)
                ,("ties_rejected_when_expected",not (familyExpectsTies (insFamily ins)) || metric "ordering_ties_rejected" (graph safeF)>0)
                ,("size_index_legal",sizeLegal safeF)
                ,("no_concrete_high_edges",all (\(_,_,f,_)->metric "ConcreteCrossItemEdgeCount_high_level" (graph f)==0) runs)
                ,("triggered_only",all (\(_,_,f,_)->metric "UntriggeredExpansionCount" (graph f)==0 && metric "expanded_frozen_features" (graph f)==0) runs)]
          trainExactOf' f t'=maybe False (\p->all (\(x,y)->runProgram p x==Right y) (training t')) (program f)
          sizeLegal f=and [ (placedSig a==placedSig b) || metric "construction_triggers" (graph f)>0 || not (trainExactOf f)
                          | ws<-take 1 (reverse (alignmentEvidence (graph f))), w<-ws, (a,b)<-alignmentPairs w]
          oracle=knownFirstItemHypotheses (insFamily ins)
          survival f=case [c | c<-classes (graph f), scSlot c=="first-AX"] of
            []->(0,length oracle)
            c:_->(length [() | (_,e)<-oracle, any ((==e) . show . repExpr) (scReps c)],length oracle)
          dir=out </> familyName (insFamily ins) </> show (insSeed ins)
      createDirectoryIfMissing True dir
      writeFile (dir </> "instance.json") (instanceJSON ins++"\n")
      forM_ runs $ \(mode,variant,f,_)->do
        _<-evaluate (length (show f))
        writeFile (dir </> (show mode++"-"++variant++".json")) (objectJSON
          [("family",jsonString (familyName (insFamily ins))),("seed",show (insSeed ins)),("mode",jsonString (show mode)),("variant",jsonString variant)
          ,("front_train_exact",boolJSON (trainExactOf f)),("front_heldout_exact",boolJSON (heldExactOf f)),("front_failure",jsonString (failure f))
          ,("alignment_key",jsonString (key f)),("program",maybe "null" (jsonString . show) (program f))
          ,("metrics",objectJSON [(k,show v) | (k,v)<-M.toList (counters (graph f))]),("candidate_recovery",arrayJSON (map deferredJSON (deferred (graph f))))
          ,("trace",arrayJSON (map jsonString (trace (graph f))))]++"\n")
      writeFile (dir </> "properties.json") (objectJSON ([(n,boolJSON v) | (n,v)<-props]++[("first_item_survival",let (a,b)=survival safeF in arrayJSON [show a,show b])])++"\n")
      pure [intercalate "," ([familyName (insFamily ins),show (insSeed ins),show mode,variant,show (trainExactOf f),show (heldExactOf f),key f
             ,show (fromEnum (not (trainExactOf f)))]++[show (metric k (graph f)) | k<-batteryMetrics]++[show (fromEnum v) | (_,v)<-props])
            | (mode,variant,f,_)<-runs]
    writeFile (out </> (familyName fam++"-rejections.csv")) (unlines ("seed,reason":[show s++","++r | (s,r)<-rejected]))
    pure (concat perInstance)
  writeFile (out </> "metrics.csv") (unlines (("family,seed,mode,variant,front_train_exact,front_heldout_exact,alignment_key,fallback_needed,"++intercalate "," batteryMetrics++","++intercalate "," propertyNames):concat rows))
  where
    propertyNames=words "permutation_invariant translation_equivariant safe_solves_iff_noonline safe_prediction_equals_noonline safe_key_equals_noonline ties_rejected_when_expected size_index_legal no_concrete_high_edges triggered_only"
batteryMetrics :: [String]
batteryMetrics=words "search_work first_solution_work completion_work operator_applications refinement_expansions reuse_attempts reuse_hits deferred_candidates resumed_candidates recovered_solutions reselected_after_completion exclusive_reuse_missed_candidates exclusive_reuse_missed_solutions online_abstraction_reuses synthesized_keys_accepted ordering_ties_rejected construction_triggers rejected_size_comparisons semantic_classes representatives counterfactual_splits"
