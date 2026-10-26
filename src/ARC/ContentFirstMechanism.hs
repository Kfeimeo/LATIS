-- Content-first mechanism tasks: reproducible generators, expectations, the
-- matrix runner and the old-solution regression rows.
--
-- Every instance has 4 training pairs and 1 heldout pair; the heldout pair is
-- scoring evidence only and never reaches a solver. Grids are built from
-- explicit cell lists (background 0, 4-connectivity of the repository encoder).
--
-- Baseline control: in the SelectColorThenCrop, SelectByPredicateThenEmit and
-- CropContainsOtherColors families EVERY grid-level Size2 leaf (grid size,
-- object count, distinct shapes, unique largest/smallest bbox, set bbox,
-- colour count, foreground cell count) is constant across the training cases
-- while the output size varies, so no Size-first rule over those leaves can be
-- training-exact: a filler object compensates the varying target area, a
-- fixed 7x7 block is the unique largest object and a fixed 1x1 dot the unique
-- smallest. The matrix still MEASURES the baseline instead of assuming it.
module ARC.ContentFirstMechanism
  ( FamilyCF(..), InstanceCF(..), instancesCF, instanceTaskCF, familyExpectationCF, familyNegativeCF
  , leakagePairCF, runMechanismCF, stageDSolvedIds
  ) where
import Synthesis.Collection.Front
import Synthesis.Collection.ContentFirst
import ARC.ContentFirstEvaluate
import ARC.StageAEvaluate (trainExactOf, heldExactOf, failureStage)
import ARC.Dataset (Task(..), TestPair(..), loadTask)
import ARC.Evaluate (jsonString)
import ARC.InducedR1Evaluate (objectJSON, arrayJSON, boolJSON)
import Latent.Grid
import Control.Exception (evaluate)
import Control.Monad (forM)
import GHC.Clock (getMonotonicTimeNSec)
import System.Directory (createDirectoryIfMissing, doesFileExist)
import System.FilePath ((</>))
import System.Timeout (timeout)
import Data.List (intercalate)

data FamilyCF = SelectColorThenCrop | SelectByPredicateThenEmit | CropContainsOtherColors | EmptyAndTieSelection
  | SizeEquivalentAlternatives | NoOutputLeakage | DeferredOnDownstreamFail
  deriving (Eq,Ord,Show,Enum,Bounded)
data InstanceCF = InstanceCF { icFamily :: FamilyCF, icSeed :: Int, icTrain :: [(Grid,Grid)], icHeld :: (Grid,Grid), icNote :: String } deriving (Eq,Show)

gridOf :: Int -> Int -> [(Int,Int,Int)] -> Grid
gridOf w h cells=either (\e->error ("mechanism grid: "++e++" "++show cells)) id (gridFromCells (Dimensions w h) 0 [(Coord x y,c) | (x,y,c)<-cells])
rect :: Int -> Int -> Int -> Int -> Int -> [(Int,Int,Int)]
rect x y w h c=[(x+a,y+b,c) | a<-[0..w-1], b<-[0..h-1]]
shellCells :: Int -> Int -> Int -> Int -> Int -> [(Int,Int,Int)]
shellCells x y w h c=[(x+a,y+b,c) | a<-[0..w-1], b<-[0..h-1], a==0 || b==0 || a==w-1 || b==h-1]
-- Fixtures of the constant-feature families (16x16 canvas).
anchor :: [(Int,Int,Int)]
anchor=rect 8 8 7 7 5                       -- unique largest object (49 cells)
cornerDot :: [(Int,Int,Int)]
cornerDot=[(0,15,6)]                        -- 1x1 dot
-- The filler takes f cells of the 3-wide column block (x 13..15, y 0..7) in
-- raster order starting at index 1: the missing top-left cell makes it a
-- non-rectangle for f >= 3; it is 4-connected for every f >= 1.
filler :: Int -> [(Int,Int,Int)]
filler f=[(13+(k `mod` 3),k `div` 3,3) | k<-[1..f]]
pixelBudget :: Int
pixelBudget=27                              -- target cells + filler cells per case

