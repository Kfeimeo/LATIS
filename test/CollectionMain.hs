module Main where
import Synthesis.Collection
import qualified ARC.CollectionEvaluate as E
import ARC.Dataset
import Latent.Grid
import qualified Latent.Object as O
import qualified Data.Map.Strict as M
import Control.Monad (unless,forM_)
import Data.Either (isLeft)
import Data.List (permutations)

assert :: String -> Bool -> IO ()
assert name ok=unless ok (error name) >> putStrLn ("PASS "++name)
obj :: Int -> Int -> Int -> Int -> O.Object
obj x y w c=O.Object 99 (Coord x y) (M.fromList [(Coord i 0,c) | i<-[0..w-1]]) 0
right :: Either String a -> a
right=either error id
fixture :: String -> Task
fixture name=maybe (error name) id (lookup name E.stressTasks)
main :: IO ()
main=do
  let a=obj 1 3 1 2; b=obj 4 1 2 3; set=objectSet [a,b]
      keys=ontologyKeys defaultConfig
      ordered origin s=orderBy keys NeedCrossItemAlignment origin XCoord s
  assert "set permutation and IDs irrelevant" (set==objectSet [b {O.objectId=8},a {O.objectId=7}])
  assert "Count ignores duplicate placement" (count (objectSet [a,a,b])==2)
  assert "dependent object equality rejects different size" (isLeft (objectEqual Full a b))
  assert "NoDependentIndex actually removes unification" (objectEqual NoDependentIndex a b==Right False)
  assert "polymorphic observer accepts mixed sizes" (map observeColor [a,b]==[Just 2,Just 3])
  assert "ordering is unavailable without an ordering trigger" (null (visibleKeys [NeedCount] keys))
  assert "invisible key rejected" (isLeft (orderBy [YCoord] NeedOrderedView InputSet XCoord set))
  assert "wrong trigger rejected" (isLeft (orderBy keys NeedCount InputSet XCoord set))
  assert "tie rejected without hidden runtime tiebreaker" (isLeft (ordered InputSet (objectSet [a,a {O.position=Coord 1 5}])))
  let u=right (ordered InputSet set)
      v=right (ordered OutputSet set)
      short=right (ordered OutputSet (objectSet [a]))
      witness=right (rankAlign u v)
  assert "Fin cardinality bounds" (isLeft (rank u (-1)) && isLeft (rank u 2))
  assert "rank only on ordered representation" (fmap O.position (rank u 0)==Right (O.position a))
  assert "cardinality mismatch rejects total alignment" (isLeft (rankAlign u short))
  assert "equal object does not justify cross-origin edge" (not (legalComparison InputSet OutputSet Nothing a a))
  assert "witness authorizes only its own pair" (legalComparison InputSet OutputSet (Just witness) (a {O.objectId=0}) (a {O.objectId=0})
    && not (legalComparison InputSet OutputSet (Just witness) a b))
  assert "AlignmentLift handles variable cardinality" (alignmentLift keys [(set,set),(objectSet [a],objectSet [a])]
    [[(a,a),(b,b)],[(a,a)]]==Right (XCoord,XCoord))
  assert "AlignmentLift rejects per-case switching" (isLeft (alignmentLift keys [(set,set),(set,set)]
    [[(a,a),(b,b)],[(a,b),(b,a)]]))
  assert "all enumeration permutations preserve semantic order" (all (\os->ordered InputSet (objectSet os)==ordered InputSet (objectSet [a,b,obj 8 6 3 4]))
    (permutations [a,b,obj 8 6 3 4]))
  forM_ (take 3 E.stressTasks) $ \(name,t)->do
    let f=frontSearch Full defaultConfig (training t)
        exact p=all (\q->maybe False (\y->runProgram p (testInput q)==Right y) (testOutput q)) (tests t)
    assert (name++" heldout unseen cardinality") (maybe False exact (program f))
    assert (name++" no concrete high-level edges") (metric "ConcreteCrossItemEdgeCount_high_level" (graph f)==0)
    assert (name++" triggered expansion invariant") (metric "UntriggeredExpansionCount" (graph f)==0)
    assert (name++" executable cohesive abstraction") (metric "accepted_abstractions" (graph f)>0 && not (null (abstractions (graph f))))
    let unwrapped=frontSearch NoSemanticCohesion defaultConfig (training t)
    assert (name++" abstraction decomposition preserves output") (maybe False exact (program unwrapped) && null (abstractions (graph unwrapped)))
    assert (name++" frozen features excluded") (all ((==Unmatched) . status) (expandedFrontier (features (graph f))))
  let trap=fixture "B-runtime-trap"
      unsafe=frontSearch DirectSetIndexing defaultConfig (training trap)
  assert "runtime indexing training fits" (maybe False (\p->all (\(x,y)->runProgram p x==Right y) (training trap)) (program unsafe))
  assert "runtime indexing heldout fails" (maybe False (\p->any (\t->Just (runProgram p (testInput t))/=fmap Right (testOutput t)) (tests trap)) (program unsafe))
  let accidental=fixture "C-accidental-equality"
      full=frontSearch Full defaultConfig (training accidental)
      noalign=frontSearch NoAlignmentExplanation defaultConfig (training accidental)
      noeager=frontSearch NoEagerAbstraction defaultConfig (training accidental)
  assert "explained alignment reduces equality attempts" (metric "equality_attempts" (graph full)<metric "equality_attempts" (graph noalign))
  assert "unexplained equality ablation admits accidental matches" (metric "unexplained_equalities" (graph noalign)>0)
  assert "eager abstraction removes concrete high edges" (metric "ConcreteCrossItemEdgeCount_high_level" (graph noeager)>0)
  let resize=fixture "D-size-index"
      dep=frontSearch Full defaultConfig (training resize)
      nodep=frontSearch NoDependentIndex defaultConfig (training resize)
  assert "size mismatch is guarded before equality" (metric "rejected_size_comparisons" (graph dep)>0 && metric "rejected_size_comparisons" (graph nodep)==0)
  assert "budget zero is enforced" (program (frontSearch Full defaultConfig {alignmentBudget=0} (training trap))==Nothing)
  assert "empty examples rejected" (program (frontSearch Full defaultConfig [])==Nothing)
  t<-loadTask "data/03560426.json" >>= either error pure
  let f=frontSearch Full defaultConfig (training t)
  assert "03560426 passes variable-cardinality grounding" (not (null (alignmentEvidence (graph f))))
  assert "03560426 explained alignment lifted" (metric "alignment_lift_successes" (graph f)>0)
  assert "03560426 learned sequence executes on all training grids" (maybe False (\p->all (\(x,y)->runProgram p x==Right y) (training t)) (program f))
  assert "03560426 heldout exact" (maybe False (\p->all (\q->maybe False (\y->runProgram p (testInput q)==Right y) (testOutput q)) (tests t)) (program f))
  assert "03560426 no concrete edge leak" (metric "ConcreteCrossItemEdgeCount_high_level" (graph f)==0)
  assert "03560426 geometry completion triggered" (metric "construction_triggers" (graph f)>0)
  let noCohesion=frontSearch NoSemanticCohesion defaultConfig (training t)
  assert "03560426 inline refinement equivalent" (maybe False (\p->all (\q->maybe False (\y->runProgram p (testInput q)==Right y) (testOutput q)) (tests t)) (program noCohesion))
  putStrLn "All collection tests passed."
