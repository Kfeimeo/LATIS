-- Content-first OutputSpec: named configurations and the JSON evidence
-- (runs, candidates, selection/OutputSpec witnesses, per-pair execution
-- witnesses of the selected program). Observation only: nothing here feeds
-- back into the search.
module ARC.ContentFirstEvaluate
  ( frozenD, contentFirstOnly, contentFirstExplore, namedConfigsCF, configByNameCF, configNamesCF
  , contentFirstJSON, finalClassification, programSceneCF, programSpecsCF, planFromProgram, crossCaseOf
  , configNamesE01, namedConfigsE01, namedConfigsE23, configNamesE23, namedConfigsE31, configNamesE31, namedConfigsE4, configNamesE4, regionJSONOf, outputSkeletonJSONOf
  ) where
import Synthesis.Collection.Region.Search (regionSearchJSON)
import Synthesis.Collection.Output.Induce (induceJSON)
import Synthesis.Collection.Region.Program (programJSON, runRegionProgram, regionExecJSON, RegionExec(..))
import Synthesis.Collection.Region.Partition (defaultPartitionBudget)
import Synthesis.Collection.Geometry.Features (CaseBinding(..), CrossCaseWitness, crossCaseWitness, crossCaseJSON, GeometryWitness(..), RegionProvenance(..))
import Synthesis.Collection.Geometry.Cover (BoundsE(..), Rect(..))
import Synthesis.Collection.Front
import Synthesis.Collection.ContentFirst
import Synthesis.Collection.Shape (applyDiagonalView)
import Synthesis.Collection.Diagnostics (jstr, jobj, jarr, jbool, jmaybe)
import ARC.StageDEvaluate (configByNameD)
import Latent.Grid
import Latent.Encode (encode, encoderBackground)
import Synthesis.Collection.Geometry.View (ViewId(..))
import qualified Latent.Object as O
import Data.Maybe (fromMaybe)

-- FrozenD is the accepted Stage D configuration with the D+ diagnostics on
-- (D0_Frozen); the content-first block is off, so the search is byte-for-byte
-- the Size-first one. ContentFirstOnly adds only the content-first fallback
-- (same A/B/C/D budgets and grammar). ContentFirstExploreAlternatives also
-- enumerates the content-first representatives after a Size-first first
-- solution (recorded as alternatives; the first solution is kept).
frozenD, contentFirstOnly, contentFirstExplore :: Config
frozenD=fromMaybe (error "FrozenD missing") (configByNameD "FrozenD")
contentFirstOnly=fromMaybe (error "ContentFirstOnly missing") (configByNameD "ContentFirstOnly")
contentFirstExplore=fromMaybe (error "ContentFirstExploreAlternatives missing") (configByNameD "ContentFirstExploreAlternatives")
namedConfigsCF :: [(String,Config)]
namedConfigsCF=[("FrozenD",frozenD),("ContentFirstOnly",contentFirstOnly),("ContentFirstExploreAlternatives",contentFirstExplore)]
configByNameCF :: String -> Maybe Config
configByNameCF n=lookup n namedConfigsCF
configNamesCF :: [String]
configNamesCF=map fst namedConfigsCF

-- The scene exactly as runProgram encodes an input (encoder, diagonal view,
-- enumeration permutation).
programSceneCF :: Program -> Grid -> O.Scene
programSceneCF p g=
  let s0=encode (progEncoder p) g
      s1=if progView p then let (os,_,_)=applyDiagonalView (O.objects s0) in s0 {O.objects=os} else s0
  in s1 {O.objects=permuteObjects (progPermutation p) (O.objects s1)}
planFromProgram :: Maybe Program -> Maybe ContentFirstPlan
planFromProgram p=p >>= progContentFirst
-- Per training pair: the OutputSpec the selected content-first program derives
-- from the INPUT (the target is used only for the exact flag).
programSpecsCF :: [(Grid,Grid)] -> Program -> [(Either String OutputSpec,Bool)]
programSpecsCF pairs p=case progContentFirst p of
  Nothing->[]
  Just plan->[let r=deriveOutputSpec deriveWithGeometry plan (encoderBackground (progEncoder p)) x (programSceneCF p x)
                  ok=either (const False) (\s->renderOutputSpec (encoderBackground (progEncoder p)) s==Right y) r
              in (r,ok) | (x,y)<-pairs]

