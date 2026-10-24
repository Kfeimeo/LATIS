-- LATIS v0.6: counterfactual-preserving feature classes. A semantic class is
-- (type, training denotation); inside it every structurally different
-- representative survives. Counterfactual contexts can only prove that two
-- representatives differ; they never choose one and never act as an oracle.
module Synthesis.Collection.Counterfactual
  ( AxisE(..), Atom(..), Scalar(..), Arg(..), AbsDef(..), Library, Ctx(..), Row(..)
  , SlotLeaf(..), slotLeafName, atoms, boundsAtoms, atomAxis, slotLeaves, slotLeavesB, evalSlotLeaf, isTyped
  , Bounds(..), objectBounds, dependencyContexts
  , evalScalar, instantiate, parametrize, scalarTerms, scalarLength, LeafKind(..), scalarLeaves, intensionality
  , CostComponents(..), ClassPolicy(..), rankCost, accidentalAtoms
  , Representative(..), SemanticClass(..), buildClass
  , Counterfactual(..), counterfactualContexts
  ) where

import Latent.Grid
import Synthesis.Collection.Indexed
import Synthesis.Collection.Typed (TExpr(..), TVal(..), evalT, asInt, tLength, tLeaves, tConstants, TTy(..))
import qualified Data.Map.Strict as M
import qualified Data.Set as S
import Data.List (nub, sortOn, intercalate)
import Data.Either (isRight)
import Data.Maybe (isJust)

data AxisE = Ax Axis | AxisVar Int deriving (Eq,Ord,Show)
-- Observer atoms by provenance class: object observers (Current), alignment
-- references (Previous = previous OUTPUT rank), scene referents, collection
-- aggregates. There is no object ID, no runtime index and no Attach/At/Chain.
-- Stage B0 adds the bounding-box maxima: Max w a = Pos w a + Ext w a - 1
-- (inclusive, x right / y down, origin top-left; Pos IS the bbox minimum
-- because the encoder normalizes every object's local geometry to a zero
-- origin) and the collection maximum SetMax a. They are enumerated only when
-- the Stage B bounds flag is set (boundsAtoms); the v0.6.1 `atoms` list and
-- grammar are unchanged.
data Atom = Pos Which AxisE | Ext Which AxisE | SceneLow AxisE | SceneHigh AxisE | SetMin AxisE | CountObjects | CountShapes
  | Max Which AxisE | SetMax AxisE
  deriving (Eq,Ord,Show)
-- Single-object bounds (inclusive). Distinct from the collection bounds
-- (SetMin/SetMax). An empty object (no occupied cell) has no bounds.
data Bounds = Bounds { bMinX, bMaxX, bMinY, bMaxY :: Int } deriving (Eq,Ord,Show)
objectBounds :: Placed -> Either String Bounds
objectBounds p
  | obsArea p==0 = Left "Bounds of an empty object"
  | sigW (placedSig p)<=0 || sigH (placedSig p)<=0 = Left "Bounds of an object with invalid geometry"
  | otherwise = Right (Bounds (obsPos AX p) (obsAnchor BR AX p) (obsPos AY p) (obsAnchor BR AY p))
-- Stage A: Typed embeds a typed N-ary expression (Synthesis.Collection.Typed)
-- whose leaves are the same observer atoms plus the input grid dimensions.
-- It is produced only by the typed-hole trigger (after the scalar grammar
-- fails) and is otherwise inert for the v0.6.1 grammar, prior and abstraction.
data Scalar = Lit Int | ConstVar Int | Atom Atom | Plus Scalar Scalar | Call String [Arg] | Typed (TExpr SlotLeaf) deriving (Eq,Ord,Show)
data SlotLeaf = LeafAtom Atom | LeafGrid Axis deriving (Eq,Ord,Show)
slotLeafName :: SlotLeaf -> String
slotLeafName (LeafAtom a)=show a
slotLeafName (LeafGrid AX)="GridWidth(Input)"
slotLeafName (LeafGrid AY)="GridHeight(Input)"
isTyped :: Scalar -> Bool
isTyped (Typed _)=True
isTyped _=False
-- The axis an atom observes (Nothing: axis-free aggregate).
atomAxis :: Atom -> Maybe Axis
atomAxis (Pos _ (Ax a))=Just a
atomAxis (Ext _ (Ax a))=Just a
atomAxis (SceneLow (Ax a))=Just a
atomAxis (SceneHigh (Ax a))=Just a
atomAxis (SetMin (Ax a))=Just a
atomAxis (Max _ (Ax a))=Just a
atomAxis (SetMax (Ax a))=Just a
atomAxis _=Nothing
-- Visible leaves of a slot (ontology slice: the slot axis plus axis-free aggregates).
slotLeaves :: Axis -> [(SlotLeaf,TTy)]
slotLeaves=slotLeavesB False
-- Stage B0: the same slice with the bounds atoms (object Max, collection
-- SetMax of the slot axis) appended after the Stage A leaves.
slotLeavesB :: Bool -> Axis -> [(SlotLeaf,TTy)]
slotLeavesB bounds axis=[(LeafAtom a,TyInt) | a<-atoms, atomAxis a `elem` [Just axis,Nothing]]++[(LeafGrid axis,TyInt)]
  ++[(LeafAtom a,TyInt) | bounds, a<-boundsAtoms, atomAxis a==Just axis]
