module Main where
import Synthesis.Collection.Front
import Synthesis.Collection.Indexed
import Synthesis.Collection.Counterfactual
import qualified ARC.CollectionV61Evaluate as E
import ARC.CollectionV61Generate
import ARC.Dataset
import Latent.Grid
import qualified Latent.Object as O
import qualified Data.Map.Strict as M
import qualified Data.Set as S
import Control.Monad (unless,forM_,when)
import Data.Either (isLeft)
import Data.List (sort,nub)
import Data.Maybe (fromMaybe)

assert :: String -> Bool -> IO ()
assert name ok=unless ok (error ("FAIL "++name)) >> putStrLn ("PASS "++name)
obj :: Int -> Int -> Int -> Int -> Int -> O.Object
obj x y w h c=O.Object 99 (Coord x y) (M.fromList [(Coord i j,c) | i<-[0..w-1], j<-[0..h-1]]) 0
conf :: Config
conf=E.v61Config
run :: Mode -> Task -> Front
run mode t=frontSearch mode conf (training t)
fixture :: Task -> String -> Task
fixture vertical name=fromMaybe (error name) (lookup name (E.v61Tasks vertical))
trainOn, heldOn :: Task -> Program -> Bool
trainOn t p=all (\(x,y)->runProgram p x==Right y) (training t)
heldOn t p=all (\q->maybe False (\y->runProgram p (testInput q)==Right y) (testOutput q)) (tests t)
predictions :: Task -> Front -> [Either String Grid]
predictions t f=[runProgram p (testInput q) | Just p<-[program f], q<-tests t]
-- Semantic normalization: expand Call(I_k) through the program library.
normalize :: Library -> Scalar -> Scalar
normalize lib (Call n args)=case M.lookup n lib of Just d->normalize lib (instantiate args (absBody d)); Nothing->Call n args
normalize lib (Plus a b)=Plus (normalize lib a) (normalize lib b)
normalize _ e=e
classSets :: Front -> M.Map String (S.Set Scalar)
classSets f=M.fromListWith S.union [(scSlot c,S.fromList (map (normalize lib . repExpr) (scReps c))) | c<-classes (graph f)]
  where lib=maybe M.empty progLibrary (program f)
slotClass :: String -> Front -> SemanticClass
slotClass slot f=case [c | c<-classes (graph f), scSlot c==slot] of cs@(_:_)->last cs; []->error ("no class "++slot)
m :: String -> Front -> Int
m k f=metric k (graph f)

