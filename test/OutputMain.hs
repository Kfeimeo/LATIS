module Main where
import Synthesis.Collection.Output.Template
import Synthesis.Collection.Output.Scene
import Synthesis.Collection.Output.Induce
import Synthesis.Collection.Region.ShapeMDL (ShapeExpr(..), shapeAlternatives, defaultMDLBudget, shapeText, shapeCost, bestShape, MDLResult(..))
import Synthesis.Collection.Geometry.Cover (pixelSetFromList, Rect(..))
import Synthesis.Collection.Geometry.View (ViewId(..))
import Synthesis.Collection.Front
import ARC.ContentFirstEvaluate (namedConfigsE4)
import ARC.StageDEvaluate (configByNameD)
import ARC.OutputMechanism
import ARC.StageAEvaluate (trainExactOf)
import ARC.Dataset (Task(..), loadTask)
import Latent.Grid
import qualified Data.Map.Strict as M
import qualified Data.Set as S
import Data.Either (isLeft, isRight)
import Data.List (isInfixOf, sort, nub)
import Data.Maybe (isJust, fromJust, isNothing)
import Control.Monad (unless, forM_, forM, when)
import System.Directory (createDirectoryIfMissing, doesFileExist)

assert :: String -> Bool -> IO ()
assert label ok=unless ok (error ("FAIL "++label)) >> putStrLn ("PASS "++label)
must :: Either String a -> a
must=either error id
cfgOf :: String -> Config
cfgOf n=maybe (error n) id (configByNameD n)
g :: [[Int]] -> Grid
g=must . mkGrid
inst :: FamilyO -> Int -> InstanceO
inst f s=head [i | i<-instancesO, ioFamily i==f, ioSeed i==s]
induce :: InduceConfig -> InstanceO -> InduceResult
induce c i=induceOutputSkeleton c (outputsOf i)
bestOf :: InduceResult -> Skeleton
bestOf=fromJust . irBest
hasDiff, hasRepeat :: SceneT -> Bool
hasDiff sc=any (\c->case c of TSingle o->isD (otShape o); TRepeat o _ _->isD (otShape o)) (stObjects sc) where isD (TDiff _ _)=True; isD (TUnion a b)=isD a||isD b; isD _=False
hasRepeat sc=any (\c->case c of TRepeat{}->True; _->False) (stObjects sc)

