module Latent.Local.Decode where
import Latent.Local.Grammar
import Latent.Grid
import Latent.Object
import Synthesis.Hole (observe)
import Data.List (sortOn)

at :: String -> [a] -> Int -> Either String a
at label xs i | i >= 0 && i < length xs = Right (xs !! i)
              | otherwise = Left (label ++ " index out of bounds")
scale :: Int -> Vec -> Vec
scale n (Vec x y) = Vec (n*x) (n*y)
localObjects :: LocalLatent -> Either String [Object]
localObjects z = do
  templates <- traverse template (members z)
  poses <- case poseCode z of
    RelativeCode start ds -> Right (scanl add start ds)
    AbsoluteCode ps -> Right ps
    ProgressionCode start d n | n >= 0 -> Right [add start (scale i d) | i <- [0..n-1]]
    ProgressionCode _ _ _ -> Left "Negative progression count"
    PairwiseCode start a b ds -> case templates of
      [] -> Left "Pairwise decoder requires a seed"
      first:rest -> reconstruct first {position=start} rest ds a b
  if length poses /= length templates then Left "Decoder population mismatch"
    else Right (zipWith (\o p -> o {position=p}) templates poses)
  where
    template m = do
      GroundClass geom <- at "class" (classTable z) (classIndex m)
      pure (Object (sourceId m) (Coord 0 0) geom (memberOrientation m))
    reconstruct first rest ds a b
      | length rest /= length ds = Left "Pairwise relation population mismatch"
      | otherwise = Right (map position (scanl step first (zip rest ds)))
      where step prev (next,d) = next {position=add (add (observe b prev) d)
              (difference (Coord 0 0) (observe a next))}

decodeLocal :: LocalLatent -> Either String Scene
decodeLocal z = do
  ordered <- localObjects z
  let slots = map paintSlot (members z)
  if sortOn id slots /= [0..length slots-1] then Left "Invalid canonical paint permutation"
    else Right (Scene (localCanvas z) (localBackground z)
      (map snd (sortOn fst (zip slots ordered))))

-- A transformation changes only encoded poses, preserving every grounded
-- object's geometry, orientation, identity, population and paint priority.
setLocalPoses :: [Coord] -> LocalLatent -> Either String LocalLatent
setLocalPoses ps z
  | length ps /= length (members z) = Left "Pose update population mismatch"
  | otherwise = do
      templates <- localObjects z
      let updated=zipWith (\o p -> o {position=p}) templates ps
          deltas=zipWith difference (drop 1 ps) ps
      code <- case (localEncoding z,ps) of
        (_,[]) -> Left "Empty transformed local sequence"
        (RelativePose _,p:_) -> Right (RelativeCode p deltas)
        (Pairwise _ a b,p:_) -> Right (PairwiseCode p a b
          [difference (observe a next) (observe b prev) | (prev,next)<-zip updated (drop 1 updated)])
        (Progression _,p:_) -> case deltas of
          d:ds | all (==d) ds -> Right (ProgressionCode p d (length ps))
          _ -> Left "Transformation violates the active progression structure"
        (SharedClass _,_) -> Right (AbsoluteCode ps)
      pure z {poseCode=code}
