module ARC.CollectionEvaluate where
import Synthesis.Collection
import qualified Synthesis.Triggered as V4
import qualified Synthesis.InducedR2.Learn as R2
import qualified ARC.InducedR2Evaluate as R2
import ARC.Dataset
import ARC.Evaluate (jsonString)
import ARC.InducedR1Evaluate (objectJSON,arrayJSON,boolJSON)
import Latent.Grid
import qualified Latent.Object as O
import Control.Exception (evaluate)
import Control.Monad (forM)
import GHC.Clock (getMonotonicTimeNSec)
import qualified Data.Map.Strict as M
import System.Directory (createDirectoryIfMissing)
import System.FilePath ((</>))
import Data.List (intercalate)

strings :: [String] -> String
strings=arrayJSON . map jsonString
viewJSON :: OrderedView -> String
viewJSON v=objectJSON [("source_set",jsonString (show (sourceSet v))),("source_origin",jsonString (show (orderingOrigin v)))
  ,("ordering_expression",jsonString (orderingDerivation v)),("ordering_key",jsonString (show (orderingKey v)))
  ,("cardinality",show (cardinality v)),("trigger",jsonString (show (orderingTrigger v)))
  ,("derivation",strings [show (orderingOrigin v),orderingDerivation v,"unique key constraint"])]
placedJSON :: O.Object -> String
placedJSON o=objectJSON [("type",jsonString ("Placed["++show (O.width o)++","++show (O.height o)++"]"))
  ,("size_index",arrayJSON [show (O.width o),show (O.height o)])
  ,("position",arrayJSON [show (cx (O.position o)),show (cy (O.position o))])
  ,("color",maybe "null" show (O.color o)),("geometry",arrayJSON
    [arrayJSON [show (cx p),show (cy p),show c] | (p,c)<-M.toList (O.geometry o)])]
witnessJSON :: Alignment -> String
witnessJSON w=objectJSON [("expression",jsonString (show (alignmentExpression w)))
  ,("input",viewJSON (alignmentLeft w)),("output",viewJSON (alignmentRight w))
  ,("pairs",arrayJSON [objectJSON [("input",placedJSON a),("output",placedJSON b)] | (a,b)<-alignmentPairs w])]
graphJSON :: Graph -> String
graphJSON g=objectJSON
  [("features",arrayJSON [objectJSON [("type",jsonString (show (featureType f))),("denotation",strings (denotation f))
    ,("expression",jsonString (expression f)),("provenance",strings (provenance f)),("trigger",jsonString (show (trigger f)))
    ,("cost",show (cost f)),("status",jsonString (show (status f)))] | f<-features g])
  ,("high_level_edges",strings (map show (highEdges g)))
  ,("alignment_witnesses",arrayJSON [arrayJSON (map witnessJSON ws) | ws<-alignmentEvidence g])
  ,("abstractions",arrayJSON [objectJSON [("name",jsonString (abstractionName a)),("contract",jsonString (contract a))
    ,("input_types",strings (inputTypes a)),("output_types",strings (outputTypes a)),("hidden_refinement_graph",arrayJSON
      [objectJSON [("id",jsonString (nodeName n)),("operation",jsonString (operation n)),("dependencies",strings (dependencies n))] | n<-hiddenRefinement a])
    ,("dependencies",strings (abstractionDependencies a)),("provenance",strings (abstractionProvenance a)),("cost",show (abstractionCost a))] | a<-abstractions g])]

