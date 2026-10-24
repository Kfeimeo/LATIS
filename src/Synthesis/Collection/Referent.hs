-- LATIS Stage B: case-relative abstract referents.
--
--   B1  canonical first-order lambda terms over Sigma = AtomicTSL leaves + typed
--       ML operators (constant folding, total identities, commutative argument
--       order), special-value nodes (closed constant subtrees in normal form)
--   B2  the witnessed one-step relation  O_A ->_C O_B  (structural replacement
--       of a special value by an input-dependent term, equal normal forms,
--       agreement on every grounded training context, type and dependency
--       witnesses); case agreement is case-relative support only
--   B3  hash-consed typed DAG with exact union factorization (VSA); the
--       expansion of a class equals the plain candidate list; e-class merging
--       only by the normal-form identities, never by training agreement
--   B4  the referent graph of one task (train-only contexts), agreement
--       classes, confirmed / pending / unsupported edges, SCC quotient and
--       transitive closure for indexing, four search schedules
--
-- The module is generic in the leaf type `l`; the binder vector of every
-- referent is fixed and implicit (x = (object, scene, set)): each leaf is an
-- atomic observer applied to one binder, there are no nested binders, so
-- alpha-renaming is the identity on this representation and substitution of
-- a closed subtree by a term over the same binders cannot capture.
module Synthesis.Collection.Referent
  ( -- B1
    LTerm(..), Path, lambdaFromTyped, lambdaToTyped, lambdaFromScalar, normalize, sigmaVersion, typeOfTerm
  , specialValues, substituteAt, lLeaves, lConstants, lSize, lDepth, lCost, renderL, evalL, isOpaque, hasOpaque
    -- B2
  , StructuralWitness(..), CaseWitness(..), DependencyWitness(..), TypeWitness(..), EdgeStatus(..), Edge(..)
  , LeafInfo(..), Context(..), dependencyOf, relate, edgeText
    -- B3
  , VSA, VNode(..), emptyVSA, intern, expand, vsaNodeCount, vsaUnionCount, factorClass, evaluateDAG, reachableCount
    -- B4
  , Schedule(..), StageB(..), stageBOff, Provenance(..), Referent(..), RefGraph(..), GraphStats(..)
  , buildGraph, refreshGraph, scheduleOrder, ClassSearch(..), searchClasses, searchFlat, RefSummary(..), graphSummary, contextIndex
  ) where

import Synthesis.Collection.Typed
import Synthesis.Collection.Counterfactual (Scalar(..), Library, AbsDef(..), instantiate, SlotLeaf(..))
import qualified Data.Map.Strict as M
import qualified Data.Map as ML
import qualified Data.Set as S
import Data.List (sortOn, sort, nub, intercalate, subsequences)
import Data.Char (ord)
import Data.Maybe (fromMaybe)

------------------------------------------------------------------------------
-- B1. Canonical lambda terms
------------------------------------------------------------------------------

-- A first-order term over Sigma. LOpaque marks a node that could not be
-- expanded (unknown abstraction, depth bound, unfilled hole, unbound
-- constant): it never folds, never matches an identity and never counts as a
-- special value, so no generalization proof can be fabricated through it.
data LTerm l = LLeaf l | LConst TVal | LApp TOp [LTerm l] | LOpaque String deriving (Eq,Ord,Show)
type Path = [Int]

-- Sigma / normalization strategy version. Every graph records it; witnesses
-- are only comparable under the same version.
sigmaVersion :: String
sigmaVersion="stage-b/sigma-1: ops Add Sub Mul Mod IsOdd If Lt Gt Eq And Or Not; NF = constant folding + total identities (x+0, x-0, x-x, x*1, x*0, x mod +-1, not not, and/or idempotence+units, if same branches/const cond/not cond, Gt->Lt, x<x, x==x) + commutative argument sort; subterm-dropping identities only when the dropped subterm is total"

lambdaFromTyped :: TExpr l -> LTerm l
lambdaFromTyped (TLeaf l)=LLeaf l
lambdaFromTyped (TConst v)=LConst v
lambdaFromTyped (THole i)=LOpaque ("unfilled hole ?c"++show i)
lambdaFromTyped (TApp op as)=LApp op (map lambdaFromTyped as)
lambdaToTyped :: LTerm l -> Maybe (TExpr l)
lambdaToTyped (LLeaf l)=Just (TLeaf l)
lambdaToTyped (LConst v)=Just (TConst v)
lambdaToTyped (LOpaque _)=Nothing
lambdaToTyped (LApp op as)=TApp op <$> traverse lambdaToTyped as

-- Bounded expansion of a v0.6.1 scalar expression: Call(I_k) is inlined from
-- the library at most `depth` levels deep; beyond the bound, or for an unknown
-- abstraction or an unbound abstraction constant, the node is Opaque.
lambdaFromScalar :: Int -> Library -> Scalar -> LTerm SlotLeaf
lambdaFromScalar depth lib=go depth
  where
    go _ (Lit n)=LConst (VI n)
    go _ (ConstVar i)=LOpaque ("unbound abstraction constant "++show i)
    go _ (Atom a)=LLeaf (LeafAtom a)
    go d (Plus a b)=LApp OpAdd [go d a,go d b]
    go _ (Typed t)=lambdaFromTyped t
    go d (Call n args)=case M.lookup n lib of
      Nothing->LOpaque ("unknown abstraction "++n)
      Just def | d<=0->LOpaque ("call "++n++" beyond the inlining depth bound")
               | length (absParamKinds def)/=length args->LOpaque ("arity mismatch for "++n)
               | otherwise->go (d-1) (instantiate args (absBody def))

