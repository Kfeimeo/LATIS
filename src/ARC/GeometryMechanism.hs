-- Stage E0/E1 mechanism tasks: reproducible generators, expectations and the
-- matrix runner. Every instance has 4 training pairs and 1 heldout pair; the
-- heldout pair is scoring evidence only.
--
-- Families
--   NonZeroBackgroundCrop   the background colour varies per case and is the
--                           most frequent colour (never 0); a full-height bar
--                           splits it into two equal halves (legacy IsMaxArea
--                           tie); output = raw window of all foreground
--   ZeroIsForeground        as above with one foreground object of colour 0
--   MultiRectCoverAmbiguity the unique object whose proven minimal cover has 3
--                           rectangles (a staircase: two optimal covers), among
--                           a rectangle (1) and an L (2);
--                           output = raw window of that object
--   GeometryDeterminedSize  the unique object with proven cover count 3 (U/T)
--                           among an L (2), rectangles (1); output = that
--                           object alone on its own canvas (dims from bounds)
--   ResidualMarkerNegative  non-zero background, a pattern and a far 1x1
--                           marker; output = window of the pattern only: the
--                           marker is residual, not background, and the
--                           all-foreground plan must fail
module ARC.GeometryMechanism
  ( FamilyG(..), InstanceG(..), instancesG, instanceTaskG, familyExpectationG, familyNegativeG, runMechanismG
  ) where
import Synthesis.Collection.Front
import Synthesis.Collection.ContentFirst
import Synthesis.Collection.Geometry.View (ViewId(..), BackgroundHypothesis(..), viewText, viewRegions, residualOf, residualJSON, ViewResult(..))
import ARC.ContentFirstEvaluate
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

data FamilyG = NonZeroBackgroundCrop | ZeroIsForeground | MultiRectCoverAmbiguity | GeometryDeterminedSize | ResidualMarkerNegative
  deriving (Eq,Ord,Show,Enum,Bounded)
data InstanceG = InstanceG { igFamily :: FamilyG, igSeed :: Int, igTrain :: [(Grid,Grid)], igHeld :: (Grid,Grid), igNote :: String } deriving (Eq,Show)

-- A grid filled with a background colour and explicit cells on top.
filled :: Int -> Int -> Int -> [(Int,Int,Int)] -> Grid
filled w h bg cells=either (\e->error ("mechanism grid: "++e)) id (mkGrid [[maybe bg id (lookup (x,y) [((a,b),c) | (a,b,c)<-cells]) | x<-[0..w-1]] | y<-[0..h-1]])
crop :: Grid -> (Int,Int,Int,Int) -> Grid
crop g (x0,y0,x1,y1)=either error id (mkGrid [[maybe 0 id (cell g (Coord x y)) | x<-[x0..x1]] | y<-[y0..y1]])
rect :: Int -> Int -> Int -> Int -> Int -> [(Int,Int,Int)]
rect x y w h c=[(x+a,y+b,c) | a<-[0..w-1], b<-[0..h-1]]
lShape, uShape, tShape :: Int -> Int -> Int -> [(Int,Int,Int)]
lShape x y c=[(x,y,c),(x,y+1,c),(x,y+2,c),(x+1,y+2,c),(x+2,y+2,c)]                 -- cover 2
uShape x y c=[(x,y,c),(x,y+1,c),(x,y+2,c),(x+1,y+2,c),(x+2,y+2,c),(x+2,y+1,c),(x+2,y,c)] -- cover 3
-- staircase: proven minimal cover 3 with TWO optimal maximal-rectangle covers
stair :: Int -> Int -> Int -> [(Int,Int,Int)]
stair x y c=[(x,y,c),(x,y+1,c),(x+1,y+1,c),(x+1,y+2,c),(x+2,y+2,c)]
tShape x y c=[(x,y,c),(x+1,y,c),(x+2,y,c),(x+1,y+1,c),(x+1,y+2,c)]                  -- cover 2
boundsCells :: [(Int,Int,Int)] -> (Int,Int,Int,Int)
boundsCells cs=(minimum [x | (x,_,_)<-cs],minimum [y | (_,y,_)<-cs],maximum [x | (x,_,_)<-cs],maximum [y | (_,y,_)<-cs])

