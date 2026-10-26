-- LATIS Stage A: grid size as a first-class typed feature and the Size2 rule.
--
--   GridWidth  : Grid -> NatPos
--   GridHeight : Grid -> NatPos
--   GridSize   : Grid -> Size2,  Size2 = (NatPos, NatPos) in (width, height) order
--
-- During training the OUTPUT width/height are ground-truth targets only; the
-- synthesized rule reads input-side grid features (GridWidth, GridHeight,
-- CountObjects, CountShapes of the input) and shared constants. Width and
-- height are synthesized separately and packed into one Size2 rule whose
-- realization creates the output canvas before any object placement. A size
-- outside the ARC range 1..30 is a realization failure, never clipped.
module Synthesis.Collection.Size
  ( GFeat(..), gridLeaves, gridLeavesC, gridValue, gridFeatureName, natPosRange
  , SizeRule(..), SizeStats(..), synthesizeSize, outputSize, sizeRuleText, sizeIdentity
  ) where

import Latent.Grid
import qualified Latent.Object as O
import Synthesis.Collection.Indexed (objectSet, count, shapeCount)
import Synthesis.Collection.Typed
import qualified Data.Set as S
import qualified Data.Map.Strict as M

-- Stage A grid features (GWidth..GShapes) and, Stage C3.1, object-level
-- features reachable through a LEGAL selector or aggregate: the bounding box of
-- the unique largest / unique smallest object (non-unique -> explicit failure,
-- never "some object"), the bounding box of the whole object set, the number
-- of colours and the number of foreground cells. They are visible only when
-- the Stage C object-feature flag is set (gridLeavesC True).
data GFeat = GWidth | GHeight | GCount | GShapes | GLargestW | GLargestH | GSmallestW | GSmallestH | GSetW | GSetH | GColors | GPixels
  deriving (Eq,Ord,Show,Enum,Bounded)
gridFeatureName :: GFeat -> String
gridFeatureName GWidth="GridWidth(Input)"
gridFeatureName GHeight="GridHeight(Input)"
gridFeatureName GCount="CountObjects(Input)"
gridFeatureName GShapes="CountShapes(Input)"
gridFeatureName GLargestW="Width(UniqueLargest(Objects(Input)))"
gridFeatureName GLargestH="Height(UniqueLargest(Objects(Input)))"
gridFeatureName GSmallestW="Width(UniqueSmallest(Objects(Input)))"
gridFeatureName GSmallestH="Height(UniqueSmallest(Objects(Input)))"
gridFeatureName GSetW="Width(BBox(Objects(Input)))"
gridFeatureName GSetH="Height(BBox(Objects(Input)))"
gridFeatureName GColors="CountColors(Input)"
gridFeatureName GPixels="CountCells(Input)"
gridLeaves :: [(GFeat,TTy)]
gridLeaves=[(f,TyInt) | f<-[GWidth,GHeight,GCount,GShapes]]
gridLeavesC :: Bool -> [(GFeat,TTy)]
gridLeavesC objectFeatures=gridLeaves++[(f,TyInt) | objectFeatures, f<-[GLargestW ..]]
gridValue :: Bool -> O.Scene -> GFeat -> Either String TVal
gridValue _ s GWidth=Right (VI (gridWidth (O.canvas s)))
gridValue _ s GHeight=Right (VI (gridHeight (O.canvas s)))
gridValue _ s GCount=Right (VI (count (objectSet (O.objects s))))
gridValue dep s GShapes=Right (VI (shapeCount dep (objectSet (O.objects s))))
gridValue _ s GLargestW=VI . O.width <$> uniqueBy "largest" maximum s
gridValue _ s GLargestH=VI . O.height <$> uniqueBy "largest" maximum s
gridValue _ s GSmallestW=VI . O.width <$> uniqueBy "smallest" minimum s
gridValue _ s GSmallestH=VI . O.height <$> uniqueBy "smallest" minimum s
gridValue _ s GSetW=(\(w,_)->VI w) <$> setBBox s
gridValue _ s GSetH=(\(_,h)->VI h) <$> setBBox s
gridValue _ s GColors=Right (VI (S.size (S.fromList [c | o<-O.objects s, c<-M.elems (O.geometry o)])))
gridValue _ s GPixels=Right (VI (sum (map O.size (O.objects s))))
uniqueBy :: String -> ([Int] -> Int) -> O.Scene -> Either String O.Object
uniqueBy what pick s=case O.objects s of
  []->Left ("no object for the "++what++" selector")
  os->let m=pick (map O.size os) in case [o | o<-os, O.size o==m] of
    [o]->Right o
    _->Left ("the "++what++" object is not unique")
setBBox :: O.Scene -> Either String (Int,Int)
setBBox s=case concatMap (map fst . O.absolutePixels) (O.objects s) of
  []->Left "bounding box of an empty object set"
  ps->Right (maximum (map cx ps)-minimum (map cx ps)+1,maximum (map cy ps)-minimum (map cy ps)+1)
-- ARC grids are 1x1 .. 30x30 (the repository's Grid only requires >0; the
-- upper bound is the dataset constraint and is enforced at realization).
natPosRange :: (Int,Int)
natPosRange=(1,30)