isOpaque :: LTerm l -> Bool
isOpaque (LOpaque _)=True
isOpaque _=False
hasOpaque :: LTerm l -> Bool
hasOpaque (LOpaque _)=True
hasOpaque (LApp _ as)=any hasOpaque as
hasOpaque _=False
lLeaves :: LTerm l -> [l]
lLeaves (LLeaf l)=[l]
lLeaves (LApp _ as)=concatMap lLeaves as
lLeaves _=[]
lConstants :: LTerm l -> Int
lConstants (LConst _)=1
lConstants (LApp _ as)=sum (map lConstants as)
lConstants _=0
lSize :: LTerm l -> Int
lSize (LApp _ as)=1+sum (map lSize as)
lSize _=1
lDepth :: LTerm l -> Int
lDepth (LApp _ as)=1+maximum (0:map lDepth as)
lDepth _=0
-- abstraction cost: size plus the literal penalty of the scalar prior
lCost :: LTerm l -> Int
lCost t=lSize t+4*lConstants t
renderL :: (l -> String) -> LTerm l -> String
renderL f (LLeaf l)=f l
renderL _ (LConst (VI n))=show n
renderL _ (LConst (VB b))=show b
renderL _ (LOpaque s)="Opaque<"++s++">"
renderL f (LApp op as)=opName op++"("++intercalate "," (map (renderL f) as)++")"
evalL :: (l -> Either String TVal) -> LTerm l -> Either String TVal
evalL f (LLeaf l)=f l
evalL _ (LConst v)=Right v
evalL _ (LOpaque s)=Left ("opaque node: "++s)
evalL f (LApp op as)=traverse (evalL f) as >>= applyOp op

typeOfTerm :: (l -> TTy) -> LTerm l -> Either String TTy
typeOfTerm lt (LLeaf l)=Right (lt l)
typeOfTerm _ (LConst v)=Right (tyOf v)
typeOfTerm _ (LOpaque s)=Left ("opaque node has no checked type: "++s)
typeOfTerm lt (LApp op as)=do
  ts<-traverse (typeOfTerm lt) as
  let (want,out)=opSignature op
  if ts==want then Right out else Left ("ill-typed application of "++opName op++": "++show ts++" expected "++show want)

-- A subterm is total when its evaluation cannot fail: no opaque node, no Mod
-- with a non-constant (or zero) divisor, no partial leaf.
totalTerm :: (l -> Bool) -> LTerm l -> Bool
totalTerm partial=go
  where go (LLeaf l)=not (partial l)
        go (LConst _)=True
        go (LOpaque _)=False
        go (LApp OpMod [a,LConst (VI d)])=d/=0 && go a
        go (LApp OpMod _)=False
        go (LApp _ as)=all go as

-- Normal form: bottom-up constant folding of closed subtrees (through the ML
-- evaluator; a closed subtree whose evaluation fails is kept and is not a
-- value), commutative argument sorting, and the total identities listed in
-- sigmaVersion. Identities that drop a subterm are applied only when the
-- dropped subterm is total, so a rewrite never weakens a precondition.
normalize :: Ord l => (l -> Bool) -> LTerm l -> LTerm l
normalize partial=fix (8::Int)
  where
    fix 0 t=t
    fix k t=let t'=step t in if t'==t then t else fix (k-1) t'
    step (LApp op as0)=
      let as=map step as0
          consts=[v | LConst v<-as]
      in if length consts==length as && not (null as)
           then case applyOp op consts of Right v->LConst v; Left _->LApp op as
           else rules (LApp op (if commutative op then sort as else as))
    step t=t
    total=totalTerm partial
    rules t=case t of
      LApp OpAdd [a,LConst (VI 0)]->a
      LApp OpAdd [LConst (VI 0),a]->a
      LApp OpSub [a,LConst (VI 0)]->a
      LApp OpSub [a,b] | a==b && total a->LConst (VI 0)
      LApp OpMul [a,LConst (VI 1)]->a
      LApp OpMul [LConst (VI 1),a]->a
      LApp OpMul [a,LConst (VI 0)] | total a->LConst (VI 0)
      LApp OpMul [LConst (VI 0),a] | total a->LConst (VI 0)
      LApp OpMod [a,LConst (VI d)] | abs d==1 && total a->LConst (VI 0)
      LApp OpNot [LApp OpNot [b]]->b
      LApp OpAnd [a,b] | a==b->a
      LApp OpAnd [LConst (VB True),a]->a
      LApp OpAnd [a,LConst (VB True)]->a
      LApp OpAnd [LConst (VB False),a] | total a->LConst (VB False)
      LApp OpAnd [a,LConst (VB False)] | total a->LConst (VB False)
      LApp OpOr [a,b] | a==b->a
      LApp OpOr [LConst (VB False),a]->a
      LApp OpOr [a,LConst (VB False)]->a
      LApp OpOr [LConst (VB True),a] | total a->LConst (VB True)
      LApp OpOr [a,LConst (VB True)] | total a->LConst (VB True)
      LApp OpIf [c,a,b] | a==b && total c->a
      LApp OpIf [LConst (VB True),a,b] | total b->a
      LApp OpIf [LConst (VB False),a,b] | total a->b
      LApp OpIf [LApp OpNot [c],a,b]->LApp OpIf [c,b,a]
      LApp OpGt [a,b]->LApp OpLt [b,a]
      LApp OpLt [a,b] | a==b && total a->LConst (VB False)
      LApp OpEq [a,b] | a==b && total a->LConst (VB True)
      _->t

-- Special-value subtrees of a normal form: after constant folding every closed
-- value subtree is a single LConst node, so the subtrees are atomic and never
-- overlap (replacement order is irrelevant). Opaque nodes are never values.
specialValues :: LTerm l -> [(Path,TVal)]
specialValues=go []
  where go p (LConst v)=[(reverse p,v)]
        go p (LApp _ as)=concat [go (i:p) a | (i,a)<-zip [0..] as]
        go _ _=[]
substituteAt :: Path -> LTerm l -> LTerm l -> LTerm l
substituteAt [] new _=new
substituteAt (i:is) new (LApp op as)=LApp op [if j==i then substituteAt is new a else a | (j,a)<-zip [0..] as]
substituteAt _ _ t=t
isSubterm :: Eq l => LTerm l -> LTerm l -> Bool
isSubterm x t=x==t || case t of LApp _ as->any (isSubterm x) as; _->False
subtermAt :: Path -> LTerm l -> Maybe (LTerm l)
subtermAt [] t=Just t
subtermAt (i:is) (LApp _ as) | i<length as=subtermAt is (as !! i)
subtermAt _ _=Nothing

------------------------------------------------------------------------------
-- B2. The witnessed one-step relation
------------------------------------------------------------------------------

-- Leaf meta-information supplied by the instantiating front end.
data LeafInfo l = LeafInfo
  { liType :: l -> TTy, liName :: l -> String, liInput :: l -> String, liPrecondition :: l -> [String]
  , liPartial :: l -> Bool
  , liSortDetermined :: l -> Bool }   -- the leaf's value is fixed by the size index of the object binder (Ext)
