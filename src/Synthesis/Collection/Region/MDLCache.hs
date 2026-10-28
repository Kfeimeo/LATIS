-- LATIS Stage E3.1: exact, per-task Shape MDL cache.
--
-- Key = the exact normalised mask (translation-invariant local frame: the
-- sorted coordinate list after pixelSetNormalize) + the MDL budget triple +
-- the algebra/cost version + the rectangle-cover budget triple. Nothing
-- coarser (size, bounds, hash, program text, training signature) is ever a
-- key: two different masks always get two different entries, and the same
-- mask under a different budget or DSL version is a different entry
-- (a BoundedBest under a small budget is never served as a Proven result
-- under a larger one).
--
-- Sharing by translation is legal because the Shape cost table has no
-- coordinate term (shapeCost ignores rectangle coordinates) and bestShape is
-- always evaluated on the normalised mask; the translation back to the
-- canvas is the object's own bounds (the witness's coordinate transform).
--
-- Entries are lazy: the cache is a Data.Map whose values are thunks, so a
-- shape is optimised the first time any consumer demands it and never again;
-- the per-entry wall time is charged to the "mdl_compute" / "minimal_cover"
-- phase timers (one charge per entry = one miss). The cache lives exactly as
-- long as the RegionSearch of one task (it is a local value of
-- searchRegions), so nothing global grows across tasks.
module Synthesis.Collection.Region.MDLCache
  ( MDLKey(..), MDLEntry(..), MDLCache(..), buildMDLCache, lookupMDL, mdlKeyOf, mdlCacheJSON, cacheStats
  ) where

import Latent.Grid (Coord(..))
import Synthesis.Collection.Geometry.Cover (PixelSet, pixelSetNormalize, pixelSetToList, CoverBudget(..), CoverResult, coverProven, minimalCover)
import Synthesis.Collection.Region.ShapeMDL
import Synthesis.Collection.Diagnostics (jstr, jobj, jbool, stableHash, timedForce)
import qualified Data.Map as M      -- lazy values on purpose
import qualified Data.Set as S
import Data.List (nub)

data MDLKey = MDLKey { mkMask :: [Coord], mkBudget :: (Int,Int,Int), mkDSL :: String, mkCoverBudget :: (Int,Int,Int) } deriving (Eq,Ord,Show)
data MDLEntry = MDLEntry
  { meKey :: MDLKey
  , meMaskHash :: String                 -- stableHash of the normalised mask (evidence only; never a key)
  , meShape :: Either String MDLResult   -- c_ast, status, universe (lazy; timed once)
  , meCover :: Maybe CoverResult         -- c_rect (lazy; timed once); Nothing only when the mask is empty
  } deriving (Eq,Show)
data MDLCache = MDLCache { mcEntries :: M.Map MDLKey MDLEntry, mcBudget :: MDLBudget, mcCoverBudget :: CoverBudget, mcReferences :: Int } deriving (Eq,Show)

mdlKeyOf :: MDLBudget -> CoverBudget -> PixelSet -> MDLKey
mdlKeyOf b cb s=MDLKey (pixelSetToList (pixelSetNormalize s)) (smMaxRects b,smMaxArea b,smMaxExprs b) mdlDSLVersion (cbMaxNodes cb,cbMaxArea cb,cbMaxAlternatives cb)

-- One lazy entry per distinct normalised mask among the given supports.
-- `mcReferences` = how many supports were offered (hits = references - entries).
buildMDLCache :: MDLBudget -> CoverBudget -> [PixelSet] -> MDLCache
buildMDLCache b cb supports=
  let keys=nub [mdlKeyOf b cb s | s<-supports, not (S.null s)]
      entry k=
        let mask=S.fromList (mkMask k)
            shape=timedForce "mdl_compute" forceShape (bestShape b mask)
            cover=timedForce "minimal_cover" forceCover (Just (minimalCover cb mask))
        in MDLEntry k (stableHash (show (mkMask k))) shape cover
  in MDLCache (M.fromList [(k,entry k) | k<-keys]) b cb (length supports)
  where
    forceShape=either length (\r->shapeCost (mrBest r)+length (mrStatus r)+length (mrAlternatives r)+mrExprsTried r)
    forceCover=maybe 0 (\c->if coverProven c then 1 else 2 :: Int)

-- Exact lookup; the result carries both the shape (with the cover attached
-- so that mdlJSON prints c_rect) and the entry evidence.
lookupMDL :: MDLCache -> PixelSet -> Maybe MDLEntry
lookupMDL c s
  | S.null s = Nothing
  | otherwise = M.lookup (mdlKeyOf (mcBudget c) (mcCoverBudget c) s) (mcEntries c)

-- Static statistics (no thunk is forced here): entries, references, hits.
cacheStats :: MDLCache -> [(String,Int)]
cacheStats c=[("mdl_distinct_masks",M.size (mcEntries c)),("mdl_object_references",mcReferences c),("mdl_cache_hits_static",mcReferences c-M.size (mcEntries c))]

mdlCacheJSON :: MDLCache -> String
mdlCacheJSON c=jobj ([(k,show v) | (k,v)<-cacheStats c]++
  [("key",jstr "exact normalised mask + MDLBudget(maxRects,maxArea,maxExprs) + DSL version + CoverBudget(nodes,area,alternatives)"),("dsl_version",jstr mdlDSLVersion)
  ,("budget",jobj [("max_rects",show (smMaxRects (mcBudget c))),("max_area",show (smMaxArea (mcBudget c))),("max_exprs",show (smMaxExprs (mcBudget c)))])
  ,("cover_budget",jobj [("nodes",show (cbMaxNodes (mcCoverBudget c))),("area",show (cbMaxArea (mcCoverBudget c))),("alternatives",show (cbMaxAlternatives (mcCoverBudget c)))])
  ,("translation_sharing",jbool True),("translation_sharing_note",jstr "legal: shapeCost has no coordinate term and bestShape runs on the normalised mask; the canvas offset is the object's bounds")
  ,("lifetime",jstr "one RegionSearch (one task); entries are lazy thunks evaluated at most once")])
