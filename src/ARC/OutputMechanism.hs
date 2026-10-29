-- Stage E4 mechanism tasks: frozen output generators, expectations, matrix runner.
--
-- Every instance has 3 training pairs and 1 heldout pair. The INPUTS are
-- blank 5x5 grids (or noise for OutputOnlyNotInputExecutable): the old
-- solver cannot solve them, so a positive E4 result can never be confused
-- with train_exact. The sidecar sees only the training OUTPUTS; the heldout
-- output is used after induction for the structural diagnostic
-- `oracle_parameter_structural_reconstruction` (can the frozen skeleton be
-- instantiated on it?), which is NOT a prediction.
module ARC.OutputMechanism
  ( FamilyO(..), InstanceO(..), instancesO, instanceTaskO, expectedStatusO, runMechanismO, outputsOf
  ) where
import Synthesis.Collection.Front
import Synthesis.Collection.Output.Induce
import Synthesis.Collection.Output.Template
import ARC.ContentFirstEvaluate (namedConfigsE4)
import ARC.StageAEvaluate (trainExactOf)
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
import qualified Data.Map.Strict as M

data FamilyO = VariableShellGeometry | DisjointUnionPermutation | DifferentObjectCounts | SameShapeDifferentColorAndPlacement | DifferentBackgroundViews
  | AlternateShapeASTs | SharedRelativeConstraints | PairwiseInconsistentAlignment | SingleCaseCoincidence | DegenerateMemorizationNegative
  | NonUniqueRoleAssignment | OutputOnlyNotInputExecutable | NonLinearCounts | RegionAsWholeOutput
  deriving (Eq,Ord,Show,Enum,Bounded)
data InstanceO = InstanceO { ioFamily :: FamilyO, ioSeed :: Int, ioTrain :: [(Grid,Grid)], ioHeld :: (Grid,Grid), ioNote :: String } deriving (Eq,Show)

grid :: Int -> Int -> Int -> [(Int,Int,Int)] -> Grid
grid w h bg cells=either (\e->error ("mechanism grid: "++e)) id (mkGrid [[maybe bg id (M.lookup (x,y) m) | x<-[0..w-1]] | y<-[0..h-1]])
  where m=M.fromList [((a,b),c) | (a,b,c)<-cells]
rect :: Int -> Int -> Int -> Int -> Int -> [(Int,Int,Int)]
rect x y w h c=[(x+a,y+b,c) | a<-[0..w-1], b<-[0..h-1]]
shell :: Int -> Int -> Int -> Int -> Int -> [(Int,Int,Int)]
shell x y w h c=[(x+a,y+b,c) | a<-[0..w-1], b<-[0..h-1], a==0 || b==0 || a==w-1 || b==h-1]
blank :: Grid
blank=grid 5 5 0 []
noise :: Int -> Grid
noise k=grid 5 5 0 [((k*7+j*3) `mod` 5,(k*5+j) `mod` 5,1+((k+j) `mod` 4)) | j<-[0..3]]

-- Expected E4 status of the positive / negative families (E4_OutputSkeletonOnly).
expectedStatusO :: FamilyO -> SkeletonStatus
expectedStatusO f=case f of
  PairwiseInconsistentAlignment->NoNontrivialSharedStructure
  SingleCaseCoincidence->SingleOutputStructuralCompression
  DegenerateMemorizationNegative->RepresentationUnavailable
  NonLinearCounts->RepresentationUnavailable
  _->StructureVerifiedAllOutputs

outputsOf :: InstanceO -> [Grid]
outputsOf=map snd . ioTrain

