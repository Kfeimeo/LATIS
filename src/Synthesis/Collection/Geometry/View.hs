-- LATIS Stage E0: the raw grid keeps the truth; a background is only an
-- explicit, input-side, repeatable interpretation.
--
--   RawGridView   every pixel and colour of the input is accessible; colour 0
--                 has no special meaning at this layer.
--   BackgroundHypothesis
--     Color0                   the legacy convention (background = colour 0)
--     UniformBorderColor       all border cells share one colour -> that colour;
--                              several border colours -> not applicable
--     UniqueMostFrequentColor  the strictly most frequent colour; a tie -> not
--                              applicable (never an implicit choice)
--     NoBackground             no colour is background; colour 0 is a colour
--   ViewId        LegacyView (= Latent.Encode.encode with background 0,
--                 4-connectivity; pixel-for-pixel and id-for-id identical to
--                 the Stage C/D encoding) or BackgroundView h.
--
-- A view yields Regions: 4-connected, single-colour components of the
-- non-background pixels (NoBackground: of every pixel). Each region carries
-- its exact PixelSet, the colours observed on the raw grid and its
-- provenance (view id, background evidence). The Residual of a region
-- selection is U minus the union of the selected regions; it is reported as
-- evidence of what was NOT selected and is never relabelled as background.
module Synthesis.Collection.Geometry.View
  ( BackgroundHypothesis(..), ViewId(..), viewText, viewIdJSON, allBackgroundViews
  , BackgroundDecision(..), resolveBackground
  , Region(..), ViewResult(..), viewRegions, regionToObject, viewScene, legacyScene
  , Residual(..), residualOf, residualJSON, viewResultJSON, regionJSON
  ) where

import Latent.Grid
import Latent.Encode (encode, defaultEncoder)
import qualified Latent.Object as O
import Synthesis.Collection.Geometry.Cover (PixelSet, pixelSetFromList, boundsOfPixels, BoundsE(..), rectJSON, Rect(..))
import Synthesis.Collection.Diagnostics (jstr, jobj, jarr, jbool, jmaybe)
import qualified Data.Map.Strict as M
import qualified Data.Set as S
import Data.List (sortOn, group, sort)

data BackgroundHypothesis = Color0 | UniformBorderColor | UniqueMostFrequentColor | NoBackground deriving (Eq,Ord,Show,Enum,Bounded)
-- LegacyView sorts first so that the legacy plan universe keeps its order.
data ViewId = LegacyView | BackgroundView BackgroundHypothesis deriving (Eq,Ord,Show)
viewText :: ViewId -> String
viewText LegacyView="LegacyView(Color0,4-connected encoder)"
viewText (BackgroundView h)="BackgroundView("++show h++")"
viewIdJSON :: ViewId -> String
viewIdJSON v=jobj [("view",jstr (viewText v)),("legacy",jbool (v==LegacyView))]
allBackgroundViews :: [ViewId]
allBackgroundViews=[BackgroundView h | h<-[UniformBorderColor,UniqueMostFrequentColor,NoBackground]]

-- Background decision of a hypothesis on a raw grid (input only).
data BackgroundDecision = BackgroundDecision { bdColor :: Maybe Int, bdEvidence :: String } deriving (Eq,Show)
resolveBackground :: BackgroundHypothesis -> Grid -> Either String BackgroundDecision
resolveBackground h g=case h of
  Color0->Right (BackgroundDecision (Just 0) "legacy convention: colour 0 is the background")
  NoBackground->Right (BackgroundDecision Nothing "no background: every colour, including 0, is foreground")
  UniformBorderColor->
    let Dimensions w hh=dimensions g
        border=[c | (Coord x y)<-coords (Dimensions w hh), x==0 || y==0 || x==w-1 || y==hh-1, Just c<-[cell g (Coord x y)]]
    in case sort (map head (group (sort border))) of
         [c]->Right (BackgroundDecision (Just c) ("all "++show (length border)++" border cells have colour "++show c))
         cs->Left ("UniformBorderColor not applicable: border colours "++show cs++" are not uniform")
  UniqueMostFrequentColor->
    let counts=sortOn (negate . snd) [(head grp,length grp) | grp<-group (sort (concat (rows g)))]
    in case counts of
         ((c,n):(_,m):_) | n>m->Right (BackgroundDecision (Just c) ("colour "++show c++" occurs "++show n++" times, the next colour "++show m++" times"))
         [(c,n)]->Right (BackgroundDecision (Just c) ("colour "++show c++" is the only colour ("++show n++" cells)"))
         ((_,n):_)->Left ("UniqueMostFrequentColor not applicable: tie at "++show n++" cells between "++show [c | (c,k)<-counts, k==n])
         []->Left "empty grid"

