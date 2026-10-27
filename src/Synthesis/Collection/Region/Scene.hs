-- LATIS Stage E2-B: a Scene is a verifiable interpretation of the whole raw
-- grid as placed objects plus a residual.
--
--   L = [(object_i, position_i)]   coloured pixel sets P_i with supports M_i
--   M_i pairwise disjoint (first version: every object source used here is a
--   partition of its view's foreground, so this holds by construction and is
--   re-checked)
--   ResidualCoords B = U \ union M_i
--   background = UniformResidual c   iff B /= {} and G is constant c on B
--              | NoResidual          iff B == {}
--   otherwise the scene is NOT a legal single-colour-residual scene (Left).
--
-- The reconstruction (object pixels + residual colour) must equal the raw
-- grid pixel for pixel; the SceneWitness records it and can be replayed.
-- No colour is assumed: the residual's colour is observed, 0 is ordinary.
module Synthesis.Collection.Region.Scene
  ( PlacedObject(..), SceneBackground(..), SceneHypothesis(..), SceneWitness(..), SceneCost(..)
  , sceneFromView, sceneHypotheses, verifyScene, sceneJSON, sceneCost, placedBounds, sceneRejectReason
  ) where

import Latent.Grid
import qualified Data.Map.Strict as M
import qualified Data.Set as S
import Data.List (sort, group, sortOn)
import Synthesis.Collection.Geometry.View
import Synthesis.Collection.Geometry.Cover (PixelSet, boundsOfPixels, BoundsE(..), Rect(..), rectJSON, CoverBudget(..), defaultCoverBudget, minimalCover, coverRectangles)
import Synthesis.Collection.Region.ShapeMDL
import Synthesis.Collection.Diagnostics (jstr, jobj, jarr, jbool, jmaybe, stableHash)

-- Identity = (view, region id); shape = normalized support; colouring = raw colours.
data PlacedObject = PlacedObject { poId :: Int, poView :: ViewId, poSupport :: PixelSet, poColors :: M.Map Coord Int, poShape :: Maybe MDLResult } deriving (Eq,Show)
data SceneBackground = UniformResidual Int | NoResidual deriving (Eq,Show)
data SceneHypothesis = SceneHypothesis
  { shView :: ViewId, shGrid :: Grid, shObjects :: [PlacedObject], shResidual :: PixelSet, shBackground :: SceneBackground
  , shEvidence :: String, shCost :: SceneCost } deriving (Eq,Show)
data SceneCost = SceneCost { scObjects :: Int, scShapeMDL :: Int, scPlacement :: Int, scBackground :: Int, scViewPrior :: Int, scTotal :: Int } deriving (Eq,Show)
data SceneWitness = SceneWitness { swReconstructed :: Bool, swConflicts :: [Coord], swUncovered :: [Coord], swResidualColors :: [Int] } deriving (Eq,Show)

placedBounds :: PlacedObject -> Maybe Rect
placedBounds o=case boundsOfPixels (poSupport o) of EmptyBounds->Nothing; PixelBounds r->Just r

-- Scene cost (ranking only, never a correctness claim). Objects cost 1 each,
-- placement 2 coordinates each, shape = C_ast (bounded when not optimised),
-- background 1 (uniform) / 0 (none), view prior: legacy 0, others 1. This
-- penalises both degenerate extremes: many single-pixel objects (objects +
-- placements) and one huge object (shape MDL of a complex mask).
sceneCost :: ViewId -> [PlacedObject] -> SceneBackground -> SceneCost
sceneCost v os bg=
  let n=length os
      shape=sum [maybe (5*S.size (poSupport o)) mrCost (poShape o) | o<-os]
      place=2*n
      b=case bg of UniformResidual _->1; NoResidual->0
      vp=if v==LegacyView then 0 else 1
  in SceneCost n shape place b vp (n+shape+place+b+vp)

