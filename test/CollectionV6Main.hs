module Main where
import Synthesis.Collection.Front
import Synthesis.Collection.Indexed
import Synthesis.Collection.Counterfactual
import Synthesis.Collection.Online
import qualified ARC.CollectionV6Evaluate as E
import ARC.Dataset
import Latent.Grid
import qualified Latent.Object as O
import qualified Data.Map.Strict as M
import Control.Monad (unless,forM_)
import Data.Either (isLeft)
import Data.List (isPrefixOf)

assert :: String -> Bool -> IO ()
assert name ok=unless ok (error ("FAIL "++name)) >> putStrLn ("PASS "++name)
obj :: Int -> Int -> Int -> Int -> Int -> O.Object
obj x y w h c=O.Object 99 (Coord x y) (M.fromList [(Coord i j,c) | i<-[0..w-1], j<-[0..h-1]]) 0
right :: Either String a -> a
right=either error id
fixture :: String -> Task
fixture name=maybe (error name) id (lookup name E.stressTasks)
exactOn :: Task -> Program -> Bool
exactOn t p=all (\q->maybe False (\y->runProgram p (testInput q)==Right y) (testOutput q)) (tests t)
trainOn :: Task -> Program -> Bool
trainOn t p=all (\(x,y)->runProgram p x==Right y) (training t)
slotClass :: String -> Graph -> SemanticClass
slotClass slot g=case [c | c<-classes g, scSlot c==slot] of c:_->c; []->error ("no class "++slot)

