-- Bounded forward observations condition witnesses. They are small Base
-- expressions, not complete Scene programs or a list of structural families.
module Synthesis.Induced.Observers where
import Language.Induced.Base
import Latent.Grid (Coord(..))
import Synthesis.Induced.Specification
import qualified Data.Map.Strict as M
import Data.List (sortOn,foldl')

data Observed = Observed { observedExpr :: Expr, observedValues :: [Value] } deriving (Eq,Show)
observations :: LearningTask -> [Observed]
observations q=dedup 96 $ constants++vars++pairs++sceneObs++lists++listItems++objectObs++setLists++setItems++coordinates++scalars
  where
    envs=map fst (points q)
    observe e=case traverse (\env->evalValue env e) envs of
      Right vs | not (null vs)->[Observed e vs]; _->[]
    vars=concat [observe (variable n t) | (n,t)<-M.toAscList (environment q)]
    constants=concatMap (observe . literal) ([IntV i | i<-[-2..2]]++[ColorV i | i<-[0..9]]++[BoolV False,BoolV True,CoordV (Coord 0 0)]++[AnchorV i | i<-[0..4]]++[D4V i | i<-[0..7]])
    pairs=concat [unary n t v | v<-vars,PairT a b<-[exprType (observedExpr v)],(n,t)<-[("fst",a),("snd",b)]]
    sceneObs=concat [unary n t v | v<-vars++pairs,exprType (observedExpr v)==SceneT,(n,t)<-[("objects",ListT PlacedT),("canvasSize",SizeT),("background",ColorT)]]
    rawLists=[v | v<-vars++pairs++sceneObs,ListT _<-[exprType (observedExpr v)]]
    sorted=concat [observe e | v<-rawLists,exprType (observedExpr v)==ListT PlacedT,k<-keys,
                             Right e<-[call "sortBy" (ListT PlacedT) [k,observedExpr v]]]
    lists=sorted++concat [unary "tail" (exprType (observedExpr v)) v | v<-rawLists++sorted]
    -- Keys come from the ordinary observer language on an abstract element.
    -- No Order enum, task-ID, classifier, or preferred scan route is consulted.
    keys=let p=variable "key" PlacedT
             anchors=[e | i<-[0..4],Right e<-[call "Anchor" CoordT [p,literal (AnchorV i)]]]
             xy=[e | a<-anchors,n<-["x","y"],Right e<-[call n IntT [a]]]
             sizes=[e | Right o<-[call "objectOf" ObjectT [p]],Right c<-[call "ObjectCells" (SetT CellT) [o]],Right e<-[call "cardinality" IntT [c]]]
             ints=xy++sizes
         in [lambda "key" PlacedT e | a<-ints,e<-a:[b | Right b<-[call "subtract" IntT [literal (IntV 0),a]]]]
    listItems=concat [unary "head" t v++concat [binary "index" t v (Observed (literal (IntV i)) (replicate (length envs) (IntV i))) | i<-[0,1]]
                    | v<-dedup 32 (rawLists++lists),ListT t<-[exprType (observedExpr v)]]
    placed=[v | v<-vars++pairs++listItems,exprType (observedExpr v)==PlacedT]
    objectObs=concat [unary n t v | v<-placed,(n,t)<-[("objectOf",ObjectT),("poseOf",PoseT)]]++
      concat [unary n t o | p<-placed,o<-unary "objectOf" ObjectT p,(n,t)<-[("ObjectCells",SetT CellT),("ObjectColors",SetT ColorT)]]
    coordinates=concat [binary "Anchor" CoordT p (Observed (literal (AnchorV i)) (replicate (length envs) (AnchorV i))) | p<-placed,i<-[0..4]]
    setLists=concat [unary "setToList" (ListT t) o | o<-objectObs,SetT t<-[exprType (observedExpr o)]]
    setItems=concat [unary "head" t o | o<-setLists,ListT t<-[exprType (observedExpr o)]]
    scalars=concat [unary n t v | v<-vars++pairs++sceneObs++objectObs++setItems++coordinates,
                  (n,t)<-case exprType (observedExpr v) of
                    CoordT->[("x",IntT),("y",IntT)]; VecT->[("dx",IntT),("dy",IntT)]
                    SizeT->[("width",IntT),("height",IntT)]
                    SetT _->[("cardinality",IntT)]; ColorT->[("colorToInt",IntT)]
                    _->[]]
    unary n t a=case call n t [observedExpr a] of Right e->observe e; _->[]
    binary n t a b=case call n t [observedExpr a,observedExpr b] of Right e->observe e; _->[]

-- Retain two structural alternatives per semantic observation; cap each type.
-- Both limits are disclosed as search bounds, never completeness claims.
dedup :: Int -> [Observed] -> [Observed]
dedup cap xs=reverse kept
  where
    (_,_,kept)=foldl' step (M.empty,M.empty :: M.Map Type Int,[]) (sortOn (exprLength . observedExpr) xs)
    step acc@(seen,counts,ys) o
      | M.findWithDefault 0 key seen>=2 || M.findWithDefault 0 ty counts>=cap=acc
      | otherwise=(M.insertWith (+) key 1 seen,M.insertWith (+) ty 1 counts,o:ys)
      where ty=exprType (observedExpr o); key=(ty,map valueKey (observedValues o))
