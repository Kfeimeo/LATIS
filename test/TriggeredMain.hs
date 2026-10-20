module Main where
import Synthesis.Triggered
import ARC.TriggeredStress
import ARC.Dataset
import Language.Induced.Base (Type(..))
import Latent.Encode (encode,defaultEncoder)
import qualified Synthesis.FeaturePipeline as F
import qualified Data.Map.Strict as M
import Control.Monad (unless,forM_)

assert :: String -> Bool -> IO ()
assert s ok=unless ok (error s) >> putStrLn ("PASS "++s)
result :: String -> Mode -> FrontResult
result key mode=case lookup key stressTasks of
  Just task->frontSearch mode defaultConfig (training task)
  _->error "unknown stress"
main :: IO ()
main=do
  forM_ (take 6 stressTasks) $ \(name,task)->do
    let f=frontSearch Full defaultConfig (training task)
    assert (name++" frontend training exact") (frontFailure f=="None")
    assert (name++" heldout") (maybe False (\p->all (\t->maybe False (\y->runProgram p (testInput t)==Right y) (testOutput t)) (tests task)) (frontProgram f))
    assert (name++" triggered edges") (all (not . null . provenance . edgeEvidence) (edges (graph f)))
  let full=graph (result "A-match-pruning" Full)
      unpruned=graph (result "A-match-pruning" NoMatchedFeaturePruning)
  assert "A frozen frontier never expanded" (metric "expanded_frozen_features" full==0)
  assert "A pruning strictly reduces work" (metric "search_work" full<metric "search_work" unpruned)
  let reuse=graph (result "B-transform-reuse" Full)
      noReuse=graph (result "B-transform-reuse" NoTransformReuse)
  assert "B shared definitions actually reused" (metric "transform_cache_hits" reuse>0 && metric "transform_cache_hits" noReuse==0)
  assert "B definition reuse reduces charged work" (metric "search_work" reuse<metric "search_work" noReuse)
  let deep=graph (result "C-depth-three" Full)
  assert "C iterative depth three" (metric "generated_features_by_depth_3" deep>0)
  assert "C relation invention uses evidence" (not (null (relations deep)) && all (not . null . witnesses) (relations deep))
  assert "C hierarchical relation level" (any ((>1) . relationLevel) (relations deep))
  assert "no-invention is real ablation" (null (relations (graph (result "C-depth-three" NoRelationInvention))))
  assert "flat relations do not acquire levels" (all ((==0) . relationLevel) (relations (graph (result "C-depth-three" FlatRelations))))
  let taskD=maybe (error "missing D fixture") id (lookup "D-irrelevant-library" stressTasks)
      noise=defaultConfig {noiseOperators=200,sourceBudget=3000}
      visibleG=graph (frontSearch Full noise (training taskD))
      blindG=graph (frontSearch NoVisibility noise (training taskD))
  assert "D visibility strictly reduces work" (metric "search_work" visibleG<metric "search_work" blindG)
  assert "D Full expansion independent of irrelevant library size" (metric "operator_applications" visibleG==metric "operator_applications" full)
  assert "semantic aliases are not capped at two" (any ((>2) . length) (M.elems (semanticStates blindG)))
  assert "E context needed" (frontProgram (result "E-scene-construction" NoSceneContext)==Nothing)
  assert "F lifting needed" (frontProgram (result "F-intensional-ref" NoIntensionalLifting)==Nothing)
  assert "G arbitrary concrete-coordinate fit rejected" (frontProgram (result "G-invalid-abstraction" Full)==Nothing)
  assert "type graph prunes unreachable types" (not (canReach (typeGraph (operators 0)) ObjectT ColorT))
  assert "unlifted captured role rejected from invention" (not (validTemplate M.empty [] (Input (F.Unique Nothing) Position)))
  assert "unbound typed parameter rejected" (not (validTemplate M.empty [] (Parameter 0 CoordT)))
  assert "refinement cannot start without trigger" (case relations deep of
    r:_->case refine deep NeedRelation (relationName r) of Left _->True; _->False
    _->False)
  assert "refinement stays on declared edges" (all (\r->refine deep (RefinementTrigger (relationName r)) (relationName r)==Right (dependencies r)) (relations deep))
  let zero=frontSearch Full (defaultConfig {sourceBudget=0,constructBudget=0}) (training taskD)
  assert "zero search budgets do not overshoot" (metric "search_work" (graph zero)==0 && metric "construction_work" (graph zero)==0)
  let limited=frontSearch Full (defaultConfig {selectionBudget=1}) (training taskD)
  assert "bounded global selection cannot claim optimum" (not (optimalWithinGraph limited) && frontProgram limited==Nothing)
  assert "all expanded edges carry audited triggers" (metric "UntriggeredExpansionCount" (audit deep)==0)
  assert "all inventions have lifted typed parameters" (metric "ConcreteParameterExposureCount" (audit deep)==0)
  let bad=Relation "bad" (Input (F.Unique Nothing) Position) [] [] 0 0 0 0 1 []
  assert "exposure counter is computed, not hardcoded" (metric "ConcreteParameterExposureCount" (audit deep {relations=[bad]})==1)
  assert "failure alone permits controlled widening" (case controlledWidening 2 deep NeedRelation CoordT of Left _->True; _->False)
  assert "controlled widening is bounded" (case controlledWidening 2 deep (FailureTrigger "test") CoordT of Right ns->length ns<=2; _->False)
  let sceneGrid=grid 8 5 [(1,1,2),(5,2,3)]
      scene=encode defaultEncoder sceneGrid
      seed=either error id (initial [scene] [scene] [])
      roles=[r | (r,Object)<-M.keys (goals seed)]
      mkOp n cost=Operator n [ObjectT] ObjectT Geometry Noise cost 0 []
      defs=M.fromList [(opName p,p) | p<-[mkOp "localA" 4,mkOp "localB" 4,mkOp "shared" 6]]
      add st (role,local)=foldl (\acc name->
          let base=case [root | root<-M.elems (features seed),expression root==Input role Object] of root:_->root; _->error "missing root"
              f=base {expression=Invoke name [Input role Object],status=Unmatched}
          in snd (insertFeature f acc)) st [local,"shared"]
      candidates=rematch (foldl add (seed {definitions=defs}) (zip roles ["localA","localB"]))
      allowed=candidates {matches=[m | m<-matches candidates,snd (target m)==Position || case expression (features candidates M.! source m) of Invoke _ _->True; _->False]}
      (chosen,optimal,_)=selectExplanation Full defaultConfig [(sceneGrid,sceneGrid)] defaultEncoder (Layout F.OutputWidth F.OutputHeight 0) allowed
  assert "global minimum charges shared definition once" (optimal && case chosen of
    Just (Program _ _ assignments _)->concatMap termCalls (M.elems assignments)==["shared","shared"]
    _->False)
