-- LATIS Stage C1: Shape algebra.
--
-- A ShapeMask is the finite set of relative pixel coordinates of ONE
-- single-colour object, separated from its colour and from its placement on
-- the canvas (x right, y down, origin = bounding-box top-left after
-- normalization). ShapeMask, Object and Set[Object] are different types: a
-- mask never carries a colour or an absolute position, and a mask that is
-- empty or disconnected is still a mask but is not automatically an object
-- (the object system only receives it through `maskConnected` / an explicit
-- construction that returns Either).
--
-- Primitives (all evaluated to pixel sets, every parameter validated):
--   Rectangle w h            solid, w,h >= 1
--   Square s                 solid, = Rectangle s s
--   EquilateralTriangle n o  DISCRETE template: n rows; row r (0-based, from
--                            the apex) has 2r+1 cells centred under the apex,
--                            so the base has 2n-1 cells and the bounding box is
--                            (2n-1) x n. The four orientations are the apex
--                            direction (Up/Down/Left/Right). This is the
--                            pixelation rule of this repository, not a claim
--                            of geometric equilaterality (a lattice has none);
--                            n >= 2 for the shape features (n = 1 is a pixel).
--   DiagonalBar len d        thickness 1; DownRight: (i,i), DownLeft: (len-1-i,i),
--                            len >= 1 (len >= 2 for the IsDiagonal feature)
--   Shell w h t              Rectangle w h minus the inner Rectangle (w-2t)(h-2t)
--                            at offset (t,t); requires t >= 1 and 2t < min w h.
--                            A thickness that leaves no hole is an explicit
--                            error (the shape IS a Rectangle, and the canonical
--                            decomposition names it so).
--   Union / Intersection     pixel-set operations in ONE local frame; the
--                            second operand may be placed at an offset (At).
module Synthesis.Collection.Shape
  ( ShapeMask, maskFromCells, maskCells, maskSize, maskWidth, maskHeight, emptyMask, maskConnected, maskOfObject
  , Orientation(..), Direction(..), ShapePrim(..), ShapeExpr(..), primCells, evalShape, shapeMask, shapeSize, shapeText
  , isRectangle, isSquare, isShell, shellThickness, isTriangle, isDiagonal, diagonalLength, recognizePrim
  , DecompBudget(..), defaultDecompBudget, Decomposition(..), decompose, primitiveKinds
  , DiagonalChain(..), DiagonalRejection(..), detectDiagonalChains, applyDiagonalView
  ) where

import Latent.Grid
import qualified Latent.Object as O
import qualified Data.Map.Strict as M
import qualified Data.Set as S
import Data.List (sortOn, nub, sort)

newtype ShapeMask = ShapeMask (S.Set (Int,Int)) deriving (Eq,Ord,Show)

-- Normalized: the minimum x and y of a non-empty mask are both 0.
maskFromCells :: [(Int,Int)] -> ShapeMask
maskFromCells []=ShapeMask S.empty
maskFromCells cs=let mx=minimum (map fst cs); my=minimum (map snd cs) in ShapeMask (S.fromList [(x-mx,y-my) | (x,y)<-cs])
maskCells :: ShapeMask -> [(Int,Int)]
maskCells (ShapeMask s)=S.toAscList s
maskSize :: ShapeMask -> Int
maskSize (ShapeMask s)=S.size s
maskWidth, maskHeight :: ShapeMask -> Int
maskWidth (ShapeMask s) | S.null s = 0 | otherwise = 1+maximum (map fst (S.toList s))
maskHeight (ShapeMask s) | S.null s = 0 | otherwise = 1+maximum (map snd (S.toList s))
emptyMask :: ShapeMask -> Bool
emptyMask (ShapeMask s)=S.null s
-- 4-connectivity, the global object convention of the encoder.
maskConnected :: ShapeMask -> Bool
maskConnected (ShapeMask s)
  | S.null s = False
  | otherwise = S.size (go S.empty [S.findMin s])==S.size s
  where go seen []=seen
        go seen (p@(x,y):rest)
          | S.member p seen || not (S.member p s) = go seen rest
          | otherwise = go (S.insert p seen) ([(x+1,y),(x-1,y),(x,y+1),(x,y-1)]++rest)