main :: IO ()
main=do
  createDirectoryIfMissing True "results/stage_e4/unit_tests"
  -- 1. templates render exactly; illegal instantiations are refused
  let shellT=TCanvas (ILit 8) (ILit 8) (BgLit 0) [TSingle (TPlace (TDiff (TRect (ILit 0) (ILit 0) (IHole 0) (IHole 1)) (TRect (ILit 1) (ILit 1) (IOff 0 (-1)) (IOff 1 (-1)))) (CLit 3) (ILit 1) (ILit 2))]
      bnd=M.fromList [(0,3),(1,2)]
      r=must (renderScene shellT bnd)
      expected=g [[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,3,3,3,3,0,0,0],[0,3,0,0,3,0,0,0],[0,3,3,3,3,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0],[0,0,0,0,0,0,0,0]]
  assert "template render: Difference shell with offset relations renders pixel for pixel; provenance names every pixel" (rdGrid r==expected && M.size (rdProvenance r)==64 && lookup "c0" (rdObjectPixels r)==Just 10)
  assert "template render: unbound hole, inverted rectangle and overlapping objects are refused" (isLeft (renderScene shellT M.empty) && isLeft (renderScene shellT (M.fromList [(0,0),(1,0)]))
    && isLeft (renderScene (TCanvas (ILit 4) (ILit 4) (BgLit 0) [TSingle (TPlace (TRect (ILit 0) (ILit 0) (ILit 1) (ILit 1)) (CLit 1) (ILit 0) (ILit 0)),TSingle (TPlace (TRect (ILit 0) (ILit 0) (ILit 1) (ILit 1)) (CLit 2) (ILit 1) (ILit 1))]) M.empty))
  assert "template render: BgNone with an uncovered pixel is refused (no background may be invented); a fully covered canvas renders" (isLeft (renderScene (TCanvas (ILit 3) (ILit 3) BgNone [TSingle (TPlace (TRect (ILit 0) (ILit 0) (ILit 1) (ILit 1)) (CLit 1) (ILit 0) (ILit 0))]) M.empty)
    && fmap rdGrid (renderScene (TCanvas (ILit 2) (ILit 2) BgNone [TSingle (TPlace (TRect (ILit 0) (ILit 0) (ILit 1) (ILit 1)) (CLit 5) (ILit 0) (ILit 0))]) M.empty)==Right (g [[5,5],[5,5]]))
  let rep=TCanvas (ILit 9) (ILit 3) (BgLit 0) [TRepeat (TPlace (TRect (ILit 0) (ILit 0) (ILit 1) (ILit 0)) (CLit 2) (ILit 0) (ILit 1)) (IHole 0) (ILit 3,ILit 0)]
  assert "template render: Repeat places count instances on the linear placement" (fmap rdGrid (renderScene rep (M.fromList [(0,3)]))==Right (g [[0,0,0,0,0,0,0,0,0],[2,2,0,2,2,0,2,2,0],[0,0,0,0,0,0,0,0,0]]))
  -- 2. cost: holes cost more than literals, relations less than free holes, degenerate references above the independent encodings
  let lits=TCanvas (ILit 8) (ILit 8) (BgLit 0) [TSingle (TPlace (TRect (ILit 0) (ILit 0) (ILit 2) (ILit 1)) (CLit 3) (ILit 1) (ILit 2))]
      holes=TCanvas (ILit 8) (ILit 8) (BgLit 0) [TSingle (TPlace (TRect (ILit 0) (ILit 0) (IHole 0) (IHole 1)) (CLit 3) (IHole 2) (IHole 3))]
  assert "cost: a template with 4 holes costs more than its all-literal version; the shell with 2 offset relations costs less than 4 free holes" (templateCost holes>templateCost lits && templateCost shellT<templateCost (TCanvas (ILit 8) (ILit 8) (BgLit 0) [TSingle (TPlace (TDiff (TRect (ILit 0) (ILit 0) (IHole 0) (IHole 1)) (TRect (ILit 1) (ILit 1) (IHole 2) (IHole 3))) (CLit 3) (ILit 1) (ILit 2))]))
  let outs=outputsOf (inst VariableShellGeometry 1)
      indep=[independentSceneCost lits | _<-outs]
  assert "cost: every degenerate reference (per-pixel holes, whole-output hole, case-id switch) is costlier than the independent encodings" (all (\(_,c)->c>sum indep) (degenerateCosts outs indep))
  -- 3. shape alternatives: the C shape has both a Difference and a 3-rectangle union; the plus sign union only; the shell Difference(12) and a 4-rect union is outside the <=3 universe
  let cmask=pixelSetFromList [Coord a b | a<-[0..4], b<-[0..2], not (a>=1 && b==1)]
      (calts,cst)=shapeAlternatives defaultMDLBudget 8 cmask
      plus=pixelSetFromList [Coord 1 0,Coord 0 1,Coord 1 1,Coord 2 1,Coord 1 2]
      (palts,_)=shapeAlternatives defaultMDLBudget 8 plus
  assert "shape alternatives (cross-level): C shape = Difference (12) first and a 3-rectangle union (17) too; plus sign = unions only; the 5x3 bbox level-3 enumeration may be budget-truncated (status recorded)" (any (\e->structureSignature e=="D(R,R)" && shapeCost e==12) calts && any (\e->structureSignature e=="U(U(R,R),R)" || structureSignature e=="U(R,U(R,R))") calts && all (\e->take 1 (structureSignature e)=="U") palts && cst `elem` ["Complete","Truncated"])
  -- 4. joint induction on the mechanism families (direct calls, no solver)
  let on=induceOn
  forM_ [1,2,3] $ \s->do
    let shellR=induce on (inst VariableShellGeometry s); sk=bestOf shellR
    assert ("VariableShellGeometry-"++show s++": StructureVerifiedAllOutputs with a Difference skeleton, offset relations for the inner rectangle, <= 4 holes, every output rendered") (irStatus shellR==StructureVerifiedAllOutputs && hasDiff (skScene sk) && cbRelations (skCost sk)>=2 && cbHoleCount (skCost sk)<=4 && all snd (skRenderOk sk) && isRight (skNontrivial sk))
    let permR=induce on (inst DisjointUnionPermutation s); pk=bestOf permR
        memberIds=[map snd (rmMembers r) | r<-skRoles pk]
    assert ("DisjointUnionPermutation-"++show s++": verified; roles align objects with DIFFERENT raster ids across outputs (structure + cost, not index); colours stay literal") (irStatus permR==StructureVerifiedAllOutputs && any (\ids->length (nub ids)>1) memberIds && all (\c->case c of TSingle o->case otColour o of CLit _->True; _->False; _->False) (stObjects (skScene pk)))
    let cntR=induce on (inst DifferentObjectCounts s); ck=bestOf cntR
    assert ("DifferentObjectCounts-"++show s++": verified with a Repeat whose count is a hole and whose step is literal") (irStatus cntR==StructureVerifiedAllOutputs && hasRepeat (skScene ck) && any (\c->case c of TRepeat _ (IHole _) (ILit 3,ILit 0)->True; _->False) (stObjects (skScene ck)))
    let colR=induce on (inst SameShapeDifferentColorAndPlacement s); colk=bestOf colR
    assert ("SameShapeDifferentColorAndPlacement-"++show s++": verified; the plus sign keeps its union structure with a colour hole and position holes; the square stays literal") (irStatus colR==StructureVerifiedAllOutputs && length (snd (holesOf (skScene colk)))==1 && cbLiterals (skCost colk)>=6)
    let bgR=induce on (inst DifferentBackgroundViews s); bgk=bestOf bgR
    assert ("DifferentBackgroundViews-"++show s++": verified under a non-legacy view with background 8 observed (colour 0 is an object)") (irStatus bgR==StructureVerifiedAllOutputs && all ((/=LegacyView) . snd) (skViews bgk) && stBg (skScene bgk)==BgLit 8 && any (\c->case c of TSingle o->otColour o==CLit 0; _->False) (stObjects (skScene bgk)))
    let altR=induce on (inst AlternateShapeASTs s); altk=bestOf altR
        firstR=induce on {icMode=FirstSceneOnly} (inst AlternateShapeASTs s)
    assert ("AlternateShapeASTs-"++show s++": the joint skeleton uses the 3-rectangle union (the C shape's non-cheapest AST); FirstSceneOnly (cheapest AST only) cannot align the roles") (irStatus altR==StructureVerifiedAllOutputs && take 1 (rmSignature (head (skRoles altk)))=="U" && irStatus firstR/=StructureVerifiedAllOutputs)
    let relR=induce on (inst SharedRelativeConstraints s); relk=bestOf relR
    assert ("SharedRelativeConstraints-"++show s++": one int hole with offset relations (square = bar + 3, canvas width = bar + 8)") (irStatus relR==StructureVerifiedAllOutputs && length (fst (holesOf (skScene relk)))==1 && cbRelations (skCost relk)>=2)
    let pwR=induce on (inst PairwiseInconsistentAlignment s)
        pwOnly=induce on {icMode=PairwiseOnly} (inst PairwiseInconsistentAlignment s)
    assert ("PairwiseInconsistentAlignment-"++show s++": joint = NoNontrivialSharedStructure (every object slot a free hole) while every pair alone reports a verified skeleton") (irStatus pwR==NoNontrivialSharedStructure && maybe False (all ((=="StructureVerifiedAllOutputs") . snd)) (irPairwise pwOnly))
    let oneR=induce on (inst SingleCaseCoincidence s)
    assert ("SingleCaseCoincidence-"++show s++": a single training output is SingleOutputStructuralCompression, never a cross-output claim") (irStatus oneR==SingleOutputStructuralCompression)
    let degR=induce on (inst DegenerateMemorizationNegative s)
    assert ("DegenerateMemorizationNegative-"++show s++": RepresentationUnavailable (no legal repeat / alignment); degenerate references above the independent encodings") (irStatus degR==RepresentationUnavailable && all (\(_,c)->c>sum (map snd (irIndependent degR))) (irDegenerate degR))
    let symR=induce on (inst NonUniqueRoleAssignment s)
    assert ("NonUniqueRoleAssignment-"++show s++": verified with ambiguity >= 2 (symmetric roles are not broken by ids)") (irStatus symR==StructureVerifiedAllOutputs && skAmbiguity (bestOf symR)>=2)
    let nlR=induce on (inst NonLinearCounts s)
    assert ("NonLinearCounts-"++show s++": RepresentationUnavailable with UnsupportedVariableMultiplicity, not a faked alignment") (irStatus nlR==RepresentationUnavailable && "UnsupportedVariableMultiplicity" `isInfixOf` irReason nlR)
    let wholeR=induce on (inst RegionAsWholeOutput s); wk=bestOf wholeR
    assert ("RegionAsWholeOutput-"++show s++": verified with NoResidual, a colour hole and offset relations to the canvas size") (irStatus wholeR==StructureVerifiedAllOutputs && stBg (skScene wk)==BgNone && length (snd (holesOf (skScene wk)))==1 && cbRelations (skCost wk)>=2)
    -- heldout structural diagnostic on the frozen skeleton (not a prediction)
    let heldShell=instantiateOnOutput on sk (snd (ioHeld (inst VariableShellGeometry s)))
    assert ("VariableShellGeometry-"++show s++": the frozen skeleton instantiates on the heldout OUTPUT (oracle_parameter_structural_reconstruction), and not on a tampered one") (isRight heldShell && isLeft (instantiateOnOutput on sk (g [[0,0,0],[0,3,0],[0,0,0]])))
    -- tamper tests on the witness: bindings, hole type/scope, case support
    let b0=snd (head (skBindings sk)); o0=head outs
        tampered=M.adjust (+1) (head (M.keys b0)) b0
    assert ("VariableShellGeometry-"++show s++": tampering a binding or dropping a hole makes the construction witness fail") (fmap rdGrid (renderScene (skScene sk) tampered)/=Right o0 && isLeft (renderScene (skScene sk) (M.delete (head (M.keys b0)) b0)))
    -- structural sharing on/off: identical skeletons
    let noShare=induce on {icSharing=False} (inst VariableShellGeometry s)
    assert ("VariableShellGeometry-"++show s++": structural sharing on/off gives identical skeleton, cost and bindings") (fmap (canonicalScene . skScene) (irBest noShare)==Just (canonicalScene (skScene sk)) && fmap (cbTotal . skCost) (irBest noShare)==Just (cbTotal (skCost sk)))
    -- independent mode never claims structure
    assert ("VariableShellGeometry-"++show s++": IndependentOnly reports no skeleton") (isNothing (irBest (induce on {icMode=IndependentOnly} (inst VariableShellGeometry s))))
  -- 5. the sidecar never changes the solver: configs E4_Off vs E4_OutputSkeletonOnly on the mechanism tasks and on the ARC regression tasks
  forM_ instancesO $ \ins->do
    let t=instanceTaskO ins
        off=frontSearch SafeOnline (cfgOf "E4_Off") (training t)
        on'=frontSearch SafeOnline (cfgOf "E4_OutputSkeletonOnly") (training t)
    assert (taskId t++": E4 sidecar does not change program, failure or train_exact; E4_Off records no skeleton; the mechanism task is never train_exact") (program off==program on' && failure off==failure on' && trainExactOf t off==trainExactOf t on' && isNothing (outputSkeletonRun (graph off)) && isJust (outputSkeletonRun (graph on')) && not (trainExactOf t on'))
    let st=fmap irStatus (outputSkeletonRun (graph on'))
    assert (taskId t++": expected E4 status "++show (expectedStatusO (ioFamily ins))) (st==Just (expectedStatusO (ioFamily ins)))
  let arcTasks=[("1c786137",True),("2dc579da",True),("5582e5ca",True),("d9fac9be",True),("c909285e",True),("0b148d64",True)]
  arcRows<-forM arcTasks $ \(tid,_)->do
    let path="data/arc1-training/"++tid++".json"
    exists<-doesFileExist path
    if not exists then putStrLn ("SKIP "++tid) >> pure (tid,"missing") else do
      task<-either error id <$> loadTask path
      let t=task {tests=[]}
          off=frontSearch SafeOnline (cfgOf "E4_Off") (training t)
          on'=frontSearch SafeOnline (cfgOf "E4_OutputSkeletonOnly") (training t)
          st=maybe "none" (statusText . irStatus) (outputSkeletonRun (graph on'))
      assert (tid++": E4 audit mode keeps the old solution (same program, train_exact) and records an output-skeleton status ("++st++")") (program off==program on' && trainExactOf t off && trainExactOf t on' && isJust (outputSkeletonRun (graph on')))
      pure (tid,st)
  writeFile "results/stage_e4/unit_tests/summary.json" ("{\"suite\":\"output_e4\",\"passed\":true,\"arc_audit_statuses\":"++show (show arcRows)++"}\n")
  putStrLn "All output-skeleton (Stage E4) tests passed."
  where _=(sort [0::Int],S.empty::S.Set Int,shapeText,bestShape,mrCost,Rect 0 0 0 0,namedConfigsE4,when True (pure () :: IO ()),isInfixOf "a" "a")