instancesO :: [InstanceO]
instancesO=[InstanceO f s (train f s) (held f s) (note f) | f<-[minBound..maxBound], s<-[1..3]]
  where
    cases f s=[out f s i | i<-[0..3]]
    train f s=case f of
      SingleCaseCoincidence->[(blank,out f s 0)]
      OutputOnlyNotInputExecutable->[(noise (s*10+i),o) | (i,o)<-zip [0..] (take 3 (cases f s))]
      _->[(blank,o) | o<-take 3 (cases f s)]
    held f s=(if f==OutputOnlyNotInputExecutable then noise (s*10+3) else blank,out f s 3)
    cols=[[3,5,7,2],[6,2,4,9],[1,8,3,5]]
    c1 s=cols!!(s-1)!!0
    note f=case f of
      VariableShellGeometry->"one shell per output, outer width/height and position vary, thickness 1: the joint skeleton must be Difference(Rect, Rect) with the inner rectangle expressed as offsets of the outer one"
      DisjointUnionPermutation->"a 2x2 square and a 3x1 bar whose raster order swaps between outputs; roles are aligned by structure + cost (literal colours), never by list index; an L (union of two rectangles) appears mirrored so that union operands must be swapped"
      DifferentObjectCounts->"k = 2+i identical squares on a row with constant step plus a fixed anchor bar: the varying class becomes Repeat(object, count hole, linear step)"
      SameShapeDifferentColorAndPlacement->"a plus sign whose colour and position change per output plus a fixed square: structure kept, typed colour/position holes"
      DifferentBackgroundViews->"background 8 (never 0) with a colour-0 object: only the non-legacy views give the right scene; residual colour is observed, not assumed"
      AlternateShapeASTs->"a C shape (cheapest AST = Difference, also a 3-rectangle union) alternates with a plus sign (union only): the shared structure is the C's NON-cheapest AST; FirstSceneOnly fails"
      SharedRelativeConstraints->"a bar at x, a square at x+3 and a canvas width x+8: one hole with offset relations instead of three free holes"
      PairwiseInconsistentAlignment->"two squares per output; every pair of outputs shares one square size (a literal for that pair) but no size, colour, position or offset survives all three under any role assignment: joint = NoNontrivialSharedStructure, pairwise-only accepts pseudo-structure"
      SingleCaseCoincidence->"one training output: at most SingleOutputStructuralCompression, never a cross-output regularity"
      DegenerateMemorizationNegative->"unrelated scattered objects with different counts and no repeat structure: RepresentationUnavailable; the degenerate encodings (per-pixel holes, whole-output hole, case-id switch) are costlier than the independent encodings"
      NonUniqueRoleAssignment->"two identical squares mirrored about the canvas centre line (x = 1+i and 8-i): every role assignment reaches the same cost, so the ambiguity (2^(n-1) assignments) is reported and no arbitrary id breaks the symmetry"
      OutputOnlyNotInputExecutable->"shell outputs with noise inputs: StructureVerifiedAllOutputs with prediction_ready=false and no train_exact"
      NonLinearCounts->"identical squares with varying counts whose positions are not an arithmetic progression: UnsupportedVariableMultiplicity, not a faked alignment"
      RegionAsWholeOutput->"the whole canvas is one filled rectangle of varying size and colour (NoResidual): Place(Rect(0,0,?w-1,?h-1), colour ?c) at (0,0) with offset relations to the canvas size"
    out f s i=case f of
      VariableShellGeometry->let w=4+i; h=4+(i `mod` 2)+(s `mod` 2); x=1+i; y=1+(s `mod` 2) in grid 12 12 0 (shell x y w h (c1 s))
      DisjointUnionPermutation->
        let c=cols!!(s-1)
            sq=rect 1 (if even i then 1 else 7) 2 2 (c!!0); bar=rect 5 (if even i then 7 else 1) 3 1 (c!!1)
            l=if even i then rect 8 3 1 3 (c!!2)++rect 9 5 2 1 (c!!2) else rect 10 3 1 3 (c!!2)++rect 8 5 2 1 (c!!2)
        in grid 12 10 0 (sq++bar++l)
      DifferentObjectCounts->let k=2+i in grid 16 6 0 (concat [rect (1+3*j) 2 2 2 (c1 s) | j<-[0..k-1]]++rect 14 0 1 3 (cols!!(s-1)!!1))
      SameShapeDifferentColorAndPlacement->
        let c=cols!!(s-1)!!(i `mod` 4); x=1+2*i; y=1+(i `mod` 2)
            plus=[(x+1,y,c),(x,y+1,c),(x+1,y+1,c),(x+2,y+1,c),(x+1,y+2,c)]
        in grid 12 8 0 (plus++rect 9 5 2 2 1)
      DifferentBackgroundViews->grid 9 7 8 (rect (1+i) 1 3 2 0++rect 5 (3+(i `mod` 2)) 2 2 (c1 s))
      AlternateShapeASTs->
        let c=c1 s; x=1+i; y=1
            cshape=[(x+a,y+b,c) | a<-[0..4], b<-[0..2], not (a>=1 && b==1)]              -- 5x3 open to the right: Diff(12) or 3-rect union(17)
            plus=[(x+1,y,c),(x,y+1,c),(x+1,y+1,c),(x+2,y+1,c),(x+1,y+2,c)]              -- union only
        in grid 10 6 0 (if odd i then plus else cshape)
      SharedRelativeConstraints->let x=2+i in grid (x+8) 7 0 (rect x 1 1 4 1++rect (x+3) 2 2 2 4)
      PairwiseInconsistentAlignment->
        -- three distinct squares X, Y, Z; outputs {X,Z}, {X,Y}, {Y,Z}: every pair shares one whole object
        -- (size, colour, position literal for that pair) but no literal or offset relation survives all
        -- three under any role assignment (checked by brute force over the bijections)
        let sq (sz,c,x,y)=rect x y sz sz c
            xo=(2,1,1,1); yo=(3,2,6,3); zo=(4,3,2,7); ho=(2,5,8,8)
            pairSets=[[xo,zo],[xo,yo],[yo,zo],[xo,ho]]
        in grid 12 12 0 (concatMap sq (pairSets!!i))
      SingleCaseCoincidence->grid 8 8 0 (shell (1+i) 1 4 4 (c1 s)++rect 6 6 1 1 2)
      DegenerateMemorizationNegative->grid 9 9 0 (concat [[(1+2*j,(j*3+i) `mod` 9,1+((j+i) `mod` 6))] | j<-[0..2+i]]++[(7,7,3) | even i])
      NonUniqueRoleAssignment->grid 12 10 0 (rect (1+i) 2 2 2 (c1 s)++rect (8-i) 2 2 2 (c1 s))   -- mirrored twins: every role assignment costs the same
      OutputOnlyNotInputExecutable->let w=3+i; h=3+(s `mod` 2) in grid 10 10 0 (shell 1 1 w h (c1 s))
      NonLinearCounts->let k=2+i; xs=[1,4,9,11,16] in grid 18 5 0 (concat [rect (xs!!j) 1 2 2 (c1 s) | j<-[0..k-1]])
      RegionAsWholeOutput->let w=3+i; h=2+(i `mod` 2)+(s `mod` 2) in grid w h (cols!!(s-1)!!(i `mod` 4)) []

