-- LATIS Content-first OutputSpec.
--
-- The legacy front end is Size-first: Input -> SizeRule -> ObjectTransform,
-- and the Size2 rule must fit before any object search is reachable. This
-- module adds the second, goal-coupled construction
--
--   Input -> [View] -> Selection -> Bounds/Content -> OutputDimensions -> Render
--
-- in which the output canvas is DERIVED from the content selected on the
-- input. The dependency is one-way and acyclic: the selection reads the input
-- scene only (encoded objects and their input-side predicates), the bounds of
-- the selected members fix the dimensions, and the content is produced from
-- the same selection; nothing downstream can feed back into the selection.
-- Training outputs are read only by the caller when it verifies a candidate.
--
-- Stage E0/E1: a plan names the View that produces its objects. LegacyView is
-- the Stage C/D encoder (background 0, 4-connected); BackgroundView h is an
-- explicit input-side background hypothesis (Geometry.View). Selection
-- predicates may use the proven minimal rectangle count of an object
-- (Relation.GeoRectCount, Geometry.Cover); an unproven count is an explicit
-- failure, never a guess.
--
-- Two constructions, deliberately distinct:
--
--   CropInputWindow            the inclusive bounding box of the selected
--                              members is a WINDOW on the raw input grid;
--                              every pixel inside (other colours, background
--                              cells) is copied. The selection only decides
--                              where the window is.
--   EmitSelectedWithOwnCanvas  the selected members themselves, translated to
--                              the local origin, on a canvas of the bounds'
--                              size filled with the view's background colour
--                              (not applicable under NoBackground).
--
-- They coincide only when the window holds nothing but the selected members.
--
-- Selections never pick an element implicitly: SelectUnique fails on zero or
-- several matches, SelectNonEmpty fails on zero matches and otherwise takes
-- the bounding box of the union. Every failure is an explicit Left with the
-- matched cardinality in its text; every success carries a SelectionWitness.
module Synthesis.Collection.ContentFirst
  ( ContentFirst(..), contentFirstOff, contentFirstOn
  , SelectionMode(..), SelectionPlan(..), ContentConstruction(..), ContentFirstPlan(..)
  , selectionText, constructionText, planText, planCost, planJSON, enumeratePlans, planUsesGeometry
  , Bounds(..), boundsDims, boundsOf
  , SelectionWitness(..), OutputContent(..), OutputSpecWitness(..), OutputSpec(..), DeriveOptions(..), deriveQuiet, deriveWithGeometry
  , selectWith, deriveOutputSpec, specEmitted, renderOutputSpec, cropWindow, specWitnessJSON, specJSON, sceneForView
  , CFCase(..), CFCaseTrace(..), CFCandidate(..), CFResult(..), searchContentFirst
  , CFTrigger(..), triggerText, SizeFirstStatus(..), sizeFirstStatusText, classifyResult, cfMetricNames
  , CFRun(..)
  ) where

import Latent.Grid
import qualified Latent.Object as O
import Synthesis.Collection.Relation (Pred(..), Selector(..), selectObjects, EmittedObject(..), predText, CaseTrace(..), caseTraceJSON, gridDiffCount)
import Synthesis.Collection.Size (natPosRange)
import Synthesis.Collection.Geometry.View
import Synthesis.Collection.Geometry.Cover (pixelSetFromList, defaultCoverBudget)
import Synthesis.Collection.Geometry.Features (GeometryWitness(..), geometryWitness, geometryWitnessJSON, RegionProvenance(..), provenanceJSON)
import Synthesis.Collection.Diagnostics (jstr, jobj, jarr, jbool, jmaybe, stableHash, traceAt, traceCand, levelBranches, levelCandidates, levelFull)
import qualified Data.Map.Strict as M
import qualified Data.Set as S
import Data.List (sortOn, nub, sort)
import Debug.Trace (traceEvent)

-- Configuration block carried by the front-end Config. Everything off
-- reproduces the Size-first behaviour exactly (no plan is enumerated).
data ContentFirst = ContentFirst
  { cfEnabled :: Bool                 -- open the content-first path at all
  , cfOnSizeFailure :: Bool           -- trigger: the legacy Size2 rule found no training-exact expression
  , cfOnDownstreamFailure :: Bool     -- trigger: the Size2 rule fit but every legacy object path failed
  , cfExploreAlternatives :: Bool     -- after a legacy first solution, still enumerate content-first representatives (recorded, never selected)
  , cfPlanBudget :: Int               -- plans visited (cost-sorted prefix of the finite plan universe)
  , cfExecutionBudget :: Int          -- per-case derive+render executions over the whole content-first search
  , cfMaxFits :: Int                  -- training-exact representatives kept
  , cfViews :: Bool                   -- E0: plans over the explicit background views (after the legacy-view plans)
  , cfGeometry :: Bool                -- E1: GeoRectCount selection predicates and geometry witnesses
  } deriving (Eq,Show)
contentFirstOff :: ContentFirst
contentFirstOff=ContentFirst False False False False 0 0 0 False False
contentFirstOn :: ContentFirst
contentFirstOn=ContentFirst True True True False 400 4000 16 False False

