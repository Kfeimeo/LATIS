-- Fixed-DAG extractor comparison (post-hoc diagnostic, never part of solving).
-- Deduce ONCE with the B1Q configuration, then run the original refine cover
-- and the lazy cover on the identical DAG with the identical attempt budget
-- (the protocol cover allowance, workBudget/20 = 12500). Report, per cover:
-- candidates, training-exact candidates (original Grid verifier), post-hoc
-- heldout-correct candidates, and the rank-selected program. This isolates the
-- extractor from the deduction-budget interaction of the full pipeline.
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
import Data.IORef
import Data.List (sortOn)
import System.Environment (getArgs)
import Control.Monad (forM_)

main=do
  args<-getArgs
  let (path,budget)=case args of [p,b]->(p,read b); [p]->(p,12500); _->("results/v03/stress/A-absolute-relative/task.json",12500)
  task<-either error id <$> loadTask path
  let conf=defaultInduced {witnessPolicy=Bidirectional,schedulePolicy=DeferNonLocal,deferredWorkBudget=62500}
  engine<-newEngine Full conf
  writeIORef (exactTrainingRef engine) (Just (training task))
  let zs=[(encode defaultEncoder x,encode defaultEncoder y) | (x,y)<-training task]
      q=functionTask SceneT SceneT [(M.empty,SceneV x,SceneV y) | (x,y)<-zs]
  root<-learnWithDemands engine q
  s<-readIORef (spaceRef engine)
  m<-readIORef (metricsRef engine)
  putStrLn ("deduction(B1Q): root="++show root++" nodes="++show (M.size (nodes s))++" joins="++show (length [() | Join _ _ _<-M.elems (nodes s)])++" work="++show (M.findWithDefault 0 "total_expanded_work" m)++" deferred_released="++show (M.findWithDefault 0 "deferred_released" m))
  let trainOk e=typeCheck M.empty e==Right (ArrowT SceneT SceneT) && all (\(x,y)->predictInduced conf e x==Right y) (training task)
      heldOk e=not (null (tests task)) && all (\t->maybe False (\y->predictInduced conf e (testInput t)==Right y) (testOutput t)) (tests task)
  forM_ [("refine",coverPortfolio),("lazy",coverLazy)] $ \(name,cover)->do
    (cs,used)<-cover 0 True True 96 budget s root
    let exact=[e | e<-cs,trainOk e]
        held=[e | e<-exact,heldOk e]
        selected=case sortOn (rankWith True) exact of e:_->Just e; _->Nothing
    putStrLn (name++": budget="++show budget++" attempts="++show used++" candidates="++show (length cs)++" train_exact="++show (length exact)++" heldout_correct(post-hoc)="++show (length held))
    case selected of
      Just e->putStrLn ("  selected cost="++show (let (c,_,_)=rankWith True e in c)++" heldout="++show (heldOk e)++" :: "++exprText e)
      Nothing->putStrLn "  selected: none"
