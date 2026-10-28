-- Stage E2/E3 + E3.1 mechanism tasks: frozen generators, expectations, matrix runner.
-- 4 training pairs + 1 heldout per instance; heldout is scoring only.
--
-- Stage E3.1 adds five families that exercise the input-side selector
-- precheck and the cache keys (the generators are frozen before the runs):
--   SelectorCardinalityCaseDependent  the competitor selector is unique on cases 0-2 and
--                                     non-unique on case 3 (case-dependent cardinality)
--   SelectorEmptyInOneCase            the competitor colour selector is empty on case 3 only
--   BackgroundViewSelectorDivergence  the same selector AST is non-unique in the legacy view
--                                     and unique in the most-frequent-colour view
--   NestedRegionOwnership             a dot inside a ring inside a quadrant: ownership at depth 1
--   OneCaseCoincidence                a candidate fits training case 0 only (never accepted)
module ARC.RegionMechanism
  ( FamilyR(..), InstanceR(..), instancesR, instanceTaskR, familyExpectationR, familyNegativeR, runMechanismR, filledR, shellCellsR, e31FamilyR
  ) where
import Synthesis.Collection.Front
import Synthesis.Collection.Region.Program (programText)
import Synthesis.Collection.Region.Search (regionMetricNames)
import ARC.ContentFirstEvaluate
import ARC.StageDEvaluate (configByNameD)
import ARC.StageAEvaluate (trainExactOf, heldExactOf, failureStage)
import ARC.Dataset (Task(..), TestPair(..))
import ARC.Evaluate (jsonString)
import ARC.InducedR1Evaluate (objectJSON, arrayJSON, boolJSON)
import Latent.Grid
import Control.Exception (evaluate)
import Control.Monad (forM)
import GHC.Clock (getMonotonicTimeNSec)
import System.Directory (createDirectoryIfMissing)
import System.FilePath ((</>))
import System.Timeout (timeout)
import Data.Maybe (isJust)

data FamilyR = ShellVsPixelPatchwork | BackgroundByResidual | CrossSeparatorPartition | RingSeparatorPartition | InvalidObjectStraddle
  | RegionPreserveWithLocalEdit | SharedRuleAcrossRegions | CrossRegionCopyCounterexample | BreadthBeatsDeepWrongView | LazyVsEagerFinitePartition
  | SelectorCardinalityCaseDependent | SelectorEmptyInOneCase | BackgroundViewSelectorDivergence | NestedRegionOwnership | OneCaseCoincidence
  deriving (Eq,Ord,Show,Enum,Bounded)
data InstanceR = InstanceR { irFamily :: FamilyR, irSeed :: Int, irTrain :: [(Grid,Grid)], irHeld :: (Grid,Grid), irNote :: String } deriving (Eq,Show)

e31FamilyR :: FamilyR -> Bool
e31FamilyR f=f `elem` [SelectorCardinalityCaseDependent,SelectorEmptyInOneCase,BackgroundViewSelectorDivergence,NestedRegionOwnership,OneCaseCoincidence]

filledR :: Int -> Int -> Int -> [(Int,Int,Int)] -> Grid
filledR w h bg cells=either (\e->error ("mechanism grid: "++e)) id (mkGrid [[maybe bg id (lookup (x,y) [((a,b),c) | (a,b,c)<-cells]) | x<-[0..w-1]] | y<-[0..h-1]])
cropR :: Grid -> (Int,Int,Int,Int) -> Grid
cropR g (x0,y0,x1,y1)=either error id (mkGrid [[maybe 0 id (cell g (Coord x y)) | x<-[x0..x1]] | y<-[y0..y1]])
rect :: Int -> Int -> Int -> Int -> Int -> [(Int,Int,Int)]
rect x y w h c=[(x+a,y+b,c) | a<-[0..w-1], b<-[0..h-1]]
shellCellsR :: Int -> Int -> Int -> Int -> Int -> [(Int,Int,Int)]
shellCellsR x y w h c=[(x+a,y+b,c) | a<-[0..w-1], b<-[0..h-1], a==0 || b==0 || a==w-1 || b==h-1]
cross :: Int -> Int -> Int -> Int -> Int -> [(Int,Int,Int)]
cross w h cx' cy' c=[(cx',y,c) | y<-[0..h-1]]++[(x,cy',c) | x<-[0..w-1]]
bar :: Int -> Int -> Int -> [(Int,Int,Int)]
bar h x c=[(x,y,c) | y<-[0..h-1]]
recolor :: Int -> [(Int,Int,Int)] -> [(Int,Int,Int)]
recolor c=map (\(x,y,_)->(x,y,c))
paint :: Grid -> [(Int,Int,Int)] -> Grid
paint g cells=either error id (mkGrid [[maybe (maybe 0 id (cell g (Coord x y))) id (lookup (x,y) [((a,b),c) | (a,b,c)<-cells]) | x<-[0..gridWidth (dimensions g)-1]] | y<-[0..gridHeight (dimensions g)-1]])
-- Quadrant q (0 top-left, 1 top-right, 2 bottom-left, 3 bottom-right) of a w x h canvas with a cross at (cx', cy'): (x0,y0,x1,y1).
quadrant :: Int -> Int -> Int -> Int -> Int -> (Int,Int,Int,Int)
quadrant w h cx' cy' q=
  let (x0,y0)=[(0,0),(cx'+1,0),(0,cy'+1),(cx'+1,cy'+1)]!!q
      x1=if x0==0 then cx'-1 else w-1; y1=if y0==0 then cy'-1 else h-1
  in (x0,y0,x1,y1)