-- Matrix runs include real unchanged R2 fallback, not placeholder baseline rows.
runTask :: FilePath -> Mode -> Config -> Task -> IO String
runTask out mode conf task=do
  createDirectoryIfMissing True out
  start<-getMonotonicTimeNSec
  let f=frontSearch mode conf (training task)
  _<-evaluate (length (show f))
  frontEnd<-getMonotonicTimeNSec
  old<-case program f of
    Just _->pure Nothing
    Nothing->Just <$> R2.inducedSearch R2.Full (V4.r2Config (legacyConfig conf)) (training task)
  end<-getMonotonicTimeNSec
  let predict x=case program f of
        Just p->runProgram p x
        Nothing->case old >>= R2.inducedProgram of
          Nothing->Left "frontend and fallback failed"
          Just p->R2.predictInduced (V4.r2Config (legacyConfig conf)) p x
      trainExact=all (\(x,y)->predict x==Right y) (training task)
      heldExact=not (null (tests task)) && all (\t->maybe False (\y->predict (testInput t)==Right y) (testOutput t)) (tests task)
      frontTrain=maybe False (\p->all (\(x,y)->runProgram p x==Right y) (training task)) (program f)
      frontHeld=maybe False (\p->not (null (tests task)) && all (\t->maybe False (\y->runProgram p (testInput t)==Right y) (testOutput t)) (tests task)) (program f)
      fallbackCount=maybe 0 (const 1) old :: Int
      g=(graph f) {counters=M.insert "fallback_count" fallbackCount (counters (graph f))}
      solution=objectJSON [("version",jsonString "LATIS-collection-v0.5-experiment"),("task",jsonString (taskId task)),("mode",jsonString (show mode))
        ,("configuration",jsonString (show conf)),("front_success",boolJSON frontTrain),("front_train_exact",boolJSON frontTrain),("front_heldout_exact",boolJSON frontHeld)
        ,("train_exact",boolJSON trainExact),("heldout_exact",boolJSON heldExact),("front_failure",jsonString (failure f))
        ,("program",maybe "null" (jsonString . show) (program f))
        ,("metrics",objectJSON [(k,show v) | (k,v)<-M.toList (counters g)])
        ,("r2_search_work",show (maybe 0 (M.findWithDefault 0 "total_expanded_work" . R2.inducedMetrics) old))
        ,("front_seconds",show (fromIntegral (frontEnd-start)/1e9 :: Double)),("total_seconds",show (fromIntegral (end-start)/1e9 :: Double))
        ,("predictions",arrayJSON [either (const "null") jsonGrid (predict (testInput t)) | t<-tests task])]
  writeFile (out </> "solution.json") (solution++"\n")
  writeFile (out </> "derivation_graph.json") (graphJSON g++"\n")
  writeFile (out </> "trace.txt") (unlines (trace g++[failure f]))
  case old of Nothing->pure (); Just r->R2.saveInduced (out </> "r2-fallback") R2.Full (V4.r2Config (legacyConfig conf)) task r
  putStrLn (taskId task++" "++show mode++" front="++show frontTrain++" held="++show frontHeld++" final="++show (trainExact,heldExact)++" "++failure f)
  pure (intercalate "," [taskId task,show mode,show frontTrain,show frontHeld,show trainExact,show heldExact
    ,show (metric "alignment_attempts" g),show (metric "equality_attempts" g),show (metric "rejected_size_comparisons" g)
    ,show (metric "unexplained_equalities" g),show (metric "ConcreteCrossItemEdgeCount_high_level" g)
    ,show (metric "accepted_abstractions" g),show fallbackCount])

grid :: [(Int,Int,Int)] -> Grid
grid xs=either error id (gridFromCells (Dimensions 24 24) 0 [(Coord x y,c) | (x,y,c)<-xs])
stressTasks :: [(String,Task)]
stressTasks =
  [("A-variable-count",task "A-variable-count" [move 2 False,move 3 False] (move 4 True))
  ,("B-runtime-trap",task "B-runtime-trap" [stack 2 False,stack 3 False] (stack 4 True))
  ,("C-accidental-equality",task "C-accidental-equality" [same 2,same 3] (same 4))
  ,("D-size-index",task "D-size-index" [resize 2,resize 3] (resize 4))
  ,("E-count-mismatch",task "E-count-mismatch" [mismatch 2,mismatch 3] (mismatch 4))]
  where
    task name ps (x,y)=Task name ps [TestPair x (Just y)]
    -- Input enumeration is y-major. Heldout deliberately reverses y order;
    -- semantic X order and object colors remain unambiguous.
    move n rev=let ps=[(2+4*i,if rev then 12-i else 2+i,1+i) | i<-[0..n-1]]
               in (grid ps,grid [(x+1,y,c) | (x,y,c)<-ps])
    stack n rev=let ps=[(2+4*i,if rev then 12-i else 2+i,1+i) | i<-[0..n-1]]
                in (grid ps,grid [(0,2*i,c) | (i,(_,_,c))<-zip [0..] ps])
    same n=let ps=[(2+4*i,2+i,2) | i<-[0..n-1]] in (grid ps,grid [(x+1,y,c) | (x,y,c)<-ps])
    resize n=let ps=[(2+4*i,2+i,1+i) | i<-[0..n-1]]
             in (grid ps,grid (ps++[(x+1,y,c) | (x,y,c)<-ps]))
    mismatch n=let (x,y)=move n False in (x,either error id (gridFromCells (dimensions y) 0
                       ([(Coord 20 20,9)]++[(Coord (3+4*i) (2+i),1+i) | i<-[0..n-1]])))

runMatrix :: FilePath -> Int -> Config -> Task -> IO ()
runMatrix out mechanismBudget conf vertical=do
  createDirectoryIfMissing True out
  rs<-forM (stressTasks++[("03560426",vertical {taskId="03560426"})]) $ \(name,t)->do
    let legacy=legacyConfig conf
        cfg=if name=="03560426" then conf else conf {legacyConfig=legacy {V4.r2Config=(V4.r2Config legacy) {R2.workBudget=mechanismBudget}}}
    forM [minBound..maxBound] $ \mode->runTask (out </> name </> show mode) mode cfg t
  writeFile (out </> "metrics.csv") (unlines ("task,mode,front_train,front_heldout,train_exact,heldout_exact,alignment_attempts,equality_attempts,rejected_size_comparisons,unexplained_equalities,concrete_high_edges,abstractions,fallback_count":concat rs))