evalSlotLeaf :: Library -> Ctx -> SlotLeaf -> Either String TVal
evalSlotLeaf lib c (LeafAtom a)=VI <$> evalScalar lib c (Atom a)
evalSlotLeaf _ c (LeafGrid AX)=Right (VI (gridWidth (ctxInput c)))
evalSlotLeaf _ c (LeafGrid AY)=Right (VI (gridHeight (ctxInput c)))
data Arg = ArgAxis Axis | ArgInt Int deriving (Eq,Ord,Show)
data AbsDef = AbsDef { absBody :: Scalar, absParamKinds :: [String] } deriving (Eq,Show)
type Library = M.Map String AbsDef
-- ctxDims is the realization (output) canvas; ctxInput the input canvas. They
-- coincide whenever the canvas is unchanged (every v0.6.1 path).
data Ctx = Ctx { ctxDims :: Dimensions, ctxSet :: ObjectSet, ctxCurrent :: Placed, ctxPrevious :: Maybe Placed, ctxDependent :: Bool, ctxInput :: Dimensions }
  deriving (Eq,Show)
data Row = Row { rowCase :: Int, rowRank :: Int, rowCtx :: Ctx, rowTarget :: Int } deriving (Eq,Show)

-- Axis arguments bind AxisVar i in order, integer arguments bind ConstVar i.
instantiate :: [Arg] -> Scalar -> Scalar
instantiate args = go
  where
    axes=[a | ArgAxis a<-args]
    consts=[n | ArgInt n<-args]
    go (Lit n)=Lit n
    go (ConstVar i)=case drop i consts of (n:_)->Lit n; _->ConstVar i
    go (Atom a)=Atom (atom a)
    go (Plus a b)=Plus (go a) (go b)
    go (Call n as)=Call n as
    go (Typed t)=Typed t
    axis (AxisVar i)=case drop i axes of (a:_)->Ax a; _->AxisVar i
    axis a=a
    atom (Pos w a)=Pos w (axis a)
    atom (Ext w a)=Ext w (axis a)
    atom (SceneLow a)=SceneLow (axis a)
    atom (SceneHigh a)=SceneHigh (axis a)
    atom (SetMin a)=SetMin (axis a)
    atom (Max w a)=Max w (axis a)
    atom (SetMax a)=SetMax (axis a)
    atom a=a
