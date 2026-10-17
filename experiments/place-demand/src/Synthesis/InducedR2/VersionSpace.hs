module Synthesis.InducedR2.VersionSpace where
import Language.Induced.Base
import Synthesis.InducedR1.Specification
import Synthesis.InducedR2.Diversity
import Synthesis.InducedR2.Sharing
import Synthesis.InducedR2.NormalForm
import qualified Data.Map.Strict as M
import qualified Data.Set as S
import qualified Data.Sequence as Q
import Data.List (sortOn,nub)

type NodeId=Int
data VSNode = Leaf Expr | Union [NodeId]
  | Join String [NodeId] ([Expr] -> Either String Expr)
data Support = Support { supportSpec :: String, supportWitness :: String } deriving (Eq,Ord,Show)
data NodeInfo = NodeInfo
  { infoType :: Type, infoDenotation :: Maybe [String], infoSignature :: Maybe StructuralSignature
  , infoMDL :: Maybe Int, infoContext :: String, infoForm :: String
  } deriving (Eq,Ord,Show)
data Space = Space
  { nodes :: M.Map NodeId VSNode, interned :: M.Map String NodeId
  , provenance :: M.Map NodeId [Support], nextNode :: Int
  , structuralDuplicates :: Int
  , annotations :: M.Map NodeId [NodeInfo]
  , equivalenceClasses :: M.Map String (M.Map StructuralSignature Expr)
  , contexts :: M.Map String Int, contextDefinitions :: M.Map Int String
  }
emptySpace :: Space
emptySpace=Space M.empty M.empty M.empty 1 0 M.empty M.empty M.empty M.empty

denotationAt :: LearningTask -> Expr -> Maybe [String]
denotationAt q e=traverse observation (specification q)
  where
    projected env=M.filterWithKey (\n _->S.member n (freeVars e)) env
    values=M.fromList [(projected env,evalValue (projected env) e) | env<-S.toList (S.fromList [env | Point env _<-specification q])]
    observation (Point env _)=either (const Nothing) (Just . valueKey) (M.findWithDefault (Left "missing point environment") (projected env) values)
    observation (FunctionPoint env x _)=apply env x
    observation (FunctionOrder env x y _)=do a<-apply env x; b<-apply env y; pure (a++" / "++b)
    apply env x=case eval (M.map Ground env) e >>= (\f->applyRuntime f (Ground x)) of
      Right (Ground v)->Just (valueKey v); _->Nothing
contextAt :: LearningTask -> String
contextAt q=show (targetType q,[case r of Point env _->show env; FunctionPoint env x _->show (env,x); FunctionOrder env x y _->show (env,x,y) | r<-specification q])
annotate :: LearningTask -> NodeId -> Space -> Space
annotate=annotateWith False
-- Callers have checked each leaf against q. Reusing its exact value vector is
-- sound for point/function-point graphs; relational keys still need evaluation.
annotateVerified :: LearningTask -> NodeId -> Space -> Space
annotateVerified=annotateWith True
internContext :: LearningTask -> Space -> (String,Space)
internContext q s=case M.lookup description (contexts s) of
  Just identifier->("context:"++show identifier,s)
  Nothing->let identifier=M.size (contexts s)+1 in ("context:"++show identifier,s
     {contexts=M.insert description identifier (contexts s),contextDefinitions=M.insert identifier description (contextDefinitions s)})
  where description=contextAt q
annotateWith :: Bool -> LearningTask -> NodeId -> Space -> Space
annotateWith verified q i original
  | i==0=s
  | otherwise=s {annotations=M.insertWith (++) i [info] (annotations s),equivalenceClasses=updated}
  where
    (context,s)=internContext q original
    expression=case M.lookup i (nodes s) of Just (Leaf e)->Just e; _->Nothing
    expected=traverse required (specification q)
    required (Point _ y)=Just (valueKey y)
    required (FunctionPoint _ _ y)=Just (valueKey y)
    required _=Nothing
    denotation=case expression of Just e->if verified then case expected of Just ds->Just ds; _->denotationAt q e else denotationAt q e; _->expected
    info=NodeInfo (targetType q) denotation (signatureOf <$> expression)
        (exprLength <$> expression) context (case M.lookup i (nodes s) of Just (Leaf _)->"Leaf"; Just (Join label _ _)->label; _->"Union")
    updated=case (expression,denotation) of (Just e,Just ds)->insertClass context ds e (equivalenceClasses s); _->equivalenceClasses s
