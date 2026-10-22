module ARC.TriggeredStress where
import Synthesis.Triggered
import Synthesis.Triggered.Parallel (Parallel(..),serialParallel,frontSearchIO)
import ARC.Dataset
import qualified ARC.TriggeredEvaluate as E
import Latent.Grid
import Control.Exception (evaluate)
import Control.Monad (forM)
import GHC.Clock (getMonotonicTimeNSec)
import System.Directory (createDirectoryIfMissing)
import System.FilePath ((</>))
import Data.List (intercalate)
import qualified Data.Map.Strict as M
import qualified Synthesis.InducedR2.Learn as R2

grid :: Int -> Int -> [(Int,Int,Int)] -> Grid
grid w h xs=either error id (gridFromCells (Dimensions w h) 0 [(Coord x y,c) | (x,y,c)<-xs])
blank :: Int -> Int -> Grid
blank w h=grid w h []
mkTask :: String -> [(Grid,Grid)] -> (Grid,Grid) -> Task
mkTask name train (x,y)=Task name train [TestPair x (Just y)]
stressTasks :: [(String,Task)]
stressTasks=
  [("A-match-pruning",mkTask "A" [prune 0,prune 1] (prune 2))
  ,("B-transform-reuse",mkTask "B" [reuse 0 1,reuse 1 1] (reuse 2 1))
  ,("C-depth-three",mkTask "C" [reuse 0 3,reuse 1 3] (reuse 2 3))
  ,("D-irrelevant-library",mkTask "D" [prune 0,prune 1] (prune 2))
  ,("E-scene-construction",mkTask "E" [corner 4 5,corner 7 8] (corner 9 11))
  ,("F-intensional-ref",mkTask "F" [ref 12 14,ref 17 19] (ref 22 24))
  ,("G-invalid-abstraction",mkTask "G" [(blank 20 20,grid 20 20 [(7,5,2)]),(blank 24 24,grid 24 24 [(10,8,2)])]
      (blank 28 28,grid 28 28 [(13,11,2)]))]
  where
    prune k=let ps=[(2*c,2+k,c) | c<-[1..8]]
            in (grid 24 10 ps,grid 24 10 [(x+if c==8 then 1 else 0,y,c) | (x,y,c)<-ps])
    reuse k delta=let ps=[(2+5*c,2+k,c) | c<-[1..3]]
                  in (grid 25 12 ps,grid 25 12 [(x+delta,y,c) | (x,y,c)<-ps])
    corner w h=(blank w h,grid w h [(w-1,h-1,2)])
    ref w h=(grid w h [(1,1,2)],grid w h [(w-1,h-1,2)])

-- Mechanism matrix deliberately measures the front-end alone; R2 fallback
-- is audited separately on H so its cost cannot hide ablation differences.
runMatrix :: FilePath -> Config -> IO ()
runMatrix=runMatrixWith serialParallel

-- The matrix itself stays sequential; `par` only sets the worker count used
-- inside each single task's source closure.
runMatrixWith :: Parallel -> FilePath -> Config -> IO ()
runMatrixWith par out conf=do
  createDirectoryIfMissing True out
  rows'<-forM stressTasks $ \(name,task)->forM [minBound..maxBound] $ \mode->do
    let c=conf {noiseOperators=if take 1 name=="D" then 200 else 0}
    t0<-getMonotonicTimeNSec
    (f,closureTime)<-frontSearchIO par mode c (training task)
    _<-evaluate (metric "search_work" (graph f)+M.size (features (graph f))+length (show (frontProgram f))+length (frontFailure f))
    t1<-getMonotonicTimeNSec
    let r=Result f Nothing (fromIntegral (t1-t0)/1e9) "Not run: front-end-only mechanism matrix" closureTime
        g=graph f
        exact=maybe False (\p->all (\t->maybe False (\y->runProgram p (testInput t)==Right y) (testOutput t)) (tests task)) (frontProgram f)
    E.saveWith par (out </> name </> show mode) mode c task r
    putStrLn (name++" "++show mode++" front="++show (frontFailure f)++" work="++show (metric "search_work" g))
    pure (intercalate "," ([name,show mode,show (maybe False (const True) (frontProgram f)),show exact]
      ++[show (metric key g) | key<-words "search_work operator_applications frozen_features transform_cache_hits construction_triggers intensional_lift_successes accepted_relations UntriggeredExpansionCount ConcreteParameterExposureCount"]++[show (elapsedSeconds r),show closureTime,show (workers par)]))
  writeFile (out </> "metrics.csv") (unlines ("task,mode,front_exact,heldout_exact,search_work,operator_applications,frozen_features,transform_cache_hits,construction_triggers,intensional_lift_successes,accepted_relations,UntriggeredExpansionCount,ConcreteParameterExposureCount,wall_clock,closure_wall_clock,workers":concat rows'))

runFallbackMatrix :: FilePath -> Config -> IO ()
runFallbackMatrix out conf=do
  createDirectoryIfMissing True out
  rows'<-forM stressTasks $ \(name,task)->do
    r<-solve R2FallbackOnly conf (training task)
    E.save (out </> name) R2FallbackOnly conf task r
    let train=all (\(x,y)->predict conf r x==Right y) (training task)
        held=all (\t->maybe False (\y->predict conf r (testInput t)==Right y) (testOutput t)) (tests task)
        work=maybe 0 (M.findWithDefault 0 "total_expanded_work" . R2.inducedMetrics) (fallback r)
    putStrLn (name++" R2FallbackOnly train="++show train++" heldout="++show held++" work="++show work)
    pure (intercalate "," [name,show train,show held,show work,show (elapsedSeconds r)])
  writeFile (out </> "metrics.csv") (unlines ("task,train_exact,heldout_exact,r2_search_work,wall_clock":rows'))
