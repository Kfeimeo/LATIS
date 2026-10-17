-- Post-hoc diagnostic (never part of solving): run the B1 deduction on a task,
-- then ask whether the deductive DAG contains an ASSEMBLABLE complete program
-- by running the ordinary portfolio cover with an effectively unbounded work
-- allowance (same Join assemble functions, same correlation within each
-- decomposition, same original Grid verifier). Nothing is injected back.
module Main where
import Language.Induced.Base
import Synthesis.InducedR1.Specification
import Synthesis.InducedR2.Learn
import Synthesis.InducedR2.Witness
import Synthesis.InducedR2.PortfolioCover
import Synthesis.InducedR2.VersionSpace
import Synthesis.InducedR2.Diversity (rankWith)
import ARC.Dataset
import Latent.Encode
import qualified Data.Map.Strict as M
import qualified Data.Set as S
import Data.IORef
import Data.List (sortOn)
import System.Environment (getArgs)
import Control.Monad (forM_)

main=do
  args<-getArgs
  let (path,policy)=case args of [p,w]->(p,read w); [p]->(p,Bidirectional); _->("results/v03/stress/A-absolute-relative/task.json",Bidirectional)
  task<-either error id <$> loadTask path
  let conf=defaultInduced {witnessPolicy=policy}
  engine<-newEngine Full conf
  writeIORef (exactTrainingRef engine) (Just (training task))
  let zs=[(encode defaultEncoder x,encode defaultEncoder y) | (x,y)<-training task]
      q=functionTask SceneT SceneT [(M.empty,SceneV x,SceneV y) | (x,y)<-zs]
  root<-learn engine (depthBound conf) q
  s<-readIORef (spaceRef engine)
  m<-readIORef (metricsRef engine)
  putStrLn ("deduction: root="++show root++" nodes="++show (M.size (nodes s))++" work="++show (M.findWithDefault 0 "total_expanded_work" m)++" joins="++show (length [() | Join _ _ _<-M.elems (nodes s)]))
  (covered,used)<-coverPortfolio 0 True True 96 (10^(8::Int)) s root
  putStrLn ("unbounded cover: candidates="++show (length covered)++" attempts="++show used)
  let exact=[e | e<-covered,typeCheck M.empty e==Right (ArrowT SceneT SceneT),all (\(x,y)->predictInduced conf e x==Right y) (training task)]
  putStrLn ("training-exact assembled programs: "++show (length exact))
  forM_ (take 5 (sortOn (rankWith True) exact)) $ \e->do
    let (cost,_,_)=rankWith True e
        held=all (\t->maybe False (\y->predictInduced conf e (testInput t)==Right y) (testOutput t)) (tests task)
    putStrLn ("  cost="++show cost++" heldout(post-hoc)="++show held++" symbols="++show (S.toList (symbols e)))
    putStrLn ("  "++exprText e)
  -- protocol-budget cover for comparison (same DAG, 12500 attempts)
  (coveredP,usedP)<-coverPortfolio 0 True True 96 12500 s root
  putStrLn ("protocol cover (12500): candidates="++show (length coveredP)++" attempts="++show usedP++" exact="++show (length [e | e<-coveredP,all (\(x,y)->predictInduced conf e x==Right y) (training task)]))
