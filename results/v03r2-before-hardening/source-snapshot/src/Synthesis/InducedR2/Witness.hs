module Synthesis.InducedR2.Witness where
import Language.Induced.Base
import Synthesis.InducedR1.Specification
import Synthesis.InducedR2.Observers
import Synthesis.InducedR2.Coverage
import Latent.Grid
import qualified Latent.Object as O
import Latent.Correspondence
import Latent.Render (render)
import qualified Data.Map.Strict as M
import Data.List (nubBy)
import Control.Monad (guard)

-- All witnesses are partial, bounded inverse semantics of ONE Base operator.
-- No witness creates a multi-operator task skeleton. Correlated alternatives
-- remain separate decompositions; taking unions of child constraints would be
-- unsound, so the learner joins children within each decomposition only.
witness :: Int -> Primitive -> LearningTask -> [Observed] -> [Decomposition]
witness corrLimit p q pool=take 64 $ case primitiveName p of
  "lambda" -> case targetType q of
    ArrowT a b->let n=head ["v"++show i | i<-[M.size (environment q)..],M.notMember ("v"++show i) (environment q)]
                    rows=[(M.insert n x env,y) | FunctionPoint env x y<-specification q]
                in [Decomposition [pointTask b rows] (\es->case es of [e]->Right (lambda n a e); _->Left "lambda arity") "function graph -> parameter binding and output points" | not (null rows)]
    _->[]
  "mkScene"->sceneWitness
  "map"->listWitness False
  "scan"->listWitness True
  n | n `elem` ["filter","fold","sortBy","argminBy","argmaxBy","zipWith","range","if","let"]->coverage corrLimit p q pool
  "Translate"->translateWitness
  "TransformD4"->orientationWitness
  "Recolor"->recolorWitness
  "coordDelta"->preferGround coordinateJoin
  "coordAdd"->preferGround coordinateJoin
  "vecAdd"->preferGround coordinateJoin
  "scale"->binaryMatching IntT VecT
  "coord"->components (\v->case v of CoordV (Coord x y)->Just (IntV x,IntV y); _->Nothing)
  "vec"->components (\v->case v of VecV (Vec x y)->Just (IntV x,IntV y); _->Nothing)
  "size"->components (\v->case v of SizeV (Dimensions w h)->Just (IntV w,IntV h); _->Nothing)
  "tuple"->components (\v->case v of PairV a b->Just (a,b); _->Nothing)
  "add"->arithmetic (\y a->Just (y-a))
  "subtract"->arithmetic (\y a->Just (a-y))
  "multiply"->arithmetic (\y a->if a/=0&&y `mod` a==0 then Just (y `div` a) else Nothing)
  "equal"->binaryMatching IntT IntT
  "less"->binaryMatching IntT IntT
  "lessEqual"->binaryMatching IntT IntT
  "contains"->concat [binaryMatching (SetT t) t | t<-nubBy (==) [a | o<-pool,SetT a<-[exprType (observedExpr o)]]]
  _->[] -- explicit WitnessMissing; forward observations still supply support
  where
    n=primitiveName p
    rows=points q
    envs=map fst rows
    ys=map snd rows
    available t=[o | o<-pool,exprType (observedExpr o)==t]
    child t vs=pointTask t (zip envs vs)
    build=call n (targetType q)
    decomp cs why=Decomposition cs build why
    matching actual=length actual==length ys && and (zipWith equivalent actual ys)
    preferGround []=coordinateResidual
    preferGround ds=ds
    evalOp as=do e<-call n (targetType q) (map literal as); evalValue M.empty e
    components split=case traverse split ys of
      Just pairs@((a,b):_)->[decomp [child (valueType a) (map fst pairs),child (valueType b) (map snd pairs)] "component projection of output specification"]
      _->[]
    binaryMatching a b=
      [decomp [child a (observedValues x),child b (observedValues y)] ("conditional algebra witness; "++exprText (observedExpr x)++" / "++exprText (observedExpr y))
      | x<-available a,y<-available b
      , Right actual<-[traverse (\(u,v,target)->do z<-evalOp [u,v]; if equivalent z target then Right z else Left "conditional output mismatch")
                        (zip3 (observedValues x) (observedValues y) ys)],matching actual]
    arithmetic inverse=
      [decomp [child IntT (observedValues a),child IntT (map IntV bs)] "conditional scalar inverse (observed operand; remaining values deduced)"
      | a<-available IntT,Just bs<-[traverse (\(v,t)->case (v,t) of (IntV x,IntV y)->inverse y x; _->Nothing) (zip (observedValues a) ys)]
      -- Partial conditional witness: restrict the residual operand to this
      -- finite observed domain. This is disclosed witness coverage, not a
      -- complete integer grammar or a task-specific relation catalogue.
      ,all ((<=4096) . abs) bs
      ,any (\b->and (zipWith equivalent (observedValues b) (map IntV bs))) (available IntT)
       || case bs of z:zs->all (==z) zs; _->False]
    coordinateResidual=
      [decomp [child leftType inferred,child rightType (observedValues right)]
         "coordinate/vector inverse: condition on right operand and deduce left component specification"
      | let (leftType,rightType)=case n of "coordDelta"->(CoordT,CoordT); "coordAdd"->(CoordT,VecT); _->(VecT,VecT)
      ,right<-take 16 (available rightType)
      ,Just inferred<-[traverse inverseCoord (zip ys (observedValues right))]]
    -- Indexed inverse join: a-b=y / a+b=y determine the left denotation
    -- once the right denotation is conditioned. This has the same finite
    -- domains as binaryMatching, without evaluating their Cartesian product.
    coordinateJoin=
      [decomp [child leftType inferred,child rightType (observedValues right)]
         "indexed algebra inverse; child equivalence classes retain all structural representatives"
      | right<-available rightType
      ,Just inferred<-[traverse inverseCoord (zip ys (observedValues right))]
      ,M.member (map valueKey inferred) leftValues]
      where
        (leftType,rightType)=case n of "coordDelta"->(CoordT,CoordT); "coordAdd"->(CoordT,VecT); _->(VecT,VecT)
        leftValues=M.fromList [(map valueKey (observedValues o),()) | o<-available leftType]
    inverseCoord (VecV (Vec x y),CoordV (Coord a b)) | n=="coordDelta"=Just (CoordV (Coord (x+a) (y+b)))
    inverseCoord (CoordV (Coord x y),VecV (Vec a b)) | n=="coordAdd"=Just (CoordV (Coord (x-a) (y-b)))
    inverseCoord (VecV (Vec x y),VecV (Vec a b)) | n=="vecAdd"=Just (VecV (Vec (x-a) (y-b)))
    inverseCoord _=Nothing
    translateWitness=
      [decomp [child PlacedT sources,child VecT (map VecV deltas)]
        ("Translate: v_i=Anchor(target_i,TL)-Anchor(source_i,TL); Vec specification="++show deltas)
      | x<-available PlacedT,let sources=observedValues x
      , Just deltas<-[traverse delta (zip sources ys)]]
    delta (PlacedV a,PlacedV b)
      | O.geometry a==O.geometry b=Just (difference (O.tl b) (O.tl a))
    delta _=Nothing
    orientationWitness=
      [decomp [child PlacedT (observedValues x),child D4T (map D4V ds)] "finite D4 forward inverse; geometry and position exact"
      | x<-available PlacedT
      , let domains=[ [i | i<-[0..7],equivalent (PlacedV (d4 a i)) b] | (PlacedV a,b)<-zip (observedValues x) ys]
      , length domains==length ys,ds<-take 16 (sequence domains)]
    recolorWitness=
      [decomp [child PlacedT (observedValues x),child ColorT (map ColorV cs)] "uniform color residual with geometry/position preserved"
      | x<-available PlacedT,Just cs<-[traverse recolorValue (zip (observedValues x) ys)]]
    recolorValue (PlacedV a,PlacedV b)
      | O.shape a==O.shape b && O.position a==O.position b=O.color b
    recolorValue _=Nothing

    listWitness isScan=
      [ if isScan then
          decomp [functionTask (PairT t t) t steps,child t seeds,child (ListT t) tails]
            ("scan witness: output head is seed; ((y_(i-1),x_i),y_i)="++show [(a,b) | (_,a,b)<-steps]++"; includes-seed convention; no task classifier")
        else decomp [functionTask t t pairs,child (ListT t) (observedValues x)]
            ("map witness: corresponding f(x_i)=y_i; element instances="++show (length pairs))
      | ListT t<-[targetType q],x<-available (ListT t)
      , Just aligned<-[traverse sameLength (zip (observedValues x) ys)]
      , not isScan || all (not . null . fst) aligned
      , let pairs=[(env,a,b) | (env,(as,bs))<-zip envs aligned,(a,b)<-zip as bs]
            steps=[(env,PairV prev a,b) | (env,(as,bs))<-zip envs aligned,(prev,a,b)<-zip3 bs (drop 1 as) (drop 1 bs)]
            seeds=[a | (_,a:_)<-aligned]
            tails=[ListV t (drop 1 as) | (as,_)<-aligned]
      , not isScan || not (null steps)]
    sameLength (ListV _ as,ListV _ bs) | length as==length bs=Just (as,bs)
    sameLength _=Nothing
    filterWitness=
      [decomp [functionTask t BoolT flags,child (ListT t) (observedValues x)] "subsequence witness -> per-element membership predicate"
      | ListT t<-[targetType q],x<-available (ListT t)
      , Just lists<-[traverse subsequence (zip (observedValues x) ys)]
      , let flags=[(env,a,BoolV (any (equivalent a) bs)) | (env,(as,bs))<-zip envs lists,a<-as]]
    subsequence (ListV _ as,ListV _ bs)=do
      guard (equivalent (ListV (elementType as bs) [a | a<-as,any (equivalent a) bs]) (ListV (elementType as bs) bs))
      pure (as,bs)
    subsequence _=Nothing
    elementType (a:_) _=valueType a
    elementType _ (b:_)=valueType b
    elementType _ _=PlacedT

    -- mkScene's list spec ranges over correspondences and legal paint orders.
    -- Orders are finite *observed list expressions*, checked by original Render.
    -- This operation does not select map/scan/filter: Learn(List Placed) visits
    -- all compatible Base rules and their independently derived child specs.
    sceneWitness=
      [decomp [child SizeT [SizeV (O.canvas s) | s<-targets]
              ,child ColorT [ColorV (O.background s) | s<-targets]
              ,child (ListT PlacedT) (map (ListV PlacedT . map PlacedV) alternatives)]
        ("mkScene residual: canonical correspondence + Render-validated paint order; branch="++show j)
      | Just targets<-[traverse sceneValue ys],source<-sceneSources,ordering<-available (ListT PlacedT)
      ,let domains=[targetOrders input output order | (input,output,order)<-zip3 source targets (observedValues ordering)]
      , (j,alternatives)<-zip [0::Int ..] (take corrLimit (sequence domains))]
      where
        sceneValue (SceneV s)=Just s; sceneValue _=Nothing
        sceneSources=nubBy (\a b->map (valueKey . SceneV) a==map (valueKey . SceneV) b)
          [ss | x<-available SceneT,Just ss<-[traverse sceneValue (observedValues x)]]
        targetOrders input output order= nubBy sameOrder $ concat
          [orders c | c<-branches (correspond corrLimit input output)]
          where
            orders c=
              [os | ListV _ values<-[order]
                  ,let ids=[O.objectId a | PlacedV a<-values]
                  ,all (`elem` map O.objectId (O.objects input)) ids
                  ,let os=[targetObject e | i<-ids,e<-matched c,O.objectId (sourceObject e)==i]
                  ,length os==length (matched c),render (output {O.objects=os})==render output]
            sameOrder a b=map (valueKey . PlacedV) a==map (valueKey . PlacedV) b

effectContradiction :: Primitive -> LearningTask -> [Observed] -> Bool
effectContradiction p q pool=case primitiveEffect p of
  PositionEffect -> not (any (all compatible . (`zip` ys) . observedValues) sources)
  GeometryEffect -> not (any (all samePosition . (`zip` ys) . observedValues) sources)
  ColorEffect -> not (any (all sameShapePosition . (`zip` ys) . observedValues) sources)
  _->False
  where
    sources=[o | o<-pool,exprType (observedExpr o)==PlacedT]
    ys=map snd (points q)
    compatible (PlacedV a,PlacedV b)=O.geometry a==O.geometry b
    compatible _=False
    samePosition (PlacedV a,PlacedV b)=O.position a==O.position b
    samePosition _=False
    sameShapePosition (PlacedV a,PlacedV b)=O.shape a==O.shape b&&O.position a==O.position b
    sameShapePosition _=False
