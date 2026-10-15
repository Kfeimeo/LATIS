module Latent.Local.Discover where
import Latent.Local.Grammar
import Latent.Local.Encode
import Latent.Object
import Synthesis.Skeleton
import Synthesis.Hole (Anchor(..))

boundedLocal :: [LocalEncoding]
boundedLocal = concat [[RelativePose o,Progression o,SharedClass o] ++
  [Pairwise o a b | (a,b)<-[(TL,TL),(BR,TL),(Center,Center)]] | o<-allOrders]
-- Discovery observes canonical scene structure. The structure of an encoder is
-- shared by every training scene; it has no task/example/test identifiers.
discoverLocal :: [Scene] -> [LocalEncoding]
discoverLocal scenes = [a | a<-boundedLocal, not (null scenes), all (supported a) scenes]
  where supported a z = length (objects z)>=2 && either (const False) (const True) (encodeLocal a z)
