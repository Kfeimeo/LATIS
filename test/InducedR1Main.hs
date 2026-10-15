module Main where
import Language.Induced.Base
import Synthesis.InducedR1.Learn
import Synthesis.InducedR1.Specification
import Synthesis.InducedR1.Witness
import Synthesis.InducedR1.Observers
import Synthesis.InducedR1.Abstraction
import ARC.Dataset
import ARC.InducedR1Evaluate (objectJSON,arrayJSON,inventionJSON)
import ARC.InducedR1Evaluate (exprJSON)
import Latent.Grid
import Latent.Encode
import qualified Latent.Object as O
import qualified Data.Map.Strict as M
import qualified Data.Set as S
import Control.Monad (unless,forM,forM_)
import System.Directory (createDirectoryIfMissing)
import System.Environment (lookupEnv)
import System.FilePath (takeDirectory)
import Data.IORef (writeIORef,readIORef)
import ARC.Evaluate (jsonString)
import GHC.Clock (getMonotonicTimeNSec)

assert :: String -> Bool -> IO ()
assert label ok=unless ok (error label)
must :: Either String a -> a
must=either error id
op :: String -> Type -> [Expr] -> Expr
op n t=must . call n t
lit :: Int -> Expr
lit=literal . IntV

-- Test-only truth AST; the learner receives input/output graphs, never this AST.
step :: Expr
step=lambda "pair" (PairT PlacedT PlacedT) (op "Translate" PlacedT [b,op "coordDelta" VecT [anchorE a 3,anchorE b 0]])
  where pair=variable "pair" (PairT PlacedT PlacedT)
        a=op "fst" PlacedT [pair]; b=op "snd" PlacedT [pair]
        anchorE e i=op "Anchor" CoordT [e,literal (AnchorV i)]
affine :: Int -> Int -> Expr
affine a b=lambda "x" IntT (op "add" IntT [op "multiply" IntT [variable "x" IntT,lit a],lit b])