-- A grounded context: identifier, the size-index sort of its object binder
-- (for the type witness), and the leaf evaluator.
data Context l = Context { cxId :: String, cxSort :: String, cxEval :: l -> Either String TVal }

data StructuralWitness l = StructuralWitness
  { swPaths :: [Path], swReplaced :: TVal, swReplacement :: LTerm l, swBefore :: LTerm l, swAfter :: LTerm l, swVersion :: String } deriving (Eq,Show)
-- Case agreement is case-relative support: the ids of the contexts on which
-- both terms evaluate and agree; disagreement names the contexts; Unknown
-- records why no agreement could be established (no context, evaluation
-- failure = precondition not met).
data CaseWitness = CaseAgree [String] | CaseDisagree [String] [String] | CaseUnknown String deriving (Eq,Show)
-- Dependency evidence for the replacement term F: observed variation over the
-- grounded and the type-safe counterfactual contexts (confirmed), syntactic
-- dependence only (free leaves after normalization, no observed variation:
-- pending, candidate kept, edge not confirmed), or none (x-x: rejected).
data DependencyWitness l = DependencyObserved [(String,TVal)] | DependencySyntactic [l] | DependencyNone deriving (Eq,Show)
data TypeWitness = TypeWitness { twReplaced :: TTy, twReplacement :: TTy, twOk :: Bool, twDomain :: String } deriving (Eq,Show)
data EdgeStatus = Confirmed | PendingDependency | NotSupported | Rejected String deriving (Eq,Show)
data Edge l = Edge
  { eFrom, eTo :: Int, eStructural :: StructuralWitness l, eCase :: CaseWitness, eDependency :: DependencyWitness l
  , eType :: TypeWitness, eStatus :: EdgeStatus } deriving (Eq,Show)

-- Dependency witness of a term over the grounded contexts and the dependency
-- counterfactual contexts (labelled). Opaque or closed normal forms carry no
-- dependency.
dependencyOf :: (Ord l) => LeafInfo l -> [Context l] -> [Context l] -> LTerm l -> DependencyWitness l
dependencyOf li ctxs deps t
  | hasOpaque t || null (lLeaves nf) = DependencyNone
  | length (nub (map snd observed))>=2 = DependencyObserved observed
  | otherwise = DependencySyntactic (nub (lLeaves nf))
  where nf=normalize (liPartial li) t
        observed=[(cxId c,v) | c<-ctxs++deps, Right v<-[evalL (cxEval c) nf]]

caseAgreement :: [Context l] -> LTerm l -> LTerm l -> CaseWitness
caseAgreement [] _ _=CaseUnknown "no grounded training context"
caseAgreement ctxs a b=
  let rs=[(cxId c,evalL (cxEval c) a,evalL (cxEval c) b) | c<-ctxs]
      agree=[i | (i,Right x,Right y)<-rs, x==y]
      dis=[i | (i,Right x,Right y)<-rs, x/=y]
      unknown=[i | (i,x,y)<-rs, either (const True) (const False) x || either (const True) (const False) y]
  in if not (null unknown) then CaseUnknown ("NotApplicable: precondition not met on "++intercalate "," unknown)
     else if null dis then CaseAgree agree else CaseDisagree agree dis