instancesCF :: [InstanceCF]
instancesCF=[InstanceCF f seed [make f seed i | i<-[0..3]] (make f seed 4) (note f) | f<-[minBound..maxBound], seed<-[1..3]]
  where
    note f=case f of
      SelectColorThenCrop->"unique colour-2 rectangle, varying size; every grid-level size leaf constant across training cases"
      SelectByPredicateThenEmit->"unique shell (colour varies per case) with a foreign dot inside its bbox; output = the shell alone"
      CropContainsOtherColors->"unique colour-2 shell with two foreign dots inside; output = the raw input window"
      EmptyAndTieSelection->"colour-2 selection is empty in one case and non-unique in another; no plan may fit"
      SizeEquivalentAlternatives->"frame inset 2: GridWidth-4 and Bounds(frame) agree on training; heldout inset 1 separates them"
      NoOutputLeakage->"inputs of SelectColorThenCrop with outputs cropping the filler instead; selections must not move"
      DeferredOnDownstreamFail->"constant 3x3 output: the Size2 rule fits, every Size-first object path fails, the window crop holds a second colour"
    sizesA s=[[(3,2),(5,4),(4,3),(6,3),(2,4)],[(4,2),(3,4),(5,3),(2,5),(6,2)],[(2,3),(4,5),(3,3),(5,2),(4,4)]]!!(s-1)
    sizesB s=[[(4,3),(5,5),(3,4),(6,4),(5,3)],[(3,3),(6,5),(4,4),(5,3),(3,5)],[(5,4),(3,3),(4,5),(6,3),(4,3)]]!!(s-1)
    sizesC s=[[(4,4),(5,5),(4,6),(6,4),(5,4)],[(5,4),(4,5),(6,5),(4,4),(6,6)],[(6,4),(4,4),(5,6),(4,5),(5,5)]]!!(s-1)
    pos i=([1,2,4,1,3]!!i,[1,2,1,3,2]!!i)
    shellColours=[1,2,4,7,8]
    constantScene body=gridOf 16 16 (anchor++cornerDot++body)
    make f s i=
      let (w,h)=sizesA s!!i; (x,y)=pos i
      in case f of
        SelectColorThenCrop->
          let target=rect x y w h 2
          in (constantScene (target++filler (pixelBudget-w*h)),gridOf w h (rect 0 0 w h 2))
        NoOutputLeakage->
          let target=rect x y w h 2; fl=filler (pixelBudget-w*h)
              fx=minimum [a | (a,_,_)<-fl]; fy=minimum [b | (_,b,_)<-fl]
              fw=maximum [a | (a,_,_)<-fl]-fx+1; fh=maximum [b | (_,b,_)<-fl]-fy+1
          in (constantScene (target++fl),gridOf fw fh [(a-fx,b-fy,c) | (a,b,c)<-fl])
        SelectByPredicateThenEmit->
          let (sw,sh)=sizesB s!!i; c=shellColours!!i
              sh'=shellCells x y sw sh c
          in (constantScene (sh'++[(x+1,y+1,6)]++filler (pixelBudget-length sh')),gridOf sw sh (shellCells 0 0 sw sh c))
        CropContainsOtherColors->
          let (sw,sh)=sizesC s!!i
              sh'=shellCells x y sw sh 2
              dots=[(x+1,y+1,4),(x+sw-2,y+sh-2,7)]
          in (constantScene (sh'++dots++filler (pixelBudget-length sh')),gridOf sw sh (shellCells 0 0 sw sh 2++[(1,1,4),(sw-2,sh-2,7)]))
        EmptyAndTieSelection->case i of
          1->(constantScene (rect 2 2 4 3 8++filler 15),gridOf 4 3 (rect 0 0 4 3 8))
          3->(constantScene (rect 1 1 3 2 2++rect 6 4 3 2 2++filler 15),gridOf 3 2 (rect 0 0 3 2 2))
          _->(constantScene (rect x y w h 2++filler (pixelBudget-w*h)),gridOf w h (rect 0 0 w h 2))
        SizeEquivalentAlternatives->
          let (cw,ch)=[(10,8),(12,9),(14,11),(11,10),(13,12)]!!i
              inset=if i==4 then 1 else 2
              fw=cw-2*inset; fh=ch-2*inset
          in (gridOf cw ch (shellCells inset inset fw fh 2++[(0,0,4)]),gridOf fw fh (shellCells 0 0 fw fh 2))
        DeferredOnDownstreamFail->
          let (sx,sy)=[(1,1),(5,2),(2,6),(8,1),(4,4)]!!i
          in (gridOf 16 16 (anchor++shellCells sx sy 3 3 2++[(sx+1,sy+1,4),(0,15,4)]),gridOf 3 3 (shellCells 0 0 3 3 2++[(1,1,4)]))

instanceTaskCF :: InstanceCF -> Task
instanceTaskCF ins=Task (show (icFamily ins)++"-"++show (icSeed ins)) (icTrain ins) [TestPair (fst (icHeld ins)) (Just (snd (icHeld ins)))]

