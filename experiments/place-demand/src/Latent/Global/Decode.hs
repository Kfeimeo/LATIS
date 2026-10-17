module Latent.Global.Decode where
import Latent.Global.Grammar
import Latent.Object
-- Global observations are a lossless lens over the canonical residual. They
-- never replace connected components or invent pixels.
decodeGlobal :: GlobalLatent -> Either String Scene
decodeGlobal = Right . groundedResidual
