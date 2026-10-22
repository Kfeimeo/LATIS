module ARC.CollectionV6Evaluate where
import Synthesis.Collection.Front
import Synthesis.Collection.Indexed
import Synthesis.Collection.Counterfactual
import Synthesis.Collection.Online
import qualified Synthesis.Triggered as V4
import qualified Synthesis.InducedR2.Learn as R2
import qualified ARC.InducedR2Evaluate as R2
import ARC.Dataset
import ARC.Evaluate (jsonString)
import ARC.InducedR1Evaluate (objectJSON,arrayJSON,boolJSON)
import Latent.Grid
import Control.Exception (evaluate)
import Control.Monad (forM)
import GHC.Clock (getMonotonicTimeNSec)
import qualified Data.Map.Strict as M
import System.Directory (createDirectoryIfMissing)
import System.FilePath ((</>))
import Data.List (intercalate, sortOn, isPrefixOf)

strings :: [String] -> String
strings=arrayJSON . map jsonString
ints :: [Int] -> String
ints=arrayJSON . map show
viewJSON :: OrderedView -> String
viewJSON v=objectJSON [("source_set",jsonString (show (sourceSet v))),("source_origin",jsonString (show (orderingOrigin v)))
  ,("ordering_expression",jsonString (orderingDerivation v)),("ordering_key",jsonString (show (orderingKey v)))
  ,("seed_key",boolJSON (isSeedKey (orderingKey v))),("key_cost",show (keyCost (orderingKey v)))
  ,("cardinality",show (cardinality v)),("trigger",jsonString (show (orderingTrigger v)))
  ,("derivation",strings [show (orderingOrigin v),orderingDerivation v,"unique key constraint; ties rejected without hidden tiebreaker"])]
placedJSON :: Placed -> String
placedJSON p=objectJSON [("type",jsonString ("Placed["++show (sigW (placedSig p))++","++show (sigH (placedSig p))++"]"))
  ,("size_index",ints [sigW (placedSig p),sigH (placedSig p)])
  ,("position",ints [cx (placedPos p),cy (placedPos p)])
  ,("color",maybe "null" show (observeColor p)),("payload",ints (placedPayload p))
  ,("key_values",objectJSON [(show k,maybe "null" ints (keyValue k p)) | k<-seedKeys++[Extent AX,Extent AY,Anchor BR AX,Anchor BR AY]])]
witnessJSON :: Alignment -> String
witnessJSON w=objectJSON [("expression",jsonString (show (alignmentExpression w)))
  ,("input",viewJSON (alignmentLeft w)),("output",viewJSON (alignmentRight w))
  ,("pairs",arrayJSON [objectJSON [("input",placedJSON a),("output",placedJSON b)] | (a,b)<-alignmentPairs w])]
eitherJSON :: Either String Int -> String
eitherJSON=either jsonString show
costJSON :: CostComponents -> String
costJSON c=objectJSON [("length",show (ccLength c)),("literal_penalty",show (ccLiterals c)),("accidental_dependency_penalty",show (ccAccidental c)),("cross_axis_penalty",show (ccCrossAxis c))
  ,("canonical_referent_bonus",show (ccCanonical c)),("free_variable_bonus",show (ccFreeVars c)),("ontology_boundary_bonus",show (ccBoundary c))
  ,("counterfactual_determinacy_bonus",show (ccDeterminacy c)),("lambda",jsonString "L + 4*literal + 2*accidental + cross_axis - (canonical + free + boundary + determinacy)"),("total",show (ccTotal c))]
repJSON :: Representative -> String
repJSON r=objectJSON [("expression",jsonString (show (repExpr r))),("dependency_signature",strings (repDeps r)),("ontology_provenance",strings (repProvenance r))
  ,("intensionality_class",jsonString (repClass r)),("groundedness",ints [fst (repGroundedness r),snd (repGroundedness r)])
  ,("cost",costJSON (repCost r)),("counterfactual_signature",arrayJSON (map eitherJSON (repCF r))),("counterfactual_group",show (repCFGroup r))
  ,("enumeration_index",show (repOrder r))]
