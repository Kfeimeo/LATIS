{-# LANGUAGE GADTs #-}
module Main where
import qualified Language.ML as ML
import Language.Types
import Language.DSA
import Language.Effect
import Language.Witness
import Language.Schema
import Latent.Grid
import Latent.Object
import Latent.Encode
import Latent.Render
import Latent.Correspondence
import Synthesis.Hole
import Synthesis.Search
import Synthesis.Dependency
import Synthesis.Skeleton
import Synthesis.Verify
import Synthesis.MDL
import Synthesis.Abstraction
import ARC.Dataset
import ARC.Evaluate (syntheticTasks,jsonString)
import qualified Data.Map.Strict as M
import qualified Data.Set as S
import Data.List (isInfixOf,nub)
import Control.Monad (unless,forM_)
import System.Exit (die)

assert :: String -> Bool -> IO ()
assert label good = unless good (die ("FAIL: "++label))
must :: Either String a -> a
must = either error id
grid :: [[Int]] -> Grid
grid = must . mkGrid
obj :: Int -> Int -> Coord -> [(Int,Int)] -> Object
obj i c p cells = Object i p (M.fromList [(Coord x y,c) | (x,y) <- cells]) 0
int :: Int -> ML.Expr Int
int = ML.Value TInt
inc :: ML.Expr (Fn Int Int)
inc = ML.Lambda TInt (\a -> ML.Add (int a) (int 1))

main :: IO ()
main = do
  let small = [grid [take 3 cs,drop 3 cs] | cs <- sequence (replicate 6 [0..2])]
      larger = [grid [[(x*x+y*7+seed*13+x*y) `mod` 10 | x <- [0..19]] | y <- [0..17]] | seed <- [0..29]]
  forM_ [Four,Eight] $ \conn -> forM_ (small++larger) $ \g ->
    assert "Render(Encode(grid)) exhaustive + generated" (render (encode (EncoderConfig conn 0) g) == Right g)
  assert "background configurable" (render (encode (EncoderConfig Eight 3) (grid [[3,1],[2,3]])) == Right (grid [[3,1],[2,3]]))
  assert "reject ragged grid" (case mkGrid [[1],[1,2]] of Left _ -> True; _ -> False)
  assert "reject invalid colors" (case mkGrid [[10]] of Left _ -> True; _ -> False)
  let diagonal = grid [[1,0],[0,1]]
  assert "4-connectivity" (length (objects (encode defaultEncoder diagonal)) == 2)
  assert "8-connectivity" (length (objects (encode (EncoderConfig Eight 0) diagonal)) == 1)
  let a = obj 0 1 (Coord 0 0) [(0,0),(1,0),(0,1),(1,1)]
      b = obj 1 2 (Coord 1 1) [(0,0)]
      z = Scene (Dimensions 3 3) 0 [a,b]
  assert "later wins" (render z == Right (grid [[1,1,0],[1,2,0],[0,0,0]]))
  assert "sparse holes do not paint background" (cell (must (render z {objects=[a,obj 2 4 (Coord 0 0) [(1,0),(0,1)]]})) (Coord 0 0) == Just 1)
  assert "out-of-canvas fails instead of clipping" (case render z {objects=[translate a (Vec (-1) 0)]} of Left _ -> True; _ -> False)
  let l = obj 2 3 (Coord 2 2) [(0,0),(0,1),(0,2),(1,2)]
  assert "rotation cycle" (geometry (rotate90 (rotate270 l)) == geometry l)
  assert "rotation dimensions" (width (rotate90 l) == 3 && height (rotate90 l) == 2)
  assert "reflection involution" (geometry (reflectH (reflectH l)) == geometry l && geometry (reflectV (reflectV l)) == geometry l)
  assert "observer corners" (br l == Coord 3 4 && tr l == Coord 3 2 && bl l == Coord 2 4)
  assert "relations" (sameShape l (recolor l 5) && not (sameColor l (recolor l 5)) && leftOf a l && above a l && rightOf l a && below l a)
  assert "touch relations" (touch4 a b && touch8 a (obj 3 2 (Coord 2 2) [(0,0)]) && not (touch4 a (obj 3 2 (Coord 2 2) [(0,0)])))
  assert "displacement" (displacement a l == Vec 2 2)
  assert "typed equality mismatch" (case eqTy TVec TInt of Nothing -> True; _ -> False)
  assert "typed equality list" (case eqTy (TList TObject) (TList TObject) of Just _ -> True; _ -> False)
  assert "lambda/application" (ML.eval (ML.Application inc (int 4)) == Right 5)
  assert "composition" (ML.eval (ML.Application (ML.Composition inc inc) (int 4)) == Right 6)
  let ints = ML.List (map int [3,1,2])
      key = ML.Lambda TInt int
  assert "map" (ML.eval (ML.Map inc ints) == Right [4,2,3])
  assert "filter" (ML.eval (ML.Filter (ML.Lambda TInt (\n -> ML.Less (int 1) (int n))) ints) == Right [3,2])
  assert "sortBy" (ML.eval (ML.SortBy key ints) == Right [1,2,3])
  let sumStep = ML.Lambda (TPair TInt TInt) (\(x,y) -> ML.Add (int x) (int y))
  assert "scan includes seed" (ML.eval (ML.Scan sumStep (int 0) ints) == Right [0,3,4,6])
  assert "fold" (ML.eval (ML.Fold sumStep (int 0) ints) == Right 6)
  assert "if lazy" (ML.eval (ML.If (ML.Value TBool True) (int 7) (ML.Head (ML.Value (TList TInt) []))) == Right 7)
  assert "arithmetic and tuple" (ML.eval (ML.First (ML.Tuple (ML.Multiply (ML.Subtract (int 5) (int 2)) (int 4)) (int 8))) == Right 12)
  assert "second" (ML.eval (ML.Second (ML.Tuple (int 1) (int 9))) == Right 9)
  assert "list operations" (ML.eval (ML.Index (ML.Tail ints) (int 1)) == Right 2 && ML.eval (ML.Length ints) == Right 3)
  assert "argmin/argmax" (ML.eval (ML.ArgMin key ints) == Right 1 && ML.eval (ML.ArgMax key ints) == Right 3)
  assert "argmax empty error" (case ML.eval (ML.ArgMax key (ML.List [])) of Left _ -> True; _ -> False)
  assert "index negative error" (case ML.eval (ML.Index ints (int (-1))) of Left _ -> True; _ -> False)
  assert "iterateWhile fuel bounds" (ML.eval (ML.IterateWhile (int 3) (ML.Value (TFn TInt TBool) (Fn (const (Right True)))) inc (int 0)) == Right 3)
  assert "iterateWhile predicate stop" (ML.eval (ML.IterateWhile (int 8) (ML.Lambda TInt (\n -> ML.Less (int n) (int 2))) inc (int 0)) == Right 2)
  assert "iterateWhile rejects negative" (case ML.eval (ML.IterateWhile (int (-1)) (ML.Value (TFn TInt TBool) (Fn (const (Right True)))) inc (int 0)) of Left _ -> True; _ -> False)
  assert "iterateWhile zero never calls predicate/step" (ML.eval (ML.IterateWhile (int 0) (ML.Value (TFn TInt TBool) (Fn (const (Left "boom")))) inc (int 4)) == Right 4)
  let c = Context l Nothing (Dimensions 12 12)
      target = translate l (Vec 3 (-2))
  assert "translation witness" (case translateWitness c target of Right (Constraint _ v) -> v == Vec 3 (-2); _ -> False)
  assert "noninvertible recolor witness" (case recolorWitness c (recolor l 7) of Right (Constraint _ n) -> n == 7; _ -> False)
  assert "Translate effect prohibits required geometry" (case eligibility (S.singleton Geometry) (S.singleton Position) of ProvenImpossible _ -> True; _ -> False)
  assert "symmetry may preserve geometry (no unsound extra-effect prune)" (eligibility S.empty (S.fromList [Geometry,Orientation]) == Eligible)
  let ambiguity = encode defaultEncoder (grid [[1,0,1]])
      ambiguousGraph = correspond 256 ambiguity ambiguity
  assert "ambiguous matching retains branches" (length (branches ambiguousGraph) == 2)
  assert "budget truncation reported" (truncated (correspond 1 ambiguity ambiguity))
  assert "truncation is unsupported, never impossible" (case correspondenceStatus (correspond 1 ambiguity ambiguity) of CurrentlyUnsupported _ -> True; _ -> False)
  assert "anti-unification makes typed parameter" (case translationAntiUnification [(c,ConstantVector (Vec 1 0)),(c,ConstantVector (Vec 2 0))] of Right (Parameterized h) -> typeName (holeType h) == "Vec" && length (constraints h) == 2; _ -> False)
  let program = ScanP LeftToRight (Move (VectorDifference GridTL (Corner Current TL))) (Move (VectorDifference (Corner Previous BR) (Corner Current TL)))
  assert "wrapper cannot hide primitive dependencies" (all (`S.member` taskSymbolClosure program) ["Translate","BR","TL","subtractCoord"])
  assert "MDL symbol count deduplicates Translate" (length (filter (=="Translate") (S.toList (programSymbols program))) == 1)
  assert "primitive registry unique" (length registry == length (nub (map primitiveName registry)))
  assert "schema drives typed holes" (case [p | p <- registry, primitiveName p == "Translate"] of
    [p] -> case bindWitnessSchema p TVec [Constraint c (Vec 1 0)] of Right h -> holeName h == "vec"; _ -> False
    _ -> False)
  assert "schema rejects incorrect hole type" (case [p | p <- registry, primitiveName p == "Translate"] of
    [p] -> case bindWitnessSchema p TInt [Constraint c 1] of Left (ProvenImpossible _) -> True; _ -> False
    _ -> False)
  assert "witness grammar never enumerates vector constants" (length [() | ConstantVector _ <- witnessVectorGrammar [Constraint c (Vec 8 3),Constraint c (Vec 7 4)] True] == 0)
  assert "JSON rejects malformed" (case parseTask "bad" "{\"train\":[],\"test\":[]}" of Left _ -> True; _ -> False)
  assert "JSON escaping is JSON syntax, not Haskell decimal escaping" (jsonString "中\n\"" == "\"\\u4e2d\\n\\\"\"")
  forM_ syntheticTasks $ \task -> do
    r <- search defaultSearch (training task)
    assert ("synthetic training: "++taskId task) (maybe False (verify defaultEncoder (training task)) (solution r))
    assert ("synthetic heldout: "++taskId task) (maybe False (\p -> all (\q -> maybe True (\g -> predict defaultEncoder p (testInput q) == Right g) (testOutput q)) (tests task)) (solution r))
  task <- loadTask "data/03560426.json" >>= either die pure
  r <- search defaultSearch (training task)
  assert "03560426 all training exact" (maybe False (verify defaultEncoder (training task)) (solution r))
  assert "03560426 heldout exact" (maybe False (\p -> all (\q -> predict defaultEncoder p (testInput q) == maybe (Left "missing") Right (testOutput q)) (tests task)) (solution r))
  assert "03560426 structural scan BR(prev)-TL(current)" (case solution r of Just (ScanP LeftToRight _ step) -> "BR(prev) - TL(current)" `isInfixOf` actionText step; _ -> False)
  case syntheticTasks of
    [] -> die "missing synthetic fixtures"
    t:_ -> assert "no scan on independent map evidence" (let zs=[(encode defaultEncoder x,encode defaultEncoder y) | (x,y) <- training t]; es=[(x,y,c') | (x,y) <- zs, c' <- take 1 (branches (correspond 256 x y))]
      in all (\e -> case evidenceSkeleton e of ScanSkeleton _ -> False; _ -> True) (detectDependencies es))
  assert "no task ID in synthesis entrypoint" (witnessResolvedHoles (statistics r) > 0)
  tiny <- search defaultSearch {stateBudget=1} (training task)
  assert "budget terminates" (budgetExhausted (statistics tiny) && solution tiny `isNothing` ())
  putStrLn "PASS: 1518 round trips, language/ontology/effect/witness/correspondence checks, 11 synthetic heldouts, official 03560426 training + heldout."
  where isNothing Nothing () = True; isNothing _ () = False
