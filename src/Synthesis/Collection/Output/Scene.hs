-- LATIS Stage E4: output-side scene candidates.
--
-- For one training OUTPUT grid O_i and every background view the existing
-- extraction rules (Geometry.View.viewRegions) give a region list; the
-- existing Scene builder (Region.Scene.sceneFromRegions) checks the
-- single-colour-residual / no-residual law and replays the grid pixel for
-- pixel (verifyScene). Nothing here is specific to inputs: the functions
-- take any Grid. Each legal view yields one OutputSceneCandidate; every
-- object carries a bounded list of alternative Shape ASTs (cross-level, see
-- ShapeMDL.shapeAlternatives) so that the joint induction can pick a common
-- structure that is not the locally cheapest one.
--
-- Objects are the view's single-colour 4-connected components (E4 limitation,
-- reported as such): a multi-colour "intended object" is several objects.
module Synthesis.Collection.Output.Scene
  ( OutputBudget(..), defaultOutputBudget, OutObj(..), OutputSceneCandidate(..), outputScenes, concreteScene, outObjJSON, oscJSON, altLookupFor
  ) where

import Latent.Grid
import Synthesis.Collection.Geometry.View (ViewId(..), viewText, viewRegions, allBackgroundViews, ViewResult(..), Region(..))
import Synthesis.Collection.Geometry.Cover (PixelSet, pixelSetNormalize, boundsOfPixels, BoundsE(..), Rect(..))
import Synthesis.Collection.Region.Scene
import Synthesis.Collection.Region.ShapeMDL (ShapeExpr(..), MDLBudget(..), defaultMDLBudget, shapeAlternatives, shapeText, shapeCost)
import Synthesis.Collection.Output.Template
import Synthesis.Collection.Diagnostics (jstr, jobj, jarr, jbool, jmaybe, timedForce)
import qualified Data.Map as ML
import qualified Data.Map.Strict as M
import qualified Data.Set as S
import Data.List (sortOn, nub)

-- Every budget has a unit; the defaults are small and frozen before the runs.
data OutputBudget = OutputBudget
  { obShapeAlts :: Int        -- alternative Shape ASTs kept per object (entries)
  , obMaxObjects :: Int       -- objects per output above which the output is RepresentationUnavailable (objects)
  , obMatching :: Int         -- full role assignments tried per view assignment (assignments)
  , obStructures :: Int       -- common structure signatures tried per role (signatures)
  , obSkeletons :: Int        -- skeleton candidates kept (entries)
  , obViewCombos :: Int       -- mixed view assignments tried after the same-view ones (assignments)
  , obMDL :: MDLBudget        -- shape enumeration budget (rects / bbox area / expressions)
  } deriving (Eq,Show)
defaultOutputBudget :: OutputBudget
defaultOutputBudget=OutputBudget 8 8 400 6 6 16 defaultMDLBudget

data OutObj = OutObj { ooId :: Int, ooColour :: Int, ooX :: Int, ooY :: Int, ooMask :: PixelSet, ooSize :: Int, ooAlts :: [ShapeExpr], ooAltStatus :: String } deriving (Eq,Show)
data OutputSceneCandidate = OutputSceneCandidate
  { oscCase :: Int, oscView :: ViewId, oscScene :: SceneHypothesis, oscObjects :: [OutObj]
  , oscBackground :: Maybe Int        -- Nothing = NoResidual (no background may be inferred)
  , oscDims :: (Int,Int), oscSceneCost :: Int, oscEvidence :: String, oscReconstructed :: Bool } deriving (Eq,Show)

-- Lazy per-task table of shape alternatives keyed by the exact normalised mask.
altLookupFor :: OutputBudget -> [Grid] -> (PixelSet -> ([ShapeExpr],String))
altLookupFor b grids=
  let masks=nub [pixelSetNormalize (rgPixels r) | g<-grids, v<-LegacyView:allBackgroundViews, Right vr<-[viewRegions v g], r<-vrRegions vr]
      table=ML.fromList [(m,timedForce "e4_shape_alternatives" (\(xs,st)->length xs+length st) (shapeAlternatives (obMDL b) (obShapeAlts b) m)) | m<-masks]
  in \m->ML.findWithDefault (shapeAlternatives (obMDL b) (obShapeAlts b) m) (pixelSetNormalize m) table

