-- LATIS v0.6 collection front-end: counterfactual-preserving online
-- abstraction. Incremental upgrade of the v0.5 collection front-end; the v0.5
-- module, v0.4 solver and R2 fallback are unchanged. Invariants kept:
-- trigger before expansion; no alignment without an explanation; matched
-- features stop expanding; no concrete cross-item edge at high levels.
--
-- v0.6.1 adds the SafeOnline reuse policy: an accepted abstraction makes
-- Call(I_k) a PREFERRED candidate, the residual grammar of that slot is
-- recorded as a deferred (never deleted) candidate range, and the residual is
-- resumed on failure of the preferred branch, on realization failure, and
-- after the first solution so that the final selection ranges over the same
-- candidate set NoOnlineAbstraction sees. The v0.6 behaviour is kept as the
-- ExclusiveReuse policy (Full with the default config, ExclusiveReuseLegacy).
module Synthesis.Collection.Front
  ( Mode(..), ReusePolicy(..), Config(..), defaultConfig, Status(..), IndexedType(..), Feature(..), MatchEdge(..), KeyCandidate(..)
  , Deferred(..), Graph(..), Front(..), Program(..), Execution(..), Definition(..), Body(..)
  , runProgram, runProgramEvidence, frontSearch, metric, expandedFrontier, policyFor, metricNames, permuteObjects, safePolicy
  , StageA(..), ArgPolicy(..), stageAOff, SizeRule(..), sizeRuleText, outputSize, Source(..)
  , StageB(..), stageBOff, Schedule(..), RefSummary(..), GraphStats(..), slotLeafInfo, snapshotFor, snapshotForLeaves, goalLeaves
  , scSlotName, scRepTexts, scSelectedText
  , StageC(..), stageCOff, RelationRecord(..), ShapeRecord(..), ObjectTransform, transformText
  , StageD(..), stageDOff, stageDFull
  ) where

import Latent.Grid
import Latent.Encode
import Latent.Render
import qualified Latent.Object as O
import qualified Synthesis.Triggered as V4
import qualified Synthesis.InducedR2.Learn as R2
import Synthesis.Collection.Indexed
import Synthesis.Collection.Counterfactual
import Synthesis.Collection.Online
import Synthesis.Collection.Typed
import Synthesis.Collection.Size
import Synthesis.Collection.Referent
import Synthesis.Collection.Relation
import Synthesis.Collection.Shape
import Synthesis.Collection.Unified
import Debug.Trace (traceEvent)
import qualified Synthesis.Collection.Diagnostics as DG
import qualified Data.Map.Strict as M
import qualified Data.Set as S
import Control.Monad (forM, forM_, when, unless, filterM)
import Data.List (sortOn, nub, intercalate, sort)
import Data.Maybe (fromMaybe, isNothing)
import Data.Either (isRight)

data Mode = Full | NoCounterfactual | CollapseByTrainingDenotation | NoIntensionalityPrior | FixedAlignmentKeys
  | NoAlignmentExplanation | NoOnlineAbstraction | PostHocOnly | NoDependentIndex | DirectSetIndexing | R2FallbackOnly
  | SafeOnline | ExclusiveReuseLegacy
  deriving (Eq,Ord,Show,Read,Enum,Bounded)
-- ExclusiveReuse: v0.6 behaviour, Call(I_k) replaces the slot's alternatives.
-- SafeReuse: Call(I_k) is preferred, alternatives are deferred and recoverable.
data ReusePolicy = ExclusiveReuse | SafeReuse deriving (Eq,Ord,Show,Read)
data Status = Unmatched | Matched | Frozen deriving (Eq,Ord,Show)
data IndexedType = ObjectT SizeSig | PlacedT SizeSig | ExistsPlacedT | SetT IndexedType | NatT | OrderedT KeyExpr [Int]
  | AlignmentT [Int] | RefT IndexedType | ConceptT IndexedType | ScalarT String
  | NatPosT | Size2T deriving (Eq,Ord,Show)
data Feature = Feature
  { featureType :: IndexedType, denotation :: [String], expression :: String, provenance :: [String]
  , trigger :: Maybe Trigger, cost :: Int, status :: Status } deriving (Eq,Show)
data MatchEdge = AbstractEdge String String | ConcreteEdge String String deriving (Eq,Show)
data KeyCandidate = KeyCandidate { kcKey :: KeyExpr, kcOrigin :: Origin, kcSeed :: Bool, kcPhase :: String, kcStatus :: String, kcCost :: Int } deriving (Eq,Show)
-- A deferred candidate range: the residual grammar of a slot whose preferred
-- Call branch was taken. Provenance, range, visited status and the resume
-- event are all recorded; nothing is deleted.
data Deferred = Deferred
  { dfSlot :: String, dfRange :: (Int,Int), dfAbstraction :: String, dfPromotionStep :: Int, dfCreatedStep :: Int
  , dfStatus :: String, dfReason :: String, dfResumedStep :: Maybe Int, dfResumedCandidates :: Int
  , dfClassBefore :: Int, dfClassAfter :: Int, dfSelectedBefore :: String, dfSelectedAfter :: String, dfRecovered :: Bool } deriving (Eq,Show)
data Graph = Graph
  { features :: [Feature], highEdges :: [MatchEdge], abstractions :: [Abstraction], counters :: M.Map String Int, trace :: [String]
  , alignmentEvidence :: [[Alignment]], keyCandidates :: [KeyCandidate], classes :: [SemanticClass]
  , counterfactuals :: [Counterfactual], rejectedCounterfactuals :: [Counterfactual], refinements :: [RNode], highLevelView :: [String]
  , deferred :: [Deferred], referents :: [RefSummary]
  , relations :: [RelationRecord], shapes :: [ShapeRecord], dGoals :: [GoalAudit] } deriving (Eq,Show)
-- Stage C audit records: every training-exact object transformation (the
-- selected one carries the relation witnesses) and the canonical Shape
-- decomposition of every distinct object mask of the training scenes.
data RelationRecord = RelationRecord { rrTransform :: String, rrCost :: Int, rrConstants :: Int, rrUsesShape :: Bool, rrSelected :: Bool, rrWitnesses :: [String] } deriving (Eq,Show)
data ShapeRecord = ShapeRecord { shMask :: String, shOccurrences :: Int, shDecomposition :: Maybe String, shSize :: Int, shTies :: Int, shCandidates :: Int, shTruncated :: Bool } deriving (Eq,Show)
data Front = Front { program :: Maybe Program, graph :: Graph, failure :: String } deriving (Eq,Show)
-- stageA (Stage A: grid size feature, typed N-ary holes, mod/isOdd) is all
-- off by default; the v0.6.1 behaviour is unchanged unless a flag is set.
-- stageB (Stage B: bounds/Bool primitives, referent graph, structural
-- generalization, shared VSA, hierarchical schedule) is all off by default;
-- with it off the behaviour is exactly Stage A.
-- stageC (Stage C: Shape algebra, diagonal view, object-set transformations,
-- object-level size features, goal-directed snapshot) is all off by default.
data Config = Config { alignmentBudget :: Int, scalarBudget :: Int, synthesisDepth :: Int, synthesisCostBound :: Int, promotionThreshold :: Int
  , reusePolicy :: ReusePolicy, enumerationSeed :: Maybe Int, legacyConfig :: V4.Config, stageA :: StageA, stageB :: StageB, stageC :: StageC, stageD :: StageD } deriving (Eq,Show)
defaultConfig :: Config
defaultConfig=Config 400 2000 2 5 4 ExclusiveReuse Nothing V4.defaultConfig stageAOff stageBOff stageCOff stageDOff
-- Candidate source of a slot: the v0.6.1 scalar grammar, the Stage B referent
-- hierarchy (frozen per-axis snapshot, class lookup under a schedule) and the
-- typed N-ary hole search; the latter two are unlocked only after the grammar
-- fails on an axis, the hole search only after the hierarchy found nothing.
data Source = Grammar | Hierarchy | TypedHoles deriving (Eq,Show)
metric :: String -> Graph -> Int
metric k=M.findWithDefault 0 k . counters
-- Text views of a semantic class for audit writers that do not import the scalar IR.
scSlotName :: SemanticClass -> String
scSlotName=scSlot
scRepTexts :: SemanticClass -> [String]
scRepTexts c=[show (repExpr r) | r<-scReps c]
scSelectedText :: SemanticClass -> String
scSelectedText=show . scSelected
expandedFrontier :: [Feature] -> [Feature]
expandedFrontier=filter ((==Unmatched) . status)
policyFor :: Mode -> ClassPolicy
policyFor m=ClassPolicy (m/=NoCounterfactual) (m==CollapseByTrainingDenotation) (m/=NoIntensionalityPrior)
safePolicy :: Mode -> Config -> Bool
safePolicy SafeOnline _=True
safePolicy ExclusiveReuseLegacy _=False
safePolicy _ conf=reusePolicy conf==SafeReuse
metricNames :: [String]
metricNames=words "b_goal_queries b_goal_leaves_dropped b_goal_cache_hits b_goal_level1_hits b_goal_level2_builds c_relation_triggered c_relation_trigger_cardinality c_relation_trigger_fallback c_relation_candidates c_relation_tried c_relation_executions c_relation_fits c_relation_truncated c_relation_selected_cost c_relation_shape_used c_object_count_exact c_object_transform_exact c_shape_masks c_shape_decomposed c_shape_decomposed_truncated c_shape_unrepresentable c_shape_truncated c_shape_ast_total c_shape_ties c_shape_work c_diagonal_chains_accepted c_diagonal_chains_rejected c_view_pixels_merged c_size_object_features b_snapshots_built b_snapshot_work b_graph_nodes b_graph_classes b_graph_templates b_graph_closed_terms b_graph_truncations b_constant_only_dropped b_edges_confirmed b_edges_pending b_edges_not_supported b_type_edges b_closure_edges b_sccs b_layers b_substitutions_tried b_outside_universe b_edge_truncations b_vsa_nodes b_vsa_unions b_vsa_expanded b_vsa_expansion_mismatch b_sharing_avg_x100 b_sharing_max_x100 b_dag_evaluations b_reference_evaluations b_witness_full b_hierarchy_slots b_hierarchy_fits b_class_checks b_row_lookups b_flat_row_evaluations b_candidates_covered b_fitting_classes b_layer_exposed b_layer_searched b_layer_truncated b_slot_truncations b_global_truncations b_hierarchy_fallbacks b_hierarchy_solved_slots typed_hole_global_truncations size_rule_templates size_rule_evaluations size_rule_candidates size_rule_truncations size_rule_exact canvas_changes_entering_search typed_hole_slots_triggered typed_hole_templates typed_hole_evaluations typed_hole_fits typed_hole_constant_fits typed_hole_feature_fits typed_hole_truncations grid_realizations_attempted grid_realization_ok realization_render_errors realization_mismatches UntriggeredExpansionCount ConcreteCrossItemEdgeCount_high_level expanded_frozen_features alignment_attempts alignment_rejections equality_attempts rejected_size_comparisons unexplained_equalities alignment_lift_attempts alignment_lift_successes accepted_abstractions construction_triggers fallback_count semantic_classes representatives max_representatives_per_class counterfactual_contexts_generated counterfactual_contexts_rejected counterfactual_evaluations counterfactual_splits canonical_merges premature_collapses dropped_by_collapse intensional_candidates literal_candidates alignment_key_candidates synthesized_keys_accepted ordering_ties_rejected alignment_witnesses online_abstractions_proposed online_abstractions_accepted online_abstraction_reuses refinement_expansions_saved operator_applications refinement_expansions active_frontier_size visibility_size visibility_keys search_work alignment_failure_triggers posthoc_abstractions_accepted reuse_attempts reuse_hits call_attempts call_legality_checks call_legality_rejections deferred_candidates resumed_candidates resume_events resume_retries recovered_solutions reselected_after_completion exclusive_reuse_missed_candidates exclusive_reuse_missed_solutions diagnostic_operator_applications first_solution_work total_work_to_exhaustion completion_work alignment_candidates_remaining rank_reuse_witnesses_verified"

-- Stage B leaf meta-information of the object-slot language. Previous leaves
-- and set aggregates are partial (rank 0 / empty set); Ext Current is fixed
-- by the size index of the object binder.
slotLeafInfo :: LeafInfo SlotLeaf
slotLeafInfo=LeafInfo (const TyInt) slotLeafName input precondition partial sortDetermined
  where
    input (LeafGrid _)="Scene"
    input (LeafAtom a)=case a of
      Pos Current _->"Object"; Ext Current _->"Object"; Max Current _->"Object"
      Pos Previous _->"Previous"; Ext Previous _->"Previous"; Max Previous _->"Previous"
      SceneLow _->"Scene"; SceneHigh _->"Scene"; _->"Set"
    precondition (LeafAtom a)=case a of
      Pos Previous _->["rank > 0 (Previous exists)"]; Ext Previous _->["rank > 0 (Previous exists)"]; Max Previous _->["rank > 0 (Previous exists)"]
      SetMin _->["non-empty set"]; SetMax _->["non-empty set"]; Max Current _->["non-empty object"]; _->[]
    precondition _=[]
    partial l=not (null (precondition l)) && case l of LeafAtom (Max Current _)->False; _->True
    sortDetermined (LeafAtom (Ext Current _))=True
    sortDetermined _=False
