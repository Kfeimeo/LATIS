{-# LANGUAGE GADTs #-}
module Latent.Serialize where
import Latent.Grid
import Latent.Object
import Latent.Local.Grammar
import Latent.Global.Grammar
import Latent.Fusion.Context
import Latent.Program
import ARC.Evaluate (jsonString)
import qualified Data.Map.Strict as M
import Data.List (intercalate)

obj :: [(String,String)] -> String
obj fields="{"++intercalate "," [jsonString k++":"++v | (k,v)<-fields]++"}"
array :: [String] -> String
array xs="["++intercalate "," xs++"]"
coordJSON :: Coord -> String
coordJSON (Coord x y)=array (map show [x,y])
vecJSON :: Vec -> String
vecJSON (Vec x y)=array (map show [x,y])
geometryJSON :: M.Map Coord Int -> String
geometryJSON g=array [obj [("coord",coordJSON p),("color",show c)] | (p,c)<-M.toList g]
objectJSON :: Object -> String
objectJSON o=obj [("provenance_id",show (objectId o)),("position",coordJSON (position o)),
  ("orientation",show (orientation o)),("geometry",geometryJSON (geometry o))]
sceneJSON :: Scene -> String
sceneJSON s=obj [("type",jsonString "CanonicalScene"),("canvas",array (map show [gridWidth (canvas s),gridHeight (canvas s)])),
  ("background",show (background s)),("objects",array (map objectJSON (objects s)))]
localJSON :: LocalLatent -> String
localJSON z=obj [("type",jsonString "LocalLatent"),("encoding",jsonString (show (localEncoding z))),
  ("canvas",array (map show [gridWidth (localCanvas z),gridHeight (localCanvas z)])),("background",show (localBackground z)),
  ("classes",array [geometryJSON (classGeometry c) | c<-classTable z]),
  ("members",array [obj [("paint_slot",show (paintSlot m)),("provenance_id",show (sourceId m)),
    ("class_index",show (classIndex m)),("orientation",show (memberOrientation m))] | m<-members z]),
  ("pose_code",poseJSON (poseCode z))]
poseJSON :: PoseCode -> String
poseJSON (RelativeCode p ds)=obj [("node",jsonString "RelativePose"),("start",coordJSON p),("deltas",array (map vecJSON ds))]
poseJSON (PairwiseCode p a b ds)=obj [("node",jsonString "Pairwise"),("start",coordJSON p),
  ("next_anchor",jsonString (show a)),("previous_anchor",jsonString (show b)),("relations",array (map vecJSON ds))]
poseJSON (ProgressionCode p d n)=obj [("node",jsonString "Progression"),("start",coordJSON p),("delta",vecJSON d),("count",show n)]
poseJSON (AbsoluteCode ps)=obj [("node",jsonString "SharedClassPoses"),("poses",array (map coordJSON ps))]
factJSON :: GlobalFact -> String
factJSON (BoundingBox (BBox a b))=obj [("node",jsonString "BoundingBox"),("tl",coordJSON a),("br",coordJSON b)]
factJSON (AxisAt a k)=obj [("node",jsonString "Axis"),("axis_type",jsonString (show a)),("coordinate_twice_or_diagonal_offset",show k)]
factJSON (Symmetric a k)=obj [("node",jsonString "SymmetryAxis"),("axis_type",jsonString (show a)),("coordinate_twice_or_diagonal_offset",show k)]
factJSON (Aligned a ps)=obj [("node",jsonString "Alignment"),("axis_type",jsonString (show a)),("anchors",array (map coordJSON ps))]
factJSON (Repeated p d n)=obj [("node",jsonString "Progression"),("origin",coordJSON p),("delta",vecJSON d),("count",show n)]
factJSON (Ordered o ids)=obj [("node",jsonString "Order"),("order",jsonString (show o)),("provenance_members",array (map show ids))]
contextJSON :: FusionContext -> String
contextJSON c=obj [("canonical",sceneJSON (canonical c)),("local",maybe "null" localJSON (local c)),
  ("global",maybe "null" (\g->obj [("type",jsonString "GlobalLatent"),("encoding",jsonString (show (globalEncoding g))),
    ("fact",factJSON (globalFact g)),("grounded_residual",sceneJSON (groundedResidual g))]) (global c))]
hypothesisJSON :: LatentHypothesis -> String
hypothesisJSON h=obj [("type",jsonString "LatentHypothesis"),("spec",jsonString (show (hypothesisSpec h))),
  ("encoder",obj [("structure",jsonString (show (hypothesisSpec h))),("description_length",show (encoderLength h)),
    ("semantics",jsonString "Apply shared typed scene encoder; parameters computed only from this scene")] ),
  ("decoder",obj [("description_length",show (decoderLength h)),("semantics",jsonString "Invert pose code, restore grounded classes/orientations/paint order; global path preserves canonical residual")]),
  ("latent_scenes",array (map contextJSON (encodedScenes h))),
  ("constraints",array [obj [("rule",jsonString (rule p)),("premises",array (map jsonString (premises p)))] | p<-supportingConstraints h])]
exprJSON :: Expr a -> String
exprJSON e=case e of
  CurrentPosition -> node "Coord" "TLCurrent" [] []
  FirstPosition -> node "Coord" "LocalFirst" [] []
  BBoxCorner a -> node "Coord" "GlobalBBoxCorner" [] [("anchor",jsonString (show a))]
  PairStep -> node "Vec" "PairDelta" [] []
  SequenceStep -> node "Vec" "SequenceStep" [] []
  LocalDelta -> node "Vec" "LocalDelta" [] []
  GlobalStep -> node "Vec" "GlobalStep" [] []
  AxisDisplacement a -> node "Vec" "AxisDisplacement" [] [("axis",jsonString (show a))]
  Plus a b -> node "Coord" "Add" [exprJSON a,exprJSON b] []
  Minus a b -> node "Vec" "Subtract" [exprJSON a,exprJSON b] []
  Times n a -> node "Vec" "Scale" [exprJSON a] [("literal",show n)]
  RankTimes a -> node "Vec" "ScaleByRank" [exprJSON a] []
  Swap a -> node "Vec" "SwapXY" [exprJSON a] []
  where node ty name args fields=obj ([("type",jsonString ty),("node",jsonString name),("args",array args)]++fields)
