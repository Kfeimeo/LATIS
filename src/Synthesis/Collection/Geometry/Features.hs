-- LATIS Stage E1: typed geometric features, coordinate frames and the
-- geometry / provenance / relation / cross-case witnesses.
--
-- Coordinate frames are distinct types: AbsRect lives in canvas coordinates,
-- RelRect is relative to an explicit anchor (parent region top-left), NormRect
-- is the translation-invariant form (own minimum at 0). They are converted
-- only through the named functions; no bound of one frame is compared with a
-- bound of another without conversion.
--
-- ShapeGeometry is computed from the exact PixelSet: bounds (inclusive),
-- width/height (+1), area (pixel count, never the bbox area), the rectangle
-- cover with its status. The bounds are never a substitute for the pixel set
-- (holes, gaps and several colours keep their difference).
module Synthesis.Collection.Geometry.Features
  ( AbsRect(..), RelRect(..), NormRect(..), toRelative, normalizeRect, absBounds, Corners(..), corners
  , ShapeGeometry(..), shapeGeometry, geometryJSON, rectCountStatus
  , GeometryWitness(..), geometryWitness, verifyGeometryWitness, geometryWitnessJSON
  , RegionProvenance(..), provenanceJSON
  , GeoRelation(..), relationText, relate, verifyRelation, relationJSON
  , CaseBinding(..), CrossCaseWitness(..), crossCaseWitness, crossCaseJSON
  ) where

import Latent.Grid
import Synthesis.Collection.Geometry.Cover
import Synthesis.Collection.Geometry.View (ViewId, viewText)
import Synthesis.Collection.Diagnostics (jstr, jobj, jarr, jbool, jmaybe, stableHash)
import qualified Data.Set as S
import Data.List (nub, sort)