-- Typed parametrization used by abstraction promotion: every axis Concept and
-- every literal Constant becomes a free abstract parameter (same axis, same
-- variable). Refs, Concepts and Alignments stay; no concrete coordinate exists.
parametrize :: Scalar -> (Scalar,[Arg],[(String,String)])
parametrize e = let (e',(axes,consts))=go e ([],[]) in (e',map ArgAxis (reverse axes)++map ArgInt (reverse consts)
  ,[("axis"++show i,"Concept Axis") | i<-[0..length axes-1]]++[("c"++show i,"Constant") | i<-[0..length consts-1]])
  where
    go (Lit n) (as,cs)=(ConstVar (length cs),(as,n:cs))
    go (ConstVar i) st=(ConstVar i,st)
    go (Plus a b) st=let (a',st1)=go a st; (b',st2)=go b st1 in (Plus a' b',st2)
    go (Call n xs) st=(Call n xs,st)
    go (Typed t) st=(Typed t,st)
    go (Atom a) st=let (a',st')=atom a st in (Atom a',st')
    axis (Ax x) (as,cs)=case lookup x (zip (reverse as) [0..]) of
      Just i->(AxisVar i,(as,cs))
      Nothing->(AxisVar (length as),(x:as,cs))
    axis v st=(v,st)
    atom (Pos w a) st=let (a',st')=axis a st in (Pos w a',st')
    atom (Ext w a) st=let (a',st')=axis a st in (Ext w a',st')
    atom (SceneLow a) st=let (a',st')=axis a st in (SceneLow a',st')
    atom (SceneHigh a) st=let (a',st')=axis a st in (SceneHigh a',st')
    atom (SetMin a) st=let (a',st')=axis a st in (SetMin a',st')
    atom (Max w a) st=let (a',st')=axis a st in (Max w a',st')
    atom (SetMax a) st=let (a',st')=axis a st in (SetMax a',st')
    atom a st=(a,st)
-- Note: the constant parameters are numbered in post-order of the literal
-- occurrences, matching ConstVar indices after the axis parameters.

evalScalar :: Library -> Ctx -> Scalar -> Either String Int
evalScalar _ _ (Lit n)=Right n
evalScalar _ _ (ConstVar i)=Left ("unbound abstraction constant "++show i)
evalScalar lib c (Plus a b)=(+) <$> evalScalar lib c a <*> evalScalar lib c b
evalScalar lib c (Typed e)=evalT (evalSlotLeaf lib c) e >>= asInt
evalScalar lib c (Call n args)=case M.lookup n lib of
  Nothing->Left ("missing abstraction refinement "++n)
  Just d | length (absParamKinds d)/=length args->Left ("abstraction arity mismatch for "++n)
         | otherwise->evalScalar lib c (instantiate args (absBody d))
evalScalar _ c (Atom a)=case a of
  Pos w ax->obsPos <$> axis ax <*> which w
  Ext w ax->obsExtent <$> axis ax <*> which w
  SceneLow ax->0 <$ axis ax
  SceneHigh ax->(\x->if x==AX then gridWidth (ctxDims c)-1 else gridHeight (ctxDims c)-1) <$> axis ax
  SetMin ax->axis ax >>= \x->maybe (Left "SetMin of an empty set") Right (setMinimum (obsPos x) (ctxSet c))
  CountObjects->Right (count (ctxSet c))
  CountShapes->Right (shapeCount (ctxDependent c) (ctxSet c))
  -- Stage B0: inclusive bbox maximum of a single object (empty objects have no bounds)
  Max w ax->do x<-axis ax; p<-which w; b<-objectBounds p; Right (if x==AX then bMaxX b else bMaxY b)
  SetMax ax->axis ax >>= \x->maybe (Left "SetMax of an empty set") Right (setMaximum (obsAnchor BR x) (ctxSet c))
  where which Current=Right (ctxCurrent c)
        which Previous=maybe (Left "Previous is unavailable at first rank") Right (ctxPrevious c)
        axis (Ax x)=Right x
        axis (AxisVar i)=Left ("unbound abstraction axis "++show i)

-- Enumeration order is the v0.5 order: object observers, then alignment
-- references, then scene referents, then collection aggregates, then literals.
-- The NoIntensionalityPrior and CollapseByTrainingDenotation ablations see
-- exactly this order; Full ranks by the intensionality prior instead.
atoms :: [Atom]
atoms=[Pos Current (Ax a) | a<-[AX,AY]]++[Ext Current (Ax a) | a<-[AX,AY]]++[Pos Previous (Ax a) | a<-[AX,AY]]++[Ext Previous (Ax a) | a<-[AX,AY]]
  ++[SceneLow (Ax a) | a<-[AX,AY]]++[SceneHigh (Ax a) | a<-[AX,AY]]++[SetMin (Ax a) | a<-[AX,AY]]++[CountObjects,CountShapes]
