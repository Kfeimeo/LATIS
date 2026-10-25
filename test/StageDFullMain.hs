module Main where
import Synthesis.Collection.Front
import Synthesis.Collection.Unified
import Synthesis.Collection.Parameter
import Synthesis.Collection.Typed
import Synthesis.Collection.Relation
import Synthesis.Collection.Shape
import ARC.StageDEvaluate (fullD)
import ARC.StageDMechanism
import ARC.Evaluate (jsonString)
import Synthesis.Collection.Referent (lambdaFromTyped,typeOfTerm,intern,vsaNodeCount)
import qualified Synthesis.Collection.Counterfactual as CF
import qualified Synthesis.Collection.Indexed as I
import Latent.Grid
import Latent.Render (render)
import Latent.Encode (encode,defaultEncoder)
import qualified Latent.Object as O
import qualified Data.Map.Strict as M
import qualified Data.Set as S
import Data.List (isInfixOf,sort)
import Data.Char (toLower)
import Data.Either (isLeft)
import Control.Monad (unless,forM_)
import System.Directory (createDirectoryIfMissing)

assert :: String -> Bool -> IO ()
assert name ok=unless ok (error ("FAIL "++name)) >> putStrLn ("PASS "++name)
must :: Either String a -> a
must=either error id
obj :: Int -> Coord -> Int -> [(Int,Int)] -> O.Object
obj i p c cells=O.Object i p (M.fromList [(Coord x y,c) | (x,y)<-cells]) 0
category :: Either String Grid -> Either String Grid
category (Right g)=Right g
category (Left message)=Left $ case map toLower message of
  m | "positivecount" `isInfixOf` m || "replication count" `isInfixOf` m->"count"
    | "arccolor" `isInfixOf` m || "color" `isInfixOf` m || "colour" `isInfixOf` m->"colour"
    | "outside" `isInfixOf` m->"bounds"
    | "division by zero" `isInfixOf` m->"arithmetic"
    | otherwise->m
oldRun :: ObjectTransform -> Dimensions -> [O.Object] -> Either String Grid
oldRun t d os=emitObjects t d os >>= \es->render (O.Scene d 0 (map eoObject es))
newRun :: ObjectTransform -> Dimensions -> [O.Object] -> Either String Grid
newRun t d os=emitObjectsInput t d d os >>= \es->render (O.Scene d 0 (map eoObject es))