-- The one-step relation for two given terms, a replacement F and the paths of
-- the special values to replace. Every witness is computed; the status says
-- whether the edge is confirmed, pending (dependency unproven) or rejected
-- (structural, type or case failure).
relate :: (Ord l, Show l) => LeafInfo l -> [Context l] -> [Context l] -> LTerm l -> LTerm l -> LTerm l -> [Path] -> Edge l
relate li ctxs deps tA tB f paths=
  let partial=liPartial li
      nfA=normalize partial tA
      nfB=normalize partial tB
      nfF=normalize partial f
      values=[(p,v) | p<-paths, Just (LConst v)<-[subtermAt p nfA]]
      replaced=case values of ((_,v):_)->v; []->VI 0
      tyF=either (const Nothing) Just (typeOfTerm (liType li) nfF)
      tyOk=not (null values) && length values==length paths && all (\(_,v)->Just (tyOf v)==tyF) values && all (\(_,v)->v==replaced) values
      after=normalize partial (foldl' (\t p->substituteAt p nfF t) nfA paths)
      sw=StructuralWitness paths replaced nfF nfA after sigmaVersion
      cw=caseAgreement ctxs nfA nfB
      dw=dependencyOf li ctxs deps nfF
      sorts=nub (map cxSort ctxs)
      domain=case sorts of [s] | all (liSortDetermined li) (lLeaves nfF) && not (null (lLeaves nfF))->"proven on "++s++"; case-relative on exists sigma"; _->"case-relative on exists sigma"
      tw=TypeWitness (tyOf replaced) (fromMaybe TyInt tyF) tyOk domain
      status | null paths = Rejected "no special value replaced"
             | not tyOk = Rejected "type witness failed: replacement type differs from the replaced value or paths are not special values"
             | after/=nfB = Rejected "structural witness failed: NF(t_A[E_s:=F]) /= NF(t_B)"
             | dw==DependencyNone = Rejected "dependency witness failed: the replacement has no input dependence after normalization"
             | otherwise = case (cw,dw) of
                 (CaseAgree _,DependencyObserved _)->Confirmed
                 (CaseAgree _,DependencySyntactic _)->PendingDependency
                 _->NotSupported
  in Edge 0 1 sw cw dw tw status

edgeText :: (l -> String) -> Edge l -> String
edgeText f e=
  let sw=eStructural e
  in "["++show (eStatus e)++"] "++renderL f (swBefore sw)++" -> "++renderL f (swAfter sw)++" replacing "++show (swReplaced sw)++" at "++show (swPaths sw)++" by "++renderL f (swReplacement sw)
     ++"; case="++caseText (eCase e)++"; dependency="++depText (eDependency e)++"; type="++(if twOk (eType e) then "ok" else "FAIL")++" ("++twDomain (eType e)++")"
  where caseText (CaseAgree cs)="agree on "++show (length cs)++" contexts"
        caseText (CaseDisagree a d)="DISAGREE on "++show (length d)++" contexts (agree on "++show (length a)++")"
        caseText (CaseUnknown r)="unknown: "++r
        depText (DependencyObserved vs)="observed ("++show (length (nub (map snd vs)))++" distinct values)"
        depText (DependencySyntactic ls)="syntactic only ("++intercalate "," (map f ls)++")"
        depText DependencyNone="none"

------------------------------------------------------------------------------
-- B3. Hash-consed typed DAG with exact unions
------------------------------------------------------------------------------

data VNode l = VLeaf l | VConst TVal | VApp TOp [Int] | VUnion [Int] | VOpaque String deriving (Eq,Ord,Show)
data VSA l = VSA { vsaTable :: M.Map (VNode l) Int, vsaNodes :: M.Map Int (VNode l), vsaNext :: Int } deriving (Eq,Show)
emptyVSA :: VSA l
emptyVSA=VSA M.empty M.empty 0
internNode :: Ord l => VNode l -> VSA l -> (Int,VSA l)
internNode n v=case M.lookup n (vsaTable v) of
  Just i->(i,v)
  Nothing->let i=vsaNext v in (i,VSA (M.insert n i (vsaTable v)) (M.insert i n (vsaNodes v)) (i+1))
intern :: Ord l => LTerm l -> VSA l -> (Int,VSA l)
intern (LLeaf l) v=internNode (VLeaf l) v
intern (LConst c) v=internNode (VConst c) v
intern (LOpaque s) v=internNode (VOpaque s) v
intern (LApp op as) v0=let (ids,v1)=foldl' (\(acc,v) a->let (i,v')=intern a v in (acc++[i],v')) ([],v0) as in internNode (VApp op ids) v1
-- All terms denoted by a node (unions expand to their alternatives).
expand :: VSA l -> Int -> [LTerm l]
expand v i=case M.lookup i (vsaNodes v) of
  Nothing->[]
  Just (VLeaf l)->[LLeaf l]
  Just (VConst c)->[LConst c]
  Just (VOpaque s)->[LOpaque s]
  Just (VUnion js)->concatMap (expand v) js
  Just (VApp op js)->map (LApp op) (sequence (map (expand v) js))
vsaNodeCount :: VSA l -> Int
vsaNodeCount=M.size . vsaNodes
vsaUnionCount :: VSA l -> Int
vsaUnionCount v=length [() | VUnion _<-M.elems (vsaNodes v)]
reachableCount :: VSA l -> Int -> Int
reachableCount v root=S.size (go S.empty root)
  where go seen i | S.member i seen=seen
                  | otherwise=case M.lookup i (vsaNodes v) of
                      Just (VApp _ js)->foldl' go (S.insert i seen) js
                      Just (VUnion js)->foldl' go (S.insert i seen) js
                      _->S.insert i seen

-- Exact union factorization of a candidate set: terms are grouped by root
-- operator and factored by an argument trie, so that `expand` of the result
-- is exactly the input set (no cross-product leak) while common prefixes are
-- shared: {Add(PosX,2), Add(PosX,Width)} becomes Add(PosX, Union(2,Width)).
factorClass :: Ord l => [LTerm l] -> VSA l -> (Int,VSA l)
factorClass terms v0=
  let ts=S.toList (S.fromList terms)
      atomic=[t | t<-ts, not (isApp t)]
      apps=M.toList (M.fromListWith (flip (++)) [((op,length as),[as]) | LApp op as<-ts])
      (ids1,v1)=foldl' (\(acc,v) t->let (i,v')=intern t v in (acc++[i],v')) ([],v0) atomic
      (ids2,v2)=foldl' (\(acc,v) ((op,_),tuples)->let (is,v')=appTrie op tuples v in (acc++is,v')) ([],v1) apps
      ids=sort (nub (ids1++ids2))
  in case ids of
       [i]->(i,v2)
       _->internNode (VUnion ids) v2
  where
    isApp (LApp _ _)=True
    isApp _=False
    appTrie op tuples v=
      let (vecs,v')=argTrie tuples v
      in foldl' (\(acc,vv) vec->let (i,vv')=internNode (VApp op vec) vv in (acc++[i],vv')) ([],v') vecs
    -- argument trie: group by the first argument, recurse on the tails; the
    -- last position of every group becomes one (factored) union node
    argTrie tuples v
      | any null tuples = ([],v)
      | all ((==1) . length) tuples = let (i,v')=factorClass (map head tuples) v in ([[i]],v')
      | otherwise =
          let groups=M.toList (M.fromListWith (flip (++)) [(head t,[tail t]) | t<-tuples])
          in foldl' (\(acc,vv) (h,tails)->
                let (hi,vv1)=intern h vv
                    (vecs,vv2)=argTrie tails vv1
                in (acc++map (hi:) vecs,vv2)) ([],v) groups

-- Bottom-up evaluation of every non-union node under one leaf evaluator
-- (children have smaller ids than parents). Returns the value table and the
-- number of node evaluations performed.
evaluateDAG :: VSA l -> (l -> Either String TVal) -> (M.Map Int (Either String TVal),Int)
evaluateDAG v f=foldl' step (M.empty,0) (M.toAscList (vsaNodes v))
  where step (tbl,n) (i,node)=case node of
          VLeaf l->(M.insert i (f l) tbl,n+1)
          VConst c->(M.insert i (Right c) tbl,n+1)
          VOpaque s->(M.insert i (Left ("opaque node: "++s)) tbl,n+1)
          VUnion _->(tbl,n)
          VApp op js->(M.insert i (traverse (\j->M.findWithDefault (Left "missing child") j tbl) js >>= applyOp op) tbl,n+1)

------------------------------------------------------------------------------
-- B4. Referent graph, partial order, schedules
------------------------------------------------------------------------------

