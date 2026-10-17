-- A generic covering traversal of the deductive DAG. It constructs a complete
-- witness before expanding products, then propagates single-hole alternatives.
-- Nothing is removed from the original DAG; ordinary cost saturation follows.
-- This prevents large inner products from consuming every unit before a single
-- complete root witness is materialized. It contains no task/operator template.
module Synthesis.InducedR2.PortfolioCover (coverPortfolio) where
import Language.Induced.Base
import Synthesis.InducedR2.VersionSpace
import Synthesis.InducedR2.Diversity
import Synthesis.InducedR2.NormalForm
import Synthesis.InducedR2.Sharing
import qualified Data.Map.Strict as M
import qualified Data.Set as S
import Data.IORef
import Data.List (sortOn)
import Control.Monad (forM)
import Control.Exception (evaluate)

coverPortfolio :: Int -> Bool -> Bool -> Int -> Int -> Space -> NodeId -> IO ([Expr],Int)
coverPortfolio aliasCap sharing prior bound budget store root=do
  remaining<-newIORef budget
  bestMemo<-newIORef M.empty
  variantMemo<-newIORef M.empty
  let transform=(if sharing then share else id) . normalForm
      rank=rankWith prior
      unique es=let sorted=representatives prior es in if aliasCap>0 then take aliasCap sorted else sorted
      attempt assemble args=do
        left<-readIORef remaining
        if left<=0 then pure Nothing else do
          modifyIORef' remaining (subtract 1)
          case assemble args of
            Right raw->do let e=transform raw
                          _<-evaluate (exprLength e)
                          pure (Just e)
            _->pure Nothing
      best i=do
        cached<-readIORef bestMemo
        case M.lookup i cached of
          Just result->pure result
          Nothing->do
            result<-case M.lookup i (nodes store) of
              Just (Leaf e)->attempt (\_->Right e) []
              Just (Union cs)->do es<-mapM best cs; pure (minimumMaybe [e | Just e<-es])
              Just (Join _ cs assemble)->do
                initial<-mapM best cs
                case sequence initial of
                  Nothing->pure Nothing
                  Just args->do
                    baseline<-attempt assemble args
                    -- Coordinate descent uses actual shared cost, not an
                    -- independence/sum assumption. All choices stay in the DAG.
                    (_,result)<-refine assemble cs args baseline (zip [0..] cs)
                    pure result
              _->pure Nothing
            modifyIORef' bestMemo (M.insert i result)
            pure result
      choices i=case M.lookup i (nodes store) of
        Just (Union cs)->do es<-mapM best cs; pure (unique [e | Just e<-es])
        _->do result<-best i; pure [e | Just e<-[result]]
      refine _ _ args selected []=pure (args,selected)
      refine assemble cs args selected ((position,child):rest)=do
        alternatives<-choices child
        tried<-forM alternatives $ \e->do
          let changed=take position args++[e]++drop (position+1) args
          result<-attempt assemble changed
          pure [(changed,p) | Just p<-[result]]
        let ranked=sortOn (rank . snd) ([(args,p) | Just p<-[selected]]++concat tried)
        case ranked of
          (next,p):_->refine assemble cs next (Just p) rest
          []->pure (args,Nothing)
      minimumMaybe []=Nothing
      minimumMaybe es=Just (head (sortOn rank es))
      variants i=do
        cached<-readIORef variantMemo
        case M.lookup i cached of
          Just es->pure es
          Nothing->do
            b<-best i
            more<-case M.lookup i (nodes store) of
              Just (Union cs)->concat <$> mapM variants cs
              Just (Join _ cs assemble)->do
                bs<-mapM best cs
                case sequence bs of
                  Nothing->pure []
                  Just args->concat <$> forM (zip [0..] cs) (\(position,child)->do
                    alternatives<-variants child
                    results<-forM alternatives (\e->attempt assemble (take position args++[e]++drop (position+1) args))
                    pure [e | Just e<-results])
              _->pure []
            let es=unique ([e | Just e<-[b]]++more)
            _<-evaluate (length es)
            modifyIORef' variantMemo (M.insert i es)
            pure es
  _<-best root
  candidates<-variants root
  left<-readIORef remaining
  pure ([e | e<-candidates,let (cost,_,_)=rank e,cost<=bound],budget-left)
