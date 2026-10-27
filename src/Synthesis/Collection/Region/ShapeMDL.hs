-- LATIS Stage E2-A: executable Shape algebra with an MDL cost.
--
--   ShapeExpr := Rect r | DisjointUnion a b | Difference a b
--
-- Semantics (exact pixel sets, local frame = the mask's own coordinates):
--   eval (Rect r)              = cells of r
--   eval (DisjointUnion a b)   = eval a `union` eval b   iff eval a `intersect` eval b == {}   (else invalid)
--   eval (Difference a b)      = eval a \ eval b          iff eval b `subsetOf` eval a         (restricted syntax; else invalid)
-- An invalid expression is a Left, never silently a plain union or a clipped
-- difference. Every evaluation can be recorded as a ShapeWitness (per node:
-- kind, input masks, output mask) and replayed independently.
--
-- MDL cost (frozen before the experiments; never tuned per task):
--   Rect        = 1 + 4 * 1          one node, four coordinate parameters
--   DisjointUnion = 1 + cost a + cost b
--   Difference    = 2 + cost a + cost b   (a difference is a stronger claim than a union)
--
-- C_ast(S) = min { cost e | eval e == S } is DIFFERENT from C_rect(S) (E1's
-- minimal rectangle cover, overlapping rectangles allowed). Both are kept.
-- The optimiser is exhaustive only inside a declared finite universe
-- (expressions over at most `smMaxRects` sub-rectangles of the bounding box
-- with the two operators); its result is ProvenOptimal-in-universe. Outside
-- the universe (large masks, budget) the row-run disjoint partition gives a
-- legal BoundedBest with an upper bound that is never called optimal.
module Synthesis.Collection.Region.ShapeMDL
  ( ShapeExpr(..), evalShape, shapeCost, shapeText, shapeJSON, shapeDepth, shapeRects
  , ShapeWitness(..), shapeWitness, verifyShapeWitness, shapeWitnessJSON
  , MDLBudget(..), defaultMDLBudget, MDLResult(..), mdlStatusText, bestShape, mdlJSON
  , rowRunPartition, bruteForceBestCost
  ) where

import Latent.Grid (Coord(..))
import Synthesis.Collection.Geometry.Cover (PixelSet, Rect(..), rectCells, rectJSON, boundsOfPixels, BoundsE(..), pixelSetToList)
import Synthesis.Collection.Diagnostics (jstr, jobj, jarr, jbool, jmaybe, stableHash)
import qualified Data.Set as S
import Data.List (sortOn, nub, minimumBy)
import Data.Ord (comparing)

data ShapeExpr = SRect Rect | SUnion ShapeExpr ShapeExpr | SDiff ShapeExpr ShapeExpr deriving (Eq,Ord,Show)

evalShape :: ShapeExpr -> Either String PixelSet
evalShape (SRect r)
  | rx1 r<rx0 r || ry1 r<ry0 r = Left ("invalid rectangle "++show r)
  | otherwise = Right (S.fromList (rectCells r))
evalShape (SUnion a b)=do
  x<-evalShape a; y<-evalShape b
  if S.null (S.intersection x y) then Right (S.union x y)
    else Left ("DisjointUnion: operands overlap on "++show (S.size (S.intersection x y))++" cells (invalid program, not a plain union)")
evalShape (SDiff a b)=do
  x<-evalShape a; y<-evalShape b
  if S.null y then Left "Difference: empty subtrahend (degenerate)"
    else if not (y `S.isSubsetOf` x) then Left ("Difference: subtrahend is not inside the minuend ("++show (S.size (S.difference y x))++" cells outside); restricted syntax B <= A")
    else if S.null (S.difference x y) then Left "Difference: empty result"
    else Right (S.difference x y)

shapeCost :: ShapeExpr -> Int
shapeCost (SRect _)=5
shapeCost (SUnion a b)=1+shapeCost a+shapeCost b
shapeCost (SDiff a b)=2+shapeCost a+shapeCost b
shapeDepth :: ShapeExpr -> Int
shapeDepth (SRect _)=0
shapeDepth (SUnion a b)=1+max (shapeDepth a) (shapeDepth b)
shapeDepth (SDiff a b)=1+max (shapeDepth a) (shapeDepth b)
shapeRects :: ShapeExpr -> [Rect]
shapeRects (SRect r)=[r]
shapeRects (SUnion a b)=shapeRects a++shapeRects b
shapeRects (SDiff a b)=shapeRects a++shapeRects b
shapeText :: ShapeExpr -> String
shapeText (SRect r)="Rect("++show (rx0 r)++","++show (ry0 r)++","++show (rx1 r)++","++show (ry1 r)++")"
shapeText (SUnion a b)="("++shapeText a++" (+) "++shapeText b++")"
shapeText (SDiff a b)="("++shapeText a++" \\ "++shapeText b++")"
shapeJSON :: ShapeExpr -> String
shapeJSON (SRect r)=jobj [("kind",jstr "Rect"),("rect",rectJSON r)]
shapeJSON (SUnion a b)=jobj [("kind",jstr "DisjointUnion"),("left",shapeJSON a),("right",shapeJSON b)]
shapeJSON (SDiff a b)=jobj [("kind",jstr "Difference"),("left",shapeJSON a),("right",shapeJSON b)]

-- Per-node evaluation trace; the verifier recomputes every node.
data ShapeWitness = ShapeWitness { swExpr :: ShapeExpr, swNodes :: [(String,[Int],Int,String)]  -- (kind, input sizes, output size, output hash)
                                 , swMask :: PixelSet, swCost :: Int } deriving (Eq,Show)
shapeWitness :: ShapeExpr -> Either String ShapeWitness
shapeWitness e=do
  m<-evalShape e
  Right (ShapeWitness e (nodes e) m (shapeCost e))
  where
    nodes x=case x of
      SRect _->[("Rect",[],sz x,hashOf x)]
      SUnion a b->nodes a++nodes b++[("DisjointUnion",[sz a,sz b],sz x,hashOf x)]
      SDiff a b->nodes a++nodes b++[("Difference",[sz a,sz b],sz x,hashOf x)]
    sz x=either (const (-1)) S.size (evalShape x)
    hashOf x=either (const "invalid") (stableHash . show . pixelSetToList) (evalShape x)
verifyShapeWitness :: ShapeWitness -> Either String ()
verifyShapeWitness w=do
  fresh<-shapeWitness (swExpr w)
  if swMask fresh/=swMask w then Left "mask differs from re-evaluation" else Right ()
  if swNodes fresh/=swNodes w then Left "node trace differs from re-evaluation" else Right ()
  if swCost fresh/=swCost w then Left "cost differs" else Right ()
shapeWitnessJSON :: ShapeWitness -> String
shapeWitnessJSON w=jobj [("expr",shapeJSON (swExpr w)),("text",jstr (shapeText (swExpr w))),("cost",show (swCost w)),("mask_size",show (S.size (swMask w)))
  ,("nodes",jarr [jobj [("kind",jstr k),("inputs",show i),("output",show o),("hash",jstr h)] | (k,i,o,h)<-swNodes w])
  ,("independent_replay",jstr (either id (const "passed") (verifyShapeWitness w)))]

-- Deterministic legal explanation: maximal horizontal runs merged downward
-- into disjoint rectangles (a disjoint partition, so DisjointUnion is valid).
rowRunPartition :: PixelSet -> [Rect]
rowRunPartition s0=go s0
  where
    go s | S.null s = []
         | otherwise =
             let Coord x0 y0=head (sortOn (\(Coord x y)->(y,x)) (S.toList s))
                 x1=last (takeWhile (\x->S.member (Coord x y0) s) [x0..x0+60])
                 ok y=all (\x->S.member (Coord x y) s) [x0..x1]
                 y1=last (takeWhile ok [y0..y0+60])
                 r=Rect x0 y0 x1 y1
             in r:go (S.difference s (S.fromList (rectCells r)))
foldUnion :: [Rect] -> ShapeExpr
foldUnion [r]=SRect r
foldUnion (r:rs)=SUnion (SRect r) (foldUnion rs)
foldUnion []=error "empty partition"

data MDLBudget = MDLBudget { smMaxRects :: Int, smMaxArea :: Int, smMaxExprs :: Int } deriving (Eq,Show)
defaultMDLBudget :: MDLBudget
defaultMDLBudget=MDLBudget 3 64 200000

-- ProvenOptimal: exhaustive over the finite universe (expressions over <= smMaxRects
-- sub-rectangles of the bounding box, operators (+) and \ with the restricted
-- syntax) and the row-run partition; the universe is part of the result.
-- BoundedBest: only legal explanations were tried (budget).
data MDLResult = MDLResult { mrBest :: ShapeExpr, mrCost :: Int, mrStatus :: String, mrUniverse :: String, mrAlternatives :: [ShapeExpr], mrExprsTried :: Int, mrRectCost :: Int } deriving (Eq,Show)
mdlStatusText :: MDLResult -> String
mdlStatusText=mrStatus

bestShape :: MDLBudget -> Int -> PixelSet -> Either String MDLResult
bestShape b crect s
  | S.null s = Left "empty mask has no shape expression"
  | otherwise =
      let part=rowRunPartition s
          base=foldUnion part
          area=case boundsOfPixels s of EmptyBounds->0; PixelBounds r->(rx1 r-rx0 r+1)*(ry1 r-ry0 r+1)
      in if area>smMaxArea b then Right (MDLResult base (shapeCost base) "BoundedBest" ("row-run partition only; bbox area "++show area++" > "++show (smMaxArea b)) [] 1 crect)
         else
           -- Level n = expressions over exactly n rectangles. Costs are
           -- monotone in n (level 1 = 5, level 2 >= 11, level 3 >= 17), so the
           -- first level with a fit, enumerated exhaustively, is optimal in the
           -- universe; the search stops there. A level cut by the expression
           -- budget before any fit makes the result BoundedBest.
           let go n tried
                 | n>smMaxRects b = (Nothing,tried,False)
                 | otherwise =
                     let (cands,cnt,cut)=level b s n (smMaxExprs b-tried)
                         fits=[e | e<-cands, evalShape e==Right s]
                     in if not (null fits) && not cut then (Just fits,tried+cnt,False)
                        else if cut then (if null fits then Nothing else Just fits,tried+cnt,True)
                        else go (n+1) (tried+cnt)
               (found,tried,cut)=go 1 0
               allFits=base:maybe [] id found
               best=minimumBy (comparing (\e->(shapeCost e,shapeText e))) allFits
               alts=take 4 [e | e<-sortOn shapeText (nub allFits), e/=best, shapeCost e==shapeCost best]
               proven=not cut && (found/=Nothing || smMaxRects b>=3)
           in Right (MDLResult best (shapeCost best) (if proven then "ProvenOptimalInUniverse" else "BoundedBest")
                 ("expressions over <= "++show (smMaxRects b)++" sub-rectangles of the bbox with (+) and restricted \\, plus the row-run partition; levels enumerated by rectangle count, costs monotone in the count"++(if cut then "; expression budget cut" else ""))
                 alts tried crect)

-- Level n of the finite universe (expressions over exactly n sub-rectangles
-- of the bounding box), cut at `limit` expressions.
level :: MDLBudget -> PixelSet -> Int -> Int -> ([ShapeExpr],Int,Bool)
level _ s n limit=
  let PixelBounds bb=boundsOfPixels s
      rects=[Rect x0 y0 x1 y1 | x0<-[rx0 bb..rx1 bb], y0<-[ry0 bb..ry1 bb], x1<-[x0..rx1 bb], y1<-[y0..ry1 bb]]
      inside r=all (`S.member` s) (rectCells r)
      -- a rectangle in positive position must lie inside S (otherwise the union leaves S); minuends may exceed S
      exprs=case n of
        1->[SRect r | r<-rects, inside r]
        2->[SUnion (SRect a) (SRect c) | a<-rects, inside a, c<-rects, c>a, inside c]++[SDiff (SRect a) (SRect c) | a<-rects, c<-rects, c/=a]
        3->[op (SUnion (SRect a) (SRect c)) (SRect d) | a<-rects, inside a, c<-rects, c>a, inside c, d<-rects, d/=a, d/=c, op<-[SUnion,SDiff]]
           ++[op (SDiff (SRect a) (SRect c)) (SRect d) | a<-rects, c<-rects, c/=a, d<-rects, d/=a, d/=c, op<-[SUnion,SDiff]]
        _->[]
      kept=take limit exprs
  in (kept,length kept,length (take (limit+1) exprs)>limit)

-- Independent brute force for tests (same universe definition, no pruning,
-- evaluates every expression): returns the minimum cost of a fitting
-- expression or Nothing.
bruteForceBestCost :: Int -> PixelSet -> Maybe Int
bruteForceBestCost maxRects s=
  let PixelBounds bb=boundsOfPixels s
      rects=[Rect x0 y0 x1 y1 | x0<-[rx0 bb..rx1 bb], y0<-[ry0 bb..ry1 bb], x1<-[x0..rx1 bb], y1<-[y0..ry1 bb]]
      exprs 1=[SRect r | r<-rects]
      exprs n=[op a (SRect r) | k<-[1..n-1], a<-exprs k, r<-rects, op<-[SUnion,SDiff]]++[op (SRect r) a | k<-[1..n-1], a<-exprs k, r<-rects, op<-[SUnion,SDiff], k>=2]
      fits=[shapeCost e | n<-[1..maxRects], e<-exprs n, evalShape e==Right s]
  in if null fits then Nothing else Just (minimum fits)

mdlJSON :: MDLResult -> String
mdlJSON r=jobj [("best",shapeJSON (mrBest r)),("text",jstr (shapeText (mrBest r))),("c_ast",show (mrCost r)),("status",jstr (mrStatus r)),("universe",jstr (mrUniverse r))
  ,("c_rect",show (mrRectCost r)),("c_rect_note",jstr "E1 minimal rectangle cover count (overlaps allowed); not the same measure as c_ast")
  ,("alternatives_same_cost",jarr (map (jstr . shapeText) (mrAlternatives r))),("expressions_tried",show (mrExprsTried r)),("depth",show (shapeDepth (mrBest r)))]
  where _=jbool; _=jmaybe
