module Main where
import ARC.Dataset
import ARC.LatentStress
import ARC.Evaluate (syntheticTasks)
import ARC.JointEvaluate (stressTasks)
import ARC.HierarchicalEvaluate (trainingExact,heldoutExact)
import Synthesis.Hierarchical
import Synthesis.Joint
import Synthesis.Search
import Synthesis.Skeleton
import Synthesis.Hole (Anchor(..))
import Synthesis.Constraint.Metrics
import Latent.Encode
import Latent.Grid
import Latent.Object
import Latent.Local.Encode
import Latent.Local.Decode
import Latent.Local.Grammar
import Latent.Local.Discover
import Latent.Global.Discover
import Latent.Fusion.Context
import Latent.Program
import qualified Latent.Constraint.Propagate as P
import qualified Data.Map.Strict as M
import Control.Monad (forM_,unless)
import System.Exit (die)

assert :: String -> Bool -> IO ()
assert name ok=unless ok (die ("FAIL: "++name))
config :: SearchConfig
config=defaultSearch {solutionLimit=100000}
main :: IO ()
main=do
  let scenes=[encode defaultEncoder x | task<-latentStressTasks,(x,_)<-training task]
      specs z=map Local (discoverLocal [z])++map Global (discoverGlobal [z])
  forM_ scenes $ \z -> forM_ (specs z) $ \spec -> do
    c<-either die pure (encodeFusion spec z)
    assert "exact canonical Scene reconstruction, including IDs/orientation/paint order" (decodeFusion c==Right z)
    forM_ (P.candidatePrograms spec) $ \p@(PlaceEach e) -> case runLatent spec p z of
      Left _ -> pure () -- a program may violate its active progression guard
      Right transformed -> assert "independent executable Z0 expansion equals decoded latent transformation"
        (Right transformed==runGround (expand spec e) z)
  -- Non-top-left anchors, orientation, same-class table and permutation inverse.
  let obj i x y ori=Object i (Coord x y) (M.fromList [(Coord 0 0,3),(Coord 1 0,3),(Coord 1 1,3)]) ori
      exotic=Scene (Dimensions 20 20) 0 [obj 9 8 4 3,obj 4 2 7 1,obj 1 5 6 2]
  forM_ [Pairwise RightToLeft a b | a<-[TL,TR,BL,BR,Center],b<-[TL,TR,BL,BR,Center]] $ \enc ->
    assert "pairwise anchor inverse" ((encodeLocal enc exotic >>= decodeLocal)==Right exotic)
  assert "shared class geometry and individual orientations retained"
    ((encodeLocal (SharedClass ByColor) exotic >>= decodeLocal)==Right exotic)
  z<-either die pure (encodeLocal (RelativePose LeftToRight) exotic)
  assert "malformed paint permutation rejected" (case decodeLocal z {members=map (\m->m {paintSlot=0}) (members z)} of Left _->True; _->False)
  assert "inactive symbols rejected" (case runLatent (Local (RelativePose LeftToRight)) (PlaceEach (BBoxCorner TL)) exotic of Left _->True; _->False)
  assert "empty scene rejects required abstraction" (case encodeLocal (Progression LeftToRight) (Scene (Dimensions 3 3) 0 []) of Left _->True; _->False)
  results<-traverse (\task->do
    r<-hierarchicalSearch V03Full config (training task)
    let name=taskId task
    if name=="H-overfitting-trap"
      then assert "H rejects per-example encoding/program parameters" (case selectedRoute r of Nothing->True; _->False)
      else assert (name++" train and independent heldout") (trainingExact config task r && heldoutExact config task r)
    assert "reconstruction verifier failures zero" (decoderFailures (hierarchicalMetrics r)==0 && reconstructionFailures (hierarchicalMetrics r)==0)
    pure (task,r)) latentStressTasks
  let lookupResult name=case [r | (t,r)<-results,taskId t==name] of [r]->r; _->error "fixture missing"
      route name=maybe "none" routeName (selectedRoute (lookupResult name))
  assert "A automatically selects secondary local coordinates" (route "A-absolute-relative"=="ZL")
  assert "B progression coordinates" (route "B-repeated-progression"=="ZL")
  assert "C global scene axis" (route "C-scene-axis"=="ZG")
  assert "D no proliferation" (route "D-object-sufficient"=="Z0" && latentProposals (hierarchicalMetrics (lookupResult "D-object-sufficient"))==0)
  assert "E local better" (route "E-local-better"=="ZL")
  assert "F global better" (route "F-global-better"=="ZG")
  assert "G canonical/local/global fusion" (route "G-fusion"=="ZF")
  assert "J keep Z0" (route "J-no-useful-abstraction"=="Z0")
  forM_ results $ \(_,r)->case selectedRoute r of
    Just (Secondary _ _) -> assert "strict total MDL including encoder/decoder" (maybe False (>0) (deltaMDL (hierarchicalMetrics r)))
    _ -> pure ()
  -- Fixedpoint idempotence and actual reverse narrowing, without regenerating
  -- encoders from heldout scenes or consulting any test label.
  let task=latentStressTasks!!1
  reverseOff<-hierarchicalSearch NoProgramToLatent config (training task)
  let state=hierarchicalState reverseOff
      sig s=[(hypothesisSpec (P.hypothesis d),map show (P.expressionDomain d),P.skeletonDomain d) | d<-P.activeHypotheses s]
      (again,_)=P.propagateToFixpoint False [] state
  assert "fixedpoint idempotence" (sig state==sig again && P.latentAtFixedPoint again)
  assert "program-to-latent reduces exact calls" (exactVerifierCalls (hierarchicalMetrics (lookupResult "B-repeated-progression")) < exactVerifierCalls (hierarchicalMetrics reverseOff))
  forM_ (syntheticTasks++stressTasks) $ \task' -> do
    old<-jointSearch JointConstraint config (training task')
    disabled<-hierarchicalSearch LatentDisabled config (training task')
    full<-hierarchicalSearch V03Full config (training task')
    assert (taskId task'++" disabled baseline identical")
      (fmap programText (jointSolution old)==fmap show (selectedRoute disabled) && (jointMetrics old) {totalSeconds=0,firstSeconds=Nothing}==(jointMetrics (level0Result disabled)) {totalSeconds=0,firstSeconds=Nothing})
    assert (taskId task'++" regression full") (trainingExact config task' full && heldoutExact config task' full)
  tiny<-hierarchicalSearch V03Full config {stateBudget=1} (training task)
  assert "tiny budget marked" (hitBudget (hierarchicalMetrics tiny))
  assert "FutureWork excluded" (crossLatentPropagation=="FutureWork")
  putStrLn "LATIS v0.3: codec inverses, independent expansion, A-J stress, strict MDL, typed scope, fixedpoint, reverse constraints, 17 regressions and budget checks passed"