classJSON :: SemanticClass -> String
classJSON c=objectJSON [("slot",jsonString (scSlot c)),("type",jsonString (scType c)),("training_denotation",ints (scDenotation c))
  ,("representatives",arrayJSON (map repJSON (scReps c))),("counterfactual_splits",show (scSplits c)),("canonical_merges",show (scMerges c))
  ,("dropped_by_collapse",show (scDropped c)),("premature_collapses",show (scPrematureCollapses c)),("accidental_dependencies",strings (scAccidental c))
  ,("selected",jsonString (show (scSelected c)))]
cfJSON :: Counterfactual -> String
cfJSON c=objectJSON [("source_case",show (cfSource c)),("transformation",jsonString (cfTransformation c)),("legality_proof",strings (cfLegality c))
  ,("preserved_properties",strings (cfPreserved c)),("changed_properties",strings (cfChanged c))]
nodeJSON :: RNode -> String
nodeJSON n=objectJSON [("id",jsonString (rnId n)),("operation",jsonString (rnOp n)),("parameters",strings (map show (rnParams n)))
  ,("dependencies",strings (rnDeps n)),("slice",jsonString (rnSlice n))]
utilityJSON :: Utility -> String
utilityJSON u=objectJSON [("occurrence_count",show (uOccurrence u)),("nodes_hidden",show (uNodesHidden u)),("boundary_size",show (uBoundary u))
  ,("estimated_reexpansion_saved",show (uEstimatedSaved u)),("actual_reuse_count",show (uActualReuse u))
  ,("compression_gain",show (uCompression u)),("search_reduction_estimate",show (uSearchReduction u)),("reuse_count",show (uReuse u))
  ,("decoupling_gain",show (uDecoupling u)),("semantic_cohesion",show (uCohesion u)),("interface_cost",show (uInterface u))
  ,("weights",jsonString "alpha=1 beta=1 gamma=1 delta=1 eta=2 mu=1"),("total",show (uTotal u)),("threshold",show (uThreshold u)),("accepted",boolJSON (uAccepted u))]
absJSON :: Abstraction -> String
absJSON a=objectJSON [("name",jsonString (absName a)),("family",jsonString (absFamily a)),("contract",jsonString (absContract a))
  ,("input_types",strings (absInputTypes a)),("output_type",jsonString (absOutputType a))
  ,("free_abstract_parameters",arrayJSON [objectJSON [("name",jsonString n),("kind",jsonString k)] | (n,k)<-absFreeParams a])
  ,("hidden_refinement_graph",arrayJSON (map nodeJSON (absHidden a))),("refinement_access",strings ["RefinementTrigger (execution)","NoRealization","DebugAudit (this file)"])
  ,("dependencies",strings (absDependencies a)),("ontology_slice",strings (absOntologySlice a)),("witness",strings (absWitness a))
  ,("provenance",strings (absProvenance a)),("definition_cost",show (absDefinitionCost a)),("call_cost",show (absCallCost a))
  ,("utility",utilityJSON (absUtility a) ),("discovery_step",show (absDiscoveryStep a)),("promotion_step",show (absPromotionStep a))
  ,("first_reuse_step",maybe "null" show (absFirstReuseStep a)),("reuse_count",show (absReuseCount a)),("saved_refinement_expansions",show (absSaved a))
  ,("definition",maybe "null" (\d->objectJSON [("body",jsonString (show (absBody d))),("parameter_kinds",strings (absParamKinds d))]) (absDef a))]