-- Positive controls (asserted train-exact by the tests) and negative controls
-- (asserted NOT train-exact). Other cells are reported as observed.
familyExpectationCF :: FamilyCF -> [String]
familyExpectationCF f=case f of
  SelectColorThenCrop->["ContentFirstOnly","ContentFirstExploreAlternatives"]
  SelectByPredicateThenEmit->["ContentFirstOnly","ContentFirstExploreAlternatives"]
  CropContainsOtherColors->["ContentFirstOnly","ContentFirstExploreAlternatives"]
  EmptyAndTieSelection->[]
  SizeEquivalentAlternatives->["FrozenD","ContentFirstOnly","ContentFirstExploreAlternatives"]
  NoOutputLeakage->["ContentFirstOnly","ContentFirstExploreAlternatives"]
  DeferredOnDownstreamFail->["ContentFirstOnly","ContentFirstExploreAlternatives"]
familyNegativeCF :: FamilyCF -> [String]
familyNegativeCF f=case f of
  EmptyAndTieSelection->["FrozenD","ContentFirstOnly","ContentFirstExploreAlternatives"]
  SizeEquivalentAlternatives->[]
  _->["FrozenD"]

-- The leakage pair of a seed: identical inputs, different training targets.
leakagePairCF :: Int -> (InstanceCF,InstanceCF)
leakagePairCF seed=(pick SelectColorThenCrop,pick NoOutputLeakage)
  where pick f=head [i | i<-instancesCF, icFamily i==f, icSeed i==seed]

-- The 20 Stage D train-exact tasks (results/stage_d, FullD): regression
-- targets only; the ids never influence any search.
stageDSolvedIds :: [String]
stageDSolvedIds=words "05f2a901 1caeab9d 1cf80156 1f85a75f 23b5c85d 25ff71a9 4347f46a 5168d44c 5521c0d9 681b3aeb 810b9b61 9565186b a740d043 a79310a0 aabf363d b1948b0a be94b721 beb8660c c8f0f002 d037b0a7"

runOne :: String -> Config -> Task -> IO (Front,Bool,Double)
runOne _ cfg task=do
  start<-getMonotonicTimeNSec
  let f=frontSearch SafeOnline cfg (training task)
  finished<-timeout 120000000 (evaluate (length (show f)))
  end<-getMonotonicTimeNSec
  pure (f,maybe False (const True) finished,fromIntegral (end-start)/1e9)

instanceJSON :: String -> InstanceCF -> Front -> Bool -> Double -> String
instanceJSON name ins f completed secs=
  let task=instanceTaskCF ins; g=graph f
  in if not completed then objectJSON [("family",jsonString (show (icFamily ins))),("seed",show (icSeed ins)),("config",jsonString name),("status",jsonString "timeout"),("train_exact","false"),("heldout_exact","null")]
     else objectJSON [("family",jsonString (show (icFamily ins))),("seed",show (icSeed ins)),("config",jsonString name)
       ,("status",jsonString (if trainExactOf task f then "train_exact" else "no_fit")),("train_exact",boolJSON (trainExactOf task f)),("heldout_exact",boolJSON (heldExactOf task f))
       ,("heldout_note",jsonString "heldout pair scored only; never given to the solver")
       ,("failure",jsonString (failure f)),("failure_stage",jsonString (failureStage (failure f))),("seconds",show secs)
       ,("search_work",show (metric "search_work" g)),("first_solution_work",show (metric "first_solution_work" g))
       ,("size_rule_exact",boolJSON (metric "size_rule_exact" g>0)),("program",maybe "null" (jsonString . show) (program f))
       ,("program_kind",jsonString (case program f of Nothing->"none"; Just p->if progContentFirst p/=Nothing then "content_first_output_spec" else if progTransform p/=Nothing then "object_transform" else "ordered_sequence_body"))
       ,("content_first",contentFirstJSON (training task) g (program f))
       ,("positive_control",boolJSON (name `elem` familyExpectationCF (icFamily ins))),("negative_control",boolJSON (name `elem` familyNegativeCF (icFamily ins)))]

