module ARC.StageDEvaluate
  ( namedConfigsD, configByNameD, configNamesD, fullD, stageDMetricsJSON, goalsJSON, witnessesJSON ) where
import Synthesis.Collection.Front
import Synthesis.Collection.Unified
import ARC.StageAEvaluate (fullA)
import ARC.StageBEvaluate (fullB)
import ARC.StageCEvaluate (objectShapeFull)
import ARC.Evaluate (jsonString)
import ARC.InducedR1Evaluate (objectJSON,arrayJSON)
import ARC.InducedR1Evaluate (boolJSON)
import Synthesis.Collection.Relation
import Synthesis.Collection.Shape (applyDiagonalView)
import Latent.Grid
import Latent.Encode (encode)
import qualified Latent.Object as O
import Synthesis.Collection.Parameter
import Synthesis.Collection.Typed

fullD :: Config
fullD=objectShapeFull {stageD=stageDFull}
namedConfigsD :: [(String,Config)]
namedConfigsD=
  [("BaselineA",fullA),("BaselineB",fullB),("BaselineC",objectShapeFull)
  ,("TypedParamsOnly",fullD {stageD=stageDFull {sdCompose=False,sdVSA=False,sdOrdering=False}})
  ,("ComposeOnly",fullD {stageD=stageDFull {sdTyped=False,sdVSA=False,sdOrdering=False}})
  ,("TypedCompose",fullD {stageD=stageDFull {sdVSA=False,sdOrdering=False}})
  ,("FullD",fullD),("NoParamVSA",fullD {stageD=stageDFull {sdVSA=False,sdOrdering=False}})
  ,("NoReferentOrdering",fullD {stageD=stageDFull {sdOrdering=False}})]++
  [(name, scaling mult cd pd diag) | (name,mult,cd,pd,diag)<-
    [("D0_Frozen",1,2,2,True),("D0_Off",1,2,2,False),("Budget4x",4,2,2,True)
    ,("Compose3",1,3,2,True),("Param3",1,2,3,True),("Combined3_4x",4,3,3,True)
    ,("Extended4_8x",8,4,3,True)]]
  -- Content-first OutputSpec configurations (ARC.ContentFirstEvaluate reads them
  -- back): FrozenD is D0_Frozen (content-first off), ContentFirstOnly adds the
  -- content-first fallback only, ContentFirstExploreAlternatives also records the
  -- content-first representatives after a Size-first first solution.
  ++[("FrozenD",d0),("ContentFirstOnly",d0 {contentFirst=contentFirstOn}),("ContentFirstExploreAlternatives",d0 {contentFirst=contentFirstOn {cfExploreAlternatives=True}})]
  -- Stage E0/E1 (ARC.ContentFirstEvaluate reads them back): FrozenCF is
  -- ContentFirstOnly (22/400 baseline), BackgroundViewsOnly adds the explicit
  -- background views, GeometryFeaturesOnly the rectangle-count predicates and
  -- geometry witnesses on the legacy view, FullE01 both.
  -- The background views multiply the plan universe by 4 and the geometry
  -- predicates add 6 predicates, so the three new configurations get a
  -- larger, declared content-first plan/execution budget (FrozenCF keeps the
  -- 400/4000 of ContentFirstOnly; the Size-first budgets are unchanged).
  ++[("FrozenCF",d0 {contentFirst=contentFirstOn}),("BackgroundViewsOnly",d0 {contentFirst=contentFirstOn {cfViews=True,cfPlanBudget=1600,cfExecutionBudget=12000}})
    ,("GeometryFeaturesOnly",d0 {contentFirst=contentFirstOn {cfGeometry=True,cfPlanBudget=600,cfExecutionBudget=6000}}),("FullE01",d0 {contentFirst=contentFirstOn {cfViews=True,cfGeometry=True,cfPlanBudget=2400,cfExecutionBudget=16000}})]
  -- Stage E2/E3: FrozenE01 = FullE01; the others add the region search after
  -- the content-first path with the named scheduling/pruning switches.
  ++[("FrozenE01",e01),("E2Only",e01 {regionSearch=regionConfigOn {rcRegionFirst=False,rcBreadth=False,rcSafePrune=False}})
    ,("RegionPriority",e01 {regionSearch=regionConfigOn {rcBreadth=False,rcSafePrune=False}}),("BreadthScheduler",e01 {regionSearch=regionConfigOn {rcRegionFirst=False,rcSafePrune=False}})
    ,("RegionBreadth",e01 {regionSearch=regionConfigOn {rcSafePrune=False}}),("FullE3",e01 {regionSearch=regionConfigOn})
    ,("FullE3_NoMDL",e01 {regionSearch=regionConfigOn {rcMDL=False,rcMDLRecord=False}}),("FullE3_NoSafePrune",e01 {regionSearch=regionConfigOn {rcSafePrune=False}})]
  -- Stage E3.1 (ARC.ContentFirstEvaluate.namedConfigsE31): one final binary,
  -- the same universe, budgets and E3 scheduler; the switches are
  -- rcPrecheck (input-side selector precheck), rcLazyMDL (exact per-task
  -- shape cache), rcMDL/rcMDLRecord (MDL used for view order / recorded),
  -- rcSafePrune, rcSelectorPriority (scheduling-only), rcRegionFirst.
  -- E31_PatchedBaseline == FullE3 on the patched sources (the regression
  -- check against the E3 frozen records); E31_FullCostOrder is the
  -- cost-only candidate order (no size class) for the PriorityVsBreadth matrix.
  ++[("E31_PatchedBaseline",e01 {regionSearch=regionConfigOn})
    ,("E31_PrecheckOnly",e01 {regionSearch=regionConfigOn {rcPrecheck=True}})
    ,("E31_LazyMDLOnly",e01 {regionSearch=regionConfigOn {rcLazyMDL=True}})
    ,("E31_Full",e01 {regionSearch=e31})
    ,("E31_FullNoMDL",e01 {regionSearch=e31 {rcMDL=False,rcMDLRecord=False}})
    ,("E31_FullNoSafePrune",e01 {regionSearch=e31 {rcSafePrune=False}})
    ,("E31_FullSelectorPriority",e01 {regionSearch=e31 {rcSelectorPriority=True}})
    ,("E31_FullCostOrder",e01 {regionSearch=e31 {rcRegionFirst=False}})]
  where
    d0=scaling 1 2 2 True
    e01=d0 {contentFirst=contentFirstOn {cfViews=True,cfGeometry=True,cfPlanBudget=2400,cfExecutionBudget=16000}}
    e31=regionConfigOn {rcPrecheck=True,rcLazyMDL=True}
    scaling m cd pd diag=fullD
      { alignmentBudget=alignmentBudget fullD*m,scalarBudget=scalarBudget fullD*m
      , stageA=(stageA fullD) {saHoleBudget=saHoleBudget (stageA fullD)*m,saTotalHoleBudget=saTotalHoleBudget (stageA fullD)*m}
      , stageC=(stageC fullD) {scRelationBudget=scRelationBudget (stageC fullD)*m,scRelationMaxCandidates=scRelationMaxCandidates (stageC fullD)*m,scRelationMaxFits=scRelationMaxFits (stageC fullD)*m}
      , stageD=stageDFull {sdDiagnostics=diag,sdComposeDepth=cd,sdParamDepth=pd,sdBudgetMultiplier=m
        ,sdGoalBudget=sdGoalBudget stageDFull*m,sdTotalParamBudget=sdTotalParamBudget stageDFull*m
        ,sdCaseBudget=sdCaseBudget stageDFull*m,sdCombinationBudget=sdCombinationBudget stageDFull*m
        ,sdSkeletonBudget=sdSkeletonBudget stageDFull*m,sdMaxFits=sdMaxFits stageDFull*m
        ,sdParamReps=sdParamReps stageDFull*m,sdTemplateBudget=sdTemplateBudget stageDFull*m} }