data SelectionMode = SelectUnique | SelectNonEmpty deriving (Eq,Ord,Show,Enum,Bounded)
data SelectionPlan = SelectionPlan { spMode :: SelectionMode, spSelector :: Selector } deriving (Eq,Ord,Show)
data ContentConstruction = CropInputWindow | EmitSelectedWithOwnCanvas deriving (Eq,Ord,Show,Enum,Bounded)
data ContentFirstPlan = ContentFirstPlan { cfpSelection :: SelectionPlan, cfpConstruction :: ContentConstruction, cfpView :: ViewId } deriving (Eq,Ord,Show)

selectorText :: Selector -> String
selectorText AllObjects="Objects(Input)"
selectorText (FilterBy p)="Select("++predText p++", Objects(Input))"
selectionText :: SelectionPlan -> String
selectionText (SelectionPlan SelectUnique s)="Unique("++selectorText s++")"
selectionText (SelectionPlan SelectNonEmpty s)="NonEmptySet("++selectorText s++")"
constructionText :: ContentConstruction -> String
constructionText CropInputWindow="CropInputWindow"
constructionText EmitSelectedWithOwnCanvas="EmitSelectedWithOwnCanvas"
-- The dependency chain in words: Dimensions come from the bounds of the
-- selection; the content construction names what is drawn in them.
planText :: ContentFirstPlan -> String
planText (ContentFirstPlan sel c v)="OutputSpec(Dimensions <- Bounds("++selectionText sel++"); "++constructionText c++")"++(if v==LegacyView then "" else " @ "++viewText v)
-- Structural cost (same prior as the relation grammar: nodes plus 4 per
-- shared constant). Unique is the cheaper selection mode; both constructions
-- cost the same, ties are broken by the derived order (CropInputWindow
-- first); a non-legacy view costs one more than the legacy view.
planCost :: ContentFirstPlan -> Int
planCost (ContentFirstPlan (SelectionPlan m s) _ v)=selC+modeC+2+(if v==LegacyView then 0 else 1)
  where selC=case s of AllObjects->0; FilterBy p->1+depth p+4*constants p
        depth (NotP q)=1+depth q
        depth _=0
        constants (ColorIs _)=1
        constants (GeoRectCount _)=1
        constants (NotP q)=constants q
        constants _=0
        modeC=case m of SelectUnique->0; SelectNonEmpty->1
planUsesGeometry :: ContentFirstPlan -> Bool
planUsesGeometry (ContentFirstPlan (SelectionPlan _ s) _ _)=case s of FilterBy p->geo p; AllObjects->False
  where geo (GeoRectCount _)=True
        geo (NotP q)=geo q
        geo _=False
planJSON :: ContentFirstPlan -> String
planJSON p@(ContentFirstPlan (SelectionPlan m s) c v)=jobj
  [("kind",jstr "ContentFirst"),("selection",jobj [("mode",jstr (show m)),("selector",selJ s)]),("construction",jstr (show c)),("view",viewIdJSON v)
  ,("cost",show (planCost p)),("text",jstr (planText p)),("plan_id",jstr (stableHash (show p)))]
  where selJ AllObjects=jobj [("kind",jstr "AllObjects")]
        selJ (FilterBy q)=jobj [("kind",jstr "FilterBy"),("pred",predJ q)]
        predJ (ColorIs k)=jobj [("kind",jstr "ColorIs"),("color",show k)]
        predJ (GeoRectCount k)=jobj [("kind",jstr "GeoRectCount"),("k",show k)]
        predJ (NotP q)=jobj [("kind",jstr "NotP"),("pred",predJ q)]
        predJ q=jobj [("kind",jstr (show q))]

-- The finite plan universe: the relation grammar's input-side predicates
-- (colour constants come from the INPUT scenes of the training cases only),
-- optionally the geometry predicates, both selection modes, both
-- constructions, the legacy view and optionally the background views; sorted
-- by (cost, structure). With both flags off this is exactly the Content-first
-- universe of the previous round (every plan on LegacyView).
enumeratePlans :: [Int] -> Bool -> Bool -> Bool -> Bool -> [ContentFirstPlan]
enumeratePlans colors shape diagonal views geometry=sortOn (\p->(planCost p,p)) (nub plans)
  where
    basePreds=[ColorIs c | c<-colors]++[IsMaxArea,IsMinArea,ColorMostFrequent,ColorLeastFrequent]
      ++[p | shape, p<-[IsRect,IsSquare,IsShell,IsTriangle]]++[IsDiagonal | shape, diagonal]
      ++[GeoRectCount k | geometry, k<-[1,2,3]]
    preds=basePreds++map NotP basePreds
    selectors=AllObjects:map FilterBy preds
    viewList=LegacyView:[v | views, v<-allBackgroundViews]
    plans=[ContentFirstPlan (SelectionPlan m s) c v | v<-viewList, s<-selectors, m<-[minBound..maxBound], c<-[minBound..maxBound]]