data Schedule = GeneralFirst | SpecificFirst | CostFirst | Interleaved deriving (Eq,Ord,Show,Read,Enum,Bounded)
-- All flags off reproduces Stage A FullA exactly.
data StageB = StageB
  { sbBounds :: Bool                    -- B0 object/collection bounds leaves (Max, SetMax)
  , sbBoolOps :: Bool                   -- B0 Lt/Eq/And/Or/Not (and Gt) in the typed registry, Bool-demand only
  , sbGraph :: Bool                     -- B1/B3 referent graph of the task (classes + VSA); prerequisite of the rest
  , sbStructuralGeneralization :: Bool  -- B2 constant-functionalization edges
  , sbSharedVSA :: Bool                 -- B3 hash-consed DAG + unions (off: plain per-term evaluation, no sharing)
  , sbHierarchy :: Bool                 -- B4 class lookup search under the schedule with per-layer budgets
  , sbSchedule :: Schedule
  , sbGraphDepth :: Int                 -- depth bound of the closed-term universe
  , sbGraphConstants :: Int             -- constants per universe term
  , sbGraphBudget :: Int                -- universe size bound per axis (nodes), truncation recorded
  , sbReplacementDepth :: Int           -- depth bound of the replacement terms F (0 = leaves)
  , sbEdgeBudget :: Int                 -- substitutions tried per axis
  , sbLayerBudget :: Int                -- class checks per generality layer per slot
  , sbSlotBudget :: Int                 -- class checks (hierarchy) or row evaluations (flat) per slot
  , sbMaxFits :: Int                    -- expanded fitting candidates per slot
  , sbTotalBudget :: Int                -- row lookups + flat row evaluations of the hierarchy over the whole run (like saTotalHoleBudget)
  , sbUnsupportedSamples :: Int         -- NotSupported substitution results kept with full witnesses (the rest is counted)
  , sbOnlinePromotion :: Bool           -- reserved: online graph updates (not used; frozen snapshot only)
  } deriving (Eq,Show)
stageBOff :: StageB
stageBOff=StageB False False False False False False GeneralFirst 2 1 40000 0 400000 20000 60000 4000 1200000 200 False

data Provenance = Enumerated Int | Wrapped String deriving (Eq,Show)
data Referent l = Referent
  { rfTerm :: LTerm l, rfType :: TTy, rfInputs :: [String], rfPrecondition :: [String], rfDeps :: [l]
  , rfProvenance :: Provenance, rfCost :: Int } deriving (Eq,Show)
data GraphStats = GraphStats
  { gsTemplates, gsClosedTerms, gsNodes :: Int, gsTruncated :: Bool, gsConstantOnlyDropped :: Int
  , gsContexts, gsDependencyContexts, gsClasses :: Int
  , gsEdgesConfirmed, gsEdgesPending, gsEdgesNotSupported, gsEdgesRejected, gsTypeEdges, gsClosureEdges, gsSCCs, gsLayers :: Int
  , gsSubstitutionsTried, gsOutsideUniverse :: Int, gsEdgeTruncated :: Bool
  , gsVSANodes, gsVSAUnions, gsExpanded :: Int, gsExpansionOk :: Bool, gsSharingAvgX100, gsSharingMaxX100 :: Int
  , gsDAGEvaluations, gsReferenceEvaluations, gsBuildWork :: Int, gsWitnessFull :: Int } deriving (Eq,Show)
data RefGraph l = RefGraph
  { rgVersion :: String, rgSnapshotHash :: Int, rgContexts :: [Context l], rgDependencyContexts :: [Context l]
  , rgNodes :: M.Map Int (Referent l), rgIndex :: M.Map (LTerm l) Int
  , rgSignature :: M.Map Int [Either String TVal]
  , rgClasses :: M.Map Int [Int], rgClassOf :: M.Map Int Int
  , rgEdges :: [Edge l], rgTypeEdges :: [(Int,String,String,String)]
  , rgSucc :: M.Map Int [Int], rgGenerality :: M.Map Int Int
  , rgVSA :: VSA l, rgRoots :: M.Map Int Int, rgClassRoots :: M.Map Int Int
  , rgStats :: GraphStats }

