{-# OPTIONS_GHC -fno-cse -fno-full-laziness #-}
-- Observational event sink. No solver counter, prior or candidate depends on it.
module Synthesis.Collection.Diagnostics
  ( diagnostic, diagnosticStats, resetDiagnostics, jstr, jobj, stableHash
  , Exhaustiveness(..), finiteEvidence
  , TraceSettings(..), traceOff, configureTrace, closeTrace, traceSinkStats, currentTraceLevel
  , traceAt, traceCand, traceRecord, levelSummary, levelBranches, levelCandidates, levelFull
  , timedForce, resetTimers, timerStats, timerJSON
  , jarr, jbool, jmaybe ) where
import Data.Bits (xor)
import Data.Char (ord)
import Data.Word (Word64)
import Data.List (intercalate)
import Numeric (showHex)
import Data.IORef
import System.IO.Unsafe (unsafePerformIO)
import Control.Exception (evaluate, try, SomeException)
import Control.Monad (when)
import Debug.Trace (traceEventIO,flushEventLog)
import GHC.Clock (getMonotonicTimeNSec)
import System.IO
import qualified Data.Map.Strict as M

data Exhaustiveness = ProvenExhausted | ProvenNotExhausted | Unknown deriving (Eq,Show)
-- Only an explicit, complete finite ledger can certify exhaustion.
finiteEvidence :: Maybe Int -> Int -> Int -> Int -> Bool -> Exhaustiveness
finiteEvidence total visited deferred dropped interrupted
  | interrupted || deferred>0 || dropped>0=ProvenNotExhausted
  | Just n<-total, n==visited=ProvenExhausted
  | Just n<-total, visited<n=ProvenNotExhausted
  | otherwise=Unknown

jstr :: String -> String
jstr s='"':concatMap esc s++"\""
  where esc '"'="\\\""; esc '\\'="\\\\"; esc '\n'="\\n"; esc '\r'="\\r"; esc '\t'="\\t"
        esc c | ord c<32="\\u"++replicate (4-length h) '0'++h where h=showHex (ord c) ""
        esc c=[c]
jobj :: [(String,String)] -> String
jobj xs="{"++intercalate "," [jstr k++":"++v | (k,v)<-xs]++"}"
jarr :: [String] -> String
jarr xs="["++intercalate "," xs++"]"
jbool :: Bool -> String
jbool b=if b then "true" else "false"
jmaybe :: (a -> String) -> Maybe a -> String
jmaybe=maybe "null"
stableHash :: String -> String
stableHash s=showHex (stableWord s) ""
stableWord :: String -> Word64
stableWord=foldl' (\h c->(h `xor` fromIntegral (ord c))*1099511628211) 14695981039346656037
{-# NOINLINE sink #-}
sink :: IORef (Integer,Int,Int)
sink=unsafePerformIO (newIORef (0,0,0))
resetDiagnostics :: IO ()
resetDiagnostics=writeIORef sink (0,0,0)
diagnosticStats :: IO String
diagnosticStats=do
  (ns,n,bytes)<-readIORef sink
  flushEventLog
  pure (jobj [("serialization_and_emit_seconds",show (fromIntegral ns/1e9::Double)),("events",show n),("characters",show bytes),("trace_truncated","false")])
{-# NOINLINE diagnostic #-}
diagnostic :: Bool -> [(String,String)] -> a -> a
diagnostic False _ x=x
diagnostic True fields x=unsafePerformIO $ do
  start<-getMonotonicTimeNSec
  let message="latis-diag:"++jobj (("grammar_version",jstr "Dplus-v1"):fields)
  n<-evaluate (length message)
  traceEventIO message
  (_,old,_)<-readIORef sink
  if old `mod` 256==0 then flushEventLog else pure ()
  end<-getMonotonicTimeNSec
  modifyIORef' sink (\(ns,count,bytes)->(ns+fromIntegral (end-start),count+1,bytes+n))
  -- The single-IO trace sink (off unless trace-io configured it) copies the
  -- same D+ event; it is timed separately from the D+ overhead above.
  copyToSink "dplus" Nothing (("grammar_version",jstr "Dplus-v1"):fields)
  pure x

-- Single-IO trace sink. Level 0 (default) never writes and never builds the
-- fields of traceAt/traceCand. Levels are ordered: every level includes the
-- lower ones. The level is fixed before the search starts.
levelSummary, levelBranches, levelCandidates, levelFull :: Int
levelSummary=1
levelBranches=2
levelCandidates=3
levelFull=4
data TraceSettings = TraceSettings
  { tsLevel :: Int, tsPath :: Maybe FilePath, tsMaxEvents :: Int, tsMaxBytes :: Int, tsSample :: Int } deriving (Eq,Show)
traceOff :: TraceSettings
traceOff=TraceSettings 0 Nothing 0 0 1
data Sink = Sink
  { skSettings :: TraceSettings, skHandle :: Maybe Handle, skSeq, skWritten, skBytes, skDropped, skSampledOut, skErrors :: !Int
  , skDroppedBy, skSampledBy :: M.Map String Int, skNs :: !Integer, skFirstError :: Maybe String }
emptySink :: Sink
emptySink=Sink traceOff Nothing 0 0 0 0 0 0 M.empty M.empty 0 Nothing
{-# NOINLINE traceSink #-}
traceSink :: IORef Sink
traceSink=unsafePerformIO (newIORef emptySink)

-- Opening failure is returned to the caller: no silent trace loss.
configureTrace :: TraceSettings -> IO (Either String ())
configureTrace s=do
  closeHandle
  case tsPath s of
    Nothing->writeIORef traceSink emptySink {skSettings=s} >> pure (Right ())
    Just path->do
      r<-try (do h<-openFile path WriteMode; hSetEncoding h utf8; hSetBuffering h LineBuffering; pure h) :: IO (Either SomeException Handle)
      case r of
        Left e->writeIORef traceSink emptySink >> pure (Left ("trace sink cannot be opened: "++show e))
        Right h->writeIORef traceSink emptySink {skSettings=s,skHandle=Just h} >> pure (Right ())
  where closeHandle=readIORef traceSink >>= maybe (pure ()) hClose . skHandle
closeTrace :: IO String
closeTrace=do
  stats<-traceSinkStats
  sk<-readIORef traceSink
  maybe (pure ()) (\h->try (hClose h) >>= \r->either (\e->const (pure ()) (e::SomeException)) pure r) (skHandle sk)
  writeIORef traceSink emptySink
  pure stats
traceSinkStats :: IO String
traceSinkStats=do
  sk<-readIORef traceSink
  let s=skSettings sk
      counts m=jobj [(k,show v) | (k,v)<-M.toAscList m]
  pure (jobj [("level",show (tsLevel s)),("max_events",show (tsMaxEvents s)),("max_bytes",show (tsMaxBytes s)),("sample_candidates_every",show (tsSample s))
    ,("events_written",show (skWritten sk)),("bytes_written",show (skBytes sk)),("events_dropped_by_cap",show (skDropped sk)),("events_sampled_out",show (skSampledOut sk))
    ,("dropped_by_scope",counts (skDroppedBy sk)),("sampled_out_by_scope",counts (skSampledBy sk)),("write_errors",show (skErrors sk))
    ,("first_write_error",jmaybe jstr (skFirstError sk)),("sink_seconds",show (fromIntegral (skNs sk)/1e9::Double))
    ,("trace_incomplete",jbool (skDropped sk>0 || skSampledOut sk>0 || skErrors sk>0))])
currentTraceLevel :: IO Int
currentTraceLevel=tsLevel . skSettings <$> readIORef traceSink

scopeOf :: [(String,String)] -> String
scopeOf fields=maybe "unknown" (filter (/='"')) (lookup "scope" fields)

-- One JSON line per event; the line is flushed before the call returns.
copyToSink :: String -> Maybe String -> [(String,String)] -> IO ()
copyToSink source candidate fields=do
  sk<-readIORef traceSink
  case skHandle sk of
    Nothing->pure ()
    Just h->do
      start<-getMonotonicTimeNSec
      let s=skSettings sk
          scope=scopeOf fields
          sampled=case candidate of
            Just c | tsSample s>1->stableWord c `mod` fromIntegral (tsSample s)/=0
            _->False
      -- Driver records (run start/terminal) are never capped.
      if sampled then writeIORef traceSink sk {skSampledOut=skSampledOut sk+1,skSampledBy=M.insertWith (+) scope 1 (skSampledBy sk)}
      else if source/="driver" && (skWritten sk>=tsMaxEvents s || skBytes sk>=tsMaxBytes s)
        then writeIORef traceSink sk {skDropped=skDropped sk+1,skDroppedBy=M.insertWith (+) scope 1 (skDroppedBy sk)}
      else do
        let line=jobj ([("sequence",show (skSeq sk)),("trace_schema_version",jstr "latis-trace-io/1"),("event_source",jstr source)
                       ,("timestamp_monotonic_ns",show start)]++fields)
        n<-evaluate (length line)
        r<-try (hPutStrLn h line) :: IO (Either SomeException ())
        end<-getMonotonicTimeNSec
        writeIORef traceSink $ case r of
          Right ()->sk {skSeq=skSeq sk+1,skWritten=skWritten sk+1,skBytes=skBytes sk+n+1,skNs=skNs sk+fromIntegral (end-start)}
          Left e->sk {skSeq=skSeq sk+1,skErrors=skErrors sk+1,skFirstError=Just (maybe (show e) id (skFirstError sk))}
      pure ()

-- Branch-level trace event (not a D+ event). Fields are built only when the
-- configured level admits the event.
{-# NOINLINE traceAt #-}
traceAt :: Int -> [(String,String)] -> a -> a
traceAt lvl fields x=unsafePerformIO $ do
  level<-currentTraceLevel
  when (level>=lvl) (copyToSink "trace" Nothing fields)
  pure x
-- Candidate-level event: deterministic sampling by candidate id only.
-- The field builder receives the configured level (full adds grid rows).
{-# NOINLINE traceCand #-}
traceCand :: Int -> String -> (Int -> [(String,String)]) -> a -> a
traceCand lvl candidate fields x=unsafePerformIO $ do
  level<-currentTraceLevel
  when (level>=lvl) (copyToSink "trace" (Just candidate) (("candidate_id",jstr candidate):fields level))
  pure x
-- IO-side record (run start/terminal written by the trace-io driver).
traceRecord :: [(String,String)] -> IO ()
traceRecord=copyToSink "driver" Nothing

-- Observational phase timers (Stage E3.1). `timedForce label force x`
-- evaluates `force x` once (the caller chooses how deep), charges the wall
-- time of that evaluation to `label` and returns x unchanged. Because a
-- shared thunk is evaluated at most once, wrapping a cache entry counts
-- exactly one computation per entry (= a cache miss). No solver counter,
-- prior, order or candidate depends on these numbers; they are read back by
-- the record writer only.
{-# NOINLINE timers #-}
timers :: IORef (M.Map String (Integer,Int))
timers=unsafePerformIO (newIORef M.empty)
resetTimers :: IO ()
resetTimers=writeIORef timers M.empty
{-# NOINLINE timedForce #-}
timedForce :: String -> (a -> b) -> a -> a
timedForce label force x=unsafePerformIO $ do
  start<-getMonotonicTimeNSec
  _<-evaluate (force x)
  end<-getMonotonicTimeNSec
  modifyIORef' timers (M.insertWith (\(a,b) (c,d)->(a+c,b+d)) label (fromIntegral (end-start),1))
  pure x
timerStats :: IO [(String,(Integer,Int))]
timerStats=M.toAscList <$> readIORef timers
-- {"label":{"ms":..,"count":..},...}; ms is wall time, 3 decimals.
timerJSON :: IO String
timerJSON=do
  ts<-timerStats
  pure (jobj [(k,jobj [("ms",show (fromIntegral ns/1e6::Double)),("count",show n)]) | (k,(ns,n))<-ts])