instancesR :: [InstanceR]
instancesR=[InstanceR f seed [make f seed i | i<-[0..3]] (make f seed 4) (note f) | f<-[minBound..maxBound], seed<-[1..3]]
  where
    note f=case f of
      ShellVsPixelPatchwork->"a shell object (RectOuter \\ RectInner) splits the canvas into inside/outside; output = crop of the inside (the smaller content region); the shell's C_ast is lower than a pixel patchwork and differs from C_rect"
      BackgroundByResidual->"non-zero residual colour, a colour-0 foreground object; a full-height bar splits the canvas; output = crop of the content region holding colour 0"
      CrossSeparatorPartition->"a cross separator gives k = 4 content regions; exactly one quadrant holds an object; output = crop of that quadrant"
      RingSeparatorPartition->"a closed ring separator: inside/outside (k = 2); the inside holds a non-rectangular object with a hole; output = crop of the inside"
      InvalidObjectStraddle->"a bar interrupted by a crossing object: in the legacy view no legal k >= 2 separator exists (bar pieces and the crossing object give k = 1; the NoBackground view can enclose the dot with the colour-0 blob, a legal but useless split); the target (crop of the crossing object) is NOT a region program; the straddle rule itself is exercised in the unit tests with a merged-object scene"
      RegionPreserveWithLocalEdit->"cross separator; three quadrants preserved, the objects of the smallest quadrant recoloured; PreserveExcept(Recolor)[UniqueSmallestContent]"
      SharedRuleAcrossRegions->"cross separator; every quadrant's objects recoloured to the same colour (shared rule at the root); the heldout changes the input colours"
      CrossRegionCopyCounterexample->"bar separator; the small left region holds a pattern, the large right region holds 1-pixel markers; output = pattern stamped at every marker (cross-region read/write)"
      BreadthBeatsDeepWrongView->"the separator bar is colour 0 on a non-zero background: the legacy view is legal but has no separator (every candidate fails), the most-frequent-colour view has a layer-0 crop fit; breadth exposes it earlier than view-sequential search"
      LazyVsEagerFinitePartition->"small canvas with a cross and two nested separators; output = crop of the quadrant holding the nested ring (eager closure == lazy; budget cut reported)"
      SelectorCardinalityCaseDependent->"cross separator; the colour-7 quadrant is the target; on cases 0-2 it is the only quadrant with objects, on case 3 (and the heldout) a second quadrant holds an object: UniqueContentWithObjects / UniqueContentWithObjectCount(1) are unique on three cases and non-unique on the fourth, so the input-side precheck must reject them with a case-3 witness while UniqueContentWithColor(7) + Crop fits"
      SelectorEmptyInOneCase->"cross separator; one quadrant holds a 2x1 object: colour 5 on cases 0-2 and the heldout, colour 8 on case 3; UniqueContentWithColor(5) is valid on cases 0-2 and EMPTY on case 3 (and UniqueContentWithColor(8) empty on 0-2); UniqueContentWithObjects + Crop fits every case"
      BackgroundViewSelectorDivergence->"non-zero background, a full-height bar of another colour, a top line and a dot in the left region: in the legacy view (colour 0 = background) the background cells are objects, so both sides hold objects and UniqueContentWithObjects is non-unique; in the most-frequent-colour view only the line and the dot are objects and the same selector is unique; output = crop of the left region (no single legacy object or same-colour set has that bbox)"
      NestedRegionOwnership->"cross separator; the target quadrant holds a ring with a dot inside its hole (2 objects owned by the quadrant at depth 1), another quadrant holds one plain object; UniqueContentWithObjectCount(2) + Crop fits, UniqueContentWithObjectCount(1) crops the wrong quadrant, UniqueContentWithObjects is non-unique"
      OneCaseCoincidence->"cross at (3,3) so the top-left 3x3 quadrant is always the unique smallest; the colour-7 object (the target quadrant) is in the top-left on case 0 only: CropRegion[UniqueSmallestContent] fits training case 0 and no other case; CropRegion[UniqueContentWithObjects] (and UniqueContentWithColor(7)) fit all"
    cols=[[2,4,6,1,3],[1,6,2,4,9],[4,2,9,6,1]]
    cols2=[[3,1,4,2,7],[9,3,1,2,4],[6,9,1,2,4]]
    make f s i=
      let c1=cols!!(s-1)!!i; c2=cols2!!(s-1)!!i
          w=10+s; h=9+(i `mod` 2)+s
      in case f of
        ShellVsPixelPatchwork->
          let sw=4+(i `mod` 3); sh=3+(s `mod` 2)+(i `mod` 2); sx=1+(i `mod` 2); sy=1
              inside=[(sx+1+(sw-2) `div` 2,sy+1,c2)]
              g=filledR w h 0 (shellCellsR sx sy sw sh c1++inside++[(w-2,h-2,c2)])
          in (g,cropR g (sx+1,sy+1,sx+sw-2,sy+sh-2))
        BackgroundByResidual->
          let bg=[8,5,3,9,7]!!i; bx=4+(i `mod` 2)
              left=rect 1 1 2 2 0; right=rect (bx+2) 2 2 1 c2
              g=filledR w h bg (bar h bx c1++left++right++[(bx+1,h-2,c2)])
          in (g,cropR g (0,0,bx-1,h-1))
        CrossSeparatorPartition->
          let cx'=4+(i `mod` 2); cy'=4+(s `mod` 2)
              q=[(0,0),(cx'+1,0),(0,cy'+1),(cx'+1,cy'+1)]!!(i `mod` 4)
              obj=rect (fst q+1) (snd q+1) 2 1 c2
              g=filledR w h 0 (cross w h cx' cy' c1++obj)
              (x0,y0)=q; x1=if x0==0 then cx'-1 else w-1; y1=if y0==0 then cy'-1 else h-1
          in (g,cropR g (x0,y0,x1,y1))
        RingSeparatorPartition->
          let rw=6+(i `mod` 2); rh=6+(s `mod` 2); rx=1+(i `mod` 3); ry=1
              inner=[(rx+2,ry+2,c2),(rx+3,ry+2,c2),(rx+2,ry+3,c2),(rx+4,ry+3,c2),(rx+2,ry+4,c2),(rx+3,ry+4,c2),(rx+4,ry+4,c2)]
              g=filledR w h 0 (shellCellsR rx ry rw rh c1++inner++[(w-1,h-1,c2)])
          in (g,cropR g (rx+1,ry+1,rx+rw-2,ry+rh-2))
        InvalidObjectStraddle->
          -- the bar is interrupted by a colour-2 cell of a 3-cell horizontal object that crosses it:
          -- neither bar piece is a legal separator (R \ piece stays connected, k = 1) and the crossing
          -- object itself only yields k = 1; no anonymous cut exists, so no region program fits
          let bx=5; yy=3+i `mod` 2; strad=[(bx-1,yy,c2),(bx,yy,c2),(bx+1,yy,c2)]
              g=filledR w h 0 (strad++[(bx,y,c1) | y<-[0..h-1], y/=yy]++[(1,1,c2)])
          in (g,cropR g (bx-1,yy,bx+1,yy))
        RegionPreserveWithLocalEdit->
          let cx'=3; cy'=3                                   -- top-left quadrant 3x3 is the unique smallest
              small=[(0,0,c2),(1,0,c2),(1,2,c2)]
              others=rect (cx'+2) 1 2 1 c2++rect 1 (cy'+2+(i `mod` 2)) 3 1 c2++[(cx'+2+(i `mod` 3),cy'+3,c2)]
              g=filledR (w+2) (h+3) 0 (cross (w+2) (h+3) cx' cy' c1++small++others)
          in (g,paint g (recolor ([5,7,9]!!(s-1)) small))
        SharedRuleAcrossRegions->
          -- content objects of two colours, an L, a 6x6 block (larger than the cross), a bar and a dot:
          -- no legacy selector (colour, max/min area, most-frequent colour, shape) isolates exactly them
          let cx'=6+(i `mod` 2); cy'=6
              c3=[7,8,5,3,8]!!i
              objs=[(1,1,c2),(1,2,c2),(2,2,c2)]++rect (cx'+1) 0 6 6 c3++rect 1 (cy'+2) 3 1 c2++[(cx'+2,cy'+2+(i `mod` 2),c3)]++[(cx'+4,cy'+3,c1)]   -- a second c1 object: no least-frequent colour
              g=filledR (w+3) (h+3) 0 (cross (w+3) (h+3) cx' cy' c1++objs)
          in (g,paint g (recolor ([4,8,6,2,5]!!s) objs))
        CrossRegionCopyCounterexample->
          let bx=3; pat=[(0,1,c2),(1,1,c2),(1,2,c1),(0,0,c1)]
              marks=[(bx+2+2*k,1+2*k,c2) | k<-[0..i `mod` 3]]
              g=filledR (w+2) (h+2) 0 (bar (h+2) bx c1++pat++marks)
              stamps=concat [[(mx+dx,my+dy,c) | (dx,dy,c)<-pat] | (mx,my,_)<-marks]
          in (g,paint g stamps)
        BreadthBeatsDeepWrongView->
          -- the separator bar has colour 0 on a non-zero background: in the legacy view it is residual
          -- (no separator object at all), in the most-frequent-colour view it is an object with k = 2
          let bg=[8,5,3,9,7]!!i; bx=3+(i `mod` 2); c3=[7,9,5,3,1]!!i
              noise=[(1,1+i `mod` 2,c2),(2,3,c3),(1,5+(i `mod` 2),c2),(bx+2,2,c2),(bx+3,4+(i `mod` 2),c3),(bx+1,6,c2),(bx+3,7,c3)]++[(bx+2+k,0,c2) | k<-[0..i `mod` 3]]++[(1,8,c3) | odd i]
              g=filledR w h bg (bar h bx 0++noise)
          in (g,cropR g (0,0,bx-1,h-1))
        LazyVsEagerFinitePartition->
          let g=filledR 11 11 0 (cross 11 11 5 5 c1++shellCellsR 1 1 3 3 c2++[(2,2,c1)]++[(8,8,c2)])
          in (g,cropR g (0,0,4,4))
        SelectorCardinalityCaseDependent->
          let cx'=4+(i `mod` 2); cy'=4+(s `mod` 2)
              qt=i `mod` 4; q2=(i+1) `mod` 4
              (tx,ty,tx1,ty1)=quadrant w h cx' cy' qt
              (ox,oy,_,_)=quadrant w h cx' cy' q2
              cOther=if c2==7 then 5 else c2
              target=rect (tx+1) (ty+1) 2 1 7
              other=if i>=3 then rect (ox+1) (oy+2) 1 2 cOther else []
              g=filledR w h 0 (cross w h cx' cy' c1++target++other)
          in (g,cropR g (tx,ty,tx1,ty1))
        SelectorEmptyInOneCase->
          let cx'=4+(i `mod` 2); cy'=4+(s `mod` 2)
              qt=(i+s) `mod` 4
              (tx,ty,tx1,ty1)=quadrant w h cx' cy' qt
              cObj=if i==3 then 8 else 5
              g=filledR w h 0 (cross w h cx' cy' c1++rect (tx+1) (ty+1) 2 1 cObj)
          in (g,cropR g (tx,ty,tx1,ty1))
        BackgroundViewSelectorDivergence->
          let bg=[8,5,3,9,7]!!i; bx=3+(i `mod` 2)
              cBar=if c1==bg then 6 else c1
              cDot=if c2==bg || c2==cBar then (if bg/=4 && cBar/=4 then 4 else 2) else c2
              -- a top line of the dot colour across the left region keeps every legacy object's bbox (and every
              -- same-colour set's bbox) strictly smaller than the left region, so no content-first crop coincides
              g=filledR w h bg (bar h bx cBar++[(x,0,cDot) | x<-[0..bx-1]]++[(1,2+(i `mod` 3),cDot)])
          in (g,cropR g (0,0,bx-1,h-1))
        NestedRegionOwnership->
          let w'=12+s; h'=12+s; cx'=5+(i `mod` 2); cy'=5
              qt=i `mod` 4; q2=(i+2) `mod` 4
              (tx,ty,tx1,ty1)=quadrant w' h' cx' cy' qt
              (ox,oy,_,_)=quadrant w' h' cx' cy' q2
              -- the dot colour changes with the case (never the cross or ring colour), so no colour selector fits all cases
              cDot=head [c | c<-drop i (cycle [7,8,5,9,3,6]), c/=c1, c/=c2]
              ring=shellCellsR (tx+1) (ty+1) 4 4 c2
              dot=[(tx+2,ty+2,cDot)]
              other=rect (ox+1) (oy+1) 2 1 c2
              g=filledR w' h' 0 (cross w' h' cx' cy' c1++ring++dot++other)
          in (g,cropR g (tx,ty,tx1,ty1))
        OneCaseCoincidence->
          let w'=11+s; h'=11+s; cx'=3; cy'=3
              qt=if i==4 then 0 else i `mod` 4
              (tx,ty,tx1,ty1)=quadrant w' h' cx' cy' qt
              g=filledR w' h' 0 (cross w' h' cx' cy' c1++rect (tx+1) (ty+1) 2 1 7)
          in (g,cropR g (tx,ty,tx1,ty1))