newtype AbsRect = AbsRect Rect deriving (Eq,Ord,Show)
newtype RelRect = RelRect Rect deriving (Eq,Ord,Show)
newtype NormRect = NormRect Rect deriving (Eq,Ord,Show)
-- Relative to an anchor (e.g. the parent region's top-left); negative
-- relative coordinates are legal (the anchor need not enclose the rectangle).
toRelative :: Coord -> AbsRect -> RelRect
toRelative (Coord ax ay) (AbsRect r)=RelRect (Rect (rx0 r-ax) (ry0 r-ay) (rx1 r-ax) (ry1 r-ay))
normalizeRect :: AbsRect -> NormRect
normalizeRect (AbsRect r)=NormRect (Rect 0 0 (rx1 r-rx0 r) (ry1 r-ry0 r))
absBounds :: PixelSet -> Either String AbsRect
absBounds s=case boundsOfPixels s of EmptyBounds->Left "EmptyBounds: the pixel set is empty"; PixelBounds r->Right (AbsRect r)
-- Corners are DERIVED from the four extremes (not free parameters).
data Corners = Corners { cTL, cTR, cBL, cBR :: Coord } deriving (Eq,Show)
corners :: Rect -> Corners
corners r=Corners (Coord (rx0 r) (ry0 r)) (Coord (rx1 r) (ry0 r)) (Coord (rx0 r) (ry1 r)) (Coord (rx1 r) (ry1 r))

data ShapeGeometry = ShapeGeometry
  { sgPixels :: PixelSet, sgBounds :: BoundsE, sgWidth, sgHeight, sgArea :: Int, sgCover :: CoverResult, sgBudget :: CoverBudget } deriving (Eq,Show)
shapeGeometry :: CoverBudget -> PixelSet -> ShapeGeometry
shapeGeometry budget s=
  let b=boundsOfPixels s
      (w,h)=case b of EmptyBounds->(0,0); PixelBounds r->(rectWidth r,rectHeight r)
  in ShapeGeometry s b w h (S.size s) (minimalCover budget s) budget
-- Rectangle count status: Left when the count is not proven (bounded).
rectCountStatus :: ShapeGeometry -> Either String Int
rectCountStatus g=case sgCover g of
  EmptyCover->Right 0
  r@ProvenMinimal{}->Right (length (crCanonical r))
  r@ValidBounded{}->Left ("rectangle count not proven: between "++show (crLower r)++" and "++show (crUpper r)++" ("++crTruncation r++")")
geometryJSON :: ShapeGeometry -> String
geometryJSON g=jobj [("area",show (sgArea g)),("bounds",case sgBounds g of EmptyBounds->jstr "EmptyBounds"; PixelBounds r->rectJSON r),("width",show (sgWidth g)),("height",show (sgHeight g))
  ,("bounds_note",jstr "bounds are the inclusive extremes of the pixel set, not the pixel set itself"),("cover",coverJSON (sgCover g))
  ,("rect_count",either (const "null") show (rectCountStatus g)),("rect_count_proven",jbool (coverProven (sgCover g)))
  ,("budget",jobj [("max_nodes",show (cbMaxNodes (sgBudget g))),("max_area",show (cbMaxArea (sgBudget g))),("max_alternatives",show (cbMaxAlternatives (sgBudget g)))])]

-- Geometry witness bound to (task, case, view, raw pixel set, frame); the
-- verifier recomputes everything from the pixel set with the same budget.
data GeometryWitness = GeometryWitness
  { gwTask :: String, gwCase :: Int, gwView :: ViewId, gwFrame :: String, gwPixels :: PixelSet, gwBounds :: BoundsE
  , gwRects :: [Rect], gwStatus :: String, gwLower, gwUpper :: Int, gwAlternatives :: Int, gwBudget :: CoverBudget, gwHash :: String } deriving (Eq,Show)
geometryWitness :: String -> Int -> ViewId -> CoverBudget -> PixelSet -> GeometryWitness
geometryWitness task k view budget s=
  let g=shapeGeometry budget s
      (st,lo,hi,alts)=case sgCover g of
        EmptyCover->("empty",0,0,0)
        r@ProvenMinimal{}->("proven_minimal",length (crCanonical r),length (crCanonical r),length (crAlternatives r))
        r@ValidBounded{}->("bounded",crLower r,crUpper r,0)
  in GeometryWitness task k view "absolute canvas coordinates (inclusive)" s (sgBounds g) (coverRectangles (sgCover g)) st lo hi alts budget (stableHash (show (S.toList s)))
-- Independent replay: pixel hash, bounds, rectangle containment, exact union,
-- status/bounds recomputed with the recorded budget. Every mismatch is named.
verifyGeometryWitness :: GeometryWitness -> Either String ()
verifyGeometryWitness w=do
  if stableHash (show (S.toList (gwPixels w)))/=gwHash w then Left "pixel hash differs from the pixel set" else Right ()
  if boundsOfPixels (gwPixels w)/=gwBounds w then Left ("bounds differ from the pixel set: recorded "++show (gwBounds w)++", recomputed "++show (boundsOfPixels (gwPixels w))) else Right ()
  if gwFrame w/="absolute canvas coordinates (inclusive)" then Left ("unexpected coordinate frame "++gwFrame w) else Right ()
  verifyCover (gwPixels w) (gwRects w)
  let g=shapeGeometry (gwBudget w) (gwPixels w)
  case (sgCover g,gwStatus w) of
    (EmptyCover,"empty")->Right ()
    (r@ProvenMinimal{},"proven_minimal")->
      if length (gwRects w)/=length (crCanonical r) then Left ("recorded rectangle count "++show (length (gwRects w))++" is not the proven minimum "++show (length (crCanonical r)))
      else if sort (gwRects w)/=sort (crCanonical r) && sort (gwRects w) `notElem` map sort (crAlternatives r) then Left "recorded cover is not among the optimal covers found by the replay"
      else if (gwLower w,gwUpper w)/=(length (crCanonical r),length (crCanonical r)) then Left "bounds of a proven witness must equal the minimum" else Right ()
    (r@ValidBounded{},"bounded")->if gwLower w/=crLower r || gwUpper w<gwLower w then Left "bounded witness bounds differ from the replay" else Right ()
    (_,st)->Left ("status "++st++" is not what the replay derives ("++coverStatusText (sgCover g)++")")
geometryWitnessJSON :: GeometryWitness -> String
geometryWitnessJSON w=jobj [("task",jstr (gwTask w)),("case_index",show (gwCase w)),("view",jstr (viewText (gwView w))),("coordinate_frame",jstr (gwFrame w))
  ,("pixel_count",show (S.size (gwPixels w))),("pixel_hash",jstr (gwHash w)),("bounds",case gwBounds w of EmptyBounds->jstr "EmptyBounds"; PixelBounds r->rectJSON r)
  ,("rectangles",jarr (map rectJSON (gwRects w))),("status",jstr (gwStatus w)),("lower_bound",show (gwLower w)),("upper_bound",show (gwUpper w)),("alternative_optimal_covers",show (gwAlternatives w))
  ,("union_equals_pixels",jbool (coverUnion (gwRects w)==gwPixels w)),("every_rectangle_inside",jbool (all (rectInside (gwPixels w)) (gwRects w)))
  ,("independent_replay",jstr (either id (const "passed") (verifyGeometryWitness w)))]

-- Where a candidate region came from: raw grid, view, background decision,
-- how the bounds were obtained, which colours come from the raw window.
data RegionProvenance = RegionProvenance
  { rpGridHash :: String, rpView :: ViewId, rpBackground :: Maybe Int, rpBackgroundEvidence :: String
  , rpRegionIds :: [Int], rpBoundsFrom :: String, rpColorsFrom :: String, rpResidualCells :: Int } deriving (Eq,Show)
provenanceJSON :: RegionProvenance -> String
provenanceJSON p=jobj [("raw_grid_hash",jstr (rpGridHash p)),("view",jstr (viewText (rpView p))),("background",jmaybe show (rpBackground p)),("background_evidence",jstr (rpBackgroundEvidence p))
  ,("region_ids",show (rpRegionIds p)),("bounds_from",jstr (rpBoundsFrom p)),("colours_from",jstr (rpColorsFrom p)),("residual_cells",show (rpResidualCells p))
  ,("residual_note",jstr "the residual is what was not selected; it is not interpreted as background")]

-- Minimal relation prototype between two pixel sets (and, for CropSource,
-- between a program's output window and the input). Independently verifiable.
data GeoRelation = SameMask | SameUpToTranslation Int Int | BoundingContainment | Disjoint | Overlap Int | CropSource Rect deriving (Eq,Show)
relationText :: GeoRelation -> String
relationText r=case r of
  SameMask->"SameMask"; SameUpToTranslation dx dy->"SameUpToTranslation("++show dx++","++show dy++")"; BoundingContainment->"BoundingContainment"
  Disjoint->"Disjoint"; Overlap n->"Overlap("++show n++" cells)"; CropSource w->"CropSource(window "++show (rectKey w)++")"
-- Every relation that holds between a and b (several may hold; none is picked).
relate :: PixelSet -> PixelSet -> [GeoRelation]
relate a b=
  [SameMask | a==b]
  ++[SameUpToTranslation dx dy | a/=b, not (S.null a), not (S.null b), Just (dx,dy)<-[shift], pixelSetTranslate dx dy a==b]
  ++[BoundingContainment | Just ra<-[boundsRect (boundsOfPixels a)], Just rb<-[boundsRect (boundsOfPixels b)], rx0 rb<=rx0 ra, ry0 rb<=ry0 ra, rx1 rb>=rx1 ra, ry1 rb>=ry1 ra]
  ++(let n=S.size (S.intersection a b) in if n==0 then [Disjoint] else [Overlap n])
  where shift=case (S.lookupMin a,S.lookupMin b) of
          (Just (Coord ax ay),Just (Coord bx by))->Just (bx-ax,by-ay)
          _->Nothing
verifyRelation :: PixelSet -> PixelSet -> GeoRelation -> Either String ()
verifyRelation a b r=case r of
  SameMask->if a==b then Right () else Left "SameMask: pixel sets differ"
  SameUpToTranslation dx dy->if pixelSetTranslate dx dy a==b then Right () else Left "SameUpToTranslation: translated set differs"
  BoundingContainment->if BoundingContainment `elem` relate a b then Right () else Left "BoundingContainment: bounds not nested"
  Disjoint->if S.null (S.intersection a b) then Right () else Left "Disjoint: sets intersect"
  Overlap n->if S.size (S.intersection a b)==n && n>0 then Right () else Left "Overlap: intersection size differs"
  CropSource w->if S.fromList (rectCells w)==b then Right () else Left "CropSource: the window cells are not the output pixel set"
relationJSON :: GeoRelation -> String
relationJSON r=jobj [("relation",jstr (relationText r))]

-- Cross-case witness of ONE input-side program: per case the observable
-- bindings (view, background, selected region ids, bounds, dims, rect count
-- status) and, separately, the training-target evidence (exact or not).
-- Agreement across cases is ObservedCaseAgreement only (training
-- co-denotation), never a proof of global equality.
data CaseBinding = CaseBinding
  { cbCase :: Int, cbView :: ViewId, cbBackground :: Maybe Int, cbSelected :: [Int], cbBounds :: BoundsE, cbDims :: Dimensions
  , cbRectCount :: Either String Int, cbTargetExact :: Maybe Bool } deriving (Eq,Show)
data CrossCaseWitness = CrossCaseWitness
  { ccwProgram :: String, ccwBindings :: [CaseBinding], ccwAgreement :: [(String,String)]   -- (field, ObservedCaseAgreement | Varies | Pending)
  , ccwTargetUse :: String } deriving (Eq,Show)
crossCaseWitness :: String -> [CaseBinding] -> CrossCaseWitness
crossCaseWitness prog bs=CrossCaseWitness prog bs
  [("view",agree (map (viewText . cbView) bs)),("background",agree (map (show . cbBackground) bs)),("selected_cardinality",agree (map (show . length . cbSelected) bs))
  ,("dims",agree (map (show . cbDims) bs)),("rect_count",if any (either (const True) (const False) . cbRectCount) bs then "Pending" else agree (map (show . cbRectCount) bs))]
  "training targets are read only for the per-case exact flag; no binding is derived from a target"
  where agree xs=case nub xs of [_]->"ObservedCaseAgreement"; []->"Pending"; _->"Varies"
crossCaseJSON :: CrossCaseWitness -> String
crossCaseJSON w=jobj [("program",jstr (ccwProgram w)),("target_use",jstr (ccwTargetUse w))
  ,("bindings",jarr [jobj [("case_index",show (cbCase b)),("view",jstr (viewText (cbView b))),("background",jmaybe show (cbBackground b)),("selected_region_ids",show (cbSelected b))
      ,("bounds",case cbBounds b of EmptyBounds->jstr "EmptyBounds"; PixelBounds r->rectJSON r),("dims",let Dimensions x y=cbDims b in jarr [show x,show y])
      ,("rect_count",either (const "null") show (cbRectCount b)),("rect_count_status",jstr (either id (const "proven") (cbRectCount b))),("target_exact",jmaybe jbool (cbTargetExact b))] | b<-ccwBindings w])
  ,("agreement",jobj [(k,jstr v) | (k,v)<-ccwAgreement w]),("note",jstr "ObservedCaseAgreement = equal on the training cases only; never global equality")]