data SizeRule = SizeRule
  { srWidth, srHeight :: TExpr GFeat
  , srWidthReps, srHeightReps :: [Candidate GFeat]   -- every training-exact representative, selected first
  , srWitness :: [String] } deriving (Eq,Show)
-- ssObjectRound: whether the demand-driven object-leaf round ran per axis
-- (width,height); recorded for the single-IO trace only.
data SizeStats = SizeStats { ssWidth, ssHeight :: TypedResult GFeat, ssFixedGrammar :: Bool, ssObjectRound :: (Bool,Bool) } deriving (Eq,Show)
sizeIdentity :: SizeRule
sizeIdentity=SizeRule (TLeaf GWidth) (TLeaf GHeight) [] [] ["identity: unchanged canvas"]
sizeRuleText :: SizeRule -> String
sizeRuleText r="Size2(width="++renderT gridFeatureName (srWidth r)++", height="++renderT gridFeatureName (srHeight r)++")"

-- Synthesize the Size2 rule from the training scenes. With the typed hole
-- search disabled (GridSizeOnly) only the fixed template list is used.
-- Stage C3.1: the object-level leaves are opened per axis only when the Stage A
-- leaves give no training-exact expression (trigger before expansion): every
-- Stage A size rule is reproduced unchanged, and the extended enumeration is
-- counted on top of the Stage A one.
synthesizeSize :: StageA -> Bool -> Bool -> [(O.Scene,O.Scene)] -> (Either String SizeRule,SizeStats)
synthesizeSize sa objectFeatures dep pairs=
  let hc=holeConfig sa
      leavesAll=gridLeavesC False
      -- Feature-first with the target's own axis first: on a square canvas
      -- GridWidth and GridHeight both fit the height target; both survive as
      -- representatives, the own-axis leaf is the selected one on cost ties.
      leavesFor own=[(f,t) | (f,t)<-leavesAll, f==own]++[(f,t) | (f,t)<-leavesAll, f/=own]
      templates own | saTypedHoles sa = enumerateTemplates hc (leavesFor own) TyInt
                    | otherwise = fixedTemplates (leavesFor own)
      rowsFor side=[(gridValue dep x,VI (side (O.canvas y))) | (x,y)<-pairs]
      leavesObj own=[(f,t) | (f,t)<-gridLeavesC True, f==own]++[(f,t) | (f,t)<-gridLeavesC True, f/=own]
      templatesObj own | saTypedHoles sa = enumerateTemplates hc (leavesObj own) TyInt
                       | otherwise = fixedTemplates (leavesObj own)
      extend r0 r1=r1 {trTemplates=trTemplates r0+trTemplates r1, trTemplatesTried=trTemplatesTried r0+trTemplatesTried r1, trEvaluations=trEvaluations r0+trEvaluations r1}
      withObjects own side r0 | objectFeatures && null (trFits r0) = extend r0 (synthesizeTyped hc gridFeatureName (templatesObj own) (rowsFor side))
                              | otherwise = r0
      w0=synthesizeTyped hc gridFeatureName (templates GWidth) (rowsFor gridWidth)
      h0=synthesizeTyped hc gridFeatureName (templates GHeight) (rowsFor gridHeight)
      w=withObjects GWidth gridWidth w0
      h=withObjects GHeight gridHeight h0
      pick r=case trFits r of
        []->Nothing
        cs->Just (minimumOn (\c->(cCost c,cIndex c)) cs)
      stats=SizeStats w h (not (saTypedHoles sa)) (objectFeatures && null (trFits w0),objectFeatures && null (trFits h0))
      witness axis r c=axis++" = "++renderT gridFeatureName (cExpr c)++" ("++show (length (trFits r))++" representatives, "++show (trEvaluations r)++" evaluations"
        ++(if trTruncated r then ", budget truncated" else "")++"); bindings: "++unwords (map bindingText (cBindings c))
  in case (pick w,pick h) of
      (Just cw,Just ch)->(Right (SizeRule (cExpr cw) (cExpr ch) (trFits w) (trFits h)
                            [witness "width" w cw,witness "height" h ch,"training-exact on every case; input-side features and shared constants only"]),stats)
      (Nothing,_)->(Left ("no uniform output width expression ("++show (trTemplatesTried w)++" templates, "++show (trEvaluations w)++" evaluations"++(if trTruncated w then ", budget truncated" else "")++")"),stats)
      (_,Nothing)->(Left ("no uniform output height expression ("++show (trTemplatesTried h)++" templates, "++show (trEvaluations h)++" evaluations"++(if trTruncated h then ", budget truncated" else "")++")"),stats)
  where minimumOn f (x:xs)=foldl (\a b->if f b<f a then b else a) x xs
        minimumOn _ []=error "minimumOn: empty"

-- Realize the output canvas size from an input scene (inference time: input
-- features and constants only). Invalid sizes are explicit failures.
outputSize :: Bool -> SizeRule -> O.Scene -> Either String Dimensions
outputSize dep r s=do
  w<-evalT (gridValue dep s) (srWidth r) >>= asInt
  h<-evalT (gridValue dep s) (srHeight r) >>= asInt
  let (lo,hi)=natPosRange
  if w<lo || h<lo then Left ("size realization: non-positive output size "++show (w,h))
    else if w>hi || h>hi then Left ("size realization: output size exceeds ARC bound "++show (w,h))
    else Right (Dimensions w h)
