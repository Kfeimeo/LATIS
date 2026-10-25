-- Stage D: bounded, grid-constrained composition over A terms and B snapshots.
module Synthesis.Collection.Unified
  ( StageD(..), stageDOff, stageDFull, DCase(..), DResult(..), TypedGoal(..), GoalAudit(..)
  , searchUnified, dMetricNames, fixedExpressions, closedDeltaPairs, closedCountParameters
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

data StageD = StageD
  { sdEnabled, sdTyped, sdCompose, sdVSA, sdOrdering :: Bool
  , sdGoalBudget, sdTotalParamBudget, sdCaseBudget, sdCombinationBudget :: Int
  , sdSkeletonBudget, sdMaxFits, sdParamReps, sdTemplateBudget :: Int
  } deriving (Eq,Show)
stageDOff, stageDFull :: StageD
stageDOff=StageD False False False False False 40000 180000 4000 2000 96 16 32 20000
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
instance Monad DM where DM g >>= f=DM (\s->let (a,s')=g s in unDM (f a) s')
getD :: (DS -> a) -> DM a
getD f=DM (\s->(f s,s))
change :: (DS -> DS) -> DM ()
change f=DM (\s->((),f s))
incD :: String -> Int -> DM ()
incD k n=change (\s->s {dsM=M.insertWith (+) k n (dsM s)})
metricD :: String -> DM Int
metricD k=getD (M.findWithDefault 0 k . dsM)
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

goal :: StageD -> String -> [Row] -> DM [Param]
goal cfg role rs=do
  incD "d_parameter_goals" 1
  let ctx r=if role `elem` ["x","y"] then rBeforeMove r else rContext r
      visible=if sdTyped cfg then leavesFor role else nub (concatMap tLeaves (fixedExpressions role))
      labels=[(ctx r,VI (rValues r M.! role)) | r<-rs]
      key=show (role,[(O.objectId (pcCurrent (ctx r)),map O.objectId (pcSelected (ctx r)),map (evalLeaf (ctx r)) visible,rValues r M.! role) | r<-rs],sdTyped cfg)
  cached<-getD (M.lookup key . dsCache)
  case cached of
    Just ps->incD "d_goal_cache_hits" 1 >> pure ps
    Nothing->do
      used<-metricD "d_typed_evaluations"
      let available=max 0 (min (sdGoalBudget cfg) (sdTotalParamBudget cfg-used))
          reserve=9*length labels+2 -- A checks a complete <=1-hole template atomically
          ready=available>reserve
          -- Bound the candidate universe before either B schedule is applied.
          hc=HoleConfig 2 1 (max 0 (available-reserve)) [-4..4] (baseOps++parityOps++enumeratedBoolOps) FeatureAndConstant
          leaves=visible
          allTemplates=if ready then enumerateTemplates hc [(l,TyInt) | l<-leaves] TyInt else []
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
          checked=take 4096 trials
          checkedCount=foldl' (\n e->eStatus e `seq` (n+1)) 0 checked
          edges=take 128 [e | e<-checked,eStatus e `elem` [Confirmed,PendingDependency]]
          -- Case agreement is never an e-class merge. Edges only schedule.
          priority p=sum [if eStatus e==Confirmed then 2 else 1 | e<-edges,swAfter (eStructural e)==normalize (liPartial paramInfo) (lambdaFromTyped (paramExpr p))]
          sharing=if sdVSA cfg then SharedParamVSA else NoParamVSA
          (matches,evalWork)=fitPool sharing pool labels
          survivors=[p | p<-kept,p `elem` matches]
          refWork=sum [sum (map (tLength . paramExpr) kept) | _<-labels]
          truncated=not ready || trTruncated raw || (sdTyped cfg && length allTemplates>sdTemplateBudget cfg) || not (null deferred)
          status | not ready="truncated: global parameter budget"
                 | truncated="truncated"
                 | null matches="no-fit"
                 | otherwise="fit"
          spec=TypedGoal role (refinementFor role) leaves 2 available key
          guards=nub [condition | term<-terms,LApp OpIf (condition:_)<-subterms term]
          boolSpec=TypedGoal (role++".condition") BooleanParam leaves 1 0 key
          boolAudit=GoalAudit (role++".condition") (show boolSpec)
              (map (show . lambdaToTyped) guards) [] [] [] 0 0 0 "embedded Bool subgoal: parent grid constraint; nodes/evaluations charged once to parent" (mapMaybe lambdaToTyped guards)
          audit=GoalAudit role (show spec) (map (show . paramExpr) kept)
              (["regenerable template frontier "++show (trTemplatesTried raw)++"/"++show (length allTemplates) | truncated]++map (show . paramExpr) deferred)
              [map bindingText (cBindings c) | c<-trFits raw,cExpr c `elem` map paramExpr kept]
              (map (edgeText show) edges) (vsaNodeCount (ppDAG pool)) (if sdVSA cfg then evalWork else 0) refWork status (map paramExpr kept)
      incD "d_typed_evaluations" (trEvaluations raw)
      incD "d_param_truncated" (if truncated then 1 else 0)
      incD "d_vsa_nodes" (vsaNodeCount (ppDAG pool))
      incD "d_vsa_classes" (if null kept || not (sdVSA cfg) then 0 else 1)
      incD "d_vsa_edges" (length edges)
      incD "d_vsa_edge_checks" checkedCount
      incD "d_vsa_edge_truncated" (if length (take 4097 trials)>4096 then 1 else 0)
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

construct :: StageD -> Selector -> Others -> Skeleton -> [Row] -> DM [ObjectTransform]
construct cfg sel others sk rs=do
  let g name=goal cfg name rs
      wrap ss=ObjectTransform sel others (Pipeline ss)
  steps<-case sk of
    CopyOnly->do n<-g "count"; x<-g "dx"; y<-g "dy"; pure [[Copies a b c] | a<-n,b<-x,c<-y,sdTyped cfg || (b,c) `elem` closedDeltaPairs]
    MoveCopy->do x<-g "x"; y<-g "y"; n<-g "count"; dx<-g "dx"; dy<-g "dy"; pure [[MapPosition a b,Copies c d e] | a<-x,b<-y,c<-n,d<-dx,e<-dy,sdTyped cfg || (d,e) `elem` closedDeltaPairs]
    ColorMove->do c<-g "color"; x<-g "x"; y<-g "y"; pure [[MapColor a,MapPosition b d] | a<-c,b<-x,d<-y]
    ShapeMove p->do x<-g "x"; y<-g "y"; pure [[LegacyStep p,MapPosition a b] | a<-x,b<-y]
    ColorOnly->do c<-g "color"; pure [[MapColor a] | a<-c]
    MoveOnly->do x<-g "x"; y<-g "y"; pure [[MapPosition a b] | a<-x,b<-y]
  pure (map wrap steps)

tryProgram :: StageD -> [DCase] -> ObjectTransform -> DM ()
tryProgram cfg cases t=do
  seen<-getD (S.member t . dsSeen)
  combinations<-metricD "d_param_combinations"
  fits<-getD (length . dsFits)
  caseWork<-metricD "d_case_executions"
  if seen then pure () else if caseWork>=sdCaseBudget cfg then incD "d_case_truncated" 1 else if combinations>=sdCombinationBudget cfg || fits>=sdMaxFits cfg then incD "d_combination_truncated" 1 else do
    change (\s->s {dsSeen=S.insert t (dsSeen s)})
    incD "d_param_combinations" 1
    incD "d_programs_enumerated" 1
    let composed=case otBody t of Pipeline ss->length ss>=2; _->False
    if composed then incD "d_composed_enumerated" 1 else pure ()
    incD "d_programs_executed" 1
    if composed then incD "d_composed_executed" 1 else pure ()
    ok<-check cases
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
    check []=pure True
    check (c:cs)=do
      used<-metricD "d_case_executions"
      if used>=sdCaseBudget cfg then incD "d_case_truncated" 1 >> pure False else do
        incD "d_case_executions" 1
        case executePipeline t (O.canvas (dInput c)) (dOutputDims c) (O.objects (dInput c)) of
          Left _->pure False
          Right w->case renderWitness (dOutputDims c) (O.background (dInput c)) (pwEmitted w) of
            Left _->pure False
            Right rw | renderResult rw==dTarget c->do
              incD "d_witness_replays" 1
              let valid=verifyPipeline t (O.canvas (dInput c)) (dOutputDims c) (O.objects (dInput c)) w
                        && verifyRenderWitness (dOutputDims c) (O.background (dInput c)) (pwEmitted w) rw
              if valid then incD "d_witness_valid" 1 >> incD "d_render_valid" 1 >> check cs
                else incD "d_witness_failures" 1 >> pure False
            _->pure False

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
      incD "d_triggered" 1
      incD "d_skeleton_truncated" (if length plans>sdSkeletonBudget cfg then 1 else 0)
      mapM_ plan (take (sdSkeletonBudget cfg) plans)
      -- The joint fallback has no scalar labels: enumerate A templates with
      -- bounded shared constants, then verify complete training grids.
      fitCount<-getD (length . dsFits)
      if fitCount==0 then joint else pure ()
    plan (sel,others,sk,rev)=do
      incD "d_skeletons" 1
      case inverseRows sel others sk rev cases of
        Left reason->do
          incD "d_inverse_not_applicable" 1
          change (\s->s {dsT=(show (sel,others,sk)++": not-applicable: "++reason):dsT s})
        Right rs->do
          change (\s->s {dsT=("inverse proposal witness: "++show (sel,others,sk,rev)++"; unique source / arithmetic copy role per case: "++show [(O.objectId (pcCurrent (rContext r)),rValues r) | r<-rs]):dsT s})
          proposals<-construct cfg sel others sk rs
          remaining<-metricD "d_param_combinations"
          let cap=max 0 (sdCombinationBudget cfg-remaining)
              universe=take cap proposals
          priorities<-getD dsPriority
          let ps t=case otBody t of Pipeline ss->concatMap params ss; _->[]
              params (Copies a b c)=[a,b,c]
              params (MapPosition a b)=[a,b]
              params (MapColor a)=[a]
              params _=[]
              schedule t=(if sdOrdering cfg then negate (sum [M.findWithDefault 0 p priorities | p<-ps t]) else 0,transformCost t,t)
          if length (take (cap+1) proposals)>cap then incD "d_combination_truncated" 1 else pure ()
          mapM_ (tryProgram cfg cases) (sortOn schedule universe)
    joint=do
      incD "d_joint_fallback" 1
      let hc=HoleConfig 1 1 0 [0..3] baseOps FeatureAndConstant
          templates=take 16 (enumerateTemplates hc [(l,TyInt) | l<-[WholeCount,WholeColors,CurrentWidth]] TyInt)
          expressions=nub [fillHoles [VI k] (tmExpr tm) | tm<-templates,k<-[1..3]]
          counts=if sdTyped cfg then mapMaybe (either (const Nothing) Just . checkedParam PositiveCount) expressions else closedCountParameters
          deltas=if sdTyped cfg then [(x,y) | off<-[StepRight 1,StepDown 1,StepDiagonal 1],Right (x,y)<-[migrateOffset off]] else closedDeltaPairs
          candidates=[ObjectTransform sel others (Pipeline [Copies n x y]) | (sel,others)<-take 5 selectors,n<-take 12 counts,(x,y)<-deltas]
      mapM_ (tryProgram cfg cases) (take 180 candidates)
