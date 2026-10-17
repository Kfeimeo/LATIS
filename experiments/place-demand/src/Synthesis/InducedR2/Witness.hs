module Synthesis.InducedR2.Witness where
import Language.Induced.Base
import Synthesis.InducedR1.Specification
import Synthesis.InducedR2.Observers
import Synthesis.InducedR2.Coverage
import Synthesis.InducedR2.Diversity (rankWith)
import Latent.Grid
import qualified Latent.Object as O
import Latent.Correspondence
import Latent.Render (render)
import qualified Data.Map.Strict as M
import qualified Data.Set as S
import Data.List (nubBy,sortOn)
import Control.Monad (guard)

-- Experiment switch (place-demand). Unidirectional is the frozen place-only
-- behaviour: coordAdd/coordDelta/vecAdd condition on an observed RIGHT operand
-- only. Bidirectional adds the symmetric single-operator inverse that
-- conditions on an observed LEFT operand and deduces the right component
-- specification. No multi-operator template is introduced by either policy.
data WitnessPolicy = Unidirectional | Bidirectional | BidirectionalLocal | BidirectionalUnpruned deriving (Eq,Ord,Show,Read,Enum,Bounded)
-- BidirectionalUnpruned: ablation of the credit-aware residual pruning. Same
-- decompositions as Bidirectional, but residual children are emitted even when
-- they have no deductive credit left (they can then only close by forward
-- observation or a shared constant inside Learn).
-- BidirectionalLocal (extra ablation, formulated after inspecting the B1 traces
-- of stress A/C/F): the left-conditioned residual only conditions on an operand
-- that depends on at least one NON-Scene environment variable. A base point that
-- is constant per example turns the residual into an information-preserving
-- shift of the whole specification, which multiplies chance joins in two-row
-- scene-level subtasks. This is a generic type-level rule; no task identity.

-- Demand-side diagnosis (place-demand, phase B). For a conditional-algebra
-- operator this names the operand types for which the pool holds NO
-- observation at all, i.e. the witness cannot condition on that side. It is
-- a pure function of the type signature and the pool; no task identity,
-- fixture name or expected answer is consulted. Arithmetic additionally
-- reports IntT when a conditioned residual exists but is neither an observed
-- IntT term nor a shared constant (the finite-domain restriction of the
-- unchanged arithmetic witness).
missingOperands :: Primitive -> LearningTask -> [Observed] -> [Type]
missingOperands p q pool=case primitiveName p of
  n | n `elem` ["coordDelta","coordAdd","vecAdd","scale","equal","less","lessEqual"]->
      [t | t<-operandTypes n,null (available t)]
    | n `elem` ["add","subtract","multiply"]->
      [IntT | null (available IntT)] ++
      [IntT | not (null (available IntT)),not (null (points q)),not (any observedResidual (available IntT))]
  _->[]
  where
    available t=[o | o<-pool,exprType (observedExpr o)==t]
    operandTypes n=case n of
      "coordDelta"->[CoordT,CoordT]; "coordAdd"->[CoordT,VecT]; "vecAdd"->[VecT,VecT]
      "scale"->[IntT,VecT]; _->[IntT,IntT]
    ys=map snd (points q)
    inverse=case primitiveName p of
      "add"->(\y a->Just (y-a)); "subtract"->(\y a->Just (a-y))
      _->(\y a->if a/=0&&y `mod` a==0 then Just (y `div` a) else Nothing)
    observedResidual a=case traverse (\(v,t)->case (v,t) of (IntV x,IntV y)->inverse y x; _->Nothing) (zip (observedValues a) ys) of
      Just bs->any (\b->and (zipWith equivalent (observedValues b) (map IntV bs))) (available IntT)
               || case bs of z:zs->all (==z) zs; _->False
      Nothing->False

