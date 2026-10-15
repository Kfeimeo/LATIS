module ARC.Evaluate where
import ARC.Dataset
import Latent.Grid
import Latent.Object
import Latent.Render
import Language.Schema
import Language.DSA
import Synthesis.Hole
import Synthesis.Search
import Synthesis.Skeleton
import Synthesis.Verify
import Synthesis.MDL
import Synthesis.Abstraction
import qualified Data.Set as S
import qualified Data.Map.Strict as M
import Data.List (intercalate,sort)
import Data.Char (ord)
import Numeric (showHex)
import System.FilePath ((</>))
import System.Directory (createDirectoryIfMissing)

jsonString :: String -> String
jsonString value = "\"" ++ concatMap escape value ++ "\""
  where
    escape '"' = "\\\""
    escape '\\' = "\\\\"
    escape '\n' = "\\n"
    escape '\r' = "\\r"
    escape '\t' = "\\t"
    escape c | ord c >= 32 && ord c <= 126 = [c]
             | ord c < 65536 = unicode (ord c)
             | otherwise = let n=ord c-65536 in unicode (55296+n `div` 1024) ++ unicode (56320+n `mod` 1024)
    unicode n = let hex=showHex n "" in "\\u"++replicate (4-length hex) '0'++hex
jsonMaybe :: Show a => Maybe a -> String
jsonMaybe = maybe "null" show
pruningJSON :: Pruning -> String
pruningJSON (Pruning n r) = "{\"opportunities\":" ++ show n ++ ",\"rejected\":" ++ show r ++ ",\"ratio\":" ++
  (if n == 0 then "null" else show (fromIntegral r / fromIntegral n :: Double)) ++ "}"
statsJSON :: Stats -> String
statsJSON s = "{" ++ intercalate ","
  ["\"expanded_states\":"++show (expandedStates s),"\"complete_programs\":"++show (completePrograms s)
  ,"\"partial_skeleton_states\":"++show (partialSkeletons s),"\"maximum_search_depth\":"++show (maximumDepth s)
  ,"\"first_solution_expanded_states\":"++jsonMaybe (firstSolutionStates s)
  ,"\"first_solution_seconds\":"++jsonMaybe (firstSolutionSeconds s),"\"wall_seconds\":"++show (wallSeconds s)
  ,"\"witness_resolved_instance_holes\":"++show (witnessResolvedHoles s),"\"enumerated_schema_holes\":"++show (enumeratedHoles s)
  ,"\"dependency_relation_checks\":"++show (dependencyRelationChecks s)
  ,"\"valid_programs\":"++show (validPrograms s),"\"budget_exhausted\":"++if budgetExhausted s then "true" else "false"
  ,"\"type_pruning\":"++pruningJSON (typePruning s),"\"effect_pruning\":"++pruningJSON (effectPruning s)
  ,"\"dependency_pruning\":"++pruningJSON (dependencyPruning s),"\"witness_pruning\":"++pruningJSON (witnessPruning s)] ++ "}"
resultJSON :: SearchConfig -> Task -> SearchResult -> String
resultJSON config task result = "{" ++ intercalate ","
  ["\"task\":"++jsonString (taskId task),"\"mode\":"++jsonString (show (searchMode config))
  ,"\"config\":{\"state_budget\":"++show (stateBudget config)++",\"constant_radius\":"++show (constantRadius config)++",\"correspondence_budget\":"++show (correspondenceBudget config)++",\"solution_limit\":"++show (solutionLimit config)++",\"encoder\":"++jsonString (show (encoder config))++"}"
  ,"\"solved\":"++if maybe False (const True) (solution result) then "true" else "false"
  ,"\"program\":"++maybe "null" (jsonString . programText) (solution result)
  ,"\"description_length\":"++maybe "null" (show . programLength) (solution result)
  ,"\"distinct_symbol_kinds\":"++maybe "null" (show . S.size . taskSymbolClosure) (solution result)
  ,"\"statistics\":"++statsJSON (statistics result)
  ,"\"limitations\":["++intercalate "," (map jsonString (limitations result))++"]"
  ,"\"tests\":["++intercalate "," (map testJSON (tests task))++"]"] ++ "}"
  where
    testJSON item = case solution result of
      Nothing -> "{\"prediction\":null,\"exact\":null}"
      Just p -> case predict (encoder config) p (testInput item) of
        Left err -> "{\"error\":"++jsonString err++",\"prediction\":null,\"exact\":false}"
        Right g -> "{\"prediction\":"++jsonGrid g++",\"exact\":"++maybe "null" (\expected -> if g == expected then "true" else "false") (testOutput item)++"}"

