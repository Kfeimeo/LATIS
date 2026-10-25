-- LATIS Stage C2: object-set transformations with executable semantics.
--
-- The v0.6.1 front end requires a bijection between input and output objects
-- (RankAlign). This module adds a typed, enumerable language of
-- Set[Object] -> Set[Object] transformations whose parameters are constants
-- shared by every training case or quantities computed from the INPUT scene:
--
--   ObjectTransform = (Selector, Others, Body)
--   Selector  = AllObjects | FilterBy Pred            which input objects are acted on
--   Others    = DropOthers | KeepOthers               what happens to the unselected ones
--   TBody     = MapEach PerObject                     0..k output objects per selected object
--             | MergeSelected MergeMode               the selected objects become ONE object
--             | CropSelected                          the selected objects translated to the
--                                                     bounding-box origin (the canvas comes from
--                                                     the size rule)
--   PerObject = Keep | RecolorTo c | Hollow t | FillBBox | Replicate k offset
--
-- Every predicate, count and offset is evaluated on the input only; the
-- output grid is a training target and a verification witness. Selections
-- that would need an arbitrary choice (non-unique maximum, non-unique colour
-- mode) fail explicitly instead of picking an element. Size-changing
-- constructions (Hollow, FillBBox, Merge) build NEW objects through the Shape
-- algebra; nothing casts an Object[sigma] to another sort.
--
-- A relation R <= O_in x O_out is NOT a program: `relationWitness` derives it
-- after the fact by matching the emitted objects (with their source ids) to
-- the actual output objects, and it is stored as evidence only.
module Synthesis.Collection.Relation
  ( Pred(..), Selector(..), Others(..), CountExpr(..), OffsetExpr(..), PerObject(..), MergeMode(..), TBody(..), ObjectTransform(..)
  , transformText, transformCost, transformConstants, usesShape
  , EmittedObject(..), emitObjects, evalPred, selectObjects
  , RelationWitness(..), relationWitness, witnessText
  , RelationGrammar(..), enumerateTransforms, SearchCase(..), SearchResult(..), searchTransforms
  , objColor, objMask, objArea
  , StageC(..), stageCOff
  , TransformStep(..), StepWitness(..), PipelineWitness(..), executePipeline, verifyPipeline
  , PixelContribution(..), RenderWitness(..), renderWitness, verifyRenderWitness
  , emitObjectsInput
  , migrateTransform, migrateCount, migrateOffset
  ) where

import Latent.Grid
import Latent.Render (render)
import qualified Latent.Object as O
import Synthesis.Collection.Shape
import qualified Data.Map.Strict as M
import qualified Data.Set as S
import Data.List (sortOn, nub, sort, group)
import Synthesis.Collection.Parameter
import Synthesis.Collection.Typed (asInt, tCost, tConstants, TVal(..), TExpr(..), TOp(..))
import Debug.Trace (traceEvent)

