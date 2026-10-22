module ARC.TriggeredEvaluate where
import Synthesis.Triggered
import Synthesis.Triggered.Parallel (Parallel(..),serialParallel)
import qualified Synthesis.InducedR2.Learn as R2
import qualified ARC.InducedR2Evaluate as R2
import ARC.Dataset
import ARC.Evaluate (jsonString)
import ARC.InducedR1Evaluate (objectJSON,arrayJSON,boolJSON)
import qualified Data.Map.Strict as M
import System.Directory (createDirectoryIfMissing)
import System.FilePath ((</>))
import Data.List (stripPrefix)
import Latent.Encode (encode)

strings :: [String] -> String
strings=arrayJSON . map jsonString
evidenceJSON :: Evidence -> String
evidenceJSON e=objectJSON [("trigger",jsonString (show (trigger e))),("parent_goal",jsonString (show (parentGoal e)))
  ,("type_reason",jsonString (typeReason e)),("ontology_slice",jsonString (ontologySlice e)),("provenance",jsonString (provenance e))]
graphJSON :: Graph -> String
graphJSON g=objectJSON
  [("features",arrayJSON [objectJSON [("id",show (featureId f)),("type",jsonString (show (featureType f)))
    ,("denotation",strings (map show (denotation f))),("expression",jsonString (show (expression f)))
    ,("semantic_role",jsonString (show (semanticRole f))),("provenance",strings (history f)),("cost",show (featureCost f))
    ,("status",jsonString (show (status f))),("depth",show (featureDepth f))] | f<-M.elems (features g)])
  ,("targets",arrayJSON [objectJSON [("id",jsonString (show t)),("type",jsonString (show (slotType (snd t))))
    ,("denotation",strings (map show vs)),("status",jsonString (if t `elem` unmatched g then "Unmatched" else "Matched"))] | (t,vs)<-M.toList (goals g)])
  ,("hyperedges",arrayJSON [objectJSON [("parents",arrayJSON (map show (parents e))),("child",show (child e))
    ,("program",jsonString (edgeProgram e)),("evidence",evidenceJSON (edgeEvidence e)),("arguments",arrayJSON (map evidenceJSON (argumentEvidence e)))] | e<-edges g])
  ,("matches",arrayJSON [objectJSON [("source",show (source m)),("target",jsonString (show (target m))),("same_role",boolJSON (sameRole m))] | m<-matches g])
  ,("semantic_states",arrayJSON [objectJSON [("type",jsonString (show t)),("denotation",strings vs),("aliases",arrayJSON (map show ids))] | ((t,vs),ids)<-M.toList (semanticStates g)])
  ,("program_definitions",arrayJSON [objectJSON [("name",jsonString (opName p)),("inputs",strings (map show (argTypes p)))
    ,("output",jsonString (show (resultType p))),("body",jsonString (show (action p))),("level",show (opLevel p))
    ,("refinement_edges",strings (refinementEdges p))] | p<-M.elems (definitions g)])
  ,("relations",arrayJSON [objectJSON [("name",jsonString (relationName r)),("template",jsonString (show (template r)))
    ,("parameters",strings (map show (parameterTypes r))),("evidence_nodes",arrayJSON (map show (witnesses r)))
    ,("compression_gain",show (compressionGain r)),("search_reduction_estimate",show (searchReduction r))
    ,("decoupling_gain",show (decouplingGain r)),("coverage",show (coverage r)),("level",show (relationLevel r))
    ,("dependencies",strings (dependencies r))] | r<-relations g])]

save :: FilePath -> Mode -> Config -> Task -> Result -> IO ()
save=saveWith serialParallel

-- `parallel` records the physical execution settings; `closure_wall_clock`
-- times only the source closure. Neither is part of the logical metrics.
saveWith :: Parallel -> FilePath -> Mode -> Config -> Task -> Result -> IO ()
saveWith par dir mode conf task result=do
  createDirectoryIfMissing True dir
  let f=front result; g=graph f
      train=all (\(x,y)->predict conf result x==Right y) (training task)
      held=not (null (tests task)) && all (\t->maybe False (\y->predict conf result (testInput t)==Right y) (testOutput t)) (tests task)
      ratio=fromIntegral (metric "visible_opportunities" g)/fromIntegral (max 1 (metric "type_compatible_opportunities" g)) :: Double
      predictions=[either (const "null") jsonGrid (predict conf result (testInput t)) | t<-tests task]
      depthMap prefix=objectJSON [(depth,show n) | (k,n)<-M.toAscList (counters g),Just depth<-[stripPrefix prefix k]]
      stats=objectJSON ([(k,show n) | (k,n)<-M.toAscList (counters g)]++[("visibility_ratio",show ratio),("wall_clock",show (elapsedSeconds result))
        ,("closure_wall_clock",show (closureSeconds result))
        ,("generated_features_by_depth",depthMap "generated_features_by_depth_"),("matched_features_by_depth",depthMap "matched_features_by_depth_")])
      dataJSON=objectJSON [("version",jsonString "LATIS-v0.4"),("mode",jsonString (show mode)),("task",jsonString (taskId task))
        ,("front_success",boolJSON (maybe False (const True) (frontProgram f))),("train_exact",boolJSON train),("heldout_exact",boolJSON held)
        ,("front_failure",jsonString (frontFailure f)),("fallback_reason",jsonString (fallbackReason result))
        ,("optimal_within_generated_graph",boolJSON (optimalWithinGraph f)),("configuration",jsonString (show conf))
        ,("parallel",objectJSON [("workers",show (workers par)),("window",show (window par)),("speculation_cap",show (speculationCap par))]),("metrics",stats)
        ,("program",maybe "null" (jsonString . show) (frontProgram f)),("predictions",arrayJSON predictions)
        ,("r2_search_work",show (maybe 0 (M.findWithDefault 0 "total_expanded_work" . R2.inducedMetrics) (fallback result)))]
  writeFile (dir </> "solution.json") (dataJSON++"\n")
  writeFile (dir </> "derivation_graph.json") (graphJSON g++"\n")
  let enc=R2.inducedEncoder (r2Config conf)
  writeFile (dir </> "contexts.json") (objectJSON
    [("unlocked",boolJSON (metric "construction_triggers" g>0))
    ,("witness_rows",if metric "construction_triggers" g==0 then "[]" else arrayJSON
      [objectJSON [("case",show i),("input_context",jsonString (show (encode enc x))),("output_context",jsonString (show (encode enc y)))
       ,("target_values",arrayJSON [objectJSON [("target",jsonString (show t)),("value",jsonString (show v))] | (t,vs)<-M.toList (goals g),v<-take 1 (drop i vs)])]
      | (i,(x,y))<-zip [0::Int ..] (training task)])]++"\n")
  writeFile (dir </> "trace.txt") (unlines (logEvents g++["front failure: "++frontFailure f,"fallback: "++fallbackReason result]))
  case fallback result of
    Nothing->pure ()
    Just old->R2.saveInduced (dir </> "r2-fallback") R2.Full (r2Config conf) task old