-- Stage B0 bounds atoms (never part of `atoms`, hence never in scalarTerms).
boundsAtoms :: [Atom]
boundsAtoms=[Max Current (Ax a) | a<-[AX,AY]]++[Max Previous (Ax a) | a<-[AX,AY]]++[SetMax (Ax a) | a<-[AX,AY]]
scalarTerms :: [Scalar]
scalarTerms=base++lits++[Plus a b | a<-base, b<-lits, b/=Lit 0]++[Plus a b | (i,a)<-zip [0::Int ..] base, b<-drop i base]
  ++[Plus (Plus a b) c | (i,a)<-zip [0::Int ..] base, b<-drop i base, c<-[Lit (-1),Lit 1]]
  where base=map Atom atoms; lits=map Lit [-1,0,1]
scalarLength :: Scalar -> Int
scalarLength (Plus a b)=1+scalarLength a+scalarLength b
scalarLength (Call _ args)=1+length args
scalarLength (Typed e)=tLength e
scalarLength _=1

data LeafKind = LiteralLeaf | ObjectObserverLeaf | AlignmentRefLeaf | SceneRefLeaf | CollectionLeaf | AbstractionLeaf deriving (Eq,Ord,Show)
scalarLeaves :: Scalar -> [(LeafKind,String)]
scalarLeaves (Lit n)=[(LiteralLeaf,"Lit "++show n)]
scalarLeaves (ConstVar i)=[(LiteralLeaf,"ConstVar "++show i)]
scalarLeaves (Plus a b)=scalarLeaves a++scalarLeaves b
scalarLeaves (Call n _)=[(AbstractionLeaf,n)]
scalarLeaves (Typed e)=[(LiteralLeaf,"Const") | _<-[1..tConstants e]]++concatMap leaf (tLeaves e)
  where leaf (LeafAtom a)=scalarLeaves (Atom a)
        leaf (LeafGrid AX)=[(SceneRefLeaf,"GridWidth(Input)")]
        leaf (LeafGrid AY)=[(SceneRefLeaf,"GridHeight(Input)")]
scalarLeaves (Atom a)=[(kind a,show a)]
  where kind (Pos Current _)=ObjectObserverLeaf
        kind (Ext Current _)=ObjectObserverLeaf
        kind (Pos Previous _)=AlignmentRefLeaf
        kind (Ext Previous _)=AlignmentRefLeaf
        kind (SceneLow _)=SceneRefLeaf
        kind (SceneHigh _)=SceneRefLeaf
        kind (Max Current _)=ObjectObserverLeaf
        kind (Max Previous _)=AlignmentRefLeaf
        kind _=CollectionLeaf
intensionality :: Scalar -> String
intensionality e=case nub (map fst (scalarLeaves e)) of
  [LiteralLeaf]->"literal-derived"
  [SceneRefLeaf]->"scene-ref-derived"
  [ObjectObserverLeaf]->"object-observer-derived"
  [CollectionLeaf]->"collection-derived"
  [AlignmentRefLeaf]->"alignment-derived"
  [AbstractionLeaf]->"invented-abstraction-derived"
  ks->"mixed:"++intercalate "+" (map show ks)

-- Cost(e) = L + lambda1*Literal + lambda2*Accidental + CrossAxis - lambda3*Bonus,
-- with lambda = (4,2,1). The bonus has only generic sources: canonical referent
-- (scene referent or accepted abstraction), low free-variable count, single
-- ontology slice, counterfactual determinacy. No task ID is consulted.
data CostComponents = CostComponents
  { ccLength, ccLiterals, ccAccidental, ccCrossAxis, ccCanonical, ccFreeVars, ccBoundary, ccDeterminacy, ccTotal :: Int } deriving (Eq,Show)
data ClassPolicy = ClassPolicy { policyCounterfactual :: Bool, policyCollapse :: Bool, policyPrior :: Bool } deriving (Eq,Show)
literalCount :: Scalar -> Int
literalCount e=length [() | (LiteralLeaf,_)<-scalarLeaves e]+length [() | Call _ as<-[e], ArgInt _<-as]
-- A slot of axis a that depends on an observer of the other axis carries an
-- accidental cross-axis dependency (e.g. CurrentX used for a y coordinate).
crossAxis :: Axis -> Scalar -> Int
crossAxis slotAxis=go
  where go (Plus a b)=go a+go b
        go (Typed e)=sum [case l of LeafAtom a->go (Atom a); LeafGrid x->if x/=slotAxis then 1 else 0 | l<-tLeaves e]
        go (Call _ args)=length [() | ArgAxis a<-args, a/=slotAxis]
        go (Atom a)=case a of
          Pos _ x->off x; Ext _ x->off x; SceneLow x->off x; SceneHigh x->off x; SetMin x->off x; Max _ x->off x; SetMax x->off x; _->0
        go _=0
        off (Ax x)=if x/=slotAxis then 1 else 0
        off _=0
