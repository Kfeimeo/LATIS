-- LATIS Stage E2-D: Region programs (whole-region values and operations)
-- executed on the raw grid through a scene + partition tree.
--
--   RegionProgram = RegionProgram { view, selector, action }
--   selector picks ONE region of the lazily expanded tree (explicit, unique
--   or explicit failure), action produces the output grid:
--     CropRegion            output = raw window of the region's bounds (content-first crop)
--     PreserveExcept edit   output = input with `edit` applied inside the selected region only
--     TranslateRegion dx dy output = input with the region's non-background content moved by (dx,dy)
--                           inside the canvas (vacated cells take the scene background; moving
--                           outside the canvas or onto another object fails)
--     StampAtMarkers src    output = input with the content of region `src` copied so that its
--                           top-left lands on every 1-pixel object inside the selected region
--                           (cross-region read: src is read, the selected region is written)
--   edit ::= RecolorObjects c | ClearRegion | FillRegion c
--
-- Selectors are region predicates evaluated on INPUT-only tree properties
-- (role, depth, area order, object counts, colour presence); ties fail.
-- The read/write scopes of every program are declared (effect classes) and
-- used by the safe pruning in Search.
module Synthesis.Collection.Region.Program
  ( RegionSelector(..), RegionEdit(..), RegionAction(..), RegionProgram(..), EffectClass(..)
  , selectorText, actionText, programText, programCost, programJSON, programEffect
  , selectRegion, runRegionProgram, runRegionProgramOn, RegionExec(..), regionExecJSON, treeFor, enumerateSelectors, enumerateActions
  ) where

import Latent.Grid
import Synthesis.Collection.Region.Scene
import Synthesis.Collection.Region.Partition
import Synthesis.Collection.Region.ShapeMDL (defaultMDLBudget)
import Synthesis.Collection.Geometry.View (ViewId(..), viewText, viewIdJSON)
import Synthesis.Collection.Geometry.Cover (PixelSet, Rect(..), rectJSON)
import Synthesis.Collection.Diagnostics (jstr, jobj, jarr, jbool, jmaybe, stableHash)
import qualified Data.Set as S
import qualified Data.Map.Strict as M
import Data.List (sortOn, nub)

data RegionSelector
  = SelRoot                       -- the whole canvas
  | SelLargestContent             -- unique largest content region at depth 1
  | SelSmallestContent
  | SelContentWithObjects         -- unique depth-1 content region that contains at least one object
  | SelContentWithoutObjects      -- unique depth-1 content region that contains no object
  | SelContentWithColor Int       -- unique depth-1 content region whose pixels contain colour c
  | SelContentWithObjectCount Int -- unique depth-1 content region with exactly n objects
  deriving (Eq,Ord,Show)
data RegionEdit = RecolorObjects Int | ClearRegion | FillRegion Int deriving (Eq,Ord,Show)
data RegionAction = CropRegion | PreserveExcept RegionEdit | TranslateRegion Int Int | StampAtMarkers RegionSelector deriving (Eq,Ord,Show)
data RegionProgram = RegionProgram { rpView :: ViewId, rpSelector :: RegionSelector, rpAction :: RegionAction } deriving (Eq,Ord,Show)
data EffectClass = EffectLocal | EffectSelection | EffectCrossRegion | EffectUnknown deriving (Eq,Ord,Show)

selectorText :: RegionSelector -> String
selectorText s=case s of
  SelRoot->"Root"; SelLargestContent->"UniqueLargestContent"; SelSmallestContent->"UniqueSmallestContent"
  SelContentWithObjects->"UniqueContentWithObjects"; SelContentWithoutObjects->"UniqueContentWithoutObjects"
  SelContentWithColor c->"UniqueContentWithColor("++show c++")"; SelContentWithObjectCount n->"UniqueContentWithObjectCount("++show n++")"
actionText :: RegionAction -> String
actionText a=case a of
  CropRegion->"CropRegion"; PreserveExcept e->"PreserveExcept("++show e++")"; TranslateRegion dx dy->"TranslateRegion("++show dx++","++show dy++")"
  StampAtMarkers s->"StampAtMarkers(source="++selectorText s++")"