maskOfObject :: O.Object -> ShapeMask
maskOfObject o=maskFromCells [(cx p,cy p) | p<-M.keys (O.geometry o)]

data Orientation = Up | Down | LeftO | RightO deriving (Eq,Ord,Show,Enum,Bounded)
data Direction = DownRight | DownLeft deriving (Eq,Ord,Show,Enum,Bounded)
data ShapePrim = Square Int | Rectangle Int Int | Shell Int Int Int | DiagonalBar Int Direction | EquilateralTriangle Int Orientation
  deriving (Eq,Ord,Show)
data ShapeExpr = Prim ShapePrim | At (Int,Int) ShapeExpr | Union ShapeExpr ShapeExpr | Intersection ShapeExpr ShapeExpr
  deriving (Eq,Ord,Show)

primCells :: ShapePrim -> Either String (S.Set (Int,Int))
primCells (Rectangle w h)
  | w<1 || h<1 = Left ("Rectangle requires width,height >= 1: "++show (w,h))
  | otherwise = Right (S.fromList [(x,y) | x<-[0..w-1], y<-[0..h-1]])
primCells (Square s)=either (const (Left ("Square requires side >= 1: "++show s))) Right (primCells (Rectangle s s))
primCells (Shell w h t)
  | w<1 || h<1 = Left ("Shell requires width,height >= 1: "++show (w,h))
  | t<1 = Left ("Shell requires thickness >= 1: "++show t)
  | 2*t>=min w h = Left ("Shell thickness "++show t++" leaves no hole in "++show (w,h)++": the shape is a solid Rectangle")
  | otherwise = Right (S.fromList [(x,y) | x<-[0..w-1], y<-[0..h-1], x<t || y<t || x>=w-t || y>=h-t])
primCells (DiagonalBar n d)
  | n<1 = Left ("DiagonalBar requires length >= 1: "++show n)
  | otherwise = Right (S.fromList [case d of DownRight->(i,i); DownLeft->(n-1-i,i) | i<-[0..n-1]])
primCells (EquilateralTriangle n o)
  | n<1 = Left ("EquilateralTriangle requires size >= 1: "++show n)
  | otherwise = Right (S.fromList (map orient [(x,r) | r<-[0..n-1], x<-[n-1-r..n-1+r]]))
  where orient (x,r)=case o of
          Up->(x,r)                       -- apex at the top row
          Down->(x,n-1-r)                 -- apex at the bottom row
          LeftO->(r,x)                    -- apex at the left column (bbox n x w)
          RightO->(n-1-r,x)               -- apex at the right column

-- Evaluate in the local frame; At offsets the operand, Union/Intersection
-- combine two operands of the same frame. The result is NOT normalized.
evalShape :: ShapeExpr -> Either String (S.Set (Int,Int))
evalShape (Prim p)=primCells p
evalShape (At (dx,dy) e)=S.map (\(x,y)->(x+dx,y+dy)) <$> evalShape e
evalShape (Union a b)=S.union <$> evalShape a <*> evalShape b
evalShape (Intersection a b)=S.intersection <$> evalShape a <*> evalShape b
shapeMask :: ShapeExpr -> Either String ShapeMask
shapeMask e=maskFromCells . S.toList <$> evalShape e
-- AST size (the canonical decomposition minimizes it): every primitive and
-- every set operation is one node; a placement offset is not a node.
shapeSize :: ShapeExpr -> Int
shapeSize (Prim _)=1
shapeSize (At _ e)=shapeSize e
shapeSize (Union a b)=1+shapeSize a+shapeSize b
shapeSize (Intersection a b)=1+shapeSize a+shapeSize b
shapeText :: ShapeExpr -> String
shapeText (Prim p)=case p of
  Square s->"Square("++show s++")"
  Rectangle w h->"Rectangle("++show w++","++show h++")"
  Shell w h t->"Shell("++show w++","++show h++","++show t++")"
  DiagonalBar n d->"DiagonalBar("++show n++","++show d++")"
  EquilateralTriangle n o->"EquilateralTriangle("++show n++","++show o++")"
