module Latent.Correspondence where
import Latent.Grid
import Latent.Object
import Latent.Render
import Language.Effect
import qualified Data.Map.Strict as M
import qualified Data.Set as S
import Data.List (sortOn, nubBy)

data MatchEdge = MatchEdge
  { sourceObject :: Object, visibleObject :: Object, targetObject :: Object
  , matchPriority :: (Int,Int,Int,Int), occludedBy :: S.Set Int
  } deriving (Eq, Show)
data Correspondence = Correspondence
  { matched :: [MatchEdge], removed :: [Object], renderOrder :: [Int]
  } deriving (Eq, Show)
data CorrespondenceGraph = CorrespondenceGraph
  { edges :: [MatchEdge], branches :: [Correspondence], truncated :: Bool, diagnostics :: [String]
  } deriving (Eq, Show)

-- Match full source geometry against partially visible output geometry. Pixels
-- can disappear only behind a different non-background color; render validation
-- of the entire branch subsequently proves the occlusion ordering.
correspond :: Int -> Scene -> Scene -> CorrespondenceGraph
correspond limit input output = CorrespondenceGraph candidates kept tooMany notes
  where
    outGrid = render output
    owners = M.fromList [(p,objectId o) | o <- objects output, (p,_) <- absolutePixels o]
    variants o = nubBy (\a b -> geometry a == geometry b)
      [f o | f <- [id,rotate90,rotate180,rotate270,reflectH,reflectV,reflectH . rotate90,reflectV . rotate90]]
    candidates = sortOn matchPriority
      [edge | x <- objects input, y <- objects output, v <- variants x, edge <- matchVariant x y v]
    matchVariant x y v = case (color y,outGrid) of
      (Just c,Right g) ->
        let recolored = recolor v c
            visible = M.fromList (absolutePixels y)
            origins = S.toList (S.fromList [Coord (cx p-cx q) (cy p-cy q) | p <- M.keys visible, q <- M.keys (geometry recolored)])
            make origin = recolored { position = origin }
            legal t = let predicted = M.fromList (absolutePixels t)
                      in all (\(p,k) -> M.lookup p predicted == Just k) (M.toList visible)
                         && all (\(p,k) -> case cell g p of
                              Just actual -> actual == k || actual /= background output
                              Nothing -> False) (M.toList predicted)
            makeEdge t = MatchEdge x y t
              (if colors x == colors y then 0 else 1, if shape x == shape y then 0 else 1,
               abs (size x-size y), abs (objectId x-objectId y))
              (S.fromList [owner | (p,k) <- absolutePixels t, cell g p /= Just k, Just owner <- [M.lookup p owners]])
        in map (makeEdge . make) (filter (legal . make) origins)
      _ -> []
    -- Assign every visible output component exactly once; input objects may be
    -- dropped (filter). Fully invisible objects and union/split are unsupported.
    assignments [] _ = [[]]
    assignments (y:ys) used =
      [e:rest | e <- candidates, objectId (visibleObject e) == objectId y,
        not (S.member (objectId (sourceObject e)) used),
        rest <- assignments ys (S.insert (objectId (sourceObject e)) used)]
    proposals = assignments (objects output) S.empty
    -- Bound traversal itself, not just successful branches, to prevent factorial
    -- ambiguity from causing silent unbounded computation.
    inspected = take (limit+1) proposals
    tooMany = length inspected > limit
    kept = [c | es <- take limit inspected, Just c <- [validate es]]
    validate es = do
      ordering <- topological es
      let selected = [targetObject e | i <- ordering, e <- es, objectId (visibleObject e) == i]
      g <- either (const Nothing) Just (render output { objects = selected })
      expected <- either (const Nothing) Just outGrid
      if g /= expected then Nothing else
        Just (Correspondence es [x | x <- objects input, all ((/= objectId x) . objectId . sourceObject) es] ordering)
    notes = ["CurrentlyUnsupported: correspondence branch budget exceeded" | tooMany]
      ++ ["CurrentlyUnsupported: union/split, fully occluded objects, or transformations outside the finite geometry closure" | null kept]

topological :: [MatchEdge] -> Maybe [Int]
topological es = go [] (map (objectId . visibleObject) es)
  where
    dependencies i = S.unions [occludedBy e | e <- es, objectId (visibleObject e) == i]
    -- An edge i -> j means i must paint before its occluder j.
    go placed [] = Just placed
    go placed remaining = case [i | i <- remaining, all (\j -> not (S.member i (dependencies j))) remaining] of
      [] -> Nothing
      i:_ -> go (placed++[i]) (filter (/=i) remaining)

correspondencePairs :: Correspondence -> [(Object,Object)]
correspondencePairs = map (\e -> (sourceObject e,targetObject e)) . matched

correspondenceStatus :: CorrespondenceGraph -> Eligibility
correspondenceStatus graph
  | truncated graph = CurrentlyUnsupported "Ambiguity exceeds the configured branch budget; no impossibility claim"
  | null (branches graph) = CurrentlyUnsupported "No supported visibility/geometry correspondence; union/split or invisible objects may be needed"
  | otherwise = Eligible