main :: IO ()
main=do
  -- Indexed IR and dependent equality
  let bar21=placedFromObject (obj 1 3 2 1 5); bar12=placedFromObject (obj 6 3 1 2 5)
  assert "payload of 2x1 and 1x2 bars coincide; sigma distinguishes them" (placedPayload bar21==placedPayload bar12 && placedSig bar21/=placedSig bar12)
  assert "dependent equality rejects different size index" (isLeft (objectEqual True bar21 bar12))
  assert "erased index admits the accidental equality" (objectEqual False bar21 bar12==Right True)
  let set=objectSet [obj 1 3 2 1 5,obj 6 3 1 2 5,obj 12 3 2 1 5]
  assert "shape count depends on the size index" (shapeCount True set==2 && shapeCount False set==1 && count set==3)
  assert "set is permutation and ID invariant" (set==objectSet [obj 12 3 2 1 5,obj 6 3 1 2 5,obj 1 3 2 1 5])
  -- Key grammar visibility and legality
  assert "no key without an ordering trigger" (null (visibleKeyGrammar (KeyContext [NeedCount] False 2 5)))
  assert "seed keys only before AlignmentFailure" (visibleKeyGrammar (KeyContext [NeedCrossItemAlignment] False 2 5)==seedKeys)
  let synth=visibleKeyGrammar (KeyContext [NeedCrossItemAlignment,AlignmentFailure] False 2 5)
  assert "synthesized grammar extends the seeds under AlignmentFailure" (length synth>length seedKeys && Extent AY `elem` synth && all ((<=5) . keyCost) synth)
  assert "FixedAlignmentKeys never synthesizes" (visibleKeyGrammar (KeyContext [NeedCrossItemAlignment,AlignmentFailure] True 2 5)==seedKeys)
  assert "tie rejected without hidden tiebreaker" (isLeft (orderBy seedKeys NeedCrossItemAlignment InputSet (Anchor TL AY) set))
  assert "invisible key rejected" (isLeft (orderBy seedKeys NeedCrossItemAlignment InputSet (Extent AY) set))
  assert "explicit Lex refinement orders" (either (const False) ((==3) . cardinality) (orderBy seedKeys NeedCrossItemAlignment InputSet (Lex (Anchor TL AY) (Anchor TL AX)) set))
  -- Scalar language, parametrization and abstraction calls
  let chain=Plus (Plus (Atom (Pos Previous (Ax AX))) (Atom (Ext Previous (Ax AX)))) (Lit (-1))
      (pbody,args,params)=parametrize chain
  assert "parametrize abstracts axis and literal" (length params==2 && instantiate args pbody==chain)
  assert "axis argument re-instantiates on the other axis" (instantiate [ArgAxis AY,ArgInt 1] pbody==Plus (Plus (Atom (Pos Previous (Ax AY))) (Atom (Ext Previous (Ax AY)))) (Lit 1))
  let lib=M.singleton "I_1" (AbsDef pbody (map snd params))
      ctx=Ctx (Dimensions 10 10) set (placedFromObject (obj 4 4 1 1 2)) (Just (placedFromObject (obj 1 1 3 2 7))) True
  assert "Call evaluates through the library" (evalScalar lib ctx (Call "I_1" [ArgAxis AY,ArgInt 1])==Right (1+2+1))
  assert "unbound parameter is an error outside a call" (isLeft (evalScalar lib ctx pbody))
  assert "Previous unavailable at first rank" (isLeft (evalScalar lib ctx {ctxPrevious=Nothing} chain))
  -- Counterfactual contexts carry legality proofs
  let (legal,illegal)=counterfactualContexts (Anchor TL AX) 0 (Dimensions 10 10) (objectSet [obj 0 2 2 1 5,obj 5 2 1 1 5])
  assert "illegal translation is reported, not applied" (any (("TranslateScene (-1,0)"==) . cfTransformation) illegal && all (("ILLEGAL" `isPrefixOf`) . head . cfLegality) illegal)
  assert "legal contexts exist with proofs" (not (null legal) && all (not . null . cfLegality . fst) legal)
  -- Anti-unification rejects concrete capture
  let inst c p=[RNode (c++"a") "Observe" [p] ["ref:Current"] "scalar",RNode (c++"r") "Plus" [] [c++"a",c++"a"] "scalar"]
  assert "anti-unification generalizes concepts" (either (const False) ((==1) . length . snd) (antiUnify [("x:",inst "x:" (PConcept "AX")),("y:",inst "y:" (PConcept "AX"))]))
  assert "anti-unification rejects concrete IDs" (isLeft (antiUnify [("x:",inst "x:" (PConcrete "obj7")),("y:",inst "y:" (PConcrete "obj8"))]))
  -- Mechanism tasks
  let run mode name=frontSearch mode defaultConfig (training (fixture name))
      full name=run Full name
  forM_ ["A-seed-key","B-composite-key","C-runtime-order-trap","D-size-index-trap","E-first-item-counterfactual","F-repeated-pattern"] $ \name->do
    let f=full name
    assert (name++" Full heldout exact") (maybe False (exactOn (fixture name)) (program f))
    assert (name++" no concrete high-level edges") (metric "ConcreteCrossItemEdgeCount_high_level" (graph f)==0)
    assert (name++" triggered expansion invariant") (metric "UntriggeredExpansionCount" (graph f)==0)
    assert (name++" frozen features excluded from the frontier") (all ((==Unmatched) . status) (expandedFrontier (features (graph f))))
  -- RQ2: synthesized keys
  let b=full "B-composite-key"
  assert "B needs a synthesized key" (metric "synthesized_keys_accepted" (graph b)>0 && metric "alignment_failure_triggers" (graph b)==1)
  let bKey=fst (alignmentExpression (head (last (alignmentEvidence (graph b)))))
  assert "B final input key is the synthesized Extent AY" (bKey==Extent AY)
  assert "FixedAlignmentKeys fails B" (program (run FixedAlignmentKeys "B-composite-key")==Nothing)
  let cTrap=run DirectSetIndexing "C-runtime-order-trap"
  assert "runtime index fits C training but fails heldout" (maybe False (trainOn (fixture "C-runtime-order-trap")) (program cTrap) && not (maybe False (exactOn (fixture "C-runtime-order-trap")) (program cTrap)))
  let cNoExp=run NoAlignmentExplanation "C-runtime-order-trap"
  assert "unexplained Color pairing fits C training but fails heldout" (metric "unexplained_equalities" (graph cNoExp)>0 && maybe False (trainOn (fixture "C-runtime-order-trap")) (program cNoExp) && not (maybe False (exactOn (fixture "C-runtime-order-trap")) (program cNoExp)))
  -- RQ4: dependent index counterexample
  let dNo=run NoDependentIndex "D-size-index-trap"
  assert "erased index fits D training with a wrong abstraction" (maybe False (trainOn (fixture "D-size-index-trap")) (program dNo) && not (maybe False (exactOn (fixture "D-size-index-trap")) (program dNo)))
  assert "Full D uses CountShapes" (show (scSelected (slotClass "shared-AX" (graph (full "D-size-index-trap"))))=="Plus (Atom (Pos Current (Ax AX))) (Atom CountShapes)")
  -- RQ1: counterfactual-preserving classes
  let e=full "E-first-item-counterfactual"
      ex=slotClass "first-AX" (graph e)
  assert "E first-item class keeps several representatives" (length (scReps ex)>=3)
  assert "E representatives include scene-ref, literal and object-observer" (all (`elem` map repClass (scReps ex)) ["scene-ref-derived","literal-derived","object-observer-derived"])
  assert "E counterfactual splits the class" (scSplits ex>0)
  assert "E selects the scene referent" (scSelected ex==Atom (SceneLow (Ax AX)))
  let eCollapse=run CollapseByTrainingDenotation "E-first-item-counterfactual"
  assert "collapse by training denotation loses the heldout" (metric "premature_collapses" (graph eCollapse)>0 && not (maybe False (exactOn (fixture "E-first-item-counterfactual")) (program eCollapse)))
  let ePrior=run NoIntensionalityPrior "E-first-item-counterfactual"
  assert "no prior picks the accidental observer" (scSelected (slotClass "first-AX" (graph ePrior))==Atom (Pos Current (Ax AX)) && not (maybe False (exactOn (fixture "E-first-item-counterfactual")) (program ePrior)))
  let eNoCF=run NoCounterfactual "E-first-item-counterfactual"
  assert "no counterfactual keeps structural diversity without splits" (length (scReps (slotClass "first-AX" (graph eNoCF)))>=3 && metric "counterfactual_splits" (graph eNoCF)==0)
  -- RQ3: online abstraction feedback
  let f=full "F-repeated-pattern"
      fOff=run NoOnlineAbstraction "F-repeated-pattern"
      fPost=run PostHocOnly "F-repeated-pattern"
  assert "F online abstraction reused in the same run" (metric "online_abstraction_reuses" (graph f)>0 && metric "refinement_expansions_saved" (graph f)>0)
  assert "F reuse reduces search work" (metric "search_work" (graph f)<metric "search_work" (graph fOff) && metric "operator_applications" (graph f)<metric "operator_applications" (graph fOff))
  assert "NoOnlineAbstraction invents nothing" (null (abstractions (graph fOff)) && metric "online_abstraction_reuses" (graph fOff)==0)
  assert "PostHocOnly wraps without feedback" (metric "online_abstraction_reuses" (graph fPost)==0 && metric "search_work" (graph fPost)==metric "search_work" (graph fOff) && metric "accepted_abstractions" (graph fPost)>0)
  assert "F heldout exact in all three" (all (\g->maybe False (exactOn (fixture "F-repeated-pattern")) (program g)) [f,fOff,fPost])
  assert "F Full program calls an online abstraction" (maybe False (\p->any (\d->any hasCall (bodyScalars (defBody d))) (M.elems (progDefs p))) (program f))
  -- Vertical test
  t<-loadTask "data/03560426.json" >>= either error pure
  let v=frontSearch Full defaultConfig (training t)
  assert "03560426 train exact" (maybe False (trainOn t) (program v))
  assert "03560426 heldout exact" (maybe False (exactOn t) (program v))
  assert "03560426 no concrete edge leak" (metric "ConcreteCrossItemEdgeCount_high_level" (graph v)==0)
  assert "03560426 construction triggered" (metric "construction_triggers" (graph v)>0)
  assert "03560426 first item is GridTL" (scSelected (slotClass "first-AX" (graph v))==Atom (SceneLow (Ax AX)) && scSelected (slotClass "first-AY" (graph v))==Atom (SceneLow (Ax AY)))
  assert "03560426 first-item class preserves literal and accidental observer" (length (scReps (slotClass "first-AX" (graph v)))>=3)
  assert "03560426 online abstraction reused across axes" (metric "online_abstraction_reuses" (graph v)>0)
  assert "03560426 high level sees only Call(I_0)" (any ("Call(I_0)" `isPrefixOf`) (highLevelView (graph v)) && not (any (\s->"Inline" `isPrefixOf` s) (highLevelView (graph v))))
  putStrLn "All collection-v6 tests passed."
  where
    bodyScalars (Body (a,b) (c,d))=[a,b,c,d]
    hasCall (Call _ _)=True
    hasCall (Plus a b)=hasCall a || hasCall b
    hasCall _=False
