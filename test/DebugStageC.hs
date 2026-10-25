module Main where
import Synthesis.Collection.Front
import ARC.StageAEvaluate (runFront, trainExactOf, heldExactOf)
import ARC.StageCEvaluate
import ARC.Dataset
import Control.Monad (forM_)
import System.Environment (getArgs)
import qualified Data.Map.Strict as M

-- debug helper: latis-debug-stage-c [<FamilyC>|all] <seed> [configs...]
main :: IO ()
main=do
  args<-getArgs
  let (famName,seedS,cfgs)=case args of (f:s:cs)->(f,s,cs); [f]->(f,"1",[]); _->("all","1",[])
      fams=if famName=="all" then [minBound..maxBound] else [f | f<-[minBound..maxBound], familyNameC f==famName]
  forM_ fams $ \fam->do
    let ins=head [i | i<-mechanismInstancesC 3, insFamilyC i==fam, insSeedC i==read seedS]
        t=instanceTaskC ins
    putStrLn ("### "++taskId t++": "++insRuleC ins)
    forM_ (if null cfgs then configNamesC else cfgs) $ \name->do
      let Just conf=configByNameC name
      (f,secs)<-runFront conf (training t)
      putStrLn ("== "++name++" "++show secs++"s train="++show (trainExactOf t f)++" held="++show (heldExactOf t f)++" failure="++take 200 (failure f))
      mapM_ (putStrLn . ("   "++) . take 240) (filter (\l->any (`elem` words l) ["ObjectTransform","relation","diagonal","shape","ObjectRelation","SizeRule"]) (trace (graph f)))
      print (fmap progTransform (program f))
      print [(k,v) | (k,v)<-M.toList (counters (graph f)), take 2 k=="c_", v/=0]