graphJSON :: Graph -> String
graphJSON g=objectJSON
  [("features",arrayJSON [objectJSON [("type",jsonString (show (featureType f))),("denotation",strings (denotation f))
    ,("expression",jsonString (expression f)),("provenance",strings (provenance f)),("trigger",jsonString (show (trigger f)))
    ,("cost",show (cost f)),("status",jsonString (show (status f)))] | f<-features g])
  ,("high_level_view",strings (highLevelView g))
  ,("high_level_edges",strings (map show (highEdges g)))
  ,("key_candidates",arrayJSON [objectJSON [("key",jsonString (show (kcKey k))),("origin",jsonString (show (kcOrigin k))),("seed",boolJSON (kcSeed k))
    ,("phase",jsonString (kcPhase k)),("status",jsonString (kcStatus k)),("cost",show (kcCost k))] | k<-keyCandidates g])
  ,("alignment_witnesses",arrayJSON [arrayJSON (map witnessJSON ws) | ws<-alignmentEvidence g])
  ,("semantic_classes",arrayJSON (map classJSON (classes g)))
  ,("counterfactual_contexts",arrayJSON (map cfJSON (counterfactuals g)))
  ,("rejected_counterfactual_contexts",arrayJSON (map cfJSON (rejectedCounterfactuals g)))
  ,("abstractions",arrayJSON (map absJSON (abstractions g)))
  ,("refinement_nodes",arrayJSON (map nodeJSON (refinements g)))
  ,("trace",strings (trace g))]

-- Audit sections required by the v0.6 prompt (19.1-19.3).
auditJSON :: Graph -> Maybe Program -> String
auditJSON g p=objectJSON
  [("first_item_ambiguity",arrayJSON [objectJSON [("slot",jsonString (scSlot c)),("training_signature",ints (scDenotation c))
      ,("candidates",arrayJSON [objectJSON [("expression",jsonString (show (repExpr r))),("intensionality_class",jsonString (repClass r))
        ,("counterfactual_signature",arrayJSON (map eitherJSON (repCF r))),("ranking_components",costJSON (repCost r))] | r<-scReps c])
      ,("selected_candidate",jsonString (show (scSelected c)))] | c<-classes g, any (`isPrefixOf` scSlot c) ["first-","shared-"]])
  ,("alignment_key",case [ws | ws<-alignmentEvidence g, not (null ws)] of
      [] -> "null"
      cohorts -> let w=head (last cohorts); (a,b)=alignmentExpression w in objectJSON
        [("input_key",jsonString (show a)),("output_key",jsonString (show b)),("input_seed",boolJSON (isSeedKey a)),("output_seed",boolJSON (isSeedKey b))
        ,("synthesized",boolJSON (not (isSeedKey a && isSeedKey b))),("key_derivation",strings [orderingDerivation (alignmentLeft w),orderingDerivation (alignmentRight w)
          ,"input observers: "++intercalate "," (keyObservers a),"output observers: "++intercalate "," (keyObservers b)])
        ,("tie_legality",jsonString "strict ordering on every case; ties rejected (metric ordering_ties_rejected); refinement only via explicit Lex key")
        ,("final_program_key",maybe "null" (\pr->jsonString (show (map defKey (M.elems (progDefs pr))++[defKey d | Inline d<-[progExec pr]]))) p)])
  ,("online_abstraction",arrayJSON [objectJSON [("name",jsonString (absName a)),("family",jsonString (absFamily a)),("discovery_step",show (absDiscoveryStep a))
      ,("promotion_step",show (absPromotionStep a)),("first_reuse_step",maybe "null" show (absFirstReuseStep a)),("reuse_count",show (absReuseCount a))
      ,("saved_refinement_expansions",show (absSaved a)),("accepted",boolJSON (uAccepted (absUtility a)))
      ,("search_reduction_claimed",boolJSON (absReuseCount a>0))] | a<-abstractions g, absFamily a/="OrderedCorrespondence"])]

