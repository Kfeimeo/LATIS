module Synthesis.InducedR1.Coverage where
import Language.Induced.Base
import Synthesis.InducedR1.Specification
import Synthesis.InducedR1.Observers
import qualified Data.Map.Strict as M
import Data.List (nub)
import Control.Monad (guard)

-- Finite conditional inverse domains. Generic function observers are ordinary
-- Base expressions on a parameter, independent of requested task/operator.
functionObservers :: Type -> Type -> [(Env,Value)] -> [Expr]
functionObservers a b samples=take 384 $ nub (direct++composed)
  where
    n="__coverage_arg"
    -- Conditional transition/key observer domain is closed over its argument;
    -- capturing outer scenes here causes a redundant list-observer explosion.
    q=pointTask a [(M.singleton n x,x) | (_,x)<-samples]
    os=observations q
    terms t=take 24 [observedExpr o | o<-os,exprType (observedExpr o)==t]
    direct=[lambda n a e | e<-terms b]
    composed=[lambda n a e | p<-base,ts<-instances (primitiveName p) b
               ,length ts==2,all (\t->case t of ArrowT _ _->False; _->True) ts
               ,args<-take 96 (sequence (map terms ts)),Right e<-[call (primitiveName p) b args]]

coverage :: Int -> Primitive -> LearningTask -> [Observed] -> [Decomposition]
coverage cap p q pool=take cap $ case name of
  "filter"->filterW
  "fold"->foldW
  "sortBy"->sortW
  "argminBy"->extremeW False
  "argmaxBy"->extremeW True
  "zipWith"->zipW
  "range"->rangeW
  "if"->ifW
  "let"->letW
  _->[]
  where
    name=primitiveName p
    rows=points q; envs=map fst rows; ys=map snd rows
    available t=[o | o<-pool,exprType (observedExpr o)==t]
    listPool=[o | o<-pool,ListT _<-[exprType (observedExpr o)]]
    directLists=[o | o<-listPool,case exprNode (observedExpr o) of Var _->True; Prim "objects" _->True; _->False]
    child t vs=pointTask t (zip envs vs)
    make cs evidence=Decomposition cs (call name (targetType q)) evidence
    filterW=[make [functionTask t BoolT flags,child (ListT t) (observedValues src)]
                 "filter exact multiplicity/order inverse; predicate consistency retained across duplicate inputs"
      | ListT t<-[targetType q],src<-available (ListT t)
      ,Just masks<-[traverse mask (zip (observedValues src) ys)]
      ,let flags=[(env,x,BoolV flag) | (env,(xs,bs))<-zip envs masks,(x,flag)<-zip xs bs]]
    mask (ListV _ xs,ListV _ target)=do
      let flags=[any (equivalent x) target | x<-xs]
      guard (length target==length (filter id flags) && and (zipWith equivalent target [x | (x,True)<-zip xs flags]))
      pure (xs,flags)
    mask _=Nothing
    -- Fold final targets alone do not specify intermediate states. Condition
    -- on finite transition observations, execute each trace, then backpropagate
    -- its graph. This is sound partial coverage, not complete fold inversion.
    foldW=[make [functionTask (PairT (targetType q) t) (targetType q) graph
                ,child (targetType q) (observedValues seed),child (ListT t) (observedValues src)]
              "fold conditional transition trace; all intermediate states grounded; final state exact"
      | src<-take 2 directLists,ListT t<-[exprType (observedExpr src)]
      ,targetType q `elem` [IntT,CoordT,VecT,PlacedT,ColorT,BoolT] || t==targetType q
      ,seed<-take (if targetType q==IntT then 5 else 2) (available (targetType q))
      ,let samples=[(env,PairV s x) | (env,s,ListV _ xs)<-zip3 envs (observedValues seed) (observedValues src),x<-xs]
      ,f<-functionObservers (PairT (targetType q) t) (targetType q) samples
      ,Just traces<-[traverse (traceFold f) (zip3 envs (observedValues seed) (observedValues src))]
      ,and (zipWith equivalent (map fst traces) ys)
      ,let graph=concatMap snd traces,not (null graph)]
    traceFold f (env,seed,ListV _ xs)=go seed xs
      where go acc []=Just (acc,[])
            go acc (x:rest)=do
              Ground y<-either (const Nothing) Just (eval (M.map Ground env) f >>= (\fn->applyRuntime fn (Ground (PairV acc x))))
              (lastValue,graph)<-go y rest
              pure (lastValue,(env,PairV acc x,y):graph)
    traceFold _ _=Nothing
    sortW=[make [LearningTask (ArrowT t IntT) constraints (environment q),child (ListT t) (observedValues src)]
                "stable sort inverse -> relative key inequalities; no invented exact ranks"
      | ListT t<-[targetType q],src<-available (ListT t)
      ,Just aligned<-[traverse permutation (zip (observedValues src) ys)]
      ,let constraints=concat [orderConstraints env xs ordered | (env,(xs,ordered))<-zip envs aligned]
      ,not (null constraints)]
    permutation (ListV _ xs,ListV _ zs)=do
      guard (length xs==length zs && bag xs==bag zs)
      pure (xs,zs)
    permutation _=Nothing
    bag=M.fromListWith (+) . map (\x->(valueKey x,1::Int))
    orderConstraints env xs zs=[FunctionOrder env a b (index a xs>index b xs)
                              | (a,b)<-zip zs (drop 1 zs)]
    index a xs=length (takeWhile (not . equivalent a) xs)
    extremeW isMax=[make [LearningTask (ArrowT t IntT) constraints (environment q),child (ListT t) (observedValues src)]
                     "argmin/argmax inverse -> key inequalities with first-tie semantics"
      | let t=targetType q,src<-available (ListT t)
      ,all (\r->case r of (ListV _ xs,y)->any (equivalent y) xs; _->False) (zip (observedValues src) ys)
      ,let constraints=[if isMax then FunctionOrder env x y strict else FunctionOrder env y x strict
                       | (env,ListV _ xs,y)<-zip3 envs (observedValues src) ys,x<-xs,not (equivalent x y)
                       ,let strict=index x xs<index y xs],not (null constraints)]
    zipW=[make [functionTask (PairT a b) c graph,child (ListT a) (observedValues x),child (ListT b) (observedValues y)]
                "zipWith inverse -> paired element graph; truncation uses min length"
      | ListT c<-[targetType q],x<-take 4 directLists,y<-take 4 directLists
      ,observedExpr x/=observedExpr y
      ,map valueKey (observedValues x)/=map valueKey (observedValues y)
      ,ListT a<-[exprType (observedExpr x)],ListT b<-[exprType (observedExpr y)]
      ,Just aligned<-[traverse zipRows (zip3 (observedValues x) (observedValues y) ys)]
      ,let graph=[(env,PairV u v,w) | (env,(as,bs,cs))<-zip envs aligned,(u,v,w)<-zip3 as bs cs],not (null graph)]
    zipRows (ListV _ as,ListV _ bs,ListV _ cs)=do guard (min (length as) (length bs)==length cs); pure (as,bs,cs)
    zipRows _=Nothing
    rangeW=case traverse bounds ys of
      Just bs | not (null bs)->[make [child IntT (map (IntV . fst) bs),child IntT (map (IntV . snd) bs)] "range consecutive values imply inclusive start/exclusive end"]
      _->[]
    bounds (ListV IntT vals)=case vals of
      IntV start:_->do
        guard (vals==map IntV [start..start+length vals-1])
        pure (start,start+length vals)
      _->Nothing -- empty range bounds are underdetermined, not guessed
    bounds _=Nothing
    ifW=[make [child BoolT (observedValues cond),pointTask (targetType q) yes,pointTask (targetType q) no]
                "if lazy branch specifications restricted to selected rows"
      | cond<-available BoolT
      ,let yes=[r | (r,BoolV True)<-zip rows (observedValues cond)]
           no=[r | (r,BoolV False)<-zip rows (observedValues cond)]
      ,not (null yes),not (null no)]
    letW=[Decomposition [child (exprType (observedExpr o)) (observedValues o)
                        ,pointTask (targetType q) [(M.insert binder value env,y) | ((env,y),value)<-zip rows (observedValues o)]]
              (\es->case es of [a,b]->Right (binding binder a b); _->Left "let arity")
              "let binding witness -> explicit typed value and extended lexical environment"
      | M.size (environment q)<3,any isCollection (M.elems (environment q))
      ,o<-take 2 [o | o<-pool,case exprNode (observedExpr o) of Prim _ _->True; _->False]
      ,let binder=head ["__let"++show i | i<-[M.size (environment q)..],M.notMember ("__let"++show i) (environment q)]]
    isCollection t=case t of ListT _->True; SetT _->True; _->False
