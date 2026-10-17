module Synthesis.Abstraction where
import Synthesis.Skeleton
import Synthesis.Hole
import Synthesis.MDL
import qualified Data.Set as S
import Latent.Grid (Vec)
import Language.Types (Ty(TVec))

data Concept = Concept { conceptName :: String, parameters :: [String], conceptBody :: String, dependencies :: S.Set String }
  deriving (Eq, Show)
-- Factor the repeated Translate(current, <typed parameter>) instances into a
-- local lambda. Symbols remain transitively visible to MDL, including observers.
abstractProgram :: Program -> [Concept]
abstractProgram (ScanP _ start step) =
  [Concept "Start" ["current"] (actionText start) (actionSymbols start),
   Concept "Attach" ["prev","current"] (actionText step) (actionSymbols step)]
abstractProgram (MapP _ action) = [Concept "Transform" ["current"] (actionText action) (actionSymbols action)]
abstractProgram _ = []
taskSymbolClosure :: Program -> S.Set String
taskSymbolClosure p = programSymbols p `S.union` S.unions (map dependencies (abstractProgram p))

translationAntiUnification :: [(Context,Param Vec)] -> Either String (AntiUnified Vec)
translationAntiUnification = antiUnify TVec "vec"
