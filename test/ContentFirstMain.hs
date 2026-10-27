module Main where
import Synthesis.Collection.Front
import Synthesis.Collection.ContentFirst
import Synthesis.Collection.Relation (Pred(..), Selector(..), verifyRenderWitness, renderResult)
import qualified Synthesis.Collection.Diagnostics as DG
import ARC.ContentFirstEvaluate
import ARC.ContentFirstMechanism
import Synthesis.Collection.Geometry.View (ViewId(..))
import ARC.StageDMechanism (instancesD, InstanceD(..))
import ARC.StageCEvaluate (mechanismInstancesC, instanceTaskC)
import ARC.StageAEvaluate (trainExactOf, heldExactOf, failureStage)
import ARC.Dataset (Task(..), TestPair(..), loadTask)
import Latent.Grid
import Latent.Encode (encode, defaultEncoder)
import qualified Latent.Object as O
import Data.Either (isLeft, isRight)
import Data.List (isPrefixOf, isInfixOf, sort)
import Data.Maybe (isJust, isNothing)
import Control.Monad (unless, forM_, when)
import System.Directory (createDirectoryIfMissing)

assert :: String -> Bool -> IO ()
assert label ok=unless ok (error ("FAIL "++label)) >> putStrLn ("PASS "++label)
must :: Either String a -> a
must=either error id
gridOf :: Int -> Int -> [(Int,Int,Int)] -> Grid
gridOf w h cells=must (gridFromCells (Dimensions w h) 0 [(Coord x y,c) | (x,y,c)<-cells])
sceneOf :: Grid -> O.Scene
sceneOf=encode defaultEncoder
plan :: SelectionMode -> Selector -> ContentConstruction -> ContentFirstPlan
plan m s c=ContentFirstPlan (SelectionPlan m s) c LegacyView
derive :: ContentFirstPlan -> Grid -> Either String OutputSpec
derive p g=deriveOutputSpec deriveQuiet p 0 g (sceneOf g)
rendered :: ContentFirstPlan -> Grid -> Either String Grid
rendered p g=derive p g >>= renderOutputSpec 0
-- A content-first Program never consults its sequence body; build one from a
-- legacy FrozenD solution's shape instead of fabricating scalar IR here.
programWithPlan :: Program -> ContentFirstPlan -> Program
programWithPlan base p=base {progContentFirst=Just p,progSize=Nothing,progTransform=Nothing}

