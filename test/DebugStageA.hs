module Main where
import Synthesis.Collection.Front
import ARC.StageAEvaluate
import ARC.Dataset
import Latent.Grid
import Control.Monad (forM_)
import System.Environment (getArgs)

-- debug helper: latis-debug-stage-a <Family> <seed> [configs...]
main :: IO ()
main=do
  args<-getArgs
  let (famName,seedS,cfgs)=case args of (f:s:cs)->(f,s,cs); _->("SizeFromFeature","1",[])
      fam=head [f | f<-[minBound..maxBound], familyName f==famName]
      ins=head [i | i<-mechanismInstances 3, insFamily i==fam, insSeed i==read seedS]
      t=instanceTask ins
  putStrLn (insRule ins)
  forM_ (training t) $ \(x,y)->putStrLn ("  train "++show (dimensions x)++" -> "++show (dimensions y))
  putStrLn ("  held "++show (dimensions (fst (insHeld ins)))++" -> "++show (dimensions (snd (insHeld ins))))
  forM_ (training t) $ \(x,_)->mapM_ (putStrLn . ("    "++) . concatMap show) (rows x)
  forM_ (if null cfgs then configNames else cfgs) $ \name->do
    let Just conf=configByName name
        f=frontSearch SafeOnline conf (training t)
    putStrLn ("== "++name++" train="++show (trainExactOf t f)++" held="++show (heldExactOf t f)++" failure="++failure f)
    mapM_ (putStrLn . ("   "++)) (filter (\l->take 4 l `elem` ["size","Size","shar","firs","foll","Scal","Alig"]) (trace (graph f)))
    print (fmap progSize (program f))
    print (fmap progExec (program f))