insertClass :: String -> [String] -> Expr -> M.Map String (M.Map StructuralSignature Expr) -> M.Map String (M.Map StructuralSignature Expr)
insertClass context ds e=M.insertWith (M.unionWith better) (context++show ds) (M.singleton (signatureOf e) e)
  where better a b=if rankWith True a<=rankWith True b then a else b
addRootClasses :: LearningTask -> [Expr] -> Space -> Space
addRootClasses q es original=s {equivalenceClasses=foldr insert (equivalenceClasses s) es}
  where
    (context,s)=internContext q original
    insert e table=case denotationAt q e of Just ds->insertClass context ds e table; _->table
addClass :: LearningTask -> Expr -> M.Map String (M.Map StructuralSignature Expr) -> M.Map String (M.Map StructuralSignature Expr)
addClass q e table=case denotationAt q e of
  Nothing->table
  Just ds->M.insertWith (M.unionWith better) (contextAt q++show ds) (M.singleton (signatureOf e) e) table
  where better a b=if rankWith True a<=rankWith True b then a else b

insertNode :: Bool -> String -> VSNode -> Support -> Space -> (NodeId,Space)
insertNode share key n why s=case if share then M.lookup key (interned s) else Nothing of
  Just i->(i,s {structuralDuplicates=structuralDuplicates s+1,provenance=M.insertWith (++) i [why] (provenance s)})
  Nothing->let i=nextNode s in (i,s {nodes=M.insert i n (nodes s),interned=M.insert key i (interned s)
                          ,provenance=M.insert i [why] (provenance s),nextNode=i+1})

rank :: Expr -> (Int,Int,Int,Int,String)
rank e=(exprLength e+S.size (symbols e)+dependencyWidth e+2*exceptions e,S.size (symbols e),dependencyWidth e,exceptions e,exprText e)
  where exceptions x=case exprNode x of
          Lit (VecV _)->1; Lit (CoordV _)->1
          Lit (SizeV _)->2
          Lit (IntV i) | abs i>2->1
          _->sum (map exceptions (children x))
        dependencyWidth x=case exprNode x of
          Lam _ _ b->S.size (freeVars b)+sum (map dependencyWidth (children x))
          _->sum (map dependencyWidth (children x))