namedConfigsE01 :: [(String,Config)]
namedConfigsE01=[(n,c) | n<-["FrozenCF","BackgroundViewsOnly","GeometryFeaturesOnly","FullE01"], Just c<-[configByNameD n]]
namedConfigsE23 :: [(String,Config)]
namedConfigsE23=[(n,c) | n<-["FrozenE01","E2Only","RegionPriority","BreadthScheduler","RegionBreadth","FullE3","FullE3_NoMDL","FullE3_NoSafePrune"], Just c<-[configByNameD n]]
configNamesE23 :: [String]
configNamesE23=map fst namedConfigsE23
-- Stage E3.1 matrix (one binary): FrozenE01 as the negative control plus the
-- eight region configurations of StageDEvaluate.
namedConfigsE31 :: [(String,Config)]
namedConfigsE31=[(n,c) | n<-configNamesE31, Just c<-[configByNameD n]]
namedConfigsE4 :: [(String,Config)]
namedConfigsE4=[(n,c) | n<-configNamesE4, Just c<-[configByNameD n]]
configNamesE4 :: [String]
configNamesE4=["E4_Off","E4_OutputSkeletonOnly","E4_NoCrossOutput","E4_PairwiseOnly","E4_NoMDLScore","E4_SingleExplanation","E4_NoStructuralSharing"]
configNamesE31 :: [String]
configNamesE31=["FrozenE01","E31_PatchedBaseline","E31_PrecheckOnly","E31_LazyMDLOnly","E31_Full","E31_FullNoMDL","E31_FullNoSafePrune","E31_FullSelectorPriority","E31_FullCostOrder"]

-- Stage E4 output-skeleton record of one run (null when the sidecar never ran).
outputSkeletonJSONOf :: Graph -> String
outputSkeletonJSONOf g=jmaybe induceJSON (outputSkeletonRun g)

-- Region-search evidence of one run: the search record and, for a region
-- program, its per-pair execution (read/write regions, output dims, exact).
regionJSONOf :: [(Grid,Grid)] -> Graph -> Maybe Program -> String
regionJSONOf pairs g p=jobj
  [("run",jmaybe regionSearchJSON (regionRun g))
  ,("selected_program",jmaybe programJSON (p >>= progRegion))
  ,("executions",case p >>= progRegion of
      Nothing->"[]"
      Just rp->jarr [either (\e->jobj [("pair_index",show i),("error",jstr e)]) (\r->jobj [("pair_index",show i),("exec",regionExecJSON r),("exact",jbool (reOutputEq r y))]) (runRegionProgram defaultPartitionBudget rp x) | (i,(x,y))<-zip [0::Int ..] pairs])]
  where reOutputEq r y=reOutputOf r==y
        reOutputOf=Synthesis.Collection.Region.Program.reOutput

configNamesE01 :: [String]
configNamesE01=map fst namedConfigsE01

-- Cross-case witness of the selected content-first program: input-side
-- bindings per case, the training target only for the exact flag.
crossCaseOf :: [(Grid,Grid)] -> Program -> Maybe CrossCaseWitness
crossCaseOf pairs p=case progContentFirst p of
  Nothing->Nothing
  Just plan->Just (crossCaseWitness (planText plan)
    [CaseBinding i (oswView w) (oswBgOf w) (swMatched (oswSelection w)) (boundsE (swBounds (oswSelection w))) (osDims s) (rectCountOf w) (Just ok)
    | (i,(Right s,ok))<-zip [0::Int ..] (programSpecsCF pairs p), let w=osWitness s])
  where
    boundsE (Bounds x0 y0 x1 y1)=PixelBounds (Rect x0 y0 x1 y1)
    oswBgOf w=if oswView w==LegacyView then Just (oswCanvasFill w) else rpBackground (oswProvenance w)
    rectCountOf w=case oswGeometry w of
      Just gs | not (null gs) && all ((/="bounded") . gwStatus) gs->Right (sum (map (length . gwRects) gs))
      Just _->Left "rectangle count not proven for every selected member"
      Nothing->Left "geometry witness not computed"

