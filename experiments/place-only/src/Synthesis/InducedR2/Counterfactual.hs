-- Input-only bounded ambiguity audit. It neither supplies target labels nor
-- changes the ranking/program/dictionary. Minimality is within this domain.
module Synthesis.InducedR2.Counterfactual where
import Language.Induced.Base
import Synthesis.InducedR2.Diversity
import Latent.Grid
import Latent.Encode
import Latent.Render
import qualified Latent.Object as O
import qualified Data.Set as S
import Data.List (sortOn)

data Ambiguity = Ambiguity
  { hypothesisA :: Expr, hypothesisB :: Expr, distinguishingInput :: Grid
  , hypotheticalPredictionA :: Grid, hypotheticalPredictionB :: Grid
  , counterfactualCalls :: Int, hypotheticalDomainSize :: Int
  } deriving (Eq,Show)
diagnose :: EncoderConfig -> [Expr] -> [Grid] -> (Maybe Ambiguity,Int)
diagnose=diagnoseWith True
diagnoseWith :: Bool -> EncoderConfig -> [Expr] -> [Grid] -> (Maybe Ambiguity,Int)
diagnoseWith prior encoder candidates inputs=search 0 domain
  where
    hypotheses=take 12 (representatives prior candidates)
    pairs=case hypotheses of a:rest->[(a,b) | b<-rest,signatureOf a/=signatureOf b]; _->[]
    domain=take 128 (sortOn complexity (S.toList (S.fromList (concatMap variants inputs))))
    complexity g=let scene=encode encoder g; Dimensions w h=dimensions g in (length (O.objects scene),w*h,show g)
    variants g=let scene=encode encoder g; Dimensions w h=O.canvas scene in
      [x | s<-[scene {O.canvas=Dimensions (max 1 (w+dw)) (max 1 (h+dh))} | (dw,dh)<-[(a,b) | a<-[-2,-1,0,1,2],b<-[-2,-1,0,1,2],a/=0||b/=0]]
             ++[scene {O.objects=[if O.objectId o==O.objectId selected then o {O.position=Coord (cx (O.position o)+dx) (cy (O.position o)+dy)} else o | o<-O.objects scene]}
                | selected<-O.objects scene,(dx,dy)<-[(1,0),(-1,0),(0,1),(0,-1)]]
         ,Right x<-[render s],x/=g]
      ++[x | p<-[Coord 0 0,Coord (w-1) 0,Coord 0 (h-1),Coord (w-1) (h-1)],color<-[1..9],color/=O.background scene
             ,Right x<-[mkGrid [[if Coord a b==p then color else value | (a,value)<-zip [0..] row] | (b,row)<-zip [0..] (rows g)]],x/=g]
      ++[x | color<-[1..9],color/=O.background scene,Right x<-[mkGrid [[if value==O.background scene then color else value | value<-row] | row<-rows g]],x/=g]
    prediction e x=do y<-runFunction e (SceneV (encode encoder x)); case y of SceneV scene->render scene; _->Left "non-scene"
    search calls []=(Nothing,calls)
    search calls (x:xs)=case distinguish calls x pairs of
      Left used->search used xs
      Right evidence->(Just evidence,counterfactualCalls evidence)
    distinguish calls _ []=Left calls
    distinguish calls x ((a,b):rest)=case (prediction a x,prediction b x) of
      (Right ya,Right yb) | ya/=yb->Right (Ambiguity a b x ya yb (calls+2) (length domain))
      _->distinguish (calls+2) x rest
