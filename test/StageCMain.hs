module Main where
import Synthesis.Collection.Front
import Synthesis.Collection.Shape
import Synthesis.Collection.Relation
import Synthesis.Collection.Size
import Synthesis.Collection.Referent (RefGraph(..), Referent(..), GraphStats(..), lLeaves, lDepth)
import Synthesis.Collection.Counterfactual (Ctx(..), slotLeavesB)
import Synthesis.Collection.Indexed (objectSet, placedFromObject, Axis(..))
import Synthesis.Collection.Typed (holeConfigB)
import Synthesis.Collection.Typed (TVal(..), TExpr(..), renderT, stageAOff, StageA(..))
import ARC.StageAEvaluate (fullA, mechanismInstances, instanceTask, Instance(..), familyName, trainExactOf, heldExactOf, gridOf)
import ARC.StageBEvaluate (fullB, mechanismInstancesB, instanceTaskB, InstanceB(..), familyNameB)
import ARC.StageCEvaluate
import ARC.CollectionV61Evaluate (v61Tasks)
import ARC.Dataset
import Latent.Grid
import Latent.Encode (encode, defaultEncoder)
import qualified Latent.Object as O
import Control.Monad (unless, forM_, when)
import Data.Either (isLeft, isRight)
import Data.List (isInfixOf, sort)
import qualified Data.Map.Strict as M
import qualified Data.Set as S

assert :: String -> Bool -> IO ()
assert name ok=unless ok (error ("FAIL "++name)) >> putStrLn ("PASS "++name)

cellsOf :: Either String (S.Set (Int,Int)) -> [(Int,Int)]
cellsOf=either (const []) S.toAscList
mask :: [(Int,Int)] -> ShapeMask
mask=maskFromCells
objOf :: Int -> (Int,Int) -> Int -> [(Int,Int)] -> O.Object
objOf i (x,y) c cells=O.Object i (Coord x y) (M.fromList [(Coord a b,c) | (a,b)<-cells]) 0
sceneOf :: Int -> Int -> [(Int,Int,Int)] -> O.Scene
sceneOf w h cells=encode defaultEncoder (gridOf w h cells)

