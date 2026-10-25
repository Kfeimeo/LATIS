-- LATIS Stage A experiment entry: ablation configurations, synthetic mechanism
-- tasks (size-changing canvases, typed holes, parity), the regression
-- comparison against v0.6.1 and the JSON/CSV audit writers.
--
-- Every configuration is the v0.6.1 SafeOnline front end (same modes, same
-- budgets) with a different Stage A block; BaselineV061 is byte-identical to
-- ARC.CollectionV61Evaluate.v61Config.
module ARC.StageAEvaluate
  ( configNames, configByName, namedConfigs, baselineV061, gridSizeOnly, typedNaryOnly, fullA, noFeatureArg, noConstantArg, fullAMinusParity
  , Family(..), familyName, familyExpectation, familyNegativeControls, Instance(..), mechanismInstances, instanceTask
  , runFront, frontJSON, sizeRuleJSON, typedBindings, failureStage, stageAFeaturesJSON
  , runMechanism, regressionRows, trainExactOf, heldExactOf
  , gridOf, lcg
  ) where

import Synthesis.Collection.Front
import Synthesis.Collection.Indexed (Trigger(..))
import Synthesis.Collection.Counterfactual
import Synthesis.Collection.Typed
import Synthesis.Collection.Size
import ARC.CollectionV61Evaluate (v61Config, v61Tasks)
import ARC.CollectionV6Evaluate (graphJSON, Ob(..), rectOb, placeOb)
import ARC.Dataset
import ARC.Evaluate (jsonString)
import ARC.InducedR1Evaluate (objectJSON, arrayJSON, boolJSON)
import Latent.Grid
import Control.Exception (evaluate)
import Control.Monad (forM)
import GHC.Clock (getMonotonicTimeNSec)
import qualified Data.Map.Strict as M
import Data.List (intercalate, isPrefixOf)
import System.Directory (createDirectoryIfMissing)
import System.FilePath ((</>))

-- Ablation configurations (section 5.2 of the prompt). Mode is always SafeOnline.
baselineV061, gridSizeOnly, typedNaryOnly, fullA, noFeatureArg, noConstantArg, fullAMinusParity :: Config
baselineV061=v61Config
gridSizeOnly=v61Config {stageA=stageAOff {saGridSize=True}}
typedNaryOnly=v61Config {stageA=stageAOff {saTypedHoles=True}}
fullA=v61Config {stageA=stageAOff {saGridSize=True, saTypedHoles=True, saParityOps=True}}
noFeatureArg=fullA {stageA=(stageA fullA) {saArgPolicy=ConstantOnly}}
noConstantArg=fullA {stageA=(stageA fullA) {saArgPolicy=FeatureOnly}}
fullAMinusParity=fullA {stageA=(stageA fullA) {saParityOps=False}}
namedConfigs :: [(String,Config)]
namedConfigs=[("BaselineV061",baselineV061),("GridSizeOnly",gridSizeOnly),("TypedNaryOnly",typedNaryOnly),("FullA",fullA)
  ,("NoFeatureArg",noFeatureArg),("NoConstantArg",noConstantArg),("FullAMinusParity",fullAMinusParity)]
configNames :: [String]
configNames=map fst namedConfigs
configByName :: String -> Maybe Config
configByName n=lookup n namedConfigs

-- Grids of arbitrary size (the v0.6 helpers are fixed to 30x30).
gridOf :: Int -> Int -> [(Int,Int,Int)] -> Grid
gridOf w h xs=either (\e->error (e++" "++show (w,h,xs))) id (gridFromCells (Dimensions w h) 0 [(Coord x y,c) | (x,y,c)<-xs])
lcg :: Int -> [Int]
lcg seed=drop 1 (iterate (\x->(x*1103515245+12345) `mod` 2147483648) (abs seed+7))
pick :: [Int] -> Int -> [a] -> (a,[Int])
pick (r:rs) _ xs=(xs !! (r `mod` length xs),rs)
pick [] _ xs=(xs !! 0,[])

data Family = SizeScale | SizeOffset | SizeFromFeature | TwoHoles | ParityMod | ParityIf
  | CardinalityMismatchStillBlocked | CounterexampleConstantTruth | CounterexampleFeatureTruth
  deriving (Eq,Ord,Show,Enum,Bounded)