instanceTaskR :: InstanceR -> Task
instanceTaskR ins=Task (show (irFamily ins)++"-"++show (irSeed ins)) (irTrain ins) [TestPair (fst (irHeld ins)) (Just (snd (irHeld ins)))]

regionConfigs :: [String]
regionConfigs=["E2Only","RegionPriority","BreadthScheduler","RegionBreadth","FullE3","FullE3_NoMDL","FullE3_NoSafePrune"]++filter (/="FrozenE01") configNamesE31
familyExpectationR :: FamilyR -> [String]
familyExpectationR f=case f of
  InvalidObjectStraddle->[]
  _->regionConfigs
familyNegativeR :: FamilyR -> [String]
familyNegativeR f=case f of
  InvalidObjectStraddle->"FrozenE01":regionConfigs
  _->["FrozenE01"]

runMechanismR :: FilePath -> [String] -> IO ()
runMechanismR out names=do
  createDirectoryIfMissing True out
  rowsOut<-forM instancesR $ \ins->do
    let label=show (irFamily ins)++"-"++show (irSeed ins); task=instanceTaskR ins
    writeFile (out </> (label++".data.json")) (objectJSON
      [("note",jsonString (irNote ins)),("train",arrayJSON [objectJSON [("input",show (rows x)),("output",show (rows y))] | (x,y)<-irTrain ins])
      ,("heldout",objectJSON [("input",show (rows (fst (irHeld ins)))),("output",show (rows (snd (irHeld ins))))])])
    forM names $ \name->do
      cfg<-maybe (error ("unknown configuration "++name)) pure (configByNameD name)
      start<-getMonotonicTimeNSec
      let f=frontSearch SafeOnline cfg (training task)
      finished<-timeout 180000000 (evaluate (length (show f)))
      end<-getMonotonicTimeNSec
      let secs=fromIntegral (end-start)/1e9 :: Double
          g=graph f
          json=if not (isJust finished) then objectJSON [("family",jsonString (show (irFamily ins))),("seed",show (irSeed ins)),("config",jsonString name),("status",jsonString "timeout")]
               else objectJSON [("family",jsonString (show (irFamily ins))),("seed",show (irSeed ins)),("config",jsonString name)
                 ,("status",jsonString (if trainExactOf task f then "train_exact" else "no_fit")),("train_exact",boolJSON (trainExactOf task f)),("heldout_exact",boolJSON (heldExactOf task f))
                 ,("failure",jsonString (failure f)),("failure_stage",jsonString (failureStage (failure f))),("seconds",show secs)
                 ,("search_work",show (metric "search_work" g)),("first_solution_work",show (metric "first_solution_work" g))
                 ,("program",maybe "null" (jsonString . show) (program f)),("region_program",maybe "null" (jsonString . programText) (program f >>= progRegion))
                 ,("program_kind",jsonString (case program f of Nothing->"none"; Just p->if progRegion p/=Nothing then "region_program" else if progContentFirst p/=Nothing then "content_first" else "legacy"))
                 ,("region_metrics",objectJSON [(k,show (metric k g)) | k<-regionMetricNames])
                 ,("region_search",regionJSONOf (training task) g (program f))
                 ,("positive_control",boolJSON (name `elem` familyExpectationR (irFamily ins))),("negative_control",boolJSON (name `elem` familyNegativeR (irFamily ins)))]
      writeFile (out </> (label++"-"++name++".json")) json
      putStrLn (label++" "++name++(if isJust finished then " train="++show (trainExactOf task f)++" held="++show (heldExactOf task f)++" exp="++show (metric "rg_first_fit_exposure" g)++" "++take 90 (failure f) else " timeout"))
      pure json
  writeFile (out </> "matrix.json") (arrayJSON (map arrayJSON rowsOut))
