module ARC.HierarchicalEvaluate where
import ARC.Dataset
import ARC.Evaluate (jsonString,jsonMaybe,syntheticTasks)
import ARC.JointEvaluate (metricsJSON,jointJSON,taskJSON,stressTasks)
import ARC.LatentStress
import ARC.FailureTaxonomy
import Synthesis.Hierarchical
import Synthesis.Joint
import Synthesis.Constraint.Metrics
import Synthesis.Search (SearchConfig(..))
import Synthesis.MDL
import Latent.Program (LatentProgram(..),exprLength,expand,groundLength)
import Latent.MDL.LatentCost (codecLengths,latentObjective)
import Latent.Serialize (hypothesisJSON,exprJSON,array)
import Latent.Constraint.Propagate (activeHypotheses,hypothesis)
import Data.List (intercalate)
import System.Directory (createDirectoryIfMissing)
import System.FilePath ((</>))
import Control.Exception (evaluate)
import Control.DeepSeq (force)

-- Materialize JSON before retaining the next solver result. Otherwise lazy
-- strings keep whole correspondence states and provenance traces alive across
-- every benchmark mode even though those fields are not in the result JSON.
forceJSON :: String -> IO String
forceJSON = evaluate . force

boolean :: Bool -> String
boolean b=if b then "true" else "false"
heldoutExact :: SearchConfig -> Task -> HierarchicalResult -> Bool
heldoutExact config task r = not (null (tests task)) && all hasOutput (tests task) &&
  maybe False (\p->all (\q->maybe False (\g->predictRoute (encoder config) p (testInput q)==Right g) (testOutput q)) (tests task)) (selectedRoute r)
  where hasOutput q=case testOutput q of Just _->True; _->False
trainingExact :: SearchConfig -> Task -> HierarchicalResult -> Bool
trainingExact config task r=maybe False (\p->all (\(x,y)->predictRoute (encoder config) p x==Right y) (training task)) (selectedRoute r)
metricsV03JSON :: LatentMetrics -> String
metricsV03JSON m="{"++intercalate "," (
  [jsonString k++":"++show (f m) | (k,f)<-
    [("latent_proposals",latentProposals),("local_latent_proposals",localProposals),("global_latent_proposals",globalProposals),("fusion_proposals",fusionProposals),
     ("accepted_latent_hypotheses",acceptedHypotheses),("rejected_latent_hypotheses",rejectedHypotheses),("latent_branch_points",latentBranchPoints),
     ("latent_propagation_steps",latentPropagationSteps),("latent_contradictions",latentContradictions),("decoder_failures",decoderFailures),
     ("reconstruction_failures",reconstructionFailures),("discovery_checks",discoveryChecks),("latent_expression_tests",latentExpressionTests),
     ("exact_verifier_calls",exactVerifierCalls),("total_expanded_states",totalExpanded),("latent_symbols",latentSymbols),
     ("program_symbols_saved",symbolsSaved),("description_units_saved",descriptionsSaved)]]++
  ["\"first_solution_states\":"++jsonMaybe (firstSolutionStates m),"\"wall_clock_seconds\":"++show (wallClock m),
   "\"delta_mdl\":"++jsonMaybe (deltaMDL m),"\"level0_program_cost\":"++jsonMaybe (level0Cost m),
   "\"level1_program_cost\":"++jsonMaybe (level1Cost m),"\"budget_exhausted\":"++boolean (hitBudget m)])++"}"
