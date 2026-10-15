{-# LANGUAGE GADTs #-}
module Synthesis.Hole where
import Latent.Grid
import Latent.Object
import Language.Types
import qualified Data.Set as S
import Data.List (sortOn, nubBy)

data Reference = Current | Previous deriving (Eq, Ord, Show)
data Anchor = TL | TR | BL | BR | Center deriving (Eq, Ord, Show, Enum, Bounded)
data Context = Context { current :: Object, previous :: Maybe Object, contextCanvas :: Dimensions }
  deriving (Eq, Show)
data Param a where
  Corner :: Reference -> Anchor -> Param Coord
  GridTL :: Param Coord
  GridBR :: Param Coord
  VectorDifference :: Param Coord -> Param Coord -> Param Vec
  ConstantVector :: Vec -> Param Vec
  ConstantInt :: Int -> Param Int
  ObjectColor :: Reference -> Param Int

data Constraint a = Constraint { constraintContext :: Context, requiredValue :: a }
data Hole a = Hole { holeName :: String, holeType :: Ty a, constraints :: [Constraint a] }
data SomeHole where SomeHole :: Hole a -> SomeHole

paramText :: Param a -> String
paramText (Corner r a) = show a ++ "(" ++ refText r ++ ")"
paramText GridTL = "GridTL"
paramText GridBR = "GridBR"
paramText (VectorDifference a b) = paramText a ++ " - " ++ paramText b
paramText (ConstantVector (Vec x y)) = "(" ++ show x ++ "," ++ show y ++ ")"
paramText (ConstantInt n) = show n
paramText (ObjectColor r) = "color(" ++ refText r ++ ")"
refText :: Reference -> String
refText Current = "current"
refText Previous = "prev"

getObject :: Context -> Reference -> Either String Object
getObject c Current = Right (current c)
getObject c Previous = maybe (Left "previous object is unavailable") Right (previous c)
observe :: Anchor -> Object -> Coord
observe TL = tl
observe TR = tr
observe BL = bl
observe BR = br
observe Center = center
evalParam :: Context -> Param a -> Either String a
evalParam c (Corner r a) = observe a <$> getObject c r
evalParam _ GridTL = Right (Coord 0 0)
evalParam c GridBR = Right (Coord (gridWidth (contextCanvas c)-1) (gridHeight (contextCanvas c)-1))
evalParam c (VectorDifference a b) = difference <$> evalParam c a <*> evalParam c b
evalParam _ (ConstantVector v) = Right v
evalParam _ (ConstantInt n) = Right n
evalParam c (ObjectColor r) = getObject c r >>= maybe (Left "object has multiple colors") Right . color

paramSymbols :: Param a -> S.Set String
paramSymbols (Corner _ a) = S.singleton (show a)
paramSymbols GridTL = S.singleton "GridTL"
paramSymbols GridBR = S.singleton "GridBR"
paramSymbols (VectorDifference a b) = S.insert "subtractCoord" (paramSymbols a `S.union` paramSymbols b)
paramSymbols (ConstantVector _) = S.empty
paramSymbols (ConstantInt _) = S.empty
paramSymbols (ObjectColor _) = S.singleton "color"
paramLength :: Param a -> Int
paramLength (VectorDifference a b) = 1 + paramLength a + paramLength b
paramLength (ConstantVector (Vec x y)) = 1 + integerLength x + integerLength y
paramLength (ConstantInt n) = integerLength n
paramLength _ = 2
integerLength :: Int -> Int
integerLength n = 1 + length (show (abs n)) + if n < 0 then 1 else 0
usesPrevious :: Param a -> Bool
usesPrevious (Corner Previous _) = True
usesPrevious (ObjectColor Previous) = True
usesPrevious (VectorDifference a b) = usesPrevious a || usesPrevious b
usesPrevious _ = False

coordinateGrammar :: Bool -> [Param Coord]
coordinateGrammar allowPrevious = [GridTL,GridBR] ++ [Corner r a | r <- refs, a <- [minBound..maxBound]]
  where refs = Current : [Previous | allowPrevious]
vectorGrammar :: Int -> Bool -> [Param Vec]
vectorGrammar radius allowPrevious = sortOn (\p -> (paramLength p,paramText p))
  (map ConstantVector [Vec x y | x <- [-radius..radius], y <- [-radius..radius]]
   ++ [VectorDifference a b | a <- coordinateGrammar allowPrevious, b <- coordinateGrammar allowPrevious, paramText a /= paramText b])
colorGrammar :: Bool -> [Param Int]
colorGrammar allowPrevious = [ObjectColor Current] ++ [ObjectColor Previous | allowPrevious] ++ map ConstantInt [0..9]

-- Schema binding fixes the object operand; only the remaining typed parameter
-- is a search hole. GADT construction makes wrong-typed ASTs unrepresentable.
instantiateTranslate :: String -> [Constraint Vec] -> SomeHole
instantiateTranslate name cs = SomeHole (Hole name TVec cs)
instantiateRecolor :: String -> [Constraint Int] -> SomeHole
instantiateRecolor name cs = SomeHole (Hole name TInt cs)

-- Generic anti-unification of typed fragments: equal terms remain concrete;
-- differing terms become a typed variable with all instance constraints.
data AntiUnified a = Shared (Param a) | Parameterized (Hole a)
antiUnify :: Ty a -> String -> [(Context,Param a)] -> Either String (AntiUnified a)
antiUnify _ _ [] = Left "anti-unification requires instances"
antiUnify ty name terms@((_,p):_)
  | all ((== paramText p) . paramText . snd) terms = Right (Shared p)
  | otherwise = Parameterized . Hole name ty <$> traverse (\(c,q) -> Constraint c <$> evalParam c q) terms

uniqueParams :: [Param a] -> [Param a]
uniqueParams = nubBy (\a b -> paramText a == paramText b)