instancesG :: [InstanceG]
instancesG=[InstanceG f seed [make f seed i | i<-[0..3]] (make f seed 4) (note f) | f<-[minBound..maxBound], seed<-[1..3]]
  where
    note f=case f of
      NonZeroBackgroundCrop->"background colour (most frequent, never 0) varies per case; legacy background object is split into two equal halves by a full-height bar; output = window of all foreground"
      ZeroIsForeground->"as NonZeroBackgroundCrop with one colour-0 foreground object: under the new view colour 0 is a colour"
      MultiRectCoverAmbiguity->"select the unique object with a PROVEN minimal cover of 3 rectangles (a staircase with two optimal maximal-rectangle covers); crop its window"
      GeometryDeterminedSize->"select the unique object with a proven cover of 3 rectangles (U); emit it on its own canvas (dims from its bounds)"
      ResidualMarkerNegative->"non-zero background + pattern + far marker; output = pattern window only; the marker is residual, not background"
    bgs=[8,5,3,9,7]
    cs1=[[2,4,6,1,3],[1,6,2,4,9],[4,2,9,6,1]]          -- per-seed colour tables (case i uses colour cs!!i); never the background colour
    cs2=[[3,1,4,2,2],[9,3,1,2,4],[6,9,1,2,4]]
    cs3=[[7,9,1,5,4],[4,7,9,1,6],[2,4,7,3,9]]
    make f s i=
      let w=9; h=8+(s-1)
          bg=bgs!!i
          c1=cs1!!(s-1)!!i; c2=cs2!!(s-1)!!i; c3=cs3!!(s-1)!!i
          barX=4
          bar=[(barX,y,c1) | y<-[0..h-1]]                       -- full-height bar: splits the background into two halves
          -- two 5-cell objects per half (equal half areas -> legacy IsMaxArea tie);
          -- object colours: c2 x2, c3 x2, c1 x1 (bar): no unique most-frequent colour
          leftL=lShape 1 1 c2; leftT=tShape 1 (h-4) c3
          rightL=lShape 5 1 c2; rightT=tShape 5 (h-4) c3                -- mirrored layout; no shape touches the border, so no background pocket
          fg=bar++leftL++leftT++rightL++rightT
      in case f of
        NonZeroBackgroundCrop->
          let g=filled w h bg fg in (g,crop g (boundsCells fg))
        ZeroIsForeground->
          let fg0=bar++leftL++leftT++[(x,y,0) | (x,y,_)<-rightL]++rightT; g=filled w h bg fg0 in (g,crop g (boundsCells fg0))
        MultiRectCoverAmbiguity->
          let st=stair (1+(i `mod` 2)) 0 c1; r=rect 5 (0+(s `mod` 2)) 4 4 c2; l=lShape 1 (h-4) bg
              cells=st++r++l; g=filled w h 0 cells
          in (g,crop g (boundsCells st))
        GeometryDeterminedSize->
          let u=uShape (1+(i `mod` 2)) 1 c1; l=lShape 5 (1+(s `mod` 2)) c2; r=rect 1 (h-3) 4 2 c2; d=rect 7 (h-3) 1 1 c1
              cells=u++l++r++d; g=filled w h 0 cells
          in (g,filled 3 3 0 [(x-(1+(i `mod` 2)),y-1,c) | (x,y,c)<-u])
        ResidualMarkerNegative->
          let pattern=rect 1 1 3 2 c1++lShape 4 1 c2++rect 2 4 2 2 c2; marker=[(w-1,h-1,c1)]
              g=filled w h bg (pattern++marker)
          in (g,crop g (boundsCells pattern))

instanceTaskG :: InstanceG -> Task
instanceTaskG ins=Task (show (igFamily ins)++"-"++show (igSeed ins)) (igTrain ins) [TestPair (fst (igHeld ins)) (Just (snd (igHeld ins)))]

familyExpectationG :: FamilyG -> [String]
familyExpectationG f=case f of
  NonZeroBackgroundCrop->["BackgroundViewsOnly","FullE01"]
  ZeroIsForeground->["BackgroundViewsOnly","FullE01"]
  MultiRectCoverAmbiguity->["GeometryFeaturesOnly","FullE01"]
  GeometryDeterminedSize->["GeometryFeaturesOnly","FullE01"]
  ResidualMarkerNegative->["BackgroundViewsOnly","FullE01"]