shapeText (At (dx,dy) e)="At("++show dx++","++show dy++","++shapeText e++")"
shapeText (Union a b)="Union("++shapeText a++","++shapeText b++")"
shapeText (Intersection a b)="Intersection("++shapeText a++","++shapeText b++")"

-- Exact recognition of a normalized mask as ONE primitive (every primitive
-- whose cells equal the mask). Order = canonical preference on ties:
-- Square < Rectangle < Shell < DiagonalBar < EquilateralTriangle.
recognizePrim :: ShapeMask -> [ShapePrim]
recognizePrim m@(ShapeMask s)
  | S.null s = []
  | otherwise = [p | p<-candidates, primCells p==Right s]
  where w=maskWidth m; h=maskHeight m
        candidates=[Square w | w==h]++[Rectangle w h]++[Shell w h t | t<-[1..(min w h-1) `div` 2]]
          ++[DiagonalBar w d | w==h, d<-[minBound..maxBound]]
          ++[EquilateralTriangle n o | (n,o)<-[(h,Up),(h,Down),(w,LeftO),(w,RightO)], triangleFits n o]
        triangleFits n o=case o of
          Up->w==2*n-1; Down->w==2*n-1; LeftO->h==2*n-1; RightO->h==2*n-1
isRectangle, isSquare, isShell, isTriangle, isDiagonal :: ShapeMask -> Bool
isRectangle m=any (\p->case p of Rectangle _ _->True; Square _->True; _->False) (recognizePrim m)
isSquare m=any (\p->case p of Square _->True; _->False) (recognizePrim m)
isShell m=any (\p->case p of Shell _ _ _->True; _->False) (recognizePrim m)
-- a single pixel is a Square, not a triangle and not a diagonal bar
isTriangle m=any (\p->case p of EquilateralTriangle n _->n>=2; _->False) (recognizePrim m)
isDiagonal m=any (\p->case p of DiagonalBar n _->n>=2; _->False) (recognizePrim m)
shellThickness :: ShapeMask -> Maybe Int
shellThickness m=case [t | Shell _ _ t<-recognizePrim m] of (t:_)->Just t; []->Nothing
diagonalLength :: ShapeMask -> Maybe Int
diagonalLength m=case [n | DiagonalBar n _<-recognizePrim m, n>=2] of (n:_)->Just n; []->Nothing

-- Bounded canonical decomposition. Depth 1: one primitive. Depth 2: the Union
-- of two placed primitives drawn from the primitives contained in the mask,
-- or the Intersection of two primitives that both contain the mask and share
-- its bounding box. The result is the minimum AST size; ties are broken by
-- the derived order of ShapeExpr (deterministic). Everything is counted; a
-- budget overrun is reported as truncated, never as "not representable".
data DecompBudget = DecompBudget { dbMaxArea :: Int, dbMaxCandidates :: Int, dbMaxPairs :: Int } deriving (Eq,Show)
defaultDecompBudget :: DecompBudget
defaultDecompBudget=DecompBudget 900 400 60000
data Decomposition = Decomposition
  { dcExpr :: Maybe ShapeExpr          -- the canonical minimum (Nothing: not representable within depth 2 / budget)
  , dcSize :: Int                      -- AST size of the chosen expression (0 when none)
  , dcTies :: Int                      -- number of minimum-size expressions (the first in canonical order is exposed)
  , dcCandidates :: Int                -- contained/containing primitives considered
  , dcPairsTried :: Int
  , dcTruncated :: Bool } deriving (Eq,Show)