finalClassification :: Graph -> Maybe Program -> String
finalClassification g p=case (planFromProgram p,[r | r<-contentFirstRuns g, cfrRole r=="solution"],contentFirstRuns g) of
  (Just _,r:_,_)->cfrClassification r
  (Just _,[],_)->"content_first_program_without_run_record"
  (Nothing,r:_,_)->cfrClassification r
  (Nothing,[],r:_)->cfrClassification r
  (Nothing,[],[])->if metric "cf_deferred_plans" g>0 then "content_first_deferred_legacy_first_solution" else "content_first_not_entered"

candidateJSON :: CFCandidate -> String
candidateJSON c=jobj
  [("plan",planJSON (ccPlan c)),("enumeration_index",show (ccIndex c)),("status",jstr (ccStatus c))
  ,("selections",jarr [either (\e->jobj [("case_index",show i),("legal",jbool False),("reason",jstr e)])
                        (\w->jobj [("case_index",show i),("legal",jbool True),("matched_ids",show (swMatched w)),("cardinality",show (length (swMatched w))),("evidence",jstr (swEvidence w))
                                  ,("bounds",jarr (map show [bMinX (swBounds w),bMinY (swBounds w),bMaxX (swBounds w),bMaxY (swBounds w)])),("dims",let Dimensions w' h'=boundsDims (swBounds w) in jarr [show w',show h'])]) s
                      | (i,s)<-zip [0::Int ..] (ccSelections c)])
  ,("cases",jarr [jobj [("case_index",show (cftCase t)),("outcome",jstr (cftOutcome t)),("reason",jstr (cftReason t))
                       ,("output_spec",jmaybe specWitnessJSON (cftSpec t))
                       ,("grid_dims",jmaybe (\gr->let Dimensions w h=dimensions gr in jarr [show w,show h]) (cftGrid t))] | t<-ccCases c])]

runJSON :: CFRun -> String
runJSON r=
  let res=cfrResult r
  in jobj [("trigger",jstr (triggerText (cfrTrigger r))),("size_first_status",jstr (sizeFirstStatusText (cfrSizeFirstStatus r))),("prior_failure",jstr (cfrPriorFailure r))
          ,("role",jstr (cfrRole r)),("classification",jstr (cfrClassification r)),("selected_plan",jmaybe planJSON (cfrSelected r))
          ,("plan_universe",show (crUniverse res)),("plans_tried",show (crTried res)),("selection_evaluations",show (crSelectionEvaluations res))
          ,("selection_legal_plans",show (crSelectionLegalPlans res)),("case_executions",show (crExecutions res)),("specs_derived",show (crSpecsDerived res))
          ,("rendered",show (crRendered res)),("fits",show (length (crFits res))),("fit_plans",jarr [planJSON (ccPlan c) | c<-crFits res])
          ,("truncated",jbool (crTruncated res)),("truncation_reason",jmaybe jstr (crTruncationReason res)),("first_fit_executions",jmaybe show (crFirstFitExecutions res))
          ,("exhaustiveness_scope",jstr "finite plan universe of this task only")
          ,("candidates",jarr (map candidateJSON (crCandidates res)))]

-- Complete content-first evidence of one front-end run.
contentFirstJSON :: [(Grid,Grid)] -> Graph -> Maybe Program -> String
contentFirstJSON pairs g p=jobj
  [("final_classification",jstr (finalClassification g p))
  ,("selected_plan",jmaybe planJSON (planFromProgram p))
  ,("selected_plan_text",jmaybe (jstr . planText) (planFromProgram p))
  ,("metrics",jobj [(k,show (metric k g)) | k<-cfMetricNames])
  ,("deferred",jarr [jobj [("range",jarr [show (fst (dfRange d)),show (snd (dfRange d))]),("status",jstr (dfStatus d)),("reason",jstr (dfReason d))] | d<-deferred g, dfSlot d=="content-first"])
  ,("runs",jarr (map runJSON (contentFirstRuns g)))
  ,("cross_case_witness",jmaybe crossCaseJSON (p >>= crossCaseOf pairs))
  ,("witnesses",case p of
      Nothing->"[]"
      Just prog->jarr [jobj ([("pair_index",show i),("exact",jbool ok)]++either (\e->[("derived",jbool False),("error",jstr e)]) (\s->[("derived",jbool True),("spec",specJSON (encoderBackground (progEncoder prog)) s)]) r)
                      | (i,(r,ok))<-zip [0::Int ..] (programSpecsCF pairs prog)])]