familyNegativeG :: FamilyG -> [String]
familyNegativeG f=case f of
  NonZeroBackgroundCrop->["FrozenCF","GeometryFeaturesOnly"]
  ZeroIsForeground->["FrozenCF","GeometryFeaturesOnly"]
  MultiRectCoverAmbiguity->["FrozenCF","BackgroundViewsOnly"]
  GeometryDeterminedSize->["FrozenCF","BackgroundViewsOnly"]
  ResidualMarkerNegative->["FrozenCF","GeometryFeaturesOnly"]

runMechanismG :: FilePath -> [String] -> IO ()
runMechanismG out names=do
  createDirectoryIfMissing True out
  rowsOut<-forM instancesG $ \ins->do
    let label=show (igFamily ins)++"-"++show (igSeed ins); task=instanceTaskG ins
    writeFile (out </> (label++".data.json")) (objectJSON
      [("note",jsonString (igNote ins))
      ,("train",arrayJSON [objectJSON [("input",show (rows x)),("output",show (rows y))] | (x,y)<-igTrain ins])
      ,("heldout",objectJSON [("input",show (rows (fst (igHeld ins)))),("output",show (rows (snd (igHeld ins))))])
      ,("views",arrayJSON [either (\e->objectJSON [("case",show k),("view",jsonString (viewText v)),("applicable","false"),("reason",jsonString e)])
                                   (\vr->objectJSON [("case",show k),("view",jsonString (viewText v)),("applicable","true"),("background",maybe "null" show (vrBackground vr)),("regions",show (length (vrRegions vr))),("residual_without_selection",residualJSON (residualOf x []))]) (viewRegions v x)
                          | (k,(x,_))<-zip [0::Int ..] (igTrain ins), v<-[LegacyView,BackgroundView UniformBorderColor,BackgroundView UniqueMostFrequentColor,BackgroundView NoBackground]])])
    forM names $ \name->do
      cfg<-maybe (error ("unknown configuration "++name)) pure (configByNameD' name)
      start<-getMonotonicTimeNSec
      let f=frontSearch SafeOnline cfg (training task)
      finished<-timeout 120000000 (evaluate (length (show f)))
      end<-getMonotonicTimeNSec
      let secs=fromIntegral (end-start)/1e9 :: Double
          g=graph f
          json=if not (isJust finished) then objectJSON [("family",jsonString (show (igFamily ins))),("seed",show (igSeed ins)),("config",jsonString name),("status",jsonString "timeout")]
               else objectJSON [("family",jsonString (show (igFamily ins))),("seed",show (igSeed ins)),("config",jsonString name)
                 ,("status",jsonString (if trainExactOf task f then "train_exact" else "no_fit")),("train_exact",boolJSON (trainExactOf task f)),("heldout_exact",boolJSON (heldExactOf task f))
                 ,("failure",jsonString (failure f)),("failure_stage",jsonString (failureStage (failure f))),("seconds",show secs)
                 ,("search_work",show (metric "search_work" g)),("first_solution_work",show (metric "first_solution_work" g))
                 ,("program",maybe "null" (jsonString . show) (program f)),("selected_view",maybe "null" (jsonString . viewText . cfpView) (program f >>= progContentFirst))
                 ,("geometry_metrics",objectJSON [(k,show (metric k g)) | k<-words "geo_views_created geo_views_not_applicable geo_feature_evaluations geo_cover_proven geo_cover_bounded geo_selected_rect_count"])
                 ,("content_first",contentFirstJSON (training task) g (program f))
                 ,("positive_control",boolJSON (name `elem` familyExpectationG (igFamily ins))),("negative_control",boolJSON (name `elem` familyNegativeG (igFamily ins)))]
      writeFile (out </> (label++"-"++name++".json")) json
      putStrLn (label++" "++name++(if isJust finished then " train="++show (trainExactOf task f)++" held="++show (heldExactOf task f)++" "++take 100 (failure f) else " timeout"))
      pure json
  writeFile (out </> "matrix.json") (arrayJSON (map arrayJSON rowsOut))
  where configByNameD' n=lookup n namedConfigsE01
