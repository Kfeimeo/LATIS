-- Bounded forward observations condition witnesses. They are small Base
-- expressions, not complete Scene programs or a list of structural families.
module Synthesis.InducedR2.Observers where
import Language.Induced.Base
import Latent.Grid (Coord(..))
import Synthesis.InducedR1.Specification
import Synthesis.InducedR2.Diversity
import qualified Data.Map.Strict as M
import qualified Data.Set as S
import Data.List (sortOn,foldl')

data Observed = Observed { observedExpr :: Expr, observedValues :: [Value] } deriving (Eq,Show)
observations :: LearningTask -> [Observed]
observations q=dedup 0 (rawObservations q)
rawObservations :: LearningTask -> [Observed]
rawObservations q=constants++vars++pairs++sceneObs++lists++listItems++objectObs++setLists++setItems++coordinates++canvasCoords++scalars++offsetScalars++componentCoords++numericCompositions++numericOffsets
  where
    envs=map fst (points q)
    observe e=let projected=[M.filterWithKey (\n _->S.member n (freeVars e)) env | env<-envs]
                  values=M.fromList [(env,evalValue env e) | env<-S.toList (S.fromList projected)]
              in case traverse (\env->M.findWithDefault (Left "missing projected environment") env values) projected of
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
                    | v<-dedup 0 (rawLists++lists),ListT t<-[exprType (observedExpr v)]]
    placed=[v | v<-vars++pairs++listItems,exprType (observedExpr v)==PlacedT]
    objectObs=concat [unary n t v | v<-placed,(n,t)<-[("objectOf",ObjectT)]]++
      concat [unary n t o | p<-placed,o<-unary "objectOf" ObjectT p,(n,t)<-[("ObjectCells",SetT CellT),("ObjectColors",SetT ColorT)]]
    coordinates=concat [binary "Anchor" CoordT p (Observed (literal (AnchorV i)) (replicate (length envs) (AnchorV i))) | p<-placed,i<-[0..4]]
    canvasCoords=concat [observe e | s<-sceneObs,exprType (observedExpr s)==SizeT
      ,Right w<-[call "width" IntT [observedExpr s]],Right h<-[call "height" IntT [observedExpr s]]
      ,(a,b)<-[(literal (IntV 0),literal (IntV 0)),(w,literal (IntV 0)),(literal (IntV 0),h),(w,h)]
      ,Right e<-[call "coord" CoordT [a,b]]]
    setLists=concat [unary "setToList" (ListT t) o | o<-objectObs,SetT t<-[exprType (observedExpr o)]]
    setItems=concat [unary "head" t o | o<-setLists,ListT t<-[exprType (observedExpr o)]]
    scalars=concat [unary n t v | v<-vars++pairs++sceneObs++objectObs++setItems++coordinates++canvasCoords,
                  (n,t)<-case exprType (observedExpr v) of
                    CoordT->[("x",IntT),("y",IntT)]; VecT->[("dx",IntT),("dy",IntT)]
                    SizeT->[("width",IntT),("height",IntT)]
                    SetT _->[("cardinality",IntT)]; ColorT->[("colorToInt",IntT)]
                    _->[]]
    -- Uniform small-constant arithmetic on grounded scalar observations.
    -- No task identifier or requested output is consulted.
    offsetScalars=concat [observe e | a<-dedup 0 scalars,exprType (observedExpr a)==IntT
      ,n<-["add","subtract"],i<-[-1,1]
      ,Right e<-[call n IntT [observedExpr a,literal (IntV i)]]]
    -- Component composition of every observed Size, with the same universal
    -- arithmetic grammar. This is not a GridBR symbol or a whole-program route.
    componentCoords=concat [observe e | sz<-vars++pairs++sceneObs,exprType (observedExpr sz)==SizeT
      ,Right w<-[call "width" IntT [observedExpr sz]],Right h<-[call "height" IntT [observedExpr sz]]
      ,a<-variants w,b<-variants h,Right e<-[call "coord" CoordT [a,b]]]
    variants a=a:literal (IntV 0):[e | n<-["add","subtract"],i<-[-1,1],Right e<-[call n IntT [a,literal (IntV i)]]]
    numericCompositions=concat [observe e | a<-vars++pairs,exprType (observedExpr a)==IntT
      ,b<-vars++pairs++constants,exprType (observedExpr b)==IntT,n<-["add","subtract","multiply"]
      ,Right e<-[call n IntT [observedExpr a,observedExpr b]]]
    numericOffsets=concat [observe e | a<-numericCompositions,n<-["add","subtract"],i<-[-1,1]
      ,Right e<-[call n IntT [observedExpr a,literal (IntV i)]]]
    unary n t a=case call n t [observedExpr a] of Right e->observe e; _->[]
    binary n t a b=case call n t [observedExpr a,observedExpr b] of Right e->observe e; _->[]

-- place-demand: evaluate ONE ordinary Base term in the given environments
-- (projected to its free variables, exactly as rawObservations does). Returns
-- [] when the term fails in any environment. Used only by demand expansion.
observeTerm :: [Env] -> Expr -> [Observed]
observeTerm envs e=
  let projected=[M.filterWithKey (\n _->S.member n (freeVars e)) env | env<-envs]
      values=M.fromList [(env,evalValue env e) | env<-S.toList (S.fromList projected)]
  in case traverse (\env->M.findWithDefault (Left "missing projected environment") env values) projected of
       Right vs | not (null vs)->[Observed e vs]; _->[]

-- The cap argument remains for witness API compatibility; Full has no alias
-- or type beam cap. Each denotation/signature keeps its best representative.
dedup :: Int -> [Observed] -> [Observed]
dedup _=selectObserved True 0
selectObserved :: Bool -> Int -> [Observed] -> [Observed]
selectObserved diverse cap=selectBy diverse cap (\o->(exprType (observedExpr o),map valueKey (observedValues o))) observedExpr
