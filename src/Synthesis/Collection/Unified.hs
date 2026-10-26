-- Stage D: bounded, grid-constrained composition over A terms and B snapshots.
module Synthesis.Collection.Unified
  ( StageD(..), stageDOff, stageDFull, DCase(..), DResult(..), TypedGoal(..), GoalAudit(..)
  , searchUnified, dMetricNames, fixedExpressions, closedDeltaPairs, closedCountParameters, extensionPrograms
  ) where

import Synthesis.Collection.Typed
import Synthesis.Collection.Parameter
import Synthesis.Collection.Referent
import Synthesis.Collection.Relation
import Latent.Grid
import Latent.Render (render)
import qualified Latent.Object as O
import qualified Data.Map.Strict as M
import qualified Data.Set as S
import Data.List (sortOn,nub,foldl')
import Data.Maybe (mapMaybe)
import Debug.Trace (traceEvent)
import Synthesis.Collection.Diagnostics

data StageD = StageD
  { sdEnabled, sdTyped, sdCompose, sdVSA, sdOrdering :: Bool
  , sdGoalBudget, sdTotalParamBudget, sdCaseBudget, sdCombinationBudget :: Int
  , sdSkeletonBudget, sdMaxFits, sdParamReps, sdTemplateBudget :: Int
  , sdComposeDepth, sdParamDepth, sdBudgetMultiplier :: Int
  , sdDiagnostics :: Bool
  } deriving (Eq,Show)
stageDOff, stageDFull :: StageD
stageDOff=StageD False False False False False 40000 180000 4000 2000 96 16 32 20000 2 2 1 False
stageDFull=stageDOff {sdEnabled=True,sdTyped=True,sdCompose=True,sdVSA=True,sdOrdering=True}
data DCase = DCase { dInput :: O.Scene, dOutputDims :: Dimensions, dTarget :: Grid, dTargetObjects :: [O.Object] } deriving (Eq,Show)
data TypedGoal = TypedGoal { tgRole :: String,tgType :: Refinement,tgLeaves :: [ParamLeaf],tgDepth,tgBudget :: Int,tgContextWitness :: String } deriving (Eq,Show)
data GoalAudit = GoalAudit
  { gaRole :: String, gaContexts :: String, gaCandidates :: [String], gaDeferred :: [String]
  , gaBindings :: [[String]], gaEdges :: [String], gaNodes,gaEvaluations,gaReference :: Int
  , gaStatus :: String, gaExpressions :: [TExpr ParamLeaf] } deriving (Eq,Show)
data DResult = DResult
  { drFits :: [ObjectTransform], drMetrics :: M.Map String Int, drGoals :: [GoalAudit], drTrace :: [String]
  } deriving (Eq,Show)
data DS = DS { dsM :: M.Map String Int, dsG :: [GoalAudit], dsT :: [String]
             , dsCache :: M.Map String [Param], dsPriority :: M.Map Param Int, dsSeen :: S.Set ObjectTransform, dsFits :: [ObjectTransform] }
newtype DM a=DM { unDM :: DS -> (a,DS) }
instance Functor DM where fmap f (DM g)=DM (\s->let (a,s')=g s in (f a,s'))
instance Applicative DM where pure a=DM (\s->(a,s)); DM f <*> DM g=DM (\s->let (h,s')=f s;(a,s'')=g s' in (h a,s''))
instance Monad DM where DM g >>= f=DM (\s->case g s of (a,s')->unDM (f a) s')
getD :: (DS -> a) -> DM a
getD f=DM (\s->(f s,s))
change :: (DS -> DS) -> DM ()
change f=DM (\s->((),f s))
incD :: String -> Int -> DM ()
incD k n=change (\s->s {dsM=M.insertWith (+) k n (dsM s)})
metricD :: String -> DM Int
metricD k=getD (M.findWithDefault 0 k . dsM)
diagD :: StageD -> [(String,String)] -> DM ()
diagD cfg fields=DM (\s->diagnostic (sdDiagnostics cfg)
  ([("compose_depth",show (sdComposeDepth cfg)),("param_depth",show (sdParamDepth cfg)),("partial_d_work",show (sum [M.findWithDefault 0 k (dsM s) | k<-["d_typed_evaluations","d_case_executions","d_actual_param_evaluations","d_vsa_edge_checks","d_witness_replays"]]))]++fields) ((),s))
-- Single-IO trace events (level-gated; off by default, never read back).
traceD :: Int -> [(String,String)] -> DM ()
traceD lvl fields=DM (\s->traceAt lvl fields ((),s))
traceCandD :: Int -> String -> (Int -> [(String,String)]) -> DM ()
traceCandD lvl c fields=DM (\s->traceCand lvl c fields ((),s))
valueText :: TVal -> String
valueText (VI n)=show n
valueText (VB b)=jbool b
budgetJ :: String -> Int -> Int -> String -> String
budgetJ name limit used unit=jobj [("name",jstr name),("limit",show limit),("used",show used),("unit",jstr unit)]
dMetricNames :: [String]
dMetricNames=words "d_triggered d_skeletons d_skeleton_truncated d_inverse_not_applicable d_parameter_goals d_goal_cache_hits d_typed_evaluations d_actual_param_evaluations d_param_truncated d_param_combinations d_combination_truncated d_programs_enumerated d_programs_executed d_composed_enumerated d_composed_executed d_composition_fits d_case_executions d_case_truncated d_vsa_nodes d_vsa_classes d_vsa_edges d_vsa_edge_checks d_vsa_edge_truncated d_vsa_confirmed d_vsa_pending d_vsa_bytes_estimate d_dag_evaluations d_reference_evaluations d_candidate_coverage d_deferred_parameters d_first_exact_work d_total_work d_fits d_witness_valid d_render_valid d_witness_replays d_witness_failures d_joint_fallback d_not_applicable"

-- A witnessed inverse constraint is a proposal, never a runtime feature.
-- Output objects are used only here; all proposed programs are checked forward
-- against the complete grid. Non-object-preserving renderings use the joint
-- forward fallback below, without manufactured scalar labels.
data Skeleton = CopyOnly | MoveCopy | ColorMove | ShapeMove PerObject | ColorOnly | MoveOnly deriving (Eq,Ord,Show)
data Row = Row { rContext :: ParamContext, rBeforeMove :: ParamContext, rValues :: M.Map String Int } deriving (Eq,Show)
inverseRows :: Selector -> Others -> Skeleton -> Bool -> [DCase] -> Either String [Row]
inverseRows selector others skeleton reversed=traverse one
  where
    one c=do
      (chosen,rest)<-selectObjects selector (O.objects (dInput c))
      source<-case chosen of [o]->Right o; _->Left "inverse requires a unique selected source"
      let key o=S.fromList (O.absolutePixels o)
          preserved=if others==KeepOthers then S.fromList (map key rest) else S.empty
          targets0=[o | o<-dTargetObjects c, S.notMember (key o) preserved]
          targets1=sortOn (\o->(cy (O.position o),cx (O.position o))) targets0
          targets=if reversed then reverse targets1 else targets1
      if others==KeepOthers && not (all (\o->any ((==key o) . key) (dTargetObjects c)) rest)
        then Left "preserved objects lack an output witness" else Right ()
      shaped<-case skeleton of
        ShapeMove op->do
          es<-emitObjects (ObjectTransform AllObjects DropOthers (MapEach op)) (dOutputDims c) [source]
          case es of [e]->Right (eoObject e); _->Left "shape witness not singleton"
        _->Right source
      first<-case targets of []->Left "no emitted target witness"; o:_->Right o
      let recolors=skeleton `elem` [ColorOnly,ColorMove]
          copies=skeleton `elem` [CopyOnly,MoveCopy]
          Coord x y=O.position first
          n=length targets
          Vec dx dy=case targets of a:b:_->difference (O.position b) (O.position a); _->Vec 0 0
          positions=[Coord (x+k*dx) (y+k*dy) | k<-[0..n-1]]
      if not (all ((==objMask shaped) . objMask) targets) then Left "shape correspondence absent" else Right ()
      if not recolors && not (all ((==objColor shaped) . objColor) targets) then Left "colour correspondence absent" else Right ()
      col<-case nub (map objColor targets) of [Just z]->Right z; _->Left "nonuniform emitted colours"
      if copies then
        if positions/=map O.position targets || (n>1 && dx==0 && dy==0) then Left "copy roles lack arithmetic OrderedView witness" else Right ()
        else if n/=1 then Left "single-object skeleton has multiple targets" else Right ()
      if skeleton `elem` [CopyOnly,ColorOnly] && O.position first/=O.position source then Left "unmoved source position constraint" else Right ()
      let current=if skeleton==MoveCopy then shaped {O.position=Coord x y} else shaped
          ctx=ParamContext (O.canvas (dInput c)) (dOutputDims c) (O.objects (dInput c)) chosen current
      Right (Row ctx (ctx {pcCurrent=shaped}) (M.fromList [("count",n),("dx",dx),("dy",dy),("x",x),("y",y),("color",col)]))

leavesFor :: String -> [ParamLeaf]
leavesFor "count"=[InputWidth,WholeCount,WholeColors,CurrentWidth,CurrentHeight,InputHeight]
leavesFor "color"=[CurrentColor,WholeColors,WholeCount,InputWidth]
leavesFor "x"=[CurrentX,CurrentWidth,InputWidth,WholeCount,WholeColors,CurrentY,OutputWidth]
leavesFor "y"=[CurrentY,CurrentHeight,InputHeight,WholeCount,WholeColors,CurrentX,OutputHeight]
leavesFor _=[CurrentWidth,CurrentHeight,WholeColors,WholeCount,CurrentX,CurrentY,InputWidth]
refinementFor :: String -> Refinement
refinementFor "count"=PositiveCount
refinementFor "color"=ArcColor
refinementFor _=IntegerParam
subterms :: LTerm l -> [LTerm l]
subterms t@(LApp _ as)=t:concatMap subterms as
subterms t=[t]

goal :: StageD -> String -> String -> [Row] -> DM [Param]
goal cfg planId role rs=do
  incD "d_parameter_goals" 1
  let ctx r=if role `elem` ["x","y"] then rBeforeMove r else rContext r
      visible=if sdTyped cfg then leavesFor role else nub (concatMap tLeaves (fixedExpressions role))
      labels=[(ctx r,VI (rValues r M.! role)) | r<-rs]
      key=show (role,[(O.objectId (pcCurrent (ctx r)),map O.objectId (pcSelected (ctx r)),map (evalLeaf (ctx r)) visible,rValues r M.! role) | r<-rs],sdTyped cfg)
  diagD cfg [("scope",jstr "TypedParameter"),("branch_id",jstr (stableHash key)),("parent_id",jstr "unified"),("goal_type",jstr role),("event",jstr "entered"),("trigger",jstr "inverse-witness-constraint")]
  cached<-getD (M.lookup key . dsCache)
  case cached of
    Just ps->do
      traceD levelBranches [("scope",jstr "TypedParameter"),("kind",jstr "cache_hit"),("stage",jstr "typed_parameter"),("branch_id",jstr (stableHash key)),("parent_branch_id",jstr planId),("goal_type",jstr role)
        ,("survivor_ids",jarr [jstr (stableHash (show (paramExpr p))) | p<-ps]),("reason_code",jstr "goal_cache_hit")]
      incD "d_goal_cache_hits" 1 >> pure ps
    Nothing->do
      used<-metricD "d_typed_evaluations"
      let available=max 0 (min (sdGoalBudget cfg) (sdTotalParamBudget cfg-used))
          reserve=9*length labels+2 -- A checks a complete <=1-hole template atomically
          ready=available>reserve
          -- Bound the candidate universe before either B schedule is applied.
          hc=HoleConfig (sdParamDepth cfg) 1 (max 0 (available-reserve)) [-4..4] (baseOps++parityOps++enumeratedBoolOps) FeatureAndConstant
          leaves=visible
          allTemplates=if ready then extendedTemplates hc [(l,TyInt) | l<-leaves] TyInt else []
          fixed=[Template e (holeCount e) (length (tLeaves e)) (tDepth e) | e<-fixedExpressions role]
          templates=if ready then take (sdTemplateBudget cfg) (if sdTyped cfg then allTemplates else fixed) else []
          raw=synthesizeTyped hc show templates [(evalLeaf c,v) | (c,v)<-labels]
          -- A has already checked evalT on every row. Refinement checks here
          -- inspect those witnessed target values, avoiding uncounted repeats.
          valid _=all (\(_,v)->case v of
            VI n->case refinementFor role of PositiveCount->n>=1; ArcColor->n>=0 && n<=9; _->True
            _->False) labels
          fitted=nub [p | c<-sortOn (\c->(cCost c,cIndex c)) (trFits raw), Right p<-[checkedParam (refinementFor role) (cExpr c)],valid p]
          kept=take (sdParamReps cfg) fitted
          deferred=drop (sdParamReps cfg) fitted
          pool=if sdVSA cfg then buildPool (length kept) kept else ParamPool kept [] emptyVSA (-1) []
          contexts=[Context ("case"++show i) ("Object["++show (O.width (pcCurrent c),O.height (pcCurrent c))++"]") (evalLeaf c) | (i,(c,_))<-zip [0::Int ..] labels]
          terms=map (lambdaFromTyped . paramExpr) kept
          trials=if sdVSA cfg then [e | a<-terms,b<-terms,a/=b,(path,_)<-specialValues (normalize (liPartial paramInfo) a)
                    ,f<-nub (subterms b),not (null (lLeaves f)),let e=relate paramInfo contexts [] a b f [path]
                    ] else []
          checked=take (4096*sdBudgetMultiplier cfg) trials
          checkedCount=foldl' (\n e->eStatus e `seq` (n+1)) 0 checked
          edges=take (128*sdBudgetMultiplier cfg) [e | e<-checked,eStatus e `elem` [Confirmed,PendingDependency]]
          -- Case agreement is never an e-class merge. Edges only schedule.
          priority p=sum [if eStatus e==Confirmed then 2 else 1 | e<-edges,swAfter (eStructural e)==normalize (liPartial paramInfo) (lambdaFromTyped (paramExpr p))]
          sharing=if sdVSA cfg then SharedParamVSA else NoParamVSA
          (matches,evalWork)=fitPool sharing pool labels
          survivors=[p | p<-kept,p `elem` matches]
          refWork=sum [sum (map (tLength . paramExpr) kept) | _<-labels]
          templateCut=sdTyped cfg && length (take (sdTemplateBudget cfg+1) allTemplates)>sdTemplateBudget cfg
          truncated=not ready || trTruncated raw || templateCut || not (null deferred)
          status | not ready="truncated: global parameter budget"
                 | truncated="truncated"
                 | null matches="no-fit"
                 | otherwise="fit"
          spec=TypedGoal role (refinementFor role) leaves (sdParamDepth cfg) available key
          guards=nub [condition | term<-terms,LApp OpIf (condition:_)<-subterms term]
          boolSpec=TypedGoal (role++".condition") BooleanParam leaves 1 0 key
          boolAudit=GoalAudit (role++".condition") (show boolSpec)
              (map (show . lambdaToTyped) guards) [] [] [] 0 0 0 "embedded Bool subgoal: parent grid constraint; nodes/evaluations charged once to parent" (mapMaybe lambdaToTyped guards)
          audit=GoalAudit role (show spec) (map (show . paramExpr) kept)
              (["regenerable template frontier "++show (trTemplatesTried raw)++"/bounded-prefix="++show (length templates) | truncated]++map (show . paramExpr) deferred)
              [map bindingText (cBindings c) | c<-trFits raw,cExpr c `elem` map paramExpr kept]
              (map (edgeText show) edges) (vsaNodeCount (ppDAG pool)) (if sdVSA cfg then evalWork else 0) refWork status (map paramExpr kept)
      let visited=take (trTemplatesTried raw) templates
          depthCounts=jobj [(show d,jobj [("generated_templates",show (length [() | t<-templates,tmDepth t==d])),("visited_templates",show (length [() | t<-visited,tmDepth t==d])),("fit_instances",show (length [() | p<-fitted,tDepth (paramExpr p)==d]))]) | d<-[0..sdParamDepth cfg]]
          branch=stableHash key
      diagD cfg [("scope",jstr "TypedParameter"),("branch_id",jstr branch),("parent_id",jstr "unified"),("goal_type",jstr role),("trigger",jstr "inverse-witness-constraint")
        ,("attempted",show (trTemplatesTried raw)),("evaluated",show (trEvaluations raw)),("param_fit_count",show (length fitted))
        ,("representatives_dropped_or_deferred",show (length deferred)),("deferred_count",show (length deferred)),("frontier_nonempty",if truncated then "true" else "null")
        ,("remaining_frontier_count","null"),("max_depth_visited",show (maximum (0:map tmDepth visited))),("depth_counts",depthCounts)
        ,("visible_leaves",jstr (show leaves)),("constant_domain",jstr "[-4..4]; root direct hole may be solved algebraically")
        ,("budgets",jobj [("row_probes",jobj [("limit",show available),("used",show (trEvaluations raw)),("hit",if trTruncated raw || not ready then "true" else "false")]),("templates",jobj [("limit",show (sdTemplateBudget cfg)),("used",show (length templates)),("hit",if templateCut then "true" else "false")]),("representatives",jobj [("limit",show (sdParamReps cfg)),("used",show (length kept)),("hit",if null deferred then "false" else "true")])])
        ,("stop_reason",jstr (if truncated then "BudgetCut" else if null matches then "NoFitYet" else "FoundFit")),("exhaustiveness",jstr (if truncated then "ProvenNotExhausted" else "Unknown"))
        ,("exhaustiveness_evidence",jstr "Only visited template prefix and surviving representatives are counted; no whole grammar certificate")]
      diagD cfg [("scope",jstr "ParameterVSA"),("branch_id",jstr (branch++".vsa")),("parent_id",jstr branch),("goal_type",jstr role),("stop_reason",jstr (if sdVSA cfg then "FoundFit" else "NotEntered")),("exhaustiveness",jstr "Unknown"),("nodes",show (vsaNodeCount (ppDAG pool))),("dag_evaluations",show evalWork),("reference_evaluations",show refWork),("candidate_hashes","["++concatWithComma (map (jstr . stableHash . show . paramExpr) kept)++"]")]
      -- Representatives with AST, bindings and case-relative values. A
      -- training-equal value vector is a case-relative class, not a proof.
      traceD levelBranches [("scope",jstr "TypedParameter"),("kind",jstr "representatives"),("stage",jstr "typed_parameter"),("branch_id",jstr branch),("parent_branch_id",jstr planId),("goal_type",jstr role)
        ,("refinement",jstr (show (refinementFor role))),("visible_leaves",jarr (map (jstr . show) leaves)),("max_param_depth",show (sdParamDepth cfg))
        ,("labels",jarr [jobj [("case_index",show i),("value",valueText v),("current_object",show (O.objectId (pcCurrent c))),("selected_objects",show (map O.objectId (pcSelected c)))] | (i,(c,v))<-zip [0::Int ..] labels])
        ,("label_source",jstr "inverse witness (output objects used only as a training constraint)")
        ,("representatives",jarr [jobj [("param_id",jstr (stableHash (show (paramExpr p)))),("param",paramJSON p)
            ,("bindings",jarr [jstr (bindingText b) | c<-take 1 [c | c<-trFits raw,cExpr c==paramExpr p],b<-cBindings c])
            ,("case_values",jarr [either (jstr . ("error: "++)) valueText (evalParam c p) | (c,_)<-labels])
            ,("case_relative_class",jstr (stableHash (show [evalParam c p | (c,_)<-labels])))
            ,("matches_all_labels",jbool (p `elem` matches)),("vsa_root",if sdVSA cfg then maybe "null" show (lookup p (zip (ppCandidates pool) (ppRoots pool))) else "null")] | p<-kept])
        ,("deferred",jarr [jobj [("param_id",jstr (stableHash (show (paramExpr p)))),("text",jstr (renderT show (paramExpr p)))] | p<-deferred])
        ,("vsa",jobj [("enabled",jbool (sdVSA cfg)),("union_node",if sdVSA cfg then show (ppUnion pool) else "null"),("nodes",show (vsaNodeCount (ppDAG pool)))])
        ,("edges",jarr [jobj [("status",jstr (case eStatus e of Confirmed->"Confirmed"; PendingDependency->"Pending"; NotSupported->"NotSupported"; Rejected _->"Rejected")),("text",jstr (edgeText show e))
            ,("after_param_ids",jarr [jstr (stableHash (show (paramExpr p))) | p<-kept,swAfter (eStructural e)==normalize (liPartial paramInfo) (lambdaFromTyped (paramExpr p))])] | e<-edges])
        ,("templates",jobj [("visited",show (trTemplatesTried raw)),("bounded_prefix",show (length templates)),("limit",show (sdTemplateBudget cfg))])
        ,("budget",budgetJ "row_probes" available (trEvaluations raw) "A row/probe checks"),("status",jstr status)]
      incD "d_typed_evaluations" (trEvaluations raw)
      incD "d_param_truncated" (if truncated then 1 else 0)
      incD "d_vsa_nodes" (vsaNodeCount (ppDAG pool))
      incD "d_vsa_classes" (if null kept || not (sdVSA cfg) then 0 else 1)
      incD "d_vsa_edges" (length edges)
      incD "d_vsa_edge_checks" checkedCount
      incD "d_vsa_edge_truncated" (if length (take (4096*sdBudgetMultiplier cfg+1) trials)>4096*sdBudgetMultiplier cfg then 1 else 0)
      incD "d_vsa_confirmed" (length [() | e<-edges,eStatus e==Confirmed])
      incD "d_vsa_pending" (length [() | e<-edges,eStatus e==PendingDependency])
      incD "d_vsa_bytes_estimate" (if sdVSA cfg then length (show (ppDAG pool))*2 else 0)
      incD "d_dag_evaluations" (if sdVSA cfg then evalWork else 0)
      incD "d_actual_param_evaluations" evalWork
      incD "d_reference_evaluations" refWork
      incD "d_candidate_coverage" (length kept)
      incD "d_parameter_goals" (if null guards then 0 else 1)
      incD "d_vsa_classes" (if null guards || not (sdVSA cfg) then 0 else 1)
      incD "d_candidate_coverage" (length guards)
      incD "d_deferred_parameters" (length deferred)
      change (\s->s {dsCache=M.insert key survivors (dsCache s),dsPriority=M.union (M.fromList [(p,priority p) | p<-survivors]) (dsPriority s),dsG=audit:[boolAudit | not (null guards)]++dsG s})
      pure survivors

-- ComposeOnly's fixed parameters are an explicit finite C-style grammar.
-- It does not call a feature-composition template enumerator.
fixedExpressions :: String -> [TExpr ParamLeaf]
fixedExpressions role=nub $ case role of
  "count"->map paramExpr closedCountParameters
  "color"->[TConst (VI k) | k<-[0..9]]++[TLeaf CurrentColor]
  "x"->constants++position CurrentX CurrentWidth
  "y"->constants++position CurrentY CurrentHeight
  "dx"->map (paramExpr . fst) closedDeltaPairs
  _->map (paramExpr . snd) closedDeltaPairs
  where shift l=[TLeaf l]++[TApp OpAdd [TLeaf l,TConst (VI g)] | g<-[-4..4],g/=0]
        constants=[TConst (VI k) | k<-[-4..4]]
        position p e=shift p++[TApp op [TLeaf p,if g==0 then TLeaf e else TApp OpAdd [TLeaf e,TConst (VI g)]] | op<-[OpAdd,OpSub],g<-[0..2]]

closedDeltaPairs :: [(Param,Param)]
closedDeltaPairs=[pair | ctor<-[StepRight,StepDown,StepLeft,StepUp,StepDiagonal],gap<-[0..2],Right pair<-[migrateOffset (ctor gap)]]
closedCountParameters :: [Param]
closedCountParameters=[p | k<-[KConst n | n<-[2,3,4]]++[KCountObjects,KCountColors]++[ctor gap | ctor<-[KFitAcross,KFitDown],gap<-[0..2]],Right p<-[migrateCount k]]

construct :: StageD -> String -> Selector -> Others -> Skeleton -> [Row] -> DM [ObjectTransform]
construct cfg planId sel others sk rs=do
  let g name=goal cfg planId name rs
      wrap ss=ObjectTransform sel others (Pipeline ss)
  steps<-case sk of
    CopyOnly->do n<-g "count"; x<-g "dx"; y<-g "dy"; pure [[Copies a b c] | a<-n,b<-x,c<-y,sdTyped cfg || (b,c) `elem` closedDeltaPairs]
    MoveCopy->do x<-g "x"; y<-g "y"; n<-g "count"; dx<-g "dx"; dy<-g "dy"; pure [[MapPosition a b,Copies c d e] | a<-x,b<-y,c<-n,d<-dx,e<-dy,sdTyped cfg || (d,e) `elem` closedDeltaPairs]
    ColorMove->do c<-g "color"; x<-g "x"; y<-g "y"; pure [[MapColor a,MapPosition b d] | a<-c,b<-x,d<-y]
    ShapeMove p->do x<-g "x"; y<-g "y"; pure [[LegacyStep p,MapPosition a b] | a<-x,b<-y]
    ColorOnly->do c<-g "color"; pure [[MapColor a] | a<-c]
    MoveOnly->do x<-g "x"; y<-g "y"; pure [[MapPosition a b] | a<-x,b<-y]
  pure (map wrap steps)

-- entry/parent only label trace events (inverse_typed plan, extension or
-- joint forward); they never influence the search.
tryProgram :: StageD -> String -> String -> [DCase] -> ObjectTransform -> DM ()
tryProgram cfg entry parent cases t=do
  seen<-getD (S.member t . dsSeen)
  combinations<-metricD "d_param_combinations"
  fits<-getD (length . dsFits)
  caseWork<-metricD "d_case_executions"
  let base=[("scope",jstr "Execution"),("stage",jstr entry),("entry",jstr entry),("branch_id",jstr cid),("parent_branch_id",jstr parent)]
      -- Never executed: the AST is kept at level full only (disk bound).
      skipped kind code budget=traceCandD levelCandidates cid (\level->base++[("kind",jstr kind),("outcome",jstr (if kind=="duplicate" then "unknown" else "truncated")),("reason_code",jstr code),("budget",budget)]++[("candidate_ast",transformJSON t) | level>=levelFull])
  if seen then skipped "duplicate" "already_executed_identical_ast" "null"
  else if caseWork>=sdCaseBudget cfg then skipped "truncated" "case_execution_budget" (budgetJ "sdCaseBudget" (sdCaseBudget cfg) caseWork "forward case executions") >> incD "d_case_truncated" 1
  else if combinations>=sdCombinationBudget cfg || fits>=sdMaxFits cfg then
    (if combinations>=sdCombinationBudget cfg then skipped "truncated" "parameter_combination_budget" (budgetJ "sdCombinationBudget" (sdCombinationBudget cfg) combinations "programs executed")
     else skipped "truncated" "train_exact_fit_cap" (budgetJ "sdMaxFits" (sdMaxFits cfg) fits "train-exact programs")) >> incD "d_combination_truncated" 1
  else do
    change (\s->s {dsSeen=S.insert t (dsSeen s)})
    incD "d_param_combinations" 1
    incD "d_programs_enumerated" 1
    let depth=case otBody t of Pipeline ss->length ss; _->0
        composed=depth>=2
    diagD cfg [("scope",jstr "Execution"),("branch_id",jstr (stableHash (show t))),("parent_id",jstr "unified"),("event",jstr "attempt"),("program_hash",jstr (stableHash (show t))),("pipeline_depth",show depth),("attempted","1"),("exhaustiveness",jstr "Unknown")]
    traceCandD levelCandidates cid (\_->base++[("kind",jstr "proposed"),("candidate_ast",transformJSON t),("candidate_type",jstr "Set[Object] -> Set[Object] (typed pipeline)"),("cost",show (transformCost t)),("pipeline_slots",show depth),("enumeration_index",show combinations)])
    if composed then incD "d_composed_enumerated" 1 else pure ()
    incD "d_programs_executed" 1
    if composed then incD "d_composed_executed" 1 else pure ()
    failed<-check (0::Int) cases
    let ok=null failed
    diagD cfg [("scope",jstr "Execution"),("branch_id",jstr (stableHash (show t))),("parent_id",jstr "unified"),("event",jstr "completed"),("pipeline_depth",show depth),("train_exact_candidates",if ok then "1" else "0"),("program_transform",if ok then jstr (show t) else "null"),("stop_reason",jstr (if ok then "FoundFit" else "NoFitYet")),("exhaustiveness",jstr "Unknown")]
    traceCandD levelCandidates cid (\_->base++[("kind",jstr "completed"),("outcome",jstr (if ok then "fit" else if failed `elem` ["execution_invalid","render_invalid"] then "invalid" else if failed=="truncated" then "truncated" else "no_fit")),("reason_code",jstr (if ok then "train_exact" else failed))])
    if ok then traceEvent "latis-train-exact" $ do
      oldFits<-getD dsFits
      if null oldFits then do
        values<-mapM metricD ["d_typed_evaluations","d_case_executions","d_actual_param_evaluations","d_vsa_edge_checks","d_witness_replays"]
        incD "d_first_exact_work" (sum values)
        else pure ()
      change (\s->s {dsFits=t:dsFits s})
      incD "d_fits" 1
      if composed then incD "d_composition_fits" 1 else pure ()
      else pure ()
  where
    -- Returns the failing case's outcome code ("" when every case is exact).
    cid=stableHash (show t)
    caseTrace i c outcome reason grid n=traceCandD levelCandidates cid (\level->
      [("scope",jstr (if outcome `elem` ["render_invalid","render_mismatch","exact"] then "Render" else "Execution")),("stage",jstr (if outcome `elem` ["render_invalid","render_mismatch","exact"] then "render" else entry)),("entry",jstr entry)
      ,("branch_id",jstr cid),("parent_branch_id",jstr parent),("kind",jstr "case"),("case_index",show i)
      ,("outcome",jstr outcome),("reason_code",jstr outcome),("reason",jstr reason)
      ,("case",caseTraceJSON (level>=levelFull) (CaseTrace i outcome reason grid (dTarget c) n))])
    check _ []=pure ""
    check i (c:cs)=do
      used<-metricD "d_case_executions"
      if used>=sdCaseBudget cfg then caseTrace i c "truncated" "case execution budget reached inside candidate" Nothing 0 >> incD "d_case_truncated" 1 >> pure "truncated" else do
        incD "d_case_executions" 1
        case executePipeline t (O.canvas (dInput c)) (dOutputDims c) (O.objects (dInput c)) of
          Left reason->diagD cfg [("scope",jstr "Execution"),("branch_id",jstr (stableHash (show t))),("stop_reason",jstr "InvalidPrecondition"),("reason",jstr reason)] >> caseTrace i c "execution_invalid" reason Nothing 0 >> pure "execution_invalid"
          Right w->case renderWitness (dOutputDims c) (O.background (dInput c)) (pwEmitted w) of
            Left reason->diagD cfg [("scope",jstr "Render"),("branch_id",jstr (stableHash (show t))),("stop_reason",jstr "InvalidPrecondition"),("reason",jstr reason),("render_attempts","1")] >> caseTrace i c "render_invalid" reason Nothing (length (pwEmitted w)) >> pure "render_invalid"
            Right rw | renderResult rw==dTarget c->do
              diagD cfg [("scope",jstr "Render"),("branch_id",jstr (stableHash (show t))),("stop_reason",jstr "FoundFit"),("render_attempts","1"),("render_mismatches","0")]
              incD "d_witness_replays" 1
              let valid=verifyPipeline t (O.canvas (dInput c)) (dOutputDims c) (O.objects (dInput c)) w
                        && verifyRenderWitness (dOutputDims c) (O.background (dInput c)) (pwEmitted w) rw
              if valid then caseTrace i c "exact" "" (Just (renderResult rw)) (length (pwEmitted w)) >> incD "d_witness_valid" 1 >> incD "d_render_valid" 1 >> check (i+1) cs
                else caseTrace i c "witness_failure" "transform/render witness failed independent replay" (Just (renderResult rw)) (length (pwEmitted w)) >> incD "d_witness_failures" 1 >> pure "witness_failure"
            Right rw->diagD cfg [("scope",jstr "Render"),("branch_id",jstr (stableHash (show t))),("stop_reason",jstr "NoFitYet"),("render_attempts","1"),("render_mismatches","1")] >> caseTrace i c "render_mismatch" "rendered grid differs from the training target" (Just (renderResult rw)) (length (pwEmitted w)) >> pure "render_mismatch"

searchUnified :: StageD -> [DCase] -> DResult
searchUnified cfg cases
  | not (sdEnabled cfg) || null cases=DResult [] M.empty [] ["not-applicable: Stage D disabled or no training pairs"]
  | or [dInput a==dInput b && dTarget a/=dTarget b | a<-cases,b<-cases]=DResult [] (M.singleton "d_not_applicable" 1) [] ["training-inconsistent: identical input has contradictory target grids"]
  | otherwise=
    let (_,s)=unDM run (DS M.empty [] [] M.empty M.empty S.empty [])
        m=dsM s
        work=sum [M.findWithDefault 0 k m | k<-["d_typed_evaluations","d_case_executions","d_actual_param_evaluations","d_vsa_edge_checks","d_witness_replays"]]
    in DResult (sortOn (\t->(transformCost t,t)) (dsFits s)) (M.insert "d_total_work" work m) (reverse (dsG s)) (reverse (dsT s))
  where
    colors=sortOn id (nub [c | dc<-cases,o<-O.objects (dInput dc),Just c<-[objColor o]])
    selectors=[(AllObjects,DropOthers)]++[(FilterBy p,o) | p<-[IsMaxArea,IsMinArea]++map ColorIs colors,o<-[DropOthers,KeepOthers]]
    skeletons=[CopyOnly,ColorOnly,MoveOnly]++[sk | sdCompose cfg,sk<-[ColorMove,ShapeMove (Hollow 1),ShapeMove FillBBox,MoveCopy]]
    plans=[(sel,others,sk,rev) | (sel,others)<-selectors,sk<-skeletons,rev<-[False,True],rev==False || sk `elem` [CopyOnly,MoveCopy]]
    run=do
      diagD cfg [("scope",jstr "Composition"),("branch_id",jstr "unified"),("event",jstr "entered"),("trigger",jstr "legacy-no-fit"),("stop_reason",jstr "NoFitYet")]
      incD "d_triggered" 1
      incD "d_skeleton_truncated" (if length plans>sdSkeletonBudget cfg then 1 else 0)
      traceD levelBranches [("scope",jstr "Composition"),("kind",jstr "plans"),("stage",jstr "unified"),("branch_id",jstr "unified"),("parent_branch_id",jstr "legacy")
        ,("plans_total",show (length plans)),("plans_visited",show (min (length plans) (sdSkeletonBudget cfg)))
        ,("budget",budgetJ "sdSkeletonBudget" (sdSkeletonBudget cfg) (min (length plans) (sdSkeletonBudget cfg)) "selector x skeleton plans")
        ,("plan_ids",jarr [jobj [("plan_id",jstr (stableHash (show p))),("text",jstr (show p))] | p<-take (sdSkeletonBudget cfg) plans])
        ,("case_output_dims",jarr [jarr [show (gridWidth (dOutputDims c)),show (gridHeight (dOutputDims c))] | c<-cases])
        ,("output_dims_source",jstr "input-side SizeRule realization (target size never read)")]
      mapM_ plan (take (sdSkeletonBudget cfg) plans)
      if sdCompose cfg && sdComposeDepth cfg>2 then do
        let candidates=extensionPrograms cfg selectors colors
        traceD levelBranches [("scope",jstr "Extension"),("kind",jstr "entered"),("stage",jstr "extension_forward"),("branch_id",jstr "unified.extension"),("parent_branch_id",jstr "unified")
          ,("compose_depth_limit",show (sdComposeDepth cfg)),("slot_layers",jarr (map show [3..min 4 (sdComposeDepth cfg)]))
          ,("budget",budgetJ "sdCombinationBudget+1 prefix" (sdCombinationBudget cfg+1) (length (take (sdCombinationBudget cfg+1) candidates)) "programs passed to execution")
          ,("parameter_grammar",jstr "closed constants/gaps of ComposeOnly; no typed hole in extension layers")]
        mapM_ (tryProgram cfg "extension_forward" "unified.extension" cases) (take (sdCombinationBudget cfg+1) candidates)
        else pure ()
      -- The joint fallback has no scalar labels: enumerate A templates with
      -- bounded shared constants, then verify complete training grids.
      fitCount<-getD (length . dsFits)
      if fitCount==0 then joint else pure ()
      finalFits<-getD (length . dsFits)
      metrics<-getD dsM
      let val k=M.findWithDefault 0 k metrics
          cut=any ((>0) . val) ["d_skeleton_truncated","d_param_truncated","d_combination_truncated","d_case_truncated"]
      diagD cfg [("scope",jstr "Composition"),("branch_id",jstr "unified"),("event",jstr "completed"),("attempted",show (val "d_programs_enumerated")),("evaluated",show (val "d_case_executions")),("train_exact_candidates",show finalFits)
        ,("budgets",jobj [(name,jobj [("limit",show lim),("used",show (val used)),("hit",if val hit>0 then "true" else "false")]) | (name,lim,used,hit)<-
           [("skeletons",sdSkeletonBudget cfg,"d_skeletons","d_skeleton_truncated"),("parameter_combinations",sdCombinationBudget cfg,"d_param_combinations","d_combination_truncated"),("case_executions",sdCaseBudget cfg,"d_case_executions","d_case_truncated"),("fit_representatives",sdMaxFits cfg,"d_fits","d_combination_truncated")]])
        ,("budget_kind",jstr "multiple-layer-limits"),("budget_limit",show (sdCombinationBudget cfg)),("budget_used",show (val "d_param_combinations")),("hit",if cut then "true" else "false"),("frontier_nonempty",if cut then "true" else "null"),("remaining_frontier_count","null")
        ,("stop_reason",jstr (if cut then "BudgetCut" else if finalFits>0 then "FoundFit" else "NoFitYet")),("exhaustiveness",jstr (if cut then "ProvenNotExhausted" else "Unknown"))]
    plan (sel,others,sk,rev)=do
      incD "d_skeletons" 1
      case inverseRows sel others sk rev cases of
        Left reason->do
          diagD cfg [("scope",jstr "Composition"),("branch_id",jstr (stableHash (show (sel,others,sk,rev)))),("parent_id",jstr "unified"),("stop_reason",jstr "InvalidPrecondition"),("reason",jstr reason)]
          incD "d_inverse_not_applicable" 1
          change (\s->s {dsT=(show (sel,others,sk)++": not-applicable: "++reason):dsT s})
        Right rs->do
          change (\s->s {dsT=("inverse proposal witness: "++show (sel,others,sk,rev)++"; unique source / arithmetic copy role per case: "++show [(O.objectId (pcCurrent (rContext r)),rValues r) | r<-rs]):dsT s})
          let pid=stableHash (show (sel,others,sk,rev))
          traceD levelBranches [("scope",jstr "Composition"),("kind",jstr "inverse_rows"),("stage",jstr "inverse_typed"),("branch_id",jstr pid),("parent_branch_id",jstr "unified")
            ,("plan",jstr (show (sel,others,sk,rev))),("skeleton",jstr (show sk)),("selector",jstr (show sel)),("others",jstr (show others)),("reversed",jbool rev)
            ,("rows",jarr [jobj [("case_index",show i),("source_object",show (O.objectId (pcCurrent (rBeforeMove r)))),("selected_objects",show (map O.objectId (pcSelected (rContext r))))
                ,("labels",jobj [(k,show v) | (k,v)<-M.toList (rValues r)])] | (i,r)<-zip [0::Int ..] rs])
            ,("label_note",jstr "inverse labels are satisfying proposals from training targets, not runtime features")]
          proposals<-construct cfg pid sel others sk rs
          remaining<-metricD "d_param_combinations"
          let cap=max 0 (sdCombinationBudget cfg-remaining)
              universe=take cap proposals
          traceD levelBranches [("scope",jstr "Composition"),("kind",jstr "proposals"),("stage",jstr "inverse_typed"),("branch_id",jstr pid),("parent_branch_id",jstr "unified")
            ,("proposals_in_universe",show (length universe)),("proposals_beyond_cap",if length (take (cap+1) proposals)>cap then jstr "at_least_1" else "0")
            ,("budget",budgetJ "sdCombinationBudget remaining" cap (length universe) "programs")]
          priorities<-getD dsPriority
          let ps t=case otBody t of Pipeline ss->concatMap params ss; _->[]
              params (Copies a b c)=[a,b,c]
              params (MapPosition a b)=[a,b]
              params (MapColor a)=[a]
              params _=[]
              schedule t=(if sdOrdering cfg then negate (sum [M.findWithDefault 0 p priorities | p<-ps t]) else 0,transformCost t,t)
          if length (take (cap+1) proposals)>cap then incD "d_combination_truncated" 1 else pure ()
          mapM_ (tryProgram cfg "inverse_typed" pid cases) (sortOn schedule universe)
    joint=do
      incD "d_joint_fallback" 1
      let hc=HoleConfig 1 1 0 [0..3] baseOps FeatureAndConstant
          templates=take (16*sdBudgetMultiplier cfg) (enumerateTemplates hc [(l,TyInt) | l<-[WholeCount,WholeColors,CurrentWidth]] TyInt)
          expressions=nub [fillHoles [VI k] (tmExpr tm) | tm<-templates,k<-[1..3]]
          counts=if sdTyped cfg then mapMaybe (either (const Nothing) Just . checkedParam PositiveCount) expressions else closedCountParameters
          deltas=if sdTyped cfg then [(x,y) | off<-[StepRight 1,StepDown 1,StepDiagonal 1],Right (x,y)<-[migrateOffset off]] else closedDeltaPairs
          candidates=[ObjectTransform sel others (Pipeline [Copies n x y]) | (sel,others)<-take 5 selectors,n<-take (12*sdBudgetMultiplier cfg) counts,(x,y)<-deltas]
          m=sdBudgetMultiplier cfg
      -- Separate entry: no inverse labels, grid-verified forward enumeration.
      traceD levelBranches [("scope",jstr "JointForward"),("kind",jstr "entered"),("stage",jstr "joint_forward"),("branch_id",jstr "unified.joint"),("parent_branch_id",jstr "unified")
        ,("trigger",jstr "no train-exact program from inverse plans/extension"),("typed_goal",jstr "none (no scalar labels)")
        ,("grammar",jobj [("param_ast_depth_limit",show (hcDepth hc)),("max_holes",show (hcMaxHoles hc)),("hole_values",jstr "[1..3]"),("operators",jstr (show (hcOps hc))),("leaves",jstr (show [WholeCount,WholeColors,CurrentWidth]))
           ,("deltas",jarr [jstr (renderT show (paramExpr x)++","++renderT show (paramExpr y)) | (x,y)<-deltas])])
        ,("limits",jobj [("templates",budgetJ "16*multiplier" (16*m) (length templates) "A templates")
           ,("count_representatives",budgetJ "12*multiplier" (12*m) (length (take (12*m) counts)) "PositiveCount expressions")
           ,("selectors",budgetJ "first 5 selectors" 5 (length (take 5 selectors)) "selector/others pairs")
           ,("candidates",budgetJ "180*multiplier" (180*m) (length (take (180*m) candidates)) "programs passed to execution")])
        ,("candidates_beyond_limit",if length (take (180*m+1) candidates)>180*m then jstr "at_least_1" else "0")
        ,("count_expressions",jarr [jstr (renderT show (paramExpr n)) | n<-take (12*m) counts])]
      executedBefore<-metricD "d_programs_executed"
      mapM_ (tryProgram cfg "joint_forward" "unified.joint" cases) (take (180*sdBudgetMultiplier cfg) candidates)
      executedAfter<-metricD "d_programs_executed"
      fitsAfter<-getD (length . dsFits)
      traceD levelBranches [("scope",jstr "JointForward"),("kind",jstr "completed"),("stage",jstr "joint_forward"),("branch_id",jstr "unified.joint"),("parent_branch_id",jstr "unified")
        ,("programs_executed",show (executedAfter-executedBefore)),("train_exact_programs",show fitsAfter)
        ,("outcome",jstr (if fitsAfter>0 then "fit" else "no_fit"))]

concatWithComma :: [String] -> String
concatWithComma []=""
concatWithComma (x:xs)=x++concatMap (',' :) xs

-- A finite, target-independent forward extension, using only existing steps.
-- Visit depth layers and category skeletons before parameter alternatives.
-- Selection is a prepass. Identity steps occupy grammar slots conservatively.
extensionPrograms :: StageD -> [(Selector,Others)] -> [Int] -> [ObjectTransform]
extensionPrograms cfg selectors _colors=
  interleave [[ObjectTransform sel others (Pipeline steps)
    | ss<-skeletons d,(sel,others)<-selectors,steps<-sequence ss]
    | d<-[3..min 4 (sdComposeDepth cfg)]]
  where
    interleave xs=case filter (not . null) xs of []->[]; ys->map head ys++interleave (map tail ys)
    integer e=either error id (checkedParam IntegerParam e)
    color n=either error id (checkedParam ArcColor (TConst (VI n)))
    move=[MapPosition (integer x) (integer y) | x<-take 12 (drop 9 (fixedExpressions "x")),y<-take 12 (drop 9 (fixedExpressions "y"))]
    recolor=[MapColor (color n) | n<-[0..9]]
    shape=[LegacyStep (Hollow 1),LegacyStep FillBBox]
    copy=[Copies n x y | n<-closedCountParameters,(x,y)<-closedDeltaPairs]
    -- Ordered skeleton layers include all distinct category words. Adjacent
    -- identical categories omitted: such grammar is explicit, not exhaustive TSL.
    categories=[recolor,shape,move,copy]
    skeletons d=map (map (categories!!)) (nub ([take d [0,1,2,3]]++[ids | ids<-sequence (replicate d [0..3]),and (zipWith (/=) ids (drop 1 ids))]))
