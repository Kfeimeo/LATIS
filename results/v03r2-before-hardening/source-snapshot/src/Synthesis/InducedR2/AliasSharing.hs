-- A shared initializer may have several observationally equivalent definitions.
-- Substitute the initializer, so every use changes together; subsequent Base
-- CSE can expose sharing with other operands (e.g. an ordered list's tail).
-- These are proposals, checked against the original task before admission.
module Synthesis.InducedR2.AliasSharing (sharedAliasProposals) where
import Language.Induced.Base
import Synthesis.InducedR2.VersionSpace
import Synthesis.InducedR2.Diversity
import Synthesis.InducedR2.Sharing
import qualified Data.Map.Strict as M
import qualified Data.Set as S
import Data.IORef
import Control.Monad (forM)
import Control.Exception (evaluate)

sharedAliasProposals :: Bool -> Int -> Int -> Space -> [Expr] -> IO ([Expr],Int)
sharedAliasProposals prior bound budget store programs=do
  remaining<-newIORef budget
  let aliases=M.fromListWith (++) [(sig,alternatives) | reps<-M.elems (equivalenceClasses store),let alternatives=M.elems reps,sig<-M.keys reps]
      visit scope e=do
        left<-readIORef remaining
        if left<=0 then pure [] else do
          modifyIORef' remaining (subtract 1)
          replacements<-case exprNode e of
            Let name initializer body->fmap concat $ forM (representatives prior (M.findWithDefault [] (signatureOf initializer) aliases)) $ \alternative->do
              available<-readIORef remaining
              if available<=0 || alternative==initializer || typeCheck scope alternative/=Right (exprType initializer) then pure [] else do
                modifyIORef' remaining (subtract 1)
                pure [binding name alternative body]
            _->pure []
          nested<-fmap concat $ forM (zip [0..] (children e)) $ \(position,child)->do
            let nestedScope=case exprNode e of
                  Lam name t _->M.insert name t scope
                  Let name initializer _ | position==1->M.insert name (exprType initializer) scope
                  _->scope
            variants<-visit nestedScope child
            pure [rebuild e (take position (children e)++[v]++drop (position+1) (children e)) | v<-variants]
          pure (replacements++nested)
  proposed<-fmap concat $ forM programs $ \p->do
    variants<-visit M.empty p
    let typed=[share v | v<-variants,typeCheck M.empty v==Right (exprType p)]
    _<-evaluate (length typed)
    pure typed
  left<-readIORef remaining
  pure ([e | e<-representatives prior proposed,let (cost,_,_)=rankWith prior e,cost<=bound],budget-left)