rankCost :: ClassPolicy -> Axis -> [String] -> Scalar -> [Either String Int] -> CostComponents
rankCost pol slotAxis accidental e cf=
  let len=scalarLength e
      lits=literalCount e
      acc=length [() | (k,n)<-scalarLeaves e, k `elem` [ObjectObserverLeaf,CollectionLeaf], n `elem` accidental]
      cross=crossAxis slotAxis e
      deps=nub [n | (k,n)<-scalarLeaves e, k/=LiteralLeaf]
      kinds=nub [k | (k,_)<-scalarLeaves e, k/=LiteralLeaf]
      canonical=case e of Atom (SceneLow _)->1; Atom (SceneHigh _)->1; Call _ _->1; _->0
      free=max 0 (2-length deps)
      boundary=if length kinds<=1 then 1 else 0
      det=if policyCounterfactual pol && not (null cf) && all isRight cf then 1 else 0
      total | policyPrior pol = len+4*lits+2*acc+cross-(canonical+free+boundary+det)
            | otherwise = len
  in CostComponents len lits acc cross canonical free boundary det total
-- An observer dependency whose value never varies over the training rows of a
-- slot is unverified: the expression may hold only because of that constant.
accidentalAtoms :: [Row] -> [String]
accidentalAtoms rows=[show a | a<-atoms, kindOf a, let vs=map (\r->evalScalar M.empty (rowCtx r) (Atom a)) rows
  , all isRight vs, length (nub vs)==1]
  where kindOf a=case scalarLeaves (Atom a) of [(k,_)]->k `elem` [ObjectObserverLeaf,CollectionLeaf]; _->False

data Representative = Representative
  { repExpr :: Scalar, repDeps :: [String], repProvenance :: [String], repClass :: String, repGroundedness :: (Int,Int)
  , repCost :: CostComponents, repCF :: [Either String Int], repCFGroup :: Int, repOrder :: Int } deriving (Eq,Show)
data SemanticClass = SemanticClass
  { scSlot :: String, scType :: String, scDenotation :: [Int], scReps :: [Representative], scSplits :: Int, scMerges :: Int
  , scDropped :: Int, scPrematureCollapses :: Int, scSelected :: Scalar, scAccidental :: [String] } deriving (Eq,Show)

-- Build the class of all training-exact expressions for a slot. Collapse keeps
-- the lowest structural cost (length + literal penalty, enumeration order on
-- ties) and the premature-collapse metric is computed diagnostically only.
buildClass :: ClassPolicy -> Library -> String -> Axis -> [Row] -> [(Int,Ctx -> Ctx)] -> [Scalar] -> (SemanticClass,Int)
buildClass pol lib slot slotAxis rows cfs fits=
  let denot=map rowTarget rows
      accidental=accidentalAtoms rows
      cfCtxs=[f (rowCtx r) | r<-rows, (c,f)<-cfs, c==rowCase r]
      signature e=if policyCounterfactual pol then map (\c->evalScalar lib c e) cfCtxs else []
      structural e=scalarLength e+4*literalCount e
      ordered=zip [0::Int ..] fits
      keptOrdered | policyCollapse pol = take 1 (sortOn (\(i,e)->(structural e,i)) ordered)
                  | otherwise = ordered
      dropped=[e | (i,e)<-ordered, i `notElem` map fst keptOrdered]
      make (i,e)=let cf=signature e in Representative e (nub [n | (k,n)<-scalarLeaves e, k/=LiteralLeaf])
        (provenance e) (intensionality e) (length [() | (k,_)<-scalarLeaves e, k/=LiteralLeaf],length (scalarLeaves e))
        (rankCost pol slotAxis accidental e cf) cf 0 i
      reps0=map make keptOrdered
      sigs=nub (map repCF reps0)
      grouped=[r {repCFGroup=maybe 0 id (lookup (repCF r) (zip sigs [0..]))} | r<-reps0]
      -- canonicalize only when counterfactual signature, intensionality class and
      -- dependency signature all agree; otherwise both representatives stay alive
      canon=M.elems (M.fromListWith (\a b->if ccTotal (repCost a)<=ccTotal (repCost b) && repOrder a<=repOrder b || ccTotal (repCost a)<ccTotal (repCost b) then a else b)
        [((repCF r,repClass r,repDeps r),r) | r<-grouped])
      reps=sortOn (\r->(ccTotal (repCost r),repOrder r)) canon
      keptSig=case reps of r:_->repCF r; []->[]
      diagnostic=[signature e | e<-dropped]
      premature=length [() | s<-diagnostic, s/=keptSig]
      evaluations=length cfCtxs*(length reps0+length dropped)
  in (SemanticClass slot "Scalar" denot reps (max 0 (length sigs-1)) (length grouped-length canon) (length dropped) premature
        (case reps of r:_->repExpr r; []->Lit 0) accidental,evaluations)
  where provenance e=nub (concat [case k of
            LiteralLeaf->["literal"]; ObjectObserverLeaf->["object observer "++n]; AlignmentRefLeaf->["alignment ref "++n]
            SceneRefLeaf->["scene referent "++n]; CollectionLeaf->["collection aggregate "++n]; AbstractionLeaf->["accepted abstraction "++n]
          | (k,n)<-scalarLeaves e])

