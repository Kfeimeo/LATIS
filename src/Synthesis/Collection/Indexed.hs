-- LATIS v0.6 indexed kernel. The v0.5 module Synthesis.Collection and the R2
-- fallback are untouched; this is the dependent-index IR of the upgraded
-- collection front-end. ObjectSet and OrderedView constructors stay private:
-- a Set has no index and no listing, only an OrderedView (with its ordering
-- provenance) can be ranked or listed.
module Synthesis.Collection.Indexed
  ( SizeSig(..), Placed(..), placedFromObject, placedToObject, Axis(..), Corner(..), Which(..)
  , obsPos, obsExtent, obsAnchor, obsArea, observeColor, absoluteCells
  , ObjectSet, objectSet, count, shapeCount, setMinimum, setMaximum, setInsert, setMap, setAny, setAll, setFits
  , setCells, setColors, setSmallest
  , objectEqual
  , KeyExpr(..), Origin(..), Trigger(..), seedKeys, isSeedKey, keyCost, keyDepth, keyValue, keyObservers
  , KeyContext(..), visibleKeyGrammar
  , OrderedView, orderBy, rank, cardinality, orderedItems, orderingKey, orderingOrigin, orderingTrigger, orderingDerivation, sourceSet
  , Alignment, rankAlign, alignmentPairs, alignmentLeft, alignmentRight, alignmentExpression, alignmentLift
  , legalComparison, runtimePairs
  ) where

import Latent.Grid
import qualified Latent.Object as O
import qualified Data.Set as S
import qualified Data.Map.Strict as M
import Data.List (sortOn, nub)
import Data.Maybe (listToMaybe)

data SizeSig = SizeSig { sigW :: !Int, sigH :: !Int } deriving (Eq,Ord,Show)
data Axis = AX | AY deriving (Eq,Ord,Show,Read,Enum,Bounded)
data Corner = TL | BR deriving (Eq,Ord,Show,Enum,Bounded)
data Which = Current | Previous deriving (Eq,Ord,Show,Enum,Bounded)

-- Placed[sigma] = Object[sigma] x Pos. Object[sigma] is the row-major cell vector
-- of the sigma bounding box; its length is fixed by sigma, so erasing sigma makes
-- a 2x1 bar and a 1x2 bar the same value. No object ID and no enumeration index.
data Placed = Placed { placedSig :: !SizeSig, placedPayload :: [Int], placedPos :: !Coord } deriving (Eq,Ord,Show)
placedFromObject :: O.Object -> Placed
placedFromObject o = Placed (SizeSig w h) [M.findWithDefault 0 (Coord x y) (O.geometry o) | y<-[0..h-1], x<-[0..w-1]] (O.position o)
  where w=O.width o; h=O.height o
placedToObject :: Placed -> O.Object
placedToObject (Placed (SizeSig w _) cells p) = O.Object 0 p (M.fromList [(Coord (i `mod` w) (i `div` w),c) | (i,c)<-zip [0..] cells, c/=0]) 0
absoluteCells :: Placed -> [Coord]
absoluteCells (Placed (SizeSig w _) cells (Coord x y)) = [Coord (x+i `mod` w) (y+i `div` w) | (i,c)<-zip [0..] cells, c/=0]

-- Polymorphic observers: defined for every sigma.
obsPos, obsExtent :: Axis -> Placed -> Int
obsPos AX = cx . placedPos
obsPos AY = cy . placedPos
obsExtent AX = sigW . placedSig
obsExtent AY = sigH . placedSig
obsAnchor :: Corner -> Axis -> Placed -> Int
obsAnchor TL a p = obsPos a p
obsAnchor BR a p = obsPos a p + obsExtent a p - 1
obsArea :: Placed -> Int
obsArea = length . filter (/=0) . placedPayload
observeColor :: Placed -> Maybe Int
observeColor p = case nub (filter (/=0) (placedPayload p)) of [c]->Just c; _->Nothing

-- F0 = Set[Sum_sigma Placed[sigma]]. No listing, only order-free aggregates.
newtype ObjectSet = ObjectSet (S.Set Placed) deriving (Eq,Ord,Show)
objectSet :: [O.Object] -> ObjectSet
objectSet = ObjectSet . S.fromList . map placedFromObject
count :: ObjectSet -> Int
count (ObjectSet s) = S.size s
-- Count of the image under position erasure. With the dependent index the image
-- is Set[exists sigma.Object[sigma]]; with the index erased it is Set[Payload],
-- where differently shaped objects with equal cell vectors collapse.
shapeCount :: Bool -> ObjectSet -> Int
shapeCount dependent (ObjectSet s)
  | dependent = S.size (S.map (\p->(placedSig p,placedPayload p)) s)
  | otherwise = S.size (S.map placedPayload s)
