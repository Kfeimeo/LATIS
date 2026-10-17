{-# LANGUAGE GADTs #-}
module Synthesis.MDL where
import Synthesis.Skeleton
import Synthesis.Hole
import qualified Data.Set as S

data Objective = Objective { descriptionLength :: Int, symbolKinds :: Int, exceptionPenalty :: Int, totalCost :: Double }
  deriving (Eq, Show)
programSymbols :: Program -> S.Set String
programSymbols IdentityP = S.singleton "identity"
programSymbols (MapP order a) = S.fromList ["map","lambda","Objects","Transform"] `S.union` orderSymbols order `S.union` actionSymbols a
programSymbols (ScanP order a b) = S.fromList ["scan","lambda","Objects","head","tail","Start","Attach"] `S.union` orderSymbols order `S.union` actionSymbols a `S.union` actionSymbols b
programSymbols (FilterP p) = S.fromList ["filter","Objects"] `S.union` case p of
  HasColor _ -> S.fromList ["color","equalInt"]
  SizeAtLeast _ -> S.fromList ["size","less","not"]
  WidthAtLeast _ -> S.fromList ["width","less","not"]
  HeightAtLeast _ -> S.fromList ["height","less","not"]
programSymbols FoldBBoxP = S.fromList ["fold","bbox","bboxUnion","solidRectangle","head","tail"]
programSymbols (IterateP _ _) = S.fromList ["iterateWhile","true","map","Translate"]
orderSymbols :: Order -> S.Set String
orderSymbols ExtractionOrder = S.empty
orderSymbols LeftToRight = S.fromList ["sortBy","TL","coordX"]
orderSymbols RightToLeft = S.fromList ["sortBy","TL","coordX","negate"]
orderSymbols TopToBottom = S.fromList ["sortBy","TL","coordY"]
orderSymbols ByColor = S.fromList ["sortBy","color"]
orderSymbols BySize = S.fromList ["sortBy","size"]
programLength :: Program -> Int
programLength IdentityP = 1
programLength (MapP _ a) = 5 + actionLength a
programLength (ScanP _ a b) = 9 + actionLength a + actionLength b
programLength (FilterP _) = 4
programLength FoldBBoxP = 8
programLength (IterateP _ _) = 9
actionExceptions :: Action -> Int
actionExceptions (Move (ConstantVector _)) = 1
actionExceptions (Paint (ConstantInt _)) = 1
actionExceptions (Chain a b) = actionExceptions a + actionExceptions b
actionExceptions _ = 0
-- Constants shared across all examples get a small description penalty. There
-- are no per-object exception branches or ID-indexed tables in the search grammar.
objective :: Double -> Double -> Program -> Objective
objective lambda mu p = Objective l k e (fromIntegral l + lambda*fromIntegral k + mu*fromIntegral e)
  where l = programLength p
        k = S.size (programSymbols p)
        e = case p of MapP _ a -> actionExceptions a; ScanP _ a b -> actionExceptions a+actionExceptions b; _ -> 0
