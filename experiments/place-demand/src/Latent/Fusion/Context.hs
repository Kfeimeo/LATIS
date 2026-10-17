module Latent.Fusion.Context where
import Latent.Object
import Latent.Local.Grammar
import Latent.Local.Encode
import Latent.Local.Decode
import Latent.Global.Grammar
import Latent.Global.Encode
import Latent.Global.Decode

data LatentSpec = Local LocalEncoding | Global GlobalEncoding
  | Fused LocalEncoding GlobalEncoding deriving (Eq,Ord,Show)
data FusionContext = FusionContext
  { canonical :: Scene, local :: Maybe LocalLatent, global :: Maybe GlobalLatent }
  deriving (Eq,Ord,Show)
data Provenance = Provenance { rule :: String, premises :: [String] }
  deriving (Eq,Ord,Show)
data LatentHypothesis = LatentHypothesis
  { hypothesisSpec :: LatentSpec, encodedScenes :: [FusionContext]
  , supportingConstraints :: [Provenance], encoderLength :: Int, decoderLength :: Int }
  deriving (Eq,Ord,Show)
encodeFusion :: LatentSpec -> Scene -> Either String FusionContext
encodeFusion (Local a) z = FusionContext z . Just <$> encodeLocal a z <*> pure Nothing
encodeFusion (Global a) z = FusionContext z Nothing . Just <$> encodeGlobal a z
encodeFusion (Fused a b) z = FusionContext z . Just <$> encodeLocal a z <*> (Just <$> encodeGlobal b z)
decodeFusion :: FusionContext -> Either String Scene
decodeFusion c = case (local c,global c) of
  (Just l,_) -> decodeLocal l
  (_,Just g) -> decodeGlobal g
  _ -> Right (canonical c)
reconstruction :: FusionContext -> Bool
reconstruction c = decodeFusion c == Right (canonical c)

-- Explicitly excluded from this version's experiment.
crossLatentPropagation :: String
crossLatentPropagation = "FutureWork"
