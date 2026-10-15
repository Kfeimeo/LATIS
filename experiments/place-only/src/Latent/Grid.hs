module Latent.Grid
  ( Grid, Coord(..), Vec(..), Dimensions(..), mkGrid, rows, dimensions
  , cell, inBounds, coords, add, difference, gridFromCells ) where

import qualified Data.IntMap.Strict as IM

data Coord = Coord { cx :: !Int, cy :: !Int } deriving (Eq, Ord, Show, Read)
data Vec = Vec !Int !Int deriving (Eq, Ord, Show, Read)
data Dimensions = Dimensions { gridWidth :: !Int, gridHeight :: !Int }
  deriving (Eq, Ord, Show, Read)
data Grid = Grid !Dimensions [[Int]] deriving (Eq, Ord, Show)

mkGrid :: [[Int]] -> Either String Grid
mkGrid [] = Left "Grid must be nonempty"
mkGrid rs@(first:_)
  | null first = Left "Grid must be nonempty"
  | any ((/= length first) . length) rs = Left "Ragged grid"
  | any (any (\c -> c < 0 || c > 9)) rs = Left "ARC colors must be in [0,9]"
  | otherwise = Right (Grid (Dimensions (length first) (length rs)) rs)

rows :: Grid -> [[Int]]
rows (Grid _ rs) = rs
dimensions :: Grid -> Dimensions
dimensions (Grid d _) = d
inBounds :: Dimensions -> Coord -> Bool
inBounds (Dimensions w h) (Coord x y) = x >= 0 && y >= 0 && x < w && y < h
cell :: Grid -> Coord -> Maybe Int
cell (Grid d rs) p@(Coord x y)
  | inBounds d p = Just ((rs !! y) !! x)
  | otherwise = Nothing
coords :: Dimensions -> [Coord]
coords (Dimensions w h) = [Coord x y | y <- [0..h-1], x <- [0..w-1]]
add :: Coord -> Vec -> Coord
add (Coord x y) (Vec dx dy) = Coord (x+dx) (y+dy)
difference :: Coord -> Coord -> Vec
difference (Coord x y) (Coord a b) = Vec (x-a) (y-b)
gridFromCells :: Dimensions -> Int -> [(Coord,Int)] -> Either String Grid
gridFromCells d@(Dimensions w h) bg ps
  | w <= 0 || h <= 0 = Left "Invalid canvas size"
  | bg < 0 || bg > 9 = Left "Invalid background"
  | any (not . inBounds d . fst) ps = Left "Object lies outside canvas"
  | otherwise = mkGrid [[IM.findWithDefault bg (y*w+x) pixels | x <- [0..w-1]] | y <- [0..h-1]]
  where pixels = IM.fromList [(cy p*w+cx p,c) | (p,c) <- ps]
