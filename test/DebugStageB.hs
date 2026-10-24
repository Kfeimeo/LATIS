module Main where
import Synthesis.Collection.Front
import ARC.StageAEvaluate (runFront, trainExactOf, heldExactOf)
import ARC.StageBEvaluate
import ARC.Dataset
import Control.Monad (forM_)
import System.Environment (getArgs)
import qualified Data.Map.Strict as M

-- debug helper: latis-debug-stage-b <FamilyB> <seed> <graph budget> [configs...]
main :: IO ()
main=do
  args<-getArgs
  let (famName,seedS,budgetS,cfgs)=case args of (f:s:b:cs)->(f,s,b,cs); _->("MoveToOwnRightEdge","2","40000",[])
      budget=read budgetS :: Int
      fam=head [f | f<-[minBound..maxBound], familyNameB f==famName]
      ins=head [i | i<-mechanismInstancesB 3, insFamilyB i==fam, insSeedB i==read seedS]
      t=instanceTaskB ins
  putStrLn (insRuleB ins)
  forM_ (if null cfgs then configNamesB else cfgs) $ \name->do
    let Just conf0=configByNameB name
        conf=conf0 {stageB=(stageB conf0) {sbGraphBudget=budget}}
    (f,secs)<-runFront conf (training t)
    putStrLn ("== "++name++" "++show secs++"s train="++show (trainExactOf t f)++" held="++show (heldExactOf t f)++" failure="++failure f)
    mapM_ (putStrLn . ("   "++) . take 220) (filter (\l->any (`elem` words l) ["hierarchy","snapshot","ScalarFailure"]) (trace (graph f)))
    print (fmap progExec (program f))
    print (fmap (M.elems . progDefs) (program f))
    print [(k,v) | (k,v)<-M.toList (counters (graph f)), take 2 k=="b_", v/=0]
