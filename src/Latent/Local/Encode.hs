module Latent.Local.Encode where
import Latent.Local.Grammar
import Latent.Grid
import Latent.Object
import Synthesis.Skeleton
import Synthesis.Hole (observe)
import Data.List (nub,elemIndex)

encodeLocal :: LocalEncoding -> Scene -> Either String LocalLatent
encodeLocal enc scene = do
  let slotted = zip [0..] (objects scene)
      ordered = orderObjects (encodingOrder enc) (objects scene)
      table = nub [GroundClass (geometry o) | o <- ordered]
      slot o = case [i | (i,a) <- slotted, objectId a == objectId o] of
        [i] -> Right i
        _ -> Left "Canonical provenance IDs must be unique"
      entry o = do
        i <- slot o
        c <- maybe (Left "Missing grounded class") Right (elemIndex (GroundClass (geometry o)) table)
        pure (Member i (objectId o) c (orientation o))
      poses = map position ordered
      deltas = zipWith difference (drop 1 poses) poses
  ms <- traverse entry ordered
  code <- case (enc,poses) of
    (_,[]) -> Left "Local encoding requires objects"
    (RelativePose _,p:_) -> Right (RelativeCode p deltas)
    (Pairwise _ a b,p:_) -> Right (PairwiseCode p a b
      [difference (observe a next) (observe b prev) | (prev,next) <- zip ordered (drop 1 ordered)])
    (Progression _,p:_) -> case deltas of
      d:ds | length poses >= 3 && all (==d) ds -> Right (ProgressionCode p d (length poses))
      _ -> Left "Progression requires at least three equally spaced members"
    (SharedClass _,_) | length table == 1 -> Right (AbsoluteCode poses)
    _ -> Left "SharedClass requires identical grounded geometry/color"
  pure (LocalLatent enc (canvas scene) (background scene) table ms code)