-- Counterfactual context generators. Each keeps a legality proof; contexts that
-- cannot be made legal are reported, not silently skipped. None has a target.
data Counterfactual = Counterfactual
  { cfSource :: Int, cfTransformation :: String, cfLegality :: [String], cfPreserved :: [String], cfChanged :: [String] } deriving (Eq,Show)
counterfactualContexts :: KeyExpr -> Int -> Dimensions -> ObjectSet -> ([(Counterfactual,Ctx -> Ctx)],[Counterfactual])
counterfactualContexts key c dims set=(legal,illegal)
  where
    shift dx dy p=p {placedPos=Coord (cx (placedPos p)+dx) (cy (placedPos p)+dy)}
    shiftCtx dx dy ctx=ctx {ctxSet=setMap (shift dx dy) (ctxSet ctx), ctxCurrent=shift dx dy (ctxCurrent ctx), ctxPrevious=fmap (shift dx dy) (ctxPrevious ctx)}
    grow dx dy ctx=ctx {ctxDims=Dimensions (gridWidth (ctxDims ctx)+dx) (gridHeight (ctxDims ctx)+dy)}
    translations=[ (Counterfactual c ("TranslateScene "++show (dx,dy)) proof ["object geometry","color","relative arrangement","ordering under "++show key] ["absolute positions","SetMin"],shiftCtx dx dy)
                 | (dx,dy)<-[(1,0),(-1,0),(0,1),(0,-1)], let ok=setFits dims (setMap (shift dx dy) set)
                 , let proof=if ok then ["all cells remain inside "++show dims] else ["ILLEGAL: a cell would leave the canvas"], ok]
    badTranslations=[Counterfactual c ("TranslateScene "++show (dx,dy)) ["ILLEGAL: a cell would leave the canvas"] [] []
                    | (dx,dy)<-[(1,0),(-1,0),(0,1),(0,-1)], not (setFits dims (setMap (shift dx dy) set))]
    padding=(Counterfactual c "PadCanvas right/bottom +2" ["canvas only grows; objects unchanged"] ["objects","positions","ordering"] ["canvas dimensions","SceneHigh"],grow 2 2)
    margin=(Counterfactual c "PadCanvas left/top margin +2" ["canvas grows by the margin; every cell stays inside"] ["object geometry","color","relative arrangement","ordering"] ["absolute positions","canvas dimensions","SetMin"],grow 2 2 . shiftCtx 2 2)
    permutation=(Counterfactual c "PermuteObjects (reverse enumeration)" ["ObjectSet is ID-free and unordered; OrderedView is recomputed from the key"] ["every semantic property"] ["runtime enumeration order","object IDs"],id)
    cells=setCells set
    free p=all (\q->inBounds dims q && not (any (\e->abs (cx e-cx q)<=1 && abs (cy e-cy q)<=1) (S.toList cells))) (absoluteCells p)
    later p=isJust (keyValue key p) && setAll (\q->keyValue key q<keyValue key p) set
    place proto=let cands=[proto {placedPos=Coord x y} | y<-[gridHeight dims-1,gridHeight dims-2..0], x<-[gridWidth dims-1,gridWidth dims-2..0]]
                in case filter (\p->free p && later p) cands of p:_->Just p; []->Nothing
    freshColor=head ([k | k<-[9,8..1], not (S.member k (setColors set))]++[9])
    pixel=Placed (SizeSig 1 1) [freshColor] (Coord 0 0)
    insertion name proto preserved changed=case place proto of
      Just p->Left (Counterfactual c name ["inside canvas","Chebyshev distance >= 2 from every existing cell (no merge under 4- or 8-connectivity)","ordering key value strictly greater than every existing item: existing ranks unchanged"] preserved changed,\ctx->ctx {ctxSet=setInsert p (ctxSet ctx)})
      Nothing->Right (Counterfactual c name ["ILLEGAL: no position satisfies canvas, separation and rank-preservation"] [] [])
    inserts=[insertion "InsertIrrelevant fresh 1x1 pixel" pixel ["existing objects","existing ranks","current/previous"] ["CountObjects","CountShapes"]]
      ++[insertion "InsertIrrelevant duplicate of an existing object" q ["existing objects","existing ranks","CountShapes"] ["CountObjects"] | Just q<-[setSmallest set]]
    legal=translations++[padding,margin,permutation]++[x | Left x<-inserts]
    illegal=badTranslations++[x | Right x<-inserts]