-- Inclusive pixel bounds; the dimensions are +1 on each axis.
data Bounds = Bounds { bMinX, bMinY, bMaxX, bMaxY :: Int } deriving (Eq,Ord,Show)
boundsDims :: Bounds -> Dimensions
boundsDims (Bounds x0 y0 x1 y1)=Dimensions (x1-x0+1) (y1-y0+1)
boundsOf :: [O.Object] -> Either String Bounds
boundsOf os=case concatMap (map fst . O.absolutePixels) os of
  []->Left "bounds of an empty pixel set"
  ps->Right (Bounds (minimum (map cx ps)) (minimum (map cy ps)) (maximum (map cx ps)) (maximum (map cy ps)))
boundsJSON :: Bounds -> String
boundsJSON (Bounds x0 y0 x1 y1)=jobj [("min_x",show x0),("min_y",show y0),("max_x",show x1),("max_y",show y1),("inclusive",jbool True)]

data SelectionWitness = SelectionWitness
  { swPlan :: SelectionPlan
  , swExamined :: Int            -- input objects the selector was evaluated on
  , swMatched :: [Int]           -- ids of the matching input objects (region ids of the plan's view)
  , swEvidence :: String         -- why the selection is legal (uniqueness / non-empty aggregate)
  , swBounds :: Bounds } deriving (Eq,Show)

-- The selection reads the input objects only. Zero matches and (for
-- SelectUnique) several matches are explicit failures that name the
-- cardinality; a predicate that itself needs a unique choice (IsMaxArea on a
-- tie, colour mode on a tie, an unproven rectangle count) fails inside
-- selectObjects with its own reason.
selectWith :: SelectionPlan -> [O.Object] -> Either String SelectionWitness
selectWith plan@(SelectionPlan mode sel) objs=do
  (chosen,_)<-either (\e->Left ("selection "++selectionText plan++": "++e)) Right (selectObjects sel objs)
  let ids=sort (map O.objectId chosen)
  case (mode,chosen) of
    (_,[])->Left ("selection "++selectionText plan++" matched no object ("++show (length objs)++" objects examined); a non-empty selection is required")
    (SelectUnique,[o])->do
      b<-boundsOf [o]
      Right (SelectionWitness plan (length objs) ids ("unique: exactly one of "++show (length objs)++" input objects matches; bounds = its bounding box") b)
    (SelectUnique,os)->Left ("selection "++selectionText plan++" is not unique: "++show (length os)++" objects match "++show ids++"; no implicit choice is made")
    (SelectNonEmpty,os)->do
      b<-boundsOf os
      Right (SelectionWitness plan (length objs) ids ("non-empty set of "++show (length os)++" objects "++show ids++"; bounds = bounding box of the union") b)

-- Content of the output canvas plus the pixel provenance of what is drawn.
data OutputContent
  = ContentEmit [EmittedObject]              -- selected members translated to the local origin
  | ContentCrop Grid [EmittedObject]         -- the input window (cropped grid) and its pixels split by source object
  deriving (Eq,Show)
data OutputSpecWitness = OutputSpecWitness
  { oswSelection :: SelectionWitness
  , oswDimsSource :: String                  -- e.g. "Dimensions <- Bounds(Unique(Select(Color == 2, Objects(Input))))"
  , oswContentKind :: String
  , oswPixelSources :: [(Int,Int,Bool)]      -- (source object id, pixels contributed, source is a selected member)
  , oswSelectedPixels, oswOtherPixels, oswBackgroundCells :: Int
  , oswView :: ViewId
  , oswCanvasFill :: Int                     -- fill colour of an own canvas (view background; the encoder background for the legacy view)
  , oswProvenance :: RegionProvenance
  , oswGeometry :: Maybe [GeometryWitness]   -- E1: cover/bounds witness of every selected member (when requested)
  } deriving (Eq,Show)
data OutputSpec = OutputSpec { osDims :: Dimensions, osContent :: OutputContent, osWitness :: OutputSpecWitness } deriving (Eq,Show)
-- Derivation options: whether the (budgeted) geometry witnesses of the
-- selected members are computed. Program execution never needs them.
newtype DeriveOptions = DeriveOptions { doGeometryWitness :: Bool } deriving (Eq,Show)
deriveQuiet, deriveWithGeometry :: DeriveOptions
deriveQuiet=DeriveOptions False
deriveWithGeometry=DeriveOptions True

-- Read the inclusive window of the raw input grid; out-of-grid bounds are an
-- explicit failure (never clipped).
cropWindow :: Grid -> Bounds -> Either String Grid
cropWindow g b@(Bounds x0 y0 x1 y1)
  | x0<0 || y0<0 || x1>=gw || y1>=gh = Left ("crop window "++show b++" exceeds the input grid "++show (gw,gh))
  | x1<x0 || y1<y0 = Left ("crop window "++show b++" is empty")
  | otherwise = mkGrid [[maybe 0 id (cell g (Coord x y)) | x<-[x0..x1]] | y<-[y0..y1]]
  where Dimensions gw gh=dimensions g

-- The scene a plan's view produces for a raw grid: the legacy scene is the
-- caller's encoded scene (encoder, diagonal view, permutation already
-- applied); a background view yields its regions as objects plus its
-- background decision (Nothing under NoBackground).
sceneForView :: ViewId -> Grid -> O.Scene -> Either String (O.Scene,Maybe Int,String)
sceneForView LegacyView _ scene=Right (scene,Just (O.background scene),"legacy encoder scene")
sceneForView v grid _=do
  vr<-viewRegions v grid
  Right (viewScene vr,vrBackground vr,vrEvidence vr)