-- Stage C configuration block (carried by the front-end Config). Everything
-- off reproduces Stage A/B exactly: no view, no shape features, no relation
-- search, the Stage A size leaves only.
data StageC = StageC
  { scShape :: Bool                 -- C1: Shape predicates/constructors visible to the transformation grammar + shape audit
  , scDiagonalView :: Bool          -- C1: local 8-neighbourhood diagonal-bar view (encoder unchanged)
  , scRelations :: Bool             -- C2: Set[Object] -> Set[Object] transformation search
  , scObjectSizeFeatures :: Bool    -- C3.1: object-level leaves (unique largest/smallest bbox, set bbox, colours, cells) in the Size2 synthesis
  , scFallbackTrigger :: Bool       -- C3.5: open the relation search when the equal-count path fails (not only on cardinality mismatch)
  , scGoalDirected :: Bool          -- C4: goal-directed referent snapshot (Stage B graph restricted to the failing slot's query)
  , scRelationBudget :: Int         -- case executions per relation search
  , scRelationMaxFits :: Int        -- training-exact transformations kept as representatives
  , scRelationMaxCandidates :: Int  -- enumeration cap
  , scGaps :: [Int]                 -- replica gaps
  , scCounts :: [Int]               -- constant replica counts
  , scDecompBudget :: DecompBudget  -- Shape decomposition budget
  } deriving (Eq,Show)
stageCOff :: StageC
stageCOff=StageC False False False False False False 200000 50 20000 [0,1,2] [2,3,4] defaultDecompBudget

data Pred = ColorIs Int | IsMaxArea | IsMinArea | IsRect | IsSquare | IsShell | IsDiagonal | IsTriangle | ColorMostFrequent | ColorLeastFrequent | NotP Pred
  deriving (Eq,Ord,Show)
data Selector = AllObjects | FilterBy Pred deriving (Eq,Ord,Show)
data Others = DropOthers | KeepOthers deriving (Eq,Ord,Show)
-- Replication count: a shared constant or an input-side quantity.
--   KFitAcross g: copies that fit from the object to the right canvas edge with
--   gap g, i.e. (W_out - PosX) div (Width + g); KFitDown g likewise downward.
data CountExpr = KConst Int | KCountObjects | KCountColors | KFitAcross Int | KFitDown Int deriving (Eq,Ord,Show)
-- Replica step as a function of the object's own extent (gap g >= 0).
data OffsetExpr = StepRight Int | StepDown Int | StepLeft Int | StepUp Int | StepDiagonal Int deriving (Eq,Ord,Show)
data PerObject = Keep | RecolorTo Int | Hollow Int | FillBBox | Replicate CountExpr OffsetExpr deriving (Eq,Ord,Show)
data MergeMode = MergeUnion | MergeFillBBox deriving (Eq,Ord,Show)
data TBody = MapEach PerObject | MergeSelected MergeMode | CropSelected | Pipeline [TransformStep]
  | MigratedBody TBody [TransformStep] deriving (Eq,Ord,Show)
-- Positions are absolute coordinates; copy offsets are deltas. Legacy steps
-- retain their own cost and semantics, including shape reconstruction.
data TransformStep = MapPosition Param Param | MapColor Param | Copies Param Param Param
  | LegacyStep PerObject | SetMerge MergeMode | SetCrop deriving (Eq,Ord,Show)
data ObjectTransform = ObjectTransform { otSelector :: Selector, otOthers :: Others, otBody :: TBody } deriving (Eq,Ord,Show)

objColor :: O.Object -> Maybe Int
objColor=O.color
objMask :: O.Object -> ShapeMask
objMask=maskOfObject
objArea :: O.Object -> Int
objArea=O.size

predText :: Pred -> String
predText p=case p of
  ColorIs c->"Color == "++show c
  IsMaxArea->"Area == unique max"
  IsMinArea->"Area == unique min"
  IsRect->"IsRectangle(Shape)"
  IsSquare->"IsSquare(Shape)"
  IsShell->"IsShell(Shape)"
  IsDiagonal->"IsDiagonalBar(Shape)"
  IsTriangle->"IsTriangle(Shape)"
  ColorMostFrequent->"Color == unique most frequent colour"
  ColorLeastFrequent->"Color == unique least frequent colour"
  NotP q->"Not("++predText q++")"
countText :: CountExpr -> String
countText k=case k of
  KConst n->show n
  KCountObjects->"CountObjects(Input)"
  KCountColors->"CountColors(Input)"
  KFitAcross g->"(GridWidth(Output)-PosX) div (Width+"++show g++")"
  KFitDown g->"(GridHeight(Output)-PosY) div (Height+"++show g++")"
offsetText :: OffsetExpr -> String
offsetText o=case o of
  StepRight g->"(Width+"++show g++",0)"
  StepDown g->"(0,Height+"++show g++")"
  StepLeft g->"(-(Width+"++show g++"),0)"
  StepUp g->"(0,-(Height+"++show g++"))"
  StepDiagonal g->"(Width+"++show g++",Height+"++show g++")"
transformText :: ObjectTransform -> String
transformText (ObjectTransform sel others body)=
  "Select("++(case sel of AllObjects->"all"; FilterBy p->predText p)++")"
  ++(case sel of AllObjects->""; FilterBy _->case others of DropOthers->"; drop others"; KeepOthers->"; keep others")
  ++"; "++case body of
    MapEach Keep->"keep each"
    MapEach (RecolorTo c)->"recolor each to "++show c
    MapEach (Hollow t)->"each := Shell(Width,Height,"++show t++")"
    MapEach FillBBox->"each := Rectangle(Width,Height)"
    MapEach (Replicate k o)->"replicate each "++countText k++" times with step "++offsetText o
    MergeSelected MergeUnion->"merge selected: Union of cells (one object, uniform colour, 4-connected)"
    MergeSelected MergeFillBBox->"merge selected: Rectangle(bbox of selection), uniform colour"
    CropSelected->"crop to the bounding box of the selection"
    Pipeline ss->"pipeline "++show ss
    MigratedBody _ ss->"migrated pipeline "++show ss
-- Shared constants of a transformation (colour literals, constant counts, non-zero gaps).
transformConstants :: ObjectTransform -> Int
transformConstants (ObjectTransform sel _ body)=predK sel+bodyK body
  where predK AllObjects=0
        predK (FilterBy p)=go p
        go (ColorIs _)=1
        go (NotP q)=go q
        go _=0
        bodyK (MapEach (RecolorTo _))=1
        bodyK (MapEach (Hollow _))=1
        bodyK (MapEach (Replicate k o))=(case k of KConst _->1; KFitAcross g->if g>0 then 1 else 0; KFitDown g->if g>0 then 1 else 0; _->0)+(if gapOf o>0 then 1 else 0)
        bodyK (Pipeline ss)=sum (map stepConstants ss)
        bodyK (MigratedBody b _)=bodyK b
        bodyK _=0
        gapOf (StepRight g)=g
        gapOf (StepDown g)=g
        gapOf (StepLeft g)=g
        gapOf (StepUp g)=g
        gapOf (StepDiagonal g)=g
-- Structural cost: operation nodes plus 4 per shared constant (the scalar prior's literal penalty).
transformCost :: ObjectTransform -> Int
transformCost t@(ObjectTransform sel others body)=selC+othC+bodyC+4*transformConstants t
  where selC=case sel of AllObjects->0; FilterBy p->1+depth p
        depth (NotP q)=1+depth q
        depth _=0
        othC=case others of DropOthers->0; KeepOthers->1
        bodyC=case body of
          MapEach Keep->0
          MapEach (RecolorTo _)->1
          MapEach (Hollow _)->2
          MapEach FillBBox->2
          MapEach (Replicate _ _)->3
          MergeSelected _->2
          CropSelected->2
          Pipeline ss->sum (map stepCost ss)-4*sum (map stepConstants ss)
          MigratedBody b _->transformCost (ObjectTransform AllObjects DropOthers b)-4*transformConstants (ObjectTransform AllObjects DropOthers b)
usesShape :: ObjectTransform -> Bool
usesShape (ObjectTransform sel _ body)=predShape sel || bodyShape body
  where predShape (FilterBy p)=go p
        predShape AllObjects=False
        go (NotP q)=go q
        go p=p `elem` [IsRect,IsSquare,IsShell,IsDiagonal,IsTriangle]
        bodyShape (MapEach (Hollow _))=True
        bodyShape (MapEach FillBBox)=True
        bodyShape (MergeSelected _)=True
        bodyShape (Pipeline ss)=any (\s->case s of LegacyStep p->usesShape (ObjectTransform AllObjects DropOthers (MapEach p)); _->False) ss
        bodyShape (MigratedBody b _)=bodyShape b
        bodyShape _=False

-- Predicates are evaluated against the whole input object set (uniqueness).
evalPred :: [O.Object] -> Pred -> O.Object -> Either String Bool
evalPred objs p o=case p of
  ColorIs c->Right (objColor o==Just c)
  IsMaxArea->unique "maximum area" (maximum areas) (objArea o)
  IsMinArea->unique "minimum area" (minimum areas) (objArea o)
  IsRect->Right (isRectangle (objMask o))
  IsSquare->Right (isSquare (objMask o))
  IsShell->Right (isShell (objMask o))
  IsDiagonal->Right (isDiagonal (objMask o))
  IsTriangle->Right (isTriangle (objMask o))
  ColorMostFrequent->do c<-mode (sortOn (negate . fst) counts); Right (objColor o==Just c)
  ColorLeastFrequent->do c<-mode counts; Right (objColor o==Just c)
  NotP q->not <$> evalPred objs q o
  where
    areas=map objArea objs
    unique what m v=if length (filter (==m) areas)/=1 then Left ("selection by "++what++" is not unique") else Right (v==m)
    counts=sort [(length g,c) | g@(c:_)<-group (sort [c | ob<-objs, Just c<-[objColor ob]])]
    mode cs=case cs of
      ((n,c):rest) | not (any ((==n) . fst) rest)->Right c
      []->Left "no coloured object"
      _->Left "colour frequency mode is not unique"
selectObjects :: Selector -> [O.Object] -> Either String ([O.Object],[O.Object])
selectObjects AllObjects objs=Right (objs,[])
selectObjects (FilterBy p) objs=do
  flags<-traverse (evalPred objs p) objs
  Right ([o | (o,True)<-zip objs flags],[o | (o,False)<-zip objs flags])

data EmittedObject = EmittedObject { eoObject :: O.Object, eoSources :: [Int], eoOrigin :: String } deriving (Eq,Show)

-- Execute a transformation on an input scene; outDims is the realization canvas
-- (size rule). Failures are explicit (Left); nothing is clipped or skipped.
emitObjects :: ObjectTransform -> Dimensions -> [O.Object] -> Either String [EmittedObject]
emitObjects (ObjectTransform sel others body) outDims objs=do
  (chosen,rest)<-selectObjects sel objs
  let kept=[EmittedObject o [O.objectId o] "preserved (unselected)" | others==KeepOthers, o<-rest]
  made<-case body of
    MapEach f->concat <$> traverse (perObject f) chosen
    MergeSelected mode->merge mode chosen
    CropSelected->crop chosen
    Pipeline _->Left "pipeline requires explicit input dimensions: use emitObjectsInput"
    MigratedBody _ _->Left "migrated pipeline requires explicit input dimensions"
  Right (made++kept)
  where
    ncolors=length (nub [c | o<-objs, Just c<-[objColor o]])
    perObject Keep o=Right [EmittedObject o [O.objectId o] "preserved"]
    perObject (RecolorTo c) o=Right [EmittedObject (O.recolor o c) [O.objectId o] ("recolored to "++show c)]
    perObject (Hollow t) o=do
      c<-maybe (Left "Hollow requires a single-colour object") Right (objColor o)
      let m=objMask o
      if not (isRectangle m) then Left ("Hollow requires a solid rectangle; object "++show (O.objectId o)++" is not one")
        else do cells<-primCells (Shell (maskWidth m) (maskHeight m) t)
                Right [EmittedObject (fromCells (O.objectId o) (O.position o) c (S.toList cells)) [O.objectId o] ("constructed Shell(Width,Height,"++show t++")")]
    perObject FillBBox o=do
      c<-maybe (Left "FillBBox requires a single-colour object") Right (objColor o)
      cells<-primCells (Rectangle (O.width o) (O.height o))
      Right [EmittedObject (fromCells (O.objectId o) (O.position o) c (S.toList cells)) [O.objectId o] "constructed Rectangle(Width,Height)"]
    perObject (Replicate k off) o=do
      n<-countOf k o
      if n<1 then Left ("replication count "++show n++" < 1") else do
        let (dx,dy)=stepOf off o
        Right [EmittedObject (O.translate o (Vec (i*dx) (i*dy))) [O.objectId o] ("replica "++show i++" of "++show n) | i<-[0..n-1]]
    countOf k o=case k of
      KConst n->Right n
      KCountObjects->Right (length objs)
      KCountColors->Right ncolors
      KFitAcross g->safeDiv (gridWidth outDims-cx (O.position o)) (O.width o+g)
      KFitDown g->safeDiv (gridHeight outDims-cy (O.position o)) (O.height o+g)
    safeDiv _ 0=Left "legacy fit: division by zero"
    safeDiv a b=Right (a `div` b)
    stepOf off o=case off of
      StepRight g->(O.width o+g,0)
      StepDown g->(0,O.height o+g)
      StepLeft g->(-(O.width o+g),0)
      StepUp g->(0,-(O.height o+g))
      StepDiagonal g->(O.width o+g,O.height o+g)
    merge _ []=Left "merge of an empty selection"
    merge mode chosen=do
      c<-case nub [objColor o | o<-chosen] of
        [Just c]->Right c
        _->Left "merge colour conflict: the selected objects do not share one colour"
      let cells=[p | o<-chosen, (p,_)<-O.absolutePixels o]
          x0=minimum (map cx cells); y0=minimum (map cy cells)
          x1=maximum (map cx cells); y1=maximum (map cy cells)
          ids=sort (map O.objectId chosen)
      case mode of
        MergeUnion->
          let m=maskFromCells [(cx p,cy p) | p<-cells]
          in if maskConnected m then Right [EmittedObject (fromCells (minimum ids) (Coord x0 y0) c [(cx p-x0,cy p-y0) | p<-nub cells]) ids "merged: Union of the selected cells"]
             else Left "merged union is not 4-connected: not an object"
        MergeFillBBox->do
          rc<-primCells (Rectangle (x1-x0+1) (y1-y0+1))
          Right [EmittedObject (fromCells (minimum ids) (Coord x0 y0) c (S.toList rc)) ids "merged: Rectangle(bbox of the selection)"]
    crop []=Left "crop of an empty selection"
    crop chosen=
      let cells=[p | o<-chosen, (p,_)<-O.absolutePixels o]
          x0=minimum (map cx cells); y0=minimum (map cy cells)
      in Right [EmittedObject (O.translate o (Vec (-x0) (-y0))) [O.objectId o] "cropped to the selection bbox" | o<-chosen]
    fromCells i pos c cells=O.Object i pos (M.fromList [(Coord x y,c) | (x,y)<-cells]) 0

stepParams :: TransformStep -> [Param]
stepParams (MapPosition x y)=[x,y]
stepParams (MapColor c)=[c]
stepParams (Copies n x y)=[n,x,y]
stepParams (LegacyStep _) = []
stepParams (SetMerge _) = []
stepParams SetCrop = []
stepConstants :: TransformStep -> Int
stepConstants (LegacyStep p)=transformConstants (ObjectTransform AllObjects DropOthers (MapEach p))
stepConstants s=sum (map (tConstants . paramExpr) (stepParams s))
stepCost :: TransformStep -> Int
stepCost (LegacyStep p)=transformCost (ObjectTransform AllObjects DropOthers (MapEach p))
stepCost s=(case s of Copies {}->3; _->1)+sum (map (tCost . paramExpr) (stepParams s))

data StepWitness = StepWitness
  { swStep :: Int, swInput :: [EmittedObject], swOutput :: [EmittedObject]
  , swBindings :: [[TVal]] } deriving (Eq,Show)
data PipelineWitness = PipelineWitness
  { pwSteps :: [StepWitness], pwEmitted :: [EmittedObject] } deriving (Eq,Show)

-- The original input set and selected set remain fixed. CurrentObject is the
-- result of the preceding step. Copy role is explicit in eoOrigin; there is
-- no Previous observer and no accidental ordering witness.
executePipeline :: ObjectTransform -> Dimensions -> Dimensions -> [O.Object] -> Either String PipelineWitness
executePipeline t@(ObjectTransform _ _ (Pipeline steps)) i o xs=executeSteps False t steps i o xs
executePipeline t@(ObjectTransform sel others (MigratedBody old steps)) i o xs=
  if migrateTransform (ObjectTransform sel others old)==Right t then executeSteps True t steps i o xs
    else Left "migration annotation does not match executable typed steps"
executePipeline _ _ _ _=Left "not a pipeline"

executeSteps :: Bool -> ObjectTransform -> [TransformStep] -> Dimensions -> Dimensions -> [O.Object] -> Either String PipelineWitness
executeSteps legacyOrder (ObjectTransform sel others _) steps inDims outDims objs=do
  if null steps || length steps>2 then Left "pipeline depth must be 1..2" else Right ()
  if any (\n->n<1 || n>30) [gridWidth inDims,gridHeight inDims,gridWidth outDims,gridHeight outDims]
    then Left "invalid ARC SizeSig/canvas" else Right ()
  mapM_ validObject objs
  if length (nub (map O.objectId objs))/=length objs then Left "duplicate input source ids" else Right ()
  (selected,rest)<-selectObjects sel (if legacyOrder then objs else sortOn objectKey objs)
  let initial=[EmittedObject o [O.objectId o] "input" | o<-selected]
      kept=[EmittedObject o [O.objectId o] "preserved (unselected)" | others==KeepOthers, o<-rest]
      walk _ es [] ws=Right (PipelineWitness (reverse ws) (es++kept))
      walk i es (s:ss) ws=do
        mapM_ (checkKind s) [()]
        pairs<-case s of
          SetMerge m->setOperation (MergeSelected m) es
          SetCrop->setOperation CropSelected es
          _->traverse (applyStep selected s) es
        let next=concatMap fst pairs
        if not legacyOrder && length next>900 then Left "budget: emitted objects > 900" else Right ()
        mapM_ (validObject . eoObject) next
        walk (i+1) next ss (StepWitness i es next (map snd pairs):ws)
      checkKind s _=
        let expected=case s of MapPosition {}->[IntegerParam,IntegerParam]; MapColor {}->[ArcColor]; Copies {}->[PositiveCount,IntegerParam,IntegerParam]; _->[]
        in if map paramRefinement (stepParams s)==expected then Right () else Left "step parameter refinement mismatch"
      setOperation body es=do
        ms<-emitObjects (ObjectTransform AllObjects DropOthers body) outDims (map eoObject es)
        let sources ids=sort (nub (concat [eoSources e | e<-es, O.objectId (eoObject e) `elem` ids]))
        Right [( [m {eoSources=sources (eoSources m)} | m<-ms],[])]
      applyStep chosen s e=do
        let o=eoObject e
            ctx=ParamContext inDims outDims objs chosen o
        vs<-traverse (evalParam ctx) (stepParams s)
        ns<-traverse asInt vs
        made<-case (s,ns) of
          (MapPosition _ _,[x,y])->Right [EmittedObject (o {O.position=Coord x y}) (eoSources e) (eoOrigin e++"; position")]
          (MapColor _,[c])->Right [EmittedObject (O.recolor o c) (eoSources e) (eoOrigin e++"; colour")]
          (Copies _ _ _,[n,dx,dy])
            | not legacyOrder && n>900->Left "budget: copy count > 900"
            | otherwise->Right [EmittedObject (O.translate o (Vec (k*dx) (k*dy))) (eoSources e) (eoOrigin e++"; copy="++show k++"/"++show n) | k<-[0..n-1]]
          (LegacyStep p,[])->do
            -- Restrict legacy local bridge to operations independent of set
            -- cardinality. Full legacy transforms still use the original path.
            case p of Replicate {}->Left "legacy replicate requires whole-set bridge"; _->Right ()
            ms<-emitObjects (ObjectTransform AllObjects DropOthers (MapEach p)) outDims [o]
            Right [m {eoSources=eoSources e,eoOrigin=eoOrigin e++"; "++eoOrigin m} | m<-ms]
          _->Left "step arity mismatch"
        Right (made,vs)
  walk 0 initial steps []
  where
    objectKey o=(O.absolutePixels o,O.objectId o)
    validObject o
      | O.width o<1 || O.height o<1 || (not legacyOrder && not (maskConnected (objMask o) || isDiagonal (objMask o)))=Left "invalid object SizeSig/connectivity"
      | any (\(_,c)->c<0 || c>9) (O.absolutePixels o)=Left "invalid object colour"
      | otherwise=Right ()

-- Recompute rather than trusting stored text/bindings. Render evidence below
-- has an independent pixel replay checker as well.
verifyPipeline :: ObjectTransform -> Dimensions -> Dimensions -> [O.Object] -> PipelineWitness -> Bool
verifyPipeline t i o xs w=executePipeline t i o xs==Right w

emitObjectsInput :: ObjectTransform -> Dimensions -> Dimensions -> [O.Object] -> Either String [EmittedObject]
emitObjectsInput t@(ObjectTransform _ _ (Pipeline _)) i o xs=pwEmitted <$> executePipeline t i o xs
emitObjectsInput t@(ObjectTransform _ _ (MigratedBody _ _)) i o xs=pwEmitted <$> executePipeline t i o xs
emitObjectsInput t _ o xs=emitObjects t o xs

-- Compatibility primitives expose the old quotient as an input-side feature;
-- all other arithmetic remains ordinary A expressions. Original prior and
-- render priority are explicit metadata, never inferred from a VSA wrapper.
migrateCount :: CountExpr -> Either String Param
migrateCount k=checkedParam PositiveCount $ case k of
  KConst n->TConst (VI n)
  KCountObjects->TLeaf WholeCount
  KCountColors->TLeaf WholeObjectColors
  KFitAcross g->TLeaf (LegacyFitAcross g)
  KFitDown g->TLeaf (LegacyFitDown g)
migrateOffset :: OffsetExpr -> Either String (Param,Param)
migrateOffset off=do
  let zero=TConst (VI 0)
      ext leaf g=TApp OpAdd [TLeaf leaf,TConst (VI g)]
      neg e=TApp OpSub [zero,e]
      (x,y)=case off of
        StepRight g->(ext CurrentWidth g,zero)
        StepDown g->(zero,ext CurrentHeight g)
        StepLeft g->(neg (ext CurrentWidth g),zero)
        StepUp g->(zero,neg (ext CurrentHeight g))
        StepDiagonal g->(ext CurrentWidth g,ext CurrentHeight g)
  (,) <$> checkedParam IntegerParam x <*> checkedParam IntegerParam y
migrateTransform :: ObjectTransform -> Either String ObjectTransform
migrateTransform t@(ObjectTransform sel others body)=do
  ss<-case body of
    MapEach (Replicate n delta)->do
      p<-migrateCount n; (x,y)<-migrateOffset delta; Right [Copies p x y]
    MapEach (RecolorTo c)->do p<-checkedParam ArcColor (TConst (VI c)); Right [MapColor p]
    MapEach p->Right [LegacyStep p]
    MergeSelected m->Right [SetMerge m]
    CropSelected->Right [SetCrop]
    Pipeline _->Left "already typed"
    MigratedBody _ _->Left "already migrated"
  let migrated=ObjectTransform sel others (MigratedBody body ss)
  if transformCost migrated==transformCost t then Right migrated else Left "migration prior mismatch"

data PixelContribution = PixelContribution
  { pixelEmission :: Int, pixelSources :: [Int], pixelPosition :: Coord, pixelColor :: Int } deriving (Eq,Show)
data RenderWitness = RenderWitness
  { renderContributions :: [PixelContribution], renderResult :: Grid } deriving (Eq,Show)
renderWitness :: Dimensions -> Int -> [EmittedObject] -> Either String RenderWitness
renderWitness dims bg es=do
  let ps=[PixelContribution i (eoSources e) p c | (i,e)<-zip [0..] es, (p,c)<-O.absolutePixels (eoObject e)]
  g<-render (O.Scene dims bg (map eoObject es))
  Right (RenderWitness ps g)
verifyRenderWitness :: Dimensions -> Int -> [EmittedObject] -> RenderWitness -> Bool
verifyRenderWitness dims bg es w=
  bg>=0 && bg<=9 && gridWidth dims>0 && gridHeight dims>0
  && all (\p->pixelColor p>=0 && pixelColor p<=9) expected
  && renderContributions w==expected && all (inBounds dims . pixelPosition) expected
  && dimensions (renderResult w)==dims
  && all (\p->cell (renderResult w) p==Just (M.findWithDefault bg p final)) (coords dims)
  where
    expected=[PixelContribution i (eoSources e) p c | (i,e)<-zip [0..] es, (p,c)<-O.absolutePixels (eoObject e)]
    final=foldl (\m p->M.insert (pixelPosition p) (pixelColor p) m) M.empty expected

-- Relation evidence: emitted objects matched to the actual output objects by
-- exact absolute cells and colour. Input ids that are a source of no matched
-- emitted object are "deleted"; output objects matched by no emitted object
-- are "unexplained"; an emitted object with several sources is a merge, a
-- source with several matched emitted objects a split/replication.
data RelationWitness = RelationWitness
  { rwInputs, rwOutputs :: Int, rwPairs :: [([Int],Int)], rwDeleted :: [Int], rwUnexplainedOutputs :: [Int], rwUnmatchedEmitted :: Int, rwKinds :: [String] } deriving (Eq,Show)
relationWitness :: [O.Object] -> [EmittedObject] -> [O.Object] -> RelationWitness
relationWitness ins emitted outs=
  let key o=S.fromList (O.absolutePixels o)
      outIndex=M.fromList [(key o,O.objectId o) | o<-outs]
      matched=[(eoSources e,j) | e<-emitted, Just j<-[M.lookup (key (eoObject e)) outIndex]]
      explained=S.fromList (map snd matched)
      used=S.fromList (concatMap fst matched)
      deleted=[O.objectId o | o<-ins, not (S.member (O.objectId o) used)]
      perSource=M.fromListWith (+) [(src,1::Int) | (ss,_)<-matched, src<-ss]
      kinds=nub ([if length ss>1 then "many-to-one" else "one-to-one" | (ss,_)<-matched]
        ++["one-to-many" | (_,n)<-M.toList perSource, n>1]
        ++["deletion" | not (null deleted)]
        ++["generated-without-source" | (ss,_)<-matched, null ss])
  in RelationWitness (length ins) (length outs) matched deleted [O.objectId o | o<-outs, not (S.member (O.objectId o) explained)] (length emitted-length matched) kinds
witnessText :: RelationWitness -> String
witnessText w="R: "++show (rwInputs w)++" input -> "++show (rwOutputs w)++" output objects; pairs "++show (rwPairs w)++"; deleted "++show (rwDeleted w)
  ++"; unexplained outputs "++show (rwUnexplainedOutputs w)++"; kinds "++show (rwKinds w)

-- Bounded, deterministic enumeration. Colours come from the training scenes
-- (constants shared by every case); shape predicates/constructors only when the
-- Shape algebra is enabled; the diagonal predicate only with the local view.
data RelationGrammar = RelationGrammar
  { rgColors :: [Int], rgShape :: Bool, rgDiagonal :: Bool, rgGaps :: [Int], rgCounts :: [Int], rgMaxCandidates :: Int } deriving (Eq,Show)
enumerateTransforms :: RelationGrammar -> [ObjectTransform]
enumerateTransforms g=take (rgMaxCandidates g) (sortOn (\t->(transformCost t,t)) (nub candidates))
  where
    basePreds=[ColorIs c | c<-rgColors g]++[IsMaxArea,IsMinArea,ColorMostFrequent,ColorLeastFrequent]
      ++[p | rgShape g, p<-[IsRect,IsSquare,IsShell,IsTriangle]]++[IsDiagonal | rgShape g, rgDiagonal g]
    preds=basePreds++map NotP basePreds
    selectors=[(AllObjects,DropOthers)]++[(FilterBy p,o) | p<-preds, o<-[DropOthers,KeepOthers]]
    perObject=[Keep]++[RecolorTo c | c<-rgColors g]++[p | rgShape g, p<-[Hollow 1,FillBBox]]
      ++[Replicate k o | k<-[KConst n | n<-rgCounts g]++[KCountObjects,KCountColors]++[f gp | f<-[KFitAcross,KFitDown], gp<-rgGaps g]
                       , o<-[f gp | f<-[StepRight,StepDown,StepLeft,StepUp,StepDiagonal], gp<-rgGaps g]]
    bodies=map MapEach perObject++[MergeSelected m | rgShape g, m<-[MergeUnion,MergeFillBBox]]++[CropSelected]
    candidates=[ObjectTransform s o b | (s,o)<-selectors, b<-bodies
               -- "keep each" with every object selected is the identity; "keep others" + "keep each" is the identity too
               , not (b==MapEach Keep && (s==AllObjects || o==KeepOthers))
               , not (b==CropSelected && o==KeepOthers)]

data SearchCase = SearchCase { scInputs :: [O.Object], scOutDims :: Dimensions, scBackground :: Int, scTarget :: Grid } deriving (Show)
data SearchResult = SearchResult
  { srFits :: [(ObjectTransform,[[EmittedObject]])]   -- training-exact transformations with the emitted objects per case
  , srCandidates, srTried, srExecutions :: Int, srTruncated :: Bool, srFirstExecutions :: Maybe Int } deriving (Show)
-- Every candidate is executed on every training case (early exit on the first
-- mismatch) and compared by the final whole-grid exact check; budget = number
-- of case executions; all fits within the budget survive as representatives.
searchTransforms :: Int -> Int -> [ObjectTransform] -> [SearchCase] -> SearchResult
searchTransforms budget maxFits candidates cases=go candidates 0 0 [] Nothing
  where
    go [] tried execs fits first=SearchResult (reverse fits) (length candidates) tried execs False first
    go (t:ts) tried execs fits first
      | execs>=budget || length fits>=maxFits = SearchResult (reverse fits) (length candidates) tried execs True first
      | otherwise =
          let (ok,n,emitted)=runCases t cases 0 []
              first'=case first of Nothing | ok->Just (execs+n); _->first
          in if ok then traceEvent "latis-train-exact" (go ts (tried+1) (execs+n) ((t,reverse emitted):fits) first')
             else go ts (tried+1) (execs+n) fits first'
    runCases _ [] n acc=(True,n,acc)
    runCases t (c:cs) n acc=
      case emitObjects t (scOutDims c) (scInputs c) of
        Left _->(False,n+1,acc)
        Right es->case render (O.Scene (scOutDims c) (scBackground c) (map eoObject es)) of
          Right gr | gr==scTarget c->runCases t cs (n+1) (es:acc)
          _->(False,n+1,acc)
