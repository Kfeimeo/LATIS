{-# LANGUAGE GADTs #-}
module Synthesis.Expression.Domain where
import Synthesis.Hole
import Synthesis.Expression.FreeVars
import Language.Witness
import Language.Types
import Latent.Object
import Data.List (sort,nub,sortOn)
import qualified Data.Set as S

-- IDs and unavailable context fields are not observable by this grammar.
contextKey :: Scope -> Context -> String
contextKey scope c = show (signature (current c),
  if PreviousSource `S.member` scope then signature <$> previous c else Nothing,
  if GridSource `S.member` scope then Just (contextCanvas c) else Nothing)
  where signature o = (position o,geometry o)
domainKey :: Show a => Hole a -> Scope -> String
domainKey h scope = show (typeName (holeType h),S.toList scope,
  nub (sort [(contextKey scope c,show v) | Constraint c v <- constraints h]))
grammar :: Hole a -> [Param a]
grammar h = case holeType h of
  TVec -> witnessVectorGrammar (constraints h) True
  TInt -> witnessColorGrammar (constraints h) True
  _ -> []
rankParam :: Param a -> (Int,Int,Int,String)
rankParam p = (paramLength p,S.size (freeVars p),S.size (paramSymbols p),paramText p)
scopedGrammar :: Hole a -> Scope -> [Param a]
scopedGrammar h scope = sortOn rankParam [p | p <- grammar h, freeVars p `S.isSubsetOf` scope]