programText :: RegionProgram -> String
programText p=actionText (rpAction p)++"[Region <- "++selectorText (rpSelector p)++"] @ "++viewText (rpView p)
-- Structural cost: selector nodes + action nodes + 4 per shared constant.
programCost :: RegionProgram -> Int
programCost (RegionProgram v s a)=selC s+actC a+(if v==LegacyView then 0 else 1)
  where selC SelRoot=0; selC (SelContentWithColor _)=1+4; selC (SelContentWithObjectCount _)=1+4; selC _=1
        actC CropRegion=1; actC (PreserveExcept e)=2+editC e; actC (TranslateRegion _ _)=2+8; actC (StampAtMarkers s')=3+selC s'
        editC (RecolorObjects _)=4; editC ClearRegion=0; editC (FillRegion _)=4
programJSON :: RegionProgram -> String
programJSON p=jobj [("kind",jstr "RegionProgram"),("view",viewIdJSON (rpView p)),("selector",jstr (selectorText (rpSelector p))),("action",jstr (actionText (rpAction p))),("text",jstr (programText p)),("cost",show (programCost p)),("effect",jstr (show (programEffect p))),("program_id",jstr (stableHash (show p)))]
-- Declared effect class: what the action reads and writes.
programEffect :: RegionProgram -> EffectClass
programEffect p=case rpAction p of
  CropRegion->EffectSelection
  PreserveExcept _->EffectLocal
  TranslateRegion _ _->EffectLocal
  StampAtMarkers _->EffectCrossRegion

-- Lazily expanded tree of a grid under a view (root split once; content
-- children of the root further expanded up to the budget).
treeFor :: PartitionBudget -> ViewId -> Grid -> Either String RegionTree
treeFor b v g=do
  sc<-sceneFromView defaultMDLBudget False v g
  let t0=rootNode sc
      (t1,_)=expandLazy b t0
  Right t1

depth1Content :: RegionTree -> [RegionNode]
depth1Content t=[n | n<-M.elems (rtNodes t), rnRole n==RoleContent, rnDepth n==1]

-- Unique selection or explicit failure with the cardinality.
selectRegion :: RegionSelector -> RegionTree -> Either String RegionNode
selectRegion SelRoot t=maybe (Left "no root") Right (M.lookup 0 (rtNodes t))
selectRegion s t=
  let cs=depth1Content t
      g=shGrid (rtScene t)
      colours n=S.fromList [c | p<-S.toList (rnPixels n), Just c<-[cell g p]]
      unique what xs=case xs of
        [n]->Right n
        []->Left (what++": no depth-1 content region matches ("++show (length cs)++" content regions)")
        ns->Left (what++": not unique: "++show (length ns)++" regions match "++show (map rnId ns)++"; no implicit choice")
      extremum what f=case sortOn f cs of
        (a:b:_) | f a==f b->Left (what++": tie between regions "++show (rnId a)++" and "++show (rnId b))
        (a:_)->Right a
        []->Left (what++": no content region")
  in if null cs then Left (selectorText s++": the root was not split (no legal separator)") else case s of
       SelLargestContent->extremum "UniqueLargestContent" (negate . regionArea)
       SelSmallestContent->extremum "UniqueSmallestContent" regionArea
       SelContentWithObjects->unique "UniqueContentWithObjects" [n | n<-cs, not (null (rnObjects n))]
       SelContentWithoutObjects->unique "UniqueContentWithoutObjects" [n | n<-cs, null (rnObjects n)]
       SelContentWithColor c->unique ("UniqueContentWithColor "++show c) [n | n<-cs, S.member c (colours n)]
       SelContentWithObjectCount k->unique ("UniqueContentWithObjectCount "++show k) [n | n<-cs, length (rnObjects n)==k]
       SelRoot->Left "unreachable"

data RegionExec = RegionExec { reProgram :: RegionProgram, reRegion :: Int, reRegionArea :: Int, reRegionBounds :: Maybe Rect, reReadRegions :: [Int], reWriteRegions :: [Int], reOutput :: Grid, reNote :: String } deriving (Eq,Show)

runRegionProgram :: PartitionBudget -> RegionProgram -> Grid -> Either String RegionExec
runRegionProgram b p g=do
  t<-treeFor b (rpView p) g
  runRegionProgramOn t p

-- Execution on an already built tree (the search builds every (case, view)
-- tree once and shares it across candidates; the program semantics are the
-- same as runRegionProgram).
runRegionProgramOn :: RegionTree -> RegionProgram -> Either String RegionExec
runRegionProgramOn t p=do
  if shView (rtScene t)/=rpView p then Left "tree view differs from the program view" else Right ()
  n<-selectRegion (rpSelector p) t
  let g=shGrid (rtScene t)
      sc=rtScene t
      bgColour=case shBackground sc of UniformResidual c->Just c; NoResidual->Nothing
      dims=dimensions g
      objsIn r=[o | o<-shObjects sc, poSupport o `S.isSubsetOf` r]
      -- the objects a region-level edit acts on: objects inside the region except the
      -- separator object that produced the region's own children (a shared rule over
      -- the content regions must not recolour the separator)
      editObjs=[o | o<-objsIn (rnPixels n), Just (poId o)/=rnSplitObject n || null (rnChildren n)]
      base=RegionExec p (rnId n) (regionArea n) (regionBoundsOf n) [rnId n] [] g ""
  case rpAction p of
    CropRegion->do
      r<-maybe (Left "empty region") Right (regionBoundsOf n)
      out<-mkGrid [[maybe 0 id (cell g (Coord x y)) | x<-[rx0 r..rx1 r]] | y<-[ry0 r..ry1 r]]
      Right base {reOutput=out,reWriteRegions=[],reNote="raw window of the region bounds (every colour inside)"}
    PreserveExcept e->do
      cells<-case e of
        RecolorObjects c->Right [(q,c) | o<-editObjs, q<-S.toList (poSupport o)]
        ClearRegion->do bg<-maybe (Left "ClearRegion needs a residual background colour (NoResidual scene)") Right bgColour; Right [(q,bg) | q<-S.toList (rnPixels n)]
        FillRegion c->Right [(q,c) | q<-S.toList (rnPixels n)]
      let m=M.fromList cells
      out<-mkGrid [[maybe (maybe 0 id (cell g (Coord x y))) id (M.lookup (Coord x y) m) | x<-[0..gridWidth dims-1]] | y<-[0..gridHeight dims-1]]
      Right base {reOutput=out,reWriteRegions=[rnId n],reNote="all other regions preserved pixel for pixel"}
    TranslateRegion dx dy->do
      bg<-maybe (Left "TranslateRegion needs a residual background colour") Right bgColour
      let content=[(q,c) | o<-objsIn (rnPixels n), (q,c)<-M.toList (poColors o)]
          moved=[(add q (Vec dx dy),c) | (q,c)<-content]
      if null content then Left "TranslateRegion: the region has no objects" else Right ()
      if any (\(q,_)->not (inBounds dims q)) moved then Left "TranslateRegion: content would leave the canvas" else Right ()
      if any (\(q,_)->S.notMember q (rnPixels n) && cell g q/=Just bg) moved then Left "TranslateRegion: destination overlaps another object outside the region" else Right ()
      let vac=M.fromList [(q,bg) | (q,_)<-content]
          m=M.union (M.fromList moved) vac
      out<-mkGrid [[maybe (maybe 0 id (cell g (Coord x y))) id (M.lookup (Coord x y) m) | x<-[0..gridWidth dims-1]] | y<-[0..gridHeight dims-1]]
      Right base {reOutput=out,reWriteRegions=nub (rnId n:[rnId k | k<-M.elems (rtNodes t), any (\(q,_)->S.member q (rnPixels k)) moved, rnDepth k==rnDepth n]),reNote="objects of the region moved by the offset; vacated cells take the residual colour"}
    StampAtMarkers srcSel->do
      src<-selectRegion srcSel t
      if rnId src==rnId n then Left "StampAtMarkers: source and target are the same region" else Right ()
      let pattern=[(q,c) | o<-objsIn (rnPixels src), (q,c)<-M.toList (poColors o)]
          markers=[o | o<-objsIn (rnPixels n), S.size (poSupport o)==1]
      if null pattern then Left "StampAtMarkers: source region has no objects" else Right ()
      if null markers then Left "StampAtMarkers: target region has no 1-pixel markers" else Right ()
      let px=minimum [cx q | (q,_)<-pattern]; py=minimum [cy q | (q,_)<-pattern]
          stamps=[(Coord (cx q-px+mx) (cy q-py+my),c) | o<-markers, let Coord mx my=S.findMin (poSupport o), (q,c)<-pattern]
      if any (\(q,_)->not (inBounds dims q)) stamps then Left "StampAtMarkers: a stamp leaves the canvas" else Right ()
      if any (\(q,_)->S.notMember q (rnPixels n)) stamps then Left "StampAtMarkers: a stamp leaves the target region" else Right ()
      let m=M.fromList stamps
      out<-mkGrid [[maybe (maybe 0 id (cell g (Coord x y))) id (M.lookup (Coord x y) m) | x<-[0..gridWidth dims-1]] | y<-[0..gridHeight dims-1]]
      Right base {reOutput=out,reReadRegions=[rnId src,rnId n],reWriteRegions=[rnId n],reNote="pattern read from the source region, written at every marker of the target region"}

