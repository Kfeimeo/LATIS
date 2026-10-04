module Main where
import ARC.Dataset
import ARC.Evaluate
import Synthesis.Search
import Latent.Encode
import System.Environment (getArgs)
import System.Exit (die)
import System.Directory (listDirectory)
import System.FilePath ((</>),takeExtension)
import Text.Read (readMaybe)
import Data.List (sort)

usage :: String
usage = unlines
  ["LATIS v0.1 (Haskell, symbolic, no neural heuristic)"
  ,"latis solve --task data/03560426.json --out results/03560426"
  ,"latis benchmark --task data/03560426.json --out results/03560426 --repeats 3"
  ,"latis suite --out results/synthetic"
  ,"latis evaluate --data PATH --out results/dataset --limit 20"
  ,"Options: --mode Full|NoEffect|NoDependency|NoWitness|Direct --budget 1000000"
  ,"         --radius 2 --branches 256 --solutions 128 --connectivity 4|8"]
option :: String -> String -> [String] -> String
option key fallback args = case dropWhile (/=key) args of _:value:_ -> value; _ -> fallback
number :: String -> Int -> [String] -> IO Int
number key fallback args = case readMaybe (option key (show fallback) args) of
  Just n | n > 0 -> pure n
  _ -> die (key++" requires a positive integer")
main :: IO ()
main = do
  args <- getArgs
  case args of
    [] -> putStr usage
    command:rest | command `elem` ["solve","benchmark","suite","evaluate"] -> do
      mode <- maybe (die "Invalid --mode") pure (readMaybe (option "--mode" "Full" rest))
      budget <- number "--budget" 1000000 rest
      branches' <- number "--branches" 256 rest
      radius <- number "--radius" 2 rest
      solutions' <- number "--solutions" 128 rest
      conn <- case option "--connectivity" "4" rest of "4" -> pure Four; "8" -> pure Eight; _ -> die "--connectivity must be 4 or 8"
      let config = defaultSearch {searchMode=mode,stateBudget=budget,correspondenceBudget=branches',constantRadius=radius,solutionLimit=solutions',encoder=EncoderConfig conn 0}
          out = option "--out" "results/run" rest
          path = option "--task" "data/03560426.json" rest
      case command of
        "suite" -> evaluateTasks config out syntheticTasks
        "evaluate" -> do
          let dir = option "--data" "data" rest
          limit <- number "--limit" 20 rest
          paths <- take limit . sort . filter ((==".json") . takeExtension) <$> listDirectory dir
          tasks' <- traverse (\p -> loadTask (dir </> p) >>= either die pure) paths
          evaluateTasks config out tasks'
        "benchmark" -> do
          repeats <- number "--repeats" 3 rest
          task <- loadTask path >>= either die pure
          _ <- benchmark config repeats out task
          pure ()
        _ -> do
          task <- loadTask path >>= either die pure
          result <- search config (training task)
          saveResult out config task result
          putStrLn (maybe "UNSOLVED" show (solution result))
          print (statistics result)
    _ -> die usage