-- Inference-time derivation: input grid + its encoded scene -> OutputSpec.
-- Order: view -> selection -> bounds -> dimensions (checked against the ARC
-- range) -> content. The training target is not an argument.
deriveOutputSpec :: DeriveOptions -> ContentFirstPlan -> Int -> Grid -> O.Scene -> Either String OutputSpec
deriveOutputSpec opts (ContentFirstPlan sel construction view) bg0 grid scene0=do
  (scene,viewBg,viewEvidence)<-either (\e->Left ("view "++viewText view++": "++e)) Right (sceneForView view grid scene0)
  sw<-selectWith sel (O.objects scene)
  let b=swBounds sw
      dims@(Dimensions w h)=boundsDims b
      (lo,hi)=natPosRange
      dimsSource="Dimensions <- Bounds("++selectionText sel++") = "++show (w,h)
      chosenIds=swMatched sw
      shift o=O.translate o (Vec (negate (bMinX b)) (negate (bMinY b)))
      bg=if view==LegacyView then bg0 else maybe 0 id viewBg
      chosen=[o | o<-O.objects scene, O.objectId o `elem` chosenIds]
      provenance otherCells=RegionProvenance (stableHash (show (rows grid))) view viewBg viewEvidence chosenIds
        "inclusive bounding box of the selected members' pixel sets (+1 per axis)"
        (if construction==CropInputWindow then "raw input window (every colour inside the bounds)" else "selected members only") otherCells
      geometry=if doGeometryWitness opts then Just [geometryWitness "" 0 view defaultCoverBudget (pixelSetFromList (map fst (O.absolutePixels o))) | o<-chosen] else Nothing
      geometryTrace spec=case geometry of
        Nothing->spec
        Just ws->foldr (\gw acc->traceAt levelCandidates [("scope",jstr "ContentFirst"),("kind",jstr (if gwStatus gw=="bounded" then "cover-bounded" else "cover-proven")),("stage",jstr "geometry"),("branch_id",jstr "content_first.geometry"),("parent_branch_id",jstr "content_first")
                        ,("view",jstr (viewText view)),("pixels",show (S.size (gwPixels gw))),("rectangles",show (length (gwRects gw))),("lower_bound",show (gwLower gw)),("upper_bound",show (gwUpper gw)),("status",jstr (gwStatus gw))] acc) spec ws
  if w<lo || h<lo then Left ("output size realization: non-positive dimensions "++show (w,h)++" from "++dimsSource) else Right ()
  if w>hi || h>hi then Left ("output size realization: dimensions "++show (w,h)++" exceed the ARC bound "++show hi) else Right ()
  case construction of
    EmitSelectedWithOwnCanvas->do
      fill<-case (view,viewBg) of
        (LegacyView,_)->Right bg0
        (_,Just c)->Right c
        (_,Nothing)->Left ("EmitSelectedWithOwnCanvas not applicable under "++viewText view++": no background colour to fill the own canvas")
      let emitted=[EmittedObject (shift o) [O.objectId o] ("selected member "++show (O.objectId o)++" translated to the local canvas origin") | o<-chosen]
          px=sum (map (O.size . eoObject) emitted)
          sources=[(O.objectId o,O.size o,True) | o<-chosen]
      Right (geometryTrace (OutputSpec dims (ContentEmit emitted) (OutputSpecWitness sw dimsSource "emit_selected: only the selected members are drawn" sources px 0 (w*h-px) view fill (provenance (w*h-px)) geometry)))
    CropInputWindow->do
      window<-cropWindow grid b
      let inside (Coord x y)=x>=bMinX b && x<=bMaxX b && y>=bMinY b && y<=bMaxY b
          clip o=case [(Coord (x-bMinX b) (y-bMinY b),c) | (Coord x y,c)<-O.absolutePixels o, inside (Coord x y)] of
            []->Nothing
            ps->let ox=minimum [cx p | (p,_)<-ps]; oy=minimum [cy p | (p,_)<-ps]
                    selected=O.objectId o `elem` chosenIds
                in Just (EmittedObject (O.Object (O.objectId o) (Coord ox oy) (M.fromList [(Coord (cx p-ox) (cy p-oy),c) | (p,c)<-ps]) 0) [O.objectId o]
                     (if selected then "crop window: pixels of the selected object "++show (O.objectId o) else "crop window: pixels of the NON-selected object "++show (O.objectId o)++" that lie inside the window (window content comes from the input grid)"),selected)
          clipped=[e | o<-O.objects scene, Just e<-[clip o]]
          emitted=map fst clipped
          sources=[(O.objectId (eoObject e),O.size (eoObject e),s) | (e,s)<-clipped]
          selPx=sum [n | (_,n,True)<-sources]; otherPx=sum [n | (_,n,False)<-sources]
      -- The provenance split must reproduce the raw window exactly; a
      -- disagreement (e.g. a background convention the view does not share)
      -- is a failure, never a silent colour loss.
      replay<-gridFromCells dims bg (concatMap (O.absolutePixels . eoObject) emitted)
      if replay/=window then Left ("crop provenance mismatch: the view's objects inside the window do not reproduce the raw input window (fill "++show bg++")") else Right ()
      Right (geometryTrace (OutputSpec dims (ContentCrop window emitted) (OutputSpecWitness sw dimsSource "crop_input_window: every input pixel inside the selection's bounding box" sources selPx otherPx (w*h-selPx-otherPx) view bg (provenance (w*h-selPx-otherPx)) geometry)))