main :: IO ()
main=do
  createDirectoryIfMissing True "results/stage_d/full_p0/validation"
  let grammar=RelationGrammar [1,2,3] True True [-1,0,1,2] [0,1,2,3,4] 20000
      candidates=enumerateTransforms grammar
      sets=[[],[obj 0 (Coord 1 1) 1 [(0,0)]],
            [obj 0 (Coord 1 1) 1 [(x,y) | x<-[0..3],y<-[0..3]],obj 1 (Coord 6 1) 2 [(0,0),(1,0)]],
            [obj 0 (Coord 1 1) 1 [(0,0),(1,1),(2,2)],obj 1 (Coord 4 4) 1 [(0,0)]],
            [obj 0 (Coord 1 1) 1 [(0,0),(1,0)],obj 1 (Coord 2 1) 2 [(0,0),(0,1)]]]
  forM_ (zip [0::Int ..] sets) $ \(i,os)->do
    forM_ candidates $ \t->do
      let mt=must (migrateTransform t)
      unless (transformCost mt==transformCost t && transformConstants mt==transformConstants t)
        (error ("migration cost mismatch "++show t))
      unless (category (oldRun t (Dimensions 12 12) os)==category (newRun mt (Dimensions 12 12) os))
        (error ("migration execution mismatch: "++show (i,t,oldRun t (Dimensions 12 12) os,newRun mt (Dimensions 12 12) os)))
    assert ("all legacy candidates migrate, independent render/error comparison set "++show i) True
  writeFile "results/stage_d/full_p0/validation/migration.json"
    ("{\"candidates\":"++show (length candidates)++",\"inputs\":"++show (length sets)++",\"comparisons\":"++show (length candidates*length sets)++",\"passed\":true}")
  let first=head instancesD
      cases=[DCase (encode defaultEncoder a) (dimensions b) b (O.objects (encode defaultEncoder b)) | (a,b)<-idTrain first]
      exhaustive=stageDFull {sdSkeletonBudget=46,sdCombinationBudget=128,sdMaxFits=1000,sdCaseBudget=2000}
      shared=searchUnified exhaustive cases
      flat=searchUnified exhaustive {sdVSA=False,sdOrdering=False} cases
      unordered=searchUnified exhaustive {sdOrdering=False} cases
      exprs r=sort [(gaRole g,gaCandidates g) | g<-drGoals r]
  assert "fixed-universe SharedParamVSA and NoParamVSA candidate sets identical" (exprs shared==exprs flat)
  assert "fixed-universe SharedParamVSA and NoParamVSA fit sets identical" (sort (drFits shared)==sort (drFits flat) && not (null (drFits shared)))
  assert "With/WithoutReferentOrdering bounded fit sets identical" (sort (drFits shared)==sort (drFits unordered))
  assert "NoParamVSA allocates no DAG" (M.findWithDefault 0 "d_vsa_nodes" (drMetrics flat)==0)
  assert "B changes actual parameter evaluation work" (M.findWithDefault 0 "d_dag_evaluations" (drMetrics shared)>0 && M.findWithDefault 0 "d_reference_evaluations" (drMetrics shared)>0)
  assert "deterministic complete D search" (searchUnified exhaustive cases==shared)
  let permuted=[c {dInput=(dInput c) {O.objects=reverse (O.objects (dInput c))}} | c<-cases]
  assert "whole search insensitive to input set permutation" (sort (drFits (searchUnified exhaustive permuted))==sort (drFits shared))
  let booleanExpressions=[e | g<-drGoals shared,".condition" `isInfixOf` gaRole g,e<-gaExpressions g]
      parentParameters=[must (checkedParam PositiveCount e) | g<-drGoals shared,gaRole g=="count",e<-gaExpressions g]
      parentDAG=ppDAG (buildPool 100 parentParameters)
  assert "Bool subgoals typecheck and share existing parent nodes" (not (null booleanExpressions) && all (\e->typeOfTerm (const TyInt) (lambdaFromTyped e)==Right TyBool && let (_,v)=intern (lambdaFromTyped e) parentDAG in vsaNodeCount v==vsaNodeCount parentDAG) booleanExpressions)
  writeFile "results/stage_d/full_p0/validation/differential.json"
    ("{\"candidate_sets_equal\":true,\"fit_sets_equal\":true,\"ordering_fit_sets_equal\":true,\"shared_dag_evaluations\":"++show (M.findWithDefault 0 "d_dag_evaluations" (drMetrics shared))++",\"flat_evaluations\":"++show (M.findWithDefault 0 "d_reference_evaluations" (drMetrics flat))++",\"shared_nodes\":"++show (M.findWithDefault 0 "d_vsa_nodes" (drMetrics shared))++",\"flat_nodes\":0,\"fit_count\":"++show (length (drFits shared))++",\"universe\":"++jsonString (show (exprs shared))++"}")
  let disabled=searchUnified stageDOff cases
  assert "trigger before expansion: disabled has no goals or graph" (null (drGoals disabled) && M.null (drMetrics disabled))
  let (input,_)=head (idTrain first)
      legacy=frontSearch SafeOnline fullD [(input,input)]
  assert "legacy solution returns before Stage D expansion" (program legacy/=Nothing && metric "d_triggered" (graph legacy)==0 && null (dGoals (graph legacy)))
  let (identityEmissions,_)=must (runProgramEvidence (must (maybe (Left "identity missing") Right (program legacy))) input)
      inputIds=sort (map O.objectId (O.objects (encode defaultEncoder input)))
  assert "legacy OrderedView preserves actual input source identities" (sort (concatMap eoSources identityEmissions)==inputIds && length (S.fromList (concatMap eoSources identityEmissions))==length inputIds)
  let limited=searchUnified exhaustive {sdTotalParamBudget=2,sdGoalBudget=2,sdCaseBudget=1} cases
  assert "layered budgets explicitly truncated" (M.findWithDefault 0 "d_param_truncated" (drMetrics limited)>0 && M.findWithDefault 0 "d_typed_evaluations" (drMetrics limited)<=2 && M.findWithDefault 0 "d_case_executions" (drMetrics limited)<=1)
  let int e=must (checkedParam IntegerParam e)
      c=must (checkedParam PositiveCount (TConst (VI 2)))
      zero=int (TConst (VI 0))
      forged=ObjectTransform AllObjects DropOthers (MigratedBody (MapEach Keep) [Copies c zero zero])
      square=obj 0 (Coord 1 1) 1 [(0,0),(1,0),(0,1),(1,1)]
  assert "forged migration prior annotation rejected" (isLeft (emitObjectsInput forged (Dimensions 10 10) (Dimensions 10 10) [square]))
  let mixed=ObjectTransform AllObjects DropOthers (Pipeline [SetMerge MergeUnion])
  assert "merge colour conflict rejects explicitly" (isLeft (emitObjectsInput mixed (Dimensions 10 10) (Dimensions 10 10) [square,obj 1 (Coord 3 1) 2 [(0,0)]]))
  let empty=obj 0 (Coord 1 1) 1 []
      p=ObjectTransform AllObjects DropOthers (Pipeline [MapPosition zero zero])
  assert "invalid object SizeSig rejected" (isLeft (emitObjectsInput p (Dimensions 10 10) (Dimensions 10 10) [empty]))
  assert "cross-type Bool count rejected" (isLeft (checkedParam PositiveCount (TApp OpLt [TConst (VI 1),TConst (VI 2)])))
  let diagonal=obj 0 (Coord 1 1) 1 [(0,0),(1,1),(2,2)]
      crossing=obj 0 (Coord 1 1) 1 [(0,0),(1,1),(2,2),(2,0),(0,2)]
  assert "legal primitive diagonal retained" (not (isLeft (emitObjectsInput p (Dimensions 10 10) (Dimensions 10 10) [diagonal])))
  assert "crossing local diagonals not merged into object" (isLeft (emitObjectsInput p (Dimensions 10 10) (Dimensions 10 10) [crossing]))
  let context=ParamContext (Dimensions 10 10) (Dimensions 10 10) [square] [square] square
      previous=CF.Atom (CF.Pos I.Previous (CF.Ax I.AX))
      noRank=(must (maybe (Left "identity missing") Right (program legacy)))
        {progTransform=Just p,progExec=Inline (Definition (I.Lex (I.Anchor I.TL I.AY) (I.Anchor I.TL I.AX)) (Body (previous,CF.Lit 0) (previous,CF.Lit 0)) True)}
      badColour=must (checkedParam ArcColor (TConst (VI 10)))
      badCount=must (checkedParam PositiveCount (TConst (VI 0)))
      division=int (TApp OpMod [TLeaf CurrentWidth,TConst (VI 0)])
      outside=ObjectTransform AllObjects DropOthers (Pipeline [MapPosition (int (TConst (VI 40))) zero])
      originalCase=head cases
      contradictory=searchUnified stageDFull [originalCase,originalCase {dTarget=must (gridFromCells (dOutputDims originalCase) 0 []),dTargetObjects=[]}]
      negative name result=do
        assert ("negative control "++name) (isLeft result)
        pure ("{\"name\":"++jsonString name++",\"rejected\":true,\"reason\":"++jsonString (either id (const "unexpected success") result)++"}")
  negatives<-sequence
    [negative "nonunique selection" (fmap (const ()) (selectObjects (FilterBy IsMaxArea) [square,square {O.objectId=1}]))
    ,negative "cross type" (fmap (const ()) (checkedParam PositiveCount (TApp OpIsOdd [TConst (VI 2)])))
    ,negative "division zero" (fmap (const ()) (evalParam context division))
    ,negative "count zero" (fmap (const ()) (evalParam context badCount))
    ,negative "invalid colour" (fmap (const ()) (evalParam context badColour))
    ,negative "merge colour conflict" (fmap (const ()) (emitObjectsInput mixed (Dimensions 10 10) (Dimensions 10 10) [square,obj 1 (Coord 3 1) 2 [(0,0)]]))
    ,negative "invalid SizeSig" (fmap (const ()) (emitObjectsInput p (Dimensions 10 10) (Dimensions 10 10) [empty]))
    ,negative "out of bounds" (fmap (const ()) (newRun outside (Dimensions 10 10) [square]))
    ,negative "training inconsistent" (if null (drFits contradictory) && M.findWithDefault 0 "d_not_applicable" (drMetrics contradictory)==1 then Left (unlines (drTrace contradictory)) else Right ())
    ,negative "Previous without rank witness" (fmap (const ()) (runProgram noRank input))
    ,negative "diagonal crossing" (fmap (const ()) (emitObjectsInput p (Dimensions 10 10) (Dimensions 10 10) [crossing]))]
  writeFile "results/stage_d/full_p0/validation/negative_controls.json" ("["++join negatives++"]")
  putStrLn "All Stage D full substrate and bounded differential tests passed."
  where join []=""; join [x]=x; join (x:xs)=x++","++join xs