decompose :: DecompBudget -> ShapeMask -> Decomposition
decompose budget m@(ShapeMask s)
  | S.null s = Decomposition Nothing 0 0 0 0 False
  | maskWidth m*maskHeight m>dbMaxArea budget = Decomposition Nothing 0 0 0 0 True
  | (p0:_)<-prims = Decomposition (Just (Prim p0)) 1 (length prims) (length prims) 0 False
  | otherwise =
      let contained=take (dbMaxCandidates budget) containedPrims
          truncC=length containedPrims>dbMaxCandidates budget
          pairs=[(a,b) | (i,a)<-zip [0::Int ..] contained, b<-drop i contained]
          tried=take (dbMaxPairs budget) pairs
          truncP=length pairs>dbMaxPairs budget
          unions=[Union (place a) (place b) | (a,b)<-tried, S.union (snd a) (snd b)==s]
          inters=[Intersection (Prim a) (Prim b) | (i,a)<-zip [0::Int ..] containing, b<-drop (i+1) containing
                 , Right ca<-[primCells a], Right cb<-[primCells b], S.intersection ca cb==s]
          found=sort (unions++inters)
      in case found of
          []->Decomposition Nothing 0 0 (length contained+length containing) (length tried) (truncC || truncP)
          (e:_)->Decomposition (Just e) (shapeSize e) (length found) (length contained+length containing) (length tried) (truncC || truncP)
  where
    prims=recognizePrim m
    w=maskWidth m; h=maskHeight m
    place (p,cells)=let mx=minimum (map fst (S.toList cells)); my=minimum (map snd (S.toList cells)) in if (mx,my)==(0,0) then Prim p else At (mx,my) (Prim p)
    -- primitives whose cells lie inside the mask: all sub-rectangles (squares
    -- first), shells, maximal diagonal runs and triangles anchored in the bbox
    containedPrims=[(p,c) | (p,c)<-rects++shells++diags++tris, c `S.isSubsetOf` s, c/=s]
    rects=[(if rw==rh then Square rw else Rectangle rw rh,S.fromList [(x,y) | x<-[x0..x0+rw-1], y<-[y0..y0+rh-1]])
          | x0<-[0..w-1], y0<-[0..h-1], rw<-[1..w-x0], rh<-[1..h-y0]]
    shells=[(Shell rw rh t,S.map (\(x,y)->(x+x0,y+y0)) c) | x0<-[0..w-1], y0<-[0..h-1], rw<-[3..w-x0], rh<-[3..h-y0], t<-[1..(min rw rh-1) `div` 2], Right c<-[primCells (Shell rw rh t)]]
    diags=[(DiagonalBar n d,S.map (\(x,y)->(x+x0,y+y0)) c) | d<-[minBound..maxBound], x0<-[0..w-1], y0<-[0..h-1], n<-[2..min (w-x0) (h-y0)], Right c<-[primCells (DiagonalBar n d)]]
    tris=[(EquilateralTriangle n o,S.map (\(x,y)->(x+x0,y+y0)) c) | o<-[minBound..maxBound], n<-[2..max w h], x0<-[0..w-1], y0<-[0..h-1], Right c<-[primCells (EquilateralTriangle n o)]
         , all (\(x,y)->x<w && y<h) (S.toList (S.map (\(x,y)->(x+x0,y+y0)) c))]
    -- primitives that contain the mask and share its bounding box
    containing=[p | p<-[Rectangle w h]++[EquilateralTriangle n o | (n,o)<-[(h,Up),(h,Down),(w,LeftO),(w,RightO)]]++[Shell w h t | t<-[1..(min w h-1) `div` 2]]
               , Right c<-[primCells p], s `S.isSubsetOf` c, c/=s]
primitiveKinds :: ShapeExpr -> [String]
primitiveKinds=nub . go
  where go (Prim p)=[takeWhile (/=' ') (show p)]
        go (At _ e)=go e
        go (Union a b)=go a++go b
        go (Intersection a b)=go a++go b

