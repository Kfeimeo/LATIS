-- LATIS Stage E1: exact rectangle covers of a PixelSet.
--
-- The extensional truth is always the PixelSet S (a finite set of canvas
-- coordinates). A Cover(S) is a list of closed, axis-aligned integer
-- rectangles R_i = [x0..x1] x [y0..y1] with
--
--     every R_i a subset of S   and   union_i R_i == S.
--
-- Nothing here covers holes or background and subtracts them afterwards:
-- every rectangle is checked to lie inside S. Rectangles may overlap.
--
-- Three results are distinguished and never conflated:
--   ProvenMinimal  the branch-and-bound search completed: no cover with fewer
--                  rectangles exists (k* = length canonical); the canonical
--                  representative is the lexicographically smallest sorted
--                  rectangle list among the optimal covers found, the other
--                  optimal covers found are kept (count status: complete or
--                  truncated), because a minimal cover is not unique.
--   ValidBounded   a legal cover with a lower bound and an upper bound; the
--                  optimisation was truncated (node budget, area budget or
--                  alternative cap) and the upper bound is NOT called k*.
--   EmptyCover     S is empty: [] rectangles, EmptyBounds, k*(empty) = 0.
--
-- Deterministic: maximal rectangles are enumerated in a fixed order and every
-- tie is broken by the (y0,x0,y1,x1) key, so the same PixelSet always gives
-- the same result for the same budget.
module Synthesis.Collection.Geometry.Cover
  ( PixelSet, pixelSetFromList, pixelSetToList, pixelSetSize, pixelSetTranslate, pixelSetNormalize
  , Rect(..), mkRect, rectCells, rectWidth, rectHeight, rectArea, rectContains, rectInside, rectKey, rectJSON
  , BoundsE(..), boundsOfPixels, boundsRect
  , CoverBudget(..), defaultCoverBudget, predicateCoverBudget
  , CoverResult(..), CoverStatus(..), coverRectangles, coverRectCount, coverProven, coverStatusText
  , maximalRectangles, greedyCover, lowerBoundRects, minimalCover, verifyCover, coverJSON, coverUnion
  ) where