-- Build the scene of a view: objects = the view's regions (a partition of the
-- foreground), residual = the rest; legal iff the residual is empty or one colour.
sceneFromView :: MDLBudget -> Bool -> ViewId -> Grid -> Either String SceneHypothesis
sceneFromView mdl withShape v g=do
  vr<-viewRegions v g
  let dims=dimensions g
      objs=[PlacedObject (rgId r) v (rgPixels r) (rgColors r)
             (if withShape then either (const Nothing) Just (bestShape mdl (rectCoverCount (normalize (rgPixels r))) (normalize (rgPixels r))) else Nothing) | r<-vrRegions vr]
      -- E1 minimal rectangle cover count (overlaps allowed), reported next to c_ast; small budget, reporting only
      rectCoverCount px=length (coverRectangles (minimalCover (defaultCoverBudget {cbMaxNodes=2000, cbMaxArea=64}) px))
      covered=S.unions (map poSupport objs)
      overlaps=sum (map (S.size . poSupport) objs)-S.size covered
      residual=S.fromList [p | p<-coords dims, not (S.member p covered)]
      colours=sort (map head' (group (sort [c | p<-S.toList residual, Just c<-[cell g p]])))
  if overlaps/=0 then Left ("object supports overlap on "++show overlaps++" cells") else Right ()
  bg<-case colours of
    []->Right NoResidual
    [c]->Right (UniformResidual c)
    cs->Left ("residual is not single-coloured: colours "++show cs++" on "++show (S.size residual)++" cells; not a single-colour-residual scene under "++viewText v)
  let sc=SceneHypothesis v g objs residual bg (vrEvidence vr++"; residual "++show (S.size residual)++" cells, background "++show bg) (sceneCost v objs bg)
  case verifyScene sc of
    w | swReconstructed w->Right sc
      | otherwise->Left ("scene does not reconstruct the grid: conflicts "++show (length (swConflicts w))++", uncovered "++show (length (swUncovered w)))
  where
    head' (x:_)=x
    head' []=0
    normalize s=let xs=[x | Coord x _<-S.toList s]; ys=[y | Coord _ y<-S.toList s] in S.map (\(Coord x y)->Coord (x-minimum xs) (y-minimum ys)) s

-- All candidate scenes of a grid (legal ones), cheapest first; illegal views
-- are returned with their reason so the trace can show why.
sceneHypotheses :: MDLBudget -> Bool -> Grid -> ([SceneHypothesis],[(ViewId,String)])
sceneHypotheses mdl withShape g=
  let tries=[(v,sceneFromView mdl withShape v g) | v<-LegacyView:allBackgroundViews]
  in (sortOn (\s->(scTotal (shCost s),show (shView s))) [s | (_,Right s)<-tries],[(v,e) | (v,Left e)<-tries])
sceneRejectReason :: ViewId -> Grid -> Maybe String
sceneRejectReason v g=either Just (const Nothing) (sceneFromView defaultMDLBudget False v g)

-- Independent pixel-for-pixel replay: object pixels (with colours) + residual
-- colour must reproduce the grid; conflicts and uncovered cells are listed.
verifyScene :: SceneHypothesis -> SceneWitness
verifyScene sc=
  let g=shGrid sc; dims=dimensions g
      painted=M.unionsWith (\a _->a) [poColors o | o<-shObjects sc]
      bgColour=case shBackground sc of UniformResidual c->Just c; NoResidual->Nothing
      recon p=case M.lookup p painted of
        Just c->Just c
        Nothing->if S.member p (shResidual sc) then bgColour else Nothing
      conflicts=[p | p<-coords dims, Just c<-[recon p], cell g p/=Just c]
      uncovered=[p | p<-coords dims, recon p==Nothing]
      rc=sort (map (\xs->case xs of (x:_)->x; []->0) (group (sort [c | p<-S.toList (shResidual sc), Just c<-[cell g p]])))
  in SceneWitness (null conflicts && null uncovered && (case shBackground sc of NoResidual->S.null (shResidual sc); UniformResidual c->rc==[c])) conflicts uncovered rc

sceneJSON :: SceneHypothesis -> String
sceneJSON sc=
  let w=verifyScene sc; c=shCost sc
  in jobj [("view",jstr (viewText (shView sc))),("objects",show (length (shObjects sc))),("residual_cells",show (S.size (shResidual sc)))
          ,("background",case shBackground sc of UniformResidual k->jobj [("kind",jstr "UniformResidual"),("colour",show k)]; NoResidual->jobj [("kind",jstr "NoResidual")])
          ,("evidence",jstr (shEvidence sc)),("reconstructed",jbool (swReconstructed w)),("conflicts",show (length (swConflicts w))),("uncovered",show (length (swUncovered w)))
          ,("cost",jobj [("objects",show (scObjects c)),("shape_mdl",show (scShapeMDL c)),("placement",show (scPlacement c)),("background",show (scBackground c)),("view_prior",show (scViewPrior c)),("total",show (scTotal c))])
          ,("object_list",jarr [jobj [("id",show (poId o)),("pixels",show (S.size (poSupport o))),("bounds",jmaybe rectJSON (placedBounds o)),("colours",show (sort (map (\xs->case xs of (x:_)->x; []->0) (group (sort (M.elems (poColors o)))))))
                                     ,("shape",jmaybe mdlJSON (poShape o)),("hash",jstr (stableHash (show (S.toList (poSupport o)))))] | o<-shObjects sc])
          ,("note",jstr "residual colour is observed, never assumed; a marker inside the residual would make it multi-coloured and reject this scene")]