specEmitted :: OutputSpec -> [EmittedObject]
specEmitted s=case osContent s of ContentEmit es->es; ContentCrop _ es->es
-- Render on the derived canvas with the spec's own fill colour; a pixel
-- outside the canvas is a failure.
renderOutputSpec :: Int -> OutputSpec -> Either String Grid
renderOutputSpec bg0 s=do
  let bg=if oswView (osWitness s)==LegacyView then bg0 else oswCanvasFill (osWitness s)
  g<-gridFromCells (osDims s) bg (concatMap (O.absolutePixels . eoObject) (specEmitted s))
  case osContent s of
    ContentCrop window _ | g/=window->Left "render disagrees with the cropped input window"
    _->Right g

specWitnessJSON :: OutputSpec -> String
specWitnessJSON s=
  let w=osWitness s; sw=oswSelection w; Dimensions dw dh=osDims s
  in jobj [("selection",jobj [("text",jstr (selectionText (swPlan sw))),("mode",jstr (show (spMode (swPlan sw)))),("objects_examined",show (swExamined sw))
             ,("matched_ids",show (swMatched sw)),("cardinality",show (length (swMatched sw))),("evidence",jstr (swEvidence sw))])
          ,("bounds",boundsJSON (swBounds sw)),("dims",jarr [show dw,show dh]),("dims_source",jstr (oswDimsSource w))
          ,("content_kind",jstr (oswContentKind w)),("view",jstr (viewText (oswView w))),("canvas_fill",show (oswCanvasFill w))
          ,("pixel_sources",jarr [jobj [("source",show i),("pixels",show n),("selected_member",jbool sel)] | (i,n,sel)<-oswPixelSources w])
          ,("selected_pixels",show (oswSelectedPixels w)),("other_object_pixels",show (oswOtherPixels w)),("background_cells",show (oswBackgroundCells w))
          ,("provenance",provenanceJSON (oswProvenance w))
          ,("geometry",jmaybe (\ws->jarr (map geometryWitnessJSON ws)) (oswGeometry w))
          ,("geometry_summary",jmaybe (\ws->jobj [("members",show (length ws)),("proven",show (length [() | g<-ws, gwStatus g/="bounded"])),("bounded",show (length [() | g<-ws, gwStatus g=="bounded"]))]) (oswGeometry w))
          ,("input_only_dependency",jstr "input grid -> view -> objects/regions -> selector -> bounds -> dimensions -> content; the training target is never read")]
specJSON :: Int -> OutputSpec -> String
specJSON bg s=jobj [("witness",specWitnessJSON s),("emitted",jarr [jobj [("sources",show (eoSources e)),("origin",jstr (eoOrigin e)),("pixels",jarr [jarr [show (cx p),show (cy p),show c] | (p,c)<-O.absolutePixels (eoObject e)])] | e<-specEmitted s])
  ,("grid",either (const "null") (\g->jarr [jarr (map show r) | r<-rows g]) (renderOutputSpec bg s))]

-- Search over the plan universe. Per plan: the selection is evaluated on
-- EVERY case first (cheap, input only; a plan with an illegal selection on any
-- case is rejected with the per-case reason), then derive+render runs case by
-- case with early exit on the first mismatch. Budget = per-case executions.
data CFCase = CFCase { cfcGrid :: Grid, cfcScene :: O.Scene, cfcTarget :: Grid } deriving (Show)
data CFCaseTrace = CFCaseTrace
  { cftCase :: Int, cftOutcome :: String    -- selection_failed | selection_ok | derive_failed | render_invalid | render_mismatch | exact | not_executed
  , cftReason :: String, cftSpec :: Maybe OutputSpec, cftGrid :: Maybe Grid } deriving (Eq,Show)
