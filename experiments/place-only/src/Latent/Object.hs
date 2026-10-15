module Latent.Object where

import Latent.Grid
import qualified Data.Map.Strict as M
import qualified Data.Set as S

-- IDs identify input provenance only; synthesized expressions never inspect them.
data Object = Object
  { objectId :: !Int, position :: !Coord, geometry :: !(M.Map Coord Int)
  , orientation :: !Int
  } deriving (Eq, Ord, Show)
data Scene = Scene
  { canvas :: !Dimensions, background :: !Int, objects :: [Object]
  } deriving (Eq, Ord, Show)
data BBox = BBox { topLeft :: !Coord, bottomRight :: !Coord } deriving (Eq, Ord, Show)

width, height, size :: Object -> Int
width o = 1 + maximum (0 : map cx (M.keys (geometry o)))
height o = 1 + maximum (0 : map cy (M.keys (geometry o)))
size = M.size . geometry
colors :: Object -> S.Set Int
colors = S.fromList . M.elems . geometry
color :: Object -> Maybe Int
color o = case S.toList (colors o) of [c] -> Just c; _ -> Nothing
shape :: Object -> S.Set Coord
shape = M.keysSet . geometry
tl, tr, bl, br, center :: Object -> Coord
tl = position
tr o = add (position o) (Vec (width o-1) 0)
bl o = add (position o) (Vec 0 (height o-1))
br o = add (position o) (Vec (width o-1) (height o-1))
-- Integer lattice center, with the half-cell rounded toward top-left.
center o = add (position o) (Vec ((width o-1) `div` 2) ((height o-1) `div` 2))
bbox :: Object -> BBox
bbox o = BBox (tl o) (br o)
absolutePixels :: Object -> [(Coord,Int)]
absolutePixels o = [(add (position o) (Vec (cx p) (cy p)),c) | (p,c) <- M.toList (geometry o)]
translate :: Object -> Vec -> Object
translate o v = o { position = add (position o) v }
recolor :: Object -> Int -> Object
recolor o c = o { geometry = M.map (const c) (geometry o) }
rotate90 :: Object -> Object
rotate90 o = o { geometry = M.fromList [(Coord (height o-1-cy p) (cx p),c) | (p,c) <- M.toList (geometry o)], orientation = (orientation o+1) `mod` 4 }
rotate180, rotate270, reflectH, reflectV :: Object -> Object
rotate180 = rotate90 . rotate90
rotate270 = rotate90 . rotate180
reflectH o = o { geometry = M.fromList [(Coord (width o-1-cx p) (cy p),c) | (p,c) <- M.toList (geometry o)], orientation = (4-orientation o) `mod` 4 }
reflectV o = o { geometry = M.fromList [(Coord (cx p) (height o-1-cy p),c) | (p,c) <- M.toList (geometry o)], orientation = (2-orientation o) `mod` 4 }
