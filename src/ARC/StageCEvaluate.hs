-- LATIS Stage C experiment entry: ablation configurations, synthetic
-- mechanism tasks (object selection, replication, merge, shell construction,
-- diagonal view, crop-to-selection, counterexample pair), the regression
-- comparison against Stage A FullA / Stage B FullB and the JSON/CSV writers.
--
-- BaselineA is byte-identical to ARC.StageAEvaluate.fullA and BaselineB to
-- ARC.StageBEvaluate.fullB; every Stage C configuration is fullA (or fullB for
-- the goal-directed one) with a different Stage C block.
module ARC.StageCEvaluate
  ( configNamesC, configByNameC, namedConfigsC, baselineAC, baselineBC, shapeOnly, relationsOnly, objectShapeFull, objectShapeGoalDirected
  , FamilyC(..), familyNameC, familyExpectationC, familyNegativeC, InstanceC(..), mechanismInstancesC, instanceTaskC
  , stageCMetricNames, stageCMetricsJSON, relationsJSON, shapesJSON, frontJSONC, runMechanismC, regressionRowsC
  ) where

import Synthesis.Collection.Front
import ARC.StageAEvaluate (fullA, runFront, frontJSON, trainExactOf, heldExactOf, failureStage, mechanismInstances, instanceTask, Instance(..), familyName, gridOf)
import ARC.StageBEvaluate (fullB, mechanismInstancesB, instanceTaskB, InstanceB(..), familyNameB)
import ARC.CollectionV61Evaluate (v61Tasks)
import ARC.CollectionV6Evaluate (graphJSON, Ob(..), rectOb, placeOb)
import ARC.Dataset
import ARC.Evaluate (jsonString)
import ARC.InducedR1Evaluate (objectJSON, arrayJSON, boolJSON)
import Latent.Grid
import Control.Monad (forM)
import Data.List (intercalate)
import System.Directory (createDirectoryIfMissing)
import System.FilePath ((</>))

-- Ablation matrix (section C5). Mode is always SafeOnline.
baselineAC, baselineBC, shapeOnly, relationsOnly, objectShapeFull, objectShapeGoalDirected :: Config
baselineAC=fullA
baselineBC=fullB
shapeOnly=fullA {stageC=stageCOff {scShape=True, scDiagonalView=True, scObjectSizeFeatures=True}}
relationsOnly=fullA {stageC=stageCOff {scRelations=True, scFallbackTrigger=True}}
objectShapeFull=fullA {stageC=stageCOff {scShape=True, scDiagonalView=True, scRelations=True, scObjectSizeFeatures=True, scFallbackTrigger=True}}
objectShapeGoalDirected=fullB {stageC=(stageC objectShapeFull) {scGoalDirected=True}}
namedConfigsC :: [(String,Config)]
namedConfigsC=[("BaselineA",baselineAC),("BaselineB",baselineBC),("ShapeOnly",shapeOnly),("RelationsOnly",relationsOnly),("ObjectShapeFull",objectShapeFull),("ObjectShapeGoalDirected",objectShapeGoalDirected)]
configNamesC :: [String]
configNamesC=map fst namedConfigsC
configByNameC :: String -> Maybe Config
configByNameC n=lookup n namedConfigsC

-- Mechanism families (section C5). Every instance has 3 training pairs (4 for
-- the counterexample pair) and one heldout pair used for scoring only.
data FamilyC = TranslateSingle | KeepColor | ReplicateFit | MergeBBox | MergeColorConflict | ShellConstruct | DiagonalRecolor | DiagonalCrossing | CropLargest
  | CounterexampleConstantCount | CounterexampleFeatureCount
  deriving (Eq,Ord,Show,Enum,Bounded)
familyNameC :: FamilyC -> String
familyNameC=show
relational :: [String]
relational=["RelationsOnly","ObjectShapeFull","ObjectShapeGoalDirected"]
withShape :: [String]
withShape=["ObjectShapeFull","ObjectShapeGoalDirected"]
-- Positive controls: configurations whose train-exactness the family is designed
-- to show (asserted by the tests). Other configurations are reported as observed.
familyExpectationC :: FamilyC -> [String]
familyExpectationC f=case f of
  TranslateSingle->configNamesC            -- x' = x+2: the v0.6.1 sequence-local path (compatibility)
  KeepColor->relational                    -- keep the colour-2 objects, delete the rest (n_in > n_out)
  ReplicateFit->relational                 -- copies that fit across the canvas: k = (W_out-PosX) div (Width+1), count varies per case
  MergeBBox->withShape                     -- aligned same-colour rectangles -> one Rectangle(bbox) (n_out = 1)
  MergeColorConflict->[]                   -- negative control: differently coloured objects must not be merged
  ShellConstruct->withShape                -- solid rectangles -> Shell(w,h,1); equal counts, geometry changes
  DiagonalRecolor->withShape               -- the diagonal chain (local view) is recoloured; an isolated pixel of the same colour is not
  DiagonalCrossing->[]                     -- negative control: two crossing chains are rejected by the view and stay pixels
  CropLargest->withShape                   -- canvas = bbox of the unique largest object; output = that object at the origin
  CounterexampleConstantCount->relational  -- bar replicated 3 times (Count==3 on every training case)
  CounterexampleFeatureCount->relational   -- bar replicated CountObjects times (same training grids)
