module Main where
import Synthesis.Collection.Typed
import Synthesis.Collection.Parameter
import Synthesis.Collection.Referent (emptyVSA,vsaNodeCount)
import qualified Data.Set as S
import Control.Exception (evaluate)
import System.Environment (getArgs)
import System.Mem (performGC)
import GHC.Stats

main :: IO ()
main=do
  args<-getArgs
  enabled<-getRTSStatsEnabled
  if not enabled then error "run with +RTS -T" else pure ()
  let hc=HoleConfig 2 0 100000 [] (baseOps++parityOps) FeatureOnly
      expressions=take 512 (enumerateTemplates hc [(l,TyInt) | l<-[CurrentX,CurrentWidth,WholeCount,WholeColors,InputWidth]] TyInt)
      candidates=S.toAscList (S.fromList [p | t<-expressions,Right p<-[checkedParam IntegerParam (tmExpr t)]])
  _<-evaluate (length (show candidates))
  performGC
  before<-gcdetails_live_bytes . gc <$> getRTSStats
  let pool=case args of
        ["SharedParamVSA"]->buildPool 512 candidates
        ["NoParamVSA"]->ParamPool candidates [] emptyVSA (-1) []
        _->error "mode must be SharedParamVSA or NoParamVSA"
  _<-evaluate (length (show pool))
  performGC
  after<-gcdetails_live_bytes . gc <$> getRTSStats
  -- Keep both roots live across the GC; this is retained heap, not a
  -- serialized-size estimate, measured in a separate process for each mode.
  retained<-evaluate (length (ppCandidates pool)+length candidates+vsaNodeCount (ppDAG pool))
  putStrLn ("{\"mode\":\""++head args++"\",\"candidates\":"++show (length candidates)++",\"nodes\":"++show (vsaNodeCount (ppDAG pool))++",\"before_live_bytes\":"++show before++",\"after_live_bytes\":"++show after++",\"retained_delta_bytes\":"++show (toInteger after-toInteger before)++",\"root_liveness_check\":"++show retained++"}")