setMinimum, setMaximum :: (Placed -> Int) -> ObjectSet -> Maybe Int
setMinimum f (ObjectSet s) | S.null s = Nothing | otherwise = Just (minimum (map f (S.toList s)))
setMaximum f (ObjectSet s) | S.null s = Nothing | otherwise = Just (maximum (map f (S.toList s)))
setInsert :: Placed -> ObjectSet -> ObjectSet
setInsert p (ObjectSet s) = ObjectSet (S.insert p s)
setMap :: (Placed -> Placed) -> ObjectSet -> ObjectSet
setMap f (ObjectSet s) = ObjectSet (S.map f s)
setAny, setAll :: (Placed -> Bool) -> ObjectSet -> Bool
setAny f (ObjectSet s) = any f (S.toList s)
setAll f (ObjectSet s) = all f (S.toList s)
setCells :: ObjectSet -> S.Set Coord
setCells (ObjectSet s) = S.fromList (concatMap absoluteCells (S.toList s))
setColors :: ObjectSet -> S.Set Int
setColors (ObjectSet s) = S.fromList (concatMap (filter (/=0) . placedPayload) (S.toList s))
setSmallest :: ObjectSet -> Maybe Placed
setSmallest (ObjectSet s) | S.null s = Nothing | otherwise = Just (head (sortOn (\p->(obsArea p,p)) (S.toList s)))
setFits :: Dimensions -> ObjectSet -> Bool
setFits d = not . setAny (\p->not (all (inBounds d) (absoluteCells p)))

-- Object-level equality requires size-index unification first (Object[s1] and
-- Object[s2] are different types). The ablation erases the index.
objectEqual :: Bool -> Placed -> Placed -> Either String Bool
objectEqual dependent a b
  | dependent && placedSig a/=placedSig b = Left "size-index unification failed"
  | otherwise = Right (placedPayload a==placedPayload b)

-- KeyExpr[T,K]: intensional ordering expressions. Seeds are the v0.5 six keys;
-- the rest are synthesized only under a trigger (visibleKeyGrammar).
data KeyExpr = Anchor Corner Axis | Extent Axis | Area | Color | Desc KeyExpr | Lex KeyExpr KeyExpr deriving (Eq,Ord,Show)
data Origin = InputSet | OutputSet deriving (Eq,Ord,Show)
data Trigger = NeedCrossItemAlignment | NeedOrderedView | NeedUniqueRef | AlignmentFailure
  | NeedCount | NeedTransform | NeedConstruct | NeedSemanticCohesion | NeedCanvas deriving (Eq,Ord,Show)
seedKeys :: [KeyExpr]
seedKeys = [Anchor TL AX, Anchor TL AY, Area, Color, Lex (Anchor TL AX) (Anchor TL AY), Lex (Anchor TL AY) (Anchor TL AX)]
isSeedKey :: KeyExpr -> Bool
isSeedKey = (`elem` seedKeys)
keyCost :: KeyExpr -> Int
keyCost (Anchor TL _) = 1
keyCost (Anchor BR _) = 3 -- position + extent + combination
keyCost (Extent _) = 2
keyCost Area = 1
keyCost Color = 1
keyCost (Desc k) = 1+keyCost k
keyCost (Lex a b) = 1+keyCost a+keyCost b
keyDepth :: KeyExpr -> Int
keyDepth (Desc k) = 1+keyDepth k
keyDepth (Lex a b) = 1+max (keyDepth a) (keyDepth b)
keyDepth _ = 1
keyObservers :: KeyExpr -> [String]
keyObservers (Anchor c a) = nub (["Position "++show a]++["Extent "++show a | c==BR])
keyObservers (Extent a) = ["Extent "++show a]
keyObservers Area = ["Area"]
keyObservers Color = ["Color"]
keyObservers (Desc k) = keyObservers k
keyObservers (Lex a b) = nub (keyObservers a++keyObservers b)
keyValue :: KeyExpr -> Placed -> Maybe [Int]
keyValue (Anchor c a) p = Just [obsAnchor c a p]
keyValue (Extent a) p = Just [obsExtent a p]
keyValue Area p = Just [obsArea p]
keyValue Color p = (:[]) <$> observeColor p
keyValue (Desc k) p = map negate <$> keyValue k p
keyValue (Lex a b) p = (++) <$> keyValue a p <*> keyValue b p