-- A region: exact PixelSet plus the colours observed on the raw grid.
data Region = Region { rgId :: Int, rgPixels :: PixelSet, rgColors :: M.Map Coord Int, rgView :: ViewId, rgNote :: String } deriving (Eq,Show)
data ViewResult = ViewResult { vrView :: ViewId, vrBackground :: Maybe Int, vrEvidence :: String, vrRegions :: [Region], vrCanvas :: Dimensions } deriving (Eq,Show)

-- Regions of a view: 4-connected same-colour components of the non-background
-- pixels, numbered in raster order of their first pixel (the encoder's order).
viewRegions :: ViewId -> Grid -> Either String ViewResult
viewRegions LegacyView g=
  let scene=encode defaultEncoder g
      regions=[Region (O.objectId o) (pixelSetFromList (map fst (O.absolutePixels o))) (M.fromList (O.absolutePixels o)) LegacyView "legacy encoder object" | o<-O.objects scene]
  in Right (ViewResult LegacyView (Just 0) "legacy convention: colour 0 is the background" regions (dimensions g))
viewRegions v@(BackgroundView h) g=do
  d<-resolveBackground h g
  let dims=dimensions g
      keep c=Just c/=bdColor d
      pixels=M.fromList [(p,c) | p<-coords dims, Just c<-[cell g p], keep c]
      comps=collect pixels
      regions=[Region i (pixelSetFromList (M.keys ps)) ps v ("component of colour "++show (head (M.elems ps))++" under "++viewText v) | (i,ps)<-zip [0..] comps]
  Right (ViewResult v (bdColor d) (bdEvidence d) regions dims)
  where
    collect remaining=case sortOn (\p->(cy p,cx p)) (M.keys remaining) of
      []->[]
      p:_->let c=remaining M.! p
               ps=flood remaining c S.empty [p]
           in M.restrictKeys remaining ps:collect (M.withoutKeys remaining ps)
    flood _ _ seen []=seen
    flood px c seen (p:queue)
      | S.member p seen || M.lookup p px/=Just c = flood px c seen queue
      | otherwise = flood px c (S.insert p seen) ([add p (Vec dx dy) | (dx,dy)<-[(1,0),(-1,0),(0,1),(0,-1)]]++queue)

-- The Object the existing selectors/renderers understand (geometry relative
-- to the region's top-left; the id is the region id of this view).
regionToObject :: Region -> O.Object
regionToObject r=case boundsOfPixels (rgPixels r) of
  EmptyBounds->O.Object (rgId r) (Coord 0 0) M.empty 0
  PixelBounds (Rect x0 y0 _ _)->O.Object (rgId r) (Coord x0 y0) (M.fromList [(Coord (cx p-x0) (cy p-y0),c) | (p,c)<-M.toList (rgColors r)]) 0
-- A Scene for a view: canvas, the view's background colour (0 when the view
-- has none; only used as the fill colour of an own canvas) and the objects.
viewScene :: ViewResult -> O.Scene
viewScene vr=O.Scene (vrCanvas vr) (maybe 0 id (vrBackground vr)) (map regionToObject (vrRegions vr))
legacyScene :: Grid -> O.Scene
legacyScene=encode defaultEncoder

-- Residual of a selection: U minus the union of the selected regions,
-- with what it contains (colours, cell count); explicitly NOT a background.
data Residual = Residual { resCells :: Int, resColors :: [(Int,Int)], resSelected :: [Int], resNote :: String } deriving (Eq,Show)
residualOf :: Grid -> [Region] -> Residual
residualOf g selected=
  let dims=dimensions g
      covered=S.unions (map rgPixels selected)
      rest=[c | p<-coords dims, not (S.member p covered), Just c<-[cell g p]]
  in Residual (length rest) [(head grp,length grp) | grp<-group (sort rest)] (map rgId selected)
       "Residual = U minus the selected regions; it may contain markers, separators and unselected objects and is never interpreted as background"
residualJSON :: Residual -> String
residualJSON r=jobj [("cells",show (resCells r)),("colours",jarr [jobj [("colour",show c),("cells",show n)] | (c,n)<-resColors r]),("selected_regions",show (resSelected r)),("note",jstr (resNote r))]
regionJSON :: Region -> String
regionJSON r=jobj [("id",show (rgId r)),("pixels",show (S.size (rgPixels r))),("colours",show (sort (map head (group (sort (M.elems (rgColors r)))))))
  ,("bounds",case boundsOfPixels (rgPixels r) of EmptyBounds->jstr "EmptyBounds"; PixelBounds b->rectJSON b),("view",jstr (viewText (rgView r))),("note",jstr (rgNote r))]
viewResultJSON :: ViewResult -> String
viewResultJSON vr=jobj [("view",jstr (viewText (vrView vr))),("background",jmaybe show (vrBackground vr)),("evidence",jstr (vrEvidence vr)),("regions",show (length (vrRegions vr)))
  ,("region_list",jarr (map regionJSON (vrRegions vr))),("input_only",jbool True)]