-- Matrix: every instance x every named configuration; the leakage comparison;
-- optionally the old-solution regression rows over ARC training pairs.
runMechanismCF :: FilePath -> [String] -> Maybe (FilePath,FilePath) -> IO ()
runMechanismCF out names regression=do
  createDirectoryIfMissing True out
  rows<-forM instancesCF $ \ins->do
    let label=show (icFamily ins)++"-"++show (icSeed ins); task=instanceTaskCF ins
    writeFile (out </> (label++".data.json")) (objectJSON
      [("note",jsonString (icNote ins))
      ,("train",arrayJSON [objectJSON [("input",show (rows' x)),("output",show (rows' y))] | (x,y)<-icTrain ins])
      ,("heldout",objectJSON [("input",show (rows' (fst (icHeld ins)))),("output",show (rows' (snd (icHeld ins))))])])
    forM names $ \name->do
      cfg<-maybe (error ("unknown content-first configuration "++name)) pure (configByNameCF name)
      (f,completed,secs)<-runOne name cfg task
      let json=instanceJSON name ins f completed secs
      writeFile (out </> (label++"-"++name++".json")) json
      writeFile (out </> (label++"-"++name++".trace.txt")) (if completed then unlines (trace (graph f)++[failure f]) else "timeout\n")
      putStrLn (label++" "++name++(if completed then " train="++show (trainExactOf task f)++" held="++show (heldExactOf task f)++" "++take 100 (failure f) else " timeout"))
      pure json
  writeFile (out </> "matrix.json") (arrayJSON (map arrayJSON rows))
  -- Leakage: identical inputs, different targets -> identical selections and
  -- identical derived dimensions wherever both tasks derived a spec.
  leaks<-forM [1..3] $ \seed->do
    let (a,b)=leakagePairCF seed
        run i=frontSearch SafeOnline contentFirstOnly (icTrain i)
        sel i=[(ccPlan c,map (fmap swBounds) (ccSelections c)) | r<-contentFirstRuns (graph (run i)), c<-crCandidates (cfrResult r)]
        specDims i=[((ccPlan c,cftCase t),osDims s) | r<-contentFirstRuns (graph (run i)), c<-crCandidates (cfrResult r), t<-ccCases c, Just s<-[cftSpec t]]
        sa=sel a; sb=sel b; da=specDims a; db=specDims b
        common=[(k,v) | (k,v)<-da, Just v'<-[lookup k db], v==v']
        differing=[k | (k,v)<-da, Just v'<-[lookup k db], v/=v']
        j=objectJSON [("seed",show seed),("inputs_identical",boolJSON (map fst (icTrain a)==map fst (icTrain b))),("targets_identical",boolJSON (map snd (icTrain a)==map snd (icTrain b)))
          ,("plans_compared",show (length sa)),("selections_identical",boolJSON (sa==sb)),("spec_dims_compared",show (length common+length differing)),("spec_dims_differing",show (length differing))
          ,("fit_a",arrayJSON [jsonString (planText (ccPlan c)) | r<-contentFirstRuns (graph (run a)), c<-crFits (cfrResult r)])
          ,("fit_b",arrayJSON [jsonString (planText (ccPlan c)) | r<-contentFirstRuns (graph (run b)), c<-crFits (cfrResult r)])]
    putStrLn ("leakage seed "++show seed++": selections identical="++show (sa==sb)++" dims differing="++show (length differing))
    pure j
  writeFile (out </> "leakage.json") (arrayJSON leaks)
  case regression of
    Nothing->pure ()
    Just (arcDir,idsFile)->do
      ids<-words <$> readFile idsFile
      regRows<-forM ids $ \tid->do
        let path=arcDir </> (tid++".json")
        exists<-doesFileExist path
        if not exists then pure (objectJSON [("task",jsonString tid),("status",jsonString "missing_file")]) else do
          loaded<-loadTask path
          case loaded of
            Left e->pure (objectJSON [("task",jsonString tid),("status",jsonString ("unreadable: "++e))])
            Right task0->do
              -- training pairs only; the test pairs of the file are never used
              let task=task0 {tests=[]}
              results<-forM names $ \name->do
                cfg<-maybe (error ("unknown configuration "++name)) pure (configByNameCF name)
                (f,completed,secs)<-runOne name cfg task
                let g=graph f
                    preds=[fmap (\p->runProgram p x) (program f) | (x,_)<-training task]
                pure (name,(f,completed,secs,preds,metric "search_work" g))
              let (f0,c0,_,p0,w0)=snd (head results)
                  core p=(progExec p,progDefs p,progTransform p,fmap srWidth (progSize p),fmap srHeight (progSize p),progContentFirst p)
                  cmp (name,(f,c,secs,preds,w))=objectJSON [("config",jsonString name),("completed",boolJSON c),("train_exact",boolJSON (trainExactOf task f)),("seconds",show secs),("search_work",show w)
                    ,("program_equal_to_first",boolJSON (fmap core (program f)==fmap core (program f0))),("predictions_equal_to_first",boolJSON (preds==p0)),("work_equal_to_first",boolJSON (w==w0))
                    ,("failure",jsonString (failure f)),("cf_triggered",show (metric "cf_triggered" (graph f))),("cf_deferred_plans",show (metric "cf_deferred_plans" (graph f)))
                    ,("content_first_classification",jsonString (finalClassification (graph f) (program f)))]
              putStrLn (tid++" regression: "++intercalate " " [name++"="++show (trainExactOf task f) | (name,(f,_,_,_,_))<-results]++" first completed="++show c0)
              pure (objectJSON [("task",jsonString tid),("train_pairs",show (length (training task))),("configs",arrayJSON (map cmp results))])
      writeFile (out </> "regression.json") (arrayJSON regRows)
  where rows'=rows
