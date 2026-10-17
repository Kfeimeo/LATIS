module Synthesis.Residual where
import Latent.Object
import Language.Effect
import qualified Data.Set as S

objectResidual :: Object -> Object -> Effect
objectResidual x y = S.fromList
  ([Position | position x /= position y] ++ [Geometry | shape x /= shape y]
   ++ [Appearance | colors x /= colors y])
-- Orientation is metadata, not observable in the grid; symmetry must not create
-- a spurious orientation-only residual.
residual :: [(Object,Object)] -> Effect
residual = S.unions . map (uncurry objectResidual)