traceMarkdown :: SearchConfig -> Task -> SearchResult -> String
traceMarkdown config task result = "# LATIS v0.1 synthesis trace\n\nTask: `"++taskId task++"`. Mode: `"++show (searchMode config)++"`.\n\n"
  ++ "Only training pairs were passed to search. Test outputs are read after selection.\n\n"
  ++ "## Correspondence, residual and dependency evidence\n\n```text\n"++unlines (synthesisTrace result)++"```\n\n"
  ++ "## Selected exact-valid program\n\n```text\n"++maybe "UNSOLVED" programText (solution result)++"\n```\n\n"
  ++ "## Typed translation constraints\n\n```text\n"++maybe "" (unlines . selectedWitnessTrace config (training task)) (solution result)++"```\n\n"
  ++ "## Task-local abstractions and transitive closure\n\n```text\n"++maybe "" (\p -> unlines (map show (abstractProgram p))++show (S.toList (taskSymbolClosure p))) (solution result)++"\n```\n\n"
  ++ "## Instrumentation\n\n```json\n"++resultJSON config task result++"\n```\n"

saveResult :: FilePath -> SearchConfig -> Task -> SearchResult -> IO ()
saveResult dir config task result = do
  createDirectoryIfMissing True dir
  writeFile (dir </> "solution.json") (resultJSON config task result ++ "\n")
  writeFile (dir </> "trace.md") (traceMarkdown config task result)
  writeFile (dir </> "primitives.md") ("# Primitive definitions\n\n"++primitiveTable)