-- Matrix runs include the real unchanged R2 fallback whenever the front fails.
runTask :: FilePath -> Mode -> Config -> Task -> IO String
runTask out mode conf task=do
  createDirectoryIfMissing True out
  start<-getMonotonicTimeNSec
  let f=frontSearch mode conf (training task)
  _<-evaluate (length (show f))
  frontEnd<-getMonotonicTimeNSec
  old<-case program f of
    Just _->pure Nothing
    Nothing->Just <$> R2.inducedSearch R2.Full (V4.r2Config (legacyConfig conf)) (training task)
  end<-getMonotonicTimeNSec
  let predict x=case program f of
        Just p->runProgram p x
        Nothing->case old >>= R2.inducedProgram of
          Nothing->Left "frontend and fallback failed"
          Just p->R2.predictInduced (V4.r2Config (legacyConfig conf)) p x
      trainExact=all (\(x,y)->predict x==Right y) (training task)
      heldExact=not (null (tests task)) && all (\t->maybe False (\y->predict (testInput t)==Right y) (testOutput t)) (tests task)
      frontTrain=maybe False (\p->all (\(x,y)->runProgram p x==Right y) (training task)) (program f)
      frontHeld=maybe False (\p->not (null (tests task)) && all (\t->maybe False (\y->runProgram p (testInput t)==Right y) (testOutput t)) (tests task)) (program f)
      fallbackCount=maybe 0 (const 1) old :: Int
      g=(graph f) {counters=M.insert "fallback_count" fallbackCount (counters (graph f))}
      solution=objectJSON [("version",jsonString "LATIS-collection-v0.6-experiment"),("task",jsonString (taskId task)),("mode",jsonString (show mode))
        ,("configuration",jsonString (show conf)),("front_success",boolJSON frontTrain),("front_train_exact",boolJSON frontTrain),("front_heldout_exact",boolJSON frontHeld)
        ,("train_exact",boolJSON trainExact),("heldout_exact",boolJSON heldExact),("front_failure",jsonString (failure f))
        ,("program",maybe "null" (jsonString . show) (program f))
        ,("metrics",objectJSON [(k,show v) | (k,v)<-M.toList (counters g)])
        ,("audit",auditJSON g (program f))
        ,("r2_search_work",show (maybe 0 (M.findWithDefault 0 "total_expanded_work" . R2.inducedMetrics) old))
        ,("front_seconds",show (fromIntegral (frontEnd-start)/1e9 :: Double)),("total_seconds",show (fromIntegral (end-start)/1e9 :: Double))
        ,("predictions",arrayJSON [either (const "null") jsonGrid (predict (testInput t)) | t<-tests task])]
  writeFile (out </> "solution.json") (solution++"\n")
  writeFile (out </> "derivation_graph.json") (graphJSON g++"\n")
  writeFile (out </> "trace.txt") (unlines (trace g++[failure f]))
  case old of Nothing->pure (); Just r->R2.saveInduced (out </> "r2-fallback") R2.Full (V4.r2Config (legacyConfig conf)) task r
  putStrLn (taskId task++" "++show mode++" front="++show frontTrain++" held="++show frontHeld++" final="++show (trainExact,heldExact)++" "++failure f)
  pure (intercalate "," ([taskId task,show mode,show frontTrain,show frontHeld,show trainExact,show heldExact]
    ++[show (metric k g) | k<-csvMetrics]))
csvMetrics :: [String]
csvMetrics=words "semantic_classes representatives max_representatives_per_class counterfactual_contexts_generated counterfactual_splits premature_collapses intensional_candidates literal_candidates alignment_key_candidates synthesized_keys_accepted ordering_ties_rejected alignment_witnesses online_abstractions_proposed online_abstractions_accepted online_abstraction_reuses refinement_expansions_saved operator_applications refinement_expansions active_frontier_size visibility_size search_work fallback_count equality_attempts rejected_size_comparisons unexplained_equalities ConcreteCrossItemEdgeCount_high_level UntriggeredExpansionCount expanded_frozen_features accepted_abstractions posthoc_abstractions_accepted"

