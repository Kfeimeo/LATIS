module Synthesis.Dependency where
import Latent.Grid
import Latent.Object
import Latent.Render
import Latent.Correspondence
import Synthesis.Residual
import Synthesis.Skeleton
import Synthesis.Hole
import Language.Effect
import qualified Data.Set as S
import qualified Data.Map.Strict as M
import Data.List (find)

data Evidence = Evidence { evidenceSkeleton :: Skeleton, reason :: String }
  deriving (Eq, Show)
type LatentExample = (Scene,Scene,Correspondence)
type ObjectExample = (Context,Object)

orderedPairs :: Order -> LatentExample -> [(Object,Object)]
orderedPairs order (x,_,c) =
  [(o,t) | o <- orderObjects order (objects x), Just t <- [M.lookup (objectId o) table]]
  where table = M.fromList [(objectId a,b) | (a,b) <- correspondencePairs c]
mapExamples :: Order -> [LatentExample] -> [ObjectExample]
mapExamples order examples = [(Context a Nothing (canvas x),b) | example@(x,_,_) <- examples, (a,b) <- orderedPairs order example]
scanExamples :: Order -> [LatentExample] -> ([ObjectExample],[ObjectExample])
scanExamples order examples = (concatMap first examples,concatMap rest examples)
  where
    first e@(x,_,_) = case orderedPairs order e of [] -> []; (a,b):_ -> [(Context a Nothing (canvas x),b)]
    rest e@(x,_,_) = [(Context a (Just prev) (canvas x),b) | ((_,prev),(a,b)) <- zip pairs (drop 1 pairs)]
      where pairs = orderedPairs order e

-- Structural evidence is measured from observed coordinates, not discovered by
-- trying complete programs. Candidate relations cover every pair of five bbox
-- anchors. No task ID, color pattern, or specific BR/TL relation is privileged.
coordinateEvidence :: Bool -> [ObjectExample] -> [String]
coordinateEvidence needPrev examples =
  [paramText p | p <- coordinateRelations needPrev, all (\(c,target) -> evalParam c p == Right (difference (tl target) (tl (current c)))) examples]
coordinateRelations :: Bool -> [Param Vec]
coordinateRelations needPrev = [VectorDifference a b | a <- coordinateGrammar needPrev, b <- coordinateGrammar needPrev,
                 paramText a /= paramText b, not needPrev || usesPrevious a || usesPrevious b]

detectDependencies :: [LatentExample] -> [Evidence]
detectDependencies = fst . analyzeDependencies
analyzeDependencies :: [LatentExample] -> ([Evidence],Int)
analyzeDependencies [] = ([],0)
analyzeDependencies examples = (filterEvidence ++ concatMap fst objectEvidence, sum (map snd objectEvidence))
  where
    complete = all (null . removed . third) examples
    unchanged = all (\(_,_,c) -> all (\(a,b) -> objectResidual a b == S.empty) (correspondencePairs c)) examples
    deleted = any (not . null . removed . third) examples
    filterEvidence = [Evidence FilterSkeleton "output is an unchanged, strict input-object subset" | unchanged && deleted]
    effects = S.unions [residual (correspondencePairs c) | (_,_,c) <- examples]
    objectEvidence
      | not complete = []
      | effects `S.isSubsetOf` S.singleton Position = map perOrder allOrders
      | otherwise = [([Evidence (MapSkeleton order) "one-to-one intrinsic transformation; no preceding-output coordinate dependency observed"],0) | order <- allOrders]
    perOrder order =
      let ms = mapExamples order examples
          (starts,steps) = scanExamples order examples
          ds = [difference (tl b) (tl (current c)) | (c,b) <- ms]
          mapRelations = coordinateEvidence False ms
          startDeltas = [difference (tl b) (tl (current c)) | (c,b) <- starts]
          constantStart = case startDeltas of [] -> False; v:vs -> all (==v) vs
          startRelations = coordinateEvidence False starts ++ ["shared constant displacement" | constantStart]
          stepRelations = coordinateEvidence True steps
          uniform = case ds of [] -> False; v:vs -> all (==v) vs
          hypotheses = [Evidence (MapSkeleton order) ("independent placement relation: " ++ show mapRelations) | uniform || not (null mapRelations)]
            ++ [Evidence (ScanSkeleton order) ("first placement: " ++ show startRelations ++ "; recurrent placement: " ++ show stepRelations)
            | length starts >= 1, length steps >= 2, not (null startRelations), not (null stepRelations)]
          -- Charge every tested coordinate expression as a search state, just as
          -- in hole synthesis. Force all relations so lazy evaluation cannot hide
          -- analysis work from first-solution state/time accounting.
          forceChecks = length mapRelations + length startRelations + length stepRelations
          checks = forceChecks `seq` (2*length (coordinateRelations False)+length (coordinateRelations True))
      in (hypotheses,checks)
    third (_,_,c) = c

detectFold :: [(Scene,Scene)] -> [Evidence]
detectFold pairs = [Evidence FoldSkeleton "multiple uniformly colored objects aggregate into their solid bounding rectangle" |
  not (null pairs), all rectangleEvidence pairs]
  where
    rectangleEvidence (x,y) = case (objects x,objects y) of
      (a:as,[target]) | not (null as) ->
        let inputObjects = a:as
            origin = Coord (minimum (map (cx . tl) inputObjects)) (minimum (map (cy . tl) inputObjects))
            corner = Coord (maximum (map (cx . br) inputObjects)) (maximum (map (cy . br) inputObjects))
            w = cx corner-cx origin+1; h = cy corner-cy origin+1
        in all ((== color target) . color) inputObjects && color target /= Nothing &&
           tl target == origin && width target == w && height target == h && size target == w*h && canvas x == canvas y
      _ -> False

detectIteration :: [(Scene,Scene)] -> [Evidence]
detectIteration pairs = case sharedDisplacement of
  Just (Vec dx dy) | chainObserved, let fuel = gcd (abs dx) (abs dy), fuel > 1, fuel <= 4,
                    Vec (dx `div` fuel) (dy `div` fuel) `elem` unitSteps ->
    [Evidence (IterateSkeleton fuel (Vec (dx `div` fuel) (dy `div` fuel)))
      "at least two observed scene transitions form a chain; common displacement admits a repeated integer step (bounded hypothesis)"]
  _ -> []
  where
    chainObserved = or [render y == render x' | (i,(_,y)) <- zip [0::Int ..] pairs, (j,(x',_)) <- zip [0..] pairs, i /= j]
    vectors = [difference (tl b) (tl a) | (x,y) <- pairs, length (objects x) == length (objects y),
              (a,b) <- zip (objects x) (objects y), geometry a == geometry b]
    sharedDisplacement = find (\v -> not (null vectors) && all (==v) vectors) vectors

blindSkeletons :: [Skeleton]
blindSkeletons = [MapSkeleton o | o <- allOrders] ++ [ScanSkeleton o | o <- allOrders] ++ [FilterSkeleton,FoldSkeleton] ++ blindIterationSkeletons
unitSteps :: [Vec]
unitSteps = [Vec x y | x <- [-1..1], y <- [-1..1], (x,y) /= (0,0)]
blindIterationSkeletons :: [Skeleton]
blindIterationSkeletons = [IterateSkeleton n v | n <- [1..4], v <- unitSteps]
