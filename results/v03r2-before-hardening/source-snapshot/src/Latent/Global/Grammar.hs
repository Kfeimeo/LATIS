module Latent.Global.Grammar where
import Latent.Grid
import Latent.Object
import Synthesis.Skeleton (Order)

data AxisType = Vertical | Horizontal | Diagonal | AntiDiagonal
  deriving (Eq,Ord,Show,Enum,Bounded)
data GlobalEncoding = SceneBBox | Axis AxisType | Alignment AxisType
  | Repetition Order | GlobalOrder Order | Symmetry AxisType deriving (Eq,Ord,Show)
data GlobalFact = BoundingBox BBox | AxisAt AxisType Int
  | Aligned AxisType [Coord] | Repeated Coord Vec Int | Ordered Order [Int]
  | Symmetric AxisType Int deriving (Eq,Ord,Show)
data GlobalLatent = GlobalLatent
  { globalEncoding :: GlobalEncoding, globalFact :: GlobalFact
  , groundedResidual :: Scene } deriving (Eq,Ord,Show)
