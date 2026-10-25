module Main where
import Synthesis.Collection.Front
import Synthesis.Collection.Typed
import Synthesis.Collection.Size
import Synthesis.Collection.Counterfactual (Scalar(..))
import ARC.StageAEvaluate
import ARC.CollectionV61Evaluate (v61Tasks)
import ARC.Dataset
import qualified Language.ML as ML
import Language.Types (Ty(..))
import Language.Schema (registry, primitiveName)
import Latent.Grid
import Latent.Encode (defaultEncoder, encode)
import Control.Monad (unless, forM_, when)
import Data.Either (isLeft)
import Data.List (isPrefixOf, isInfixOf)
import qualified Data.Map.Strict as M

assert :: String -> Bool -> IO ()
assert name ok=unless ok (error ("FAIL "++name)) >> putStrLn ("PASS "++name)

-- A tiny leaf language for the generic typed synthesis tests.
type Leaf=String
rowsOf :: [(M.Map Leaf Int,Int)] -> [(Leaf -> Either String TVal,TVal)]
rowsOf xs=[(\l->maybe (Left ("unknown leaf "++l)) (Right . VI) (M.lookup l env),VI t) | (env,t)<-xs]
leavesAB :: [(Leaf,TTy)]
leavesAB=[("A",TyInt),("B",TyInt)]
hcFull, hcNoConst, hcConstOnly, hcParity :: HoleConfig
hcFull=holeConfig (stageAOff {saTypedHoles=True})
hcNoConst=holeConfig (stageAOff {saTypedHoles=True, saArgPolicy=FeatureOnly})
hcConstOnly=holeConfig (stageAOff {saTypedHoles=True, saArgPolicy=ConstantOnly})
hcParity=holeConfig (stageAOff {saTypedHoles=True, saParityOps=True})
synth :: HoleConfig -> [(M.Map Leaf Int,Int)] -> TypedResult Leaf
synth hc rows=synthesizeTyped hc id (enumerateTemplates hc leavesAB TyInt) (rowsOf rows)
exprs :: TypedResult Leaf -> [String]
exprs=map (renderT id . cExpr) . trFits
env :: Int -> Int -> M.Map Leaf Int
env a b=M.fromList [("A",a),("B",b)]

