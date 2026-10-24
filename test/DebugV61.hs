module Main where
import Synthesis.Collection.Front
import Synthesis.Collection.Counterfactual
import qualified ARC.CollectionV61Evaluate as E
import ARC.Dataset
import Control.Monad (forM_)
import Data.Maybe (fromMaybe)
import System.Environment (getArgs)

main :: IO ()
main=do
  args<-getArgs
  vertical<-loadTask "data/03560426.json" >>= either error pure
  let name=case args of (n:_)->n; _->"G-nonunique-reuse"
      modes=case args of (_:ms)->map read ms; _->[ExclusiveReuseLegacy,SafeOnline]
      t=fromMaybe (error name) (lookup name (E.v61Tasks vertical))
  forM_ modes $ \mode->do
    let f=frontSearch mode E.v61Config (training t)
    putStrLn ("==== "++show mode++" failure="++failure f)
    mapM_ putStrLn (trace (graph f))
    forM_ (classes (graph f)) $ \c->do
      putStrLn ("class "++scSlot c++" denot="++show (scDenotation c)++" selected="++show (scSelected c))
      forM_ (scReps c) $ \r->putStrLn ("   "++show (ccTotal (repCost r))++" "++repClass r++" "++show (repExpr r))
    forM_ (deferred (graph f)) print
    putStrLn ("heldout exact: "++show (maybe False (\p->all (\q->maybe False (\y->runProgram p (testInput q)==Right y) (testOutput q)) (tests t)) (program f)))
    print (fmap progExec (program f))
    print (fmap progDefs (program f))
    forM_ (tests t) $ \q->maybe (pure ()) (\p->print (runProgram p (testInput q))) (program f)
