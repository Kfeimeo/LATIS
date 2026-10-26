module Main where
import Synthesis.Collection.Typed
import Synthesis.Collection.Parameter
import Synthesis.Collection.Relation
import Synthesis.Collection.Referent
import qualified Synthesis.Collection.Front as F
import Synthesis.Collection.Counterfactual (Scalar(..))
import Synthesis.Collection.Indexed (KeyExpr(..),Corner(..),Axis(..))
import Latent.Grid
import Latent.Encode (defaultEncoder,encode)
import qualified Latent.Object as O
import qualified Data.Map.Strict as M
import qualified Data.Set as S
import Data.Either (isLeft)
import Control.Monad (unless,forM_)
import System.Directory (createDirectoryIfMissing)
import ARC.Evaluate (jsonString)
import Data.List (intercalate)

assert :: String -> Bool -> IO ()
assert label ok=unless ok (error ("FAIL "++label)) >> putStrLn ("PASS "++label)
must :: Either String a -> a
must=either error id
lit :: Int -> TExpr ParamLeaf
lit=TConst . VI
int, count, color :: TExpr ParamLeaf -> Param
int=must . checkedParam IntegerParam
count=must . checkedParam PositiveCount
color=must . checkedParam ArcColor
ob :: Int -> Int -> Int -> Int -> Int -> O.Object
ob i x y w c=O.Object i (Coord x y) (M.fromList [(Coord j 0,c) | j<-[0..w-1]]) 0
prog :: ObjectTransform -> F.Program
prog t=F.Program defaultEncoder (F.Inline (F.Definition scanKey (F.Body (Lit 0,Lit 0) (Lit 0,Lit 0)) True)) M.empty M.empty True Nothing Nothing (Just t) False Nothing
scanKey :: KeyExpr
scanKey=Lex (Anchor TL AY) (Anchor TL AX)
pipeline :: [TransformStep] -> ObjectTransform
pipeline=ObjectTransform (FilterBy (ColorIs 1)) DropOthers . Pipeline
ctx :: Int -> Int -> Int -> ParamContext
ctx seed w n=let os=ob 0 1 1 seed 1:[ob k (2*k) 10 1 (2+k `mod` 2) | k<-[1..n-1]]
             in ParamContext (Dimensions w 15) (Dimensions w 15) os [head os] (head os)
gridIn :: ParamContext -> Grid
gridIn c=must (gridFromCells (pcInput c) 0 (concatMap O.absolutePixels (pcWhole c)))
array :: [String] -> String
array xs="["++intercalate "," xs++"]"
pixelJSON :: PixelContribution -> String
pixelJSON p="{\"emission\":"++show (pixelEmission p)++",\"sources\":"++show (pixelSources p)++",\"x\":"++show (cx (pixelPosition p))++",\"y\":"++show (cy (pixelPosition p))++",\"color\":"++show (pixelColor p)++"}"

