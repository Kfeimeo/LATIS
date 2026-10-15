module ARC.InducedR1Evaluate where
import ARC.Dataset
import ARC.Evaluate (jsonString)
import Language.Induced.Base
import Synthesis.InducedR1.Learn
import Synthesis.Induced.VersionSpace
import Synthesis.InducedR1.Abstraction
import qualified Data.Map.Strict as M
import qualified Data.Set as S
import Data.List (intercalate)
import System.Directory (createDirectoryIfMissing)
import System.FilePath ((</>))

objectJSON :: [(String,String)] -> String
objectJSON xs="{"++intercalate "," [jsonString n++":"++v | (n,v)<-xs]++"}"
arrayJSON :: [String] -> String
arrayJSON xs="["++intercalate "," xs++"]"
boolJSON :: Bool -> String
boolJSON yes=if yes then "true" else "false"
exprJSON :: Expr -> String
exprJSON e=objectJSON [("type",jsonString (show (exprType e))),("expression",jsonString (exprText e))
  ,("free_variables",arrayJSON (map jsonString (S.toList (freeVars e))))
  ,("binding_accesses",arrayJSON (map jsonString (S.toList (bindingAccesses e))))
  ,("children",arrayJSON (map exprJSON (children e)))]
inventionJSON :: Invention -> String
inventionJSON i=objectJSON [("name",jsonString (inventionName i)),("source",jsonString "TaskInvented")
  ,("originating_ast",exprJSON (inventionBody i)),("repeated_occurrences",show (inventionOccurrences i))
  ,("mdl_saving",show (inventionSaving i)),("saving_scope",jsonString "exact-valid program portfolio")
  ,("template",exprJSON (inventionTemplate i))
  ,("parameters",arrayJSON [objectJSON [("name",jsonString n),("type",jsonString (show t))] | (n,t)<-inventionParameters i])
  ,("expansion",jsonString "ordinary checked Base lambda/application; no invention-specific primitive or witness")
  ,("evidence",jsonString (inventionEvidence i))]
supportJSON :: Support -> String
supportJSON p=objectJSON [("specification",jsonString (supportSpec p)),("witness",jsonString (supportWitness p))]
signatureJSON :: InducedResult -> String
signatureJSON r=arrayJSON [objectJSON [("symbol",jsonString n),("source",jsonString "BaseActivated")
  ,("support",arrayJSON (map supportJSON ps))] | (n,ps)<-M.toAscList (inducedSignature r)]
resultInducedJSON :: InducedMode -> InducedConfig -> Task -> InducedResult -> String
resultInducedJSON mode conf task r=objectJSON
  [("task",jsonString (taskId task)),("mode",jsonString (show mode))
  ,("train_exact",boolJSON train), ("heldout_exact",boolJSON held)
  ,("heldout_available",boolJSON heldAvailable), ("failure",jsonString failure)
  ,("failure_evidence",jsonString evidence)
  ,("program",maybe "null" (jsonString . exprText) (inducedProgram r))
  ,("typed_ast",maybe "null" exprJSON (inducedProgram r))
  ,("portfolio_count",show (length (inducedPortfolio r)))
  ,("version_space_derivations",show (cardinalityBound (inducedSpace r) (inducedRoot r)))
  ,("base_activated",signatureJSON r)
  ,("task_invented",arrayJSON (map inventionJSON (inducedInventions r)))
  ,("statistics",objectJSON ([(n,show v) | (n,v)<-M.toAscList (inducedMetrics r)]++[("wall_clock_seconds",show (inducedSeconds r))]))
  ,("bounded",boolJSON (inducedBounded r))
  ,("base_expressibility",jsonString (if train then "Expressible: exact Base program is constructive evidence" else "Unknown: no impossibility proof; bounded Reachable failed"))
  ,("reachability",jsonString (if train then "Reachable within configured specification/witness/search bounds" else "Not reached within configured bounds"))
  ,("configuration",objectJSON [("work_budget",show (workBudget conf)),("depth",show (depthBound conf))
     ,("frontier",show (frontierBound conf)),("correspondence_budget",show (inducedCorrespondenceBudget conf))
     ,("abstraction_limits",jsonString (show (abstractionLimits conf)))])
  ,("mdl",maybe "null" (\p->objectJSON [("score",show (first (rank p))),("ast_length",show (exprLength p))
     ,("distinct_symbols",show (S.size (symbols p))),("portfolio_saving",show (sum (map inventionSaving (inducedInventions r))))]) (inducedProgram r))
  ,("secondary_latent_path",jsonString "Base observer expressions only; v0.3 handwritten hierarchical codecs are legacy and are not called")
  ,("predictions",arrayJSON [maybe "null" (\p->either (const "null") jsonGrid (predictInduced conf p (testInput q))) (inducedProgram r) | q<-tests task])]
  where
    first (a,_,_,_,_)=a
    train=maybe False (\p->all (\(x,y)->predictInduced conf p x==Right y) (training task)) (inducedProgram r)
    heldAvailable=not (null (tests task)) && all (\q->case testOutput q of Just _->True; _->False) (tests task)
    held=heldAvailable && maybe False (\p->all (\q->maybe False (\y->predictInduced conf p (testInput q)==Right y) (testOutput q)) (tests task)) (inducedProgram r)
    failure=if train&&heldAvailable&&not held then "AbstractionMissing" else inducedFailure r
    evidence=if failure=="AbstractionMissing" then "selected exact-training Base program does not generalize to heldout; training specification underdetermines the abstraction" else inducedFailureEvidence r