-- ccSelections: the selection outcome on EVERY case (input only), recorded for
-- every visited plan, whether or not derivation ran.
data CFCandidate = CFCandidate { ccPlan :: ContentFirstPlan, ccIndex :: Int, ccStatus :: String, ccSelections :: [Either String SelectionWitness], ccCases :: [CFCaseTrace] } deriving (Eq,Show)
data CFResult = CFResult
  { crCandidates :: [CFCandidate]           -- every visited plan, enumeration order
  , crFits :: [CFCandidate]                 -- training-exact plans, enumeration order
  , crUniverse :: Int                       -- size of the finite plan universe
  , crTried :: Int                          -- plans visited
  , crSelectionEvaluations :: Int           -- plan x case selection evaluations
  , crSelectionLegalPlans :: Int            -- plans whose selection is legal on every case
  , crExecutions :: Int                     -- per-case derive+render executions (budget unit)
  , crSpecsDerived :: Int                   -- per-case OutputSpecs derived
  , crRendered :: Int                       -- per-case renders that produced a grid
  , crTruncated :: Bool, crTruncationReason :: Maybe String
  , crFirstFitExecutions :: Maybe Int       -- executions spent when the first fit appeared
  , crViewsUsed :: S.Set (Int,ViewId)       -- (case, non-legacy view) pairs materialised by a visited plan
  , crViewsNotApplicable :: S.Set (Int,ViewId)
  , crGeometryEvaluations :: Int            -- plan x case selection evaluations of plans with a geometry predicate
  } deriving (Eq,Show)

