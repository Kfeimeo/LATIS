module ARC.InducedR2Evaluate where
import ARC.Dataset
import ARC.Evaluate (jsonString)
import ARC.InducedR1Evaluate (objectJSON,arrayJSON,boolJSON,exprJSON,inventionJSON)
import Language.Induced.Base
import Synthesis.InducedR2.Learn
import Synthesis.InducedR2.VersionSpace
import Synthesis.InducedR2.Diversity
import Synthesis.InducedR2.Sharing
import Synthesis.InducedR2.Counterfactual
import qualified Data.Map.Strict as M
import System.Directory (createDirectoryIfMissing)
import System.FilePath ((</>))

signatureJSON :: StructuralSignature -> String
signatureJSON s=objectJSON [("FV",strings (signatureFV s)),("dependency_provenance",strings (dependencyProvenance s))
  ,("literal_provenance",strings (literalProvenance s)),("observer_provenance",strings (observerProvenance s))
  ,("effects",strings (effectProvenance s)),("structural_form",jsonString (structuralForm s))]
  where strings=arrayJSON . map jsonString
candidateJSON :: InducedConfig -> Task -> Expr -> String
candidateJSON conf task p=objectJSON [("expression",jsonString (exprText p)),("metadata",signatureJSON (signatureOf p))
  ,("dag_mdl_cost",show (exprLength p)),("ungrounded_literal_penalty",show (ungroundedCost p)),("let_sharing",show (sharingCount p))
  ,("heldout_exact",boolJSON (heldExact conf task p))]
heldExact :: InducedConfig -> Task -> Expr -> Bool
heldExact conf task p=not (null (tests task)) && all (\q->maybe False (\y->predictInduced conf p (testInput q)==Right y) (testOutput q)) (tests task)
ambiguityJSON :: Maybe Ambiguity -> String
ambiguityJSON Nothing=objectJSON [("status",jsonString "NoDistinguishingInputFoundWithinBounds"),("selection_feedback","false")]
ambiguityJSON (Just a)=objectJSON [("status",jsonString "ObservationallyUnderdetermined"),("selection_feedback","false")
  ,("hypothesis_a",jsonString (exprText (hypothesisA a))),("hypothesis_b",jsonString (exprText (hypothesisB a)))
  ,("distinguishing_input",jsonGrid (distinguishingInput a)),("hypothetical_prediction_a",jsonGrid (hypotheticalPredictionA a))
  ,("hypothetical_prediction_b",jsonGrid (hypotheticalPredictionB a)),("minimality",jsonString "first by object count, canvas cells, text within finite input perturbation domain; not global minimality")
  ,("domain_size",show (hypotheticalDomainSize a)),("calls",show (counterfactualCalls a))]
