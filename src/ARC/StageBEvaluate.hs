-- LATIS Stage B experiment entry: ablation configurations, synthetic
-- mechanism tasks (bounds, Bool thresholds, case-supported generalization,
-- incomparable branches), the regression comparison against Stage A FullA and
-- the JSON/CSV audit writers (referent graphs, witnesses, schedules).
--
-- Every configuration is Stage A FullA (SafeOnline, same budgets) with a
-- different Stage B block; BaselineA is byte-identical to
-- ARC.StageAEvaluate.fullA.
module ARC.StageBEvaluate
  ( configNamesB, configByNameB, namedConfigsB, baselineA, b0Only, noStructuralGeneralization, noSharedVSA, noHierarchy, fullB
  , FamilyB(..), familyNameB, familyExpectationB, InstanceB(..), mechanismInstancesB, instanceTaskB
  , referentsJSON, stageBMetricsJSON, stageBMetricNames, frontJSONB, runMechanismB, regressionRowsB
  ) where

import Synthesis.Collection.Front
import Synthesis.Collection.Referent (GraphStats(..))
import ARC.StageAEvaluate (fullA, runFront, frontJSON, trainExactOf, heldExactOf, failureStage, mechanismInstances, instanceTask, Instance(..), familyName, gridOf)
import ARC.CollectionV61Evaluate (v61Tasks)
import ARC.CollectionV6Evaluate (graphJSON, Ob(..), rectOb, placeOb)
import ARC.Dataset
import ARC.Evaluate (jsonString)
import ARC.InducedR1Evaluate (objectJSON, arrayJSON, boolJSON)
import Latent.Grid
import Control.Monad (forM)
import qualified Data.Map.Strict as M
import Data.List (intercalate)
import System.Directory (createDirectoryIfMissing)
import System.FilePath ((</>))

-- Ablation matrix (section B5 of the prompt). Mode is always SafeOnline.
baselineA, b0Only, noStructuralGeneralization, noSharedVSA, noHierarchy, fullB :: Config
baselineA=fullA
b0Only=fullA {stageB=stageBOff {sbBounds=True, sbBoolOps=True}}
fullB=fullA {stageB=stageBOff {sbBounds=True, sbBoolOps=True, sbGraph=True, sbStructuralGeneralization=True, sbSharedVSA=True, sbHierarchy=True, sbSchedule=GeneralFirst}}
noStructuralGeneralization=fullB {stageB=(stageB fullB) {sbStructuralGeneralization=False}}
noSharedVSA=fullB {stageB=(stageB fullB) {sbSharedVSA=False}}
noHierarchy=fullB {stageB=(stageB fullB) {sbHierarchy=False}}
withSchedule :: Schedule -> Config
withSchedule s=fullB {stageB=(stageB fullB) {sbSchedule=s}}
namedConfigsB :: [(String,Config)]
namedConfigsB=[("BaselineA",baselineA),("B0Only",b0Only),("NoStructuralGeneralization",noStructuralGeneralization),("NoSharedVSA",noSharedVSA)
  ,("NoHierarchy",noHierarchy),("FullB",fullB),("FullB-SpecificFirst",withSchedule SpecificFirst),("FullB-CostFirst",withSchedule CostFirst),("FullB-Interleaved",withSchedule Interleaved)]
configNamesB :: [String]
configNamesB=map fst namedConfigsB
configByNameB :: String -> Maybe Config
configByNameB n=lookup n namedConfigsB

-- Mechanism families. Objects are rectangles of distinct colors on a fixed
-- 16x12 canvas in distinct columns; the rule moves every object along one axis. The heldout case
-- changes the regularity that makes the training cases non-identifiable
-- (object width) wherever the family is about case support.
data FamilyB = MoveToOwnRightEdge | ThresholdIf | CaseSupportedWidth | ConstantTruthWidth | IncomparableBranches
  deriving (Eq,Ord,Show,Enum,Bounded)
familyNameB :: FamilyB -> String
familyNameB=show
-- Configurations whose train-exactness is asserted by the tests (positive
-- controls); every other configuration is reported as observed.
familyExpectationB :: FamilyB -> [String]
familyExpectationB f=case f of
  MoveToOwnRightEdge->configNamesB          -- x' = MaxX: the v0.6.1 grammar reaches it as Pos+Ext-1 (sanity family)
  ThresholdIf->configNamesB                 -- y' = if Height>2 then PosY else SceneLow: B0 reaches it with Lt; Stage A typed holes reach it by composition (e.g. isOdd(Height div 3)), so it is not a negative control
  CaseSupportedWidth->configNamesB          -- x' = PosX+2*Width, Width==2 on every training object (typed/hierarchy layer)
  ConstantTruthWidth->configNamesB          -- x' = PosX+4, Width==2 on every training object (same training grids)
  IncomparableBranches->configNamesB        -- x' = PosX+4 with Width==2 and CountObjects==2