-- Negative controls guaranteed by construction (the operator is not visible).
familyNegativeC :: FamilyC -> [String]
familyNegativeC f=case f of
  KeepColor->["BaselineA","BaselineB","ShapeOnly"]            -- no transformation search: cardinality rejection
  ReplicateFit->["BaselineA","BaselineB","ShapeOnly"]
  MergeBBox->["BaselineA","BaselineB","ShapeOnly","RelationsOnly"]   -- RelationsOnly has no Shape constructor
  MergeColorConflict->configNamesC
  DiagonalCrossing->configNamesC
  CropLargest->["BaselineA","BaselineB","ShapeOnly","RelationsOnly"] -- RelationsOnly has no object-level size leaves
  _->[]

data InstanceC = InstanceC { insFamilyC :: FamilyC, insSeedC :: Int, insRuleC :: String, insTrainC :: [(Grid,Grid)], insHeldC :: (Grid,Grid) } deriving (Show)
instanceTaskC :: InstanceC -> Task
instanceTaskC i=Task (familyNameC (insFamilyC i)++"-"++show (insSeedC i)) (insTrainC i) [TestPair (fst (insHeldC i)) (Just (snd (insHeldC i)))]

lcgC :: Int -> [Int]
lcgC seed=drop 1 (iterate (\x->(x*1103515245+12345) `mod` 2147483648) (abs seed+29))
at :: [Int] -> Int -> Int
at rs i=rs !! i
diagOb :: (Int,Int) -> Int -> Int -> Ob
diagOb (x,y) n c=Ob x y [(i,i) | i<-[0..n-1]] n n c
antiDiagOb :: (Int,Int) -> Int -> Int -> Ob
antiDiagOb (x,y) n c=Ob x y [(n-1-i,i) | i<-[0..n-1]] n n c
grid :: Int -> Int -> [Ob] -> Grid
grid w h obs=gridOf w h (concat [placeOb (obX o,obY o) o | o<-obs])