import Latent.Grid (Coord(..))
import qualified Data.Set as S
import qualified Data.Map.Strict as M
import Data.List (sortOn, minimumBy, sort, nub, foldl')
import Data.Ord (comparing)
import Synthesis.Collection.Diagnostics (jstr, jobj, jarr, jbool)

type PixelSet = S.Set Coord
pixelSetFromList :: [Coord] -> PixelSet
pixelSetFromList=S.fromList
pixelSetToList :: PixelSet -> [Coord]
pixelSetToList=S.toAscList
pixelSetSize :: PixelSet -> Int
pixelSetSize=S.size
pixelSetTranslate :: Int -> Int -> PixelSet -> PixelSet
pixelSetTranslate dx dy=S.map (\(Coord x y)->Coord (x+dx) (y+dy))
-- Translation-invariant normal form: minimum x and y become 0 (empty stays empty).
pixelSetNormalize :: PixelSet -> PixelSet
pixelSetNormalize s
  | S.null s = s
  | otherwise = let mx=minimum [x | Coord x _<-S.toList s]; my=minimum [y | Coord _ y<-S.toList s] in pixelSetTranslate (negate mx) (negate my) s

-- Closed rectangle [rx0..rx1] x [ry0..ry1]; mkRect rejects inverted or
-- negative rectangles (never clips).
data Rect = Rect { rx0, ry0, rx1, ry1 :: !Int } deriving (Eq,Ord,Show)
mkRect :: Int -> Int -> Int -> Int -> Either String Rect
mkRect x0 y0 x1 y1
  | x1<x0 || y1<y0 = Left ("inverted rectangle "++show (x0,y0,x1,y1))
  | x0<0 || y0<0 = Left ("negative rectangle coordinates "++show (x0,y0,x1,y1))
  | otherwise = Right (Rect x0 y0 x1 y1)
rectCells :: Rect -> [Coord]
rectCells (Rect x0 y0 x1 y1)=[Coord x y | y<-[y0..y1], x<-[x0..x1]]
rectWidth, rectHeight, rectArea :: Rect -> Int
rectWidth r=rx1 r-rx0 r+1
rectHeight r=ry1 r-ry0 r+1
rectArea r=rectWidth r*rectHeight r
rectContains :: Rect -> Coord -> Bool
rectContains (Rect x0 y0 x1 y1) (Coord x y)=x>=x0 && x<=x1 && y>=y0 && y<=y1
rectInside :: PixelSet -> Rect -> Bool
rectInside s r=all (`S.member` s) (rectCells r)
-- Stable ordering key (y0,x0,y1,x1).
rectKey :: Rect -> (Int,Int,Int,Int)
rectKey (Rect x0 y0 x1 y1)=(y0,x0,y1,x1)
rectJSON :: Rect -> String
rectJSON r=jobj [("x_min",show (rx0 r)),("y_min",show (ry0 r)),("x_max",show (rx1 r)),("y_max",show (ry1 r)),("width",show (rectWidth r)),("height",show (rectHeight r)),("inclusive",jbool True)]

-- Bounds of a PixelSet: inclusive extremes, or EmptyBounds (never min/max of []).
data BoundsE = EmptyBounds | PixelBounds Rect deriving (Eq,Ord,Show)
boundsOfPixels :: PixelSet -> BoundsE
boundsOfPixels s
  | S.null s = EmptyBounds
  | otherwise = let xs=[x | Coord x _<-S.toList s]; ys=[y | Coord _ y<-S.toList s] in PixelBounds (Rect (minimum xs) (minimum ys) (maximum xs) (maximum ys))
boundsRect :: BoundsE -> Maybe Rect
boundsRect EmptyBounds=Nothing
boundsRect (PixelBounds r)=Just r

data CoverBudget = CoverBudget
  { cbMaxNodes :: Int             -- branch-and-bound nodes
  , cbMaxArea :: Int              -- bbox area above which only the greedy cover is computed
  , cbMaxAlternatives :: Int      -- optimal covers kept beyond the canonical one
  } deriving (Eq,Show)
defaultCoverBudget :: CoverBudget
defaultCoverBudget=CoverBudget 20000 900 8
-- Cheaper budget for selection predicates evaluated many times per search.
predicateCoverBudget :: CoverBudget
predicateCoverBudget=CoverBudget 4000 400 2

data CoverStatus = StatusProvenMinimal | StatusBounded String | StatusEmpty deriving (Eq,Show)
data CoverResult
  = EmptyCover
  | ProvenMinimal { crCanonical :: [Rect], crAlternatives :: [[Rect]], crAlternativesComplete :: Bool, crNodes :: Int, crMaximalRects :: Int, crLowerBound :: Int }
  | ValidBounded { crBest :: [Rect], crLower :: Int, crUpper :: Int, crTruncation :: String, crNodes :: Int, crMaximalRects :: Int }
  deriving (Eq,Show)
coverRectangles :: CoverResult -> [Rect]
coverRectangles EmptyCover=[]
coverRectangles r@ProvenMinimal{}=crCanonical r
coverRectangles r@ValidBounded{}=crBest r
coverRectCount :: CoverResult -> Int
coverRectCount=length . coverRectangles
coverProven :: CoverResult -> Bool
coverProven ProvenMinimal{}=True
coverProven EmptyCover=True
coverProven _=False
coverStatusText :: CoverResult -> String
coverStatusText EmptyCover="empty"
coverStatusText ProvenMinimal{}="proven_minimal"
coverStatusText r@ValidBounded{}="bounded: "++crTruncation r
coverUnion :: [Rect] -> PixelSet
coverUnion=S.fromList . concatMap rectCells

-- Maximal rectangles inside S (no rectangle inside S strictly contains them),
-- in (y0,x0,y1,x1) order. A pixel row segment is extended downward as far as
-- every row stays inside S; non-maximal candidates are removed afterwards.
maximalRectangles :: PixelSet -> [Rect]
maximalRectangles s
  | S.null s = []
  | otherwise = sortOn rectKey [r | r<-cands, not (any (\q->q/=r && contains q r) cands)]
  where
    inS=(`S.member` s)
    xs=[x | Coord x _<-S.toList s]; ys=[y | Coord _ y<-S.toList s]
    maxX=maximum xs; maxY=maximum ys
    rowOK y x0 x1=all (\x->inS (Coord x y)) [x0..x1]
    -- every (top-left, right edge) of a row run, extended down as far as
    -- possible: a maximal rectangle has a top row and cannot extend down,
    -- so it is generated from its own top-left corner and right edge
    cands=nub [Rect x0 y0 x1 (extend y0 x0 x1) | Coord x0 y0<-S.toList s, x1<-takeWhile (\x->inS (Coord x y0)) [x0..maxX]]
    extend y0 x0 x1=last (takeWhile (\y->rowOK y x0 x1) [y0..maxY])
    contains (Rect a0 b0 a1 b1) (Rect c0 d0 c1 d1)=a0<=c0 && b0<=d0 && a1>=c1 && b1>=d1

-- Deterministic legal cover: repeatedly take the maximal rectangle covering
-- the most still-uncovered pixels (ties by key). Every pixel lies in some
-- maximal rectangle, so the loop terminates with union == S.
greedyCover :: PixelSet -> [Rect] -> [Rect]
greedyCover s maxRects=go s []
  where
    go left acc
      | S.null left = sortOn rectKey acc
      | otherwise =
          let gain r=length (filter (`S.member` left) (rectCells r))
              best=minimumBy (comparing (\r->(negate (gain r),rectKey r))) maxRects
          in if gain best==0 then sortOn rectKey acc else go (S.difference left (S.fromList (rectCells best))) (best:acc)

-- Sound lower bound: a set of pixels no two of which fit in one rectangle
-- inside S (their spanning rectangle leaves S). Any rectangle inside S holds
-- at most one of them, so every cover needs at least that many rectangles.
lowerBoundRects :: PixelSet -> Int
lowerBoundRects s=length (foldl' step [] (S.toAscList s))
  where
    step chosen p=if all (incompatible p) chosen then p:chosen else chosen
    incompatible (Coord ax ay) (Coord bx by)=not (rectInside s (Rect (min ax bx) (min ay by) (max ax bx) (max ay by)))

-- Exact minimal cover by branch-and-bound over maximal rectangles. The
-- uncovered pixel with the fewest covering maximal rectangles is branched on
-- (its rectangles in key order); a branch is cut when
-- depth + lowerBound(uncovered) exceeds the best size. Covers equal to the
-- best size are collected as alternatives (set-deduplicated) up to the cap.
minimalCover :: CoverBudget -> PixelSet -> CoverResult
minimalCover budget s
  | S.null s = EmptyCover
  | areaOf s>cbMaxArea budget = ValidBounded greedy (lowerBoundRects s) (length greedy) ("bbox area "++show (areaOf s)++" exceeds the exact-search area budget "++show (cbMaxArea budget)) 0 (length maxRects)
  | otherwise =
      let st0=BB (length greedy) [sort greedy] False 0 False
          st=search st0 0 [] s
          lb=lowerBoundRects s
          optimal=sortOn id (nub (bbCovers st))
      in if bbTruncated st
           then ValidBounded (canonicalOf optimal) lb (bbBest st) ("node budget "++show (cbMaxNodes budget)++" exhausted after "++show (bbNodes st)++" nodes") (bbNodes st) (length maxRects)
           else ProvenMinimal (canonicalOf optimal) (drop 1 optimal) (not (bbAltCut st)) (bbNodes st) (length maxRects) (bbBest st)
  where
    maxRects=maximalRectangles s
    greedy=greedyCover s maxRects
    areaOf ps=case boundsOfPixels ps of EmptyBounds->0; PixelBounds r->rectArea r
    canonicalOf (c:_)=c
    canonicalOf []=greedy
    byPixel=M.fromListWith (++) [(p,[r]) | r<-maxRects, p<-rectCells r]
    search st depth chosen left
      | S.null left =
          let cover=sort chosen
          in if depth<bbBest st then st {bbBest=depth,bbCovers=[cover],bbAltCut=False}
             else if depth==bbBest st then
               (if length (bbCovers st)>cbMaxAlternatives budget then st {bbAltCut=True}
                else if cover `elem` bbCovers st then st else st {bbCovers=cover:bbCovers st})
             else st
      | bbNodes st>=cbMaxNodes budget = st {bbTruncated=True}
      | otherwise =
          let st2=st {bbNodes=bbNodes st+1}
              lb=lowerBoundRects left
          in if depth+lb>bbBest st2 then st2
             else
               let pick=minimumBy (comparing (\p->(length (M.findWithDefault [] p byPixel),p))) (S.toList left)
                   options=sortOn rectKey (M.findWithDefault [] pick byPixel)
               in foldl' (\acc r->if bbTruncated acc then acc else search acc (depth+1) (r:chosen) (S.difference left (S.fromList (rectCells r)))) st2 options
data BB = BB { bbBest :: Int, bbCovers :: [[Rect]], bbTruncated :: Bool, bbNodes :: Int, bbAltCut :: Bool }

-- Independent check of a cover against the pixel set: every rectangle inside
-- S, union exactly S (both directions reported), no inverted rectangle.
verifyCover :: PixelSet -> [Rect] -> Either String ()
verifyCover s rs
  | any (\r->rx1 r<rx0 r || ry1 r<ry0 r) rs = Left "inverted rectangle"
  | not (null outside) = Left ("rectangle outside the pixel set: "++show (take 3 outside))
  | not (S.null missing) = Left ("pixels not covered: "++show (take 5 (S.toList missing)))
  | otherwise = Right ()
  where outside=[r | r<-rs, not (rectInside s r)]
        missing=S.difference s (coverUnion rs)

coverJSON :: CoverResult -> String
coverJSON EmptyCover=jobj [("status",jstr "empty"),("rectangles","[]"),("k_star","0"),("lower_bound","0"),("upper_bound","0")]
coverJSON r@ProvenMinimal{}=jobj [("status",jstr "proven_minimal"),("rectangles",jarr (map rectJSON (crCanonical r))),("k_star",show (length (crCanonical r)))
  ,("lower_bound",show (crLowerBound r)),("upper_bound",show (length (crCanonical r)))
  ,("alternative_optimal_covers",jarr [jarr (map rectJSON a) | a<-crAlternatives r]),("alternatives_complete",jbool (crAlternativesComplete r))
  ,("alternatives_note",jstr (if crAlternativesComplete r then "every optimal cover found by the complete search is listed" else "optimal covers beyond the cap exist (count unknown)"))
  ,("nodes",show (crNodes r)),("maximal_rectangles",show (crMaximalRects r)),("optimality_certificate",jstr "branch-and-bound over all maximal rectangles completed within the node budget; pruning uses the pairwise-incompatible-pixel lower bound")]
coverJSON r@ValidBounded{}=jobj [("status",jstr "bounded"),("rectangles",jarr (map rectJSON (crBest r))),("k_star","null"),("lower_bound",show (crLower r)),("upper_bound",show (crUpper r))
  ,("truncation",jstr (crTruncation r)),("nodes",show (crNodes r)),("maximal_rectangles",show (crMaximalRects r)),("note",jstr "legal cover; the upper bound is the size of the best cover found, not the minimum")]