-- Mechanism tasks. Canvas 30x30; every object is a 4-connected component.
grid :: [(Int,Int,Int)] -> Grid
grid xs=either error id (gridFromCells (Dimensions 30 30) 0 [(Coord x y,c) | (x,y,c)<-xs])
data Ob = Ob { obX, obY :: Int, obCells :: [(Int,Int)], obW, obH, obColor :: Int }
rectOb :: (Int,Int) -> Int -> Int -> Int -> Ob
rectOb (x,y) w h c=Ob x y [(i,j) | i<-[0..w-1], j<-[0..h-1]] w h c
-- vertical bar at the right end of a foot: top-most cell is NOT the bbox corner,
-- so encoder enumeration order differs from Lex(Y,X).
hookOb :: (Int,Int) -> Int -> Int -> Int -> Ob
hookOb (x,y) h f c=Ob x y ([(f-1,j) | j<-[0..h-1]]++[(i,h-1) | i<-[0..f-2]]) f h c
placeOb :: (Int,Int) -> Ob -> [(Int,Int,Int)]
placeOb (x,y) o=[(x+i,y+j,obColor o) | (i,j)<-obCells o]
inputGrid :: [Ob] -> Grid
inputGrid obs=grid (concat [placeOb (obX o,obY o) o | o<-obs])
-- Output: stack by height at x=0 with one empty row between items.
stackOutput :: [Ob] -> Grid
stackOutput obs=grid (concat (go 0 (sortOn obH obs)))
  where go _ []=[]
        go y (o:os)=placeOb (0,y) o:go (y+obH o+1) os
-- Output: diagonal chain from GridTL, next item at (PrevRight+1,PrevBottom+1).
chainOutput :: (Ob -> Int) -> [Ob] -> Grid
chainOutput key obs=grid (concat (go (0,0) (sortOn key obs)))
  where go _ []=[]
        go (x,y) (o:os)=placeOb (x,y) o:go (x+obW o,y+obH o) os