-- All witnesses are partial, bounded inverse semantics of ONE Base operator.
-- No witness creates a multi-operator task skeleton. Correlated alternatives
-- remain separate decompositions; taking unions of child constraints would be
-- unsound, so the learner joins children within each decomposition only.
witness :: Int -> Primitive -> LearningTask -> [Observed] -> [Decomposition]
witness=witnessWith Unidirectional
witnessWith :: WitnessPolicy -> Int -> Primitive -> LearningTask -> [Observed] -> [Decomposition]
witnessWith policy=witnessAt policy maxBound
-- `remaining` is the deductive credit of the CURRENT task (its children get
-- remaining-1). Bidirectional residual witnesses use it only to skip a residual
-- child that could not be learned anyway: a child with credit 0 is closed by
-- forward observation or a shared constant alone, so a non-observed residual
-- at credit 0 would return an empty version space after spending work.
-- Unidirectional ignores it (frozen behaviour).
witnessAt :: WitnessPolicy -> Int -> Int -> Primitive -> LearningTask -> [Observed] -> [Decomposition]
witnessAt policy remaining corrLimit p q pool=take 64 $ case primitiveName p of
  "lambda" -> case targetType q of
    ArrowT a b->let n=head ["v"++show i | i<-[M.size (environment q)..],M.notMember ("v"++show i) (environment q)]
                    rows=[(M.insert n x env,y) | FunctionPoint env x y<-specification q]
                in [Decomposition [pointTask b rows] (\es->case es of [e]->Right (lambda n a e); _->Left "lambda arity") "function graph -> parameter binding and output points" | not (null rows)]
    _->[]
  "mkScene"->sceneWitness
  "map"->listWitness False
  "scan"->listWitness True
  n | n `elem` ["filter","fold","sortBy","argminBy","argmaxBy","zipWith","range","if","let"]->coverage corrLimit p q pool
  "place"->placeWitness
  "TransformD4"->orientationWitness
  "Recolor"->recolorWitness
  "coordDelta"->algebra
  "coordAdd"->algebra
  "vecAdd"->algebra
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
    -- Unidirectional: exact frozen place-only behaviour. Bidirectional keeps
    -- every original decomposition (joins, else right-conditioned residuals)
    -- and adds the left-conditioned residuals; Learn deduplicates by the
    -- canonical child specifications, so distinct residual specifications
    -- survive and child version spaces keep all structural representatives.
    algebra=case policy of
      Unidirectional->preferGround coordinateJoin
      _->case coordinateJoin of
        []->filter childLearnable coordinateResidual++leftResidual
        ds->ds
    localOperand o=policy/=BidirectionalLocal || any (\v->M.lookup v (environment q)/=Just SceneT) (S.toList (freeVars (observedExpr o)))
    -- A residual child whose values are neither observed nor a shared constant
    -- needs at least one unit of credit to decompose further.
    childLearnable d=policy==BidirectionalUnpruned || remaining>=2 || all learnableChild (decompositionChildren d)
    learnableChild c=let vs=map snd (points c) in
      any (\o->exprType (observedExpr o)==targetType c && and (zipWith equivalent (observedValues o) vs) && length (observedValues o)==length vs) pool
      || case vs of v:rest->all (equivalent v) rest; _->False
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
    -- Left-conditioned single-operator inverse, in actual argument order:
    --   coordAdd(a,v)=t,   a observed  =>  v = t - a   (VecT residual)
    --   coordDelta(p,q)=v, p observed  =>  q = p - v   (CoordT residual)
    --   vecAdd(u,w)=y,     u observed  =>  w = y - u   (VecT residual)
    -- Each row keeps its own (example, operand) pairing: the residual vector
    -- is computed row by row from zip ys (observedValues left). Candidate
    -- left operands are ordered by the ordinary grounded MDL rank (shortest,
    -- least-ungrounded first) and capped like the right-conditioned residual.
    leftResidual=filter childLearnable
      [decomp [child leftType (observedValues left),child rightType inferred]
         "coordinate/vector inverse: condition on left operand and deduce right component specification"
      | let (leftType,rightType)=case n of "coordDelta"->(CoordT,CoordT); "coordAdd"->(CoordT,VecT); _->(VecT,VecT)
      ,left<-take 16 (sortOn (rankWith True . observedExpr) (filter localOperand (available leftType)))
      ,Just inferred<-[traverse inverseRight (zip ys (observedValues left))]]
    inverseRight (CoordV (Coord x y),CoordV (Coord a b)) | n=="coordAdd"=Just (VecV (Vec (x-a) (y-b)))
    inverseRight (VecV (Vec x y),CoordV (Coord a b)) | n=="coordDelta"=Just (CoordV (Coord (a-x) (b-y)))
    inverseRight (VecV (Vec x y),VecV (Vec a b)) | n=="vecAdd"=Just (VecV (Vec (x-a) (y-b)))
    inverseRight _=Nothing
    inverseCoord (VecV (Vec x y),CoordV (Coord a b)) | n=="coordDelta"=Just (CoordV (Coord (x+a) (y+b)))
    inverseCoord (CoordV (Coord x y),VecV (Vec a b)) | n=="coordAdd"=Just (CoordV (Coord (x-a) (y-b)))
    inverseCoord (VecV (Vec x y),VecV (Vec a b)) | n=="vecAdd"=Just (VecV (Vec (x-a) (y-b)))
    inverseCoord _=Nothing
    placeWitness=case traverse unplace ys of
      Just pairs->[decomp [child ObjectT (map fst pairs),child CoordT (map snd pairs)]
        "place inverse: output local geometry and absolute origin; no translation template"]
      _->[]
    unplace (PlacedV o)=Just (ObjectV (o {O.position=Coord 0 0,O.orientation=0}),CoordV (O.position o))
    unplace _=Nothing
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
