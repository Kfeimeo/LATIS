-- Re-serialize a deterministic frontend run without re-running R2. This is also
-- useful for auditing that saved metadata is independent of fallback execution.
import Synthesis.Collection
import qualified ARC.CollectionEvaluate as E
import ARC.Dataset
import System.FilePath ((</>))
import System.Environment (getArgs)
import Control.Monad (forM_)
main :: IO ()
main=do
  args<-getArgs
  let out=case args of [p]->p; _->"results/v05"
  vertical<-loadTask "data/03560426.json" >>= either error pure
  forM_ (E.stressTasks++[("03560426",vertical)]) $ \(name,t)->
    forM_ [minBound..maxBound] $ \mode->do
      let f=frontSearch mode defaultConfig (training t)
      writeFile (out </> name </> show mode </> "derivation_graph.json") (E.graphJSON (graph f)++"\n")