shiftOutput :: Int -> [Ob] -> Grid
shiftOutput k obs=grid (concat [placeOb (obX o+k,obY o) o | o<-obs])
mk :: String -> [([Ob],Grid)] -> ([Ob],Grid) -> Task
mk name trainCases (hx,hy)=Task name [(inputGrid obs,g) | (obs,g)<-trainCases] [TestPair (inputGrid hx) (Just hy)]
stressTasks :: [(String,Task)]
stressTasks =
  [("A-seed-key",Task "A-seed-key" [move 2 False,move 3 False] [TestPair (fst (move 4 True)) (Just (snd (move 4 True)))])
  ,("B-composite-key",mk "B-composite-key" [stackCase b1,stackCase b2] (stackCase bH))
  ,("C-runtime-order-trap",mk "C-runtime-order-trap" [stackCase c1,stackCase c2] (stackCase cH))
  ,("D-size-index-trap",mk "D-size-index-trap" [shiftCase 2 d1,shiftCase 3 d2] (shiftCase 4 dH))
  ,("E-first-item-counterfactual",mk "E-first-item-counterfactual" [chainCase obX e1,chainCase obX e2] (chainCase obX eH))
  ,("F-repeated-pattern",mk "F-repeated-pattern" [chainCase obY f1,chainCase obY f2,chainCase obY f3] (chainCase obY fH))]
  where
    -- A: input enumeration is y-major; heldout reverses y; semantic X order and colors stay unambiguous.
    move n rev=let ps=[(2+4*i,if rev then 12-i else 2+i,1+i) | i<-[0..n-1]] in (grid ps,grid [(x+1,y,c) | (x,y,c)<-ps])
    stackCase obs=(obs,stackOutput obs)
    shiftCase k obs=(obs,shiftOutput k obs)
    chainCase key obs=(obs,chainOutput key obs)
    -- B: X, Y, Area and Color all tie on the input; Lex(X,Y)/Lex(Y,X) give the
    -- wrong pairing; only the synthesized Height key reproduces the stack order.
    b1=[rectOb (2,2) 1 3 5,rectOb (2,10) 3 1 5,rectOb (10,2) 2 2 5]
    b2=[rectOb (2,2) 1 4 5,rectOb (2,10) 2 2 5,rectOb (10,2) 3 1 5,rectOb (10,10) 1 3 5]
    bH=[rectOb (2,2) 1 5 5,rectOb (2,10) 1 3 5,rectOb (10,2) 3 1 5,rectOb (10,10) 1 4 5,rectOb (18,2) 2 2 5]
    -- C: encoder enumeration order equals the height order on both training
    -- cases (hook shapes break Lex(Y,X)); the heldout breaks enumeration order.
    c1=[hookOb (2,2) 3 6 5,rectOb (4,2) 1 1 5,rectOb (2,10) 1 4 5]
    c2=[rectOb (2,2) 1 1 5,rectOb (6,2) 1 2 5,hookOb (2,8) 4 5 5,rectOb (0,8) 1 3 5]
    cH=[rectOb (2,2) 1 3 5,rectOb (6,2) 1 1 5,rectOb (10,2) 1 5 5,rectOb (2,10) 1 2 5,rectOb (6,10) 1 4 5]
    -- D: shift by the number of distinct indexed shapes. A 2x1 bar and a 1x2 bar
    -- have equal payload [5,5]; with the size index erased the count is one less.
    d1=[rectOb (2,2) 2 1 5,rectOb (6,2) 1 2 5,rectOb (10,2) 2 1 5]
    d2=[rectOb (2,2) 2 1 5,rectOb (6,2) 1 2 5,rectOb (10,2) 3 1 5,rectOb (16,2) 3 1 5]
    dH=[rectOb (2,2) 2 1 5,rectOb (6,2) 1 2 5,rectOb (9,2) 1 3 5,rectOb (13,2) 3 1 5,rectOb (18,2) 2 1 5,rectOb (22,2) 2 1 5]
    -- E: the first item (by X) sits at x=0 in training, so GridTL, Literal 0 and
    -- CurrentX coincide; the heldout first item is at x=3.
    e1=[rectOb (0,24) 2 2 1,rectOb (5,25) 3 1 2,rectOb (11,23) 1 3 3]
    e2=[rectOb (0,20) 1 2 4,rectOb (4,25) 2 1 6,rectOb (9,22) 2 2 7,rectOb (15,25) 1 1 8]
    eH=[rectOb (3,25) 2 1 1,rectOb (8,24) 1 2 2,rectOb (13,23) 2 2 3,rectOb (20,25) 3 1 5,rectOb (26,25) 1 1 6]
    -- F: chain order is the input Y order; several seed pairs are complete but
    -- fail validation, and the same anchor pattern appears on both axes.
    f1=[rectOb (5,2) 2 2 3,rectOb (12,8) 3 1 1,rectOb (2,15) 1 2 4]
    f2=[rectOb (8,1) 1 3 2,rectOb (1,6) 2 2 5,rectOb (14,12) 3 1 1,rectOb (6,20) 1 1 7]
    f3=[rectOb (10,3) 3 1 6,rectOb (3,9) 1 1 2,rectOb (16,14) 2 3 8]
    fH=[rectOb (12,1) 1 1 1,rectOb (3,5) 2 2 4,rectOb (20,9) 3 1 2,rectOb (7,14) 1 3 9,rectOb (15,22) 2 1 3]

runMatrix :: FilePath -> Int -> Config -> Task -> IO ()
runMatrix out mechanismBudget conf vertical=do
  createDirectoryIfMissing True out
  rs<-forM (stressTasks++[("03560426",vertical {taskId="03560426"})]) $ \(name,t)->do
    let legacy=legacyConfig conf
        cfg=if name=="03560426" then conf else conf {legacyConfig=legacy {V4.r2Config=(V4.r2Config legacy) {R2.workBudget=mechanismBudget}}}
    forM [minBound..maxBound] $ \mode->runTask (out </> name </> show mode) mode cfg t
  writeFile (out </> "metrics.csv") (unlines (("task,mode,front_train,front_heldout,train_exact,heldout_exact,"++intercalate "," csvMetrics):concat rs))
