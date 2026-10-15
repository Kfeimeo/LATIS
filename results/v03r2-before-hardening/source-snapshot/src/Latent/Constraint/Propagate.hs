{-# LANGUAGE GADTs #-}
module Latent.Constraint.Propagate where
import Latent.Object
import Latent.Correspondence
import Latent.Fusion.Context
import Latent.Global.Grammar
import Latent.Program
import Latent.MDL.LatentCost
import Synthesis.Constraint.State (ConstraintState)
import Synthesis.Dependency (LatentExample)
import Synthesis.Hole (Anchor(..))
import Synthesis.MDL (Objective(..))
import qualified Data.Set as S

data SkeletonSupport = PointwisePose | OrderedPoseSequence deriving (Eq,Ord,Show)
data LatentDomain = LatentDomain
  { hypothesis :: LatentHypothesis, expressionDomain :: [LatentProgram]
  , skeletonDomain :: S.Set SkeletonSupport, latentProofs :: [Provenance] }
  deriving Show
-- Sigma=(P,Gamma,C,D,R,M,H_Z): the preserved v0.2A Sigma is composed, not
-- overwritten. A domain couples a typed pose hole, a skeleton and one H_Z.
data HierarchicalState = HierarchicalState
  { canonicalState :: ConstraintState, activeHypotheses :: [LatentDomain]
  , latentAtFixedPoint :: Bool }
data PropagationWork = PropagationWork
  { expressionChecks :: Int, propagationRounds :: Int, removedExpressions :: Int
  , emptyHypotheses :: Int, propagationTrace :: [String] } deriving (Eq,Show)

candidatePrograms :: LatentSpec -> [LatentProgram]
candidatePrograms spec = filter (\p -> allowed spec p && usesBoth p) (map PlaceEach expressions)
  where
    cs=capabilities spec
    vectors=concat [[x,Times 2 x,Times (-1) x,Swap x] | x<-
      [PairStep | S.member "pair" cs]++[SequenceStep | S.member "progression" cs]++
      [LocalDelta | S.member "relative" cs]++[GlobalStep | S.member "global_progression" cs]]
    origins=[FirstPosition | S.member "local" cs]++[BBoxCorner a | S.member "bbox" cs,a<-[TL,BL,BR,TR]]
    expressions=CurrentPosition:[Plus CurrentPosition v | v<-vectors]++
      [Plus start (RankTimes v) | start<-origins,v<-vectors]++
      [Plus CurrentPosition (AxisDisplacement a) | a<-[Vertical,Horizontal,Diagonal,AntiDiagonal],S.member ("axis:"++show a) cs]++
      [BBoxCorner a | S.member "bbox" cs,a<-[TL,BL,BR,TR]]
    usesBoth (PlaceEach p) = case spec of
      Fused _ _ -> not (S.null (exprNeeds p `S.intersection` S.fromList ["local","pair","relative","progression"])) &&
        not (S.null (exprNeeds p `S.intersection` S.fromList ["bbox","global_progression","axis:Vertical","axis:Horizontal","axis:Diagonal","axis:AntiDiagonal"]))
      _ -> True
support :: LatentProgram -> SkeletonSupport
support (PlaceEach p) | containsRank p = OrderedPoseSequence
                     | otherwise = PointwisePose
containsRank :: Expr a -> Bool
containsRank (RankTimes _) = True
containsRank (Plus a b) = containsRank a || containsRank b
containsRank (Minus a b) = containsRank a || containsRank b
containsRank (Times _ a) = containsRank a
containsRank (Swap a) = containsRank a
containsRank _ = False

-- Disjunctive correspondence guards remain disjunctive: one compatible bundle
-- suffices. No new matching or object semantics are introduced.
witnessFits :: [[LatentExample]] -> LatentSpec -> LatentProgram -> Bool
witnessFits bundles spec p = any (\bundle -> not (null bundle) && all fits bundle) bundles
  where fits (x,_,c)
          | not (null (removed c)) || length (matched c)/=length (objects x) = False
          | otherwise = case runLatent spec p x of
              Left _ -> False
              Right z -> all (\edge -> case [o | o<-objects z,objectId o==objectId (sourceObject edge)] of
                [o] -> position o==position (targetObject edge) && geometry o==geometry (targetObject edge)
                _ -> False) (matched c)

propagateToFixpoint :: Bool -> [[LatentExample]] -> HierarchicalState -> (HierarchicalState,PropagationWork)
propagateToFixpoint reverseEnabled bundles initial = loop initial (PropagationWork 0 0 0 0 [])
  where
    loop state work
      | latentAtFixedPoint state = (state,work)
      | otherwise =
          let (domains,checks,removed,dead,events)=foldr visit ([],0,0,0,[]) (activeHypotheses state)
              signature ds=[(hypothesisSpec (hypothesis d),map show (expressionDomain d),skeletonDomain d) | d<-ds]
              changed=signature domains/=signature (activeHypotheses state)
              next=state {activeHypotheses=domains,latentAtFixedPoint=not changed}
              w=PropagationWork (expressionChecks work+checks) (propagationRounds work+1)
                (removedExpressions work+removed) (emptyHypotheses work+dead)
                (propagationTrace work++events++["PropagateToFixpoint: "++if changed then "domains narrowed; repeat" else "fixed point; branching now permitted"])
          in if changed then loop next w else (next,w)
    visit d (ds,checks,removed,dead,events) =
      let h=hypothesis d; spec=hypothesisSpec h
          old=expressionDomain d
          typed=filter (allowed spec) old
          constrained=if reverseEnabled then filter (witnessFits bundles spec) typed else typed
          liveSkeletons=S.fromList (map support constrained) `S.intersection` skeletonDomain d
          live=filter ((`S.member` liveSkeletons) . support) constrained
          proof=Provenance "RestrictLatentFromProgram" ["typed pose hole must satisfy every training witness under one shared encoder",show (length old)++" -> "++show (length live)]
          facts=[Provenance "RestrictProgramFromLatent" ["active symbols="++show (S.toList (capabilities spec)),"expression and skeleton domains mutually support"],proof]
          new=d {expressionDomain=live,skeletonDomain=liveSkeletons,latentProofs=facts}
          trace=["PropagateLatentConstraints / RestrictProgramFromLatent: "++show spec++" symbols="++show (S.toList (capabilities spec)),
            "RestrictLatentFromProgram / Latent <-> Hole / Latent <-> Skeleton: "++show spec++" "++show (length old)++" -> "++show (length live)++" reverse="++show reverseEnabled,
            "ComputeLatentMDL: "++show [(show p,totalCost (latentObjective False spec p)) | p<-live]]
      in (if null live then ds else new:ds,checks+if reverseEnabled then length typed else 0,
          removed+length old-length live,dead+if null live then 1 else 0,trace++events)
