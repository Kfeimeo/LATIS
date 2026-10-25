module ARC.StageDMechanism
  ( FamilyD(..), InstanceD(..), instancesD, runMechanismD ) where
import Synthesis.Collection.Front
import Synthesis.Collection.Unified
import Synthesis.Collection.Relation
import ARC.StageDEvaluate
import ARC.StageAEvaluate (frontJSON,trainExactOf,heldExactOf)
import ARC.Dataset (Task(..),TestPair(..))
import ARC.Evaluate (jsonString)
import ARC.InducedR1Evaluate (objectJSON,arrayJSON,boolJSON)
import Latent.Grid
import qualified Latent.Object as O
import Control.Exception (evaluate)
import Control.Monad (forM,forM_)
import GHC.Clock (getMonotonicTimeNSec)
import System.Directory (createDirectoryIfMissing)
import System.FilePath ((</>))
import System.Timeout (timeout)

data FamilyD = TypedCountReplication | FeatureDependentOffset | ColorThenMove | ShapeThenMove | SelectThenMoveThenReplicate | AmbiguousParamReferents
  deriving (Eq,Ord,Show,Enum,Bounded)
data InstanceD = InstanceD { idFamily :: FamilyD,idSeed :: Int,idTrain :: [(Grid,Grid)],idHeld :: (Grid,Grid) } deriving (Eq,Show)
grid :: Int -> Int -> [(Int,Int,Int)] -> Grid
grid w h cells=either error id (gridFromCells (Dimensions w h) 0 [(Coord x y,c) | (x,y,c)<-cells])
rectangle :: Int -> Int -> Int -> Int -> Int -> [(Int,Int,Int)]
rectangle x y w h c=[(x+a,y+b,c) | a<-[0..w-1],b<-[0..h-1]]
shell :: Int -> Int -> Int -> Int -> Int -> [(Int,Int,Int)]
shell x y w h c=[(x+a,y+b,c) | a<-[0..w-1],b<-[0..h-1],a==0 || b==0 || a==w-1 || b==h-1]
instancesD :: [InstanceD]
instancesD=[InstanceD f seed [make f seed i | i<-[0..3]] (make f seed 4) | f<-[minBound..maxBound],seed<-[1..3]]
  where
    make f seed i=
      let n=[4,5,5,6,6]!!i
          width=[19,20,21,22,25]!!i
          cols=[2,3,4,3,4]!!i
          ow=seed+(i `mod` 3)
          x=[1,2,3,1,2]!!i
          clutter k nc=[(2*j,16,2+(j-1) `mod` (nc-1)) | j<-[1..k-1]]
      in case f of
        TypedCountReplication->
          let source=rectangle 1 1 seed 1 1
              k=if odd width then n else 3
          in (grid width 20 (source++clutter n 3),grid width 20 (concat [rectangle (1+j*(seed+1)) 1 seed 1 1 | j<-[0..k-1]]))
        FeatureDependentOffset->
          let source=rectangle 1 1 ow 1 1
              k=i+4
              dx=ow+cols; dy=k-cols
          in (grid 30 20 (source++clutter k cols),grid 30 20 (source++rectangle (1+dx) (1+dy) ow 1 1))
        ColorThenMove->
          (grid 25 20 (rectangle x 1 ow 2 2),grid 25 20 (rectangle (x+ow) 2 ow 2 4))
        ShapeThenMove->
          let w=seed+4+i `mod` 2
          in (grid 25 20 (rectangle x 1 w 5 1),grid 25 20 (shell (x+w) 3 w 5 1))
        SelectThenMoveThenReplicate->
          let k=if odd width then n else 3
              wide=[25,26,27,28,29]!!i
          in (grid wide 20 (rectangle x 1 seed 1 1++clutter n 3),grid wide 20 (concat [rectangle (x+3+j*(seed+1)) 2 seed 1 1 | j<-[0..k-1]]))
        AmbiguousParamReferents->
          let w=if i==4 then 3 else 2
              delta=if i==4 && odd seed then 2 else w
          in (grid 25 20 (rectangle x 1 w 1 1),grid 25 20 (rectangle (x+delta) 1 w 1 4))

runMechanismD :: FilePath -> [String] -> IO ()
runMechanismD out names=do
  createDirectoryIfMissing True out
  summaries<-forM instancesD $ \ins->do
    let label=show (idFamily ins)++"-"++show (idSeed ins)
        task=Task label (idTrain ins) [TestPair (fst (idHeld ins)) (Just (snd (idHeld ins)))]
    results<-forM names $ \name->do
      cfg<-maybe (error ("unknown D config "++name)) pure (configByNameD name)
      start<-getMonotonicTimeNSec
      let f=frontSearch SafeOnline cfg (idTrain ins)
      finished<-timeout 60000000 (evaluate (length (show f)))
      end<-getMonotonicTimeNSec
      let completed=case finished of Just _->True; _->False
          g=graph f
          trainOK=trainExactOf task f
          heldOK=heldExactOf task f
          json=if not completed then objectJSON [("family",jsonString (show (idFamily ins))),("seed",show (idSeed ins)),("config",jsonString name),("status",jsonString "timeout"),("train_exact","false"),("heldout_exact","null"),("stage_d","null")]
            else objectJSON [("family",jsonString (show (idFamily ins))),("seed",show (idSeed ins)),("config",jsonString name),("status",jsonString (if trainOK then "train_exact" else "no_fit"))
            ,("train_exact",boolJSON trainOK),("heldout_exact",boolJSON heldOK),("failure",jsonString (failure f))
            ,("seconds",show (fromIntegral (end-start)/1e9::Double)),("stage_d",stageDMetricsJSON g),("parameter_goals",goalsJSON g)
            ,("program",maybe "null" (jsonString . show) (program f)),("witnesses",witnessesJSON (idTrain ins) (program f))]
      writeFile (out </> (label++"-"++name++".json")) json
      writeFile (out </> (label++"-"++name++".trace.txt")) (if completed then unlines (trace g) else "timeout; counters missing\n")
      -- Input/train/heldout files are evidence only. Solvers above receive idTrain.
      putStrLn (label++" "++name++if completed then " train="++show trainOK++" held="++show heldOK++" d="++show (metric "d_triggered" g) else " timeout")
      pure json
    writeFile (out </> (label++".data.json")) $ objectJSON
      [("train",arrayJSON [objectJSON [("input",show (rows x)),("output",show (rows y))] | (x,y)<-idTrain ins])
      ,("heldout",objectJSON [("input",show (rows (fst (idHeld ins)))),("output",show (rows (snd (idHeld ins))))])]
    pure (arrayJSON results)
  writeFile (out </> "matrix.json") (arrayJSON summaries)
