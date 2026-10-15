module Latent.Local.Grammar where

import Latent.Grid
import Synthesis.Skeleton (Order)
import Synthesis.Hole (Anchor)
import qualified Data.Map.Strict as M

-- Every constructor has an inverse. Indices are paint-order slots, never
-- program-observable object IDs. Class keys contain readable geometry.
data LocalEncoding = RelativePose Order | Pairwise Order Anchor Anchor
  | Progression Order | SharedClass Order deriving (Eq,Ord,Show)
data GroundClass = GroundClass { classGeometry :: M.Map Coord Int }
  deriving (Eq,Ord,Show)
data Member = Member
  { paintSlot :: Int, sourceId :: Int, classIndex :: Int, memberOrientation :: Int }
  deriving (Eq,Ord,Show)
data PoseCode = RelativeCode Coord [Vec] | PairwiseCode Coord Anchor Anchor [Vec]
  | ProgressionCode Coord Vec Int | AbsoluteCode [Coord]
  deriving (Eq,Ord,Show)
data LocalLatent = LocalLatent
  { localEncoding :: LocalEncoding, localCanvas :: Dimensions, localBackground :: Int
  , classTable :: [GroundClass], members :: [Member], poseCode :: PoseCode }
  deriving (Eq,Ord,Show)

encodingOrder :: LocalEncoding -> Order
encodingOrder (RelativePose o) = o
encodingOrder (Pairwise o _ _) = o
encodingOrder (Progression o) = o
encodingOrder (SharedClass o) = o