-- VisibleKeyGrammar(Q,Gamma). Nothing is visible without an ordering trigger;
-- the synthesized layer opens only after AlignmentFailure and never for the
-- FixedAlignmentKeys ablation. Depth and cost are bounded; the front-end also
-- prunes keys with no residual discriminating effect on the actual sets.
data KeyContext = KeyContext { keyTriggers :: [Trigger], keyFixedSeeds :: Bool, keyDepthBound :: Int, keyCostBound :: Int } deriving (Eq,Show)
visibleKeyGrammar :: KeyContext -> [KeyExpr]
visibleKeyGrammar ctx
  | not (any (`elem` keyTriggers ctx) [NeedCrossItemAlignment,NeedOrderedView,NeedUniqueRef]) = []
  | keyFixedSeeds ctx || AlignmentFailure `notElem` keyTriggers ctx = seedKeys
  | otherwise = seedKeys++filter (`notElem` seedKeys) (sortOn keyCost synthesized)
  where
    base=[Anchor c a | c<-[TL,BR], a<-[AX,AY]]++[Extent a | a<-[AX,AY]]++[Area,Color]
    layer1=base++[Desc k | keyDepthBound ctx>=2, k<-base]
    synthesized=filter (\k->keyCost k<=keyCostBound ctx && keyDepth k<=keyDepthBound ctx)
      (layer1++[Lex a b | keyDepthBound ctx>=2, a<-layer1, b<-layer1, a/=b, keyObservers a/=keyObservers b])

-- Only orderBy builds an OrderedView; ties are rejected, never broken by ID,
-- enumeration order, hash or an undocumented field. Explicit Lex refinement is a
-- separate visible key, not a hidden fallback.
data OrderedView = OrderedView
  { sourceSet :: ObjectSet, orderingOrigin :: Origin, orderingKey :: KeyExpr, orderingTrigger :: Trigger
  , cardinality :: Int, orderedItems :: [Placed] } deriving (Eq,Show)
orderingDerivation :: OrderedView -> String
orderingDerivation v = "OrderBy("++show (orderingKey v)++","++show (orderingOrigin v)++")"
orderBy :: [KeyExpr] -> Trigger -> Origin -> KeyExpr -> ObjectSet -> Either String OrderedView
orderBy visible tr origin key source@(ObjectSet s)
  | tr `notElem` [NeedCrossItemAlignment,NeedOrderedView,NeedUniqueRef] = Left "ordering requires an ordering trigger"
  | key `notElem` visible = Left "ordering key is not visible under this trigger"
  | otherwise = do
      keyed <- traverse (\p->maybe (Left "partial ordering observer") (\v->Right (v,p)) (keyValue key p)) (S.toList s)
      if length (nub (map fst keyed))/=length keyed then Left "non-unique ordering key: no implicit tie breaker"
        else Right (OrderedView source origin key tr (S.size s) (map snd (sortOn fst keyed)))
rank :: OrderedView -> Int -> Either String Placed
rank v i | i<0 || i>=cardinality v = Left "Fin(n) out of bounds"
         | otherwise = Right (orderedItems v !! i)

data Alignment = Alignment { alignmentExpression :: (KeyExpr,KeyExpr), alignmentLeft :: OrderedView, alignmentRight :: OrderedView } deriving (Eq,Show)
rankAlign :: OrderedView -> OrderedView -> Either String Alignment
rankAlign a b
  | cardinality a/=cardinality b = Left "RankAlign cardinality constraint failed"
  | orderingOrigin a/=InputSet || orderingOrigin b/=OutputSet = Left "RankAlign origins must be InputSet/OutputSet"
  | otherwise = Right (Alignment (orderingKey a,orderingKey b) a b)
alignmentPairs :: Alignment -> [(Placed,Placed)]
alignmentPairs a = zip (orderedItems (alignmentLeft a)) (orderedItems (alignmentRight a))
-- Concrete pairings are evidence only: the lift must reproduce the exact
-- unordered relation of EVERY case with ONE symbolic expression.
alignmentLift :: [KeyExpr] -> [(ObjectSet,ObjectSet)] -> [[(Placed,Placed)]] -> Either String (KeyExpr,KeyExpr)
alignmentLift keys sets pairs
  | null sets || length sets/=length pairs = Left "AlignmentLift example count"
  | otherwise = maybe (Left "AlignmentLift: no common intensional explanation") Right $ listToMaybe
      [(a,b) | a<-keys, b<-keys, Right ws<-[traverse (\(x,y)->do u<-orderBy keys NeedCrossItemAlignment InputSet a x; v<-orderBy keys NeedCrossItemAlignment OutputSet b y; rankAlign u v) sets]
       , map (S.fromList . alignmentPairs) ws==map S.fromList pairs]
-- Equality across origins is only admitted through an alignment witness.
legalComparison :: Origin -> Origin -> Maybe Alignment -> Placed -> Placed -> Bool
legalComparison a b witness x y
  | a==b = x==y
  | a==InputSet && b==OutputSet = maybe False (elem (x,y) . alignmentPairs) witness
  | otherwise = maybe False (elem (y,x) . alignmentPairs) witness
-- Deliberately unsafe: raw encoder enumeration order (DirectSetIndexing ablation).
runtimePairs :: [O.Object] -> [O.Object] -> [(Placed,Placed)]
runtimePairs xs ys = zip (map placedFromObject xs) (map placedFromObject ys)