-- One case of a family. idx 0..2 are the training cases, idx 3 the heldout
-- (different sizes, counts or positions wherever the rule makes that
-- distinguishable). Quantities that a constant could explain by coincidence
-- (replica count, selected object size, kept-object count) vary with idx.
mkCaseC :: FamilyC -> Int -> [Int] -> ((Grid,Grid),[Int])
mkCaseC fam idx rs=
  let w=16; h=12
      held=idx>=3
      r i=at rs i
  in case fam of
    TranslateSingle->
      let ow=1+r 0 `mod` 3; oh=1+r 1 `mod` 3; x=1+r 2 `mod` 6; y=1+r 3 `mod` (h-oh-1)
          o=rectOb (x,y) ow oh 3
      in ((grid w h [o],grid w h [rectOb (x+2,y) ow oh 3]),drop 8 rs)
    KeepColor->
      -- objects in distinct columns; colour 2 appears once or twice (varies per case)
      let n=if held then 4 else 3+r 0 `mod` 2
          keep2=1+idx `mod` 2                      -- 1,2,1 kept objects: the colour mode is not unique on two cases
          cols=take n ([2 | _<-[1..keep2]]++[c | c<-[1,3,4,6,7], c/=2])
          obs=[rectOb (1+4*k,1+r (k+2) `mod` 6) (1+r (k+6) `mod` 2) (1+r (k+10) `mod` 3) c | (k,c)<-zip [0..] cols]
      in ((grid w h obs,grid w h [o | o<-obs, obColor o==2]),drop 16 rs)
    ReplicateFit->
      let ow=if held then 3 else 2; gw=if held then 12 else 3*(3+idx); oh=1+r 2 `mod` 2; y=1+r 3 `mod` (h-oh-1)   -- k = 3,4,5 on the training cases, 3 on the heldout
          o=rectOb (0,y) ow oh 4
          k=gw `div` (ow+1)
      in ((grid gw h [o],grid gw h [rectOb (i*(ow+1),y) ow oh 4 | i<-[0..k-1]]),drop 8 rs)
    MergeBBox->
      let n=if held then 3 else 2+r 0 `mod` 2; oh=1+r 1 `mod` 2; y=1+r 2 `mod` (h-oh-1); ow=1+r 3 `mod` 2; gap=1+r 4 `mod` 2
          xs=[1+k*(ow+gap) | k<-[0..n-1]]
          obs=[rectOb (x,y) ow oh 5 | x<-xs]
          x0=minimum xs; x1=maximum xs+ow-1
      in ((grid w h obs,grid w h [rectOb (x0,y) (x1-x0+1) oh 5]),drop 8 rs)
    MergeColorConflict->
      let oh=1+r 1 `mod` 2; y=1+r 2 `mod` (h-oh-1); ow=2; gap=1   -- bbox width 5: no replica tiling of a width-2 object reaches it
          obs=[rectOb (1,y) ow oh 5,rectOb (1+ow+gap,y) ow oh 6]
      in ((grid w h obs,grid w h [rectOb (1,y) (2*ow+gap) oh 5]),drop 8 rs)
    ShellConstruct->
      let a=rectOb (1,1+r 0 `mod` 3) (3+r 1 `mod` 3) (3+r 2 `mod` 3) 1
          b=rectOb (8,1+r 3 `mod` 3) (3+r 4 `mod` 3) (3+r 5 `mod` 3) 2
          shell o=Ob (obX o) (obY o) [(i,j) | i<-[0..obW o-1], j<-[0..obH o-1], i==0 || j==0 || i==obW o-1 || j==obH o-1] (obW o) (obH o) (obColor o)
          obs=if held then [a,b,rectOb (1,8) 4 3 3] else [a,b]
      in ((grid w h obs,grid w h (map shell obs)),drop 8 rs)
    DiagonalRecolor->
      let n=if held then 5 else 3+r 0 `mod` 2
          chain=diagOb (1,1) n 4
          rect=rectOb (9,1+r 1 `mod` 4) (2+r 2 `mod` 2) (2+r 3 `mod` 2) 1
          lone=rectOb (2+r 4 `mod` 4,9) 1 1 4          -- isolated pixel of the chain colour (no diagonal neighbour)
          obs=[chain,rect,lone]
      in ((grid w h obs,grid w h [chain {obColor=2},rect,lone]),drop 8 rs)
    DiagonalCrossing->
      let n=5
          a=diagOb (1,1) n 4; b=antiDiagOb (1,1) n 4    -- two chains crossing at the centre pixel
          rect=rectOb (9,1+r 1 `mod` 4) 2 2 1
          lone=rectOb (10,9) 1 1 4
          obs=[a,b,rect,lone]
      in ((grid w h obs,grid w h [a {obColor=2},b {obColor=2},rect,lone]),drop 8 rs)
    CropLargest->
      let (bw,bh)=[(4,3),(5,4),(6,3),(5,5)] !! min 3 idx       -- the largest object's size varies per case (no constant canvas)
          big=rectOb (1+r 0 `mod` 3,1+r 1 `mod` 3) bw bh 6
          small=rectOb (10,1+r 4 `mod` 5) (1+r 5 `mod` 2) (1+r 6 `mod` 2) 3
          tiny=rectOb (13,8) 1 1 7
          obs=if held then [big,small,tiny] else [big,small]
      in ((grid w h obs,gridOf (obW big) (obH big) (placeOb (0,0) big)),drop 8 rs)
    CounterexampleConstantCount->counterexample 3
    CounterexampleFeatureCount->counterexample (if held then 4 else 3)
  where
    -- a bar (colour 1) and markers (colour 5); the bar is replicated downward
    -- with gap 1: k = 3 (constant) or k = CountObjects (bar + markers)
    counterexample k=
      let r i=at rs i
          held=idx>=3
          w=16; h=12
          ow=2+r 0 `mod` 3; x=1+r 1 `mod` 4
          bar=rectOb (x,0) ow 1 1
          markers=[rectOb (10+2*i,2+2*i+r 2 `mod` 2) 1 1 5 | i<-[0..(if held then 2 else 1)]]
          out=[rectOb (x,2*i) ow 1 1 | i<-[0..k-1]]++markers
      in ((grid w h (bar:markers),grid w h out),drop 8 rs)