familyName :: Family -> String
familyName=show
-- Configurations whose train-exactness the mechanism is DESIGNED to show
-- (positive controls, asserted by the tests). Other configurations may or may
-- not find a train-exact expression (the bounded typed search can fit
-- coincidental expressions such as Sub(13, Mod(Count,3))); the runner reports
-- the observed value for every configuration instead of asserting it.
familyExpectation :: Family -> [String]
familyExpectation f=case f of
  SizeScale->["GridSizeOnly","FullA","FullAMinusParity","NoConstantArg","NoFeatureArg"]
  SizeOffset->["FullA","FullAMinusParity","NoFeatureArg"]
  SizeFromFeature->["GridSizeOnly","FullA","FullAMinusParity","NoConstantArg"]
  TwoHoles->["FullA","FullAMinusParity"]
  ParityMod->["FullA"]
  ParityIf->["FullA"]
  CardinalityMismatchStillBlocked->[]
  CounterexampleConstantTruth->["GridSizeOnly","FullA","FullAMinusParity"]
  CounterexampleFeatureTruth->["GridSizeOnly","FullA","FullAMinusParity"]
-- Negative controls that are guaranteed by construction (the required
-- operator or binding kind is not visible under the configuration).
familyNegativeControls :: Family -> [String]
familyNegativeControls f=case f of
  SizeOffset->["GridSizeOnly"]                      -- W+3: fixed templates offer only W+-1 and W+feature (no feature is 3 on every case)
  TwoHoles->["GridSizeOnly"]                        -- H-CountObjects < H-1: not a fixed template
  ParityMod->["GridSizeOnly"]                       -- W+(W mod 3) is not a fixed template
  ParityIf->["GridSizeOnly"]                        -- fixed templates cannot express the parity switch (FullAMinusParity can fit coincidental arithmetic)
  CardinalityMismatchStillBlocked->configNames      -- the alignment path keeps requiring equal cardinality
  _->[]

data Instance = Instance { insFamily :: Family, insSeed :: Int, insRule :: String, insTrain :: [(Grid,Grid)], insHeld :: (Grid,Grid) } deriving (Show)
instanceTask :: Instance -> Task
instanceTask i=Task (familyName (insFamily i)++"-"++show (insSeed i)) (insTrain i) [TestPair (fst (insHeld i)) (Just (snd (insHeld i)))]

