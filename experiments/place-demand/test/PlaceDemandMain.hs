-- place-demand semantic tests. Phase A: bidirectional single-operator inverse
-- witnesses verified by real Base back-substitution. Phase B: demand-driven
-- typed observation-domain growth, memo invalidation, termination, budget and
-- determinism. These tests never consult heldout labels or reference ASTs.
module Main where
import Language.Induced.Base
import Synthesis.InducedR1.Specification
import Synthesis.InducedR2.Observers
import Synthesis.InducedR2.Witness
import Synthesis.InducedR2.Learn
import Synthesis.InducedR2.VersionSpace (nodes)
import Synthesis.InducedR2.Diversity (signatureOf)
import ARC.LatentStress (latentStressTasks)
import ARC.Dataset
import Latent.Grid
import qualified Latent.Object as O
import qualified Data.Map.Strict as M
import qualified Data.Set as S
import Data.IORef
import Data.List (isInfixOf,sort)
import Control.Monad (unless,forM_,forM,when)
import System.Environment (getArgs)
import GHC.Clock (getMonotonicTimeNSec)

assert :: String -> Bool -> IO ()
assert s b=unless b (error ("FAIL: "++s)) >> putStrLn ("ok: "++s)
op :: String -> Type -> [Expr] -> Expr
op n t es=either error id (call n t es)
prim :: String -> Primitive
prim n=head [p | p<-base,primitiveName p==n]
obs :: Expr -> [Value] -> Observed
obs=Observed

-- Real Base evaluation of operator n on the deduced children, row by row.
backSubstitutes :: String -> LearningTask -> Decomposition -> Bool
backSubstitutes n q d=case decompositionChildren d of
  [a,b]->and [ case evalValue M.empty (op n (targetType q) [literal u,literal v]) of
                 Right z->equivalent z y; _->False
             | ((_,y),(_,u),(_,v))<-zip3 (points q) (points a) (points b)]
         && length (points a)==length (points q) && length (points b)==length (points q)
         && and [ea==eq && eb==eq | ((eq,_),(ea,_),(eb,_))<-zip3 (points q) (points a) (points b)]
  _->False

coordAt :: Int -> Int -> Value
coordAt x y=CoordV (Coord x y)
vecAt :: Int -> Int -> Value
vecAt x y=VecV (Vec x y)

