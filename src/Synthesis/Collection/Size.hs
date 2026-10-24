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
  ( GFeat(..), gridLeaves, gridValue, gridFeatureName, natPosRange
  , SizeRule(..), SizeStats(..), synthesizeSize, outputSize, sizeRuleText, sizeIdentity
  ) where

import Latent.Grid
import qualified Latent.Object as O
import Synthesis.Collection.Indexed (objectSet, count, shapeCount)
import Synthesis.Collection.Typed

data GFeat = GWidth | GHeight | GCount | GShapes deriving (Eq,Ord,Show,Enum,Bounded)
gridFeatureName :: GFeat -> String
gridFeatureName GWidth="GridWidth(Input)"
gridFeatureName GHeight="GridHeight(Input)"
gridFeatureName GCount="CountObjects(Input)"
gridFeatureName GShapes="CountShapes(Input)"
gridLeaves :: [(GFeat,TTy)]
gridLeaves=[(f,TyInt) | f<-[minBound..maxBound]]
gridValue :: Bool -> O.Scene -> GFeat -> TVal
gridValue _ s GWidth=VI (gridWidth (O.canvas s))
gridValue _ s GHeight=VI (gridHeight (O.canvas s))
gridValue _ s GCount=VI (count (objectSet (O.objects s)))
gridValue dep s GShapes=VI (shapeCount dep (objectSet (O.objects s)))
-- ARC grids are 1x1 .. 30x30 (the repository's Grid only requires >0; the
-- upper bound is the dataset constraint and is enforced at realization).
natPosRange :: (Int,Int)
natPosRange=(1,30)

data SizeRule = SizeRule
  { srWidth, srHeight :: TExpr GFeat
  , srWidthReps, srHeightReps :: [Candidate GFeat]   -- every training-exact representative, selected first
  , srWitness :: [String] } deriving (Eq,Show)
data SizeStats = SizeStats { ssWidth, ssHeight :: TypedResult GFeat, ssFixedGrammar :: Bool } deriving (Eq,Show)
sizeIdentity :: SizeRule
sizeIdentity=SizeRule (TLeaf GWidth) (TLeaf GHeight) [] [] ["identity: unchanged canvas"]
sizeRuleText :: SizeRule -> String
sizeRuleText r="Size2(width="++renderT gridFeatureName (srWidth r)++", height="++renderT gridFeatureName (srHeight r)++")"

-- Synthesize the Size2 rule from the training scenes. With the typed hole
-- search disabled (GridSizeOnly) only the fixed template list is used.
synthesizeSize :: StageA -> Bool -> [(O.Scene,O.Scene)] -> (Either String SizeRule,SizeStats)
synthesizeSize sa dep pairs=
  let hc=holeConfig sa
      -- Feature-first with the target's own axis first: on a square canvas
      -- GridWidth and GridHeight both fit the height target; both survive as
      -- representatives, the own-axis leaf is the selected one on cost ties.
      leavesFor own=[(f,t) | (f,t)<-gridLeaves, f==own]++[(f,t) | (f,t)<-gridLeaves, f/=own]
      templates own | saTypedHoles sa = enumerateTemplates hc (leavesFor own) TyInt
                    | otherwise = fixedTemplates (leavesFor own)
      rowsFor side=[(Right . gridValue dep x,VI (side (O.canvas y))) | (x,y)<-pairs]
      w=synthesizeTyped hc gridFeatureName (templates GWidth) (rowsFor gridWidth)
      h=synthesizeTyped hc gridFeatureName (templates GHeight) (rowsFor gridHeight)
      pick r=case trFits r of
        []->Nothing
        cs->Just (minimumOn (\c->(cCost c,cIndex c)) cs)
      stats=SizeStats w h (not (saTypedHoles sa))
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
  w<-evalT (Right . gridValue dep s) (srWidth r) >>= asInt
  h<-evalT (Right . gridValue dep s) (srHeight r) >>= asInt
  let (lo,hi)=natPosRange
  if w<lo || h<lo then Left ("size realization: non-positive output size "++show (w,h))
    else if w>hi || h>hi then Left ("size realization: output size exceeds ARC bound "++show (w,h))
    else Right (Dimensions w h)