-- Stage B dependency evidence: type-safe counterfactual inputs derived from
-- ONE grounded context (input canvas, input set, current object; no target).
-- Every variant is legal by construction (all cells inside the input canvas,
-- Chebyshev distance >= 2 from every other object's cell so no component
-- merges); variants that cannot be made legal are dropped. They serve only as
-- evidence that a term reads its input (DependencyWitness); they are never a
-- case-agreement context and never carry a training target. The ObjectSet
-- stays unlisted: other objects are only seen through their cell set.
dependencyContexts :: Ctx -> [(String,Ctx)]
dependencyContexts ctx=
  [("TranslateCurrent "++show (dx,dy),replaceCurrent (shift dx dy cur)) | (dx,dy)<-[(1,0),(0,1),(-1,0),(0,-1)], legal (shift dx dy cur)]
  ++[("ResizeCurrent "++show (dw,dh),replaceCurrent (resize dw dh cur)) | (dw,dh)<-[(1,0),(0,1),(1,1)], legal (resize dw dh cur)]
  ++[("PadCanvas +2",ctx {ctxDims=grow (ctxDims ctx), ctxInput=grow (ctxInput ctx)})]
  ++[("InsertIrrelevant fresh 1x1 pixel",ctx {ctxSet=setInsert p (ctxSet ctx)}) | Just p<-[pixel]]
  where
    cur=ctxCurrent ctx
    inDims=ctxInput ctx
    shift dx dy p=p {placedPos=Coord (cx (placedPos p)+dx) (cy (placedPos p)+dy)}
    resize dw dh p=let SizeSig w h=placedSig p; col=head (filter (/=0) (placedPayload p)++[1])
                   in Placed (SizeSig (w+dw) (h+dh)) (replicate ((w+dw)*(h+dh)) col) (placedPos p)
    grow (Dimensions w h)=Dimensions (w+2) (h+2)
    allCells=setCells (ctxSet ctx)
    otherCells=S.toList (S.difference allCells (S.fromList (absoluteCells cur)))
    near cells q=any (\e->abs (cx e-cx q)<=1 && abs (cy e-cy q)<=1) cells
    legal p=all (inBounds inDims) (absoluteCells p) && not (any (near otherCells) (absoluteCells p))
    replaceCurrent p=ctx {ctxCurrent=p, ctxSet=setMap (\q->if q==cur then p else q) (ctxSet ctx)}
    freshColor=head ([k | k<-[9,8..1], not (S.member k (setColors (ctxSet ctx)))]++[9])
    pixel=case [Placed (SizeSig 1 1) [freshColor] (Coord x y) | y<-[gridHeight inDims-1,gridHeight inDims-2..0], x<-[gridWidth inDims-1,gridWidth inDims-2..0]
               , not (near (S.toList allCells) (Coord x y))] of
      (p:_)->Just p
      []->Nothing