-- Local 8-neighbourhood view for diagonal bars. Under the global
-- 4-connectivity a diagonal chain of same-colour pixels is k separate 1x1
-- objects. A candidate chain is a maximal strict sequence p, p+(1,1), ...
-- (or p+(1,-1), ...) of single-pixel objects of one colour, length >= 2, and
-- it is ACCEPTED only when every chain pixel has no other same-colour pixel
-- (of ANY object) among its 8 neighbours than its chain predecessor and
-- successor: crossings, bends, branches, touching same-colour objects and
-- adjacent same-colour noise all reject the chain, and the pixels stay
-- separate objects. The global encoding is unchanged; the view only replaces
-- accepted chains by one object whose provenance lists the source object ids.
data DiagonalChain = DiagonalChain { dcColor :: Int, dcDirection :: Direction, dcPixels :: [Coord], dcSources :: [Int] } deriving (Eq,Show)
data DiagonalRejection = DiagonalRejection { drColor :: Int, drDirection :: Direction, drPixels :: [Coord], drReason :: String } deriving (Eq,Show)
detectDiagonalChains :: [O.Object] -> ([DiagonalChain],[DiagonalRejection])
detectDiagonalChains objs=(accepted,rejected)
  where
    singles=M.fromList [(O.position o,(c,O.objectId o)) | o<-objs, M.size (O.geometry o)==1, Just c<-[O.color o]]
    allCells=M.fromList [(p,c) | o<-objs, (p,c)<-O.absolutePixels o]
    step DownRight (Coord x y)=Coord (x+1) (y+1)
    step DownLeft (Coord x y)=Coord (x-1) (y+1)
    back DownRight (Coord x y)=Coord (x-1) (y-1)
    back DownLeft (Coord x y)=Coord (x+1) (y-1)
    same c p=fmap fst (M.lookup p singles)==Just c
    chainsFrom d=[walk d p c | (p,(c,_))<-M.toList singles, not (same c (back d p))]
    walk d p c=let ps=takeWhile (same c) (iterate (step d) p) in (c,d,ps)
    raw=[(c,d,ps) | d<-[minBound..maxBound], (c,_,ps)<-chainsFrom d, length ps>=2]
    neighbours (Coord x y)=[Coord (x+dx) (y+dy) | dx<-[-1,0,1], dy<-[-1,0,1], (dx,dy)/=(0,0)]
    verdict (c,d,ps)=
      let allowed p=S.fromList ([back d p | back d p `elem` ps]++[step d p | step d p `elem` ps])
          offenders=[(p,q) | p<-ps, q<-neighbours p, M.lookup q allCells==Just c, not (S.member q (allowed p))]
      in case offenders of
          []->Left (DiagonalChain c d ps (sort [i | p<-ps, Just (_,i)<-[M.lookup p singles]]))
          ((p,q):_)->Right (DiagonalRejection c d ps ("same-colour pixel "++show (cx q,cy q)++" touches chain pixel "++show (cx p,cy p)++" outside the chain (crossing/bend/branch/touching object)"))
    verdicts=map verdict raw
    accepted=[a | Left a<-verdicts]
    rejected=[r | Right r<-verdicts]
-- Replace the pixels of every accepted chain by one object (id = the smallest
-- source id, geometry = the DiagonalBar mask). Rejected chains are reported;
-- their pixels stay as they were.
applyDiagonalView :: [O.Object] -> ([O.Object],[DiagonalChain],[DiagonalRejection])
applyDiagonalView objs=
  let (chains,rejs)=detectDiagonalChains objs
      consumed=S.fromList (concatMap dcSources chains)
      merged=[O.Object (minimum (dcSources ch)) origin (M.fromList [(Coord (cx p-cx origin) (cy p-cy origin),dcColor ch) | p<-dcPixels ch]) 0
             | ch<-chains, let origin=Coord (minimum (map cx (dcPixels ch))) (minimum (map cy (dcPixels ch)))]
      kept=[o | o<-objs, not (S.member (O.objectId o) consumed)]
  in (sortOn O.objectId (kept++merged),chains,rejs)
