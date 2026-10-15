{-# LANGUAGE GADTs #-}
module Main where
import ARC.Dataset
import ARC.Evaluate (syntheticTasks)
import ARC.JointEvaluate (stressTasks,heldout)
import Synthesis.Joint
import Synthesis.Search (defaultSearch,SearchConfig(..),search,solution)
import Synthesis.Constraint.State
import Synthesis.Constraint.Propagate
import Synthesis.Constraint.Metrics
import Synthesis.Expression.FreeVars
import Synthesis.Expression.Domain
import Synthesis.Search.Memo
import Synthesis.Skeleton
import Synthesis.Hole
import Synthesis.Verify
import Synthesis.MDL
import Latent.Grid
import Latent.Object
import Latent.Encode
import Language.Types (Ty(TVec))
import Language.DSA (Operator(IdentityOp))
import qualified Data.Set as S
import Data.List (isInfixOf)
import Control.Monad (unless,forM_)
import System.Exit (die)

assert :: String -> Bool -> IO ()
assert label good=unless good (die ("FAIL joint: "++label))
main :: IO ()
main=do
  let config=defaultSearch {solutionLimit=100000}
  task<-loadTask "data/03560426.json" >>= either die pure
  result<-jointSearch JointConstraint config (training task)
  assert "core exact and unchanged latent program" (heldout config task result && maybe False (verify (encoder config) (training task)) (jointSolution result) &&
    case jointSolution result of Just (ScanP LeftToRight _ step)->"BR(prev) - TL(current)" `isInfixOf` actionText step; _->False)
  let metrics=jointMetrics result
  assert "core state acceptance" (expanded metrics<1305 && maybe False (<1251) (firstExpanded metrics))
  assert "inferred rather than guessed dependencies" (dependencyBranches metrics==0 && legacyDependencyChecks metrics==0 && dependenciesDerived metrics>0)
  assert "core exhausted preserved finite grammar" (exhaustive metrics && not (exhaustedBudget metrics))
  assert "every constraint has provenance" (all (not . null . derivedBy . provenance) (S.toList (constraintSet (finalState result))))
  let (stable,en)=propagateToFixpoint JointConstraint (finalState result) emptyEngine
      (again,en')=propagateToFixpoint JointConstraint stable en
  assert "pure fixed point is idempotent and does no repeated work" (stateSignature stable==stateSignature again && counters en==counters en')
  forM_ [minBound..maxBound] $ \mode->do
    r<-jointSearch mode config (training task)
    assert (show mode++" core exact") (heldout config task r && exhaustive (jointMetrics r))
    assert (show mode++" same MDL") (fmap (totalCost . objective 1 2) (jointSolution r)==fmap (totalCost . objective 1 2) (jointSolution result))
    if mode==NoWitnessFirst then assert "legacy ordering pays actual dependency checks" (legacyDependencyChecks (jointMetrics r)>0) else pure ()
    if mode==NoMemoization then assert "all cache hits disabled" (expressionMemoHits (jointMetrics r)+partialMemoHits (jointMetrics r)+programMemoHits (jointMetrics r)==0) else pure ()
  forM_ (syntheticTasks++stressTasks) $ \t->do
    r<-jointSearch JointConstraint config (training t)
    assert (taskId t++" train and heldout") (heldout config t r && maybe False (verify (encoder config) (training t)) (jointSolution r))
    assert (taskId t++" exhaustive, no numeric enumeration") (exhaustive (jointMetrics r) && enumeratedHoles (jointMetrics r)==0)
    case taskId t of
      "map-scan-ambiguity" -> assert "global dominance selects map" (case jointSolution r of Just (MapP _ _)->provenDominance (jointMetrics r)>0; _->False)
      "true-scan-lazy-prev" -> assert "prev activated on real dependency" (previousExpansions (jointMetrics r)>0 && case jointSolution r of Just (ScanP _ _ a)->actionPrevious a; _->False)
      "grid-without-prev" -> assert "grid observer excludes previous in selected map" (case jointSolution r of Just (MapP _ a)->GridSource `S.member` actionFreeVars a && not (actionPrevious a); _->False)
      "constant-transform" -> assert "constant operator no context growth before first solution" (firstContextExpansions (jointMetrics r)==Just 0)
      "equivalent-expressions" -> assert "cache merges observationally identical holes" (expressionMemoHits (jointMetrics r)>0)
      "wrong-early-skeleton" -> assert "contradictions before complete candidates" (contradictions (jointMetrics r)>0 && verifierCalls (jointMetrics r)<10)
      _ -> pure ()
  -- A deferred witness-consistent expression must survive the first cheap term.
  let t=first "stress fixtures" stressTasks
  a<-jointSearch JointConstraint config (training t)
  b<-jointSearch NoLazyContext config (training t)
  c<-jointSearch NoMemoization config (training t)
  assert "deferred context frontier equals eager finite valid set" (texts a==texts b && texts a==texts c)
  unpruned<-jointSearch NoStructuralDominance config (training t)
  assert "dominance only removes globally identical scan/map pairs" (all (represented (texts a)) (jointValid unpruned))
  let x=encode (encoder config) (fst (first "training fixtures" (training t)))
      o=first "fixture objects" (objects x)
      ctx=Context o Nothing (canvas x)
      h=Hole "vec" TVec [Constraint ctx (Vec 1 0)]
  assert "memo key ignores unobservable IDs" (domainKey h currentScope==domainKey (Hole "other" TVec [Constraint ctx {current=o {objectId=999}} (Vec 1 0)]) currentScope)
  assert "memo distinguishes context binders" (domainKey h currentScope/=domainKey h fullScope)
  assert "bound Object operand is retained in whole-action dependencies" (actionFreeVars (Fixed IdentityOp)==currentScope && actionFreeVars (Move (ConstantVector (Vec 1 0)))==currentScope)
  let mem=rememberPartial "a" emptyMemo
  assert "partial memo collision bucket stores full key" (seenPartial "a" mem && not (seenPartial "b" mem))
  tiny<-jointSearch JointConstraint config {stateBudget=1} (training task)
  assert "budget termination explicit" (exhaustedBudget (jointMetrics tiny) && not (exhaustive (jointMetrics tiny)))
  baseline<-search config (training task)
  assert "v0.1 still runnable" (maybe False (verify (encoder config) (training task)) (solution baseline))
  let blank=either error id (mkGrid [[0,0],[0,0]])
  empty<-jointSearch JointConstraint config [(blank,blank)]
  assert "empty instance sets do not contradict fixed operators" (exhaustive (jointMetrics empty) && any (\p->case p of MapP _ (Fixed op)->show op=="IdentityOp"; _->False) (jointValid empty))
  assert "program memo avoids identical predicates in different order guards" (programMemoHits (jointMetrics empty)>0)
  putStrLn "PASS joint: seven modes, core acceptance, 11 regressions, six stress tasks, fixedpoint/provenance/memo/completeness/budget checks."
  where texts=S.fromList . map programText . jointValid
        represented kept p@(ScanP order seed step)
          | actionText seed==actionText step && not (actionPrevious step) = programText (MapP order seed) `S.member` kept
          | otherwise = programText p `S.member` kept
        represented kept p=programText p `S.member` kept
        first _ (x:_)=x
        first label []=error ("missing "++label)