-- Build the frozen snapshot of one axis: enumerate the bounded closed-term
-- universe over the visible leaves (Stage A template enumerator, holes
-- grounded on the bounded constant domain), normalize, dedupe, wrap the
-- caller's concrete base terms, then ground on the training contexts.
buildGraph :: (Ord l, Show l) => StageB -> HoleConfig -> LeafInfo l -> [(l,TTy)] -> TTy -> [Context l] -> [Context l] -> [(String,LTerm l)] -> RefGraph l
buildGraph sb hc li leaves target ctxs deps wrapped=
  let partial=liPartial li
      hc'=hc {hcDepth=sbGraphDepth sb, hcMaxHoles=sbGraphConstants sb}
      !templates=enumerateTemplates hc' leaves target
      !closed=shared [fillHoles (map VI cs) (tmExpr t) | t<-templates, cs<-sequence (replicate (tmHoles t) (hcDomain hc'))]
      normalized=map (normalize partial . lambdaFromTyped) closed
      base=[(normalize partial t,Wrapped w) | (w,t)<-wrapped, not (hasOpaque t)]
      -- terms that normalize to a closed value (x-x) are constant-only referents, not candidates
      candidates=base++[(t,Enumerated i) | (i,t)<-zip [0..] normalized]
      -- lazy construction: stops at the universe budget without normalizing
      -- the remaining candidates (they are reported as truncated)
      dedupe acc idx dropped n []=(acc,idx,dropped,n,False)
      dedupe acc idx dropped n ((t,prov):rest)
        | n>=sbGraphBudget sb = (acc,idx,dropped,n,True)
        | null (lLeaves t) = dedupe acc idx (dropped+1) n rest
        | M.member t idx = dedupe acc idx dropped n rest
        | otherwise = dedupe ((n,t,prov):acc) (M.insert t n idx) dropped (n+1) rest
      !(nodeListRev,index,constOnly,_,truncated)=dedupe [] M.empty (0::Int) (0::Int) candidates
      nodeList=reverse nodeListRev
      mk (i,t,prov)=(i,Referent t (either (const target) id (typeOfTerm (liType li) t)) (nub (map (liInput li) (lLeaves t)))
                       (nub (concatMap (liPrecondition li) (lLeaves t)++["Mod divisor /= 0" | LApp OpMod [_,d]<-subterms t, case d of LConst (VI k)->k==0; _->True]))
                       (nub (lLeaves t)) prov (lCost t))
      !nodes=M.fromList (map mk nodeList)
      stats0=GraphStats (length templates) (length closed) (M.size nodes) truncated constOnly 0 0 0 0 0 0 0 0 0 0 0 0 0 False 0 0 0 True 0 0 0 0 0 0
      g0=RefGraph (sigmaVersion++"; "++show sb) (hashTerms (map (\(_,t,_)->t) nodeList)) [] [] nodes index M.empty M.empty M.empty [] [] M.empty M.empty emptyVSA M.empty M.empty stats0
  in ground sb li g0 ctxs deps Nothing
  where subterms t@(LApp _ as)=t:concatMap subterms as
        subterms t=[t]

-- Pin a list that is consumed more than once: without this GHC may treat a
-- list comprehension as work-free and duplicate it into every use site
-- (observed: the per-context DAG tables were rebuilt for every node, turning a
-- 4 s snapshot into minutes). Forcing the spine behind NOINLINE keeps one copy.
shared :: [a] -> [a]
shared xs=length xs `seq` xs
{-# NOINLINE shared #-}

hashTerms :: Show l => [LTerm l] -> Int
hashTerms=foldl' (\h c->(h*31+ord c) `mod` 2305843009213693951) 7 . concatMap show

-- Re-ground an existing graph on (possibly extended) contexts: signatures,
-- classes and edge statuses are recomputed; nodes and the structural
-- witnesses of every edge are kept (a withdrawn case support never deletes a
-- candidate or the structural relation).
refreshGraph :: (Ord l, Show l) => StageB -> LeafInfo l -> RefGraph l -> [Context l] -> [Context l] -> RefGraph l
refreshGraph sb li g ctxs deps=ground sb li g ctxs deps (Just (rgEdges g))

ground :: (Ord l, Show l) => StageB -> LeafInfo l -> RefGraph l -> [Context l] -> [Context l] -> Maybe [Edge l] -> RefGraph l
ground sb li g0 ctxs deps prior=
  let partial=liPartial li
      nodes=rgNodes g0
      ids=M.keys nodes
      -- B3: hash-consed DAG of every node (always built: it is the index);
      -- signatures through the shared DAG or through plain per-term evaluation
      !(roots,vsa1)=foldl' (\(acc,v) i->let (r,v')=intern (rfTerm (nodes M.! i)) v in (M.insert i r acc,v')) (M.empty,emptyVSA) ids
      !dagEvals=shared [evaluateDAG vsa1 (cxEval c) | c<-ctxs]
      sigShared=M.fromList [(i,[M.findWithDefault (Left "missing") (roots M.! i) tbl | (tbl,_)<-dagEvals]) | i<-ids]
      sigPlain=M.fromList [(i,[evalL (cxEval c) (rfTerm (nodes M.! i)) | c<-ctxs]) | i<-ids]
      !dagWork=if sbSharedVSA sb then sum (map snd dagEvals) else 0   -- DAG evaluations are only performed (and counted) when the shared DAG is on
      !refWork=sum [lSize (rfTerm r) | r<-M.elems nodes]*length ctxs
      !signature=if sbSharedVSA sb then sigShared else sigPlain
      !buildWork=if sbSharedVSA sb then dagWork else refWork
      -- agreement classes in canonical order of their first member
      !grouped=shared (M.elems (M.fromListWith (flip (++)) [(signature M.! i,[i]) | i<-ids]))
      !classes=M.fromList (zip [0..] (sortOn head (map sort grouped)))
      !classOf=M.fromList [(i,c) | (c,ms)<-M.toList classes, i<-ms]
      -- exact union factorization per class (shared representation)
      !(classRoots,vsa2)=if sbSharedVSA sb
        then foldl' (\(acc,v) (c,ms)->let (r,v')=factorClass [rfTerm (nodes M.! i) | i<-ms] v in (M.insert c r acc,v')) (M.empty,vsa1) (M.toList classes)
        else (M.empty,vsa1)
      !expansionOk=and [sort (expand vsa2 r)==sort [rfTerm (nodes M.! i) | i<-classes M.! c] | (c,r)<-M.toList classRoots]
      !expanded=sum (map length (M.elems classes))
      !sharing=shared [(sum [lSize (rfTerm (nodes M.! i)) | i<-classes M.! c]*100) `div` max 1 (reachableCount vsa2 r) | (c,r)<-M.toList classRoots]
      -- B2: edges by substitution (discovery) or re-evaluation of prior edges
      !generalizers=shared [i | i<-ids, let t=rfTerm (nodes M.! i), lConstants t==0, lDepth t<=sbReplacementDepth sb]
      !depWitness=M.fromList [(i,dependencyOf li ctxs deps (rfTerm (nodes M.! i))) | i<-generalizers]
      sorts=nub (map cxSort ctxs)
      typeWitnessFor replaced f=
        let fl=lLeaves f
            dom=case sorts of [s] | not (null fl) && all (liSortDetermined li) fl->"proven on "++s++"; case-relative on exists sigma"; _->"case-relative on exists sigma"
        in TypeWitness (tyOf replaced) (either (const TyInt) id (typeOfTerm (liType li) f)) True dom
      status cw dw=case (cw,dw) of
        (CaseAgree _,DependencyObserved _)->Confirmed
        (CaseAgree _,DependencySyntactic _)->PendingDependency
        _->NotSupported
      caseOf a b=if classOf M.! a==classOf M.! b then CaseAgree (map cxId ctxs) else caseAgreement ctxs (rfTerm (nodes M.! a)) (rfTerm (nodes M.! b))
      discover=
        let go (acc,used,missed,unsupportedTotal,unsupportedKept) a
              | not (sbStructuralGeneralization sb) || used>=sbEdgeBudget sb = (acc,used,missed,unsupportedTotal,unsupportedKept)
              | otherwise =
                  let tA=rfTerm (nodes M.! a)
                      svs=specialValues tA
                      subsets=[s | s<-subsequences svs, not (null s), length (nub (map snd s))==1]
                      attempts=[(s,f) | s<-subsets, f<-generalizers, Just (tyOf (snd (head s)))==either (const Nothing) Just (typeOfTerm (liType li) (rfTerm (nodes M.! f)))]
                      budgeted=take (max 0 (sbEdgeBudget sb-used)) attempts
                      results=[ (s,f,b) | (s,f)<-budgeted, let tF=rfTerm (nodes M.! f)
                              , let b=normalize partial (foldl' (\t (p,_)->substituteAt p tF t) tA s), b/=tA
                              , isSubterm tF b]   -- the replacement must survive: a vanished F did not functionalize the constant
                      found=[Edge a bId (StructuralWitness (map fst s) (snd (head s)) (rfTerm (nodes M.! f)) tA b sigmaVersion) (caseOf a bId) (depWitness M.! f) (typeWitnessFor (snd (head s)) (rfTerm (nodes M.! f))) Confirmed
                             | (s,f,b)<-results, Just bId<-[M.lookup b (rgIndex g0)]]
                      missing=length [() | (_,_,b)<-results, M.notMember b (rgIndex g0)]
                      finished=[e {eStatus=status (eCase e) (eDependency e)} | e<-found]
                      -- NotSupported results are not in the relation: keep a bounded sample with witnesses, count the rest
                      kept=[e | e<-finished, eStatus e/=NotSupported]
                      unsupported=[e | e<-finished, eStatus e==NotSupported]
                      room=max 0 (sbUnsupportedSamples sb-unsupportedKept)
                  in (reverse (kept++take room unsupported)++acc,used+length budgeted,missed+missing,unsupportedTotal+length unsupported,unsupportedKept+min room (length unsupported))
        in (\(es,u,m,t,_)->(reverse es,u,m,t)) (foldl' go ([],0,0,0,0::Int) ids)
      !(edges,tried,outside,unsupportedCount)=case prior of
        Nothing->discover
        Just es->([e {eCase=caseOf (eFrom e) (eTo e), eDependency=M.findWithDefault (eDependency e) (M.findWithDefault (-1) (swReplacement (eStructural e)) (rgIndex g0)) depWitness
                     , eStatus=let cw=caseOf (eFrom e) (eTo e); dw=M.findWithDefault (eDependency e) (M.findWithDefault (-1) (swReplacement (eStructural e)) (rgIndex g0)) depWitness in status cw dw} | e<-es]
                 ,gsSubstitutionsTried (rgStats g0),gsOutsideUniverse (rgStats g0),length [() | e<-es, eStatus e==NotSupported])
      !confirmed=shared [e | e<-edges, eStatus e==Confirmed]
      !succ'=M.fromListWith (flip (++)) ([(eFrom e,[eTo e]) | e<-confirmed]++[(i,[]) | i<-ids])
      -- type generalization: the replacement is fixed by the size index on a single observed sort
      !typeEdges=S.toList (S.fromList [(eTo e,takeWhile (/=';') (drop 10 (twDomain (eType e))),"exists sigma.Object[sigma]","the replacement leaf is determined by the size index of the object binder") | e<-confirmed, take 9 (twDomain (eType e))=="proven on"])
      !(sccCount,gen)=generality succ' ids
      !closure=sum [S.size (reach succ' i)-1 | i<-ids, not (null (succ' M.! i))]
      !layers=if M.null gen then 0 else 1+maximum (M.elems gen)
      stats=(rgStats g0) {gsContexts=length ctxs, gsDependencyContexts=length deps, gsClasses=M.size classes
        , gsEdgesConfirmed=length confirmed, gsEdgesPending=length [() | e<-edges, eStatus e==PendingDependency]
        , gsEdgesNotSupported=unsupportedCount, gsEdgesRejected=length [() | e<-edges, Rejected _<-[eStatus e]]
        , gsTypeEdges=length typeEdges, gsClosureEdges=closure, gsSCCs=sccCount, gsLayers=layers
        , gsSubstitutionsTried=tried, gsOutsideUniverse=outside, gsEdgeTruncated=sbStructuralGeneralization sb && tried>=sbEdgeBudget sb
        , gsVSANodes=vsaNodeCount vsa2, gsVSAUnions=vsaUnionCount vsa2, gsExpanded=expanded, gsExpansionOk=expansionOk
        , gsSharingAvgX100=if null sharing then 100 else sum sharing `div` length sharing, gsSharingMaxX100=maximum (100:sharing)
        , gsDAGEvaluations=dagWork, gsReferenceEvaluations=refWork, gsBuildWork=buildWork
        , gsWitnessFull=length [() | e<-confirmed, twOk (eType e), CaseAgree _<-[eCase e], DependencyObserved _<-[eDependency e]]}
  in g0 {rgContexts=ctxs, rgDependencyContexts=deps, rgSignature=signature, rgClasses=classes, rgClassOf=classOf, rgEdges=edges, rgTypeEdges=typeEdges
        , rgSucc=succ', rgGenerality=gen, rgVSA=vsa2, rgRoots=roots, rgClassRoots=classRoots, rgStats=stats}

reach :: M.Map Int [Int] -> Int -> S.Set Int
reach succ' start=go S.empty [start]
  where go seen []=seen
        go seen (x:xs) | S.member x seen=go seen xs
                       | otherwise=go (S.insert x seen) (M.findWithDefault [] x succ'++xs)

-- SCC quotient (Kosaraju) and the generality index: longest confirmed path
-- from a source, computed on the condensation. The index is bookkeeping for
-- budgets and schedules; it is not a semantic level.
generality :: M.Map Int [Int] -> [Int] -> (Int,M.Map Int Int)
generality succ' ids=
  let !order=fst (foldl' visit ([],S.empty) ids)
      visit (acc,seen) v | S.member v seen=(acc,seen)
                         | otherwise=let (acc',seen')=foldl' visit (acc,S.insert v seen) (M.findWithDefault [] v succ') in (v:acc',seen')
      !pred'=M.fromListWith (++) ([(b,[a]) | (a,bs)<-M.toList succ', b<-bs]++[(i,[]) | i<-ids])
      assign (comp,seen,k) v | S.member v seen=(comp,seen,k)
                             | otherwise=let (members,seen')=collect (S.insert v seen) [v] [v]
                                         in (foldl' (\m x->M.insert x k m) comp members,seen',k+1)
        where collect s [] acc=(acc,s)
              collect s (x:xs) acc=let nxt=[p | p<-M.findWithDefault [] x pred', not (S.member p s)]
                                   in collect (foldl' (flip S.insert) s nxt) (nxt++xs) (nxt++acc)
      !(compOf,_,_)=foldl' assign (M.empty,S.empty,0::Int) order
      !comps=S.toList (S.fromList (M.elems compOf))
      !compSucc=M.fromListWith (++) ([(compOf M.! a,[compOf M.! b]) | (a,bs)<-M.toList succ', b<-bs, compOf M.! a/=compOf M.! b]++[(c,[]) | c<-comps])
      -- longest path from a source on the condensation (acyclic): memoized DFS from predecessors
      !compPred=M.fromListWith (++) ([(b,[a]) | (a,bs)<-M.toList compSucc, b<-bs]++[(c,[]) | c<-comps])
      -- lazy memo: the strict map would force its own values (<<loop>>)
      depth=ML.fromList [(c,d c) | c<-comps]
      d c=case M.findWithDefault [] c compPred of []->0; ps->1+maximum [depth ML.! p | p<-ps]
      !result=M.fromList [(i,depth ML.! (compOf M.! i)) | i<-ids]
  in (length comps,result)

-- Search schedules over the nodes. Incomparable nodes keep a stable
-- (cost, canonical index) order; Interleaved rotates fairly over the
-- generality layers one node at a time.
scheduleOrder :: Schedule -> RefGraph l -> [Int]
scheduleOrder sched g=
  let ids=M.keys (rgNodes g)
      gen i=M.findWithDefault 0 i (rgGenerality g)
      cost i=rfCost (rgNodes g M.! i)
  in case sched of
       SpecificFirst->sortOn (\i->(gen i,cost i,i)) ids
       GeneralFirst->sortOn (\i->(negate (gen i),cost i,i)) ids
       CostFirst->sortOn (\i->(cost i,i)) ids
       Interleaved->roundRobin [sortOn (\i->(cost i,i)) [i | i<-ids, gen i==l] | l<-nub (sort (map gen ids))]
  where roundRobin xss=case filter (not . null) xss of
          []->[]
          live->map head live++roundRobin (map tail live)

data ClassSearch = ClassSearch
  { csFits :: [Int], csClassChecks, csRowLookups, csCandidatesCovered, csFittingClasses :: Int
  , csLayerExposed, csLayerSearched, csLayerTruncated :: M.Map Int Int, csTruncated :: Bool, csRowEvaluations :: Int } deriving (Eq,Show)

contextIndex :: RefGraph l -> M.Map String Int
contextIndex g=M.fromList (zip (map cxId (rgContexts g)) [0..])

-- Hierarchical slot search: nodes in schedule order, one lookup per agreement
-- class (every member of a fitting class fits, because the slot rows are a
-- subset of the grounded contexts), per-layer and per-slot budgets.
searchClasses :: StageB -> RefGraph l -> [(Int,TVal)] -> ClassSearch
searchClasses sb g rows=
  let !order=scheduleOrder (sbSchedule sb) g
      gen i=M.findWithDefault 0 i (rgGenerality g)
      sigOf c=rgSignature g M.! head (rgClasses g M.! c)
      fits c=all (\(k,t)->(sigOf c !! k)==Right t) rows
      step (checked,hit,exposed,searched,trunc,checks,lookups,covered,truncated) i=
        let c=rgClassOf g M.! i; l=gen i
            exposed'=M.insertWith (+) l 1 exposed
        in if M.member c checked then (checked,hit,exposed',searched,trunc,checks,lookups,covered+1,truncated)
           else if M.findWithDefault 0 l searched>=sbLayerBudget sb || checks>=sbSlotBudget sb
             then (checked,hit,exposed',searched,M.insertWith (+) l 1 trunc,checks,lookups,covered,True)
             else let ok=fits c in (M.insert c ok checked,if ok then S.insert c hit else hit,exposed',M.insertWith (+) l 1 searched,trunc,checks+1,lookups+length rows,covered,truncated)
      (checkedF,hitF,exposedF,searchedF,truncF,checksF,lookupsF,coveredF,truncatedF)=foldl' step (M.empty,S.empty,M.empty,M.empty,M.empty,0,0,0,False) order
      fitNodes=take (sbMaxFits sb) [i | i<-order, S.member (rgClassOf g M.! i) hitF]
  in ClassSearch fitNodes checksF lookupsF coveredF (S.size hitF) exposedF searchedF truncF truncatedF 0

-- Flat reference search (NoHierarchy): every node individually evaluated on
-- the slot rows in canonical order under a row-evaluation budget.
searchFlat :: StageB -> RefGraph l -> [(l -> Either String TVal,TVal)] -> ClassSearch
searchFlat sb g rows=
  let ids=M.keys (rgNodes g)
      go (fits,evals,truncated) i
        | evals>=sbSlotBudget sb = (fits,evals,True)
        | otherwise = let t=rfTerm (rgNodes g M.! i)
                          (ok,n)=check t rows 0
                      in (if ok then i:fits else fits,evals+n,truncated)
      check _ [] n=(True,n)
      check t ((f,target):rs) n=if evalL f t==Right target then check t rs (n+1) else (False,n+1)
      (fitsF,evalsF,truncF)=foldl' go ([],0,False) ids
  in ClassSearch (take (sbMaxFits sb) (reverse fitsF)) 0 0 0 0 M.empty M.empty M.empty truncF evalsF

-- Serializable summary for audit writers (no leaf type).
data RefSummary = RefSummary
  { rsAxis :: String, rsVersion :: String, rsHash :: Int, rsStats :: GraphStats, rsSchedule :: String
  , rsEdgeSamples :: [String], rsTypeEdgeSamples :: [String], rsClassSizes :: [Int], rsNodeSamples :: [String], rsPendingSamples :: [String] } deriving (Eq,Show)
graphSummary :: String -> Schedule -> (l -> String) -> RefGraph l -> RefSummary
graphSummary axis sched f g=RefSummary axis (rgVersion g) (rgSnapshotHash g) (rgStats g) (show sched)
  (map (edgeText f) (take 12 [e | e<-rgEdges g, eStatus e==Confirmed]))
  [renderL f (rfTerm (rgNodes g M.! n))++": "++a++" -> "++b++" ("++p++")" | (n,a,b,p)<-take 6 (rgTypeEdges g)]
  (take 20 (sortOn negate (map length (M.elems (rgClasses g)))))
  [renderL f (rfTerm r)++" : "++show (rfType r)++" inputs="++show (rfInputs r)++" gen="++show (M.findWithDefault 0 i (rgGenerality g))++" cost="++show (rfCost r) | (i,r)<-take 8 (M.toList (rgNodes g))]
  (map (edgeText f) (take 6 [e | e<-rgEdges g, eStatus e/=Confirmed]))