mkInstanceC :: FamilyC -> Int -> InstanceC
mkInstanceC fam seed=
  let streamFamily CounterexampleFeatureCount=CounterexampleConstantCount   -- the pair shares one random stream: identical training grids
      streamFamily f=f
      rs0=lcgC (seed*23+fromEnum (streamFamily fam))
      cases=3 :: Int
      (train,rsN)=foldl (\(acc,rs) idx->let (p,rs')=mkCaseC fam idx rs in (acc++[p],rs')) ([],rs0) [0..cases-1]
      (held,_)=mkCaseC fam 3 rsN
      rule=case fam of
        TranslateSingle->"one object moves right by 2 (v0.6.1 sequence-local path)"
        KeepColor->"keep the colour-2 objects (1 or 2 per case), delete the others: Select(Color==2); drop others; keep each"
        ReplicateFit->"the bar at x=0 is copied across the row with gap 1 until the canvas edge: replicate (W_out-PosX) div (Width+1) times with step (Width+1,0); count varies with the canvas width"
        MergeBBox->"2 or 3 aligned colour-5 rectangles become one Rectangle over their bounding box: merge selected (Rectangle(bbox))"
        MergeColorConflict->"NEGATIVE CONTROL: two differently coloured rectangles; the output is a colour-5 rectangle over both: no uniform-colour merge exists, nothing may be forced"
        ShellConstruct->"every solid rectangle becomes its Shell of thickness 1 (equal counts, geometry changes; the sequence-local path cannot express it)"
        DiagonalRecolor->"the diagonal chain of colour-4 pixels (3..5 pixels, 4-connected view: separate pixels) is recoloured to 2; an isolated colour-4 pixel and a rectangle are unchanged: Select(IsDiagonalBar); keep others; recolor to 2 (needs the local view)"
        DiagonalCrossing->"NEGATIVE CONTROL: two crossing colour-4 chains; the view must reject them (shared centre pixel), no transformation may fit"
        CropLargest->"output canvas = bounding box of the unique largest object, containing that object at the origin: Size2 = (Width(UniqueLargest), Height(UniqueLargest)); Select(Area==unique max); crop"
        CounterexampleConstantCount->"bar replicated 3 times downward with gap 1; CountObjects==3 on every training case (constant and feature coincide); heldout has 4 objects"
        CounterexampleFeatureCount->"bar replicated CountObjects times downward with gap 1; same training grids as the constant twin; heldout: 4 objects -> 4 copies"
  in InstanceC fam seed rule train held
mechanismInstancesC :: Int -> [InstanceC]
mechanismInstancesC per=[mkInstanceC fam s | fam<-[minBound..maxBound], s<-[1..per]]

stageCMetricNames :: [String]
stageCMetricNames=words "c_relation_triggered c_relation_trigger_cardinality c_relation_trigger_fallback c_relation_candidates c_relation_tried c_relation_executions c_relation_fits c_relation_truncated c_relation_selected_cost c_relation_shape_used c_object_count_exact c_object_transform_exact c_shape_masks c_shape_decomposed c_shape_decomposed_truncated c_shape_unrepresentable c_shape_truncated c_shape_ast_total c_shape_ties c_shape_work c_diagonal_chains_accepted c_diagonal_chains_rejected c_view_pixels_merged c_size_object_features"
stageCMetricsJSON :: Graph -> String
stageCMetricsJSON g=objectJSON [(k,show (metric k g)) | k<-stageCMetricNames]
relationsJSON :: Graph -> String
relationsJSON g=arrayJSON [objectJSON [("transform",jsonString (rrTransform r)),("cost",show (rrCost r)),("constants",show (rrConstants r)),("uses_shape",boolJSON (rrUsesShape r))
  ,("selected",boolJSON (rrSelected r)),("witnesses",arrayJSON (map jsonString (rrWitnesses r)))] | r<-relations g]
shapesJSON :: Graph -> String
shapesJSON g=arrayJSON [objectJSON [("mask",jsonString (shMask s)),("occurrences",show (shOccurrences s)),("decomposition",maybe "null" jsonString (shDecomposition s))
  ,("ast_size",show (shSize s)),("ties",show (shTies s)),("candidates",show (shCandidates s)),("truncated",boolJSON (shTruncated s))] | s<-shapes g]

frontJSONC :: String -> Task -> Front -> Double -> String
frontJSONC cfgName task f secs=
  let base=frontJSON cfgName task f secs
      extra=objectJSON [("stage_c",stageCMetricsJSON (graph f)),("relations",relationsJSON (graph f)),("shapes",shapesJSON (graph f))
        ,("object_transform",maybe "null" (jsonString . transformText) (program f >>= progTransform))]
  in init base++","++drop 1 extra

