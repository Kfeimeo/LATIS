module Latent.Global.Encode where
import Latent.Global.Grammar
import Latent.Grid
import Latent.Object
import Synthesis.Skeleton
import qualified Data.Map.Strict as M

sceneBBox :: Scene -> Either String BBox
sceneBBox z = case objects z of
  [] -> Left "SceneBBox requires nonempty scene"
  os -> Right (BBox (Coord (minimum (map (cx . tl) os)) (minimum (map (cy . tl) os)))
    (Coord (maximum (map (cx . br) os)) (maximum (map (cy . br) os))))
axisValue :: AxisType -> BBox -> Int
axisValue Vertical (BBox a b) = cx a + cx b
axisValue Horizontal (BBox a b) = cy a + cy b
axisValue Diagonal (BBox a _) = cy a - cx a
axisValue AntiDiagonal (BBox a b) = cx a + cy b
reflectPixel :: AxisType -> Int -> Coord -> Coord
reflectPixel Vertical k (Coord x y) = Coord (k-x) y
reflectPixel Horizontal k (Coord x y) = Coord x (k-y)
reflectPixel Diagonal k (Coord x y) = Coord (y-k) (x+k)
reflectPixel AntiDiagonal k (Coord x y) = Coord (k-y) (k-x)

encodeGlobal :: GlobalEncoding -> Scene -> Either String GlobalLatent
encodeGlobal enc z = do
  box <- sceneBBox z
  fact <- case enc of
    SceneBBox -> Right (BoundingBox box)
    Axis a -> Right (AxisAt a (axisValue a box))
    GlobalOrder order -> Right (Ordered order (map objectId (orderObjects order (objects z))))
    Repetition order -> case map position (orderObjects order (objects z)) of
      ps@(start:_:_:_) -> case zipWith difference (drop 1 ps) ps of
        d:ds | all (==d) ds -> Right (Repeated start d (length ps))
        _ -> Left "Scene repetition not supported by observed poses"
      _ -> Left "Repetition requires three members"
    Alignment a -> let ps = map tl (objects z)
                       key p = case a of Vertical -> cx p; Horizontal -> cy p
                                         Diagonal -> cy p-cx p; AntiDiagonal -> cy p+cx p
                   in case ps of
                     p:_:_ | all ((==key p) . key) ps -> Right (Aligned a ps)
                     _ -> Left "Alignment contradiction"
    Symmetry a -> let k = axisValue a box
                      pixels = M.fromList (concatMap absolutePixels (objects z))
                  in if M.fromList [(reflectPixel a k p,c) | (p,c) <- M.toList pixels] == pixels
                       then Right (Symmetric a k) else Left "Scene has no witnessed pixel symmetry"
  pure (GlobalLatent enc fact z)