data InstanceB = InstanceB { insFamilyB :: FamilyB, insSeedB :: Int, insRuleB :: String, insTrainB :: [(Grid,Grid)], insHeldB :: (Grid,Grid) } deriving (Show)
instanceTaskB :: InstanceB -> Task
instanceTaskB i=Task (familyNameB (insFamilyB i)++"-"++show (insSeedB i)) (insTrainB i) [TestPair (fst (insHeldB i)) (Just (snd (insHeldB i)))]

lcgB :: Int -> [Int]
lcgB seed=drop 1 (iterate (\x->(x*1103515245+12345) `mod` 2147483648) (abs seed+13))

mkCaseB :: FamilyB -> Int -> Bool -> [Int] -> ((Grid,Grid),[Int])
mkCaseB fam _ held rs=
  let w=20; h=12
      n | fam==ThresholdIf = 4
        | fam==IncomparableBranches = 2
        | fam `elem` [CaseSupportedWidth,ConstantTruthWidth] = if held then 3 else 2   -- Count fixed at 2: Pos+Count+1 (v0.6.1 grammar) must not reach Pos+4
        | held = 3
        | otherwise = 2+(head rs `mod` 2)
      ow k | fam==ThresholdIf = 1
           | fam `elem` [CaseSupportedWidth,ConstantTruthWidth,IncomparableBranches] = if held then 3 else 2
           | otherwise = 1+(rs !! (k+1)) `mod` 2
      oh k | fam==ThresholdIf = [1,3,2,4] !! ((k+rs !! 3) `mod` 4)
           | otherwise = 1+(rs !! (k+5)) `mod` 2
      oy k=(rs !! (k+9)) `mod` 7
      -- width families: x0=2 and a random gap in 5..7 so that no v0.6.1 grammar term
      -- (base+lit, base+base, base+base+-1 over Pos/Ext/SetMin/Count/Scene) coincides
      -- with x+4 on the fixed training positions (x0 in {0,1}: Ext+Ext(+1); x0 in {3,4,5}: Pos+SetMin+c)
      xs | fam `elem` [CaseSupportedWidth,ConstantTruthWidth,IncomparableBranches] = if held then [2,6,10] else [2,7+(rs !! 13) `mod` 3]
         | otherwise = [1+4*k | k<-[0..n-1]]
      obs=[rectOb (x,oy k) (ow k) (oh k) (9-k) | (k,x)<-zip [0..] xs]
      move o=case fam of
        MoveToOwnRightEdge->rectOb (obX o+obW o-1,obY o) (obW o) (obH o) (obColor o)
        ThresholdIf->rectOb (obX o,if obH o>2 then obY o else 0) (obW o) (obH o) (obColor o)
        CaseSupportedWidth->rectOb (obX o+2*obW o,obY o) (obW o) (obH o) (obColor o)
        _->rectOb (obX o+4,obY o) (obW o) (obH o) (obColor o)
      placeAll os=gridOf w h (concat [placeOb (obX o,obY o) o | o<-os])
  in ((placeAll obs,placeAll (map move obs)),drop 16 rs)

mkInstanceB :: FamilyB -> Int -> InstanceB
mkInstanceB fam seed=
  let rs0=lcgB (seed*17+fromEnum (streamFamily fam))
      streamFamily ConstantTruthWidth=CaseSupportedWidth   -- the counterexample pair shares one random stream: identical training grids
      streamFamily f=f
      cases=if fam==ThresholdIf then 5 else 3 :: Int
      (train,rs3)=foldl (\(acc,rs) _->let (p,rs')=mkCaseB fam seed False rs in (acc++[p],rs')) ([],rs0) [1..cases]
      (held,_)=mkCaseB fam seed True rs3
      rule=case fam of
        MoveToOwnRightEdge->"x' = MaxX(Current) (= PosX+ExtX-1); y unchanged (the v0.6.1 grammar also reaches it as Pos+Ext-1)"
        ThresholdIf->"y' = if Height(Current) > 2 then PosY else SceneLow (short objects jump to the top row); x unchanged; heights 1..4 shuffled per case; 5 training cases"
        CaseSupportedWidth->"x' = PosX+2*Width(Current); every training object has width 2 (PosX+4 agrees; outside the v0.6.1 grammar); heldout width 3"
        ConstantTruthWidth->"x' = PosX+4; every training object has width 2 (PosX+2*Width agrees); same training grids as CaseSupportedWidth; heldout width 3"
        IncomparableBranches->"x' = PosX+4; Width==2 and CountObjects==2 on every training case: Width- and Count-dependent generalizations are incomparable; heldout width 3, count 2"
  in InstanceB fam seed rule train held
