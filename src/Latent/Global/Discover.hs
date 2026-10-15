module Latent.Global.Discover where
import Latent.Global.Grammar
import Latent.Global.Encode
import Latent.Object
import Synthesis.Skeleton (Order(..))

boundedGlobal :: [GlobalEncoding]
boundedGlobal = [SceneBBox] ++ [Axis a | a<-[Vertical,Horizontal,Diagonal,AntiDiagonal]] ++
  [Alignment a | a<-[Vertical,Horizontal,Diagonal,AntiDiagonal]] ++
  [Symmetry a | a<-[Vertical,Horizontal,Diagonal,AntiDiagonal]] ++
  [Repetition LeftToRight,Repetition TopToBottom,GlobalOrder LeftToRight,GlobalOrder TopToBottom]
discoverGlobal :: [Scene] -> [GlobalEncoding]
discoverGlobal scenes = [a | a<-boundedGlobal, not (null scenes), all (supported a) scenes]
  where supported a z = length (objects z)>=2 && either (const False) (const True) (encodeGlobal a z)