configByNameD :: String -> Maybe Config
configByNameD n=lookup n namedConfigsD
configNamesD :: [String]
configNamesD=map fst namedConfigsD
stageDMetricsJSON :: Graph -> String
stageDMetricsJSON g=objectJSON [(k,show (metric k g)) | k<-dMetricNames]
goalsJSON :: Graph -> String
goalsJSON g=arrayJSON [objectJSON
  [("role",jsonString (gaRole a)),("contexts",jsonString (gaContexts a))
  ,("expressions",arrayJSON (map expressionJSON (gaExpressions a)))
  ,("candidates",arrayJSON (map jsonString (gaCandidates a))),("deferred",arrayJSON (map jsonString (gaDeferred a)))
  ,("bindings",arrayJSON (map (arrayJSON . map jsonString) (gaBindings a)))
  ,("edges",arrayJSON (map jsonString (gaEdges a))),("nodes",show (gaNodes a))
  ,("dag_evaluations",show (gaEvaluations a)),("reference_evaluations",show (gaReference a)),("status",jsonString (gaStatus a))] | a<-dGoals g]

valueJSON :: TVal -> String
valueJSON (VI n)=objectJSON [("type",jsonString "Int"),("value",show n)]
valueJSON (VB b)=objectJSON [("type",jsonString "Bool"),("value",boolJSON b)]
expressionJSON :: TExpr ParamLeaf -> String
expressionJSON (TLeaf l)=objectJSON [("leaf",jsonString (show l)),("type",jsonString "Int")]
expressionJSON (TConst v)=objectJSON [("constant",valueJSON v)]
expressionJSON (THole i)=objectJSON [("unfilled_hole",show i)]
expressionJSON (TApp op args)=objectJSON [("operator",jsonString (opName op)),("arguments",arrayJSON (map expressionJSON args)),("type",jsonString (show (snd (opSignature op))))]
stepJSON :: TransformStep -> String
stepJSON step=objectJSON [("operation",jsonString name),("parameters",arrayJSON [objectJSON [("refinement",jsonString (show (paramRefinement p))),("expression",expressionJSON (paramExpr p))] | p<-parameters])]
  where (name,parameters)=case step of
          MapPosition x y->("MapPosition",[x,y])
          MapColor c->("MapColor",[c])
          Copies n x y->("Copies",[n,x,y])
          _->(show step,[])
