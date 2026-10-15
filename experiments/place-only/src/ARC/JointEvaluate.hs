module ARC.JointEvaluate where
import ARC.Dataset
import ARC.Evaluate (jsonString,jsonMaybe,resultJSON)
import Synthesis.Joint
import Synthesis.Constraint.Metrics
import Synthesis.Search (SearchConfig(..),Mode(Full),search)
import Synthesis.Skeleton
import Synthesis.Hole
import Synthesis.Verify
import Synthesis.MDL
import Synthesis.Abstraction
import Language.DSA
import Latent.Grid
import Latent.Object
import Latent.Render
import qualified Data.Set as S
import qualified Data.Map.Strict as M
import Data.List (intercalate)
import System.Directory (createDirectoryIfMissing)
import System.FilePath ((</>))

metricsJSON :: Metrics -> String
metricsJSON m="{"++intercalate "," ([jsonString key++":"++show (f m) | (key,f)<-ints]++
  ["\"first_solution_expanded\":"++jsonMaybe (firstExpanded m),"\"first_seconds\":"++jsonMaybe (firstSeconds m),"\"seconds\":"++show (totalSeconds m),
   "\"first_previous_expansions\":"++jsonMaybe (firstPreviousExpansions m),"\"first_grid_expansions\":"++jsonMaybe (firstGridExpansions m),
   "\"first_context_expansions\":"++jsonMaybe (firstContextExpansions m),"\"first_expression_tests\":"++jsonMaybe (firstExpressionTests m),
   "\"average_branch_domain\":"++show (if branchPoints m==0 then 0 else fromIntegral (branchDomainTotal m)/fromIntegral (branchPoints m)::Double)]++
   [jsonString k++":"++if f m then "true" else "false" | (k,f)<-[("exhaustive",exhaustive),("budget_exhausted",exhaustedBudget),("solution_limit_reached",stoppedAtSolutionLimit)]])++"}"
  where ints=[("expanded",expanded),("complete_programs",verifierCalls),("partial_states",partialStates),("verifier_calls",verifierCalls),
          ("propagation_iterations",propagationIterations),("propagation_rule_calls",propagationRuleCalls),("deterministic_steps",deterministicSteps),
          ("branch_points",branchPoints),("branch_assignments",branchAssignments),("branch_domain_total",branchDomainTotal),("maximum_branch_domain",maximumBranchDomain),
          ("context_expansions",contextExpansions),("previous_expansions",previousExpansions),("grid_expansions",gridExpansions),("expression_tests",expressionTests),("effect_queries",effectQueries),("witness_queries",witnessQueries),
          ("dependency_branches",dependencyBranches),("skeleton_branches",skeletonBranches),("dependencies_derived",dependenciesDerived),
          ("expression_dependencies_derived",expressionDependenciesDerived),("dependency_edges_derived",dependencyEdgesDerived),
          ("witness_holes",witnessHoles),("enumerated_holes",enumeratedHoles),("legacy_dependency_checks",legacyDependencyChecks),
          ("expression_memo_queries",expressionMemoQueries),("expression_memo_hits",expressionMemoHits),("partial_memo_queries",partialMemoQueries),("partial_memo_hits",partialMemoHits),
          ("program_memo_queries",programMemoQueries),("program_memo_hits",programMemoHits),("contradictions",contradictions),("proven_dominance",provenDominance)]

jointJSON :: JointMode -> SearchConfig -> Task -> JointResult -> String
jointJSON mode config task r="{"++intercalate ","
  ["\"task\":"++jsonString (taskId task),"\"mode\":"++jsonString (show mode),"\"statistics\":"++metricsJSON (jointMetrics r),
   "\"program\":"++maybe "null" (jsonString . programText) (jointSolution r),
   "\"solved\":"++boolean (maybe False (verify (encoder config) (training task)) (jointSolution r)),
   "\"heldout_exact\":"++boolean (heldout config task r),
   "\"L\":"++maybe "null" (show . programLength) (jointSolution r),
   "\"K\":"++maybe "null" (show . S.size . taskSymbolClosure) (jointSolution r),"\"E\":"++maybe "null" (const "0") (jointSolution r),
   "\"valid_programs\":"++show (length (jointValid r)),"\"limitations\":["++intercalate "," (map jsonString (jointLimitations r))++"]",
   "\"state_budget\":"++show (stateBudget config),"\"solution_limit\":"++show (solutionLimit config)]++"}"
  where boolean b=if b then "true" else "false"
