{-# LANGUAGE GADTs #-}
module Latent.MDL.LatentCost where
import Latent.Fusion.Context
import Latent.Local.Grammar
import Latent.Global.Grammar
import Latent.Program
import Synthesis.MDL (Objective(..))
import qualified Data.Set as S

-- Unit AST code: constructors/observer applications/literals each cost one.
-- These are fixed before opening the frozen audit. No tuned task weights.
codecLengths :: LatentSpec -> (Int,Int)
codecLengths (Local (RelativePose _)) = (5,4) -- Sort+Map(TL differences); Scan(Add)
codecLengths (Local (Progression _)) = (5,4) -- Sort+Shared(differences); indexed Add
codecLengths (Local (Pairwise _ _ _)) = (7,6) -- two anchors; inverse offsets
codecLengths (Local (SharedClass _)) = (5,3) -- factor geometry table; reconstruct
codecLengths (Global SceneBBox) = (5,1) -- Fold(BBoxUnion,Map(BBox,Objects)); residual lens
codecLengths (Global (Axis _)) = (7,1) -- bbox plus midpoint/axis selector
codecLengths (Global (Symmetry _)) = (9,1)
codecLengths (Global (Repetition _)) = (6,1)
codecLengths (Global _) = (5,1)
codecLengths (Fused a b) = let (x,y)=codecLengths (Local a); (u,v)=codecLengths (Global b)
                          in (1+x+u,1+y+v)
codecSymbols :: LatentSpec -> S.Set String
codecSymbols (Local a) = S.fromList (["Objects","Sort","TL","Subtract","Add","Scan",show (encodingOrder a)] ++
  case a of Progression _->["Shared","Scale","Rank"]; Pairwise _ x y->[show x,show y]; SharedClass _->["Shared"]; _->[])
codecSymbols (Global a) = S.fromList (["Objects","Map","Min","Max","TL","BR","CoordProjection"] ++
  case a of Axis x->["AxisMove",show x,"AddInt"]; Symmetry x->["AxisMove",show x,"SymmetryCheck","AddInt"]
            Repetition _->["Sort","At","Subtract","Shared"]; _->[])
codecSymbols (Fused a b) = S.insert "Fuse" (codecSymbols (Local a) `S.union` codecSymbols (Global b))
exceptions :: Expr a -> Int
exceptions (Times n x) = (if abs n>1 then 1 else 0)+exceptions x
exceptions (Plus a b) = exceptions a+exceptions b
exceptions (Minus a b) = exceptions a+exceptions b
exceptions (RankTimes a) = exceptions a
exceptions (Swap a) = exceptions a
exceptions _ = 0
latentObjective :: Bool -> LatentSpec -> LatentProgram -> Objective
latentObjective omit spec (PlaceEach p) = Objective l k e (fromIntegral (l+k+2*e))
  where (a,d)=codecLengths spec
        l=(if omit then 0 else a+d)+2+exprLength p
        k=S.size (S.fromList ["MapPose","Translate"] `S.union` exprSymbols p `S.union` codecSymbols spec)
        e=exceptions p
groundObjective :: LatentSpec -> LatentProgram -> Objective
groundObjective spec (PlaceEach p) = Objective l k e (fromIntegral (l+k+2*e))
  where expanded=expand spec p
        l=2+groundLength expanded
        k=S.size (S.fromList ["MapPose","Translate"] `S.union` groundSymbols expanded)
        e=exceptions p
