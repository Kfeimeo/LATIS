module Main where
import Language.Induced.Base
import Synthesis.InducedR1.Specification
import Synthesis.InducedR1.Abstraction (inventionParameters)
import Synthesis.InducedR2.Observers
import Synthesis.InducedR2.Diversity
import Synthesis.InducedR2.Sharing
import Synthesis.InducedR2.NormalForm
import Synthesis.InducedR2.VersionSpace
import Synthesis.InducedR2.Learn
import Synthesis.InducedR2.Counterfactual
import Synthesis.InducedR2.EffectDomain
import Synthesis.InducedR2.Witness
import Synthesis.InducedR2.AliasSharing
import qualified Data.Map.Strict as M
import qualified Data.Set as S
import Latent.Grid
import Latent.Encode
import ARC.Dataset
import ARC.InducedR1Evaluate (objectJSON,arrayJSON,inventionJSON)
import ARC.Evaluate (jsonString)
import System.Directory (createDirectoryIfMissing)
import Control.Monad (unless,forM_)
import Data.IORef (readIORef)
import GHC.Clock (getMonotonicTimeNSec)
assert s b=unless b (error s)
op n t es=either error id (call n t es)
lit=literal . IntV
main=do
  assert "fixed Base" (all (`notElem` map primitiveName base) (words "GridBR ScanP MapPose Progression Attach"))
  let env=M.singleton "sz" (SizeV (Dimensions 11 11))
      q=pointTask IntT [(env,IntV 10)]
      input=op "subtract" IntT [op "width" IntT [variable "sz" SizeT],lit 1]
      other=op "subtract" IntT [op "height" IntT [variable "sz" SizeT],lit 1]
      pool=observations q++[Observed (lit 10) [IntV 10]]
      matching=[observedExpr o | o<-pool,matches q (observedExpr o)]
  assert "literal and width-1 remain" (lit 10 `elem` matching && any ((==signatureOf input) . signatureOf) matching)
  assert "FV/dependency signatures differ" (signatureOf input/=signatureOf other && signatureOf input/=signatureOf (lit 10))
  assert "different literal coefficients remain different hypotheses" (signatureOf (op "multiply" IntT [variable "x" IntT,lit 10])/=signatureOf (op "multiply" IntT [variable "x" IntT,lit 15]))
  let roleA=op "add" IntT [op "multiply" IntT [lit 10,variable "x" IntT],lit 15]
      roleB=op "add" IntT [op "multiply" IntT [lit 15,variable "x" IntT],lit 10]
      roleScope=M.singleton "x" (IntV 1)
  assert "same literal multiset with different coefficient/bias roles remains distinct" (evalValue roleScope roleA==evalValue roleScope roleB && signatureOf roleA/=signatureOf roleB && length (representatives True [roleA,roleB])==2)
  assert "more than two training-equivalent signatures" (length (representatives True matching)>2)
  assert "grounded ranking is an explicit prior" (rankWith True input<rankWith True (lit 10) && rankWith False (lit 10)<rankWith False input)
  let equivalentPool=[o | o<-pool,exprType (observedExpr o)==IntT,matches q (observedExpr o)]
  assert "no diversity retains one alias" (length (selectObserved False 1 equivalentPool)==1)
  assert "fixed alias cap is distinct from full structural coverage" (length (selectObserved False 2 equivalentPool)==2 && length (selectObserved True 0 equivalentPool)>2)
  let repeated=op "add" IntT [input,input]; compressed=share repeated
  assert "actual CSE reduces DAG coding" (exprLength compressed<exprLength repeated && sharingCount compressed>0)
  forM_ [Dimensions 11 7,Dimensions 17 5] $ \sz->assert "CSE denotation preserved" (evalValue (M.singleton "sz" (SizeV sz)) repeated==evalValue (M.singleton "sz" (SizeV sz)) compressed)
  let global=op "tuple" (PairT IntT IntT) [repeated,input]
      local=op "tuple" (PairT IntT IntT) [share repeated,input]
  assert "global CSE is not trapped by local sharing" (exprLength (share global)==exprLength (share local))
  let xs=variable "xs" (ListT IntT)
      sorted=op "sortBy" (ListT IntT) [lambda "item" IntT (variable "item" IntT),xs]
      h=op "head" IntT [sorted]
      lazy=op "if" IntT [variable "flag" BoolT,op "add" IntT [h,h],lit 0]
  assert "CSE never hoists a partial expression out of an unselected branch" (evalValue (M.fromList [("flag",BoolV False),("xs",ListV IntT [])]) (share lazy)==Right (IntV 0))
  let partial=op "add" IntT [op "head" IntT [xs],lit 1]
      strictShadow=binding "xs" (literal (ListV IntT [IntV 1])) partial
      shadowLazy=op "tuple" (PairT IntT IntT) [strictShadow,op "if" IntT [literal (BoolV False),op "add" IntT [partial,partial],lit 0]]
  assert "a shadowed strict use cannot justify hoisting a free partial use out of a lazy branch" (evalValue (M.singleton "xs" (ListV IntT [])) (share shadowLazy)==Right (PairV (IntV 2) (IntV 0)))
  assert "shadow/lazy CSE remains kernel typed" (typeCheck (M.singleton "xs" (ListT IntT)) (share shadowLazy)==Right (exprType shadowLazy))
  let shadow=lambda "sz" SizeT (op "tuple" (PairT IntT (ArrowT SizeT IntT)) [input,lambda "sz" SizeT input])
  assert "CSE respects shadowing and kernel types" (typeCheck M.empty (share shadow)==Right (exprType shadow))
  let shadowed=lambda "sz" SizeT (op "add" IntT [input,either error id (application (lambda "sz" SizeT input) (literal (SizeV (Dimensions 17 5))))])
  assert "CSE preserves values with shadowed names" (runFunction (share shadowed) (SizeV (Dimensions 11 11))==Right (IntV 26))
  assert "structural signature encoding stays linear" (length (structuralForm (signatureOf shadowed))<64*exprLength shadowed)
  let pair=variable "pair" (PairT IntT IntT)
      step=lambda "pair" (PairT IntT IntT) (op "add" IntT [op "fst" IntT [pair],op "snd" IntT [pair]])
      scanning=op "scan" (ListT IntT) [step,h,op "tail" (ListT IntT) [sorted]]
  assert "generic scan shares its sorted seed and tail" (sharingCount (share scanning)>0 && exprLength (share scanning)<exprLength scanning)
  forM_ [[3,1,2],[7,2,5]] $ \values->do
    let scope=M.singleton "xs" (ListV IntT (map IntV values))
    assert "shared scan evaluates exactly" (evalValue scope scanning==evalValue scope (share scanning))
  forM_ [[],[3],[3,1,2]] $ \values->forM_ [0,1] $ \index->do
    let expression=op "index" IntT [xs,lit index]; scope=M.singleton "xs" (ListV IntT (map IntV values))
        success value=case value of Right v->Just (valueKey v); Left _->Nothing
    assert "normalization preserves value and definedness" (success (evalValue scope expression)==success (evalValue scope (normalForm expression)))
  let sceneVar=variable "scene" SceneT
      identity=lambda "scene" SceneT sceneVar
      fixed=lambda "scene" SceneT (op "mkScene" SceneT [literal (SizeV (Dimensions 11 11)),op "background" ColorT [sceneVar],op "objects" (ListT PlacedT) [sceneVar]])
      emptyGrid=either error id (mkGrid (replicate 11 (replicate 11 0)))
      (ambiguity,cfCalls)=diagnose defaultEncoder [identity,fixed] [emptyGrid]
  assert "counterfactual separates training-equivalent dimension hypotheses" (case ambiguity of Just a->hypotheticalPredictionA a/=hypotheticalPredictionB a && cfCalls>0; _->False)
  let (withoutPrior,_)=diagnoseWith False defaultEncoder [identity,fixed] [emptyGrid]
  assert "counterfactual uses the ablation's hypothesis ranking" (case withoutPrior of Just a->hypothesisA a==head (representatives False [identity,fixed]); _->False)
  limited<-inducedSearch NoOnlineAbstraction (defaultInduced {workBudget=5000,structuralCostBound=1}) [(emptyGrid,emptyGrid)]
  assert "nonempty VSA with failed cost extraction is SearchFailure" (inducedRoot limited/=0 && inducedProgram limited==Nothing && inducedFailure limited=="SearchFailure")
  assert "captured fold transition is conservatively unpruned" (foldPositionPossible (variable "f" (ArrowT (PairT IntT IntT) IntT)) (IntV 0) (ListV IntT []) (IntV 3))
  let addLeaf e s=let (i,s')=insertNode True (show e) (Leaf e) (Support "test" "forward") s in (i,annotate q i s')
      (a,s1)=addLeaf (lit 10) emptySpace;(b,s2)=addLeaf input s1
      (root,store)=insertNode True "union" (Union [a,b]) (Support "same observations" "diverse") s2
      (small,_,_,_)=saturateCost False False True 1 100 store root
      (large,_,_,trace)=saturateCost False False True 8 100 store root
  assert "cost bounds delay, not erase, longer hypothesis" (small==[lit 10] && normalForm input `elem` large && length trace==8)
  assert "observational class indexes multiple signatures" (any ((>=2) . M.size) (M.elems (equivalenceClasses store)))
  let (_,s3)=addLeaf other store
      sharedRoot=lambda "sz" SizeT (binding "shared" input (op "tuple" (PairT IntT IntT) [variable "shared" IntT,variable "shared" IntT]))
  (sharedAliases,_)<-sharedAliasProposals True 96 500 s3 [sharedRoot]
  assert "shared initializer aliases change all uses coherently" (any (\p->runFunction p (SizeV (Dimensions 17 5))==Right (PairV (IntV 4) (IntV 4))) sharedAliases)
  -- These are actual Learn frontiers, not test-supplied AST seeds.
  let prefix=functionTask IntT IntT [(M.empty,IntV 0,IntV 7)]
      future=functionTask IntT IntT [(M.singleton "coefficient" (IntV 9),IntV x,IntV (9*x+7)) | x<-[-3,2,8]]
      third=functionTask IntT IntT [(M.fromList [("coefficient",IntV 11),("offset",IntV 2)],IntV x,IntV (11*x-2)) | x<-[-4,1,9]]
  (learned,invs,metrics,_)<-learnTaskSequence Full (defaultInduced {workBudget=250000}) [future,third]
  putStrLn ("parameterized learned portfolio sizes="++show (map length learned)++" metrics="++show metrics)
  assert "parameterized prefix comes from Learn" (length learned==2 && not (null (head learned)))
  assert "future demand reached" (not (null (last learned)))
  assert "online parameterized hit" (M.findWithDefault 0 "invention_hits" metrics>0)
  assert "actual anti-unification/lifting" (any (not . null . inventionParameters) invs)
  let heldScope=M.fromList [("coefficient",Ground (IntV 11)),("offset",Ground (IntV 2))]
      heldCorrect p=case eval heldScope p >>= (\f->applyRuntime f (Ground (IntV 13))) of Right (Ground (IntV y))->y==141; _->False
  assert "fully learned future hypothesis generalizes on a withheld scalar" (any heldCorrect (last learned))
  modeEvidence<-mapM (\runMode->do
    started<-getMonotonicTimeNSec
    (portfolios,definitions,counters,_)<-learnTaskSequence runMode defaultInduced [future,third]
    ended<-getMonotonicTimeNSec
    assert (show runMode++" actual Learn graphs") (length portfolios==2 && all (not . null) portfolios)
    pure (objectJSON [("mode",jsonString (show runMode)),("portfolio_sizes",arrayJSON (map (show . length) portfolios))
      ,("parameterized_inventions",show (length [i | i<-definitions,not (null (inventionParameters i))]))
      ,("statistics",objectJSON [(k,show v) | (k,v)<-M.toList counters]),("seconds",show (fromIntegral (ended-started)/1e9::Double))]))
    [Full,NoAntiUnification,NoLambdaLifting,NoOnlineAbstraction]
  createDirectoryIfMissing True "results/v03r2"
  writeFile "results/v03r2/unit_evidence.json" (objectJSON [("all_checks_passed","true"),("learned_prefix",arrayJSON (map (jsonString . exprText) (head learned)))
    ,("inventions",arrayJSON (map inventionJSON invs)),("statistics",objectJSON [(k,show v) | (k,v)<-M.toList metrics]),("mode_evidence",arrayJSON modeEvidence)]++"\n")
  putStrLn "induced-r2-tests PASS: equivalence, signatures, grounded prior ablation, scope-safe CSE, incremental cost saturation, fully learned parameterized feedback"