previousLeaf :: SlotLeaf -> Bool
previousLeaf (LeafAtom a)=case a of Pos Previous _->True; Ext Previous _->True; Max Previous _->True; _->False
previousLeaf _=False
-- The frozen snapshot of one axis from grounded contexts (id, Ctx). The
-- dependency counterfactual contexts are derived from every grounded context.
snapshotFor :: StageB -> HoleConfig -> Axis -> [(String,Ctx)] -> RefGraph SlotLeaf
snapshotFor sb hc axis=snapshotForLeaves sb hc [(l,t) | (l,t)<-slotLeavesB (sbBounds sb) axis, not (previousLeaf l)]
-- The same snapshot over an explicit leaf set (Stage C4: the Typed Goal's
-- visible input sources; the universe depth is sbGraphDepth of the block).
snapshotForLeaves :: StageB -> HoleConfig -> [(SlotLeaf,TTy)] -> [(String,Ctx)] -> RefGraph SlotLeaf
snapshotForLeaves sb hc leaves grounded=
  let sortOf p=let SizeSig w h=placedSig p in "Object["++show w++"x"++show h++"]"
      ctxs=[Context cid (sortOf (ctxCurrent c)) (evalSlotLeaf M.empty c) | (cid,c)<-grounded]
      deps=[Context (cid++":"++label) (sortOf (ctxCurrent c')) (evalSlotLeaf M.empty c') | (cid,c)<-grounded, (label,c')<-dependencyContexts c]
  in buildGraph sb hc slotLeafInfo leaves TyInt ctxs deps []
-- Stage C4 Typed Goal: of the axis' visible leaves only those that are input
-- SOURCES for this task, i.e. whose value varies over the grounded contexts or
-- their type-safe dependency counterfactuals. A leaf that is constant on all of
-- them cannot explain any variation of an Int target and is covered by the
-- constant holes; dropping it removes no goal-reachable candidate of the
-- reference universe (completeness is checked by the tests).
goalLeaves :: StageB -> Axis -> [(String,Ctx)] -> ([(SlotLeaf,TTy)],[(SlotLeaf,TTy)])
goalLeaves sb axis grounded=
  let allLeaves=[(l,t) | (l,t)<-slotLeavesB (sbBounds sb) axis, not (previousLeaf l)]
      ctxs=[c | (_,c)<-grounded]++[c' | (_,c)<-grounded, (_,c')<-dependencyContexts c]
      varying l=length (nub [v | c<-ctxs, Right v<-[evalSlotLeaf M.empty c l]])>1
      kept=[(l,t) | (l,t)<-allLeaves, varying l]
  in (kept,[(l,t) | (l,t)<-allLeaves, not (varying l)])

-- Deterministic enumeration permutation (metamorphic tests). The ID-free Set
-- IR is insensitive to it; only the deliberately unsafe modes can notice.
permuteObjects :: Maybe Int -> [O.Object] -> [O.Object]
permuteObjects Nothing xs=xs
permuteObjects (Just seed) xs=map snd (sortOn fst (zip keys xs))
  where keys=take (length xs) (tail (iterate (\x->(x*1103515245+12345) `mod` 2147483648) (abs seed+1)))

-- Executable program. The high level sees Call(I_0) and the contract; the
-- definition (ordering key, sequence body) and the scalar abstraction library
-- are the hidden refinement, expanded only when executing (RefinementTrigger).
data Body = Body { bodyFirst :: (Scalar,Scalar), bodyNext :: (Scalar,Scalar) } deriving (Eq,Show)
data Definition = Definition { defKey :: KeyExpr, defBody :: Body, defUnsafe :: Bool } deriving (Eq,Show)
data Execution = Inline Definition | CallTop String deriving (Eq,Show)
-- progSize (Stage A): the Size2 rule that realizes the output canvas from the
-- input; Nothing keeps the input canvas (v0.6.1).
-- progTransform (Stage C): when present the output objects are produced by the
-- Set[Object] -> Set[Object] transformation instead of the sequence-local body;
-- progView: the local diagonal-bar view is applied to the encoded input.
data Program = Program { progEncoder :: EncoderConfig, progExec :: Execution, progDefs :: M.Map String Definition
  , progLibrary :: Library, progDependent :: Bool, progPermutation :: Maybe Int, progSize :: Maybe SizeRule
  , progTransform :: Maybe ObjectTransform, progView :: Bool } deriving (Eq,Show)
-- Realization order: encode the input, compute the output canvas from the size
-- rule (input features and shared constants only), order the input objects,
-- place every object by the sequence-local body, then render on the output
-- canvas. Rendering rejects any cell outside the canvas (no clipping); the
-- background is the encoder background; later objects win on overlap.
runProgram :: Program -> Grid -> Either String Grid
runProgram p grid=do
  (scene,dims,es)<-runProgramObjects p grid
  render scene {O.canvas=dims,O.objects=map eoObject es}

-- Evidence uses the same execution core; its independent pixel verifier does
-- not trust the renderer's resulting grid or connected-component partition.
runProgramEvidence :: Program -> Grid -> Either String ([EmittedObject],RenderWitness)
runProgramEvidence p grid=do
  (scene,dims,es)<-runProgramObjects p grid
  rw<-renderWitness dims (O.background scene) es
  if verifyRenderWitness dims (O.background scene) es rw then Right (es,rw)
    else Left "render witness failed independent replay"

runProgramObjects :: Program -> Grid -> Either String (O.Scene,Dimensions,[EmittedObject])
runProgramObjects (Program enc ex defs lib dep perm size tr view) grid=do
  let scene0=encode enc grid
      scene1=if view then let (os,_,_)=applyDiagonalView (O.objects scene0) in scene0 {O.objects=os} else scene0
      scene=scene1 {O.objects=permuteObjects perm (O.objects scene1)}
      objs=O.objects scene
      set=objectSet objs
      sourcesByPlaced=M.fromListWith (++) [(placedFromObject o,[O.objectId o]) | o<-objs]
  outDims <- maybe (Right (O.canvas scene)) (\r->outputSize dep r scene) size
  case tr of
   Just t->do
    d<-case ex of
      Inline def->Right def
      CallTop n->maybe (Left "missing abstraction refinement") Right (M.lookup n defs)
    if d/=Definition scanKey (Body (Lit 0,Lit 0) (Lit 0,Lit 0)) True
      then Left "relation: sequence body cannot be silently ignored; use typed MapPosition or an explicit OrderedView adapter"
      else Right ()
    emitted<-either (\e->Left ("relation: "++e)) Right (emitObjectsInput t (O.canvas scene) outDims objs)
    Right (scene,outDims,emitted)
   Nothing->do
    Definition key body unsafe <- case ex of
     Inline d->Right d
     CallTop n->maybe (Left "missing abstraction refinement") Right (M.lookup n defs)
    items <- if unsafe then Right (map placedFromObject objs) else orderedItems <$> orderBy [key] NeedOrderedView InputSet key set
    out <- walk body outDims (O.canvas scene) set Nothing (zip [0::Int ..] items)
    emitted<-traverse (\(original,moved)->case M.findWithDefault [] original sourcesByPlaced of
      [source]->let o=(placedToObject moved) {O.objectId=source} in Right (EmittedObject o [source] "sequence body (OrderedView checked by execution)")
      _->Left "sequence binder has ambiguous input source identity") (zip items out)
    Right (scene,outDims,emitted)
  where
    walk _ _ _ _ _ []=Right []
    walk body dims inDims set prev ((i,p):rest)=do
      let ctx=Ctx dims set p prev dep inDims
          (fx,fy)=if i==0 then bodyFirst body else bodyNext body
      x<-evalScalar lib ctx fx
      y<-evalScalar lib ctx fy
      let moved=p {placedPos=Coord x y}
      (moved:) <$> walk body dims inDims set (Just moved) rest

-- Search state and a small state monad (no mtl dependency).
data St = St { stGraph :: Graph, stStep :: Int, stNextAbs :: Int, stLibrary :: Library
  , stViews :: M.Map (KeyExpr,Origin,Int) OrderedView, stTried :: S.Set (KeyExpr,KeyExpr)
  , stCF :: [(Int,Ctx -> Ctx)], stDerivation :: [RNode], stResults :: [String]
  , stPending :: [(String,[Row],[Scalar])], stGrammarFits :: M.Map String [Scalar], stSnapshots :: M.Map (Axis,Int) (RefGraph SlotLeaf) }
newtype Search a = Search { runSearch :: St -> (a,St) }
instance Functor Search where fmap f (Search g)=Search (\s->let (a,s')=g s in (f a,s'))
instance Applicative Search where
  pure a=Search (\s->(a,s))
  Search f <*> Search g=Search (\s->let (h,s1)=f s; (a,s2)=g s1 in (h a,s2))
instance Monad Search where Search g >>= k=Search (\s->case g s of (a,s1)->runSearch (k a) s1)
gets :: (St -> a) -> Search a
gets f=Search (\s->(f s,s))
modify :: (St -> St) -> Search ()
modify f=Search (\s->((),f s))
onGraph :: (Graph -> Graph) -> Search ()
onGraph f=modify (\s->s {stGraph=f (stGraph s)})
inc :: String -> Int -> Search ()
inc k n=onGraph (\g->g {counters=M.insertWith (+) k n (counters g)})
setMetric :: String -> Int -> Search ()
setMetric k n=onGraph (\g->g {counters=M.insert k n (counters g)})
setMax :: String -> Int -> Search ()
setMax k n=onGraph (\g->g {counters=M.insertWith max k n (counters g)})
tick :: Search Int
tick=Search (\s->let n=stStep s+1 in (n,s {stStep=n}))
traceMsg :: String -> Search ()
traceMsg m=onGraph (\g->g {trace=trace g++[m]})
addFeature :: Feature -> Search ()
addFeature f=onGraph (\g->g {features=features g++[f]})
-- Every materialized refinement node is a counted expansion.
addNodes :: [RNode] -> Search ()
addNodes ns=do
  inc "refinement_expansions" (length ns)
  modify (\s->s {stDerivation=stDerivation s++ns, stGraph=(stGraph s) {refinements=refinements (stGraph s)++ns}})
addResult :: String -> Search ()
addResult r=modify (\s->s {stResults=stResults s++[r]})
visible :: String -> Search [Abstraction]
visible family=gets (\s->[a | a<-abstractions (stGraph s), absFamily a==family, uAccepted (absUtility a), absPromotionStep a>=0])
currentWork :: Search Int
currentWork=gets (\s->metric "operator_applications" (stGraph s)+length (refinements (stGraph s)))

seedGraph :: [(O.Scene,O.Scene)] -> Graph
seedGraph pairs=Graph fs [] [] (M.fromList [(k,0) | k<-metricNames]) [] [] [] [] [] [] [] [] [] [] [] [] []
  where fs=[Feature (SetT ExistsPlacedT) (map (show . count . objectSet . O.objects . side) pairs) (show origin)
              ["Objects(Scene)","existential size-index packaging"] Nothing 0 Unmatched
           | (origin,side)<-[(InputSet,fst),(OutputSet,snd)]]
-- Class-derived metrics are recomputed from the final class records so that a
-- resumed (completed) class replaces, rather than double counts, its record.
finish :: Maybe Program -> String -> Graph -> Front
finish p why g=Front p g {counters=M.union (M.fromList
  [("ConcreteCrossItemEdgeCount_high_level",length [() | ConcreteEdge _ _<-highEdges g])
  ,("UntriggeredExpansionCount",length [() | f<-features g, cost f>0, isNothing (trigger f)])
  ,("expanded_frozen_features",0)
  ,("active_frontier_size",length (expandedFrontier (features g)))
  ,("refinement_expansions",length (refinements g))
  ,("search_work",work)
  ,("total_work_to_exhaustion",work)
  ,("completion_work",if metric "first_solution_work" g>0 then work-metric "first_solution_work" g else 0)
  ,("visibility_size",metric "visibility_keys" g+length [() | a<-abstractions g, uAccepted (absUtility a), absPromotionStep a>=0, absFamily a/="OrderedCorrespondence"])
  ,("accepted_abstractions",length [() | a<-abstractions g, uAccepted (absUtility a)])
  ,("semantic_classes",length cs),("representatives",sum (map (length . scReps) cs))
  ,("max_representatives_per_class",maximum (0:map (length . scReps) cs))
  ,("counterfactual_splits",sum (map scSplits cs)),("canonical_merges",sum (map scMerges cs))
  ,("premature_collapses",sum (map scPrematureCollapses cs)),("dropped_by_collapse",sum (map scDropped cs))
  ,("intensional_candidates",length [() | c<-cs, r<-scReps c, repClass r/="literal-derived"])
  ,("literal_candidates",length [() | c<-cs, r<-scReps c, repClass r=="literal-derived"])]) (counters g)} why
  where work=metric "operator_applications" g+length (refinements g)
        cs=classes g

scanKey :: KeyExpr
scanKey=Lex (Anchor TL AY) (Anchor TL AX)

frontSearch :: Mode -> Config -> [(Grid,Grid)] -> Front
frontSearch mode conf examples
  | mode==R2FallbackOnly = finish Nothing "R2FallbackOnly" (seedGraph [])
  | null examples = finish Nothing "grounding: empty training set" (seedGraph [])
  -- The unchanged-canvas guard is the v0.6.1 interface precondition. With the
  -- Stage A grid-size feature the canvas change is instead a synthesis target.
  | not (saGridSize sa) && any (\(a,b)->O.canvas a/=O.canvas b) scenes = finish Nothing "layout: collection frontend requires unchanged canvas" (seedGraph scenes)
  | otherwise =
      let (r,st)=runSearch main (St (seedGraph scenes) 0 1 M.empty M.empty S.empty [] [] [] [] M.empty M.empty)
      in finish (either (const Nothing) Just r) (either id (const "None") r) (stGraph st)
  where
    sa=stageA conf
    sb=stageB conf
    sc=stageC conf
    enc=R2.inducedEncoder (V4.r2Config (legacyConfig conf))
    perm s=s {O.objects=permuteObjects (enumerationSeed conf) (O.objects s)}
    -- Stage C1: the local diagonal-bar view is applied to both sides of every
    -- training pair (same encoding view at inference, applied by runProgram);
    -- the global 4-connectivity encoding itself is unchanged.
    viewOf s=if scDiagonalView sc then let (os,ch,rj)=applyDiagonalView (O.objects s) in (s {O.objects=os},ch,rj) else (s,[],[])
    viewed=[(viewOf (encode enc x),viewOf (encode enc y)) | (x,y)<-examples]
    scenes=[(perm a,perm b) | ((a,_,_),(b,_,_))<-viewed]
    viewChains=[ch | ((_,c1,_),(_,c2,_))<-viewed, ch<-c1++c2]
    viewRejections=[r | ((_,_,r1),(_,_,r2))<-viewed, r<-r1++r2]
    sets=[(objectSet (O.objects a),objectSet (O.objects b)) | (a,b)<-scenes]
    inDims=map (O.canvas . fst) scenes
    -- Stage A: the Size2 rule is synthesized from input-side features before
    -- any object search; the realization canvas of every case is its value.
    sizeOutcome=if saGridSize sa then Just (synthesizeSize sa (scObjectSizeFeatures sc) dep scenes) else Nothing
    sizeRule=case sizeOutcome of Just (Right r,_)->Just r; _->Nothing
    dims=case sizeRule of
      Just r->[either (const (O.canvas x)) id (outputSize dep r x) | (x,_)<-scenes]
      Nothing->inDims
    -- typed slot templates depend only on the axis: enumerated once per run
    -- (Stage B0 appends the Bool operators and the bounds leaves after the
    -- Stage A ones, so the Stage A enumeration order is a prefix)
    holeCfg=holeConfigB sa (sbBoolOps sb)
    slotTemplates AX=templatesAX
    slotTemplates AY=templatesAY
    templatesAX=enumerateTemplates holeCfg (slotLeavesB (sbBounds sb) AX) TyInt
    templatesAY=enumerateTemplates holeCfg (slotLeavesB (sbBounds sb) AY) TyInt
    -- Stage B frozen snapshot of one axis: grounded over every (case, input
    -- object) context with the realization canvas of the case; Previous
    -- leaves are not grounded before alignment and stay in the concrete
    -- typed-hole layer. Built lazily at the first ScalarFailure trigger.
    caseObjects c=sort (nub (map placedFromObject (O.objects (fst (scenes !! c)))))
    objectIndex=M.fromList [((c,p),k) | c<-cases, (k,p)<-zip [0::Int ..] (caseObjects c)]
    contextId c p=maybe (tag c++"unknown") (\k->tag c++"obj"++show k) (M.lookup (c,p) objectIndex)
    groundedOf=[(contextId c p,Ctx (dims !! c) (inSet c) p Nothing dep (inDims !! c)) | c<-cases, p<-caseObjects c]
    -- Stage C4: goal-directed snapshot = goal leaves + the requested universe depth
    buildSnapshot axis depth
      | scGoalDirected sc = let (kept,dropped)=goalLeaves sb axis groundedOf in (snapshotForLeaves sb {sbGraphDepth=depth} holeCfg kept groundedOf,length dropped)
      | otherwise = (snapshotFor sb holeCfg axis groundedOf,0)
    cases=[0..length scenes-1]
    ncases=length scenes
    dep=mode/=NoDependentIndex
    pol=policyFor mode
    online=mode `notElem` [NoOnlineAbstraction,PostHocOnly]
    safe=safePolicy mode conf
    grammar=take (scalarBudget conf) scalarTerms
    inSet c=fst (sets !! c)
    tag c=("case"++show c++":")
    defaultWhy="alignment: no unique common ordering"
    axisOf name=if take 2 (reverse name)=="YA" then AY else AX
    mkProgram ex defs lib=Program enc ex defs lib dep (enumerationSeed conf) sizeRule Nothing (scDiagonalView sc)
    emit fields=do
      w<-currentWork
      Search (\s->DG.diagnostic (sdDiagnostics (stageD conf))
        ([("partial_work",show w),("compose_depth",show (sdComposeDepth (stageD conf))),("param_depth",show (sdParamDepth (stageD conf)))]++fields) ((),s))

    main :: Search (Either String Program)
    main=do
      forM_ [(InputSet,fst),(OutputSet,snd)] $ \(o,side)->addFeature (Feature NatT (map (show . count . side) sets) ("Count("++show o++")")
        [show o] (Just NeedCount) 1 (if all (\(a,b)->count a==count b) sets then Frozen else Unmatched))
      when (scDiagonalView sc) $ do
        inc "c_diagonal_chains_accepted" (length viewChains)
        inc "c_diagonal_chains_rejected" (length viewRejections)
        inc "c_view_pixels_merged" (sum (map (length . dcPixels) viewChains))
        unless (null viewChains && null viewRejections) $ traceMsg ("diagonal view: "++show (length viewChains)++" chains merged ("++show (sum (map (length . dcPixels) viewChains))++" pixels), "++show (length viewRejections)++" candidate chains rejected"
          ++concat [" ["++drReason r++"]" | r<-take 3 viewRejections])
      when (scShape sc) $ do
        emit [("scope",DG.jstr "ShapeDecomposition"),("branch_id",DG.jstr "shape"),("event",DG.jstr "entered"),("trigger",DG.jstr "distinct-mask-audit")]
        shapeAudit
        emit [("scope",DG.jstr "ShapeDecomposition"),("branch_id",DG.jstr "shape"),("event",DG.jstr "completed"),("exhaustiveness",DG.jstr "Unknown")]
      when (scObjectSizeFeatures sc) (setMetric "c_size_object_features" 1)
      emit [("scope",DG.jstr "SizeRule"),("branch_id",DG.jstr "size"),("event",DG.jstr "entered"),("trigger",DG.jstr "input-output-size-constraint")]
      sized<-sizeStep
      emit [("scope",DG.jstr "SizeRule"),("branch_id",DG.jstr "size"),("event",DG.jstr "completed"),("stop_reason",DG.jstr (either (const "NoFitYet") (const "FoundFit") sized)),("exhaustiveness",DG.jstr "Unknown")]
      groundingTrace
      case sized of
        Left err->pure (Left err)
        Right ()->
          -- The sequence-local object path requires equal cardinality. Stage C
          -- opens the Set[Object] transformation search on a cardinality
          -- mismatch (and, with the fallback trigger, after the equal-count
          -- path has failed); without it the v0.6.1 rejection is unchanged.
          if any (\(a,b)->count a/=count b) sets then
            (if scRelations sc then relationPath "cardinality mismatch" Nothing else pure (Left "RankAlign: unequal input/output cardinality"))
          else do
            pre<-prePath
            r<-case pre of
              Left err->pure (Left err)
              Right (Just p)->pure (Right p)
              Right Nothing->explained
            case r of
              Left err | scRelations sc && scFallbackTrigger sc->relationPath "equal-count path failed" (Just err)
              _->pure r

    -- Single-IO trace (level-gated observation of the scenes the search uses:
    -- encoder, permutation and diagonal view already applied).
    traceS :: Int -> [(String,String)] -> Search ()
    traceS lvl fields=Search (\s->DG.traceAt lvl fields ((),s))
    objectJ o=DG.jobj [("id",show (O.objectId o)),("color",maybe "null" show (O.color o)),("colors",show (S.toList (O.colors o)))
      ,("bbox",DG.jarr (map show [cx (O.position o),cy (O.position o),O.width o,O.height o])),("size_sig",DG.jarr [show (O.width o),show (O.height o)])
      ,("pixel_count",show (O.size o)),("mask_hash",DG.jstr (DG.stableHash (show (maskCells (objMask o)))))]
    groundingTrace :: Search ()
    groundingTrace=forM_ (zip3 cases scenes viewed) $ \(c,(a,b),((_,ci,ri),(_,co,ro)))->traceS DG.levelBranches
      [("scope",DG.jstr "Grounding"),("kind",DG.jstr "scene"),("stage",DG.jstr "grounding"),("branch_id",DG.jstr ("grounding.case"++show c)),("parent_branch_id",DG.jstr "task"),("case_index",show c)
      ,("encoder",DG.jstr (show enc)),("diagonal_view",DG.jbool (scDiagonalView sc)),("permutation_seed",maybe "null" show (enumerationSeed conf))
      ,("input_canvas",DG.jarr [show (gridWidth (O.canvas a)),show (gridHeight (O.canvas a))]),("realization_dims",DG.jarr [show (gridWidth (dims !! c)),show (gridHeight (dims !! c))])
      ,("realization_dims_source",DG.jstr (if isNothing sizeRule then "input canvas (no SizeRule fit or SizeRule off)" else "SizeRule evaluated on the input"))
      ,("background",show (O.background a)),("input_objects",DG.jarr (map objectJ (O.objects a)))
      ,("output_objects",DG.jarr (map objectJ (O.objects b))),("output_note",DG.jstr "training target objects: used only by training matching/inverse witnesses")
      ,("diagonal_chains",DG.jobj [("input_accepted",show (length ci)),("input_rejected",show (length ri)),("output_accepted",show (length co)),("output_rejected",show (length ro))
         ,("rejection_reasons",DG.jarr [DG.jstr (drReason r) | r<-take 5 (ri++ro)])])]

    -- Stage C1 audit: canonical Shape decomposition of every distinct object
    -- mask of the training scenes (input and output sides); counted as work.
    shapeAudit :: Search ()
    shapeAudit=do
      let masks=M.toList (M.fromListWith (+) [(objMask o,1::Int) | (a,b)<-scenes, o<-O.objects a++O.objects b])
          recs=[(m,n,decompose (scDecompBudget sc) m) | (m,n)<-masks]
          work=sum [dcCandidates d+dcPairsTried d | (_,_,d)<-recs]
      inc "c_shape_masks" (length recs)
      -- Counting unit: distinct masks of THIS task (both sides, all cases).
      -- A mask can be decomposed AND truncated (an expression was found among
      -- the candidates kept under the budget, so its minimality is not
      -- guaranteed): decomposed + unrepresentable + (truncated - decomposed_truncated) = masks.
      inc "c_shape_decomposed" (length [() | (_,_,d)<-recs, Just _<-[dcExpr d]])
      inc "c_shape_decomposed_truncated" (length [() | (_,_,d)<-recs, Just _<-[dcExpr d], dcTruncated d])
      inc "c_shape_unrepresentable" (length [() | (_,_,d)<-recs, Nothing<-[dcExpr d], not (dcTruncated d)])
      inc "c_shape_truncated" (length [() | (_,_,d)<-recs, dcTruncated d])
      inc "c_shape_ast_total" (sum [dcSize d | (_,_,d)<-recs])
      inc "c_shape_ties" (sum [max 0 (dcTies d-1) | (_,_,d)<-recs])
      inc "c_shape_work" work
      inc "operator_applications" work
      onGraph (\g->g {shapes=[ShapeRecord (show (maskCells m)) n (fmap shapeText (dcExpr d)) (dcSize d) (dcTies d) (dcCandidates d) (dcTruncated d) | (m,n,d)<-recs]})
      addFeature (Feature (ConceptT ExistsPlacedT) [show (length [() | o<-O.objects a, Just _<-[dcExpr (decompose (scDecompBudget sc) (objMask o))]])++"/"++show (length (O.objects a)) | (a,_)<-scenes]
        "ShapeDecomposition(Objects(Input))" ["Shape algebra: canonical minimum-AST decomposition per distinct mask (depth <= 2, budgeted)","masks not representable within the budget keep their raw ShapeMask"] (Just NeedConstruct) 0 Frozen)
      traceMsg ("shape audit: "++show (length recs)++" distinct masks, "++show (length [() | (_,_,d)<-recs, Just _<-[dcExpr d]])++" decomposed, "++show (length [() | (_,_,d)<-recs, dcTruncated d])++" truncated, work "++show work)

    -- Stage C2/C3: executable Set[Object] -> Set[Object] transformations. Every
    -- candidate is executed on every training input and verified by the final
    -- whole-grid exact check; all training-exact candidates survive as
    -- representatives, the selection is by (structural cost, enumeration order).
    relationPath :: String -> Maybe String -> Search (Either String Program)
    relationPath why prior=do
      emit [("scope",DG.jstr "LegacyRelation"),("branch_id",DG.jstr "legacy"),("event",DG.jstr "entered"),("trigger",DG.jstr why)]
      relationStartWork<-currentWork
      inc "c_relation_triggered" 1
      inc (if isNothing prior then "c_relation_trigger_cardinality" else "c_relation_trigger_fallback") 1
      traceMsg ("ObjectRelation trigger ("++why++"): Set[Object] -> Set[Object] transformation search unlocked under NeedConstruct")
      let colors=sort (nub [c | (a,b)<-scenes, o<-O.objects a++O.objects b, Just c<-[objColor o]])
          grammar=RelationGrammar colors (scShape sc) (scDiagonalView sc) (scGaps sc) (scCounts sc) (scRelationMaxCandidates sc)
          cands=enumerateTransforms grammar
          searchCases=[SearchCase (O.objects (fst (scenes !! c))) (dims !! c) (encoderBackground enc) (snd (examples !! c)) | c<-cases]
          res=searchTransforms (scRelationBudget sc) (scRelationMaxFits sc) cands searchCases
          failWith msg=case prior of Just e->Left (e++"; relation search: "++msg); Nothing->Left ("relation: "++msg)
          summary=show (srTried res)++"/"++show (srCandidates res)++" candidates, "++show (srExecutions res)++" case executions"++(if srTruncated res then ", budget truncated" else "")
      traceS DG.levelBranches [("scope",DG.jstr "LegacyRelation"),("kind",DG.jstr "grammar"),("stage",DG.jstr "legacy_relation"),("branch_id",DG.jstr "legacy"),("parent_branch_id",DG.jstr "task"),("trigger",DG.jstr why)
        ,("grammar",DG.jobj [("colors",show colors),("shape",DG.jbool (scShape sc)),("diagonal",DG.jbool (scDiagonalView sc)),("gaps",show (scGaps sc)),("counts",show (scCounts sc))])
        ,("budget",DG.jobj [("name",DG.jstr "scRelationMaxCandidates"),("limit",show (scRelationMaxCandidates sc)),("used",show (length cands)),("unit",DG.jstr "enumerated candidates (cost-sorted prefix)")])
        ,("case_budget",DG.jobj [("name",DG.jstr "scRelationBudget"),("limit",show (scRelationBudget sc)),("unit",DG.jstr "case executions")])
        ,("case_output_dims",DG.jarr [DG.jarr [show (gridWidth (dims !! c)),show (gridHeight (dims !! c))] | c<-cases])]
      inc "c_relation_candidates" (srCandidates res)
      inc "c_relation_tried" (srTried res)
      inc "c_relation_executions" (srExecutions res)
      inc "operator_applications" (srExecutions res)
      when (srTruncated res) (inc "c_relation_truncated" 1)
      emit [("scope",DG.jstr "LegacyRelation"),("branch_id",DG.jstr "legacy"),("event",DG.jstr "completed"),("attempted",show (srTried res)),("evaluated",show (srExecutions res)),("param_fit_count",show (length (srFits res)))
        ,("budget_kind",DG.jstr "relation-cases-or-representatives"),("budget_limit",show (scRelationBudget sc)),("budget_used",show (srExecutions res)),("hit",if srTruncated res then "true" else "false")
        ,("stop_reason",DG.jstr (if srTruncated res then "BudgetCut" else if null (srFits res) then "NoFitYet" else "FoundFit")),("exhaustiveness",DG.jstr (if srTruncated res then "ProvenNotExhausted" else "Unknown")),("exhaustiveness_evidence",DG.jstr "enumerateTransforms caps grammar before searchTransforms; no full universe certificate")]
      traceMsg ("relation search: "++summary++", "++show (length (srFits res))++" training-exact transformations")
      case srFits res of
        []->if sdEnabled (stageD conf) then unifiedPath prior else pure (failWith ("no executable object transformation fits ("++summary++")"))
        fits@((t,emitted):_)->do
          let outsOf c=O.objects (snd (scenes !! c))
              ws=[relationWitness (O.objects (fst (scenes !! c))) em (outsOf c) | (c,em)<-zip cases emitted]
              countExact=and [length em==length (outsOf c) | (c,em)<-zip cases emitted]
              transformExact=and [null (rwUnexplainedOutputs w) && rwUnmatchedEmitted w==0 | w<-ws]
              p=(mkProgram (Inline (Definition scanKey (Body (Lit 0,Lit 0) (Lit 0,Lit 0)) True)) M.empty M.empty) {progTransform=Just t}
          inc "c_relation_fits" (length fits)
          setMetric "c_relation_selected_cost" (transformCost t)
          when countExact (setMetric "c_object_count_exact" 1)
          when transformExact (setMetric "c_object_transform_exact" 1)
          when (usesShape t) (inc "c_relation_shape_used" 1)
          onGraph (\g->g {relations=[RelationRecord (transformText t') (transformCost t') (transformConstants t') (usesShape t') (t'==t) [witnessText w | w<-ws, t'==t] | (t',_)<-fits]})
          let nodes=[RNode (tag c++"object-transform") "ObjectTransform" [PConcept (transformText t)] ["set:Input","canvas:SizeRule"] "realization" | c<-cases]
          addNodes nodes
          mapM_ (addResult . rnId) nodes
          addFeature (Feature (ConceptT (SetT ExistsPlacedT)) (map (show . length) emitted) ("ObjectTransform: "++transformText t)
            (["Set[Object] -> Set[Object] transformation (NeedConstruct trigger: "++why++")"
             ,show (length fits)++" training-exact transformations survive as representatives; selected by (structural cost, enumeration order)"
             ,"shared constants: "++show (transformConstants t),if usesShape t then "uses the Shape algebra" else "no Shape primitive"
             ,"whole-grid exact on every training case; object-count exact: "++show countExact++"; object-transform exact: "++show transformExact]++map witnessText ws)
            (Just NeedConstruct) (transformCost t) Frozen)
          traceMsg ("ObjectTransform selected: "++transformText t++" (cost "++show (transformCost t)++", "++show (length fits)++" representatives)")
          work<-currentWork
          setMetric "first_solution_work" (relationStartWork+maybe (srExecutions res) id (srFirstExecutions res))
          if all (\(x,y)->runProgram p x==Right y) examples then pure (Right p) else pure (failWith "selected transformation diverged on re-execution")

    unifiedPath :: Maybe String -> Search (Either String Program)
    unifiedPath prior=do
      traceMsg "NeedConstruct: legacy relation universe exhausted; Stage D parameter holes and bounded compositions unlocked"
      before<-currentWork
      let cs=[DCase a (dims!!i) target (O.objects b) | (i,((a,b),(_,target)))<-zip [0..] (zip scenes examples)]
          result=searchUnified (stageD conf) cs
      mapM_ (uncurry inc) (M.toList (drMetrics result))
      inc "operator_applications" (M.findWithDefault 0 "d_total_work" (drMetrics result))
      onGraph (\g->g {dGoals=drGoals result})
      mapM_ traceMsg (drTrace result)
      case drFits result of
        []->pure (Left ((maybe "relation: " (++"; ") prior)++"composition: no fit in bounded Stage D universe; consult d_* truncation states"))
        t:_->do
          let p=(mkProgram (Inline (Definition scanKey (Body (Lit 0,Lit 0) (Lit 0,Lit 0)) True)) M.empty M.empty) {progTransform=Just t}
              witnesses=[executePipeline t (O.canvas (dInput c)) (dOutputDims c) (O.objects (dInput c)) | c<-cs]
          onGraph (\g->g {relations=relations g++[RelationRecord (transformText t) (transformCost t) (transformConstants t) (usesShape t) True (map show witnesses)]})
          addFeature (Feature (ConceptT (SetT ExistsPlacedT)) (map (show . fmap (length . pwEmitted)) witnesses) (transformText t)
            ["typed A parameters; bounded C composition; B parameter snapshots when enabled","whole-grid forward exact; witnesses checked independently"] (Just NeedConstruct) (transformCost t) Frozen)
          setMetric "first_solution_work" (before+M.findWithDefault 0 "d_first_exact_work" (drMetrics result))
          if all (\(x,y)->runProgram p x==Right y) examples then pure (Right p)
            else pure (Left "composition: selected typed program failed runProgram replay")

    -- Stage A grid size: GridWidth/GridHeight/GridSize are typed features of
    -- the input; the output size is a training target only. The synthesized
    -- rule is recorded with its representatives, bindings and work.
    sizeStep :: Search (Either String ())
    sizeStep=case sizeOutcome of
      Nothing->pure (Right ())
      Just (res,stats)->do
        let ws=[gridWidth (O.canvas x) | (x,_)<-scenes]; hs=[gridHeight (O.canvas x) | (x,_)<-scenes]
            ows=[gridWidth (O.canvas y) | (_,y)<-scenes]; ohs=[gridHeight (O.canvas y) | (_,y)<-scenes]
            w=ssWidth stats; h=ssHeight stats
        mapM_ addFeature
          [Feature NatPosT (map show ws) "GridWidth(Input)" ["Grid -> NatPos","input-side feature"] (Just NeedCanvas) 1 Frozen
          ,Feature NatPosT (map show hs) "GridHeight(Input)" ["Grid -> NatPos","input-side feature"] (Just NeedCanvas) 1 Frozen
          ,Feature Size2T (map show (zip ws hs)) "GridSize(Input)" ["Grid -> Size2 = (NatPos,NatPos) in (width,height) order"] (Just NeedCanvas) 1 Frozen
          ,Feature Size2T (map show (zip ows ohs)) "GridSize(Output)" ["ground-truth target during training; never an input of the program"] (Just NeedCanvas) 0 (if isRight res then Matched else Unmatched)]
        inc "size_rule_templates" (trTemplatesTried w+trTemplatesTried h)
        inc "size_rule_evaluations" (trEvaluations w+trEvaluations h)
        inc "operator_applications" (trEvaluations w+trEvaluations h)
        inc "size_rule_candidates" (length (trFits w)+length (trFits h))
        inc "size_rule_truncations" (length [() | trTruncated w]+length [() | trTruncated h])
        forM_ [("width",w),("height",h)] $ \(axis,r)->emit
          [("scope",DG.jstr "SizeRule"),("branch_id",DG.jstr ("size."++axis)),("parent_id",DG.jstr "size"),("goal_type",DG.jstr "NatPos"),("event",DG.jstr "completed")
          ,("attempted",show (trTemplatesTried r)),("evaluated",show (trEvaluations r)),("param_fit_count",show (length (trFits r)))
          ,("param_depth",show (saHoleDepth sa)),("max_fit_depth",show (maximum (0:map (tDepth . cExpr) (trFits r))))
          ,("budget_kind",DG.jstr "size-row-probes-per-axis-per-round"),("budget_limit",show (saHoleBudget sa)),("budget_used",show (trEvaluations r)),("hit",if trTruncated r then "true" else "false")
          ,("stop_reason",DG.jstr (if trTruncated r then "BudgetCut" else if null (trFits r) then "NoFitYet" else "FoundFit")),("exhaustiveness",DG.jstr "Unknown")]
        forM_ [("width",w,fst (ssObjectRound stats),ows),("height",h,snd (ssObjectRound stats),ohs)] $ \(axis,r,second,targets)->traceS DG.levelBranches
          [("scope",DG.jstr "SizeRule"),("kind",DG.jstr "representatives"),("stage",DG.jstr "size_rule"),("branch_id",DG.jstr ("size."++axis)),("parent_branch_id",DG.jstr "size")
          ,("input_features",DG.jstr "GridWidth/GridHeight/object counts of the INPUT; output size is a training target only"),("training_targets",show targets)
          ,("object_leaf_round",DG.jobj [("enabled",DG.jbool (scObjectSizeFeatures sc)),("triggered",DG.jbool second)
             ,("why",DG.jstr (if not (scObjectSizeFeatures sc) then "object size leaves disabled in this configuration" else if second then "base grid leaves had no training-exact fit on this axis" else "base grid leaves already fit; demand-driven second round not opened"))])
          ,("templates_tried",show (trTemplatesTried r)),("evaluations",show (trEvaluations r)),("truncated",DG.jbool (trTruncated r))
          ,("representatives",DG.jarr [DG.jobj [("expr",exprJSON (\l->[("leaf",DG.jstr (gridFeatureName l))]) (cExpr cand)),("text",DG.jstr (renderT gridFeatureName (cExpr cand))),("cost",show (cCost cand))
              ,("bindings",DG.jarr (map (DG.jstr . bindingText) (cBindings cand))),("denotation",DG.jarr [case v of VI n->show n; VB b->DG.jbool b | v<-cDenotation cand])
              ,("case_relative_class",DG.jstr (DG.stableHash (show (cDenotation cand))))] | cand<-trFits r])]
        traceMsg ("size rule ("++(if ssFixedGrammar stats then "fixed templates" else "typed holes")++"): width "++show (length (trFits w))++" representatives, height "++show (length (trFits h))++" representatives, "++show (trEvaluations w+trEvaluations h)++" evaluations")
        case res of
          Left err->do traceMsg ("size: "++err); pure (Left ("size: "++err))
          Right r->do
            setMetric "size_rule_exact" 1
            when (any (\(a,b)->O.canvas a/=O.canvas b) scenes) (inc "canvas_changes_entering_search" 1)
            addFeature (Feature Size2T (map show [(gridWidth d,gridHeight d) | d<-dims]) (sizeRuleText r) (srWitness r) (Just NeedCanvas) (tCost (srWidth r)+tCost (srHeight r)) Frozen)
            traceMsg ("SizeRule "++sizeRuleText r)
            pure (Right ())

    -- Deliberate ablations that pair items without an alignment explanation.
    prePath :: Search (Either String (Maybe Program))
    prePath
      | mode==DirectSetIndexing = do
          let ps=[runtimePairs (O.objects x) (O.objects y) | (x,y)<-scenes]
          traceMsg "DirectSetIndexing: raw encoder enumeration; deliberate unsafe ablation"
          onGraph (\g->g {highEdges=highEdges g++[ConcreteEdge (show a) (show b) | (a,b)<-concat ps]})
          r<-realize [] (scanKey,scanKey) ps [] True
          pure (fmap Just r)
      | mode==NoAlignmentExplanation = do
          let greedy xs ys=go (map placedFromObject xs) (map placedFromObject ys) 0
                where go [] _ n=(Just [],n)
                      go (a:as) outs n=case break (\b->observeColor a/=Nothing && observeColor a==observeColor b) outs of
                        (_,[])->(Nothing,n+length outs)
                        (before,b:after)->let (rest,n')=go as (before++after) (n+length before+1) in (fmap ((a,b):) rest,n')
              attempts=[greedy (O.objects x) (O.objects y) | (x,y)<-scenes]
          inc "equality_attempts" (sum (map snd attempts))
          inc "operator_applications" (sum (map snd attempts))
          case traverse fst attempts of
            Nothing->do traceMsg "NoAlignmentExplanation: Cartesian Color equality found no total pairing; explained search follows"; pure (Right Nothing)
            Just ps->do
              inc "unexplained_equalities" (length (concat ps))
              onGraph (\g->g {highEdges=highEdges g++[ConcreteEdge (show a) (show b) | (a,b)<-concat ps]})
              traceMsg "NoAlignmentExplanation: unaligned Cartesian Color equality admitted before explained search"
              r<-realize [] (scanKey,scanKey) ps [] True
              case r of
                Right p->pure (Right (Just p))
                Left err->do traceMsg ("unexplained pairing failed realization: "++err); pure (Right Nothing)
      | otherwise = pure (Right Nothing)

    explained :: Search (Either String Program)
    explained=do
      r1<-phase "seed" [NeedCrossItemAlignment]
      case r1 of
        Right p->pure (Right p)
        Left why1
          | mode==FixedAlignmentKeys->pure (Left (why1++"; FixedAlignmentKeys: key synthesis disabled"))
          | otherwise->do
              inc "alignment_failure_triggers" 1
              traceMsg "AlignmentFailure: seed ontology exhausted; synthesized key grammar unlocked under NeedCrossItemAlignment"
              r2<-phase "synthesized" [NeedCrossItemAlignment,AlignmentFailure]
              pure (either (\w->Left (if w==defaultWhy then why1 else w)) Right r2)

    -- Trigger before expansion: keys exist only under an ordering trigger.
    phase :: String -> [Trigger] -> Search (Either String Program)
    phase name triggers=do
      let keys=visibleKeyGrammar (KeyContext triggers (mode==FixedAlignmentKeys) (synthesisDepth conf) (synthesisCostBound conf))
      setMax "visibility_keys" (length keys)
      traceMsg ("phase "++name++": "++show (length keys)++" visible keys")
      legalIn<-filterM (legalKey name keys InputSet) keys
      legalOut<-filterM (legalKey name keys OutputSet) keys
      tried<-gets stTried
      used<-gets (metric "alignment_key_candidates" . stGraph)
      let pairs=sortOn (\(a,b)->keyCost a+keyCost b) [(a,b) | a<-legalIn, b<-legalOut, not (S.member (a,b) tried)]
          budgeted=take (max 0 (alignmentBudget conf-used)) pairs
      inc "alignment_key_candidates" (length budgeted)
      when (length budgeted<length pairs) (traceMsg "alignment budget exhausted")
      emit [("scope",DG.jstr "Alignment"),("branch_id",DG.jstr name),("event",DG.jstr "candidate-prefix"),("attempted",show (length budgeted)),("remaining_frontier_count",show (length pairs-length budgeted)),("frontier_nonempty",if length pairs>length budgeted then "true" else "false"),("budget_limit",show (alignmentBudget conf)),("budget_used",show (used+length budgeted)),("hit",if length pairs>length budgeted then "true" else "false"),("stop_reason",DG.jstr (if length pairs>length budgeted then "BudgetCut" else "NoFitYet")),("exhaustiveness",DG.jstr "Unknown")]
      loop (nub (legalIn++legalOut)) budgeted defaultWhy
    legalKey :: String -> [KeyExpr] -> Origin -> KeyExpr -> Search Bool
    legalKey name keys origin key=do
      let side=if origin==InputSet then fst else snd
          results=[(c,orderBy keys NeedCrossItemAlignment origin key (side (sets !! c))) | c<-cases]
      inc "operator_applications" ncases
      case [e | (_,Left e)<-results] of
        (e:_)->do
          when (take 10 e=="non-unique") (inc "ordering_ties_rejected" 1)
          onGraph (\g->g {keyCandidates=keyCandidates g++[KeyCandidate key origin (isSeedKey key) name ("rejected: "++e) (keyCost key)]})
          pure False
        []->do
          modify (\s->s {stViews=foldr (\(c,r)->either (const id) (M.insert (key,origin,c)) r) (stViews s) results})
          unless (isSeedKey key) (inc "synthesized_keys_accepted" 1)
          onGraph (\g->g {keyCandidates=keyCandidates g++[KeyCandidate key origin (isSeedKey key) name "strict ordering on every case" (keyCost key)]})
          pure True
    loop :: [KeyExpr] -> [(KeyExpr,KeyExpr)] -> String -> Search (Either String Program)
    loop _ [] why=pure (Left why)
    loop keys ((kIn,kOut):rest) why=do
      modify (\s->s {stTried=S.insert (kIn,kOut) (stTried s), stDerivation=[], stResults=[], stCF=[], stPending=[], stGrammarFits=M.empty})
      inc "alignment_attempts" 1
      setMetric "alignment_candidates_remaining" (length rest)
      aligned<-alignAttempt kIn kOut (length rest)
      case aligned of
        Left err->do
          emit [("scope",DG.jstr "Alignment"),("branch_id",DG.jstr (DG.stableHash (show (kIn,kOut)))),("parent_id",DG.jstr "alignment"),("stop_reason",DG.jstr "InvalidPrecondition"),("reason",DG.jstr err)]
          inc "alignment_rejections" 1
          loop keys rest ("alignment: "++err)
        Right (ws,resultIds)->do
          onGraph (\g->g {alignmentEvidence=alignmentEvidence g++[ws]})
          inc "alignment_witnesses" (length ws)
          let ps=map alignmentPairs ws
              admitted=and [legalComparison InputSet OutputSet (Just w) a b | w<-ws, (a,b)<-alignmentPairs w]
          if not admitted then loop keys rest "alignment witness rejection" else do
            ok<-validateColor ps resultIds
            if not ok then do
              inc "alignment_rejections" 1
              loop keys rest (if why==defaultWhy then "alignment validation: aligned Color observer differs" else why)
            else do
              r<-realize keys (kIn,kOut) ps ws False
              case r of
                Right p->pure (Right p)
                Left err->loop keys rest err
    -- One explained alignment attempt. After promotion, the per-case
    -- order/order/align chain is a single Call(I_k) node (reuse). The reused
    -- witnesses are the same rankAlign results as the expanded path would
    -- produce, which is verified and counted (no key pair or witness is lost).
    alignAttempt :: KeyExpr -> KeyExpr -> Int -> Search (Either String ([Alignment],[String]))
    alignAttempt kIn kOut remaining=do
      views<-gets stViews
      inc "operator_applications" ncases
      case traverse (\c->rankAlign (views M.! (kIn,InputSet,c)) (views M.! (kOut,OutputSet,c))) cases of
        Left e->pure (Left e)
        Right ws->do
          ops<-visible "RankCorrespondence"
          ids<-case ops of
            (ab:_)->do
              step<-tick
              let node=RNode ("call:"++absName ab++":"++show step) "Call" [PAbs (absName ab),PConcept (show kIn),PConcept (show kOut)]
                         ["set:Input","set:Output","abstraction:"++absName ab] "alignment"
                  expanded=[(c,rankAlign (views M.! (kIn,InputSet,c)) (views M.! (kOut,OutputSet,c))) | c<-cases]
                  verified=and [Right w==r | (w,(_,r))<-zip ws expanded]
              reuse ab step (3*ncases-1) [node]
              if verified then inc "rank_reuse_witnesses_verified" ncases
                else traceMsg "RankCorrespondence reuse diverged from expansion (should be impossible)"
              pure (replicate ncases (rnId node))
            []->do
              let instances=[(tag c,alignmentNodes (tag c) kIn kOut) | c<-cases]
              addNodes (concatMap snd instances)
              propose "RankCorrespondence" instances remaining
                ("RankCorrespondence(kIn,kOut): order both sets by visible keys, align equal ranks; explained correspondence, no object identity"
                ,["Set[exists sigma.Placed[sigma]] (Input)","Set[exists sigma.Placed[sigma]] (Output)"],"Alignment[Input,Output,n]"
                ,[("kIn","Concept KeyExpr"),("kOut","Concept KeyExpr")],["alignment"]
                ,["strict ordering on every case for both keys","equal cardinality per case"],Nothing)
              pure [tag c++"rank-align" | c<-cases]
          pure (Right (ws,ids))
    validateColor :: [[(Placed,Placed)]] -> [String] -> Search Bool
    validateColor ps resultIds=do
      let flat=concat ps
          ok=all (\(a,b)->observeColor a/=Nothing && observeColor a==observeColor b) flat
      inc "operator_applications" (length flat)
      let nodes=[RNode (tag c++"validate-color") "Compare" [PRef "Color"] [r] "alignment" | (c,r)<-zip cases resultIds]
      addNodes nodes
      when ok (mapM_ (addResult . rnId) nodes)
      pure ok

    -- Online proposal: anti-unify the per-case instances, score the utility,
    -- promote into VisibleOps when it reaches the threshold.
    propose :: String -> [(String,[RNode])] -> Int -> (String,[String],String,[(String,String)],[String],[String],Maybe AbsDef) -> Search ()
    propose family instances remaining (contract,inputs,output,params,slice,witness,mdef)=when online $ do
      inc "online_abstractions_proposed" 1
      step<-tick
      case antiUnify instances of
        Left why->traceMsg ("abstraction rejected ("++family++"): "++why)
        Right (pattern,_)->do
          let u=utility (promotionThreshold conf) remaining (length instances) pattern params
          n<-gets stNextAbs
          let name="I_"++show n
              ab=Abstraction name family contract inputs output params pattern
                   (nub [d | node<-pattern, d<-rnDeps node, take 12 d=="abstraction:"]) slice witness
                   ["anti-unified from "++show (length instances)++" per-case instances","typed parametrization of Concept/Constant parameters"]
                   (length pattern) (1+length params) u step (if uAccepted u then step else -1) Nothing 0 0 mdef
          onGraph (\g->g {abstractions=abstractions g++[ab]})
          if uAccepted u then do
            modify (\s->s {stNextAbs=n+1, stLibrary=maybe id (M.insert name) mdef (stLibrary s)})
            inc "online_abstractions_accepted" 1
            traceMsg ("promote "++name++" ("++family++") utility="++show (uTotal u)++" at step "++show step)
          else traceMsg ("proposal "++family++" below threshold: utility="++show (uTotal u))
    reuse :: Abstraction -> Int -> Int -> [RNode] -> Search ()
    reuse ab step saved nodes=do
      addNodes nodes
      inc "online_abstraction_reuses" 1
      inc "refinement_expansions_saved" saved
      onGraph (\g->g {abstractions=[if absName a==absName ab then a {absReuseCount=absReuseCount a+1, absSaved=absSaved a+saved
        , absFirstReuseStep=Just (fromMaybe step (absFirstReuseStep a))} else a | a<-abstractions g]})
      traceMsg ("reuse "++absName ab++" at step "++show step++" saved "++show saved++" refinement expansions")

    -- Realization: indexed equality, lift, NeedConstruct, counterfactual
    -- contexts, slot fitting with semantic classes, exact whole-grid check.
    -- Under SafeReuse a failed realization first resumes the deferred
    -- candidates of this alignment before the alignment is abandoned.
    realize :: [KeyExpr] -> (KeyExpr,KeyExpr) -> [[(Placed,Placed)]] -> [Alignment] -> Bool -> Search (Either String Program)
    realize keys expr ps ws unsafe=do
      let flat=concat ps
          comparisons=map (uncurry (objectEqual dep)) flat
          shapeOK=all (==Right True) comparisons
      inc "equality_attempts" (length flat)
      inc "operator_applications" (length flat)
      inc "rejected_size_comparisons" (length [() | Left _<-comparisons])
      abstractMatches keys expr ps ws unsafe
      unless shapeOK $ do
        inc "construction_triggers" 1
        addFeature (Feature (ConceptT (SetT ExistsPlacedT)) (map (show . map (placedSig . fst)) ps)
          "PreserveInputGeometry(AlignedRef); validate via Render" ["unresolved indexed geometry","full output witness"] (Just NeedConstruct) 1 Unmatched)
        let nodes=[RNode (tag c++"construct") "PreserveInputGeometry" [PRef "AlignedRef"] [] "realization" | c<-cases]
        addNodes nodes
        mapM_ (addResult . rnId) nodes
        traceMsg "NeedConstruct: preserved indexed geometry; defer validation to full scene"
      cfs<-forM cases $ \c->do
        let (legal,illegal)=counterfactualContexts (if unsafe then scanKey else fst expr) c (dims !! c) (inSet c)
        onGraph (\g->g {counterfactuals=counterfactuals g++map fst legal, rejectedCounterfactuals=rejectedCounterfactuals g++illegal})
        inc "counterfactual_contexts_generated" (length legal)
        inc "counterfactual_contexts_rejected" (length illegal)
        pure [(c,f) | (_,f)<-legal]
      modify (\s->s {stCF=concat cfs})
      slotsR<-fitBody ps
      let inlineOf m lib=mkProgram (Inline (Definition (fst expr) (bodyFrom m) unsafe)) M.empty lib
          outcomes m lib=[runProgram (inlineOf m lib) x | (x,_)<-examples]
          exact m lib=and [r==Right y | (r,(_,y))<-zip (outcomes m lib) examples]
      lib<-gets stLibrary
      -- Grid realization is reported separately from whole-grid exactness: a
      -- render failure (cell outside the realized canvas, invalid size) is not
      -- the same failure as a rendered grid that differs from the target.
      attempt<-case slotsR of
            Left err->pure (Left err)
            Right m->do
              inc "grid_realizations_attempted" 1
              let rs=outcomes m lib
                  errs=[e | Left e<-rs]
                  mism=length [() | (Right g,(_,y))<-zip rs examples, g/=y]
              inc "realization_render_errors" (length errs)
              inc "realization_mismatches" mism
              emit [("scope",DG.jstr "Render"),("branch_id",DG.jstr (DG.stableHash (show expr))),("parent_id",DG.jstr "alignment"),("render_attempts",show (length rs)),("render_mismatches",show mism),("invalid_domain",show (length errs)),("stop_reason",DG.jstr (if exact m lib then "FoundFit" else "NoFitYet"))]
              when (null errs) (inc "grid_realization_ok" 1)
              pure (if exact m lib then Right m else Left (case errs of
                (e:_)->"realization: output realization failed: "++e
                []->"realization: final grid exact check failed"))
      case attempt of
        Right m->finalize (fst expr) m unsafe ps
        Left err->do
          pending<-gets stPending
          if safe && not (null pending) then do
            inc "resume_retries" 1
            traceMsg ("realization failed ("++err++"); resuming deferred candidates of this alignment before abandoning it")
            alt<-resumeDeferred "realization failure"
            lib'<-gets stLibrary
            case slotsR of
              Right m | exact (M.union alt m) lib'->finalize (fst expr) (M.union alt m) unsafe ps
              _->pure (Left err)
          else pure (Left err)
    abstractMatches :: [KeyExpr] -> (KeyExpr,KeyExpr) -> [[(Placed,Placed)]] -> [Alignment] -> Bool -> Search ()
    abstractMatches keys expr ps ws unsafe
      | unsafe = traceMsg "runtime enumeration is not an alignment explanation"
      | otherwise = do
          inc "alignment_lift_attempts" 1
          case alignmentLift keys sets ps of
            Left err->traceMsg err
            Right lifted->do
              inc "alignment_lift_successes" 1
              traceMsg ("AlignmentLift "++show lifted)
              let exprText="RankAlign(OrderBy("++show (fst expr)++",InputSet),OrderBy("++show (snd expr)++",OutputSet))"
              onGraph (\g->g {highEdges=highEdges g++[AbstractEdge ("Rank(Input,"++show expr++",i).Color") ("Rank(Output,"++show expr++",i).Color")]})
              mapM_ addFeature $
                [Feature (AlignmentT (map length ps)) (map (show . map (\(a,b)->(placedPos a,placedPos b))) ps) exprText
                   ["rank witness before comparison",show expr] (Just NeedCrossItemAlignment) 3 Frozen
                ,Feature (RefT ExistsPlacedT) (map (show . map (\(a,b)->(placedSig a,placedPos a,placedSig b,placedPos b))) ps) ("Rank("++exprText++",i)")
                   [exprText,"forall i:Fin(Count(S))"] (Just NeedUniqueRef) 1 Frozen]
                ++[Feature (OrderedT key (map cardinality vs)) (map (show . map placedPos . orderedItems) vs) ("OrderBy("++show key++","++show origin++")")
                   [show origin,"unique key; no implicit ties",if isSeedKey key then "seed key" else "synthesized key"] (Just NeedCrossItemAlignment) (keyCost key) Frozen
                  | (key,origin,vs)<-[(fst expr,InputSet,map alignmentLeft ws),(snd expr,OutputSet,map alignmentRight ws)]]

    -- Sequence-local body: per axis one shared expression, else First/Following.
    -- The result is a slot map so that resumed slots can be substituted.
    bodyFrom :: M.Map String Scalar -> Body
    bodyFrom m=Body (pick "shared-AX" "first-AX",pick "shared-AY" "first-AY") (pick "shared-AX" "following-AX",pick "shared-AY" "following-AY")
      where pick shared split=fromMaybe (M.findWithDefault (Lit 0) split m) (M.lookup shared m)
    fitBody :: [[(Placed,Placed)]] -> Search (Either String (M.Map String Scalar))
    fitBody ps=do
      let rowsFor axis=[Row c i (Ctx (dims !! c) (inSet c) x prev dep (inDims !! c)) (obsPos axis y)
                       | (c,pairs)<-zip cases ps, (i,(x,y))<-zip [0..] pairs
                       , let prev=if i==0 then Nothing else let (pin,pout)=pairs !! (i-1) in Just pin {placedPos=placedPos pout}]
          -- Trigger before expansion: the typed hole search of an axis opens
          -- only after the whole v0.6.1 grammar path of that axis has failed,
          -- so every v0.6.1 solution is reproduced unchanged.
          axisFit axis remainingAfter=do
            r<-axisPass Grammar axis remainingAfter
            r'<-case r of
              Left e | sbGraph sb->do
               spentB<-gets (\s->metric "b_row_lookups" (stGraph s)+metric "b_flat_row_evaluations" (stGraph s))
               if spentB>=sbTotalBudget sb then do
                 inc "b_global_truncations" 1
                 traceMsg ("ScalarFailure on axis "++show axis++": referent hierarchy not opened (run budget "++show (sbTotalBudget sb)++" exhausted)")
                 pure r
               else do
                -- Stage B: the referent hierarchy of the axis opens on the
                -- same ScalarFailure trigger, before the typed hole search
                inc "b_hierarchy_slots" 1
                traceMsg ("ScalarFailure on axis "++show axis++" ("++e++"): referent hierarchy ("++show (sbSchedule sb)++") unlocked under NeedTransform")
                rh<-axisPass Hierarchy axis remainingAfter
                case rh of
                  Right x->do inc "b_hierarchy_solved_slots" 1; pure (Right x)
                  Left eh->do inc "b_hierarchy_fallbacks" 1; traceMsg ("hierarchy found no fit on axis "++show axis++" ("++eh++"); concrete typed-hole layer follows"); pure (Left e)
              _->pure r
            case r' of
              Right x->pure (Right x)
              Left e | saTypedHoles sa->do
               spent<-gets (metric "typed_hole_evaluations" . stGraph)
               if spent>=saTotalHoleBudget sa then do
                 inc "typed_hole_global_truncations" 1
                 traceMsg ("ScalarFailure on axis "++show axis++": typed hole search not opened (global typed budget "++show (saTotalHoleBudget sa)++" exhausted)")
                 pure (Left (e++"; typed hole search skipped: global typed budget exhausted"))
               else do
                inc "typed_hole_slots_triggered" 1
                traceMsg ("ScalarFailure on axis "++show axis++" ("++e++"): typed N-ary hole search unlocked under NeedTransform")
                r2<-axisPass TypedHoles axis remainingAfter
                pure (either (\e2->Left (e++"; "++e2)) Right r2)
                     | otherwise->pure (Left e)
          axisPass src axis remainingAfter=do
            let rs=rowsFor axis
            shared<-fitSlot src ("shared-"++show axis) rs remainingAfter
            case shared of
              Right e->pure (Right [("shared-"++show axis,e)])
              Left _->do
                f<-fitSlot src ("first-"++show axis) (filter ((==0) . rowRank) rs) (remainingAfter+1)
                n<-fitSlot src ("following-"++show axis) (filter ((>0) . rowRank) rs) remainingAfter
                pure ((\a b->[("first-"++show axis,a),("following-"++show axis,b)]) <$> f <*> n)
      xr<-axisFit AX 1
      case xr of
        Left e->pure (Left e)
        Right xs->do
          yr<-axisFit AY 0
          pure (fmap (\ys->M.fromList (xs++ys)) yr)
    -- Call(I_k) is admitted only through the same checks as any candidate:
    -- family/contract, output type, ontology slice, arity, and the same rows.
    legalCall :: Abstraction -> Bool
    legalCall ab=absFamily ab=="SequentialScalar" && absOutputType ab=="Int" && "scalar" `elem` absOntologySlice ab
      && maybe False (\d->length (absParamKinds d)==length (absFreeParams ab)) (absDef ab)
    fitSlot :: Source -> String -> [Row] -> Int -> Search (Either String Scalar)
    -- Stage B hierarchy: the slot rows are looked up in the frozen snapshot
    -- of the axis (one check per agreement class under the schedule; every
    -- member of a fitting class fits because the rows are grounded contexts).
    -- NoHierarchy evaluates the same universe candidate by candidate.
    fitSlot Hierarchy name rows' _=do
      let slotAxis=axisOf name
      lib<-gets stLibrary
      cfs<-gets stCF
      prior<-gets (M.findWithDefault [] name . stGrammarFits)
      if null rows' then do traceMsg (name++": no rows; trivially satisfied"); pure (Right (Lit 0)) else do
        -- Stage C4: demand-driven depth. The depth-1 universe is searched first;
        -- the full-depth universe is built only when no class of it fits.
        let fullDepth=sbGraphDepth sb
            levels | scGoalDirected sc && fullDepth>1 = [1,fullDepth]
                   | otherwise = [fullDepth]
            lookupKeys g=sequence [M.lookup (contextId (rowCase r) (ctxCurrent (rowCtx r))) (contextIndex g) | r<-rows']
            searchIn g ks | sbHierarchy sb = searchClasses sb g (zip ks (map (VI . rowTarget) rows'))
                          | otherwise = searchFlat sb g [(evalSlotLeaf lib (rowCtx r),VI (rowTarget r)) | r<-rows']
            account search=do
              inc "operator_applications" (csRowLookups search+csRowEvaluations search)
              inc "b_class_checks" (csClassChecks search)
              inc "b_row_lookups" (csRowLookups search)
              inc "b_flat_row_evaluations" (csRowEvaluations search)
              inc "b_candidates_covered" (csCandidatesCovered search)
              inc "b_fitting_classes" (csFittingClasses search)
              inc "b_layer_exposed" (sum (M.elems (csLayerExposed search)))
              inc "b_layer_searched" (sum (M.elems (csLayerSearched search)))
              inc "b_layer_truncated" (sum (M.elems (csLayerTruncated search)))
              when (csTruncated search) (inc "b_slot_truncations" 1)
            go [] _=pure Nothing
            go (d:ds) _=do
              g<-ensureSnapshot slotAxis d
              case lookupKeys g of
                Nothing->pure Nothing
                Just ks->do
                  let search=searchIn g ks
                  account search
                  if not (null (csFits search)) then do
                    when (scGoalDirected sc && d<fullDepth) (inc "b_goal_level1_hits" 1)
                    pure (Just (g,search))
                  else case ds of
                    []->pure (Just (g,search))
                    _->do inc "b_goal_level2_builds" 1; traceMsg (name++": goal-directed depth "++show d++" universe has no fitting class; extending to depth "++show (head ds)); go ds ()
        found<-go levels ()
        case found of
          Nothing->do traceMsg (name++": hierarchy: a row context is not a grounded snapshot context"); pure (Left ("hierarchy: row context not grounded for "++name))
          Just (g,search)->do
            let terms=[(i,rfTerm (rgNodes g M.! i)) | i<-csFits search]
                typed=[(i,Typed e) | (i,t)<-terms, Just e<-[lambdaToTyped t]]
                typedFits=map snd typed
                fits=prior++[f | f<-typedFits, f `notElem` prior]
            traceMsg (name++": hierarchy "++(if sbHierarchy sb then show (sbSchedule sb) else "flat")++": "++show (csClassChecks search)++" class checks, "++show (csFittingClasses search)++" fitting classes, "
              ++show (csRowLookups search)++" row lookups, "++show (csRowEvaluations search)++" row evaluations, "++show (length typedFits)++" candidates"++(if csTruncated search then " (budget truncated)" else "")
              ++"; layers exposed/searched/truncated "++show (M.toList (csLayerExposed search))++"/"++show (M.toList (csLayerSearched search))++"/"++show (M.toList (csLayerTruncated search)))
            if null fits then pure (Left ("feature transformation: no uniform "++name++" expression in the referent hierarchy ("++show (csClassChecks search)++" class checks)")) else do
              let (cls,evals)=buildClass pol lib name slotAxis rows' cfs fits
              recordClass cls evals
              inc "b_hierarchy_fits" (length typedFits)
              let e=scSelected cls
                  node=case [i | (i,f)<-typed, f==e] of (i:_)->Just i; []->Nothing
                  witness=case node of
                    Just i->let c=rgClassOf g M.! i in
                      ["referent node #"++show i++", class #"++show c++" of "++show (length (rgClasses g M.! c))++" members, generality "++show (M.findWithDefault 0 i (rgGenerality g))++", schedule "++show (sbSchedule sb)]
                      ++["edge "++edgeText slotLeafName ed | ed<-take 4 [ed | ed<-rgEdges g, eStatus ed==Confirmed, eFrom ed==i || eTo ed==i]]
                    Nothing->["selected representative comes from the scalar grammar"]
                  instances=[(tag c++name++":hier:",scalarNodes (tag c++name++":hier:") e) | c<-cases]
              addNodes (concatMap snd instances)
              mapM_ (\c->addResult (tag c++name++":hier:r")) cases
              addFeature (Feature (ScalarT name) (map (show . rowTarget) rows') (show e)
                (["referent hierarchy (ScalarFailure trigger)","semantic class of "++show (length (scReps cls))++" representatives",intensionality e]++witness) (Just NeedTransform) (scalarLength e) Frozen)
              pure (Right e)
    -- Typed N-ary hole search over the slot's visible leaves (the slot axis
    -- plus axis-free aggregates and the input grid dimension). The grammar
    -- fits recorded for this slot stay in the class next to the typed ones:
    -- constants and input-dependent expressions coexist as representatives.
    fitSlot TypedHoles name rows' _=do
      let slotAxis=axisOf name
      lib<-gets stLibrary
      cfs<-gets stCF
      prior<-gets (M.findWithDefault [] name . stGrammarFits)
      if null rows' then do traceMsg (name++": no rows; trivially satisfied"); pure (Right (Lit 0)) else do
        let hc=holeCfg
            tr=synthesizeTyped hc slotLeafName (slotTemplates slotAxis) [(evalSlotLeaf lib (rowCtx r),VI (rowTarget r)) | r<-rows']
            typedFits=map (Typed . cExpr) (trFits tr)
            fits=prior++typedFits
        inc "operator_applications" (trEvaluations tr)
        inc "typed_hole_templates" (trTemplatesTried tr)
        inc "typed_hole_evaluations" (trEvaluations tr)
        inc "typed_hole_fits" (length typedFits)
        inc "typed_hole_constant_fits" (trConstantFits tr)
        inc "typed_hole_feature_fits" (trFeatureOnlyFits tr)
        when (trTruncated tr) (inc "typed_hole_truncations" 1)
        traceMsg (name++": typed holes: "++show (trTemplatesTried tr)++"/"++show (trTemplates tr)++" templates, "++show (trEvaluations tr)++" evaluations, "++show (length typedFits)++" fits"++(if trTruncated tr then " (budget truncated)" else ""))
        emit [("scope",DG.jstr "TypedParameter"),("branch_id",DG.jstr (DG.stableHash (name++show (trTemplatesTried tr)))),("parent_id",DG.jstr "alignment"),("goal_type",DG.jstr name),("attempted",show (trTemplatesTried tr)),("evaluated",show (trEvaluations tr)),("param_fit_count",show (length typedFits)),("budget_limit",show (hcBudget hc)),("budget_used",show (trEvaluations tr)),("hit",if trTruncated tr then "true" else "false"),("stop_reason",DG.jstr (if trTruncated tr then "BudgetCut" else if null typedFits then "NoFitYet" else "FoundFit")),("exhaustiveness",DG.jstr "Unknown")]
        if null fits then pure (Left ("feature transformation: no uniform "++name++" expression after typed hole search ("++show (trTemplatesTried tr)++" templates)")) else do
          let (cls,evals)=buildClass pol lib name slotAxis rows' cfs fits
          recordClass cls evals
          let e=scSelected cls
              bindings=case [c | c<-trFits tr, Typed (cExpr c)==e] of
                (c:_)->map bindingText (cBindings c)
                []->["selected representative comes from the scalar grammar"]
              instances=[(tag c++name++":typed:",scalarNodes (tag c++name++":typed:") e) | c<-cases]
          addNodes (concatMap snd instances)
          mapM_ (\c->addResult (tag c++name++":typed:r")) cases
          addFeature (Feature (ScalarT name) (map (show . rowTarget) rows') (show e)
            (["typed N-ary hole synthesis (ScalarFailure trigger)","semantic class of "++show (length (scReps cls))++" representatives",intensionality e]++bindings) (Just NeedTransform) (scalarLength e) Frozen)
          pure (Right e)
    fitSlot Grammar name rows' remaining=do
      let slotAxis=axisOf name
      step<-tick
      lib<-gets stLibrary
      cfs<-gets stCF
      ops<-visible "SequentialScalar"
      let legal=filter legalCall ops
          calls=[(ab,Call (absName ab) args) | ab<-legal, Just d<-[absDef ab], args<-argCombos (absParamKinds d)]
          (callFits,n1)=evaluateAll lib rows' (map snd calls)
      inc "call_legality_checks" (length ops)
      inc "call_legality_rejections" (length ops-length legal)
      inc "call_attempts" (length calls)
      inc "operator_applications" n1
      unless (null calls) (inc "reuse_attempts" 1)
      if null rows' then do traceMsg (name++": no rows; trivially satisfied"); pure (Right (Lit 0)) else
        if not (null callFits) then do
          inc "reuse_hits" 1
          let ab=head [a | (a,c)<-calls, c `elem` callFits]
              node=RNode (name++":call:"++show step) "Call" [PAbs (absName ab)] ["abstraction:"++absName ab,"ref:Current","ref:Previous"] "scalar"
          reuse ab step (uNodesHidden (absUtility ab)*ncases-1) [node]
          addResult (rnId node)
          let (cls,evals)=buildClass pol lib name slotAxis rows' cfs callFits
          recordClass cls evals
          addFeature (Feature (ScalarT name) (map (show . rowTarget) rows') (show (scSelected cls)) ["Call of accepted online abstraction",intensionality (scSelected cls)] (Just NeedTransform) (scalarLength (scSelected cls)) Frozen)
          -- The residual grammar is deferred, never deleted.
          let df=Deferred name (0,length grammar) (absName ab) (absPromotionStep ab) step
                   (if safe then "deferred" else "never-resumed (exclusive policy)")
                   ("preferred Call branch accepted on slot "++name++"; residual scalar grammar ["++show (length grammar)++" terms] deferred")
                   Nothing 0 (length (scReps cls)) (length (scReps cls)) (show (scSelected cls)) (show (scSelected cls)) False
          onGraph (\g->g {deferred=deferred g++[df]})
          inc "deferred_candidates" (length grammar)
          modify (\s->s {stPending=stPending s++[(name,rows',callFits)]})
          pure (Right (scSelected cls))
        else do
          let (fits,n2)=evaluateAll lib rows' grammar
          inc "operator_applications" n2
          modify (\s->s {stGrammarFits=M.insert name fits (stGrammarFits s)})
          unless (null calls) $ do
            inc "resume_events" 1
            inc "resumed_candidates" (length grammar)
            traceMsg (name++": preferred Call branch failed on the training rows; residual grammar resumed immediately")
          unless (null calls) $ onGraph (\g->g {deferred=deferred g++[Deferred name (0,length grammar) (intercalate "," (map absName legal)) (-1) step
            "resumed-immediately" ("preferred Call branch failed on slot "++name++"; residual grammar enumerated") (Just step) (length grammar)
            0 (length fits) "" (case fits of []->"no training-exact candidate"; _->"see class record") (not (null fits))]})
          if null fits then pure (Left ("feature transformation: no uniform "++name++" scalar expression")) else do
            let (cls,evals)=buildClass pol lib name slotAxis rows' cfs fits
            recordClass cls evals
            unless (null calls) $ onGraph (\g->g {deferred=[if dfSlot d==name && dfCreatedStep d==step then d {dfClassAfter=length (scReps cls), dfSelectedAfter=show (scSelected cls)} else d | d<-deferred g]})
            let e=scSelected cls
                instances=[(tag c++name++":",scalarNodes (tag c++name++":") e) | c<-cases]
            addNodes (concatMap snd instances)
            mapM_ (\c->addResult (tag c++name++":r")) cases
            addFeature (Feature (ScalarT name) (map (show . rowTarget) rows') (show e) [("semantic class of "++show (length (scReps cls))++" representatives"),intensionality e] (Just NeedTransform) (scalarLength e) Frozen)
            when (scalarLength e>=3) $ do
              let (pbody,_,params)=parametrize e
              propose "SequentialScalar" instances remaining
                ("SequentialScalar(axis,c): sequence-local scalar pattern over Current/Previous/Scene/Set references; axis and literal offsets are free parameters"
                ,["Ref Current","Ref Previous (alignment-derived)","Scene","InputSet"],"Int",params,["scalar"]
                ,["training-exact on every case for slot "++name],Just (AbsDef pbody (map snd params)))
            pure (Right e)
    -- The frozen snapshot of an axis is built once per run, at the first
    -- trigger; its statistics are recorded as search work and in the graph.
    ensureSnapshot :: Axis -> Int -> Search (RefGraph SlotLeaf)
    ensureSnapshot axis depth=do
      snaps<-gets stSnapshots
      case M.lookup (axis,depth) snaps of
        Just g->do when (scGoalDirected sc) (inc "b_goal_cache_hits" 1); pure g
        Nothing->do
          let (g,dropped)=buildSnapshot axis depth
              st=rgStats g
          modify (\s->s {stSnapshots=M.insert (axis,depth) g (stSnapshots s)})
          when (scGoalDirected sc) $ do
            inc "b_goal_queries" 1
            inc "b_goal_leaves_dropped" dropped
            traceMsg ("goal-directed query "++show axis++" depth "++show depth++": "++show dropped++" constant leaves dropped from the universe")
          inc "operator_applications" (gsBuildWork st)
          inc "b_snapshots_built" 1
          mapM_ (\(k,v)->inc k v)
            [("b_snapshot_work",gsBuildWork st),("b_graph_nodes",gsNodes st),("b_graph_classes",gsClasses st),("b_graph_templates",gsTemplates st),("b_graph_closed_terms",gsClosedTerms st)
            ,("b_constant_only_dropped",gsConstantOnlyDropped st),("b_edges_confirmed",gsEdgesConfirmed st),("b_edges_pending",gsEdgesPending st),("b_edges_not_supported",gsEdgesNotSupported st)
            ,("b_type_edges",gsTypeEdges st),("b_closure_edges",gsClosureEdges st),("b_sccs",gsSCCs st),("b_substitutions_tried",gsSubstitutionsTried st),("b_outside_universe",gsOutsideUniverse st)
            ,("b_vsa_nodes",gsVSANodes st),("b_vsa_unions",gsVSAUnions st),("b_vsa_expanded",gsExpanded st),("b_dag_evaluations",gsDAGEvaluations st),("b_reference_evaluations",gsReferenceEvaluations st)
            ,("b_witness_full",gsWitnessFull st),("b_graph_truncations",if gsTruncated st then 1 else 0),("b_edge_truncations",if gsEdgeTruncated st then 1 else 0)
            ,("b_vsa_expansion_mismatch",if gsExpansionOk st then 0 else 1)]
          setMax "b_layers" (gsLayers st)
          setMax "b_sharing_avg_x100" (gsSharingAvgX100 st)
          setMax "b_sharing_max_x100" (gsSharingMaxX100 st)
          onGraph (\gr->gr {referents=referents gr++[graphSummary (show axis++(if scGoalDirected sc then " depth "++show depth else "")) (sbSchedule sb) slotLeafName g]})
          traceMsg ("referent snapshot "++show axis++": "++show (gsNodes st)++" nodes ("++show (gsTemplates st)++" templates, "++show (gsClosedTerms st)++" closed terms"++(if gsTruncated st then ", universe truncated" else "")++"), "
            ++show (gsClasses st)++" classes, edges confirmed/pending/unsupported "++show (gsEdgesConfirmed st)++"/"++show (gsEdgesPending st)++"/"++show (gsEdgesNotSupported st)
            ++", type edges "++show (gsTypeEdges st)++", layers "++show (gsLayers st)++", DAG nodes "++show (gsVSANodes st)++" (unions "++show (gsVSAUnions st)++"), build work "++show (gsBuildWork st)
            ++" (dag "++show (gsDAGEvaluations st)++" / reference "++show (gsReferenceEvaluations st)++"), expansion check "++(if gsExpansionOk st then "ok" else "MISMATCH")++", snapshot hash "++show (rgSnapshotHash g))
          pure g
    -- Resume every deferred slot of the current alignment: enumerate the
    -- residual grammar, complete the class (Call representatives stay in it),
    -- re-rank with the same prior, and report whether the selection changed.
    resumeDeferred :: String -> Search (M.Map String Scalar)
    resumeDeferred reason=do
      pending<-gets stPending
      modify (\s->s {stPending=[]})
      lib<-gets stLibrary
      cfs<-gets stCF
      fmap M.fromList $ forM pending $ \(name,rows',callFits)->do
        step<-tick
        let (fits,n)=evaluateAll lib rows' grammar
            allFits=callFits++[f | f<-fits, f `notElem` callFits]
            (cls,evals)=buildClass pol lib name (axisOf name) rows' cfs allFits
        inc "operator_applications" n
        inc "resume_events" 1
        inc "resumed_candidates" (length grammar)
        inc "counterfactual_evaluations" evals
        old<-gets (\s->[c | c<-classes (stGraph s), scSlot c==name])
        let before=case old of []->Lit 0; cs->scSelected (last cs)
            changed=scSelected cls/=before
        onGraph (\g->g {classes=replaceLastClass name cls (classes g)
          , deferred=replaceLastDeferred name (\d->d {dfStatus="resumed", dfReason=dfReason d++"; resumed: "++reason, dfResumedStep=Just step
              , dfResumedCandidates=length grammar, dfClassAfter=length (scReps cls), dfSelectedAfter=show (scSelected cls), dfRecovered=changed}) (deferred g)})
        when changed $ do
          inc "recovered_solutions" 1
          let e=scSelected cls
              instances=[(tag c++name++":resumed:",scalarNodes (tag c++name++":resumed:") e) | c<-cases]
          addNodes (concatMap snd instances)
          mapM_ (\c->addResult (tag c++name++":resumed:r")) cases
          addFeature (Feature (ScalarT name) (map (show . rowTarget) rows') (show e) ["re-selected after resuming "++show (length grammar)++" deferred candidates",intensionality e] (Just NeedTransform) (scalarLength e) Frozen)
        traceMsg ("resume "++name++" ("++reason++"): class "++show (length (scReps cls))++" representatives; selected "++show (scSelected cls)++(if changed then " (re-selected)" else " (unchanged)"))
        pure (name,scSelected cls)
    -- Exclusive policy diagnostic: measure what the solver never saw. This
    -- runs after the search and is counted separately from search work.
    diagnoseExclusive :: Search ()
    diagnoseExclusive=do
      pending<-gets stPending
      modify (\s->s {stPending=[]})
      lib<-gets stLibrary
      cfs<-gets stCF
      forM_ pending $ \(name,rows',callFits)->do
        let (fits,n)=evaluateAll lib rows' grammar
            missed=[f | f<-fits, f `notElem` callFits]
            (cls,_)=buildClass pol lib name (axisOf name) rows' cfs (callFits++missed)
            lost=scSelected cls `notElem` callFits
        inc "diagnostic_operator_applications" n
        inc "exclusive_reuse_missed_candidates" (length missed)
        when lost (inc "exclusive_reuse_missed_solutions" 1)
        onGraph (\g->g {deferred=replaceLastDeferred name (\d->d {dfReason=dfReason d++"; diagnostic (not used by the solver): "++show (length missed)++" residual training-exact candidates never seen"
          , dfClassAfter=length (scReps cls), dfSelectedAfter=show (scSelected cls), dfRecovered=False}) (deferred g)})
        traceMsg ("exclusive diagnostic "++name++": "++show (length missed)++" missed candidates; complete-class selection "++show (scSelected cls)++(if lost then " differs from the Call" else " equals the Call"))
    replaceLastClass :: String -> SemanticClass -> [SemanticClass] -> [SemanticClass]
    replaceLastClass name cls cs=case break ((==name) . scSlot) (reverse cs) of
      (after,_:before)->reverse before++[cls]++reverse after
      _->cs++[cls]
    replaceLastDeferred :: String -> (Deferred -> Deferred) -> [Deferred] -> [Deferred]
    replaceLastDeferred name f ds=case break (\d->dfSlot d==name && dfStatus d `elem` ["deferred","never-resumed (exclusive policy)"]) (reverse ds) of
      (after,d:before)->reverse before++[f d]++reverse after
      _->ds
    argCombos :: [String] -> [[Arg]]
    argCombos kinds=sequence [if k=="Constant" then map ArgInt [-1,0,1] else map ArgAxis [AX,AY] | k<-kinds]
    evaluateAll :: Library -> [Row] -> [Scalar] -> ([Scalar],Int)
    evaluateAll lib rows' terms=foldr (\e (fs,n)->let (ok,m)=check e in (if ok then e:fs else fs,n+m)) ([],0) terms
      where check e=go rows' 0
              where go [] n=(True,n)
                    go (r:rs) n=if evalScalar lib (rowCtx r) e==Right (rowTarget r) then go rs (n+1) else (False,n+1)
    recordClass :: SemanticClass -> Int -> Search ()
    recordClass cls evals=do
      onGraph (\g->g {classes=classes g++[cls]})
      inc "counterfactual_evaluations" evals
      traceMsg ("class "++scSlot cls++": "++show (length (scReps cls))++" representatives, "++show (scSplits cls)++" counterfactual splits; selected "++show (scSelected cls))

    -- Final wrapping (I_0) and the high-level view. PostHocOnly additionally
    -- extracts scalar abstractions now, after the search, without feedback.
    -- SafeReuse exhausts the preferred branch here: every deferred slot is
    -- resumed so the final selection ranges over the complete candidate set.
    finalize :: KeyExpr -> M.Map String Scalar -> Bool -> [[(Placed,Placed)]] -> Search (Either String Program)
    finalize key slots0 unsafe ps=traceEvent "latis-train-exact" $ do
      firstWork<-currentWork
      setMetric "first_solution_work" firstWork
      pending<-gets stPending
      slots<-if safe && not (null pending) then do
          traceMsg "first solution found; exhausting the preferred branch: resuming deferred candidates"
          alt<-resumeDeferred "exhaust preferred branch after first solution"
          lib'<-gets stLibrary
          let m'=M.union alt slots0
              inline=mkProgram (Inline (Definition key (bodyFrom m') unsafe)) M.empty lib'
          if m'/=slots0 then
            if all (\(x,y)->runProgram inline x==Right y) examples then do inc "reselected_after_completion" 1; traceMsg "re-selected program after completion is training exact"; pure m'
            else do traceMsg "re-selected program diverged on training (unexpected); keeping the first solution"; pure slots0
          else pure slots0
        else do
          unless safe diagnoseExclusive
          pure slots0
      let def0=Definition key (bodyFrom slots) unsafe
      def<-if mode==PostHocOnly then postHoc def0 else pure def0
      results<-gets stResults
      addNodes [RNode "realize" "Realize" [] results "realization"]
      nodes<-gets stDerivation
      lib<-gets stLibrary
      let Definition _ body _=def
          slotExprs=[fst (bodyFirst body),snd (bodyFirst body),fst (bodyNext body),snd (bodyNext body)]
          usedAbs=nub [n | e<-slotExprs, n<-callsIn e]
          wrap=mode/=NoOnlineAbstraction && not unsafe && cohesive nodes
          contract="OrderedCorrespondence; equal counts; unique keys; preserve indexed objects; realize positions"
          top=Abstraction "I_0" "OrderedCorrespondence" contract ["Set[exists sigma.Placed[sigma]]"] "Set[exists sigma.Placed[sigma]]" []
                nodes (["OrderBy","RankAlign","Position","indexed object equality"]++usedAbs) ["alignment","scalar","realization"]
                ["stable symbolic expression across "++show ncases++" training cases","AlignmentLift","whole-grid exact check"]
                ["final wrapping of the successful derivation (cohesion-gated, not utility-promoted)",show body]
                (length nodes) 1 (Utility ncases (length nodes) 1 0 0 0 0 0 0 1 1 0 (promotionThreshold conf) True) 0 0 Nothing 0 0 Nothing
          (exec,defs)=if wrap then (CallTop "I_0",M.singleton "I_0" def) else (Inline def,M.empty)
          p=mkProgram exec defs lib
      when wrap (onGraph (\g->g {abstractions=abstractions g++[top]}))
      addFeature (Feature (ConceptT (SetT ExistsPlacedT)) (map (show . map (placedPos . snd)) ps) (show exec)
        ["sequence-local First/Current/Previous",if wrap then "hidden refinement: "++show (length nodes)++" nodes" else show body] (Just NeedTransform) (length (show body)) Frozen)
      onGraph (\g->g {features=[if trigger f==Just NeedConstruct then f {status=Frozen} else f | f<-features g]
        , highLevelView=["Input : Set[exists sigma.Placed[sigma]]","Output : Set[exists sigma.Placed[sigma]]","Count(Input) = Count(Output) : Nat"
          ,(if wrap then "Call(I_0) : "++contract else "Inline "++show def)]
          ++["VisibleOp "++absName a++" : "++absContract a | a<-abstractions g, uAccepted (absUtility a), absPromotionStep a>=0, absFamily a/="OrderedCorrespondence"]})
      if all (\(x,y)->runProgram p x==Right y) examples then pure (Right p) else pure (Left "realization: wrapped program diverged from inline definition")
    callsIn :: Scalar -> [String]
    callsIn (Call n _)=[n]
    callsIn (Plus a b)=callsIn a++callsIn b
    callsIn _=[]
    postHoc :: Definition -> Search Definition
    postHoc def=do
      let Body (fx,fy) (nx,ny)=defBody def
          slots=[("first-AX",fx),("first-AY",fy),("following-AX",nx),("following-AY",ny)]
          groups=M.toList (M.fromListWith (++) [(pbody,[(name,e,args)]) | (name,e)<-slots, scalarLength e>=3, let (pbody,args,_)=parametrize e])
      rewrites<-forM groups $ \(pbody,members)->do
        let instances=[(tag c++name++":",scalarNodes (tag c++name++":") e) | (name,e,_)<-members, c<-cases]
            (_,_,params)=parametrize (let (_,e,_)=head members in e)
        inc "online_abstractions_proposed" 1
        step<-tick
        case antiUnify instances of
          Left why->do traceMsg ("post-hoc abstraction rejected: "++why); pure []
          Right (pattern,_)->do
            let u=utility (promotionThreshold conf) 0 (length instances) pattern params
            n<-gets stNextAbs
            let name="I_"++show n
                ab=Abstraction name "SequentialScalar" "SequentialScalar(axis,c): post-hoc wrapped sequence-local scalar pattern" ["Ref Current","Ref Previous (alignment-derived)","Scene","InputSet"] "Int" params pattern [] ["scalar"]
                     ["training-exact slots: "++intercalate "," [s | (s,_,_)<-members]] ["post-hoc extraction after search; no feedback into this run"] (length pattern) (1+length params) u step (if uAccepted u then step else -1) Nothing 0 0 (Just (AbsDef pbody (map snd params)))
            onGraph (\g->g {abstractions=abstractions g++[ab]})
            if uAccepted u then do
              modify (\s->s {stNextAbs=n+1, stLibrary=M.insert name (AbsDef pbody (map snd params)) (stLibrary s)})
              inc "posthoc_abstractions_accepted" 1
              traceMsg ("post-hoc wrap "++name++" utility="++show (uTotal u))
              pure [(s,Call name args) | (s,_,args)<-members]
            else pure []
      let table=concat rewrites
          sub s e=fromMaybe e (lookup s table)
      pure def {defBody=Body (sub "first-AX" fx,sub "first-AY" fy) (sub "following-AX" nx,sub "following-AY" ny)}