regionExecJSON :: RegionExec -> String
regionExecJSON e=jobj [("program",programJSON (reProgram e)),("region_id",show (reRegion e)),("region_area",show (reRegionArea e)),("region_bounds",jmaybe rectJSON (reRegionBounds e))
  ,("read_regions",show (reReadRegions e)),("write_regions",show (reWriteRegions e)),("note",jstr (reNote e)),("output_dims",let Dimensions w h=dimensions (reOutput e) in jarr [show w,show h])]
  where _=jbool

-- Finite enumeration of selectors (colour constants from the input scenes)
-- and actions; the search orders them by cost and layer.
enumerateSelectors :: [Int] -> [RegionSelector]
enumerateSelectors colours=[SelRoot,SelLargestContent,SelSmallestContent,SelContentWithObjects,SelContentWithoutObjects]++[SelContentWithColor c | c<-colours]++[SelContentWithObjectCount k | k<-[1,2,3]]
enumerateActions :: [Int] -> [RegionSelector] -> [RegionAction]
enumerateActions colours sels=[CropRegion]++[PreserveExcept e | e<-ClearRegion:[RecolorObjects c | c<-colours]++[FillRegion c | c<-colours]]
  ++[TranslateRegion dx dy | (dx,dy)<-[(1,0),(-1,0),(0,1),(0,-1),(2,0),(0,2),(-2,0),(0,-2)]]++[StampAtMarkers s | s<-sels, s/=SelRoot]

_unused :: PixelSet -> ()
_unused _=()