searchContentFirst :: ContentFirst -> Int -> [ContentFirstPlan] -> [CFCase] -> CFResult
searchContentFirst cf bg universe cases=
  let visited=take (cfPlanBudget cf) universe
      planCut=length universe>cfPlanBudget cf
      start=CFResult [] [] (length universe) 0 0 0 0 0 0 planCut (if planCut then Just ("plan budget: "++show (cfPlanBudget cf)++" of "++show (length universe)++" plans visited") else Nothing) Nothing S.empty S.empty 0
      final=go start (zip [0::Int ..] visited)
  in final {crCandidates=reverse (crCandidates final),crFits=reverse (crFits final)}
  where
    ncases=length cases
    -- Views are materialised at most once per case (lazy map) and shared by every plan.
    viewTable=M.fromList [((k,v),sceneForView v (cfcGrid c) (cfcScene c)) | (k,c)<-zip [0::Int ..] cases, v<-LegacyView:allBackgroundViews]
    viewOf k v=M.findWithDefault (Left "view not materialised") (k,v) viewTable
    opts=DeriveOptions (cfGeometry cf)
    go r []=r
    go r ((i,plan):rest)
      | crExecutions r>=cfExecutionBudget cf = traceAt levelBranches (budgetEvent "case_execution_budget" "cfExecutionBudget" (cfExecutionBudget cf) (crExecutions r) (length rest+1) plan)
          r {crTruncated=True,crTruncationReason=Just ("execution budget "++show (cfExecutionBudget cf)++" reached; "++show (length rest+1)++" enumerated plans not visited")}
      | length (crFits r)>=cfMaxFits cf = traceAt levelBranches (budgetEvent "fit_representative_cap" "cfMaxFits" (cfMaxFits cf) (length (crFits r)) (length rest+1) plan)
          r {crTruncated=True,crTruncationReason=Just ("representative cap "++show (cfMaxFits cf)++" reached; "++show (length rest+1)++" enumerated plans not visited")}
      | otherwise =
          let view=cfpView plan
              ks=[0..ncases-1]
              sels=[(k,case viewOf k view of
                          Left e->Left ("view "++viewText view++": "++e)
                          Right (sc,_,_)->selectWith (cfpSelection plan) (O.objects sc)) | k<-ks]
              legal=all (either (const False) (const True) . snd) sels
              viewOk k=either (const False) (const True) (viewOf k view)
              usedViews=if view==LegacyView then S.empty else S.fromList [(k,view) | k<-ks, viewOk k]
              naViews=if view==LegacyView then S.empty else S.fromList [(k,view) | k<-ks, not (viewOk k)]
              newViews=S.toList (S.difference usedViews (crViewsUsed r))++S.toList (S.difference naViews (crViewsNotApplicable r))
              r1=r {crTried=crTried r+1,crSelectionEvaluations=crSelectionEvaluations r+ncases
                   ,crViewsUsed=S.union (crViewsUsed r) usedViews,crViewsNotApplicable=S.union (crViewsNotApplicable r) naViews
                   ,crGeometryEvaluations=crGeometryEvaluations r+(if planUsesGeometry plan then ncases else 0)}
              (r2,execs)=if legal then runCases r1 {crSelectionLegalPlans=crSelectionLegalPlans r1+1} plan else (r1,[])
              cand'=if legal then CFCandidate plan i (statusOf execs) (map snd sels) execs
                    else CFCandidate plan i "selection_failed" (map snd sels) [CFCaseTrace k (either (const "selection_failed") (const "selection_ok") e) (either id (\w->swEvidence w++"; matched "++show (swMatched w)) e) Nothing Nothing | (k,e)<-sels]
              ok=ccStatus cand'=="fit"
              r3=r2 {crCandidates=cand':crCandidates r2
                    ,crFits=if ok then cand':crFits r2 else crFits r2
                    ,crFirstFitExecutions=case crFirstFitExecutions r2 of Nothing | ok->Just (crExecutions r2); x->x}
              next=if ok then traceEvent "latis-train-exact" (go r3 rest) else go r3 rest
              viewEvents x=foldr (\(k,v) acc->case viewOf k v of
                  Right (sc,vbg,ev)->traceAt levelBranches [("scope",jstr "ContentFirst"),("kind",jstr "geometry-view-created"),("stage",jstr "content_first"),("branch_id",jstr "content_first.view"),("parent_branch_id",jstr "content_first")
                    ,("case_index",show k),("view",jstr (viewText v)),("background",jmaybe show vbg),("evidence",jstr ev),("regions",show (length (O.objects sc))),("input_only",jbool True)] acc
                  Left e->traceAt levelBranches [("scope",jstr "ContentFirst"),("kind",jstr "geometry-view-not-applicable"),("stage",jstr "content_first"),("branch_id",jstr "content_first.view"),("parent_branch_id",jstr "content_first"),("case_index",show k),("view",jstr (viewText v)),("reason",jstr e)] acc) x newViews
              geometryEvent x=if planUsesGeometry plan then traceAt levelCandidates [("scope",jstr "ContentFirst"),("kind",jstr "geometry-feature-evaluated"),("stage",jstr "geometry"),("branch_id",jstr "content_first.geometry"),("parent_branch_id",jstr "content_first")
                  ,("candidate_id",jstr (stableHash (show plan))),("plan",jstr (planText plan)),("cases",jarr [jobj [("case_index",show k),("legal",jbool (either (const False) (const True) e)),("reason",jstr (either id (const "") e))] | (k,e)<-sels])] x else x
              executedEvent x=if legal then traceAt levelCandidates [("scope",jstr "ContentFirst"),("kind",jstr "content-first-branch-executed"),("stage",jstr "content_first"),("branch_id",jstr "content_first.search"),("parent_branch_id",jstr "content_first")
                  ,("candidate_id",jstr (stableHash (show plan))),("view",jstr (viewText view)),("cases_executed",show (length [() | t<-execs, cftOutcome t/="not_executed"])),("outcome",jstr (ccStatus cand'))] x else x
          in viewEvents $ geometryEvent $ executedEvent $ traceCand levelCandidates (stableHash (show plan)) (\level->
               [("scope",jstr "ContentFirst"),("kind",jstr "evaluated"),("stage",jstr "content_first"),("entry",jstr "content_first"),("branch_id",jstr "content_first.search"),("parent_branch_id",jstr "content_first")
               ,("enumeration_index",show i),("candidate_ast",planJSON plan),("candidate_type",jstr "Input -> OutputSpec(Dimensions,Content)"),("cost",show (planCost plan)),("view",jstr (viewText view))
               ,("outcome",jstr (if ok then "fit" else case ccStatus cand' of "selection_failed"->"invalid"; "derive_failed"->"invalid"; "render_invalid"->"invalid"; _->"no_fit"))
               ,("reason_code",jstr (if ok then "train_exact" else ccStatus cand'))
               ,("selection_legal_on_every_case",jbool legal),("case_executions",show (length [() | t<-ccCases cand', cftOutcome t `notElem` ["not_executed","selection_failed","selection_ok"]]))
               ,("cases",jarr [caseJ level t | t<-ccCases cand'])]) next
    statusOf ts=case [t | t<-ts, cftOutcome t `notElem` ["exact","not_executed"]] of
      []->if all ((=="exact") . cftOutcome) ts then "fit" else "no_fit"
      (t:_)->cftOutcome t
    runCases r0 plan=loop r0 (zip [0::Int ..] cases) []
      where
        loop r [] acc=(r,reverse acc)
        loop r ((k,c):cs) acc
          | crExecutions r>=cfExecutionBudget cf = (r {crTruncated=True,crTruncationReason=Just "execution budget reached inside a candidate"},reverse (CFCaseTrace k "not_executed" "execution budget reached inside the candidate" Nothing Nothing:acc)++[CFCaseTrace k' "not_executed" "after budget cut" Nothing Nothing | (k',_)<-cs])
          | otherwise =
              let r1=r {crExecutions=crExecutions r+1}
              in case deriveOutputSpec opts plan bg (cfcGrid c) (cfcScene c) of
                   Left e->(r1,reverse (CFCaseTrace k "derive_failed" e Nothing Nothing:acc)++[CFCaseTrace k' "not_executed" "earlier case failed (early exit)" Nothing Nothing | (k',_)<-cs])
                   Right spec->
                     let r2=r1 {crSpecsDerived=crSpecsDerived r1+1}
                     in case renderOutputSpec bg spec of
                          Left e->(r2,reverse (CFCaseTrace k "render_invalid" e (Just spec) Nothing:acc)++[CFCaseTrace k' "not_executed" "earlier case failed (early exit)" Nothing Nothing | (k',_)<-cs])
                          Right g | g==cfcTarget c->loop r2 {crRendered=crRendered r2+1} cs (CFCaseTrace k "exact" "" (Just spec) (Just g):acc)
                                  | otherwise->(r2 {crRendered=crRendered r2+1},reverse (CFCaseTrace k "render_mismatch" (if dimensions g/=dimensions (cfcTarget c) then "derived dimensions "++show (dimensions g)++" differ from the target "++show (dimensions (cfcTarget c)) else "rendered grid differs from the training target") (Just spec) (Just g):acc)++[CFCaseTrace k' "not_executed" "earlier case failed (early exit)" Nothing Nothing | (k',_)<-cs])
    caseJ level t=jobj ([("case_index",show (cftCase t)),("outcome",jstr (cftOutcome t)),("reason",jstr (cftReason t))
      ,("output_spec",jmaybe specWitnessJSON (cftSpec t))
      ,("grid_hash",jmaybe (jstr . stableHash . show . rows) (cftGrid t))
      ,("grid_dims",jmaybe (\g->let Dimensions w h=dimensions g in jarr [show w,show h]) (cftGrid t))
      ,("diff_cells",case (cftGrid t,cftCase t<ncases) of (Just g,True)->jmaybe show (gridDiffCount g (cfcTarget (cases!!cftCase t))); _->"null")]
      ++[("predicted",jmaybe (\g->jarr [jarr (map show r) | r<-rows g]) (cftGrid t)) | level>=levelFull]
      ++[("case_trace",caseTraceJSON False (CaseTrace (cftCase t) (cftOutcome t) (cftReason t) (cftGrid t) (cfcTarget (cases!!cftCase t)) (maybe 0 (length . specEmitted) (cftSpec t)))) | cftCase t<ncases])
    budgetEvent code name limit used unvisited plan=
      [("scope",jstr "ContentFirst"),("kind",jstr "budget"),("branch_id",jstr "content_first.search"),("parent_branch_id",jstr "content_first")
      ,("reason_code",jstr code),("budget",jobj [("name",jstr name),("limit",show limit),("used",show used),("unit",jstr (if name=="cfMaxFits" then "train-exact representatives" else "per-case derive+render executions"))])
      ,("unvisited_enumerated_plans",show unvisited),("next_plan_id",jstr (stableHash (show plan)))]

-- Why the content-first path opened, and what the Size-first layer reported.
data CFTrigger = TriggerSizeFailed | TriggerDownstreamFailed | TriggerExploreAlternatives deriving (Eq,Show)
triggerText :: CFTrigger -> String
triggerText TriggerSizeFailed="size_failed"
triggerText TriggerDownstreamFailed="downstream_failed"
triggerText TriggerExploreAlternatives="explore_alternatives"
data SizeFirstStatus = SizeFit | SizeNoFit | SizeTruncated | SizeNotEntered deriving (Eq,Show)
sizeFirstStatusText :: SizeFirstStatus -> String
sizeFirstStatusText SizeFit="fit"
sizeFirstStatusText SizeNoFit="no_fit"
sizeFirstStatusText SizeTruncated="truncated"
sizeFirstStatusText SizeNotEntered="not_entered"

-- Diagnostic classification of a content-first search (never a proof of
-- inexpressibility: it describes what the visited plan universe did).
classifyResult :: CFTrigger -> CFResult -> String
classifyResult trig r
  | not (null (crFits r)) = case trig of
      TriggerSizeFailed->"size_first_failed_but_content_first_succeeded"
      TriggerDownstreamFailed->"size_first_fit_downstream_failed_but_content_first_succeeded"
      TriggerExploreAlternatives->"content_first_alternative_representatives_found"
  | crSelectionLegalPlans r==0 && not (crTruncated r) = "content_first_unavailable_due_to_representation"
  | crSelectionLegalPlans r==0 = "content_first_unavailable_due_to_representation_within_visited_prefix"
  | crTruncated r = "content_first_no_train_exact_budget_truncated"
  | otherwise = "content_first_no_train_exact"

cfMetricNames :: [String]
cfMetricNames=words "cf_triggered cf_trigger_size_failed cf_trigger_downstream_failed cf_trigger_explore_alternatives cf_plan_universe cf_plans_tried cf_selection_evaluations cf_selection_legal_plans cf_case_executions cf_specs_derived cf_rendered cf_fits cf_truncated cf_representation_unavailable cf_first_fit_executions cf_alternative_fits cf_deferred_plans cf_selected_cost geo_views_created geo_views_not_applicable geo_feature_evaluations geo_cover_proven geo_cover_bounded geo_selected_rect_count"

-- One content-first search as recorded in the derivation graph.
data CFRun = CFRun
  { cfrTrigger :: CFTrigger, cfrSizeFirstStatus :: SizeFirstStatus, cfrPriorFailure :: String
  , cfrResult :: CFResult, cfrClassification :: String, cfrSelected :: Maybe ContentFirstPlan
  , cfrRole :: String   -- "solution" (the program comes from this run) | "alternatives" (recorded only)
  } deriving (Eq,Show)