main :: IO ()
main=do
  createDirectoryIfMissing True "results/content_first/unit_tests"
  -- 1. executor semantics ------------------------------------------------
  let shell x y w h c=[(x+a,y+b,c) | a<-[0..w-1], b<-[0..h-1], a==0 || b==0 || a==w-1 || b==h-1]
      g1=gridOf 10 8 (shell 3 2 5 4 2++[(5,3,4)]++[(0,0,1),(9,7,3)])          -- shell of colour 2 with a colour-4 dot inside; corner pixels
      crop2=plan SelectUnique (FilterBy (ColorIs 2)) CropInputWindow
      emit2=plan SelectUnique (FilterBy (ColorIs 2)) EmitSelectedWithOwnCanvas
      cropG=must (rendered crop2 g1); emitG=must (rendered emit2 g1)
  assert "bounds are inclusive and dims are +1 per axis" (boundsDims (Bounds 3 2 7 5)==Dimensions 5 4 && boundsDims (Bounds 0 0 0 0)==Dimensions 1 1)
  assert "crop reads the whole input window (foreign dot kept); emit draws the selected member only" (dimensions cropG==Dimensions 5 4 && dimensions emitG==Dimensions 5 4 && cell cropG (Coord 2 1)==Just 4 && cell emitG (Coord 2 1)==Just 0 && cropG/=emitG)
  let wC=osWitness (must (derive crop2 g1)); wE=osWitness (must (derive emit2 g1))
  assert "pixel provenance: crop records the non-selected source, emit has none" (oswOtherPixels wC==1 && any (\(_,_,sel)->not sel) (oswPixelSources wC) && oswOtherPixels wE==0 && all (\(_,_,sel)->sel) (oswPixelSources wE) && oswSelectedPixels wC==oswSelectedPixels wE)
  assert "background cells of a hollow bbox are counted, not painted" (oswBackgroundCells wE==5*4-14 && oswBackgroundCells wC==5*4-15)
  assert "dims source names the selection" ("Dimensions <- Bounds(Unique(Select(Color == 2, Objects(Input))))" `isPrefixOf` oswDimsSource wC)
  let g2=gridOf 6 6 [(0,0,3),(5,5,7),(2,2,9)]
  assert "1x1 selection, origin corner and far corner" (rendered (plan SelectUnique (FilterBy (ColorIs 9)) CropInputWindow) g2==Right (gridOf 1 1 [(0,0,9)])
    && rendered (plan SelectUnique (FilterBy (ColorIs 3)) CropInputWindow) g2==Right (gridOf 1 1 [(0,0,3)]) && rendered (plan SelectUnique (FilterBy (ColorIs 7)) EmitSelectedWithOwnCanvas) g2==Right (gridOf 1 1 [(0,0,7)]))
  assert "non-empty set: bounds of the union, crop keeps everything inside" (rendered (plan SelectNonEmpty AllObjects CropInputWindow) g2==Right g2
    && rendered (plan SelectNonEmpty (FilterBy (NotP (ColorIs 9))) EmitSelectedWithOwnCanvas) g2==Right (gridOf 6 6 [(0,0,3),(5,5,7)]))
  let g3=gridOf 8 5 [(1,1,2),(2,1,2),(5,2,2),(6,2,2),(6,3,2)]                 -- two colour-2 objects
      e1=derive (plan SelectUnique (FilterBy (ColorIs 2)) CropInputWindow) g3
      e2=derive (plan SelectUnique (FilterBy (ColorIs 5)) CropInputWindow) g3
      e3=derive (plan SelectUnique (FilterBy IsMaxArea) CropInputWindow) (gridOf 6 3 [(0,0,1),(1,0,1),(4,0,2),(5,0,2)])
  assert "non-unique selection is an explicit failure naming the cardinality" (isLeft e1 && either ("not unique: 2 objects" `isInfixOf`) (const False) e1)
  assert "empty selection is an explicit failure" (isLeft e2 && either ("matched no object" `isInfixOf`) (const False) e2)
  assert "a tied IsMaxArea predicate fails inside the selector" (isLeft e3 && either ("not unique" `isInfixOf`) (const False) e3)
  assert "non-empty set of two objects: union bounds" (fmap osDims (derive (plan SelectNonEmpty (FilterBy (ColorIs 2)) CropInputWindow) g3)==Right (Dimensions 6 3))
  assert "crop window outside the grid is rejected" (isLeft (cropWindow g3 (Bounds 0 0 8 4)) && isLeft (cropWindow g3 (Bounds 3 1 2 1)))
  let permuted=(sceneOf g1) {O.objects=reverse (O.objects (sceneOf g1))}
  assert "selection and spec are permutation invariant" (fmap (\s->(osDims s,swMatched (oswSelection (osWitness s)))) (deriveOutputSpec deriveQuiet crop2 0 g1 permuted)==fmap (\s->(osDims s,swMatched (oswSelection (osWitness s)))) (derive crop2 g1)
    && (deriveOutputSpec deriveQuiet crop2 0 g1 permuted >>= renderOutputSpec 0)==Right cropG)
  -- the plan universe
  let u=enumeratePlans [2,4] True True False False
  assert "plan universe: deterministic, cost-sorted, no duplicates, both modes and constructions" (and (zipWith (\a b->planCost a<=planCost b) u (drop 1 u)) && length u==length (sort u) && u==enumeratePlans [2,4] True True False False
    && plan SelectUnique (FilterBy (ColorIs 2)) CropInputWindow `elem` u && plan SelectNonEmpty AllObjects EmitSelectedWithOwnCanvas `elem` u)
  assert "plan universe without the Shape flag has no shape predicate" (not (any (\p->spSelector (cfpSelection p)==FilterBy IsShell) (enumeratePlans [2] False False False False)) && any (\p->spSelector (cfpSelection p)==FilterBy IsShell) u)
  -- 2. mechanism matrix: measured baseline, positive/negative controls ----
  let run cfg t=frontSearch SafeOnline cfg (training t)
      m k f=metric k (graph f)
      core p=(progExec p,progDefs p,progTransform p,fmap srWidth (progSize p),fmap srHeight (progSize p),progContentFirst p)
      preds f t=[fmap (\p->runProgram p x) (program f) | (x,_)<-training t]
  forM_ instancesCF $ \ins->do
    let t=instanceTaskCF ins; fam=icFamily ins; label=taskId t
    forM_ namedConfigsCF $ \(cn,cfg)->do
      let f=run cfg t
      assert (label++" "++cn++": invariants") (m "ConcreteCrossItemEdgeCount_high_level" f==0 && m "UntriggeredExpansionCount" f==0)
      when (cn `elem` familyExpectationCF fam) $ assert (label++" "++cn++": train-exact (positive control)") (trainExactOf t f)
      when (cn `elem` familyNegativeCF fam) $ assert (label++" "++cn++": not train-exact (negative control)") (not (trainExactOf t f))
      when (cn=="FrozenD") $ assert (label++" FrozenD: content-first never entered (counters zero, no runs)") (m "cf_triggered" f==0 && m "cf_plans_tried" f==0 && null (contentFirstRuns (graph f)))
    let fz=run frozenD t; cfo=run contentFirstOnly t; ex=run contentFirstExplore t
    case fam of
      SelectColorThenCrop->do
        assert (label++": FrozenD blocked at the Size2 rule (measured)") (take 5 (failure fz)=="size:" && failureStage (failure fz)=="size_rule" && m "size_rule_exact" fz==0)
        assert (label++": ContentFirstOnly opened on size failure and solved with a content-first program") (m "cf_trigger_size_failed" cfo==1 && maybe False (isJust . progContentFirst) (program cfo) && maybe False (isNothing . progSize) (program cfo))
        assert (label++": the selected plan is the unique colour-2 selection") (fmap (cfpSelection . head' . (:[])) (program cfo >>= progContentFirst)==Just (SelectionPlan SelectUnique (FilterBy (ColorIs 2))))
        assert (label++": heldout exact (scoring only)") (heldExactOf t cfo)
        assert (label++": size-first failure preserved in the detail; classification recorded") (any (\r->cfrClassification r=="size_first_failed_but_content_first_succeeded") (contentFirstRuns (graph cfo)))
        assert (label++": first_solution_work recorded after the content-first fit") (m "first_solution_work" cfo>0 && m "cf_fits" cfo>=1)
      SelectByPredicateThenEmit->do
        let fits=[ccPlan c | r<-contentFirstRuns (graph cfo), c<-crFits (cfrResult r)]
        assert (label++": emit selected; no crop plan fits (the window holds a foreign dot)") (not (null fits) && all ((==EmitSelectedWithOwnCanvas) . cfpConstruction) fits && fmap cfpConstruction (program cfo >>= progContentFirst)==Just EmitSelectedWithOwnCanvas)
        assert (label++": the selector is the shape predicate, not a colour (colours differ per case)") (fmap (spSelector . cfpSelection) (program cfo >>= progContentFirst)==Just (FilterBy IsShell))
        assert (label++": heldout exact") (heldExactOf t cfo)
      CropContainsOtherColors->do
        let fits=[ccPlan c | r<-contentFirstRuns (graph cfo), c<-crFits (cfrResult r)]
        assert (label++": crop selected; no emit plan fits (the output keeps the foreign colours)") (not (null fits) && all ((==CropInputWindow) . cfpConstruction) fits && fmap cfpConstruction (program cfo >>= progContentFirst)==Just CropInputWindow)
        assert (label++": heldout exact") (heldExactOf t cfo)
        let ws=programSpecsCF (training t) (maybe (error "program") id (program cfo))
        assert (label++": every pair's witness shows other-object pixels inside the window") (all (\(r,ok)->ok && either (const False) ((>0) . oswOtherPixels . osWitness) r) ws)
      EmptyAndTieSelection->do
        let cands=[c | r<-contentFirstRuns (graph cfo), c<-crCandidates (cfrResult r), ccPlan c==plan SelectUnique (FilterBy (ColorIs 2)) CropInputWindow]
        assert (label++": the colour-2 unique plan was visited and rejected without an implicit choice") (case cands of
          [c]->ccStatus c=="selection_failed" && either ("matched no object" `isInfixOf`) (const False) (ccSelections c!!1) && either ("not unique: 2 objects" `isInfixOf`) (const False) (ccSelections c!!3) && isRight (ccSelections c!!0)
          _->False)
        assert (label++": no content-first fit; classification is an honest no-fit, not a representation claim") (m "cf_fits" cfo==0 && any (\r->cfrClassification r `elem` ["content_first_no_train_exact","content_first_no_train_exact_budget_truncated"]) (contentFirstRuns (graph cfo)))
      SizeEquivalentAlternatives->do
        assert (label++": FrozenD solves Size-first (size rule + legacy crop)") (trainExactOf t fz && maybe False (isJust . progSize) (program fz))
        assert (label++": ContentFirstOnly keeps the Size-first first solution; the plan universe is deferred, nothing expanded") (fmap core (program cfo)==fmap core (program fz) && m "cf_plans_tried" cfo==0 && m "cf_deferred_plans" cfo>0 && any (\d->dfSlot d=="content-first" && dfStatus d=="deferred") (deferred (graph cfo)))
        assert (label++": ExploreAlternatives records content-first representatives and keeps the same program") (fmap core (program ex)==fmap core (program fz) && m "cf_alternative_fits" ex>=1 && m "cf_trigger_explore_alternatives" ex==1 && any (\r->cfrRole r=="alternatives") (contentFirstRuns (graph ex)))
        assert (label++": first_solution_work unchanged by exploring alternatives") (m "first_solution_work" ex==m "first_solution_work" fz)
        let alt=head [ccPlan c | r<-contentFirstRuns (graph ex), c<-crFits (cfrResult r)]
            altProgram=programWithPlan (maybe (error "program") id (program fz)) alt
        assert (label++": the two intensions diverge on the heldout pair (prior cannot decide; both retained)") (not (heldExactOf t fz) && maybe False (\y->runProgram altProgram (fst (icHeld ins))==Right y) (Just (snd (icHeld ins))) && all (\(x,y)->runProgram altProgram x==Right y) (training t))
      NoOutputLeakage->pure ()
      DeferredOnDownstreamFail->do
        assert (label++": FrozenD fits the Size2 rule but fails downstream") (m "size_rule_exact" fz==1 && not (trainExactOf t fz) && failureStage (failure fz)/="size_rule")
        assert (label++": ContentFirstOnly opened on downstream failure and solved") (m "cf_trigger_downstream_failed" cfo==1 && trainExactOf t cfo && maybe False (isJust . progContentFirst) (program cfo) && heldExactOf t cfo)
        assert (label++": classification names the downstream trigger") (any (\r->cfrClassification r=="size_first_fit_downstream_failed_but_content_first_succeeded") (contentFirstRuns (graph cfo)))
    when (fam `elem` [SelectColorThenCrop,CropContainsOtherColors,DeferredOnDownstreamFail]) $ do
      let perm=frontSearch SafeOnline contentFirstOnly {enumerationSeed=Just (icSeed ins+11)} (training t)
      assert (label++": permutation invariance and determinism") (fmap progContentFirst (program perm)==fmap progContentFirst (program cfo) && preds perm t==preds cfo t && program (run contentFirstOnly t)==program cfo)
      -- witness validity of the selected program (independent render replay)
      forM_ (training t) $ \(x,y)->do
        case runProgramEvidence (maybe (error "program") id (program cfo)) x of
          Left e->error ("evidence failed: "++e)
          Right (es,rw)->assert (label++": render witness verified independently and exact") (verifyRenderWitness (dimensions (renderResult rw)) 0 es rw && renderResult rw==y)
  -- leakage: identical inputs, different targets -> identical selections
  forM_ [1..3] $ \seed->do
    let (a,b)=leakagePairCF seed
        sel i=[(ccPlan c,map (fmap swBounds) (ccSelections c)) | r<-contentFirstRuns (graph (run contentFirstOnly (instanceTaskCF i))), c<-crCandidates (cfrResult r)]
        fitsOf i=[ccPlan c | r<-contentFirstRuns (graph (run contentFirstOnly (instanceTaskCF i))), c<-crFits (cfrResult r)]
    assert ("NoOutputLeakage seed "++show seed++": selections/bounds identical for identical inputs; fits differ with the targets") (map fst (icTrain a)==map fst (icTrain b) && map snd (icTrain a)/=map snd (icTrain b) && sel a==sel b && not (null (sel a)) && fitsOf a/=fitsOf b && not (null (fitsOf b)))
  -- 3. budgets and truncation evidence ------------------------------------
  let tA=instanceTaskCF (head [i | i<-instancesCF, icFamily i==SelectColorThenCrop, icSeed i==1])
      tight=contentFirstOnly {contentFirst=contentFirstOn {cfExecutionBudget=3}}
      few=contentFirstOnly {contentFirst=contentFirstOn {cfPlanBudget=5}}
      fT=run tight tA; fF=run few tA
  assert "execution budget: truncated, recorded, no fit claimed" (m "cf_truncated" fT==1 && m "cf_case_executions" fT<=3 && not (trainExactOf tA fT) && any (\r->crTruncated (cfrResult r) && "budget" `isInfixOf` cfrClassification r) (contentFirstRuns (graph fT)))
  assert "plan budget: a prefix of the universe is visited and the cut is recorded" (m "cf_plans_tried" fF<=5 && m "cf_truncated" fF==1 && any (\r->maybe False ("plan budget" `isInfixOf`) (crTruncationReason (cfrResult r))) (contentFirstRuns (graph fF)))
  -- 4. trace events of the new scope -----------------------------------
  let sink="results/content_first/unit_tests/trace_events.jsonl"
  Right ()<-DG.configureTrace (DG.TraceSettings DG.levelFull (Just sink) 200000 200000000 1)
  let fTrace=run contentFirstOnly tA
  _<-pure $! length (show fTrace)
  _<-DG.closeTrace
  lines'<-lines <$> readFile sink
  assert "trace sink carries ContentFirst grammar, evaluated candidates with output_spec witnesses and a budget/exhaustiveness record" (any (\l->"\"scope\":\"ContentFirst\"" `isInfixOf` l && "\"kind\":\"grammar\"" `isInfixOf` l) lines'
    && any (\l->"\"scope\":\"ContentFirst\"" `isInfixOf` l && "\"kind\":\"evaluated\"" `isInfixOf` l && "output_spec" `isInfixOf` l && "dims_source" `isInfixOf` l) lines')
  -- 5. regression: content-first off == Stage D; content-first on keeps old solutions ----
  vertical<-loadTask "data/03560426.json" >>= either error pure
  let regTasks=[("03560426",vertical {tests=[]})]++[(show (idFamily i)++"-"++show (idSeed i),Task (show (idFamily i)) (idTrain i) [TestPair (fst (idHeld i)) (Just (snd (idHeld i)))]) | i<-instancesD]
        ++[(taskId (instanceTaskC i),instanceTaskC i) | i<-mechanismInstancesC 1]
  forM_ regTasks $ \(name,t)->do
    let fz=run frozenD t; cfo=run contentFirstOnly t
    assert (name++": FrozenD has no content-first activity") (m "cf_triggered" fz==0 && m "cf_deferred_plans" fz==0)
    when (trainExactOf t fz) $ assert (name++": ContentFirstOnly reproduces the Size-first solution, predictions and work (early stop)") (fmap core (program cfo)==fmap core (program fz) && preds cfo t==preds fz t && m "search_work" cfo==m "search_work" fz && m "first_solution_work" cfo==m "first_solution_work" fz)
    unless (trainExactOf t fz) $ assert (name++": ContentFirstOnly keeps the Size-first failure text as prefix") (failure fz `isPrefixOf` failure cfo)
  -- 6. oracle injection (diagnostic only; not a blind-search result) -------
  let oracle=plan SelectUnique (FilterBy (ColorIs 2)) CropInputWindow
      base=maybe (error "no program") id (program (run contentFirstOnly tA))
      oracleProgram=programWithPlan base oracle
  assert "oracle injection: a hand-written ContentFirst AST executes on every training pair" (all (\(x,y)->runProgram oracleProgram x==Right y) (training tA))
  writeFile "results/content_first/unit_tests/summary.json" "{\"suite\":\"content-first\",\"passed\":true,\"note\":\"oracle injection is diagnostic only; blind-search results are the mechanism matrix\"}\n"
  putStrLn "All content-first tests passed."
  where head' (x:_)=x
        head' []=error "empty"