instanceTaskO :: InstanceO -> Task
instanceTaskO ins=Task (show (ioFamily ins)++"-"++show (ioSeed ins)) (ioTrain ins) [TestPair (fst (ioHeld ins)) (Just (snd (ioHeld ins)))]

runMechanismO :: FilePath -> [String] -> IO ()
runMechanismO out names=do
  createDirectoryIfMissing True out
  rowsOut<-forM instancesO $ \ins->do
    let label=show (ioFamily ins)++"-"++show (ioSeed ins); task=instanceTaskO ins
    writeFile (out </> (label++".data.json")) (objectJSON
      [("note",jsonString (ioNote ins)),("train",arrayJSON [objectJSON [("input",show (rows x)),("output",show (rows y))] | (x,y)<-ioTrain ins])
      ,("heldout",objectJSON [("input",show (rows (fst (ioHeld ins)))),("output",show (rows (snd (ioHeld ins))))]),("expected_status",jsonString (statusText (expectedStatusO (ioFamily ins))))])
    forM names $ \name->do
      cfg<-maybe (error ("unknown configuration "++name)) pure (lookup name namedConfigsE4)
      start<-getMonotonicTimeNSec
      let f=frontSearch SafeOnline cfg (training task)
      finished<-timeout 180000000 (evaluate (length (show f)))
      end<-getMonotonicTimeNSec
      let secs=fromIntegral (end-start)/1e9 :: Double
          g=graph f
          e4=outputSkeletonRun g
          -- heldout structural diagnostic on the FROZEN skeleton (after induction); never a prediction
          heldout=case e4 >>= irBest of
            Nothing->objectJSON [("attempted",boolJSON False),("oracle_parameter_structural_reconstruction",jsonString "not_attempted")]
            Just sk->case instantiateOnOutput (outputSkeleton cfg) sk (snd (ioHeld ins)) of
              Right (b,v)->objectJSON [("attempted",boolJSON True),("oracle_parameter_structural_reconstruction",jsonString "true"),("view",jsonString (show v)),("bindings",jsonString (show (M.toList b))),("note",jsonString "structural instantiation of the frozen skeleton on the heldout OUTPUT; not heldout_prediction_exact")]
              Left why->objectJSON [("attempted",boolJSON True),("oracle_parameter_structural_reconstruction",jsonString (if take 11 why=="instantiate" then "not_attempted" else "false")),("reason",jsonString why)]
          json=if not (isJust finished) then objectJSON [("family",jsonString (show (ioFamily ins))),("seed",show (ioSeed ins)),("config",jsonString name),("status",jsonString "timeout")]
               else objectJSON [("family",jsonString (show (ioFamily ins))),("seed",show (ioSeed ins)),("config",jsonString name)
                 ,("status",jsonString (if trainExactOf task f then "train_exact" else "no_fit")),("train_exact",boolJSON (trainExactOf task f)),("seconds",show secs)
                 ,("search_work",show (metric "search_work" g)),("expected_e4_status",jsonString (statusText (expectedStatusO (ioFamily ins))))
                 ,("e4_status",maybe "null" (jsonString . statusText . irStatus) e4),("e4_reason",maybe "null" (jsonString . irReason) e4)
                 ,("e4_skeleton",maybe "null" (\r->maybe "null" (jsonString . sceneTText . skScene) (irBest r)) e4)
                 ,("e4_holes",maybe "null" (\r->maybe "null" (show . cbHoleCount . skCost) (irBest r)) e4),("e4_relations",maybe "null" (\r->maybe "null" (show . cbRelations . skCost) (irBest r)) e4)
                 ,("e4_shared_cost",maybe "null" (\r->maybe "null" (show . cbTotal . skCost) (irBest r)) e4),("e4_independent_cost",maybe "null" (show . sum . map snd . irIndependent) e4)
                 ,("e4_ambiguity",maybe "null" (\r->maybe "null" (show . skAmbiguity) (irBest r)) e4),("e4_pairwise",maybe "null" (\r->maybe "null" (\ps->arrayJSON [objectJSON [("pair",arrayJSON [show i,show j]),("status",jsonString st)] | ((i,j),st)<-ps]) (irPairwise r)) e4)
                 ,("e4_counters",maybe "null" (\r->objectJSON [(k,show v) | (k,v)<-M.toList (irCounters r)]) e4),("e4_metrics",objectJSON [(k,show (metric k g)) | k<-e4MetricNames])
                 ,("e4_degenerate_costs",maybe "null" (\r->objectJSON [(k,show v) | (k,v)<-irDegenerate r]) e4),("heldout_structural",heldout),("prediction_ready",boolJSON False)
                 ,("output_skeleton",maybe "null" induceJSON e4)]
      writeFile (out </> (label++"-"++name++".json")) json
      putStrLn (label++" "++name++(if isJust finished then " train="++show (trainExactOf task f)++" e4="++maybe "off" (statusText . irStatus) e4 else " timeout"))
      pure json
  writeFile (out </> "matrix.json") (arrayJSON (map arrayJSON rowsOut))
