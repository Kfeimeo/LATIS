module BadHole where
import Synthesis.Hole
import Latent.Grid (Vec)

-- This fixture MUST fail to typecheck; it is excluded from the normal test suite.
bad :: Param Vec
bad = ConstantInt 3