main :: IO ()
main=do
  vertical<-loadTask "data/03560426.json" >>= either error pure
  -- 1. ML: mod / isOdd semantics
  let int n=ML.Value TInt n
  assert "mod: Haskell semantics 7 mod 2 = 1" (ML.eval (ML.Mod (int 7) (int 2))==Right 1)
  assert "mod: negative dividend takes the sign of the divisor (-3 mod 2 = 1)" (ML.eval (ML.Mod (int (-3)) (int 2))==Right 1)
  assert "mod: negative divisor (3 mod -2 = -1)" (ML.eval (ML.Mod (int 3) (int (-2)))==Right (-1))
  assert "mod: zero divisor is an explicit failure, not 0" (isLeft (ML.eval (ML.Mod (int 5) (int 0))))
  assert "isOdd: negative odd is odd" (ML.eval (ML.IsOdd (int (-3)))==Right True && ML.eval (ML.IsOdd (int 4))==Right False && ML.eval (ML.IsOdd (int 0))==Right False)
  assert "isOdd agrees with mod 2 == 1 on [-20..20]" (and [ML.eval (ML.IsOdd (int n))==fmap (==1) (ML.eval (ML.Mod (int n) (int 2))) | n<-[-20..20]])
  assert "typed registry routes Mod/IsOdd through ML (zero divisor rejected)" (isLeft (applyOp OpMod [VI 5,VI 0]) && applyOp OpMod [VI (-7),VI 3]==Right (VI 2) && applyOp OpIsOdd [VI (-9)]==Right (VB True))
  assert "typed registry rejects ill-typed applications" (isLeft (applyOp OpAdd [VI 1,VB True]) && isLeft (applyOp OpIf [VI 1,VI 2,VI 3]))
  assert "schema registry lists mod and isOdd" (all (`elem` map primitiveName registry) ["mod","isOdd"])
  -- 2. typed hole synthesis: ordering, constants, joint fitting, policies, budget
  let subPos=synth hcFull [(env 5 2,3),(env 9 4,5),(env 7 1,6)]
      subNeg=synth hcFull [(env 5 2,-3),(env 9 4,-5),(env 7 1,-6)]
  assert "Sub(A,B) and Sub(B,A) are distinct ordered instances" ("Sub(A,B)" `elem` exprs subPos && "Sub(B,A)" `notElem` exprs subPos && "Sub(B,A)" `elem` exprs subNeg && "Sub(A,B)" `notElem` exprs subNeg)
  let shared=synth hcFull [(env 3 0,5),(env 7 1,9),(env 1 5,3)]
  assert "fitted constant is shared by all cases and solved from the equations" (any (\c->renderT id (cExpr c)=="Add(A,2)" && BoundConstant 2 Solved `elem` cBindings c) (trFits shared))
  let perCase=synth hcFull [(env 3 0,5),(env 7 1,8)]
  assert "no per-case constant: Add(A,?) is rejected when the offset differs" (not (any ("Add(A," `isPrefixOf`) (filter (\e->not ("B" `isInfixOf` e)) (exprs perCase))))
  let twoHoles=synth hcFull [(env 3 9,7),(env 5 9,11),(env 2 9,5)]
  assert "two holes are fitted jointly: 2*A+1 (commutative Add keeps one argument order)" (any (`elem` exprs twoHoles) ["Add(Mul(A,2),1)","Add(1,Mul(A,2))"])
  let identity=synth hcFull [(env 4 1,4),(env 6 2,6),(env 9 3,9)]
  assert "feature-first: the first fit is the bare feature A" (take 1 (exprs identity)==["A"] && "Add(A,0)" `notElem` exprs identity)
  assert "FeatureOnly policy yields no constants" (all ((==0) . tConstants . cExpr) (trFits (synth hcNoConst [(env 3 2,5),(env 7 1,8),(env 1 5,6)])) && not (null (trFits (synth hcNoConst [(env 3 2,5),(env 7 1,8),(env 1 5,6)]))))
  assert "ConstantOnly policy uses at most one feature per candidate" (all ((<=1) . tFeatures . cExpr) (trFits (synth hcConstOnly [(env 3 0,5),(env 7 1,9),(env 1 5,3)])))
  let truncated=synthesizeTyped (hcFull `withBudget` 5) id (enumerateTemplates hcFull leavesAB TyInt) (rowsOf [(env 3 0,5),(env 7 1,9)])
  assert "budget truncation is reported" (trTruncated truncated && trTemplatesTried truncated<trTemplates truncated)
  assert "enumeration is deterministic" (synth hcFull [(env 3 9,7),(env 5 9,11)]==synth hcFull [(env 3 9,7),(env 5 9,11)])
  let coincide=synth hcFull [(env 3 2,5),(env 7 2,9),(env 1 2,3)]
  assert "constant and coinciding feature both survive as representatives" (all (`elem` exprs coincide) ["Add(A,2)","Add(A,B)"])
  let parity=synthesizeTyped hcParity id (enumerateTemplates hcParity leavesAB TyInt) (rowsOf [(env 3 10,10),(env 4 11,4),(env 7 2,2),(env 6 5,6)])
  assert "If(IsOdd(A),B,A) is found through the typed registry" ("If(IsOdd(A),B,A)" `elem` exprs parity)
  let modFit=synthesizeTyped hcParity id (enumerateTemplates hcParity leavesAB TyInt) (rowsOf [(env 5 0,2),(env 7 0,1),(env 9 0,0),(env 4 0,1)])
  assert "Mod(A,3) is found with a domain-fitted divisor" ("Mod(A,3)" `elem` exprs modFit)
  -- 3. size feature and realization
  let g1=gridOf 6 4 [(1,1,3)]; g2=gridOf 8 5 [(2,2,4)]
      scene=encode defaultEncoder
      (same,_)=synthesizeSize (stageAOff {saGridSize=True, saTypedHoles=True}) False True [(scene g1,scene g1),(scene g2,scene g2)]
  assert "unchanged canvas: identity size rule is the selected representative" (fmap srWidth same==Right (TLeaf GWidth) && fmap srHeight same==Right (TLeaf GHeight))
  assert "GridSize is realized from the input only" (either (const False) (\r->outputSize True r (scene g2)==Right (Dimensions 8 5)) same)
  let shrink=SizeRule (TApp OpSub [TLeaf GWidth,TConst (VI 10)]) (TLeaf GHeight) [] [] []
      blow=SizeRule (TApp OpMul [TLeaf GWidth,TConst (VI 6)]) (TLeaf GHeight) [] [] []
  assert "non-positive output size is rejected" (isLeft (outputSize True shrink (scene g1)))
  assert "output size above the ARC bound is rejected" (isLeft (outputSize True blow (scene g1)))
  -- 4. mechanism tasks under the ablation configurations
  let instances=mechanismInstances 2
      run conf t=frontSearch SafeOnline conf (training t)
      m k f=metric k (graph f)
  forM_ instances $ \ins->do
    let t=instanceTask ins; fam=insFamily ins; label=taskId t
        base=run baselineV061 t; full=run fullA t; gso=run gridSizeOnly t; tno=run typedNaryOnly t
        nfa=run noFeatureArg t; nca=run noConstantArg t; fmp=run fullAMinusParity t
        canvasChanges=any (\(x,y)->dimensions x/=dimensions y) (training t)
    when canvasChanges $ do
      assert (label++": baseline rejects the canvas change at the layout guard") ("layout:" `isPrefixOf` failure base)
      assert (label++": TypedNaryOnly keeps the fixed canvas path") ("layout:" `isPrefixOf` failure tno)
    forM_ [("FullA",full),("GridSizeOnly",gso),("NoFeatureArg",nfa),("NoConstantArg",nca),("FullAMinusParity",fmp)] $ \(cn,f)->do
      assert (label++" "++cn++": invariants (no concrete high edges, no untriggered expansions)") (m "ConcreteCrossItemEdgeCount_high_level" f==0 && m "UntriggeredExpansionCount" f==0 && m "expanded_frozen_features" f==0)
      when (cn `elem` familyExpectation fam) $ assert (label++" "++cn++": train-exact (positive control)") (trainExactOf t f)
      when (cn `elem` familyNegativeControls fam) $ assert (label++" "++cn++": not train-exact (negative control)") (not (trainExactOf t f))
    case fam of
      CardinalityMismatchStillBlocked->do
        assert (label++": size rule fits but cardinality mismatch is still blocked") (m "size_rule_exact" full==1 && "RankAlign" `isPrefixOf` failure full && program full==Nothing)
      CounterexampleConstantTruth->pure ()
      CounterexampleFeatureTruth->pure ()
      _->when (trainExactOf t full) $ do
        assert (label++": FullA heldout exact (scoring only)") (heldExactOf t full)
        assert (label++": FullA program carries a size rule") (maybe False (\p->progSize p/=Nothing) (program full))
        let perm=frontSearch SafeOnline fullA {enumerationSeed=Just (insSeed ins+11)} (training t)
        assert (label++": permutation invariance of the Stage A program") (fmap progSize (program perm)==fmap progSize (program full) && [runProgram p (testInput q) | Just p<-[program perm], q<-tests t]==[runProgram p (testInput q) | Just p<-[program full], q<-tests t])
        assert (label++": determinism") (program (run fullA t)==program full)
  -- 4b. the counterexample pair: identical training, both representatives survive, one heldout right
  let [c1,c2]=[instanceTask (mkC fam) | fam<-[CounterexampleConstantTruth,CounterexampleFeatureTruth]]
      mkC fam=case [i | i<-instances, insFamily i==fam, insSeed i==1] of (i:_)->i; []->error "missing counterexample"
      f1=run fullA c1; f2=run fullA c2
      widthReps f=maybe [] (map (renderT gridFeatureName . cExpr) . srWidthReps . maybe (error "no size rule") id . progSize) (program f)
  assert "counterexample: identical training grids" (training c1==training c2)
  assert "counterexample: constant and feature candidates both survive in the width class" (all (`elem` widthReps f1) ["Add(GridWidth(Input),2)","Add(GridWidth(Input),CountObjects(Input))"])
  assert "counterexample: identical training gives identical selection" (program f1==program f2)
  assert "counterexample: non-identifiable from training: exactly one heldout is right" (heldExactOf c1 f1/=heldExactOf c2 f2)
  -- 5. regression on the v0.6.1 tasks: FullA keeps train/heldout exactness of the baseline
  forM_ (v61TasksOf vertical) $ \(name,t)->do
    let base=run baselineV061 t; full=run fullA t
    assert (name++": FullA train-exact iff baseline") (trainExactOf t full==trainExactOf t base)
    assert (name++": FullA heldout-exact iff baseline") (heldExactOf t full==heldExactOf t base)
    assert (name++": unchanged canvas gives the identity size rule") (maybe True (\p->fmap srWidth (progSize p)==Just (TLeaf GWidth) && fmap srHeight (progSize p)==Just (TLeaf GHeight)) (program full))
  -- 6. realization never clips: a rule that shrinks the canvas below the objects fails explicitly
  let scaleTask=instanceTask (head [i | i<-instances, insFamily i==SizeScale])
      solved=run fullA scaleTask
  case program solved of
    Nothing->error "SizeScale unsolved"
    Just p->do
      let shrunk=p {progSize=Just (SizeRule (TConst (VI 1)) (TConst (VI 1)) [] [] [])}
      assert "shrinking the realized canvas below the objects is an explicit failure, not a crop" (all (\(x,_)->isLeft (runProgram shrunk x)) (training scaleTask))
      let moved=p {progSize=Just (SizeRule (TApp OpAdd [TLeaf GWidth,TConst (VI 1)]) (TApp OpAdd [TLeaf GHeight,TConst (VI 1)]) [] [] [])}
      assert "a different valid size rule changes the realized canvas (size drives construction)" (all (\(x,_)->fmap dimensions (runProgram moved x)==Right (let Dimensions w h=dimensions x in Dimensions (w+1) (h+1))) (training scaleTask))
  -- 7. typed slot search is a trigger, not a replacement: baseline tasks never trigger it when the grammar fits
  let v=run fullA vertical
  assert "03560426 FullA: train and heldout exact" (trainExactOf vertical v && heldExactOf vertical v)
  assert "03560426 FullA: scalar grammar path solved it, typed slots untouched" (m "typed_hole_fits" v==0 || maybe False (\p->not (any isTypedBody (bodies p))) (program v))
  putStrLn "All stage-a tests passed."
  where
    v61TasksOf=v61Tasks
    bodies p=case progExec p of
      Inline (Definition _ (Body (a,b) (c,d)) _)->[a,b,c,d]
      CallTop n->maybe [] (\(Definition _ (Body (a,b) (c,d)) _)->[a,b,c,d]) (M.lookup n (progDefs p))
    isTypedBody (Typed _)=True
    isTypedBody _=False

withBudget :: HoleConfig -> Int -> HoleConfig
withBudget hc n=hc {hcBudget=n}