main :: IO ()
main=do
  let forbidden=words "ScanP MapPose ProgressionTask Attach WitnessAttach Progression"
  assert "fixed Base structural prior zero" (all (`notElem` map primitiveName base) forbidden)
  let afs=[affine a b | a<-[3..6],b<-[7..10]]
      generalized=discoverOnline True True defaultLimits [] afs
  assert "parameterized typed anti-unification accepted" (any (not . null . inventionParameters) generalized)
  assert "NoAntiUnification removes parameterized commonality" (null (discoverOnline False True defaultLimits [] afs))
  assert "NoLambdaLifting rejects open AU pattern" (null (discoverOnline True False defaultLimits [] afs))
  forM_ generalized $ \i->do
    assert "closed and kernel typed" (S.null (freeVars (inventionBody i)) && typeCheck M.empty (inventionBody i)==Right (exprType (inventionBody i)))
    assert "positive disjoint portfolio MDL" (inventionSaving i>0)
    forM_ afs $ \f->case matchTemplate i f of
      Nothing->pure ()
      Just args->forM_ [-4,0,9] $ \x->assert "expanded invention equals original" (runFunction (must (expandUse i args)) (IntV x)==runFunction f (IntV x))
  let open=lambda "x" IntT (op "add" IntT [op "multiply" IntT [variable "x" IntT,variable "outer" IntT],lit 7])
  assert "lambda lifting explicit typed argument" (case liftTemplate True defaultLimits open of Just (def,[("outer",IntT)])->typeCheck M.empty def==Right (ArrowT IntT (ArrowT IntT IntT)); _->False)
  assert "parameter cap" (liftTemplate True (defaultLimits {maxParameters=1}) (op "add" IntT [variable "a" IntT,variable "b" IntT])==Nothing)
  assert "false abstraction MDL rejection" (null (discoverOnline True True defaultLimits [] [affine 3 7]))
  assert "binder dependent mismatch rejected" (antiUnify (lambda "x" IntT (op "add" IntT [variable "x" IntT,lit 1])) (lambda "x" IntT (op "multiply" IntT [variable "x" IntT,lit 1]))==Nothing)
  assert "AU type mismatch" (antiUnify (lit 1) (literal (ColorV 1))==Nothing)
  let seedFrontier=[affine a 7 | a<-[3..6]]
      seedSpec=functionTask IntT IntT [(M.empty,IntV 0,IntV 7)]
      localDefs=discoverOnline True True defaultLimits [] seedFrontier
      futureSpec=functionTask IntT IntT [(M.singleton "coefficient" (IntV 9),IntV x,IntV (9*x+7)) | x<-[-3,2,8]]
  assert "AU seed frontier exactly supports its specification" (all (matches seedSpec) seedFrontier)
  onlineEngine<-newEngine Full defaultInduced
  writeIORef (inventionsRef onlineEngine) localDefs
  futureRoot<-learn onlineEngine 7 futureSpec
  assert "parameterized definition actually used by subsequent Learn" (futureRoot/=0)
  futureCounters<-readIORef (metricsRef onlineEngine)
  assert "AU feedback is an invention hit, not fallback" (M.findWithDefault 0 "invention_hits" futureCounters>0)
  let unsafe=lambda "x" IntT (op "add" IntT [op "multiply" IntT [variable "x" IntT,variable "x" IntT],lit 7])
  assert "template matcher rejects binder capture" (all (\i->matchTemplate i unsafe==Nothing) localDefs)
  let ints xs=ListV IntT (map IntV xs)
      listVar=variable "xs" (ListT IntT)
      env=M.singleton "xs" (ints [3,1,2])
      qsort=pointTask (ListT IntT) [(env,ints [1,2,3])]
      p n=head [x | x<-base,primitiveName x==n]
      key=lambda "x" IntT (variable "x" IntT)
      sums=lambda "p" (PairT IntT IntT) (op "add" IntT [op "fst" IntT [variable "p" (PairT IntT IntT)],op "snd" IntT [variable "p" (PairT IntT IntT)]])
      check n q args=do
        let ds=witness 32 (p n) q (observations q)
            sound d=length args==length (decompositionChildren d) && and (zipWith matches (decompositionChildren d) args) && either (const False) (matches q) (decompositionBuild d args)
        assert (n++" deductive inverse sound") (any sound ds)
  check "sortBy" qsort [key,listVar]
  check "argminBy" (pointTask IntT [(env,IntV 1)]) [key,listVar]
  check "argmaxBy" (pointTask IntT [(env,IntV 3)]) [key,listVar]
  check "fold" (pointTask IntT [(env,IntV 6)]) [sums,lit 0,listVar]
  let zipEnv=M.fromList [("xs",ints [1,2]),("ys",ints [3,4])]
  check "zipWith" (pointTask (ListT IntT) [(zipEnv,ints [4,6])]) [sums,listVar,variable "ys" (ListT IntT)]
  check "range" (pointTask (ListT IntT) [(M.empty,ints [1,2])]) [lit 1,lit 3]
  let predOne=lambda "x" IntT (op "equal" BoolT [variable "x" IntT,lit 1])
  check "filter" (pointTask (ListT IntT) [(M.singleton "xs" (ints [1,1,2]),ints [1,1])]) [predOne,listVar]
  let duplicateQ=pointTask (ListT IntT) [(M.singleton "xs" (ints [1,1]),ints [1])]
  assert "filter duplicate nondeterminism rejected" (null (witness 32 (p "filter") duplicateQ [Observed listVar [ints [1,1]]]))
  let ifQ=pointTask IntT [(M.singleton "flag" (BoolV True),IntV 1),(M.singleton "flag" (BoolV False),IntV 2)]
  check "if" ifQ [variable "flag" BoolT,lit 1,lit 2]
  let letQ=pointTask IntT [(M.singleton "xs" (ints [1,2]),IntV 2)]
      letDs=witness 32 (p "let") letQ (observations letQ)
  assert "let extends typed lexical spec" (not (null letDs) && all ((==2) . length . decompositionChildren) letDs)
  forM_ letDs $ \d->do
    let a=head (decompositionChildren d)
        source=head [observedExpr o | o<-observations a,matches a (observedExpr o)]
    assert "let build sound" (matches letQ (must (decompositionBuild d [source,lit 2])))
  let progressionQ=pointTask (ListT IntT) [(M.singleton "n" (IntV 4),ints [0,1,2,3]),(M.singleton "n" (IntV 6),ints [0,1,2,3,4,5])]
  (prog,_,_,_)<-learnTaskSequence NoOnlineAbstraction defaultInduced [progressionQ]
  assert "progression reachable via generic range" (not (null (head prog)) && any (S.member "range" . symbols) (head prog))
  (oldProg,_,_,_)<-learnTaskSequence NoNewWitnessCoverage defaultInduced [progressionQ]
  assert "range reachability improvement isolated from abstraction" (all null oldProg)
  task<-loadTask "data/03560426.json" >>= either error pure
  -- Constructive expressibility checks are isolated diagnostics. These ASTs
  -- are NEVER passed to Learn/discovery; the solver sees only training IO.
  let s=variable "s" SceneT
      os=op "objects" (ListT PlacedT) [s]
      sz=op "canvasSize" SizeT [s]
      item=variable "item" PlacedT
      at e a=op "Anchor" CoordT [e,literal (AnchorV a)]
      ordered=op "sortBy" (ListT PlacedT) [lambda "item" PlacedT (op "subtract" IntT [lit 0,op "x" IntT [at item 0]]),os]
      firstObj=op "head" PlacedT [ordered]
      firstSeed=op "Translate" PlacedT [firstObj,op "coordDelta" VecT [literal (CoordV (Coord 0 0)),at firstObj 0]]
      reverseReference=lambda "s" SceneT (op "mkScene" SceneT [sz,literal (ColorV 0)
         ,op "scan" (ListT PlacedT) [step,firstSeed,op "tail" (ListT PlacedT) [ordered]]])
      corner=op "coord" CoordT [op "subtract" IntT [op "width" IntT [sz],lit 1],op "subtract" IntT [op "height" IntT [sz],lit 1]]
      gridReference=lambda "s" SceneT (op "mkScene" SceneT [sz,literal (ColorV 0)
         ,op "map" (ListT PlacedT) [lambda "item" PlacedT (op "Translate" PlacedT [item,op "coordDelta" VecT [corner,at item 3]]),os]])
  references<-forM [("scan-reverse",reverseReference),("grid-without-prev",gridReference)] $ \(name,p)->do
    t<-loadTask ("results/v03/regression/"++name++"/task.json") >>= either error pure
    assert (name++" constructive Base expressibility") (all (\(x,y)->predictInduced defaultInduced p x==Right y) (training t)
      && all (\q->maybe False (\y->predictInduced defaultInduced p (testInput q)==Right y) (testOutput q)) (tests t))
    pure (name,p)
  let root=functionTask SceneT SceneT [(M.empty,SceneV (encode defaultEncoder x),SceneV (encode defaultEncoder y)) | (x,y)<-training task]
      rect i x y w h=O.Object i (Coord x y) (M.fromList [(Coord a b,1+i `mod` 7) | a<-[0..w-1],b<-[0..h-1]]) 0
      demands=[functionTask (PairT PlacedT PlacedT) PlacedT
        [(M.empty,pair,must (runFunction step pair)) | k<-[0..5]
         ,let pair=PairV (PlacedV (rect 0 (i+k) (2+2*k) (1+(i+2*k) `mod` 4) (1+(i+k) `mod` 5)))
                        (PlacedV (rect 1 (9+2*k) (8+i-3*k) (1+(i+k) `mod` 3) (1+k `mod` 5)))] | i<-[1..40]]
      modes=[Full,NoOnlineAbstraction,PostHocOnly,NoAntiUnification,NoLambdaLifting,NoNewWitnessCoverage]
  rows<-forM modes $ \m->do
    started<-getMonotonicTimeNSec
    (portfolios,invs,metrics,trace)<-learnTaskSequence m (defaultInduced {workBudget=2000000}) (root:demands)
    finished<-getMonotonicTimeNSec
    assert (show m++" related-demand session exact") (length portfolios==41 && all (not . null) portfolios)
    let heldPair=PairV (PlacedV (rect 0 5 3 4 5)) (PlacedV (rect 1 17 9 3 2))
    assert (show m++" future inputs exact") (all (\es->runFunction (head es) heldPair==runFunction step heldPair) (tail portfolios))
    putStrLn (show m++" feedback metrics="++show metrics)
    pure (m,metrics,invs,trace,fromIntegral (finished-started)/1e9::Double)
  let get m key=M.findWithDefault 0 key (head [metrics | (mode,metrics,_,_,_)<-rows,mode==m])
  assert "actual invention hits" (get Full "invention_hits">0)
  assert "subsequent synthesis cost strictly reduced" (get Full "synthesis_work_after_discovery"<get NoOnlineAbstraction "synthesis_work_after_discovery")
  assert "session cost including discovery strictly reduced" (get Full "total_expanded_work"<get NoOnlineAbstraction "total_expanded_work")
  output<-maybe "results/v03r1/abstraction_stress.json" id <$> lookupEnv "LATIS_R1_STRESS_OUT"
  createDirectoryIfMissing True (takeDirectory output)
  writeFile output (objectJSON [("scope",jsonString "one task-local session: core prefix then 40 related step subproblems; no cross-task persistence; lengthened from 20 to test discovery amortization")
    ,("modes",arrayJSON [objectJSON [("mode",jsonString (show m)),("statistics",objectJSON [(k,show v) | (k,v)<-M.toAscList metrics]),("wall_clock_seconds",show seconds),("inventions",arrayJSON (map inventionJSON invs)),("trace",jsonString (unlines trace))] | (m,metrics,invs,trace,seconds)<-rows])
    ,("parameterized_anti_unification",arrayJSON (map inventionJSON generalized))
    ,("parameterized_feedback_hits",show (M.findWithDefault 0 "invention_hits" futureCounters))
    ,("range_reachable_with_new_coverage","true"),("range_reachable_without_new_coverage","false")
    ,("expressibility_certificates",arrayJSON [objectJSON [("task",jsonString name),("base_program",exprJSON p),("train_and_heldout_exact","true"),("solver_access","false")] | (name,p)<-references])
    ,("all_checks_passed","true")])
  putStrLn "induced-r1-tests PASS: coverage, AU, lifting, MDL, false abstraction, progression, causal feedback"