saveInduced :: FilePath -> InducedMode -> InducedConfig -> Task -> InducedResult -> IO ()
saveInduced dir mode conf task r=do
  createDirectoryIfMissing True dir
  writeFile (dir </> "solution.json") (resultInducedJSON mode conf task r++"\n")
  -- Heldout portfolio analysis is performed only here, AFTER all selection
  -- and abstraction. It diagnoses ranking versus reachability, never retunes.
  writeFile (dir </> "portfolio_diagnostics.json") (objectJSON
    [("policy",jsonString "post-selection audit only; heldout never enters Learn or discovery")
    ,("candidates",arrayJSON [objectJSON [("expression",jsonString (exprText p))
       ,("base_rank",jsonString (show (rank p)))
       ,("dictionary_encoded_length",show (encodedLength (inducedInventions r) p))
       ,("heldout_exact",boolJSON (not (null (tests task)) && all (\q->maybe False (\y->predictInduced conf p (testInput q)==Right y) (testOutput q)) (tests task)))]
       | p<-inducedPortfolio r])]++"\n")
  writeFile (dir </> "induced_tsl.json") (objectJSON [("definition",jsonString "Signature(VS_root) union I_task")
    ,("base",signatureJSON r),("invented",arrayJSON (map inventionJSON (inducedInventions r)))]++"\n")
  writeFile (dir </> "base_registry.json") (arrayJSON [objectJSON [("symbol",jsonString (primitiveName p))
    ,("effect",jsonString (show (primitiveEffect p))),("witness",jsonString (primitiveWitness p))
    ,("type_scheme",jsonString (primitiveTypeScheme p))
    ,("cost",show (primitiveCost p)),("semantics",jsonString (primitiveSemantics p))] | p<-base]++"\n")
  writeFile (dir </> "version_space.json") (objectJSON [("root",show (inducedRoot r)),("nodes",arrayJSON
    [objectJSON [("id",show i),("kind",jsonString kind),("operator",jsonString op),("children",arrayJSON (map show cs))
      ,("support",arrayJSON (map supportJSON (M.findWithDefault [] i (provenance (inducedSpace r)))))]
     | (i,n)<-M.toAscList (nodes (inducedSpace r)),let (kind,op,cs)=case n of Leaf e->("Leaf",exprText e,[]); Union ids->("Union","",ids); Join name ids _->("Join",name,ids)])]++"\n")
  writeFile (dir </> "induced_tsl_trace.md") (unlines
    ["# LATIS v0.3R.1 induced TSL trace","","Only training IO enters Learn; test labels are evaluated after selection. StructuralPriorCount=0.",""
    ,"The root is a typed Scene -> Scene graph. Return-type filtering visits the entire Base registry. Effect checks restrict conditional witness input domains. Each witness produces child learning tasks; a rule is activated only after every child has a nonempty version space. No task classifier selects scan."
    ,"","## Deduction and child specifications","","```text",unlines (inducedTrace r),"```",""
    ,"## Supported map / scan rules","","```text",unlines (filter (\s->prefix "Nonempty VS_map" s||prefix "Nonempty VS_scan" s||prefix "map witness" s||prefix "scan witness" s) (inducedTrace r)),"```",""
    ,"## Final expression and free-variable dependencies","","```text",maybe "UNSOLVED" exprText (inducedProgram r)
    ,"FV="++maybe "{}" (show . S.toList . freeVars) (inducedProgram r),"```",""
    ,"## Version space, inventions, induced TSL, exact verification and MDL","","```json",resultInducedJSON mode conf task r,"```",""
    ,"Limits: depth="++show (depthBound conf)++", extraction frontier="++show (frontierBound conf)++"; 64 witness decompositions/rule; 96 observer terms/type with 2 semantic alternatives. Forward observers are bounded Base subexpressions, not complete programs. The version space is the discovered bounded support, not all possible Base programs."
    ,"","Abstraction is typed anti-unification plus explicit lambda lifting. MDL compares a nonoverlapping portfolio cover including definition and argument costs. Accepted definitions feed later Learn through checked Base expansion, with matching tests counted. Online rounds and all dictionary/AST/parameter bounds are finite. `I<n>` has no preassigned semantic label."
    ,"","Legacy hierarchical codecs are retained in solve-v03 and measured separately. This solver constructs its grounded observations from Base expressions; richer local/global codec discovery remains a coverage limitation."])
  where prefix p s=take (length p) s==p