main :: IO ()
main=do
  vertical<-loadTask "data/03560426.json" >>= either error pure
  let task=fixture vertical
  -- policy plumbing
  assert "SafeOnline forces the safe policy" (safePolicy SafeOnline defaultConfig && not (safePolicy ExclusiveReuseLegacy conf) && safePolicy NoCounterfactual conf && not (safePolicy Full defaultConfig))
  let xs=[obj i 0 1 1 1 | i<-[0..6]]
  assert "enumeration permutation is a permutation" (sort (map O.position (permuteObjects (Just 7) xs))==map O.position xs && permuteObjects (Just 7) xs/=xs)
  -- ordering / type properties on random sets
  forM_ [1..40::Int] $ \seed->do
    let n=2+seed `mod` 4
        os=[obj (3*i) ((seed*i) `mod` 5) (1+(seed+i) `mod` 2) (1+(seed*i) `mod` 3) 5 | i<-[0..n-1]]
        set=objectSet (os++[obj 20 ((seed) `mod` 5) 1 1 5])
        tie=any (\o->O.position o `seq` cy (O.position o)==seed `mod` 5) os
    when tie $ assert ("seed "++show seed++": Y tie rejected without hidden tiebreaker") (isLeft (orderBy seedKeys NeedCrossItemAlignment InputSet (Anchor TL AY) set))
    assert ("seed "++show seed++": Lex(Y,X) refinement is explicit and strict") (either (const False) ((==n+1) . cardinality) (orderBy seedKeys NeedCrossItemAlignment InputSet (Lex (Anchor TL AY) (Anchor TL AX)) set))
    let a=placedFromObject (obj 0 0 (1+seed `mod` 3) (1+(seed `div` 3) `mod` 3) 5); b=placedFromObject (obj 0 0 (1+(seed `div` 3) `mod` 3) (1+seed `mod` 3) 5)
    assert ("seed "++show seed++": object equality unifies the size index first") (if placedSig a/=placedSig b then isLeft (objectEqual True a b) else objectEqual True a b==Right True)
  -- candidate completeness: SafeOnline (after completion) vs NoOnlineAbstraction
  forM_ ["A-seed-key","B-composite-key","C-runtime-order-trap","D-size-index-trap","E-first-item-counterfactual","F-repeated-pattern","G-nonunique-reuse","H-partial-reuse","03560426"] $ \name->do
    let t=task name
        safe=run SafeOnline t
        no=run NoOnlineAbstraction t
    assert (name++": SafeOnline solves iff NoOnline solves") (maybe False (trainOn t) (program safe)==maybe False (trainOn t) (program no))
    assert (name++": SafeOnline classes cover the NoOnline classes after normalization") (M.isSubmapOfBy S.isSubsetOf (M.map (S.map show) (classSets no)) (M.map (S.map show) (classSets safe)))
    assert (name++": SafeOnline prediction equals NoOnline prediction") (predictions t safe==predictions t no)
    assert (name++": no concrete high-level edges / untriggered expansions") (m "ConcreteCrossItemEdgeCount_high_level" safe==0 && m "UntriggeredExpansionCount" safe==0 && m "expanded_frozen_features" safe==0)
    assert (name++": RankCorrespondence reuse loses no witness") (alignmentEvidence (graph safe)==alignmentEvidence (graph no))
    assert (name++": deferred candidates are all resumed under SafeOnline") (all ((/="deferred") . dfStatus) (deferred (graph safe)) && m "resumed_candidates" safe>=m "deferred_candidates" safe)
  -- abstraction-misleading tasks
  let g=task "G-nonunique-reuse"
      gSafe=run SafeOnline g; gEx=run ExclusiveReuseLegacy g; gNo=run NoOnlineAbstraction g
  assert "G: exclusive reuse keeps only the Call and fails heldout" (maybe False (trainOn g) (program gEx) && not (maybe False (heldOn g) (program gEx)) && m "exclusive_reuse_missed_solutions" gEx>0 && m "exclusive_reuse_missed_candidates" gEx>0)
  assert "G: SafeOnline recovers the residual candidate and re-selects" (maybe False (heldOn g) (program gSafe) && m "recovered_solutions" gSafe>0 && m "reselected_after_completion" gSafe>0 && m "reuse_hits" gSafe>0)
  assert "G: SafeOnline first solution is cheaper than NoOnline" (m "first_solution_work" gSafe<m "search_work" gNo)
  assert "G: resumed class contains CurrentY, the anchor expansion and the Call" (let c=slotClass "following-AY" gSafe; es=map (show . repExpr) (scReps c) in all (`elem` es) ["Atom (Pos Current (Ax AY))","Plus (Atom (Pos Previous (Ax AY))) (Atom (Ext Previous (Ax AY)))"] && any ((=="Call") . take 4) es && scSelected c==Atom (Pos Current (Ax AY)))
  let h=task "H-partial-reuse"
      hSafe=run SafeOnline h
  assert "H: preferred Call branch fails on a case and the residual grammar is resumed immediately" (m "reuse_attempts" hSafe>0 && m "resume_events" hSafe>0 && any ((=="resumed-immediately") . dfStatus) (deferred (graph hSafe)) && maybe False (heldOn h) (program hSafe))
  -- paired non-identifiable tasks
  let pl=task "P-gridleft"; pc=task "P-currentx"
  assert "P: identical training grids" (training pl==training pc)
  let plSafe=run SafeOnline pl; pcSafe=run SafeOnline pc
      cls=slotClass "first-AX" plSafe
      es=map (show . repExpr) (scReps cls)
      sigOf e=head [repCF r | r<-scReps cls, show (repExpr r)==e]
  assert "P: both hypotheses survive in the class" (all (`elem` es) ["Atom (SceneLow (Ax AX))","Atom (Pos Current (Ax AX))"])
  assert "P: counterfactual distinguishes the pair" (sigOf "Atom (SceneLow (Ax AX))"/=sigOf "Atom (Pos Current (Ax AX))")
  assert "P: identical training gives identical selection" (program plSafe==program pcSafe)
  assert "P: non-identifiable: exactly one heldout can be right" (maybe False (heldOn pl) (program plSafe)/=maybe False (heldOn pc) (program pcSafe))
  -- first-solution savings on F and the vertical task
  forM_ ["F-repeated-pattern","03560426"] $ \name->do
    let t=task name; safe=run SafeOnline t; no=run NoOnlineAbstraction t; ex=run ExclusiveReuseLegacy t
    assert (name++": first solution work SafeOnline < NoOnline") (m "first_solution_work" safe<m "search_work" no)
    assert (name++": exclusive and safe first solutions cost the same") (m "first_solution_work" safe==m "first_solution_work" ex)
    assert (name++": completion work is reported") (m "completion_work" safe==m "total_work_to_exhaustion" safe-m "first_solution_work" safe)
  let v=run SafeOnline vertical
  assert "03560426 SafeOnline train/heldout exact" (maybe False (trainOn vertical) (program v) && maybe False (heldOn vertical) (program v))
  assert "03560426 online reuse still happens" (m "online_abstraction_reuses" v>0)
  -- metamorphic smoke on development seeds (1000-based; evaluation uses 2000-based)
  forM_ [minBound..maxBound] $ \fam->do
    let (instances,rejected)=generateValid fam (1000+100*fromEnum fam) 3 60
    assert (familyName fam++": generator yields 3 valid instances (rejected "++show (length rejected)++")") (length instances==3)
    forM_ instances $ \ins->do
      let t=instanceTask ins
          safe=frontSearch SafeOnline conf (training t)
          no=frontSearch NoOnlineAbstraction conf (training t)
          perm=frontSearch SafeOnline conf {enumerationSeed=Just (insSeed ins)} (training t)
      assert (familyName fam++" "++show (insSeed ins)++": permutation invariance") (predictions t safe==predictions t perm && alignmentEvidence (graph safe)==alignmentEvidence (graph perm))
      assert (familyName fam++" "++show (insSeed ins)++": SafeOnline solves iff NoOnline") (maybe False (trainOn t) (program safe)==maybe False (trainOn t) (program no))
      assert (familyName fam++" "++show (insSeed ins)++": SafeOnline prediction equals NoOnline") (predictions t safe==predictions t no)
      assert (familyName fam++" "++show (insSeed ins)++": invariants") (m "ConcreteCrossItemEdgeCount_high_level" safe==0 && m "UntriggeredExpansionCount" safe==0)
      when (familyExpectsTies fam) $ assert (familyName fam++" "++show (insSeed ins)++": ties rejected") (m "ordering_ties_rejected" safe>0)
      case translatedInstance (1,0) ins of
        Right v' -> let t'=instanceTask v'; tf=frontSearch SafeOnline conf (training t') in
          assert (familyName fam++" "++show (insSeed ins)++": translation keeps the correspondence explanation") (map (map alignmentExpression) (take 1 (reverse (alignmentEvidence (graph tf))))==map (map alignmentExpression) (take 1 (reverse (alignmentEvidence (graph safe)))))
        Left _ -> pure ()
  assert "families enumerate" (length (nub [minBound..maxBound :: Family])==7)
  putStrLn "All collection-v61 tests passed."
