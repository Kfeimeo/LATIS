-- Absolute place may construct new positions from coordinate algebra.
module Synthesis.InducedR2.EffectDomain where
import Language.Induced.Base
import Latent.Grid (Coord)
import qualified Latent.Object as O
import qualified Data.Set as S

positionsOf :: Value -> S.Set Coord
positionsOf v=case v of
  PlacedV o->S.singleton (O.position o)
  ObjectV o->S.singleton (O.position o)
  PoseV p _->S.singleton p
  SceneV s->S.fromList (map O.position (O.objects s))
  ListV _ xs->S.unions (map positionsOf xs)
  SetV _ xs->S.unions (map positionsOf xs)
  OptionV _ (Just x)->positionsOf x
  PairV a b->positionsOf a `S.union` positionsOf b
  _->S.empty
literalPositions :: Expr -> S.Set Coord
literalPositions e=case exprNode e of Lit v->positionsOf v; _->S.unions (map literalPositions (children e))
foldPositionPossible :: Expr -> Value -> Value -> Value -> Bool
foldPositionPossible f seed source target
  | not (S.null (freeVars f)) || S.member "place" (symbols f)=True
  | otherwise=positionsOf target `S.isSubsetOf` S.unions [positionsOf seed,positionsOf source,literalPositions f]