csvHeaderC :: String
csvHeaderC="family,seed,config,expected_train_exact,negative_control,front_train_exact,front_heldout_exact,failure_stage,size_rule_exact,c_object_count_exact,c_object_transform_exact,search_work,c_relation_triggered,c_relation_tried,c_relation_executions,c_relation_fits,c_shape_masks,c_shape_decomposed,c_diagonal_chains_accepted,c_diagonal_chains_rejected,front_seconds,object_transform,front_failure"

runMechanismC :: FilePath -> Int -> Task -> IO ()
runMechanismC out per vertical=do
  createDirectoryIfMissing True out
  rows<-forM (mechanismInstancesC per) $ \ins->do
    let task=instanceTaskC ins
        dir=out </> familyNameC (insFamilyC ins) </> show (insSeedC ins)
    createDirectoryIfMissing True dir
    writeFile (dir </> "instance.json") (objectJSON [("family",jsonString (familyNameC (insFamilyC ins))),("seed",show (insSeedC ins)),("rule",jsonString (insRuleC ins))
      ,("train",arrayJSON [objectJSON [("input",jsonGrid x),("output",jsonGrid y)] | (x,y)<-insTrainC ins])
      ,("heldout",objectJSON [("input",jsonGrid (fst (insHeldC ins))),("output",jsonGrid (snd (insHeldC ins)))])]++"\n")
    forM namedConfigsC $ \(name,conf)->do
      (f,secs)<-runFront conf (training task)
      writeFile (dir </> (name++".json")) (frontJSONC name task f secs++"\n")
      writeFile (dir </> (name++".graph.json")) (graphJSON (graph f)++"\n")
      let g=graph f
          te=trainExactOf task f
          m k=show (metric k g)
      putStrLn (taskId task++" "++name++" train="++show te++" held="++show (heldExactOf task f)++" "++failure f)
      pure (intercalate "," [familyNameC (insFamilyC ins),show (insSeedC ins),name,show (name `elem` familyExpectationC (insFamilyC ins)),show (name `elem` familyNegativeC (insFamilyC ins))
        ,show te,show (heldExactOf task f),failureStage (failure f),m "size_rule_exact",m "c_object_count_exact",m "c_object_transform_exact",m "search_work"
        ,m "c_relation_triggered",m "c_relation_tried",m "c_relation_executions",m "c_relation_fits",m "c_shape_masks",m "c_shape_decomposed",m "c_diagonal_chains_accepted",m "c_diagonal_chains_rejected"
        ,show secs,jsonString (maybe "" transformText (program f >>= progTransform)),jsonString (failure f)])
  writeFile (out </> "mechanism_metrics.csv") (unlines (csvHeaderC:concat rows))
  reg<-regressionRowsC vertical
  writeFile (out </> "regression_baselines.csv") (unlines ("task,config,reference,front_train_exact,front_heldout_exact,same_program_as_reference,same_predictions_as_reference,search_work,front_failure":reg))
  putStrLn ("wrote "++(out </> "mechanism_metrics.csv"))

-- Regression: BaselineA must equal Stage A FullA and BaselineB Stage B FullB
-- (program, predictions, search work) on the Stage A/B mechanism instances and
-- the v0.6.1 tasks; the Stage C configurations are reported against FullA.
regressionRowsC :: Task -> IO [String]
regressionRowsC vertical=do
  let tasks=[(taskId t,t) | i<-mechanismInstances 1, let t=instanceTask i, familyName (insFamily i) `elem` ["SizeScale","SizeOffset","ParityIf","CounterexampleFeatureTruth","CardinalityMismatchStillBlocked"]]
        ++[(taskId t,t) | i<-mechanismInstancesB 1, let t=instanceTaskB i, familyNameB (insFamilyB i) `elem` ["CaseSupportedWidth","ThresholdIf"]]
        ++v61Tasks vertical
  fmap concat $ forM tasks $ \(name,t)->do
    (refA,_)<-runFront fullA (training t)
    (refB,_)<-runFront fullB (training t)
    forM namedConfigsC $ \(cfgName,conf)->do
      (f,_)<-runFront conf (training t)
      let (refName,ref)=if cfgName `elem` ["BaselineB","ObjectShapeGoalDirected"] then ("FullB",refB) else ("FullA",refA)
          sameProg=program f==program ref
          preds g=[fmap runProgram (program g) <*> Just (testInput q) | q<-tests t]
          samePred=preds f==preds ref
      pure (intercalate "," [name,cfgName,refName,show (trainExactOf t f),show (heldExactOf t f),show sameProg,show samePred,show (metric "search_work" (graph f)),jsonString (failure f)])