-- Objects: n rectangles with distinct colors on distinct columns, separated by
-- at least one empty column and row so that the encoder sees n components.
-- hLimit bounds the rows objects may occupy so that they also fit the
-- (possibly smaller) output canvas of the family rule.
objectsFor :: [Int] -> Int -> Int -> Int -> ([Ob],[Int])
objectsFor rs w hLimit n=go rs n 0 []
  where go rest 0 _ acc=(reverse acc,rest)
        go rest k x acc=
          let (ow,r1)=if 3*k>w-x then (1,rest) else pick rest 0 [1,2]   -- keep room for the remaining objects
              (oh,r2)=pick r1 0 [1,2]
              (oy,r3)=pick r2 0 [0..max 0 (hLimit-oh-1)]
              col=9-length acc
              x'=x
          in if x'+ow>w then (reverse acc,rest) else go r3 (k-1) (x'+ow+1) (rectOb (x',oy) ow oh col:acc)
place :: Int -> Int -> [Ob] -> Grid
place w h obs=gridOf w h (concat [placeOb (obX o,obY o) o | o<-obs])
-- Output: same objects at the same positions on a canvas of the given size.
sameObjects :: (Int,Int) -> [Ob] -> Grid
sameObjects (w,h) obs=place w h obs

-- Case generator: (input size, object count) chosen by the seed; the family's
-- size rule computes the output canvas. The heldout case uses sizes/counts not
-- present in training wherever the rule makes that distinguishable.
mkCases :: Family -> Int -> Instance
mkCases fam seed=
  let famKey=if fam `elem` [CounterexampleConstantTruth,CounterexampleFeatureTruth] then fromEnum CounterexampleConstantTruth else fromEnum fam
      rs0=lcg (seed*31+famKey)
      -- input sizes small enough for every rule to stay inside 30x30
      pool=[(w,h) | w<-[9..13], h<-[5..11]]
      (trainSizes,heldSize,counts,heldCount)=case fam of
        SizeFromFeature->(takeDistinct 3 pool (drop 5 rs0),(12,7),[2,3,4],5)
        TwoHoles->(takeDistinct 3 [(w,h) | w<-[9..13], h<-[7..12]] (drop 5 rs0),(12,8),[2,3,4],3)
        ParityMod->([(9,6),(10,8),(11,5),(13,7)],(12,9),[2,2,3,2],2)   -- widths 9,10,11,13: no linear 2W-9 coincidence
        ParityIf->([(9,10),(10,7),(11,9),(12,8)],(13,6),[2,2,2,2],2)   -- constant object count: parity is the only varying explanation
        CounterexampleConstantTruth->(takeDistinct 3 pool (drop 5 rs0),(12,7),[2,2,2],3)
        CounterexampleFeatureTruth->(takeDistinct 3 pool (drop 5 rs0),(12,7),[2,2,2],3)
        _->(takeDistinct 3 pool (drop 5 rs0),(12,7),[2,3,2],3)
      ruleOf (w,h) n=case fam of
        SizeScale->(2*w,2*h)
        SizeOffset->(w+3,h+1)
        SizeFromFeature->(w+n,h)
        TwoHoles->(2*w+1,h-n)
        ParityMod->(w+w `mod` 3,h)
        ParityIf->(w,if odd w then h else w)
        CardinalityMismatchStillBlocked->(w+2,h)
        CounterexampleConstantTruth->(w+2,h)
        CounterexampleFeatureTruth->(w+n,h)
      ruleText=case fam of
        SizeScale->"Size2 = (2*W, 2*H); objects keep their positions"
        SizeOffset->"Size2 = (W+3, H+1); objects keep their positions"
        SizeFromFeature->"Size2 = (W+CountObjects, H); objects keep their positions"
        TwoHoles->"Size2 = (2*W+1, H-CountObjects); objects keep their positions"
        ParityMod->"Size2 = (W + (W mod 3), H); objects keep their positions"
        ParityIf->"Size2 = (W, if isOdd W then H else W); objects keep their positions"
        CardinalityMismatchStillBlocked->"Size2 = (W+2, H); output gains one object (count mismatch)"
        CounterexampleConstantTruth->"Size2 = (W+2, H); CountObjects==2 on every training case (constant and feature coincide); heldout count 3"
        CounterexampleFeatureTruth->"Size2 = (W+CountObjects, H); CountObjects==2 on every training case; heldout count 3"
      build (w,h) n rs=
        let (obs,rs')=objectsFor rs w (min h (snd (ruleOf (w,h) n))) n
            (ow,oh)=ruleOf (w,h) (length obs)
            out=case fam of
              CardinalityMismatchStillBlocked->place ow oh (obs++[rectOb (ow-1,oh-1) 1 1 1])
              _->sameObjects (ow,oh) obs
        in ((place w h obs,out),rs')
      (trainPairs,rsN)=foldl (\(acc,rs) (sz,n)->let (p,rs')=build sz n rs in (acc++[p],rs')) ([],drop 40 rs0) (zip trainSizes counts)
      (held,_)=build heldSize heldCount rsN
  in Instance fam seed ruleText trainPairs held
  where takeDistinct :: Int -> [(Int,Int)] -> [Int] -> [(Int,Int)]
        takeDistinct k xs rs=go k xs rs []
          where go 0 _ _ acc=reverse acc
                go n ys rr acc=let (c,rr')=pick rr 0 ys in go (n-1) (filter (/=c) ys) rr' (c:acc)

-- Instances per family (seeds are fixed; the heldout is for scoring only).
mechanismInstances :: Int -> [Instance]
mechanismInstances per=[mkCases fam s | fam<-[minBound..maxBound], s<-[1..per]]

trainExactOf :: Task -> Front -> Bool
trainExactOf t f=maybe False (\p->all (\(x,y)->runProgram p x==Right y) (training t)) (program f)
heldExactOf :: Task -> Front -> Bool
heldExactOf t f=maybe False (\p->not (null (tests t)) && all (\q->maybe False (\y->runProgram p (testInput q)==Right y) (testOutput q)) (tests t)) (program f)

runFront :: Config -> [(Grid,Grid)] -> IO (Front,Double)
runFront conf pairs=do
  start<-getMonotonicTimeNSec
  let f=frontSearch SafeOnline conf pairs
  _<-evaluate (length (show f))
  end<-getMonotonicTimeNSec
  pure (f,fromIntegral (end-start)/1e9)

-- Failure stage classification (prefix of the failure string).
failureStage :: String -> String
failureStage why
  | why=="None"="none"
  | otherwise=case [s | (p,s)<-table, p `isPrefixOf` why] of (s:_)->s; []->"other"
  where table=[("layout:","layout_guard"),("grounding:","grounding"),("size:","size_rule"),("RankAlign","cardinality"),("alignment validation","alignment_validation")
              ,("alignment","alignment"),("feature transformation","transformation"),("realization: output realization failed","grid_realization"),("realization","grid_exact_check")
              ,("relation:","relation_search"),("shape:","shape_decomposition"),("render:","render")]

sizeRuleJSON :: Graph -> Maybe Program -> String
sizeRuleJSON g p=
  let fromProgram=p >>= progSize
      -- the synthesized rule feature (expression "Size2(...)"), not the input GridSize feature
      ruleFeatures=[f | f<-features g, featureType f==Size2T, trigger f==Just NeedCanvas, "Size2(" `isPrefixOf` expression f]
      reps side r=arrayJSON [objectJSON [("expression",jsonString (renderT gridFeatureName (cExpr c))),("cost",show (cCost c)),("enumeration_index",show (cIndex c))
                    ,("bindings",arrayJSON (map (jsonString . bindingText) (cBindings c))),("dependencies",arrayJSON (map (jsonString . gridFeatureName) (cDependencies c)))] | c<-side r]
  in objectJSON [("exact",boolJSON (metric "size_rule_exact" g>0))
    ,("rule",maybe (case ruleFeatures of (f:_)->jsonString (expression f); []->"null") (jsonString . sizeRuleText) fromProgram)
    ,("witness",arrayJSON (map jsonString (maybe (concatMap provenance ruleFeatures) srWitness fromProgram)))
    ,("width_representatives",maybe "[]" (reps srWidthReps) fromProgram),("height_representatives",maybe "[]" (reps srHeightReps) fromProgram)
    ,("templates",show (metric "size_rule_templates" g)),("evaluations",show (metric "size_rule_evaluations" g)),("candidates",show (metric "size_rule_candidates" g))
    ,("truncations",show (metric "size_rule_truncations" g))]

-- Hole bindings of the executed program: size rule leaves and typed slot expressions.
typedBindings :: Program -> [String]
typedBindings p=
  let Program _ ex defs _ _ _ size tr _=p
      defsOf=case ex of Inline d->[d]; CallTop n->maybe [] (:[]) (M.lookup n defs)
      slots=concat [[("first-AX",fst (bodyFirst b)),("first-AY",snd (bodyFirst b)),("following-AX",fst (bodyNext b)),("following-AY",snd (bodyNext b))] | Definition _ b _<-defsOf]
  in [ "size.width = "++renderT gridFeatureName (srWidth r) | Just r<-[size]]
     ++[ "size.height = "++renderT gridFeatureName (srHeight r) | Just r<-[size]]
     ++[ "objects = "++transformText t | Just t<-[tr]]
     ++[ s++" = "++renderT slotLeafName e | (s,Typed e)<-slots, tr==Nothing]

stageAFeaturesJSON :: Graph -> String
stageAFeaturesJSON g=arrayJSON [objectJSON [("slot",jsonString (expression f)),("type",jsonString (show (featureType f))),("provenance",arrayJSON (map jsonString (provenance f)))]
  | f<-features g, any ("typed N-ary hole synthesis" `isPrefixOf`) (provenance f)]

frontJSON :: String -> Task -> Front -> Double -> String
frontJSON cfgName task f seconds=
  let g=graph f
      trainExact=trainExactOf task f
      heldExact=heldExactOf task f
  in objectJSON [("version",jsonString "LATIS-stage-A"),("task",jsonString (taskId task)),("config",jsonString cfgName)
    ,("front_train_exact",boolJSON trainExact),("front_heldout_exact",boolJSON heldExact),("front_failure",jsonString (failure f))
    ,("failure_stage",jsonString (failureStage (failure f)))
    ,("size_rule",sizeRuleJSON g (program f))
    ,("grid_realization",objectJSON [("attempted",show (metric "grid_realizations_attempted" g)),("ok",show (metric "grid_realization_ok" g))
       ,("render_errors",show (metric "realization_render_errors" g)),("mismatches",show (metric "realization_mismatches" g))])
    ,("typed_holes",objectJSON [(k,show (metric k g)) | k<-words "typed_hole_slots_triggered typed_hole_templates typed_hole_evaluations typed_hole_fits typed_hole_constant_fits typed_hole_feature_fits typed_hole_truncations"])
    ,("program",maybe "null" (jsonString . show) (program f))
    ,("hole_bindings",arrayJSON (maybe [] (map jsonString . typedBindings) (program f)))
    ,("typed_slot_features",stageAFeaturesJSON g)
    ,("semantic_classes",arrayJSON [objectJSON [("slot",jsonString (scSlot c)),("representatives",arrayJSON [jsonString (show (repExpr r)) | r<-scReps c]),("selected",jsonString (show (scSelected c)))] | c<-classes g])
    ,("metrics",objectJSON [(k,show v) | (k,v)<-M.toList (counters g)])
    ,("front_seconds",show seconds)
    ,("predictions",arrayJSON [maybe "null" (either (const "null") jsonGrid . flip runProgram (testInput t)) (program f) | t<-tests task])]

csvHeader :: String
csvHeader="family,seed,config,expected_train_exact,front_train_exact,front_heldout_exact,failure_stage,size_rule_exact,grid_realization_ok,search_work,typed_hole_evaluations,typed_hole_fits,size_rule_candidates,front_seconds,front_failure"

-- Mechanism matrix: every family instance under every configuration; the
-- heldout is scored only. Writes one JSON per run, the derivation graph and
-- a CSV; also the regression rows of the v0.6.1 tasks (FullA vs baseline).
runMechanism :: FilePath -> Int -> Task -> IO ()
runMechanism out per vertical=do
  createDirectoryIfMissing True out
  let instances=mechanismInstances per
  rows<-forM instances $ \ins->do
    let task=instanceTask ins
        dir=out </> familyName (insFamily ins) </> show (insSeed ins)
    createDirectoryIfMissing True dir
    writeFile (dir </> "instance.json") (objectJSON [("family",jsonString (familyName (insFamily ins))),("seed",show (insSeed ins)),("rule",jsonString (insRule ins))
      ,("train",arrayJSON [objectJSON [("input",jsonGrid x),("output",jsonGrid y)] | (x,y)<-insTrain ins])
      ,("heldout",objectJSON [("input",jsonGrid (fst (insHeld ins))),("output",jsonGrid (snd (insHeld ins)))])]++"\n")
    forM namedConfigs $ \(name,conf)->do
      (f,secs)<-runFront conf (training task)
      writeFile (dir </> (name++".json")) (frontJSON name task f secs++"\n")
      writeFile (dir </> (name++".graph.json")) (graphJSON (graph f)++"\n")
      let g=graph f
          te=trainExactOf task f
      putStrLn (taskId task++" "++name++" train="++show te++" held="++show (heldExactOf task f)++" "++failure f)
      pure (intercalate "," [familyName (insFamily ins),show (insSeed ins),name,show (name `elem` familyExpectation (insFamily ins)),show te,show (heldExactOf task f)
        ,failureStage (failure f),show (metric "size_rule_exact" g),show (metric "grid_realization_ok" g),show (metric "search_work" g)
        ,show (metric "typed_hole_evaluations" g),show (metric "typed_hole_fits" g),show (metric "size_rule_candidates" g),show secs,jsonString (failure f)])
  writeFile (out </> "mechanism_metrics.csv") (unlines (csvHeader:concat rows))
  reg<-regressionRows vertical
  writeFile (out </> "regression_v061.csv") (unlines ("task,config,front_train_exact,front_heldout_exact,same_program_body_as_baseline,same_predictions_as_baseline,search_work,front_failure":reg))
  putStrLn ("wrote "++(out </> "mechanism_metrics.csv"))

-- Regression: on the v0.6.1 tasks (A-H, P, 03560426) every Stage A
-- configuration must return the same program body and predictions as the
-- baseline (the size rule of an unchanged canvas is the identity).
regressionRows :: Task -> IO [String]
regressionRows vertical=fmap concat $ forM (v61Tasks vertical) $ \(name,t)->do
  (base,_)<-runFront baselineV061 (training t)
  forM namedConfigs $ \(cfgName,conf)->do
    (f,_)<-runFront conf (training t)
    let body p=(progExec p,progDefs p,progLibrary p)
        sameBody=fmap body (program f)==fmap body (program base)
        preds g=[fmap runProgram (program g) <*> Just (testInput q) | q<-tests t]
        samePred=preds f==preds base
    pure (intercalate "," [name,cfgName,show (trainExactOf t f),show (heldExactOf t f),show sameBody,show samePred,show (metric "search_work" (graph f)),jsonString (failure f)])