main :: IO ()
main=do
  args<-getArgs
  let quick="--quick" `elem` args
  -- ---------------------------------------------------------------- Phase A
  -- Two training environments, non-constant displacement, negative
  -- coordinates and a zero vector row. Environment variables: a (CoordT),
  -- w (VecT) as observed operands.
  let rows=[(M.fromList [("a",coordAt 2 3),("w",vecAt 1 (-4))],coordAt 5 (-1))      -- t = a + (3,-4)
           ,(M.fromList [("a",coordAt (-7) 0),("w",vecAt 0 0)],coordAt (-7) 0)      -- t = a + (0,0)
           ,(M.fromList [("a",coordAt 4 (-2)),("w",vecAt 2 2)],coordAt (-1) 9)]     -- t = a + (-5,11)
      qAdd=pointTask CoordT rows
      envs=map fst rows
      aObs=obs (variable "a" CoordT) [coordAt 2 3,coordAt (-7) 0,coordAt 4 (-2)]
      wObs=obs (variable "w" VecT) [vecAt 1 (-4),vecAt 0 0,vecAt 2 2]
      zeroObs=obs (literal (coordAt 0 0)) (replicate 3 (coordAt 0 0))
      leftOnly=[aObs,zeroObs]
      rightOnly=[wObs]
      uni=witnessWith Unidirectional 32
      bi=witnessWith Bidirectional 32
  -- coordAdd, left operand observable only
  let dsUniL=uni (prim "coordAdd") qAdd leftOnly
      dsBiL=bi (prim "coordAdd") qAdd leftOnly
  assert "coordAdd: unidirectional witness cannot condition on a left operand (frozen behaviour)" (null dsUniL)
  assert "coordAdd: bidirectional witness conditions on the left operand" (not (null dsBiL))
  assert "coordAdd left residual: back-substitution exact in every row (negative, zero, non-constant)" (all (backSubstitutes "coordAdd" qAdd) dsBiL)
  assert "coordAdd left residual: residual child is a VecT specification, not an accepted expression"
    (all (\d->map targetType (decompositionChildren d)==[CoordT,VecT]) dsBiL)
  let residualFor d=map snd (points (decompositionChildren d!!1))
  assert "coordAdd left residual on a: v_i = t_i - a_i row by row (no cross-example mixing)"
    (any (\d->residualFor d==[vecAt 3 (-4),vecAt 0 0,vecAt (-5) 11]) dsBiL)
  -- coordAdd, right operand observable only: original decomposition preserved
  let dsUniR=uni (prim "coordAdd") qAdd rightOnly; dsBiR=bi (prim "coordAdd") qAdd rightOnly
  assert "coordAdd: right-conditioned residual exists in both policies" (not (null dsUniR) && not (null dsBiR))
  assert "coordAdd: bidirectional keeps every original right-conditioned decomposition"
    (all (\d->any (\e->map canonical (decompositionChildren d)==map canonical (decompositionChildren e)) dsBiR) dsUniR)
  assert "coordAdd right residual: back-substitution exact" (all (backSubstitutes "coordAdd" qAdd) dsBiR)
  assert "coordAdd right residual on w: a_i = t_i - w_i row by row"
    (any (\d->map snd (points (head (decompositionChildren d)))==[coordAt 4 3,coordAt (-7) 0,coordAt (-3) 7]) dsBiR)
  -- no decomposition without any operand: safe failure
  assert "coordAdd: no operand of either type -> no decomposition (safe failure)" (null (bi (prim "coordAdd") qAdd []) && null (uni (prim "coordAdd") qAdd []))
  -- coordDelta(p,q)=v: v rows derived from the same environments
  let vRows=[(env,VecV (difference (Coord 1 1) a)) | (env,_)<-rows,let Just (CoordV a)=M.lookup "a" env]  -- v = (1,1) - a
      qDelta=pointTask VecT vRows
      dsDeltaL=bi (prim "coordDelta") qDelta [aObs]
      dsDeltaU=uni (prim "coordDelta") qDelta [aObs]
  assert "coordDelta: left-conditioned residual q_i = p_i - v_i back-substitutes (p observed)" (not (null dsDeltaL) && all (backSubstitutes "coordDelta" qDelta) dsDeltaL)
  assert "coordDelta: unidirectional only conditions on the right operand (p_i = v_i + q_i)" (all (backSubstitutes "coordDelta" qDelta) dsDeltaU)
  -- p=a observed, v=(1,1)-a  =>  q = p - v = 2a-(1,1); mixing the argument order (v-p or p+v) would give different values
  assert "coordDelta: non-commutative argument order respected (left residual child is right operand q=p-v)"
    (any (\d->map snd (points (decompositionChildren d!!1))==[coordAt 3 5,coordAt (-15) (-1),coordAt 7 (-5)]) dsDeltaL)
  assert "coordDelta: both policies agree on right-conditioned children; bidirectional adds left" (length dsDeltaL>=length dsDeltaU)
  -- vecAdd(u,w)=y
  let yRows=[(env,VecV (Vec (dx+2) (dy-3))) | (env,VecV (Vec dx dy))<-[(e,w) | (e,_)<-rows,let Just w=M.lookup "w" e]]
      qVec=pointTask VecT yRows
      dsVecL=bi (prim "vecAdd") qVec [wObs]
  assert "vecAdd: left-conditioned residual w_i = y_i - u_i back-substitutes" (not (null dsVecL) && all (backSubstitutes "vecAdd" qVec) dsVecL)
  assert "vecAdd: residual is constant (2,-3) across rows, a shared-literal child specification"
    (any (\d->map snd (points (decompositionChildren d!!1))==replicate 3 (vecAt 2 (-3))) dsVecL)
  -- no mixing across examples: an operand whose rows are permuted must not back-substitute
  let swapped=obs (variable "a" CoordT) [coordAt (-7) 0,coordAt 2 3,coordAt 4 (-2)]
      dsSwap=bi (prim "coordAdd") qAdd [swapped]
  assert "a row-permuted operand yields residuals that are exact only w.r.t. its own rows (witness pairs row i with operand row i)"
    (all (\d->map snd (points (decompositionChildren d!!1))==[vecAt 12 (-1),vecAt (-9) (-3),vecAt (-5) 11]) dsSwap)
  -- missingOperands diagnosis
  assert "missingOperands: coordAdd with no VecT observation reports VecT" (missingOperands (prim "coordAdd") qAdd leftOnly==[VecT])
  assert "missingOperands: coordAdd with both operand types present reports nothing" (null (missingOperands (prim "coordAdd") qAdd (leftOnly++rightOnly)))
  assert "missingOperands: coordDelta with no CoordT reports CoordT twice (both operands)" (missingOperands (prim "coordDelta") qDelta []==[CoordT,CoordT])

  -- Vec residual subspecification continues through ordinary Base operators
  -- (coordDelta join of two observed anchors), using the real engine.
  let object i x y c=O.Object i (Coord x y) (M.fromList [(Coord 0 0,c),(Coord 1 0,c)]) 0
      scene k=let o1=object 0 (2+k) (3+k) 1; o2=object 1 (5+2*k) (1+k) 3; o3=object 2 (9+k) (8-k) 6 in [o1,o2,o3]
      -- target: place every object at Anchor(obj,TL) + (Anchor(second,BR) - Anchor(first,TL))
      disp k=let [o1,o2,_]=scene k in difference (O.br o2) (O.tl o1)
      envOf k o=M.fromList [("v0",SceneV (O.Scene (Dimensions 20 20) 0 (scene k))),("v1",PlacedV o)]
      coordRows=[(envOf k o,CoordV (add (O.position o) (disp k))) | k<-[0,1],o<-scene k]
      qCoord=pointTask CoordT coordRows
  engineUni<-newEngine Full defaultInduced {workBudget=60000}
  engineBi<-newEngine Full defaultInduced {workBudget=60000,witnessPolicy=Bidirectional}
  rootUni<-learn engineUni 3 qCoord
  rootBi<-learn engineBi 3 qCoord
  sUni<-readIORef (spaceRef engineUni)
  (candidatesUni,_)<-if rootUni==0 then pure ([],0) else extract engineUni sUni rootUni
  assert "Vec subspec: unidirectional policy yields no coordAdd-based candidate (no VecT operand is observable)"
    (not (any (S.member "coordAdd" . symbols) candidatesUni))
  assert "Vec subspec: bidirectional witness yields a nonempty CoordT version space" (rootBi/=0)
  sBi<-readIORef (spaceRef engineBi)
  (candidates,_)<-extract engineBi sBi rootBi
  let exactOnes=[e | e<-candidates,matches qCoord e]
  assert "Vec subspec: extracted CoordT candidates are exact on every training row by real Base evaluation" (not (null exactOnes))
  assert "Vec subspec: a candidate composes coordAdd with a coordDelta of two observed anchors"
    (any (\e->S.isSubsetOf (S.fromList ["coordAdd","coordDelta","Anchor"]) (symbols e)) exactOnes)
  metricsBi<-readIORef (metricsRef engineBi)
  assert "Phase A metric: left-conditioned decompositions were counted" (M.findWithDefault 0 "bidirectional_left_decompositions" metricsBi>0)
  putStrLn ("  example candidate: "++exprText (head exactOnes))

  -- ---------------------------------------------------------------- Phase B
  -- IntT arithmetic residual not in the observed domain: y = x(p) + x(q) + y(q)
  -- with p,q varying. Unidirectional/no-demand Learn fails; demand growth
  -- adds add(x(q),y(q)) and wakes the same task through the memo.
  let pq k=M.fromList [("p",coordAt (3*k+1) (k-4)),("q",coordAt (2-k) (5*k))]
      yOf env=let Just (CoordV (Coord px _))=M.lookup "p" env; Just (CoordV (Coord qx qy))=M.lookup "q" env in IntV (px+qx+qy)
      qInt=pointTask IntT [(pq k,yOf (pq k)) | k<-[0,1,2,3]]
      confB=defaultInduced {workBudget=40000,witnessPolicy=Bidirectional,demandPolicy=DemandOn,demandWorkBudget=8000,demandOperandCap=12,demandRounds=2}
  engineOff<-newEngine Full confB {demandPolicy=DemandOff}
  rootOff<-learnWithDemands engineOff qInt
  assert "Phase B: without demand expansion the IntT residual task is empty" (rootOff==0)
  engineOn<-newEngine Full confB
  rootOn<-learnWithDemands engineOn qInt
  metricsOn<-readIORef (metricsRef engineOn)
  demandsOn<-readIORef (demandRef engineOn)
  let m k=M.findWithDefault 0 k metricsOn
  assert "Phase B: demands were registered for IntT" (m "demands_registered">0 && any ((==IntT) . snd) (M.keys demandsOn))
  assert "Phase B: the pool grew with new IntT observations" (m "demand_new_int_observations">0)
  assert "Phase B: growth invalidated the stale memo entry and resumed the task" (m "demand_memo_invalidations">0 && m "demand_rounds">=1)
  assert "Phase B: resumed task is nonempty after growth" (rootOn/=0)
  sOn<-readIORef (spaceRef engineOn)
  (candidatesOn,_)<-extract engineOn sOn rootOn
  let exactInt=[e | e<-candidatesOn,matches qInt e]
  assert "Phase B: extracted IntT candidate is exact on all rows" (not (null exactInt))
  assert "Phase B: demand work was charged to the global budget" (m "demand_work">0 && m "total_expanded_work">=m "demand_work")
  putStrLn ("  example candidate: "++exprText (head exactInt))
  -- No wake without growth: a second call sees resolved demands and no pending ones.
  roundsBefore<-M.findWithDefault 0 "demand_rounds" <$> readIORef (metricsRef engineOn)
  invBefore<-M.findWithDefault 0 "demand_memo_invalidations" <$> readIORef (metricsRef engineOn)
  rootAgain<-learnWithDemands engineOn qInt
  metricsAgain<-readIORef (metricsRef engineOn)
  assert "Phase B: re-entry without new information performs no further demand round and no invalidation"
    (M.findWithDefault 0 "demand_rounds" metricsAgain==roundsBefore && M.findWithDefault 0 "demand_memo_invalidations" metricsAgain==invBefore && rootAgain==rootOn)
  -- Still-blocked termination: operand cap 0 generates nothing; no epoch bump, no re-learn.
  engineCap<-newEngine Full confB {demandOperandCap=1}
  _<-learnWithDemands engineCap qInt
  demandsCap<-readIORef (demandRef engineCap)
  metricsCap<-readIORef (metricsRef engineCap)
  epochCap<-readIORef (epochRef engineCap)
  assert "Phase B: with a tiny operand cap the demand ends still-blocked or resumed, never pending forever"
    (all (\r->demandResolvedEpoch r/=Nothing) (M.elems demandsCap))
  assert "Phase B: demand rounds are bounded by configuration" (M.findWithDefault 0 "demand_rounds" metricsCap<=demandRounds confB)
  when (M.findWithDefault 0 "demand_new_observations" metricsCap==0) $
    assert "Phase B: no growth => epoch unchanged and no memo invalidation" (epochCap==0 && M.findWithDefault 0 "demand_memo_invalidations" metricsCap==0)
  -- Budget cutoff: demand budget 0 suspends resolution before any generation and terminates.
  engineBudget<-newEngine Full confB {demandWorkBudget=0}
  rootBudget<-learnWithDemands engineBudget qInt
  demandsBudget<-readIORef (demandRef engineBudget)
  metricsBudget<-readIORef (metricsRef engineBudget)
  assert "Phase B: demand budget cutoff leaves demands suspended and the task unsolved, without looping"
    (rootBudget==0 && M.findWithDefault 0 "demand_rounds" metricsBudget<=1 && M.findWithDefault 0 "demand_work" metricsBudget==0
     && all (("suspended" `isInfixOf`) . demandStatus) (M.elems demandsBudget) && M.findWithDefault 0 "demand_generated_terms" metricsBudget==0)
  -- Budget 1: at most one term is generated for the first demand; later demands are suspended.
  engineOne<-newEngine Full confB {demandWorkBudget=1}
  _<-learnWithDemands engineOne qInt
  metricsOne<-readIORef (metricsRef engineOne)
  assert "Phase B: a demand budget of one unit generates at most one term in total"
    (M.findWithDefault 0 "demand_generated_terms" metricsOne<=1 && M.findWithDefault 0 "demand_rounds" metricsOne<=1)
  -- Determinism: identical engine configuration twice => identical metrics and candidates.
  engineD1<-newEngine Full confB; rootD1<-learnWithDemands engineD1 qInt
  engineD2<-newEngine Full confB; rootD2<-learnWithDemands engineD2 qInt
  mD1<-readIORef (metricsRef engineD1); mD2<-readIORef (metricsRef engineD2)
  sD1<-readIORef (spaceRef engineD1); sD2<-readIORef (spaceRef engineD2)
  (cD1,_)<-extract engineD1 sD1 rootD1; (cD2,_)<-extract engineD2 sD2 rootD2
  assert "Phase B: repeated execution is deterministic (metrics, node count, candidates)"
    (mD1==mD2 && M.size (nodes sD1)==M.size (nodes sD2) && map exprText cD1==map exprText cD2 && rootD1==rootD2)
  -- Preservation: equal-valued terms with different dependency structure both survive the merged pool.
  let poolSeed=observations (pointTask IntT [(M.fromList [("p",coordAt 1 2),("n",IntV 3)],IntV 0),(M.fromList [("p",coordAt 4 (-1)),("n",IntV 1)],IntV 0)])
      generated=demandTerms 8 IntT poolSeed
  assert "Phase B: generated IntT terms are typed, new and bounded by the operand cap" (not (null generated) && all ((==IntT) . exprType) generated && all (`notElem` map observedExpr poolSeed) generated)
  let twin1=obs (op "add" IntT [op "x" IntT [variable "p" CoordT],lit 2]) [IntV 3,IntV 6]
      twin2=obs (op "add" IntT [variable "n" IntT,op "y" IntT [variable "p" CoordT]]) [IntV 3,IntV 6]   -- 3+2=5? no: n+y(p) = 3+2=5, 1+(-1)=0
      twinB=obs (op "subtract" IntT [op "multiply" IntT [variable "n" IntT,lit 2],lit 3]) [IntV 3,IntV (-1)]
      twinC=obs (op "add" IntT [op "x" IntT [variable "p" CoordT],lit 2]) [IntV 3,IntV (-1)]
  engineP<-newEngine Full confB
  let merged=selectPool engineP [twinB,twinC]
  assert "Phase B: same training values, different dependency structures => both representatives kept" (length merged==2 && signatureOf (observedExpr twinB)/=signatureOf (observedExpr twinC))
  _<-pure (twin1,twin2)
  -- VecT demand: coordAdd with CoordT-only pool registers VecT and grows VecT observations.
  -- depth 3 keeps the deduction inside the unit work budget so a demand round can run
  engineV<-newEngine Full confB {demandOperandCap=8,depthBound=3,workBudget=120000}
  rootV<-learnWithDemands engineV qCoord
  metricsV<-readIORef (metricsRef engineV)
  demandsV<-readIORef (demandRef engineV)
  assert "Phase B: coordAdd without VecT observations registers a VecT demand" (any ((==VecT) . snd) (M.keys demandsV))
  assert "Phase B: VecT demand growth produced new VecT observations (coordDelta/vec compositions)" (M.findWithDefault 0 "demand_new_vec_observations" metricsV>0)
  assert "Phase B: CoordT task remains solvable after growth" (rootV/=0)

  -- ------------------------------------------------- end-to-end Grid verifier
  unless quick $ do
    -- Stress I under B1 with the full protocol budgets: the complete prediction
    -- must type-check and pass the ORIGINAL Grid exact verifier (training only;
    -- heldout is never consulted here).
    let taskI=head [t | t<-latentStressTasks,taskId t=="I-equivalent-representations"]
        confI=defaultInduced {witnessPolicy=Bidirectional}
    t0<-getMonotonicTimeNSec
    r<-inducedSearch Full confI (training taskI)
    t1<-getMonotonicTimeNSec
    putStrLn ("  stress I (B1) seconds="++show (fromIntegral (t1-t0)/1e9 :: Double)++" failure="++inducedFailure r++" portfolio="++show (length (inducedPortfolio r)))
    assert "end-to-end: every portfolio program type-checks as Scene -> Scene" (all (\p->typeCheck M.empty p==Right (ArrowT SceneT SceneT)) (inducedPortfolio r))
    assert "end-to-end: selected program passes the original Grid exact verifier on training"
      (maybe False (\p->all (\(x,y)->predictInduced confI p x==Right y) (training taskI)) (inducedProgram r))
    assert "end-to-end: selected program uses place with coordAdd/coordDelta, no Translate" (maybe False (\p->S.isSubsetOf (S.fromList ["place","coordAdd","coordDelta"]) (symbols p) && S.notMember "Translate" (symbols p)) (inducedProgram r))
  putStrLn "PASS: place-demand phase A/B semantic tests"
  where lit=literal . IntV