saveInduced :: FilePath -> InducedMode -> InducedConfig -> Task -> InducedResult -> IO ()
saveInduced dir mode conf task r=do
  createDirectoryIfMissing True dir
  let train=maybe False (\p->all (\(x,y)->predictInduced conf p x==Right y) (training task)) (inducedProgram r)
      held=maybe False (heldExact conf task) (inducedProgram r)
      available=not (null (tests task)) && all (maybe False (const True) . testOutput) (tests task)
      (ambiguity,calls)=if mode==NoCounterfactualDiagnosis then (Nothing,0) else diagnoseWith (mode/=NoGroundedLiteralPrior) (inducedEncoder conf) (inducedPortfolio r) (map fst (training task))
      failure=if train&&available&&not held then "AbstractionMissing" else inducedFailure r
      stats=M.insert "counterfactual_calls" calls (inducedMetrics r)
      solution=objectJSON [("version",jsonString "LATIS-v0.3R.2"),("task",jsonString (taskId task)),("mode",jsonString (show mode))
        ,("train_exact",boolJSON train),("heldout_exact",boolJSON held),("heldout_available",boolJSON available)
        ,("failure",jsonString failure),("failure_evidence",jsonString (inducedFailureEvidence r))
        ,("ambiguity",if mode==NoCounterfactualDiagnosis then objectJSON [("status",jsonString "Disabled"),("selection_feedback","false")] else ambiguityJSON ambiguity)
        ,("program",maybe "null" (jsonString . exprText) (inducedProgram r)),("typed_ast",maybe "null" exprJSON (inducedProgram r))
        ,("portfolio_count",show (length (inducedPortfolio r))), ("task_invented",arrayJSON (map inventionJSON (inducedInventions r)))
        ,("statistics",objectJSON ([(n,show v) | (n,v)<-M.toAscList stats]++[("wall_clock_seconds",show (inducedSeconds r))]))
        ,("configuration",objectJSON [("budget",show (workBudget conf)),("saturation_work_budget",show (saturationWorkBudget conf)),("structural_cost_bound",show (structuralCostBound conf)),("deductive_recursion_guard",show (depthBound conf)),("legacy_frontier",show (frontierBound conf)),("grounded_prior",boolJSON (mode/=NoGroundedLiteralPrior)),("lambda_ungrounded",if mode==NoGroundedLiteralPrior then "0" else "8"),("mu_effect","1")])
        ,("base_expressibility",jsonString (if train then "Constructive Base certificate" else "Unknown: no impossibility certificate"))
        ,("bounded",boolJSON (inducedBounded r))]
  writeFile (dir </> "solution.json") (solution++"\n")
  writeFile (dir </> "portfolio_diagnostics.json") (objectJSON [("policy",jsonString "heldout audit after fixed selection; no selection/discovery feedback")
    ,("candidates",arrayJSON (map (candidateJSON conf task) (inducedPortfolio r)))]++"\n")
  writeFile (dir </> "version_space.json") (objectJSON [("root",show (inducedRoot r)),("nodes",arrayJSON
    [objectJSON [("id",show i),("kind",jsonString kind),("form",jsonString form),("children",arrayJSON (map show cs))
      ,("metadata",arrayJSON [objectJSON [("type",jsonString (show (infoType info))),("denotation",maybe "null" (arrayJSON . map jsonString) (infoDenotation info))
         ,("signature",maybe "null" signatureJSON (infoSignature info)),("mdl_cost",maybe "null" show (infoMDL info)),("context",jsonString (infoContext info))] | info<-M.findWithDefault [] i (annotations (inducedSpace r))])]
    | (i,n)<-M.toAscList (nodes (inducedSpace r)),let (kind,form,cs)=case n of Leaf e->("Leaf",exprText e,[]); Union ids->("Union","",ids); Join label ids _->("Join",label,ids)])]++"\n")
  writeFile (dir </> "contexts.json") (objectJSON [("context:"++show i,jsonString description) | (i,description)<-M.toAscList (contextDefinitions (inducedSpace r))]++"\n")
  writeFile (dir </> "equivalence_classes.json") (arrayJSON [objectJSON [("denotation_context",jsonString k),("representatives",arrayJSON [objectJSON [("expression",exprJSON e),("metadata",signatureJSON sig)] | (sig,e)<-M.toAscList reps])] | (k,reps)<-M.toAscList (equivalenceClasses (inducedSpace r))]++"\n")
  writeFile (dir </> "induced_tsl.json") (objectJSON [("base_symbols",arrayJSON [objectJSON [("symbol",jsonString n),("support",arrayJSON [jsonString (show proof) | proof<-evidence])] | (n,evidence)<-M.toAscList (inducedSignature r)])
    ,("task_inventions",arrayJSON (map inventionJSON (inducedInventions r))),("structural_prior_count","0")]++"\n")
  writeFile (dir </> "induced_tsl_trace.md") ("# LATIS v0.3R.2\nStructuralPriorCount=0. Counterfactual labels never guide synthesis.\n```text\n"++unlines (inducedTrace r)++"```\n")