benchmark :: SearchConfig -> Int -> FilePath -> Task -> IO [(Mode,[SearchResult])]
benchmark config repeats dir task = do
  createDirectoryIfMissing True dir
  rows' <- traverse runMode [Full,NoEffect,NoDependency,NoWitness,Direct]
  writeFile (dir </> "ablation.json") ("["++intercalate "," [resultJSON config {searchMode=mode} task r | (mode,rs) <- rows', r <- rs]++"]\n")
  writeFile (dir </> "ablation.csv") (csv rows')
  writeFile (dir </> "ablation.md") (table rows')
  case lookup Full rows' of
    Just (r:_) -> saveResult dir config {searchMode=Full} task r
    _ -> pure ()
  pure rows'
  where
    runMode mode = do
      putStrLn ("Benchmark "++show mode++" ("++show repeats++" repeats)")
      rs <- traverse (\_ -> search config {searchMode=mode} (training task)) [1..repeats]
      case rs of r:_ -> putStrLn (show (statistics r)); _ -> pure ()
      pure (mode,rs)
    median xs = let ys=sort xs in ys !! (length ys `div` 2)
    csv dataRows = "mode,repeat,solved,expanded,complete,partial,max_depth,first_states,first_seconds,wall_seconds,description_length,symbol_kinds,witness_instance_holes,enumerated_schema_holes,type_opportunities,type_rejected,effect_opportunities,effect_rejected,dependency_opportunities,dependency_rejected,witness_opportunities,witness_rejected,budget_exhausted\n" ++
      concat [intercalate "," (csvRow mode i r)++"\n" | (mode,rs) <- dataRows, (i,r) <- zip [1::Int ..] rs]
    csvRow mode i r =
      let s=statistics r; pp (Pruning n q)=[show n,show q]
      in [show mode,show i,show (maybe False (const True) (solution r)),show (expandedStates s),show (completePrograms s),show (partialSkeletons s),show (maximumDepth s),
          jsonMaybe (firstSolutionStates s),jsonMaybe (firstSolutionSeconds s),show (wallSeconds s),maybe "" (show . programLength) (solution r),
          maybe "" (show . S.size . taskSymbolClosure) (solution r),show (witnessResolvedHoles s),show (enumeratedHoles s)] ++
          concatMap pp [typePruning s,effectPruning s,dependencyPruning s,witnessPruning s] ++ [show (budgetExhausted s)]
    table dataRows = "# Ablation results\n\nSame encoder, operators, coordinate-relation grammar, state budget and exact verifier in all modes. Input encoding is cached once. Direct and NoWitness enumerate bounded numeric constants; witnesses derive constants from specifications. The selected 03560426 solution uses no numeric vector constants. Times are monotonic wall-clock medians of "++show repeats++" runs.\n\n"
      ++ "| Mode | Solved | Expanded | Complete | Partial | First states | First seconds (median) | Total seconds (median) | L | K | Witness holes | Enumerated holes |\n|---|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|\n"
      ++ concat [let s=statistics r
                 in "| "++show mode++" | "++show (maybe False (const True) (solution r))++" | "++show (expandedStates s)++" | "++show (completePrograms s)++" | "++show (partialSkeletons s)++" | "++jsonMaybe (firstSolutionStates s)++" | "++
                    (case [t | q <- rs, Just t <- [firstSolutionSeconds (statistics q)]] of [] -> "-"; ts -> show (median ts))++" | "++show (median (map (wallSeconds . statistics) rs))++" | "++
                    maybe "-" (show . programLength) (solution r)++" | "++maybe "-" (show . S.size . taskSymbolClosure) (solution r)++" | "++show (witnessResolvedHoles s)++" | "++show (enumeratedHoles s)++" |\n"
                | (mode,rs@(r:_)) <- dataRows]

-- Synthetic tasks vary colors, dimensions, positions and dependency anchors.
-- Their test outputs are withheld from the search just like the official task.
syntheticTasks :: [Task]
syntheticTasks =
  [generated "map-translate" (MapP ExtractionOrder (Move (ConstantVector (Vec 1 (-1))))) scenes
  ,generated "map-recolor" (MapP ExtractionOrder (Paint (ConstantInt 9))) singleScenes
  ,generated "map-rotate90" (MapP ExtractionOrder (Fixed Rotate90Op)) singleScenes
  ,generated "map-reflectH" (MapP ExtractionOrder (Fixed ReflectHOp)) singleScenes
  ,generated "filter-color" (FilterP (HasColor 2)) scenes
  ,generated "scan-BR-TL" (ScanP LeftToRight start (Move (VectorDifference (Corner Previous BR) (Corner Current TL)))) scenes
  ,generated "scan-TR-TL" (ScanP LeftToRight start (Move (VectorDifference (Corner Previous TR) (Corner Current TL)))) scenes
  ,generated "scan-BL-TL" (ScanP LeftToRight start (Move (VectorDifference (Corner Previous BL) (Corner Current TL)))) scenes
  ,generated "scan-reverse" (ScanP RightToLeft start (Move (VectorDifference (Corner Previous BR) (Corner Current TL)))) scenes
  ,generated "fold-bbox" FoldBBoxP monoScenes
  ,generated "iterate-chain" (IterateP 2 (Vec 1 0)) chainScenes]
  where
    start = Move (VectorDifference GridTL (Corner Current TL))
    d = Dimensions 18 18
    rect ident c x y w h = Object ident (Coord x y) (M.fromList [(Coord a b,c) | b <- [0..h-1], a <- [0..w-1]]) 0
    scenes = [Scene d 0 [rect 0 1 1 9 2 3,rect 1 2 5 10 3 2,rect 2 3 10 8 1 4],
              Scene d 0 [rect 0 4 2 11 3 2,rect 1 2 7 9 2 4,rect 2 6 12 10 2 3],
              Scene d 0 [rect 0 7 1 10 1 3,rect 1 2 6 9 2 2,rect 2 8 11 8 3 2]]
    lshape i c x y = Object i (Coord x y) (M.fromList [(Coord 0 0,c),(Coord 0 1,c),(Coord 0 2,c),(Coord 1 2,c)]) 0
    singleScenes = [Scene d 0 [lshape 0 c x y] | (c,x,y) <- [(1,2,3),(2,6,4),(5,9,6)]]
    monoScenes = [s {objects=map (`recolor` 2) (objects s)} | s <- scenes]
    chainScenes = [Scene d 0 [rect 0 3 x 3 2 2] | x <- [1,3,5]]
    generated name p zs =
      let pairs = [(must (render z),must (runProgram p z >>= render)) | z <- zs]
      in Task name (take 2 pairs) [TestPair x (Just y) | (x,y) <- drop 2 pairs]
    must = either error id

evaluateTasks :: SearchConfig -> FilePath -> [Task] -> IO ()
evaluateTasks config dir tasks' = do
  createDirectoryIfMissing True dir
  results <- traverse (\task -> do r <- search config (training task); pure (task,r)) tasks'
  writeFile (dir </> "suite.json") ("["++intercalate "," [resultJSON config t r | (t,r) <- results]++"]\n")
  writeFile (dir </> "suite.md") ("# Evaluation suite\n\n| Task | Training exact | Test exact | Expanded |\n|---|---|---|---:|\n"++
    concat ["| "++taskId t++" | "++show (maybe False (verify (encoder config) (training t)) (solution r))++" | "++show (testPass t r)++" | "++show (expandedStates (statistics r))++" |\n" | (t,r) <- results])
  mapM_ (\(t,r) -> putStrLn (taskId t++": "++maybe "UNSOLVED" programText (solution r))) results
  where testPass task r = case solution r of Nothing -> False; Just p -> all (\q -> maybe True (\g -> predict (encoder config) p (testInput q) == Right g) (testOutput q)) (tests task)