resultV03JSON :: HierarchicalMode -> SearchConfig -> Task -> HierarchicalResult -> String
resultV03JSON mode config task r="{"++intercalate ","
  ["\"task\":"++jsonString (taskId task),"\"mode\":"++jsonString (show mode),
   "\"route\":"++maybe "null" (jsonString . routeName) (selectedRoute r),
   "\"program\":"++maybe "null" (jsonString . show) (selectedRoute r),
   "\"train_exact\":"++boolean train,"\"heldout_exact\":"++boolean held,
   "\"heldout_available\":"++boolean (all (\q->case testOutput q of Just _->True; _->False) (tests task) && not (null (tests task))),
   "\"failure\":"++jsonString (failureName failure),"\"failure_evidence\":"++jsonString evidence,
   "\"statistics\":"++metricsV03JSON (hierarchicalMetrics r),"\"legacy_statistics\":"++metricsJSON (jointMetrics (level0Result r)),
   "\"objective\":"++maybe "null" (\o->"{\"L\":"++show (descriptionLength o)++",\"K\":"++show (symbolKinds o)++",\"E\":"++show (exceptionPenalty o)++",\"J\":"++show (totalCost o)++"}") (selectedCost r),
   "\"state_budget\":"++show (stateBudget config),"\"correspondence_budget\":"++show (correspondenceBudget config),
   "\"solution_limit\":"++show (solutionLimit config),"\"candidates\":["++intercalate "," (map candidateJSON (latentCandidates r))++"]",
   "\"predictions\":["++intercalate "," [maybe "null" (\p->either (const "null") jsonGrid (predictRoute (encoder config) p (testInput q))) (selectedRoute r) | q<-tests task]++"]"]++"}"
  where train=trainingExact config task r; held=heldoutExact config task r
        (failure,evidence)=classify config task r train held
        candidateJSON c="{\"spec\":"++jsonString (show (candidateSpec c))++",\"program\":"++jsonString (show (candidateProgram c))++
          ",\"exact\":"++boolean (candidateExact c)++",\"J1\":"++show (totalCost (candidateObjective c))++",\"J0_reference\":"++show (totalCost (referenceObjective c))++
          ",\"delta_mdl\":"++show (totalCost (referenceObjective c)-totalCost (candidateObjective c))++
          ",\"full_mdl_J1\":"++show (totalCost (latentObjective False (candidateSpec c) (candidateProgram c)))++
          ",\"encoder_length\":"++show (fst (codecLengths (candidateSpec c)))++",\"decoder_length\":"++show (snd (codecLengths (candidateSpec c)))++
          ",\"program_length\":"++show (case candidateProgram c of PlaceEach p->2+exprLength p)++
          ",\"reference_program_length\":"++show (case candidateProgram c of PlaceEach p->2+groundLength (expand (candidateSpec c) p))++
          ",\"typed_ast\":"++(case candidateProgram c of PlaceEach p->exprJSON p)++"}"
saveV03 :: FilePath -> HierarchicalMode -> SearchConfig -> Task -> HierarchicalResult -> IO ()
saveV03 dir mode config task r=do
  createDirectoryIfMissing True dir
  writeFile (dir </> "solution.json") (resultV03JSON mode config task r++"\n")
  writeFile (dir </> "task.json") (taskJSON task++"\n")
  writeFile (dir </> "hypotheses.json") (array [hypothesisJSON (hypothesis d) | d<-activeHypotheses (hierarchicalState r)]++"\n")
  writeFile (dir </> "latent_trace.md") ("# LATIS v0.3 latent trace\n\nTraining-only discovery. Test outputs checked after MDL selection.\n\n```text\n"++
    unlines (hierarchicalTrace r)++"Heldout exact="++show (heldoutExact config task r)++"\n```\n\n```json\n"++resultV03JSON mode config task r++"\n```\n")
suiteV03 :: HierarchicalMode -> SearchConfig -> FilePath -> [Task] -> IO ()
suiteV03 mode config out tasks'=do
  createDirectoryIfMissing True out
  rows'<-traverse (\task->do
    r<-hierarchicalSearch mode config (training task)
    saveV03 (out </> taskId task) mode config task r
    putStrLn (taskId task++" "++maybe "unsolved" routeName (selectedRoute r)++" train="++show (trainingExact config task r)++" heldout="++show (heldoutExact config task r)++" DeltaMDL="++show (deltaMDL (hierarchicalMetrics r)))
    forceJSON (resultV03JSON mode config task r)) tasks'
  writeFile (out </> "suite.json") ("["++intercalate "," rows'++"]\n")
regressionV03 :: SearchConfig -> FilePath -> IO ()
regressionV03 config out=do
  createDirectoryIfMissing True out
  rows'<-traverse (\task->do
    old<-jointSearch JointConstraint config (training task)
    disabled<-hierarchicalSearch LatentDisabled config (training task)
    full<-hierarchicalSearch V03Full config (training task)
    saveV03 (out </> taskId task) V03Full config task full
    forceJSON ("{\"v02a\":"++jointJSON JointConstraint config task old++",\"v03_disabled\":"++resultV03JSON LatentDisabled config task disabled++",\"v03_full\":"++resultV03JSON V03Full config task full++"}")) (syntheticTasks++stressTasks)
  writeFile (out </> "comparison.json") ("["++intercalate "," rows'++"]\n")
ablationV03 :: SearchConfig -> FilePath -> IO ()
ablationV03 config out=do
  createDirectoryIfMissing True out
  rows'<-traverse (\task->do
    old<-jointSearch JointConstraint config (training task)
    groups<-traverse (\mode->do
      putStrLn ("Ablation "++taskId task++" "++show mode)
      r<-hierarchicalSearch mode config (training task)
      forceJSON (resultV03JSON mode config task r)) [minBound..maxBound]
    forceJSON ("{\"task\":"++jsonString (taskId task)++",\"v02a\":"++jointJSON JointConstraint config task old++",\"v03\":["++intercalate "," groups++"]}")) latentStressTasks
  writeFile (out </> "ablation.json") ("["++intercalate "," rows'++"]\n")
