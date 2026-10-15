{-# LANGUAGE GADTs #-}
module Synthesis.Expression.FreeVars where
import Synthesis.Hole
import Synthesis.Skeleton
import qualified Data.Set as S

data Source = CurrentSource | PreviousSource | GridSource deriving (Eq,Ord,Show,Read)
type Scope = S.Set Source
freeVars :: Param a -> Scope
freeVars (Corner Current _) = S.singleton CurrentSource
freeVars (Corner Previous _) = S.singleton PreviousSource
freeVars GridTL = S.singleton GridSource
freeVars GridBR = S.singleton GridSource
freeVars (VectorDifference a b) = freeVars a `S.union` freeVars b
freeVars (ObjectColor Current) = S.singleton CurrentSource
freeVars (ObjectColor Previous) = S.singleton PreviousSource
freeVars _ = S.empty
actionFreeVars :: Action -> Scope
-- Parameter dependencies and whole-action dependencies differ: every primitive
-- schema already binds its Object operand to current, even for a constant Vec.
actionFreeVars (Move p) = S.insert CurrentSource (freeVars p)
actionFreeVars (Paint p) = S.insert CurrentSource (freeVars p)
actionFreeVars (Chain a b) = actionFreeVars a `S.union` actionFreeVars b
actionFreeVars _ = S.singleton CurrentSource

currentScope, previousScope, gridScope, fullScope :: Scope
currentScope = S.singleton CurrentSource
previousScope = S.fromList [CurrentSource,PreviousSource]
gridScope = S.fromList [CurrentSource,GridSource]
fullScope = S.fromList [CurrentSource,PreviousSource,GridSource]