main :: IO ()
main=do
  vertical<-loadTask "data/03560426.json" >>= either error pure
  -- 1. C1 primitives: pixel-exact semantics and parameter validation
  assert "Rectangle(3,2) cells" (cellsOf (primCells (Rectangle 3 2))==[(0,0),(0,1),(1,0),(1,1),(2,0),(2,1)])
  assert "Square(2) == Rectangle(2,2)" (primCells (Square 2)==primCells (Rectangle 2 2))
  assert "Shell(4,4,1) has 12 cells and a 2x2 hole" (length (cellsOf (primCells (Shell 4 4 1)))==12 && not ((1,1) `elem` cellsOf (primCells (Shell 4 4 1))))
  assert "Shell(5,5,2) has a 1x1 hole" (length (cellsOf (primCells (Shell 5 5 2)))==24 && cellsOf (primCells (Shell 5 5 2))==filter (/=(2,2)) (cellsOf (primCells (Rectangle 5 5))))
  assert "Shell thickness that leaves no hole is an explicit error, not a Rectangle" (isLeft (primCells (Shell 4 4 2)) && isLeft (primCells (Shell 3 5 2)) && isLeft (primCells (Shell 3 3 0)))
  assert "DiagonalBar(3,DownRight) and DownLeft" (cellsOf (primCells (DiagonalBar 3 DownRight))==[(0,0),(1,1),(2,2)] && cellsOf (primCells (DiagonalBar 3 DownLeft))==[(0,2),(1,1),(2,0)])
  assert "EquilateralTriangle(3,Up): rows 1,3,5 centred under the apex, bbox 5x3" (cellsOf (primCells (EquilateralTriangle 3 Up))==sort [(2,0),(1,1),(2,1),(3,1),(0,2),(1,2),(2,2),(3,2),(4,2)])
  assert "triangle orientations are rotations of the same 9 cells" (all (\o->either (const 0) S.size (primCells (EquilateralTriangle 3 o))==9) [minBound..maxBound]
    && maskWidth (mask (cellsOf (primCells (EquilateralTriangle 3 LeftO))))==3 && maskHeight (mask (cellsOf (primCells (EquilateralTriangle 3 LeftO))))==5
    && (0,2) `elem` cellsOf (primCells (EquilateralTriangle 3 LeftO)) && (2,0) `elem` cellsOf (primCells (EquilateralTriangle 3 Down)))
  assert "invalid parameters are errors" (all isLeft [primCells (Rectangle 0 2),primCells (Square (-1)),primCells (DiagonalBar 0 DownRight),primCells (EquilateralTriangle 0 Up)])
  assert "Union in one local frame with a placed operand" (shapeMask (Union (Prim (Rectangle 2 1)) (At (0,1) (Prim (Rectangle 2 1))))==shapeMask (Prim (Rectangle 2 2)))
  assert "Intersection of Up and Down triangles is a 5-cell cross-shaped mask (not an empty set)" (fmap maskSize (shapeMask (Intersection (Prim (EquilateralTriangle 3 Up)) (Prim (EquilateralTriangle 3 Down))))==Right 5)
  assert "an empty or disconnected mask is still a mask but not an object" (emptyMask (mask []) && not (maskConnected (mask [])) && not (maskConnected (mask [(0,0),(2,0)])) && maskConnected (mask [(0,0),(1,0)]))
  assert "AST size counts primitives and set operations, not placements" (shapeSize (Union (Prim (Square 1)) (At (3,3) (Prim (Square 1))))==3)
  -- 2. C1 recognition features
  assert "IsRectangle / IsSquare / 1x1 is a Square but neither diagonal nor triangle" (isRectangle (mask (cellsOf (primCells (Rectangle 3 2)))) && isSquare (mask (cellsOf (primCells (Square 2))))
    && isSquare (mask [(0,0)]) && isRectangle (mask [(0,0)]) && not (isDiagonal (mask [(0,0)])) && not (isTriangle (mask [(0,0)])))
  assert "IsShell with thickness; a solid rectangle is not a shell" (isShell (mask (cellsOf (primCells (Shell 5 4 1)))) && shellThickness (mask (cellsOf (primCells (Shell 6 6 2))))==Just 2 && not (isShell (mask (cellsOf (primCells (Rectangle 4 4))))))
  assert "IsDiagonalBar with length; a 2-cell diagonal counts, a 2x2 square does not" (diagonalLength (mask [(0,0),(1,1),(2,2),(3,3)])==Just 4 && isDiagonal (mask [(1,0),(0,1)]) && not (isDiagonal (mask (cellsOf (primCells (Square 2))))))
  assert "IsTriangle" (isTriangle (mask (cellsOf (primCells (EquilateralTriangle 2 RightO)))) && not (isTriangle (mask (cellsOf (primCells (Rectangle 3 2))))))
  assert "an L-shape is no primitive" (null (recognizePrim (mask [(0,0),(1,0),(0,1)])))
  -- 3. C1 canonical decomposition
  let d1=decompose defaultDecompBudget (mask (cellsOf (primCells (Shell 4 3 1))))
      dL=decompose defaultDecompBudget (mask [(0,0),(1,0),(2,0),(0,1),(0,2)])
      dX=decompose defaultDecompBudget (mask [(0,0),(2,0),(1,1),(0,2),(2,2)])
      dC=decompose defaultDecompBudget (mask [(0,0),(1,0),(2,0),(0,1),(2,1),(0,2)])
      dT=decompose defaultDecompBudget {dbMaxArea=4} (mask (cellsOf (primCells (Rectangle 3 3))))
  assert "a primitive decomposes to itself (size 1); Square preferred over Rectangle on a square" (dcExpr d1==Just (Prim (Shell 4 3 1)) && dcSize d1==1
    && dcExpr (decompose defaultDecompBudget (mask (cellsOf (primCells (Rectangle 2 2)))))==Just (Prim (Square 2)))
  assert "L-shape: Union of two placed rectangles, size 3, deterministic minimum among ties" (fmap shapeSize (dcExpr dL)==Just 3 && dcTies dL>=1 && fmap shapeMask (dcExpr dL)==Just (Right (mask [(0,0),(1,0),(2,0),(0,1),(0,2)]))
    && dcExpr (decompose defaultDecompBudget (mask [(0,0),(1,0),(2,0),(0,1),(0,2)]))==dcExpr dL)
  assert "X pattern: Union of two diagonal bars" (fmap primitiveKinds (dcExpr dX)==Just ["DiagonalBar"] && fmap shapeSize (dcExpr dX)==Just 3)
  assert "a 3-piece mask is not representable within depth 2 and is NOT reported as truncated" (dcExpr dC==Nothing && not (dcTruncated dC) && dcCandidates dC>0)
  assert "area over the budget is reported as truncated, not as unrepresentable" (dcExpr dT==Nothing && dcTruncated dT)
  let dB=decompose defaultDecompBudget {dbMaxCandidates=5} (mask [(0,0),(1,0),(2,0),(0,1),(0,2)])
  assert "a mask can be decomposed AND truncated (expression found among the first candidates, minimality not guaranteed): both flags are set and reported separately" (dcExpr dB/=Nothing && dcTruncated dB && fmap shapeMask (dcExpr dB)==Just (Right (mask [(0,0),(1,0),(2,0),(0,1),(0,2)])))
  assert "decomposition never claims a wrong mask" (and [fmap shapeMask (dcExpr d)==Just (Right m) | m<-[mask (cellsOf (primCells (Shell 5 5 1))),mask [(0,0),(1,0),(1,1)],mask [(0,1),(1,1),(2,1),(1,0),(1,2)]], let d=decompose defaultDecompBudget m, dcExpr d/=Nothing])
  -- 4. C1 local diagonal view (global encoding unchanged)
  let chain=sceneOf 10 8 [(1,1,4),(2,2,4),(3,3,4),(6,1,1),(7,1,1),(6,2,1),(7,2,1)]
      (vChain,acc1,rej1)=applyDiagonalView (O.objects chain)
  assert "4-connected encoder sees the chain as 3 objects; the view merges them into one DiagonalBar with provenance" (length (O.objects chain)==4 && length vChain==2 && length acc1==1 && null rej1
    && dcSources (head acc1)==sort (dcSources (head acc1)) && length (dcSources (head acc1))==3 && isDiagonal (maskOfObject (head [o | o<-vChain, O.color o==Just 4])))
  let crossing=sceneOf 10 8 [(1,1,4),(2,2,4),(3,3,4),(3,1,4),(1,3,4)]
      (vCross,acc2,rej2)=applyDiagonalView (O.objects crossing)
  assert "crossing chains are rejected: no merge, pixels stay separate, rejection reported" (null acc2 && not (null rej2) && length vCross==5 && any ("outside the chain" `isInfixOf`) (map drReason rej2))
  let bend=sceneOf 10 8 [(1,1,4),(2,2,4),(3,1,4)]
      (_,acc3,rej3)=applyDiagonalView (O.objects bend)
  assert "a bend (V) is rejected" (null acc3 && not (null rej3))
  let touching=sceneOf 10 8 [(1,1,4),(2,2,4),(3,3,4),(4,4,4),(5,4,4),(4,5,4),(5,5,4)]
      (_,acc4,rej4)=applyDiagonalView (O.objects touching)
  assert "a chain touching a same-colour object diagonally is rejected" (null acc4 && not (null rej4))
  let noise=sceneOf 10 8 [(1,1,4),(2,2,4),(3,3,4),(2,1,4)]
      (_,acc5,_)=applyDiagonalView (O.objects noise)
  assert "adjacent same-colour noise rejects the chain" (null acc5)
  let other=sceneOf 10 8 [(1,1,4),(2,2,4),(3,3,4),(2,1,7),(5,1,4),(6,2,4)]
      (vOther,acc6,_)=applyDiagonalView (O.objects other)
  assert "a different-colour neighbour does not block; two separate chains of one colour are two bars" (length acc6==2 && length vOther==3)
  -- 5. C2 executable semantics and explicit failures
  let a=objOf 0 (0,0) 1 [(0,0),(1,0),(0,1),(1,1)]
      b=objOf 1 (5,0) 2 [(0,0),(1,0)]
      c=objOf 2 (5,3) 1 [(0,0)]
      d=objOf 3 (8,3) 3 [(0,0),(1,0)]
      dims=Dimensions 12 8
  assert "unique maximum selects, a tie is an explicit failure (no implicit choice)" (evalPred [a,b,c] IsMaxArea a==Right True && evalPred [a,b,c] IsMaxArea b==Right False && isLeft (evalPred [b,d] IsMaxArea b))
  assert "colour mode: unique vs tie" (evalPred [a,b,c] ColorMostFrequent a==Right True && isLeft (evalPred [a,b] ColorMostFrequent a))
  assert "Hollow needs a solid rectangle; FillBBox of an L fills its bbox" (isRight (emitObjects (ObjectTransform AllObjects DropOthers (MapEach (Hollow 1))) dims [objOf 0 (0,0) 1 [(x,y) | x<-[0..2], y<-[0..2]]])
    && isLeft (emitObjects (ObjectTransform AllObjects DropOthers (MapEach (Hollow 1))) dims [objOf 0 (0,0) 1 [(0,0),(1,0),(0,1)]])
    && fmap (map (O.size . eoObject)) (emitObjects (ObjectTransform AllObjects DropOthers (MapEach FillBBox)) dims [objOf 0 (0,0) 1 [(0,0),(1,0),(0,1)]])==Right [4])
  assert "merge: colour conflict and disconnected union are explicit failures; same-colour bbox merge builds one object" (isLeft (emitObjects (ObjectTransform AllObjects DropOthers (MergeSelected MergeFillBBox)) dims [a,b])
    && isLeft (emitObjects (ObjectTransform AllObjects DropOthers (MergeSelected MergeUnion)) dims [a,c])
    && fmap (map (\e->(O.size (eoObject e),eoSources e))) (emitObjects (ObjectTransform AllObjects DropOthers (MergeSelected MergeFillBBox)) dims [a,c])==Right [(24,[0,2])])
  assert "replication count < 1 is an error; KeepOthers preserves the unselected objects" (isLeft (emitObjects (ObjectTransform AllObjects DropOthers (MapEach (Replicate (KConst 0) (StepRight 0)))) dims [a])
    && fmap length (emitObjects (ObjectTransform (FilterBy (ColorIs 2)) KeepOthers (MapEach (Replicate (KConst 3) (StepDown 1)))) dims [a,b,c])==Right 5)
  assert "crop translates the selection to the bbox origin" (fmap (map (O.position . eoObject)) (emitObjects (ObjectTransform (FilterBy (ColorIs 2)) DropOthers CropSelected) dims [a,b])==Right [Coord 0 0])
  let Right emF=emitObjects (ObjectTransform (FilterBy (ColorIs 1)) DropOthers (MapEach Keep)) dims [a,b,c]
      wF=relationWitness [a,b,c] emF [a,c]
      Right emR=emitObjects (ObjectTransform AllObjects DropOthers (MapEach (Replicate (KConst 2) (StepDown 1)))) dims [b]
      wR=relationWitness [b] emR [b,O.translate b (Vec 0 2)]
      Right emM=emitObjects (ObjectTransform AllObjects DropOthers (MergeSelected MergeFillBBox)) dims [a,c]
      wM=relationWitness [a,c] emM (map eoObject emM)
  assert "relation witnesses: deletion, one-to-many, many-to-one; unexplained outputs are listed" (rwDeleted wF==[1] && "deletion" `elem` rwKinds wF && null (rwUnexplainedOutputs wF)
    && "one-to-many" `elem` rwKinds wR && length (rwPairs wR)==2 && "many-to-one" `elem` rwKinds wM && rwPairs wM==[([0,2],0)]
    && rwUnexplainedOutputs (relationWitness [a] emF [a,d])==[3])
  -- 6. C2 grammar gating and order
  let gNo=enumerateTransforms (RelationGrammar [1,2] False False [0,1] [2,3] 100000)
      gSh=enumerateTransforms (RelationGrammar [1,2] True False [0,1] [2,3] 100000)
      gDg=enumerateTransforms (RelationGrammar [1,2] True True [0,1] [2,3] 100000)
  assert "without the Shape flag no shape predicate/constructor is enumerated; the diagonal predicate needs the view too" (not (any usesShape gNo) && any usesShape gSh
    && not (any (\t->otSelector t==FilterBy IsDiagonal) gSh) && any (\t->otSelector t==FilterBy IsDiagonal) gDg && length gNo<length gSh && length gSh<length gDg)
  assert "candidates are sorted by structural cost and contain no identity" (and (zipWith (\x y->transformCost x<=transformCost y) gDg (drop 1 gDg)) && not (any (\t->otBody t==MapEach Keep && (otSelector t==AllObjects || otOthers t==KeepOthers)) gDg))
  -- 7. C3.1 object-level size features
  let sIn=sceneOf 12 8 [(x,y,6) | x<-[1..5], y<-[1..3]]
      sIn2=sceneOf 12 8 ([(x,y,6) | x<-[1..5], y<-[1..3]]++[(9,6,3)])
      sIn3=sceneOf 12 8 ([(x,y,6) | x<-[1..5], y<-[1..3]]++[(x,y,3) | x<-[7..11], y<-[5..7]])
  assert "unique largest width/height; a tie is an explicit failure" (gridValue True sIn2 GLargestW==Right (VI 5) && gridValue True sIn2 GLargestH==Right (VI 3) && isLeft (gridValue True sIn3 GLargestW) && gridValue True sIn GSetW==Right (VI 5) && gridValue True sIn2 GColors==Right (VI 2))
  let (ruleE,_)=synthesizeSize (stageAOff {saGridSize=True,saTypedHoles=True}) True True [(sIn2,sceneOf 5 3 []),(sceneOf 12 8 ([(x,y,6) | x<-[1..4], y<-[1..4]]++[(9,6,3)]),sceneOf 4 4 [])]
      (ruleN,_)=synthesizeSize (stageAOff {saGridSize=True,saTypedHoles=True}) False True [(sIn2,sceneOf 5 3 []),(sceneOf 12 8 ([(x,y,6) | x<-[1..4], y<-[1..4]]++[(9,6,3)]),sceneOf 4 4 [])]
  assert "the Size2 rule reaches the unique largest object's bbox only with the object leaves" (fmap (renderT gridFeatureName . srWidth) ruleE==Right "Width(UniqueLargest(Objects(Input)))" && isLeft ruleN)
  -- 8. front end: mechanism matrix (seeds 1,2), invariants, positive and negative controls
  let run conf t=frontSearch SafeOnline conf (training t)
      m k f=metric k (graph f)
  forM_ (mechanismInstancesC 2) $ \ins->do
    let t=instanceTaskC ins; fam=insFamilyC ins; label=taskId t
    forM_ namedConfigsC $ \(cn,conf)->do
      let f=run conf t
      assert (label++" "++cn++": invariants (no concrete high edges, no untriggered expansions)") (m "ConcreteCrossItemEdgeCount_high_level" f==0 && m "UntriggeredExpansionCount" f==0)
      when (cn `elem` familyExpectationC fam) $ assert (label++" "++cn++": train-exact (positive control)") (trainExactOf t f)
      when (cn `elem` familyNegativeC fam) $ assert (label++" "++cn++": not train-exact (negative control)") (not (trainExactOf t f))
      when (m "c_shape_masks" f>0) $ assert (label++" "++cn++": shape counters partition the task's distinct masks (decomposed + unrepresentable + truncated-without-expression = masks) and agree with the per-mask records")
        (m "c_shape_masks" f==m "c_shape_decomposed" f+m "c_shape_unrepresentable" f+(m "c_shape_truncated" f-m "c_shape_decomposed_truncated" f)
         && m "c_shape_masks" f==length (shapes (graph f)) && m "c_shape_decomposed" f==length [() | s<-shapes (graph f), Just _<-[shDecomposition s]]
         && m "c_shape_decomposed_truncated" f==length [() | s<-shapes (graph f), Just _<-[shDecomposition s], shTruncated s]
         && m "c_shape_truncated" f==length [() | s<-shapes (graph f), shTruncated s] && m "c_shape_ast_total" f==sum (map shSize (shapes (graph f))))
      when (cn `elem` familyExpectationC fam && fam/=TranslateSingle) $ assert (label++" "++cn++": relation witness and exactness metrics recorded") (m "c_object_count_exact" f==1 && m "c_object_transform_exact" f==1 && any rrSelected (relations (graph f)) && not (null (concatMap rrWitnesses (filter rrSelected (relations (graph f))))))
    let full=run objectShapeFull t
    when (fam `elem` [KeepColor,ReplicateFit,MergeBBox,ShellConstruct,DiagonalRecolor,CropLargest,CounterexampleFeatureCount]) $ assert (label++": ObjectShapeFull heldout exact (scoring only)") (heldExactOf t full)
    when (fam==DiagonalRecolor) $ assert (label++": the view merged the chain and the selected transformation uses the diagonal predicate") (m "c_diagonal_chains_accepted" full>=3 && maybe False (\p->fmap otSelector (progTransform p)==Just (FilterBy IsDiagonal)) (program full))
    when (fam==DiagonalCrossing) $ assert (label++": crossing chains rejected by the view, none accepted") (m "c_diagonal_chains_rejected" full>0 && m "c_diagonal_chains_accepted" full==0)
    when (fam==ShellConstruct) $ assert (label++": equal counts: the relation search opened on the fallback trigger") (m "c_relation_trigger_fallback" full==1 && m "c_relation_trigger_cardinality" full==0)
    when (fam==KeepColor) $ assert (label++": cardinality trigger; the selected transformation is the colour filter") (m "c_relation_trigger_cardinality" full==1 && maybe False (\p->fmap otSelector (progTransform p)==Just (FilterBy (ColorIs 2))) (program full))
    when (fam==ReplicateFit) $ assert (label++": the replica count is the input-side fit, not a constant") (maybe False (\p->fmap otBody (progTransform p)==Just (MapEach (Replicate (KFitAcross 1) (StepRight 1)))) (program full))
    when (fam==CropLargest) $ assert (label++": size rule from the unique largest object; RelationsOnly fails at the size rule") (maybe False (\p->fmap (renderT gridFeatureName . srWidth) (progSize p)==Just "Width(UniqueLargest(Objects(Input)))") (program full) && take 5 (failure (run relationsOnly t))=="size:")
    when (fam `elem` [KeepColor,ReplicateFit,MergeBBox]) $ do
      let perm=frontSearch SafeOnline objectShapeFull {enumerationSeed=Just (insSeedC ins+7)} (training t)
      assert (label++": permutation invariance (transformation and predictions)") (fmap progTransform (program perm)==fmap progTransform (program full) && [runProgram p (testInput q) | Just p<-[program perm], q<-tests t]==[runProgram p (testInput q) | Just p<-[program full], q<-tests t])
      assert (label++": determinism") (program (run objectShapeFull t)==program full)
  let [c1,c2]=[instanceTaskC i | fam<-[CounterexampleConstantCount,CounterexampleFeatureCount], i<-mechanismInstancesC 1, insFamilyC i==fam]
      f1=run objectShapeFull c1; f2=run objectShapeFull c2
      texts=map rrTransform (relations (graph f1))
  assert "counterexample pair: identical training grids give an identical program" (training c1==training c2 && program f1==program f2 && program f1/=Nothing)
  assert "counterexample pair: exactly one heldout is right (the input-side count is preferred over the constant)" (heldExactOf c1 f1/=heldExactOf c2 f2 && heldExactOf c2 f2)
  assert "counterexample pair: both the constant (3) and the CountObjects replication survive as representatives" (any ("replicate each 3 times" `isInfixOf`) texts && any ("replicate each CountObjects(Input) times" `isInfixOf`) texts)
  -- 9. regression: BaselineA == Stage A FullA, BaselineB == Stage B FullB; old solutions unchanged under the Stage C flags
  let regTasks=[(taskId t,t) | i<-mechanismInstances 1, let t=instanceTask i, familyName (insFamily i) `elem` ["SizeScale","ParityIf","CounterexampleFeatureTruth","CardinalityMismatchStillBlocked"]]
        ++[(taskId t,t) | i<-mechanismInstancesB 1, let t=instanceTaskB i, familyNameB (insFamilyB i) `elem` ["CaseSupportedWidth"]]
        ++v61Tasks vertical
  forM_ regTasks $ \(name,t)->do
    let refA=run fullA t; refB=run fullB t
    assert (name++": BaselineA program == Stage A FullA program") (program (run baselineAC t)==program refA && failure (run baselineAC t)==failure refA && m "search_work" (run baselineAC t)==m "search_work" refA)
    assert (name++": BaselineB program == Stage B FullB program") (program (run baselineBC t)==program refB && failure (run baselineBC t)==failure refB)
    -- the Program record also carries the view flag and the size-rule representative lists (more leaves => more representatives); the executable parts must agree
    let core p=(progExec p,progDefs p,progTransform p,fmap srWidth (progSize p),fmap srHeight (progSize p))
        preds g=[fmap runProgram (program g) <*> Just (testInput q) | q<-tests t]
    when (trainExactOf t refA) $ do
      assert (name++": a FullA solution is unchanged under RelationsOnly (trigger before expansion)") (fmap core (program (run relationsOnly t))==fmap core (program refA) && preds (run relationsOnly t)==preds refA)
      assert (name++": ObjectShapeFull stays train-exact where FullA is") (trainExactOf t (run objectShapeFull t))
      when (fmap core (program (run objectShapeFull t))/=fmap core (program refA)) $ putStrLn ("INFO "++name++": ObjectShapeFull selected a different training-exact program (object-level size leaves add representatives; selection by the same prior)")
  -- 10. C4 goal-directed snapshot: completeness against the reference universe, demand-driven depth, regression against FullB
  let bTask=head [instanceTaskB i | i<-mechanismInstancesB 1, familyNameB (insFamilyB i)=="CaseSupportedWidth"]
      sbG=(stageB fullB) {sbGraphBudget=3000}
      hcG=holeConfigB (stageA fullB) True
      sceneB=encode defaultEncoder (fst (head (training bTask)))
      objsB=O.objects sceneB
      groundedB=[("obj"++show i,Ctx (O.canvas sceneB) (objectSet objsB) (placedFromObject o) Nothing True (O.canvas sceneB)) | (i,o)<-zip [0::Int ..] objsB]
      (keptB,droppedB)=goalLeaves sbG AX groundedB
      allB=keptB++droppedB
      refD1=snapshotForLeaves sbG {sbGraphDepth=1} hcG allB groundedB
      goalD1=snapshotForLeaves sbG {sbGraphDepth=1} hcG keptB groundedB
      goalD2=snapshotForLeaves sbG {sbGraphDepth=2, sbGraphBudget=80000} hcG keptB groundedB   -- large enough not to truncate: a truncated universe is an enumeration prefix, not a superset
      terms g=S.fromList [rfTerm r | r<-M.elems (rgNodes g)]
      keptSet=S.fromList (map fst keptB)
      reachable g=S.filter (\t->all (`S.member` keptSet) (lLeaves t)) (terms g)
  assert "C4 goal: at least one leaf is kept and the kept/dropped split covers the axis leaves (minus Previous)" (not (null keptB) && length allB==length [() | (l,_)<-slotLeavesB True AX, show l `notElem` [show l' | (l',_)<-slotLeavesB True AX, "Previous" `isInfixOf` show l']])
  assert "C4 completeness: the goal-directed universe equals the goal-reachable part of the reference universe (same depth, neither truncated)" (not (gsTruncated (rgStats refD1)) && not (gsTruncated (rgStats goalD1)) && terms goalD1==reachable refD1)
  assert "C4 demand-driven depth: every depth-1 term is a depth-2 term (the depth-2 universe is an enumeration prefix under the node cap); depth 2 adds terms" (terms goalD1 `S.isSubsetOf` terms goalD2 && S.size (terms goalD2)>S.size (terms goalD1) && all ((<=1) . lDepth) (S.toList (terms goalD1)))
  putStrLn ("INFO C4 universes: depth-1 "++show (S.size (terms goalD1))++" nodes (truncated "++show (gsTruncated (rgStats goalD1))++"), depth-2 "++show (S.size (terms goalD2))++" nodes (truncated "++show (gsTruncated (rgStats goalD2))++", cap 80000)")
  let fB=run fullB bTask; gB=run objectShapeGoalDirected bTask
  assert "C4 regression: ObjectShapeGoalDirected reproduces the FullB program on a Stage B task and records its queries" (program gB/=Nothing && fmap progDefs (program gB)==fmap progDefs (program fB) && trainExactOf bTask gB && m "b_goal_queries" gB>=1 && m "b_snapshots_built" gB>=1)
  assert "C4 accounting: depth-1 hits or depth-2 builds are counted, never both zero when a snapshot was searched" (m "b_goal_level1_hits" gB+m "b_goal_level2_builds" gB>=1)
  let blocked=head [instanceTask i | i<-mechanismInstances 1, familyName (insFamily i)=="CardinalityMismatchStillBlocked"]
  assert "Stage A's CardinalityMismatchStillBlocked family: BaselineA still rejects; with relations the search is entered and reported honestly" (take 9 (failure (run baselineAC blocked))=="RankAlign" && m "c_relation_triggered" (run objectShapeFull blocked)==1)
  putStrLn "All stage-c tests passed." 
