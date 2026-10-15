module Latent.Encode (Connectivity(..), EncoderConfig(..), defaultEncoder, encode) where

import Latent.Grid
import Latent.Object
import qualified Data.Map.Strict as M
import qualified Data.Set as S
import Data.List (sortOn)

data Connectivity = Four | Eight deriving (Eq, Ord, Show, Read)
data EncoderConfig = EncoderConfig { connectivity :: Connectivity, encoderBackground :: Int }
  deriving (Eq, Show)
defaultEncoder :: EncoderConfig
defaultEncoder = EncoderConfig Four 0

encode :: EncoderConfig -> Grid -> Scene
encode config g = Scene (dimensions g) (encoderBackground config) (zipWith build [0..] components)
  where
    pixels = M.fromList [(p,c) | p <- coords (dimensions g), Just c <- [cell g p], c /= encoderBackground config]
    offsets = [Vec x y | x <- [-1..1], y <- [-1..1], (x,y) /= (0,0), connectivity config == Eight || abs x+abs y == 1]
    components = collect pixels
    collect remaining = case sortOn (\p -> (cy p,cx p)) (M.keys remaining) of
      [] -> []
      p:_ -> let c = remaining M.! p
                 ps = flood c S.empty [p]
                 rest = M.withoutKeys remaining ps
             in M.restrictKeys remaining ps : collect rest
    flood _ seen [] = seen
    flood c seen (p:queue)
      | S.member p seen || M.lookup p pixels /= Just c = flood c seen queue
      | otherwise = flood c (S.insert p seen) (map (add p) offsets ++ queue)
    build i ps = Object i origin (M.fromList [(Coord (cx p-cx origin) (cy p-cy origin),c) | (p,c) <- M.toList ps]) 0
      where origin = Coord (minimum (map cx (M.keys ps))) (minimum (map cy (M.keys ps)))