-- All legal scene candidates of one output, cheapest scene first, with the
-- rejected views and their reasons.
outputScenes :: OutputBudget -> (PixelSet -> ([ShapeExpr],String)) -> Int -> Grid -> ([OutputSceneCandidate],[(ViewId,String)])
outputScenes b alts k g=
  let tries=[(v,viewRegions v g >>= sceneFromRegions NoShapes v g) | v<-LegacyView:allBackgroundViews]
      Dimensions w h=dimensions g
      mk v sc=
        let objs=[OutObj (poId o) (colourOf o) x y norm (S.size (poSupport o)) as st
                 | o<-shObjects sc, let norm=pixelSetNormalize (poSupport o), let (x,y)=originOf o, let (as,st)=alts norm]
            cost=concreteCost (concreteSceneOf (w,h) (bgOf sc) objs)
        in OutputSceneCandidate k v sc objs (bgOf sc) (w,h) cost (shEvidence sc) (swReconstructed (verifyScene sc))
      legal=sortOn (\c->(oscSceneCost c,show (oscView c))) [mk v sc | (v,Right sc)<-tries, length (shObjects sc)<=obMaxObjects b]
      rejected=[(v,e) | (v,Left e)<-tries]++[(v,"ObjectRepresentationUnavailable: "++show (length (shObjects sc))++" objects exceed the budget "++show (obMaxObjects b)) | (v,Right sc)<-tries, length (shObjects sc)>obMaxObjects b]
  in (legal,rejected)
  where
    colourOf o=case M.elems (poColors o) of (c:_)->c; []->0
    originOf o=case boundsOfPixels (poSupport o) of PixelBounds r->(rx0 r,ry0 r); EmptyBounds->(0,0)
    bgOf sc=case shBackground sc of UniformResidual c->Just c; NoResidual->Nothing

-- The concrete (all-literal) template of one candidate: objects in raster
-- order with their cheapest shape alternative; its cost is C_independent.
concreteSceneOf :: (Int,Int) -> Maybe Int -> [OutObj] -> SceneT
concreteSceneOf (w,h) bg objs=TCanvas (ILit w) (ILit h) (maybe BgNone BgLit bg)
  [TSingle (TPlace (lit (head' (ooAlts o))) (CLit (ooColour o)) (ILit (ooX o)) (ILit (ooY o))) | o<-sortOn (\o->(ooY o,ooX o,ooId o)) objs]
  where head' (x:_)=x
        head' []=SRect (Rect 0 0 0 0)
        lit (SRect r)=TRect (ILit (rx0 r)) (ILit (ry0 r)) (ILit (rx1 r)) (ILit (ry1 r))
        lit (SUnion a c)=TUnion (lit a) (lit c)
        lit (SDiff a c)=TDiff (lit a) (lit c)
concreteScene :: OutputSceneCandidate -> SceneT
concreteScene c=concreteSceneOf (oscDims c) (oscBackground c) (oscObjects c)
concreteCost :: SceneT -> Int
concreteCost=independentSceneCost

outObjJSON :: OutObj -> String
outObjJSON o=jobj [("id",show (ooId o)),("colour",show (ooColour o)),("x",show (ooX o)),("y",show (ooY o)),("pixels",show (ooSize o))
  ,("mask",jarr [jarr [show x,show y] | Coord x y<-S.toList (ooMask o)])
  ,("shape_alternatives",jarr [jobj [("text",jstr (shapeText e)),("c_ast",show (shapeCost e)),("signature",jstr (structureSignature e))] | e<-ooAlts o]),("alternatives_status",jstr (ooAltStatus o))]
oscJSON :: OutputSceneCandidate -> String
oscJSON c=jobj [("case_index",show (oscCase c)),("view",jstr (viewText (oscView c))),("dims",jarr [show (fst (oscDims c)),show (snd (oscDims c))])
  ,("background",jmaybe show (oscBackground c)),("background_kind",jstr (maybe "NoResidual" (const "UniformResidual") (oscBackground c))),("objects",jarr (map outObjJSON (oscObjects c)))
  ,("independent_cost",show (oscSceneCost c)),("reconstructed",jbool (oscReconstructed c)),("evidence",jstr (oscEvidence c)),("scene",sceneJSON (oscScene c))]