mechanismInstancesB :: Int -> [InstanceB]
mechanismInstancesB per=[mkInstanceB fam s | fam<-[minBound..maxBound], s<-[1..per]]

stageBMetricNames :: [String]
stageBMetricNames=words "b_snapshots_built b_snapshot_work b_graph_nodes b_graph_classes b_graph_templates b_graph_closed_terms b_graph_truncations b_constant_only_dropped b_edges_confirmed b_edges_pending b_edges_not_supported b_type_edges b_closure_edges b_sccs b_layers b_substitutions_tried b_outside_universe b_edge_truncations b_vsa_nodes b_vsa_unions b_vsa_expanded b_vsa_expansion_mismatch b_sharing_avg_x100 b_sharing_max_x100 b_dag_evaluations b_reference_evaluations b_witness_full b_hierarchy_slots b_hierarchy_fits b_class_checks b_row_lookups b_flat_row_evaluations b_candidates_covered b_fitting_classes b_layer_exposed b_layer_searched b_layer_truncated b_slot_truncations b_global_truncations b_hierarchy_fallbacks b_hierarchy_solved_slots"
stageBMetricsJSON :: Graph -> String
stageBMetricsJSON g=objectJSON [(k,show (metric k g)) | k<-stageBMetricNames]

statsJSON :: GraphStats -> String
statsJSON s=objectJSON
  [("templates",show (gsTemplates s)),("closed_terms",show (gsClosedTerms s)),("nodes",show (gsNodes s)),("universe_truncated",boolJSON (gsTruncated s)),("constant_only_dropped",show (gsConstantOnlyDropped s))
  ,("contexts",show (gsContexts s)),("dependency_contexts",show (gsDependencyContexts s)),("classes",show (gsClasses s))
  ,("edges_confirmed",show (gsEdgesConfirmed s)),("edges_pending_dependency",show (gsEdgesPending s)),("edges_not_supported",show (gsEdgesNotSupported s)),("edges_rejected",show (gsEdgesRejected s))
  ,("type_generalization_edges",show (gsTypeEdges s)),("closure_edges",show (gsClosureEdges s)),("sccs",show (gsSCCs s)),("layers",show (gsLayers s))
  ,("substitutions_tried",show (gsSubstitutionsTried s)),("targets_outside_universe",show (gsOutsideUniverse s)),("edge_budget_truncated",boolJSON (gsEdgeTruncated s))
  ,("vsa_nodes",show (gsVSANodes s)),("vsa_union_nodes",show (gsVSAUnions s)),("expanded_candidates",show (gsExpanded s)),("expansion_check_ok",boolJSON (gsExpansionOk s))
  ,("sharing_ratio_avg_x100",show (gsSharingAvgX100 s)),("sharing_ratio_max_x100",show (gsSharingMaxX100 s))
  ,("dag_evaluations",show (gsDAGEvaluations s)),("reference_evaluations",show (gsReferenceEvaluations s)),("build_work",show (gsBuildWork s)),("witness_full",show (gsWitnessFull s))]
referentsJSON :: Graph -> String
referentsJSON g=arrayJSON [objectJSON [("axis",jsonString (rsAxis r)),("version",jsonString (rsVersion r)),("snapshot_hash",show (rsHash r)),("schedule",jsonString (rsSchedule r))
  ,("stats",statsJSON (rsStats r)),("confirmed_edge_samples",arrayJSON (map jsonString (rsEdgeSamples r))),("pending_or_unsupported_edge_samples",arrayJSON (map jsonString (rsPendingSamples r)))
  ,("type_edge_samples",arrayJSON (map jsonString (rsTypeEdgeSamples r))),("largest_class_sizes",arrayJSON (map show (rsClassSizes r))),("node_samples",arrayJSON (map jsonString (rsNodeSamples r)))] | r<-referents g]