main :: IO ()
main=do
  createDirectoryIfMissing True "results/stage_d/full_p0/unit_mechanism"
  let hc=HoleConfig 2 1 200000 [-2..4] (baseOps++parityOps++enumeratedBoolOps) FeatureAndConstant
      expression=TApp OpIf [TApp OpIsOdd [TLeaf InputWidth],TLeaf WholeCount,TLeaf WholeColors]
      contexts seed=[ctx seed w n | (w,n)<-[(19,4),(20,5),(21,5),(22,6)]]
      target c=VI (if odd (gridWidth (pcInput c)) then length (pcWhole c) else 3)
  forM_ [1..3] $ \seed->do
    let cs=contexts seed
        fitted=synthesizeParam hc [InputWidth,WholeCount,WholeColors] PositiveCount [(c,target c) | c<-cs]
        candidates=[count (cExpr c) | c<-trFits fitted]
        pool=buildPool 10000 candidates
        (shared,sw)=fitPool SharedParamVSA pool [(c,target c) | c<-cs]
        (flat,fw)=fitPool NoParamVSA pool [(c,target c) | c<-cs]
        rule=count expression
    assert ("A synthesizes parity count seed "++show seed) (rule `elem` candidates)
    assert "B candidate set and fit set identical" (shared==flat && rule `elem` shared)
    assert "B exact VSA expansion" (S.fromList (expand (ppDAG pool) (ppUnion pool))==S.fromList (map (lambdaFromTyped . paramExpr) (ppCandidates pool)))
    -- Execute the actual Candidate.cExpr returned by A, not a K* translation.
    let selected=head [q | q<-shared,paramExpr q==expression]
        t=pipeline [Copies selected (int (lit (seed+1))) (int (lit 0))]
        allcs=cs++[ctx seed 25 6]
    forM_ (zip [0::Int ..] allcs) $ \(i,c)->do
      let n=if odd (gridWidth (pcInput c)) then length (pcWhole c) else 3
          expected=must (gridFromCells (pcOutput c) 0 [(Coord (1+k*(seed+1)+j) 1,1) | k<-[0..n-1], j<-[0..seed-1]])
          w=must (executePipeline t (pcInput c) (pcOutput c) (pcWhole c))
          rw=must (renderWitness (pcOutput c) 0 (pwEmitted w))
      assert "count/position/grid exact independent construction" (length (pwEmitted w)==n && renderResult rw==expected)
      assert "runProgram replays typed AST" (F.runProgram (prog t) (gridIn c)==Right expected)
      assert "input set permutation invariant" (executePipeline t (pcInput c) (pcOutput c) (reverse (pcWhole c))==Right w)
      assert "transform and render witness valid" (verifyPipeline t (pcInput c) (pcOutput c) (pcWhole c) w && verifyRenderWitness (pcOutput c) 0 (pwEmitted w) rw)
      assert "forged binding rejected" (not (verifyPipeline t (pcInput c) (pcOutput c) (pcWhole c) w {pwSteps=[]}))
      assert "copy provenance" (all ((==[0]) . eoSources) (pwEmitted w))
      writeFile ("results/stage_d/full_p0/unit_mechanism/count-"++show seed++"-"++show i++".json")
        ("{\"seed\":"++show seed++",\"case\":"++show i++",\"heldout\":"++(if i==4 then "true" else "false")++",\"count\":"++show n++",\"expression\":"++jsonString (show (paramExpr selected))++",\"transform_witness\":"++jsonString (show w)++",\"render_witness\":"++jsonString (show rw)++",\"witness_valid\":true,\"grid_exact\":true}")
      writeFile ("results/stage_d/full_p0/unit_mechanism/count-"++show seed++"-"++show i++".graph.json")
        ("{\"width\":"++show (gridWidth (pcOutput c))++",\"height\":"++show (gridHeight (pcOutput c))++",\"background\":0,\"source_ids\":"++show (map O.objectId (pcWhole c))++",\"emission_count\":"++show n++",\"pixels\":"++array (map pixelJSON (renderContributions rw))++",\"grid\":"++show (rows (renderResult rw))++"}")
    writeFile ("results/stage_d/full_p0/unit_mechanism/pool-"++show seed++".json")
      ("{\"candidates\":"++show (length candidates)++",\"dag_nodes\":"++show (vsaNodeCount (ppDAG pool))++",\"dag_evaluations\":"++show sw++",\"reference_evaluations\":"++show fw++",\"a_evaluations\":"++show (trEvaluations fitted)++",\"a_truncated\":"++(if trTruncated fitted then "true" else "false")++",\"candidate_coverage\":true}")
  -- A fitted two-feature position, with a genuine shared constant hole.
  let cs=contexts 2
      posRows=[(c,VI (cx (O.position (pcCurrent c))+2)) | c<-cs]
      fit=synthesizeParam hc [CurrentX,CurrentWidth] IntegerParam posRows
      xexpr=TApp OpAdd [TLeaf CurrentX,lit 2]
      x=paramFromFit fit xexpr
      y=int (TApp OpAdd [TLeaf CurrentY,TLeaf CurrentHeight])
      move=MapPosition x y
      recolor=MapColor (color (TApp OpAdd [TLeaf CurrentColor,lit 3]))
  assert "position is filled A Typed Hole" (any (\c->cExpr c==xexpr && not (null (cBindings c))) (trFits fit))
  forM_ [1..3] $ \seed->do
    let c=ctx seed 25 5
        t=pipeline [recolor,move]
        w=must (executePipeline t (pcInput c) (pcOutput c) (pcWhole c))
        result=must (renderWitness (pcOutput c) 0 (pwEmitted w))
        expected=must (gridFromCells (pcOutput c) 0 [(Coord (3+j) 2,4) | j<-[0..seed-1]])
        r=pipeline [move,Copies (count (lit 2)) (int (TApp OpAdd [TLeaf CurrentWidth,TLeaf WholeColors])) (int (TLeaf CurrentHeight))]
        wr=must (executePipeline r (pcInput c) (pcOutput c) (pcWhole c))
    assert "ColorThenMove two nonidentity steps" (renderResult result==expected && length (pwSteps w)==2)
    assert "SelectThenMoveThenReplicate feature offsets" (map (O.position . eoObject) (pwEmitted wr)==[Coord 3 2,Coord (3+seed+3) 3])
    assert "two-step runProgram" (F.runProgram (prog t) (gridIn c)==Right expected)
  -- Ambiguity remains in the store and diverges out of sample.
  let a=int (TApp OpAdd [TLeaf CurrentX,lit 2])
      b=int (TApp OpAdd [TLeaf CurrentX,TLeaf CurrentWidth])
      pool=buildPool 10 [a,b]
      c=ctx 2 20 5
      cf=ctx 3 20 5
      terms=map (lambdaFromTyped . paramExpr) [a,b]
      contextsB=[Context "train" "Object[2,1]" (evalLeaf c)]
      deps=[Context "counterfactual" "Object[3,1]" (evalLeaf cf)]
      edge=relate paramInfo contextsB deps (head terms) (terms!!1) (LLeaf CurrentWidth) [[1]]
  assert "ambiguous representatives retained" (length (ppCandidates pool)==2 && evalParam c a==evalParam c b && evalParam cf a/=evalParam cf b)
  assert "case-relative B witnessed replacement" (eStatus edge==Confirmed)
  assert "deferred candidates recoverable" (length (ppDeferred (buildPool 1 [a,b]))==1)
  let boolP=must (checkedParam BooleanParam (TApp OpIsOdd [TLeaf InputWidth]))
      boolPool=buildPool 10 [boolP]
      boolRows=[(z,VB (odd (gridWidth (pcInput z)))) | z<-cs]
  assert "Bool parameter VSA differential" (fst (fitPool SharedParamVSA boolPool boolRows)==[boolP] && fst (fitPool NoParamVSA boolPool boolRows)==[boolP])
  assert "training inconsistent labels rejected" (null (fst (fitPool SharedParamVSA pool [(c,VI 3),(c,VI 4)])))
  assert "input and output dimensions separated" (evalParam (c {pcOutput=Dimensions 30 30}) (int (TLeaf InputWidth))==Right (VI 20))
  forM_ [1..3] $ \seed->do
    let rect=O.Object 0 (Coord 1 1) (M.fromList [(Coord xx yy,1) | xx<-[0..seed+3], yy<-[0..3]]) 0
        t=pipeline [LegacyStep (Hollow 1),MapPosition (int (lit 3)) (int (lit 2))]
        w=must (executePipeline t (Dimensions 20 15) (Dimensions 20 15) [rect])
        out=eoObject (head (pwEmitted w))
    assert "ShapeThenMove reconstructs extent" (O.position out==Coord 3 2 && O.width out==seed+4 && O.height out==4 && O.size out==2*(seed+4)+4)
  forM_ [Keep,RecolorTo 3,Hollow 1,FillBBox] $ \p->
    assert "legacy local step semantic prior unchanged" (transformCost (ObjectTransform AllObjects DropOthers (Pipeline [LegacyStep p]))==transformCost (ObjectTransform AllObjects DropOthers (MapEach p)))
  -- Negative controls.
  assert "cross type rejected statically" (isLeft (checkedParam PositiveCount (TApp OpIsOdd [lit 3])))
  assert "unfilled hole rejected" (isLeft (checkedParam IntegerParam (THole 0)))
  assert "malformed operator rejected" (isLeft (checkedParam IntegerParam (TApp OpAdd [lit 1])))
  assert "division by zero explicit" (isLeft (evalParam c (int (TApp OpMod [lit 2,lit 0]))))
  assert "count refinement" (isLeft (evalParam c (count (lit 0))))
  assert "colour refinement" (isLeft (evalParam c (color (lit 10))))
  assert "ambiguous selection" (isLeft (selectObjects (FilterBy IsMaxArea) [ob 0 0 0 1 1,ob 1 2 0 1 1]))
  assert "step refinement mismatch" (isLeft (executePipeline (pipeline [MapColor (int (lit 2))]) (pcInput c) (pcOutput c) (pcWhole c)))
  assert "SizeSig invalid" (isLeft (executePipeline (pipeline [move]) (pcInput c) (Dimensions 31 15) (pcWhole c)))
  let outside=pipeline [MapPosition (int (lit 40)) (int (lit 0))]
  assert "out of bounds rejects not clips" (isLeft (F.runProgram (prog outside) (gridIn c)))
  let body=F.Inline (F.Definition scanKey (F.Body (Lit 2,Lit 2) (Lit 2,Lit 2)) True)
  assert "non-placeholder body explicitly rejected" (isLeft (F.runProgram ((prog (pipeline [move])) {F.progExec=body}) (gridIn c)))
  let es=[EmittedObject (ob 0 1 1 2 1) [0] "source",EmittedObject (ob 1 3 1 2 1) [1] "source"]
      rw=must (renderWitness (Dimensions 10 10) 0 es)
      outs=O.objects (encode defaultEncoder (renderResult rw))
  assert "same colour post-render merge valid" (length outs==1 && verifyRenderWitness (Dimensions 10 10) 0 es rw)
  assert "legacy emitted exact remains distinct" (rwUnmatchedEmitted (relationWitness (map eoObject es) es outs)==2)
  assert "forged pixel evidence rejected" (not (verifyRenderWitness (Dimensions 10 10) 0 es rw {renderContributions=[]}))
  let overlap=es++[EmittedObject (ob 2 2 1 1 3) [2] "overlap"]
      wr=must (renderWitness (Dimensions 10 10) 0 overlap)
  assert "real later-wins overlap" (cell (renderResult wr) (Coord 2 1)==Just 3 && verifyRenderWitness (Dimensions 10 10) 0 overlap wr)
  putStrLn "Stage D executable-substrate tests complete (not full P0 acceptance)."
  where paramFromFit fit e=int (cExpr (head [c | c<-trFits fit,cExpr c==e]))