heldout :: SearchConfig -> Task -> JointResult -> Bool
heldout config task r=case jointSolution r of Nothing->False; Just p->all (\q->maybe True (\g->predict (encoder config) p (testInput q)==Right g) (testOutput q)) (tests task)
saveJoint :: FilePath -> JointMode -> SearchConfig -> Task -> JointResult -> IO ()
saveJoint dir mode config task r=do
  createDirectoryIfMissing True dir
  writeFile (dir </> "v02a_solution.json") (jointJSON mode config task r++"\n")
  writeFile (dir </> "v02a_trace.md") ("# LATIS v0.2A constraint synthesis trace\n\nOnly training pairs enter search. All tests run after program selection.\n\n```text\n"++unlines (jointTrace r)++"```\n\n```json\n"++jointJSON mode config task r++"\n```\n")

jointBenchmark :: SearchConfig -> Int -> FilePath -> Task -> IO ()
jointBenchmark config repeats dir task=do
  createDirectoryIfMissing True dir
  groups<-traverse (\mode->do
    putStrLn ("Joint benchmark "++show mode)
    rs<-traverse (\_->jointSearch mode config (training task)) [1..repeats]
    mapM_ (print . jointMetrics) (take 1 rs)
    case rs of r:_ | mode==JointConstraint->saveJoint dir mode config task r; _->pure ()
    pure [jointJSON mode config task r | r<-rs]) [minBound..maxBound]
  baseline<-traverse (\_->search config {searchMode=Full} (training task)) [1..repeats]
  writeFile (dir </> "v02a_ablation.json") ("["++intercalate "," (concat groups++map (resultJSON config {searchMode=Full} task) baseline)++"]\n")

jointSuite :: JointMode -> SearchConfig -> FilePath -> [Task] -> IO ()
jointSuite mode config dir tasks'=do
  createDirectoryIfMissing True dir
  results'<-traverse (\task->do
    r<-jointSearch mode config (training task)
    putStrLn (taskId task++" train="++show (maybe False (verify (encoder config) (training task)) (jointSolution r))++" heldout="++show (heldout config task r)++" expanded="++show (expanded (jointMetrics r)))
    saveJoint (dir </> taskId task) mode config task r
    writeFile (dir </> taskId task </> "task.json") (taskJSON task++"\n")
    pure (jointJSON mode config task r)) tasks'
  writeFile (dir </> "suite.json") ("["++intercalate "," results'++"]\n")

taskJSON :: Task -> String
taskJSON t="{\"train\":["++intercalate "," ["{\"input\":"++jsonGrid x++",\"output\":"++jsonGrid y++"}" | (x,y)<-training t]++
  "],\"test\":["++intercalate "," ["{\"input\":"++jsonGrid (testInput q)++maybe "" (\g->",\"output\":"++jsonGrid g) (testOutput q)++"}" | q<-tests t]++"]}"

stressTasks :: [Task]
stressTasks=
  [generate "map-scan-ambiguity" (MapP LeftToRight (Move (ConstantVector (Vec 1 (-1))))) multi
  ,generate "true-scan-lazy-prev" (ScanP LeftToRight start attach) multi
  ,generate "grid-without-prev" (MapP ExtractionOrder (Move (VectorDifference GridBR (Corner Current BR)))) singles
  ,generate "constant-transform" (MapP ExtractionOrder (Fixed Rotate90Op)) singles
  ,generate "equivalent-expressions" (MapP ExtractionOrder (Move (ConstantVector (Vec 1 0)))) points
  ,generate "wrong-early-skeleton" (ScanP RightToLeft start attach) multi]
  where
    start=Move (VectorDifference GridTL (Corner Current TL))
    attach=Move (VectorDifference (Corner Previous BR) (Corner Current TL))
    rect i c x y w h=Object i (Coord x y) (M.fromList [(Coord a b,c) | b<-[0..h-1],a<-[0..w-1]]) 0
    multi=[Scene (Dimensions 22 22) 0 [rect 0 c 2 y w 3,rect 1 2 8 (y+1) 3 h,rect 2 6 15 (y-1) 2 4]
      | (c,y,w,h)<-[(1,12,2,2),(4,10,3,4),(8,14,1,3)]]
    singles=[Scene (Dimensions d (d+2)) 0 [Object 0 (Coord x y) (M.fromList [(Coord 0 0,c),(Coord 0 1,c),(Coord 0 2,c),(Coord 1 2,c)]) 0]
      | (d,c,x,y)<-[(14,1,2,3),(19,4,7,5),(23,6,9,8)]]
    points=[Scene (Dimensions 18 18) 0 [rect 0 c x y 1 1] | (c,x,y)<-[(1,2,3),(4,7,6),(8,10,9)]]
    generate name p scenes=let pairs=[(must (render s),must (runProgram p s >>= render)) | s<-scenes]
      in Task name (take 2 pairs) [TestPair x (Just y) | (x,y)<-drop 2 pairs]
    must=either error id
