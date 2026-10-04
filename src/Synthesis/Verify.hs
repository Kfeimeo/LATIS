module Synthesis.Verify where
import Latent.Grid
import Latent.Encode
import Latent.Render
import Latent.Object (Scene)
import Synthesis.Skeleton

type TrainingPair = (Grid,Grid)
verify :: EncoderConfig -> [TrainingPair] -> Program -> Bool
verify config pairs p = not (null pairs) && all (\(x,y) -> predict config p x == Right y) pairs
predict :: EncoderConfig -> Program -> Grid -> Either String Grid
predict config p g = runProgram p (encode config g) >>= render

-- All search modes cache input encoding once. Each candidate is still rendered
-- and compared with every training grid; no latent-only approximation is accepted.
verifyLatent :: [(Scene,Grid)] -> Program -> Bool
verifyLatent pairs p = not (null pairs) && all (\(z,y) -> (runProgram p z >>= render) == Right y) pairs