frontJSONB :: String -> Task -> Front -> Double -> String
frontJSONB cfgName task f secs=
  let base=frontJSON cfgName task f secs
      extra=objectJSON [("stage_b",stageBMetricsJSON (graph f)),("referents",referentsJSON (graph f))]
  in init base++","++drop 1 extra

csvHeaderB :: String
csvHeaderB="family,seed,config,expected_train_exact,front_train_exact,front_heldout_exact,failure_stage,search_work,b_snapshot_work,b_graph_nodes,b_graph_classes,b_edges_confirmed,b_edges_pending,b_vsa_nodes,b_vsa_expanded,b_class_checks,b_flat_row_evaluations,typed_hole_evaluations,front_seconds,program,front_failure"

runMechanismB :: FilePath -> Int -> Task -> IO ()
runMechanismB out per vertical=do
  createDirectoryIfMissing True out
  rows<-forM (mechanismInstancesB per) $ \ins->do
    let task=instanceTaskB ins
        dir=out </> familyNameB (insFamilyB ins) </> show (insSeedB ins)
    createDirectoryIfMissing True dir
    writeFile (dir </> "instance.json") (objectJSON [("family",jsonString (familyNameB (insFamilyB ins))),("seed",show (insSeedB ins)),("rule",jsonString (insRuleB ins))
      ,("train",arrayJSON [objectJSON [("input",jsonGrid x),("output",jsonGrid y)] | (x,y)<-insTrainB ins])
      ,("heldout",objectJSON [("input",jsonGrid (fst (insHeldB ins))),("output",jsonGrid (snd (insHeldB ins)))])]++"\n")
    forM namedConfigsB $ \(name,conf)->do
      (f,secs)<-runFront conf (training task)
      writeFile (dir </> (name++".json")) (frontJSONB name task f secs++"\n")
      writeFile (dir </> (name++".graph.json")) (graphJSON (graph f)++"\n")
      let g=graph f
          te=trainExactOf task f
          m k=show (metric k g)
      putStrLn (taskId task++" "++name++" train="++show te++" held="++show (heldExactOf task f)++" "++failure f)
      pure (intercalate "," [familyNameB (insFamilyB ins),show (insSeedB ins),name,show (name `elem` familyExpectationB (insFamilyB ins)),show te,show (heldExactOf task f)
        ,failureStage (failure f),m "search_work",m "b_snapshot_work",m "b_graph_nodes",m "b_graph_classes",m "b_edges_confirmed",m "b_edges_pending",m "b_vsa_nodes",m "b_vsa_expanded"
        ,m "b_class_checks",m "b_flat_row_evaluations",m "typed_hole_evaluations",show secs,jsonString (maybe "" show (program f)),jsonString (failure f)])
  writeFile (out </> "mechanism_metrics.csv") (unlines (csvHeaderB:concat rows))
  reg<-regressionRowsB vertical
  writeFile (out </> "regression_stage_a.csv") (unlines ("task,config,front_train_exact,front_heldout_exact,same_program_as_fulla,same_predictions_as_fulla,search_work,front_failure":reg))
  putStrLn ("wrote "++(out </> "mechanism_metrics.csv"))

-- Regression: on the Stage A mechanism instances and the v0.6.1 tasks the
-- BaselineA configuration must return exactly the Stage A FullA program; the
-- other configurations are reported (same/different program and predictions).
regressionRowsB :: Task -> IO [String]
regressionRowsB vertical=do
  let tasks=[(taskId t,t) | i<-mechanismInstances 1, let t=instanceTask i, familyName (insFamily i) `elem` ["SizeScale","SizeOffset","ParityIf","CounterexampleFeatureTruth"]]++v61Tasks vertical
  fmap concat $ forM tasks $ \(name,t)->do
    (base,_)<-runFront fullA (training t)
    forM namedConfigsB $ \(cfgName,conf)->do
      (f,_)<-runFront conf (training t)
      let sameProg=program f==program base
          preds g=[fmap runProgram (program g) <*> Just (testInput q) | q<-tests t]
          samePred=preds f==preds base
      pure (intercalate "," [name,cfgName,show (trainExactOf t f),show (heldExactOf t f),show sameProg,show samePred,show (metric "search_work" (graph f)),jsonString (failure f)])
  where _=M.empty :: M.Map Int Int
