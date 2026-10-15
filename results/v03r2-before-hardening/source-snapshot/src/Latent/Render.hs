module Latent.Render (render) where
import Latent.Grid
import Latent.Object

-- Sparse colored geometry only. Empty bounding-box cells do not paint background.
-- fromList in gridFromCells implements deterministic later-object-wins priority.
render :: Scene -> Either String Grid
render z = gridFromCells (canvas z) (background z) (concatMap absolutePixels (objects z))