-- Memoized extraction of a bounded ranked frontier. VSA creation does not
-- extract programs; only this final traversal (or the explicit no-sharing
-- ablation) materializes AST products. Frontier truncation is disclosed.
materialize :: Int -> Space -> NodeId -> ([Expr],Int)
materialize k s root=let (es,_,count)=go M.empty root in (es,count)
  where
    go memo i=case M.lookup i memo of
      Just es->(es,memo,0)
      Nothing->let (es,memo',count)=case M.lookup i (nodes s) of
                    Nothing->([],memo,0)
                    Just (Leaf e)->([e],memo,1)
                    Just (Union is)->let (parts,m,c)=walk memo is in (normalize (concat parts),m,c)
                    Just (Join _ is assemble)->let (parts,m,c)=walk memo is
                                                   es'=[e | args<-take (k*k) (sequence parts),Right e<-[assemble args]]
                                               in (normalize es',m,c+length es')
               in (es,M.insert i es memo',count)
    walk memo []=([],memo,0)
    walk memo (i:is)=let (a,m,c)=go memo i; (as,m',c')=walk m is in (a:as,m',c+c')
    normalize=take k . sortOn rank . S.toList . S.fromList

-- Cost-bounded extraction traverses products without k/k^2 truncation. The
-- global work allowance, not an arbitrary ranked beam, bounds traversal.
-- Alternatives above the current cost remain in the VSA for a later round.
materializeCost :: Bool -> Bool -> Bool -> Int -> Int -> Space -> NodeId -> ([Expr],Int)
materializeCost sharing prior diverse bound allowance s root=let (es,_,remaining)=go M.empty allowance root in (es,allowance-remaining)
  where
    score e=let (c,_,_)=rankWith prior e in c
    normalize es=let unique=S.toList (S.fromList [transform e | e<-es,score (transform e)<=bound]) in
      if diverse then representatives prior unique else take 32 (sortOn (rankWith prior) unique)
    transform=(if sharing then share else id) . normalForm
    go memo remaining i
      | remaining<=0=([],memo,0)
      | Just es<-M.lookup i memo=(es,memo,remaining)
      | otherwise=let (es,memo',rest)=case M.lookup i (nodes s) of
                        Nothing->([],memo,remaining)
                        Just (Leaf e)->(normalize [e],memo,remaining-1)
                        Just (Union is)->let (parts,m,r)=walk memo remaining is in (normalize (concat parts),m,r)
                        Just (Join _ is assemble)->let (parts,m,r)=walk memo remaining is
                                                       (built,left)=products assemble r (sequence parts) []
                                                   in (normalize built,m,left)
                  in (es,M.insert i es memo',rest)
    walk memo remaining []=([],memo,remaining)
    walk memo remaining (i:is)=let (a,m,r)=go memo remaining i; (as,m',r')=walk m r is in (a:as,m',r')
    products _ remaining [] acc=(acc,remaining)
    products assemble remaining (args:rest) acc
      | remaining<=0=(acc,0)
      | otherwise=case assemble args of
          Right e | score (transform e)<=bound->products assemble (remaining-1) rest (e:acc)
          _->products assemble (remaining-1) rest acc

-- Incremental cost saturation over the finite deductively constructed DAG.
-- A representative becomes available to parents only at its MDL cost. Joins
-- remember argument tuples; increasing C never redoes a previous product.
-- Each signature is a separate slot. Expensive derived expressions are pending,
-- not discarded. No frontier/alias beam is involved in this path.
saturateCost :: Bool -> Bool -> Bool -> Int -> Int -> Space -> NodeId -> ([Expr],Int,Int,[(Int,Int)])
saturateCost sharing prior diverse=saturatePolicy (if diverse then 0 else 1) sharing prior
saturatePolicy :: Int -> Bool -> Bool -> Int -> Int -> Space -> NodeId -> ([Expr],Int,Int,[(Int,Int)])
saturatePolicy aliasCap sharing prior bound allowance s root=go 1 initial M.empty M.empty allowance []
  where
    transform=(if sharing then share else id) . normalForm
    score e=let (c,_,_)=rankWith prior e in c
    needed=reachable s root
    minimumCosts=fst (minimumNode M.empty root)
    minimumNode memo i=case M.lookup i memo of
      Just cost->(memo,cost)
      Nothing->let { childIds=case M.lookup i (nodes s) of Just (Union cs)->cs; Just (Join _ cs _)->cs; _->[]
                    ; (updated,costs)=foldl (\(m,cs) child->let (m',cost)=minimumNode m child in (m',cost:cs)) (memo,[]) childIds
                    ; cost=case M.lookup i (nodes s) of
                        Just (Leaf e)->score (transform e)
                        Just (Union _)->minimum (bound+1:costs)
                        Just (Join label _ _)->overhead label+maximum (0:costs)
                        _->bound+1 }
               in (M.insert i cost updated,cost)
    -- An identity arithmetic node can disappear under a proven Base rewrite.
    -- Other retained constructors contribute a node to the shared DAG.
    overhead label=if takeWhile (/=':') label `elem` ["add","subtract","multiply"] then 0 else 1
    demands=propagate [root] (M.singleton root (M.fromList [(cost,cost) | cost<-[0..bound]]))
    propagate [] tables=tables
    propagate (parent:queue) tables=let { table=M.findWithDefault M.empty parent tables
                                          ; edges=case M.lookup parent (nodes s) of
                                              Just (Union cs)->[(child,0,0) | child<-cs]
                                              Just (Join label cs _)->[(child,overhead label,maximum (0:[M.findWithDefault (bound+1) other minimumCosts | other<-cs,other/=child])) | child<-cs]
                                              _->[]
                                          ; step (new,waiting) (child,extra,sibling)=let { proposal=M.fromList [(cost,M.findWithDefault (bound+1) (extra+max cost sibling) table) | cost<-[0..bound]]
                                                                                       ; old=M.findWithDefault M.empty child new
                                                                                       ; merged=M.unionWith min old proposal }
                                                                                   in if merged==old then (new,waiting) else (M.insert child merged new,child:waiting)
                                          ; (tables',next)=foldl step (tables,[]) edges }
                                    in propagate (queue++next) tables'
    activationCost i e=M.findWithDefault (bound+1) (score e) (M.findWithDefault M.empty i demands)
    parents=M.fromListWith (++) [(child,[i]) | (i,n)<-M.toList (nodes s),S.member i needed,child<-case n of Union is->is; Join _ is _->is; _->[]]
    initial=M.fromListWith (++) [(activationCost i e,[(i,e)]) | (i,Leaf raw)<-M.toList (nodes s),S.member i needed,let e=transform raw,activationCost i e<=bound]
    slot e=show (signatureOf e)
    values active i=M.elems (M.findWithDefault M.empty i active)
    go c pending active joined left trace
      | c>bound || left<=0=(sortOn (rankWith prior) (values active root),allowance-left,min bound (c-1),reverse trace)
      | otherwise=let (now,later)=M.partitionWithKey (\k _->k<=c) pending
                      (active',pending',joined',left')=events c (Q.fromList (concat (M.elems now))) active later joined left
                  in go (c+1) pending' active' joined' left' ((c,length (values active' root)):trace)
    events c queue active pending joined left=case Q.viewl queue of
      Q.EmptyL->(active,pending,joined,left)
      (i,e) Q.:< rest->event c i e rest active pending joined left
    event c i e rest active pending joined left
      | left<=0=(active,pending,joined,0)
      | aliasCap>0 && not (relational i) && M.size (M.findWithDefault M.empty i active)>=aliasCap
        && M.notMember (slot e) (M.findWithDefault M.empty i active)=events c rest active pending joined (left-1)
      | otherwise=case M.lookup (slot e) (M.findWithDefault M.empty i active) of
          Just old | rankWith prior old<=rankWith prior e->events c rest active pending joined (left-1)
          _->let { active'=M.insertWith M.union i (M.singleton (slot e) e) active
                 ; (more,pending',joined',left')=wake c i e active' pending joined (left-1) (S.toList (S.fromList (M.findWithDefault [] i parents))) }
              in events c (rest Q.>< Q.fromList more) active' pending' joined' left'
    relational i=any (\info->case infoType info of ArrowT _ IntT->infoDenotation info==Nothing; _->False) (M.findWithDefault [] i (annotations s))
    wake _ _ _ _ pending joined left []=([],pending,joined,left)
    wake c trigger delta active pending joined left (i:is)
      | left<=0=([],pending,joined,0)
      | otherwise=case M.lookup i (nodes s) of
          Just (Union _)->let (more,p,j,l)=wake c trigger delta active pending joined left is
                          in ((i,delta):more,p,j,l)
          Just (Join _ cs assemble)->let { previous=M.findWithDefault S.empty i joined
                                          ; tuples=[as | (position,child)<-zip [0::Int ..] cs,child==trigger
                                                       ,as<-sequence [if index==position then [delta] else values active part | (index,part)<-zip [0::Int ..] cs]
                                                       ,S.notMember as previous]
                                          ; (new,pending',seen,left')=build c i assemble tuples [] pending previous left
                                          ; (more,p,j,l)=wake c trigger delta active pending' (M.insert i seen joined) left' is }
                                      in (new++more,p,j,l)
          _->wake c trigger delta active pending joined left is
    build _ _ _ [] acc pending seen left=(acc,pending,seen,left)
    build c i assemble (args:rest) acc pending seen left
      | left<=0=(acc,pending,seen,0)
      | otherwise=let seen'=S.insert args seen in case assemble args of
          Right raw->let e=transform raw; cost=activationCost i e in
            if cost>bound then build c i assemble rest acc pending seen' (left-1)
            else if cost<=c then build c i assemble rest ((i,e):acc) pending seen' (left-1)
            else build c i assemble rest acc (M.insertWith (++) cost [(i,e)] pending) seen' (left-1)
          _->build c i assemble rest acc pending seen' (left-1)

reachable :: Space -> NodeId -> S.Set NodeId
reachable s root=go S.empty [root]
  where go seen []=seen
        go seen (i:is) | i==0||S.member i seen=go seen is
                       | otherwise=go (S.insert i seen) (case M.lookup i (nodes s) of
                           Just (Union cs)->cs++is; Just (Join _ cs _)->cs++is; _->is)

signature :: Space -> NodeId -> M.Map String [Support]
signature s root=M.map (take 8 . nub) $ M.fromListWith (++)
  [(name,M.findWithDefault [] i (provenance s)) | i<-S.toList (reachable s root)
   ,name<-case M.lookup i (nodes s) of
     Just (Leaf e)->S.toList (symbols e)
     Just (Join n _ _)->[takeWhile (/=':') n]
     _->[]]

cardinalityBound :: Space -> NodeId -> Integer
cardinalityBound s root=fst (go M.empty root)
  where
    go memo i=case M.lookup i memo of
      Just n->(n,memo)
      Nothing->let (n,m)=case M.lookup i (nodes s) of
                    Just (Leaf _)->(1,memo)
                    Just (Union cs)->combine sum memo cs
                    Just (Join _ cs _)->combine product memo cs
                    _->(0,memo)
               in (n,M.insert i n m)
    combine f memo cs=let (ns,m)=foldl (\(acc,a) i->let (n,b)=go a i in (n:acc,b)) ([],memo) cs in (f ns,m)