emissionJSON :: EmittedObject -> String
emissionJSON e=objectJSON [("sources",show (eoSources e)),("role",jsonString (eoOrigin e)),("position",show [cx (O.position o),cy (O.position o)]),
  ("size_sig",show [O.width o,O.height o]),("pixels",arrayJSON [show [cx p,cy p,c] | (p,c)<-O.absolutePixels o])]
  where o=eoObject e

witnessesJSON :: [(Grid,Grid)] -> Maybe Program -> String
witnessesJSON _ Nothing="[]"
witnessesJSON pairs (Just p)=arrayJSON [one input target | (input,target)<-pairs]
  where
    one input target=case runProgramEvidence p input of
      Left e->objectJSON [("valid","false"),("error",jsonString e)]
      Right (es,rw)->
        let original=encode (progEncoder p) input
            ins=if progView p then let (os,_,_)=applyDiagonalView (O.objects original) in os else O.objects original
            output=O.objects (encode (progEncoder p) target)
            rel=relationWitness ins es output
            dims=dimensions (renderResult rw)
            transform=case progTransform p of
              Just t->case otBody t of
                Pipeline _->executePipeline t (dimensions input) dims ins
                MigratedBody _ _->executePipeline t (dimensions input) dims ins
                _->migrateTransform t >>= \mt->executePipeline mt (dimensions input) dims ins
              Nothing->Right (PipelineWitness [StepWitness 0
                [EmittedObject o [O.objectId o] "input OrderedView binder" | e<-es,o<-ins,eoSources e==[O.objectId o]] es
                [[VI (cx (O.position (eoObject e))),VI (cy (O.position (eoObject e)))] | e<-es]] es)
            valid=case transform of
              Left _->False
              Right w->map eoObject (pwEmitted w)==map eoObject es && map eoSources (pwEmitted w)==map eoSources es
            instructions=case progTransform p of
              Just t->case otBody t of Pipeline ss->ss; MigratedBody _ ss->ss; _->[]
              Nothing->[]
            steps=case transform of
              Left _->[]
              Right w->[objectJSON [("ordinal",show (swStep s)),("instruction",if swStep s<length instructions then stepJSON (instructions!!swStep s) else jsonString "legacy migration")
                ,("input",arrayJSON (map emissionJSON (swInput s))),("output",arrayJSON (map emissionJSON (swOutput s)))
                ,("bindings",arrayJSON (map (arrayJSON . map valueJSON) (swBindings s)))] | s<-pwSteps w]
        in objectJSON
          [("transform_witness_valid",boolJSON valid),("render_witness_valid",boolJSON (verifyRenderWitness dims (O.background original) es rw))
          ,("train_exact",boolJSON (renderResult rw==target)),("render_exact",boolJSON (renderResult rw==target))
          ,("object_count_exact",boolJSON (length es==length output)),("emitted_object_exact",boolJSON (rwUnmatchedEmitted rel==0 && null (rwUnexplainedOutputs rel)))
          ,("transform",jsonString (show transform)),("width",show (gridWidth dims)),("height",show (gridHeight dims))
          ,("derivation_steps",arrayJSON steps)
          ,("input_objects",arrayJSON [emissionJSON (EmittedObject o [O.objectId o] "input") | o<-ins])
          ,("selector",maybe (jsonString "OrderedView sequence binder") (jsonString . show . otSelector) (progTransform p))
          ,("others",maybe "null" (jsonString . show . otOthers) (progTransform p))
          ,("background",show (O.background original)),("source_ids",show (map O.objectId ins))
          ,("emissions",arrayJSON [objectJSON [("ordinal",show i),("sources",show (eoSources e)),("role",jsonString (eoOrigin e)),("pixels",arrayJSON [show [cx xy,cy xy,col] | (xy,col)<-O.absolutePixels (eoObject e)])] | (i,e)<-zip [0::Int ..] es])
          ,("grid",show (rows (renderResult rw)))]
