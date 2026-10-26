-- LATIS Stage A: typed N-ary operator application with Typed Hole filling.
--
-- Generalizes the binary feature comparison P(fi)=fo to type-correct operator
-- instances P(a1,...,ak)=fo where every ai is an input-side feature, a bounded
-- composed input-side sub-expression, or a constant shared by every training
-- case. The module is generic in the leaf type `l` (grid-level features for
-- the Size2 rule, sequence-local observers for the object slots); the caller
-- supplies the visible leaves (type, visibility and ontology slice are its
-- responsibility) and one leaf evaluator per training row.
--
-- Arithmetic is evaluated through Language.ML (Add/Subtract/Multiply/Mod/
-- IsOdd/If); nothing here re-implements the semantics. Enumeration is
-- deterministic, budgeted and records its truncations. Every training-exact
-- instance survives as a representative (no collapse by training denotation);
-- only commutative argument order (Add/Mul) and identity constants
-- (x+0, x*1, x mod +-1) are normalized, which never merges intensionally
-- different expressions.
module Synthesis.Collection.Typed
  ( TTy(..), TVal(..), tyOf, asInt
  , TOp(..), opName, opSignature, opArity, baseOps, parityOps, boolOps, enumeratedBoolOps, applyOp, invertOp, commutative
  , TExpr(..), tLength, tConstants, tFeatures, tLeaves, tDepth, tCost, renderT, evalT, fillHoles, substHoles, holeCount
  , ArgPolicy(..), StageA(..), stageAOff, HoleConfig(..), holeConfig, holeConfigB
  , Template(..), enumerateTemplates, extendedTemplates, fixedTemplates
  , ConstantSource(..), Binding(..), Candidate(..), TypedResult(..), synthesizeTyped, bindingText
  ) where

import qualified Language.ML as ML
import Language.Types (Ty(..))
import Data.List (sortOn, nub)
import Data.Maybe (isJust)

-- Types of the typed hole language. NatPos (grid widths/heights) is a
-- refinement of Int checked where a size is realized (Synthesis.Collection.Size).
data TTy = TyInt | TyBool deriving (Eq,Ord,Show)
data TVal = VI !Int | VB !Bool deriving (Eq,Ord,Show)
tyOf :: TVal -> TTy
tyOf (VI _)=TyInt
tyOf (VB _)=TyBool
asInt :: TVal -> Either String Int
asInt (VI n)=Right n
asInt (VB _)=Left "typed expression returned Bool where Int was required"

-- Operator registry. Semantics are delegated to Language.ML.eval.
-- Stage B adds the comparison and Boolean connectives (Lt, Gt, Eq, And, Or,
-- Not). They only ever produce Bool, so the typed enumerator expands them
-- exclusively where a Bool is demanded (an If condition or a Bool target):
-- there is no Bool leaf and no Bool constant hole.
data TOp = OpAdd | OpSub | OpMul | OpMod | OpIsOdd | OpIf | OpLt | OpGt | OpEq | OpAnd | OpOr | OpNot deriving (Eq,Ord,Show,Enum,Bounded)
opName :: TOp -> String
opName OpAdd="Add"
opName OpSub="Sub"
opName OpMul="Mul"
opName OpMod="Mod"
opName OpIsOdd="IsOdd"
opName OpIf="If"
opName OpLt="Lt"
opName OpGt="Gt"
opName OpEq="Eq"
opName OpAnd="And"
opName OpOr="Or"
opName OpNot="Not"
opSignature :: TOp -> ([TTy],TTy)
opSignature OpAdd=([TyInt,TyInt],TyInt)
opSignature OpSub=([TyInt,TyInt],TyInt)
opSignature OpMul=([TyInt,TyInt],TyInt)
opSignature OpMod=([TyInt,TyInt],TyInt)
opSignature OpIsOdd=([TyInt],TyBool)
opSignature OpIf=([TyBool,TyInt,TyInt],TyInt)
opSignature OpLt=([TyInt,TyInt],TyBool)
opSignature OpGt=([TyInt,TyInt],TyBool)
opSignature OpEq=([TyInt,TyInt],TyBool)
opSignature OpAnd=([TyBool,TyBool],TyBool)
opSignature OpOr=([TyBool,TyBool],TyBool)
opSignature OpNot=([TyBool],TyBool)
opArity :: TOp -> Int
opArity=length . fst . opSignature
commutative :: TOp -> Bool
commutative op=op `elem` [OpAdd,OpMul,OpEq,OpAnd,OpOr]
baseOps, parityOps, boolOps, enumeratedBoolOps :: [TOp]
baseOps=[OpAdd,OpSub,OpMul]
parityOps=[OpMod,OpIsOdd,OpIf]
boolOps=[OpLt,OpGt,OpEq,OpAnd,OpOr,OpNot]
-- Gt(a,b) is Lt(b,a) and the enumerator already keeps both argument orders of
-- the non-commutative Lt, so Gt is registered/evaluable but not enumerated
-- (no duplicate enumeration in the first version); <=, >=, /= arise as Not(Lt),
-- Not(Gt), Not(Eq) compositions.
enumeratedBoolOps=[OpLt,OpEq,OpAnd,OpOr,OpNot]

applyOp :: TOp -> [TVal] -> Either String TVal
applyOp OpAdd [VI a,VI b]=VI <$> ML.eval (ML.Add (ML.Value TInt a) (ML.Value TInt b))
applyOp OpSub [VI a,VI b]=VI <$> ML.eval (ML.Subtract (ML.Value TInt a) (ML.Value TInt b))
applyOp OpMul [VI a,VI b]=VI <$> ML.eval (ML.Multiply (ML.Value TInt a) (ML.Value TInt b))
applyOp OpMod [VI a,VI b]=VI <$> ML.eval (ML.Mod (ML.Value TInt a) (ML.Value TInt b))
applyOp OpIsOdd [VI a]=VB <$> ML.eval (ML.IsOdd (ML.Value TInt a))
applyOp OpIf [VB c,VI a,VI b]=VI <$> ML.eval (ML.If (ML.Value TBool c) (ML.Value TInt a) (ML.Value TInt b))
applyOp OpLt [VI a,VI b]=VB <$> ML.eval (ML.Less (ML.Value TInt a) (ML.Value TInt b))
applyOp OpGt [VI a,VI b]=VB <$> ML.eval (ML.Less (ML.Value TInt b) (ML.Value TInt a))
applyOp OpEq [VI a,VI b]=VB <$> ML.eval (ML.EqualInt (ML.Value TInt a) (ML.Value TInt b))
applyOp OpAnd [VB a,VB b]=VB <$> ML.eval (ML.And (ML.Value TBool a) (ML.Value TBool b))
applyOp OpOr [VB a,VB b]=VB <$> ML.eval (ML.Or (ML.Value TBool a) (ML.Value TBool b))
applyOp OpNot [VB a]=VB <$> ML.eval (ML.Not (ML.Value TBool a))
applyOp op vs=Left ("operator argument types: "++opName op++" applied to "++show (map tyOf vs))

-- Solve op(args[0..i-1], ?, args[i+1..]) = target for the hole at position i.
-- Only equations with a unique integer solution are inverted; everything else
-- (Mod, If, multiplication by zero, non-divisible products) is Nothing and
-- falls back to the bounded constant domain.
invertOp :: TOp -> Int -> [TVal] -> TVal -> Maybe TVal
invertOp OpAdd 0 [_,VI b] (VI t)=Just (VI (t-b))
invertOp OpAdd 1 [VI a,_] (VI t)=Just (VI (t-a))
invertOp OpSub 0 [_,VI b] (VI t)=Just (VI (t+b))
invertOp OpSub 1 [VI a,_] (VI t)=Just (VI (a-t))
invertOp OpMul 0 [_,VI b] (VI t) | b/=0 && t `mod` b==0=Just (VI (t `div` b))
invertOp OpMul 1 [VI a,_] (VI t) | a/=0 && t `mod` a==0=Just (VI (t `div` a))
invertOp _ _ _ _=Nothing

-- Expressions. THole marks an unfilled constant hole of a template.
data TExpr l = TLeaf l | TConst TVal | THole Int | TApp TOp [TExpr l] deriving (Eq,Ord,Show)
instance Functor TExpr where
  fmap f (TLeaf l)=TLeaf (f l)
  fmap _ (TConst v)=TConst v
  fmap _ (THole i)=THole i
  fmap f (TApp op as)=TApp op (map (fmap f) as)
tLength :: TExpr l -> Int
tLength (TApp _ as)=1+sum (map tLength as)
tLength _=1
tConstants :: TExpr l -> Int
tConstants (TConst _)=1
tConstants (THole _)=1
tConstants (TApp _ as)=sum (map tConstants as)
tConstants _=0
tFeatures :: TExpr l -> Int
tFeatures (TLeaf _)=1
tFeatures (TApp _ as)=sum (map tFeatures as)
tFeatures _=0
tLeaves :: TExpr l -> [l]
tLeaves (TLeaf l)=[l]
tLeaves (TApp _ as)=concatMap tLeaves as
tLeaves _=[]
tDepth :: TExpr l -> Int
tDepth (TApp _ as)=1+maximum (0:map tDepth as)
tDepth _=0
holeCount :: TExpr l -> Int
holeCount (THole _)=1
holeCount (TApp _ as)=sum (map holeCount as)
holeCount _=0
-- Structural cost: length plus the literal penalty of the scalar prior (4 per constant).
tCost :: TExpr l -> Int
tCost e=tLength e+4*tConstants e
renderT :: (l -> String) -> TExpr l -> String
renderT f (TLeaf l)=f l
renderT _ (TConst (VI n))=show n
renderT _ (TConst (VB b))=show b
renderT _ (THole i)="?c"++show i
renderT f (TApp op as)=opName op++"("++commas (map (renderT f) as)++")"
  where commas []=""
        commas [x]=x
        commas (x:xs)=x++","++commas xs
evalT :: (l -> Either String TVal) -> TExpr l -> Either String TVal
evalT f (TLeaf l)=f l
evalT _ (TConst v)=Right v
evalT _ (THole i)=Left ("unfilled constant hole ?c"++show i)
evalT f (TApp op as)=traverse (evalT f) as >>= applyOp op
fillHoles :: [TVal] -> TExpr l -> TExpr l
fillHoles cs=substHoles (\i->case drop i cs of (c:_)->TConst c; []->THole i)
substHoles :: (Int -> TExpr l) -> TExpr l -> TExpr l
substHoles f (THole i)=f i
substHoles f (TApp op as)=TApp op (map (substHoles f) as)
substHoles _ e=e

-- Configuration. The Stage A block is carried by the front-end Config; all
-- flags off reproduce v0.6.1 exactly.
data ArgPolicy = FeatureAndConstant | FeatureOnly | ConstantOnly deriving (Eq,Ord,Show,Read)
data StageA = StageA
  { saGridSize :: Bool        -- Size2 feature + size-driven grid realization
  , saTypedHoles :: Bool      -- generic typed N-ary hole search (size rule and object slots)
  , saParityOps :: Bool       -- Mod / IsOdd / If in the visible operator registry
  , saArgPolicy :: ArgPolicy  -- FeatureAndConstant | FeatureOnly | ConstantOnly
  , saHoleDepth :: Int        -- composed depth bound (templates are spine-shaped: one composed argument per level)
  , saMaxHoles :: Int         -- constant holes per template, fitted jointly
  , saHoleBudget :: Int       -- row evaluations per synthesis target
  , saTotalHoleBudget :: Int  -- row evaluations of the typed slot search over the whole front-end run
  , saConstantDomain :: [Int] -- bounded domain for holes that cannot be solved algebraically
  } deriving (Eq,Show)
stageAOff :: StageA
stageAOff=StageA False False False FeatureAndConstant 2 2 60000 1200000 [-4..4]
data HoleConfig = HoleConfig { hcDepth, hcMaxHoles, hcBudget :: Int, hcDomain :: [Int], hcOps :: [TOp], hcPolicy :: ArgPolicy } deriving (Eq,Show)
holeConfig :: StageA -> HoleConfig
holeConfig sa=holeConfigB sa False
-- Stage B0: the same configuration with the comparison/Boolean operators
-- visible (they are listed after the Stage A operators so that every Stage A
-- template keeps its place in the enumeration order).
holeConfigB :: StageA -> Bool -> HoleConfig
holeConfigB sa bool=HoleConfig (saHoleDepth sa) (saMaxHoles sa) (saHoleBudget sa) (saConstantDomain sa)
  (baseOps++[op | saParityOps sa, op<-parityOps]++[op | bool, op<-enumeratedBoolOps]) (saArgPolicy sa)

-- A template is an open expression (feature leaves + constant holes).
data Template l = Template { tmExpr :: TExpr l, tmHoles :: Int, tmFeatureLeaves :: Int, tmDepth :: Int } deriving (Eq,Show)

-- Deterministic, typed enumeration. Order: zero-hole templates by depth
-- (Feature-first, then composed features), then one hole, then two holes;
-- within a group templates with parity operators (Mod/IsOdd/If) follow the
-- base-arithmetic ones, then the enumeration index breaks ties. At depth d>=2
-- exactly one argument is a depth-(d-1) template and the others are depth-0
-- leaves/holes (bounded "spine" composition). Commutative operators keep one
-- argument order; non-commutative ones (Sub, Mod, If) keep every order.
enumerateTemplates :: Ord l => HoleConfig -> [(l,TTy)] -> TTy -> [Template l]
enumerateTemplates hc leaves target=renumber (sortOn (\t->(tmHoles t,tmDepth t,parityCount (tmExpr t))) (concat [ofDepth d target | d<-[0..hcDepth hc]]))
  where
    allowConst=hcPolicy hc/=FeatureOnly
    maxFeatures=if hcPolicy hc==ConstantOnly then 1 else maxBound
    level0 ty=[Template (TLeaf l) 0 1 0 | (l,t)<-leaves, t==ty]++[Template (THole 0) 1 0 0 | ty==TyInt, allowConst]
    ofDepth 0 ty=level0 ty
    ofDepth d ty=[t | op<-hcOps hc, snd (opSignature op)==ty, t<-apps d op]
    apps d op=
      let tys=fst (opSignature op)
          n=length tys
          slots=[(i,t) | (i,t)<-zip [0::Int ..] tys]
          -- position of the composed argument (depth d-1); the rest are depth 0.
          -- Stage B: the Bool connectives (And/Or) take two Bool arguments and
          -- there is no depth-0 Bool term, so both of their arguments are
          -- composed (depth d-1); every other operator keeps the Stage A spine.
          choices=[[if i==k || (op `elem` [OpAnd,OpOr]) then ofDepth (d-1) t else level0 t | (i,t)<-slots] | k<-[0..(if op `elem` [OpAnd,OpOr] then 0 else n-1)]]
          combos=concatMap sequence choices
      -- argument combinations are structurally distinct by construction (no nub needed)
      in [Template (TApp op (map tmExpr args)) h f d
             | args<-combos
             , let h=sum (map tmHoles args); f=sum (map tmFeatureLeaves args)
             , h<=hcMaxHoles hc, f<=maxFeatures
             , f>0                                    -- pure-constant applications collapse to a single hole
             , not (commutative op && length args==2 && tmExpr (args!!0)>tmExpr (args!!1))
             , not (op `elem` [OpSub,OpMod,OpLt,OpGt,OpEq] && length args==2 && tmExpr (args!!0)==tmExpr (args!!1))  -- x-x, x mod x, x<x, x==x are constants in disguise
             , not (op==OpIf && any isHoleOrConst (take 1 args))  -- a constant condition is a degenerate If
             , not (op==OpIf && any ((==0) . tmFeatureLeaves) (take 1 args))  -- Stage B: a condition without a feature leaf (Lt(?c0,?c1)) is a constant condition
             , not (op `elem` [OpLt,OpGt,OpEq] && all isHoleOrConst args)  -- a comparison of two constants is a Bool constant
             ]
    -- operator cost prior: templates that use the parity operators (and, in
    -- Stage B, the comparison/Boolean operators) come after the
    -- base-arithmetic templates of the same shape (hole count, depth)
    parityCount :: TExpr l -> Int
    parityCount (TApp op as)=(if op `elem` parityOps || op `elem` boolOps then 1 else 0)+sum (map parityCount as)
    parityCount _=0
    isHoleOrConst (Template (THole _) _ _ _)=True
    isHoleOrConst (Template (TConst _) _ _ _)=True
    isHoleOrConst _=False
    -- holes are numbered left to right so bindings can be reported by index
    renumber=map (\t->t {tmExpr=fst (number 0 (tmExpr t))})
    number k (THole _)=(THole k,k+1)
    number k (TApp op as)=let (as',k')=foldl' (\(acc,i) a->let (a',i')=number i a in (acc++[a'],i')) ([],k) as in (TApp op as',k')
    number k e=(e,k)

-- D+ appends deeper, lazily generated spine layers to the exact old depth-2
-- prefix. No global sorting/materialization of the depth-3 universe.
extendedTemplates :: Ord l => HoleConfig -> [(l,TTy)] -> TTy -> [Template l]
extendedTemplates hc leaves target
  | hcDepth hc<=2=enumerateTemplates hc leaves target
  | otherwise=enumerateTemplates hc {hcDepth=2} leaves target++concat [layer d target | d<-[3..hcDepth hc]]
  where
    zero ty=[TLeaf l | (l,t)<-leaves,t==ty]++[THole 0 | ty==TyInt,hcPolicy hc/=FeatureOnly]
    exact d ty | d<=2=[tmExpr t | t<-enumerateTemplates hc {hcDepth=d} leaves ty,tmDepth t==d]
               | otherwise=map tmExpr (layer d ty)
    layer d ty=[Template (fst (number 0 e)) h (tFeatures e) d
      | holes<-[0..hcMaxHoles hc],op<-hcOps hc,snd (opSignature op)==ty
      ,let ts=fst (opSignature op)
      ,k<-[0..if op `elem` [OpAnd,OpOr] then 0 else length ts-1]
      ,args<-sequence [if i==k || op `elem` [OpAnd,OpOr] then exact (d-1) t else zero t | (i,t)<-zip [0..] ts]
      ,let e=TApp op args; h=holeCount e
      ,h==holes,tFeatures e>0
      ,hcPolicy hc/=ConstantOnly || tFeatures e<=1
      ,not (commutative op && length args==2 && head args>args!!1)
      ,not (op `elem` [OpSub,OpMod,OpLt,OpGt,OpEq] && length args==2 && head args==args!!1)
      ,not (op==OpIf && tFeatures (head args)==0)
      ,not (op `elem` [OpLt,OpGt,OpEq] && all ((==0) . tFeatures) args)]
    number n (THole _)=(THole n,n+1)
    number n (TApp op as)=let (bs,m)=foldl' (\(acc,i) a->let (b,j)=number i a in (acc++[b],j)) ([],n) as in (TApp op bs,m)
    number n e=(e,n)

-- The fixed template list of the GridSizeOnly ablation (no hole search):
-- a feature, a feature +-1, the sum of two features, or a constant target.
fixedTemplates :: [(l,TTy)] -> [Template l]
fixedTemplates leaves=
  [Template (TLeaf l) 0 1 0 | (l,TyInt)<-leaves]
  ++[Template (TApp OpAdd [TLeaf l,TConst (VI k)]) 0 1 1 | (l,TyInt)<-leaves, k<-[-1,1]]
  ++[Template (TApp OpAdd [TLeaf a,TLeaf b]) 0 2 1 | (i,(a,TyInt))<-zip [0::Int ..] leaves, (b,TyInt)<-drop i leaves]
  ++[Template (THole 0) 1 0 0]

data ConstantSource = Solved | DomainEnumerated deriving (Eq,Ord,Show)
data Binding = BoundFeature String | BoundComposed String | BoundConstant Int ConstantSource deriving (Eq,Ord,Show)
bindingText :: Binding -> String
bindingText (BoundFeature s)="feature "++s
bindingText (BoundComposed s)="composed "++s
bindingText (BoundConstant n src)="constant "++show n++" ("++(case src of Solved->"solved from the training equations"; DomainEnumerated->"bounded domain")++", shared by all cases)"
data Candidate l = Candidate
  { cExpr :: TExpr l, cTemplate :: TExpr l, cBindings :: [Binding], cCost :: Int, cIndex :: Int
  , cDenotation :: [TVal], cDependencies :: [l] } deriving (Eq,Show)
data TypedResult l = TypedResult
  { trFits :: [Candidate l], trTemplates :: Int, trTemplatesTried :: Int, trEvaluations :: Int, trTruncated :: Bool
  , trConstantFits :: Int, trFeatureOnlyFits :: Int } deriving (Eq,Show)

-- Fit every template against the rows (leaf evaluator, target) within the
-- evaluation budget. Constant holes are fitted jointly: all but one hole range
-- over the bounded domain; the remaining hole is solved from the first row's
-- equation when its operator position is invertible, and verified on every
-- other row. Each row evaluation of an argument counts one unit of budget.
synthesizeTyped :: (Eq l, Show l) => HoleConfig -> (l -> String) -> [Template l] -> [(l -> Either String TVal,TVal)] -> TypedResult l
synthesizeTyped hc render templates rows=go templates 0 0 [] 0
  where
    total=length templates
    go [] tried evals fits _=TypedResult (reverse fits) total tried evals False (length [() | c<-reverse fits, tConstants (cExpr c)>0]) (length [() | c<-reverse fits, tConstants (cExpr c)==0])
    go (t:ts) tried evals fits idx
      | evals>=hcBudget hc=(go [] tried evals fits idx) {trTruncated=True}
      | otherwise=
          let (assignments,n)=fitTemplate t
              new=[mkCandidate t cs (idx+j) | (j,cs)<-zip [0..] assignments]
          in go ts (tried+1) (evals+n) (reverse new++fits) (idx+length assignments)
    mkCandidate t cs i=
      let e=fillHoles (map VI cs) (tmExpr t)
          den=[either (const (VB False)) id (evalT f e) | (f,_)<-rows]
      in Candidate e (tmExpr t) (bindings (tmExpr t) cs) (tCost e) i den (nub (tLeaves e))
    bindings tmpl cs=go' tmpl
      where go' (TLeaf l)=[BoundFeature (render l)]
            go' (TConst (VI n))=[BoundConstant n Solved]
            go' (TConst (VB b))=[BoundConstant (fromEnum b) Solved]
            go' (THole i)=[BoundConstant (cs!!i) (sourceOf tmpl i)]
            go' (TApp op as)=BoundComposed (opName op):concatMap go' as
    sourceOf tmpl i=case solvable tmpl of Just j | j==i->Solved; _->DomainEnumerated
    -- the first root-direct hole whose operator position is invertible
    solvable (TApp op as)=case [i | (i,THole _)<-zip [0::Int ..] as, isJust (invertOp op i (probe i as) (VI 0))] of
      (i:_)->case as!!i of THole j->Just j; _->Nothing
      []->Nothing
    solvable _=Nothing
    probe i as=[if k==i then VI 0 else VI 1 | (k,_)<-zip [0::Int ..] as]
    -- Constants that make an operator a no-op (x+0, x-0, x*1, x*0) are
    -- dropped anywhere in the template; a Mod divisor hole is restricted to
    -- divisors >= 2 (0 and +-1 are degenerate, negative divisors only mirror
    -- the positive class with Haskell's sign rule).
    identityConstant op pos c=case op of
      OpAdd->c==0; OpSub->c==0; OpMul->c==0 || c==1; OpMod->pos==1 && c<2; _->False
    degenerate tmpl cs=go' tmpl
      where go' (TApp op as)=or [identityConstant op pos (cs!!j) | (pos,THole j)<-zip [0::Int ..] as] || any go' as
            go' _=False
    fitTemplate t
      | tmHoles t==0=let (ok,n)=checkAll (tmExpr t) in (if ok then [[]] else [],n)
      | otherwise=
          let h=tmHoles t
              tmpl=tmExpr t
              solveIdx=solvable tmpl
              enumerated=[i | i<-[0..h-1], Just i/=solveIdx]
              domainAssignments=sequence [hcDomain hc | _<-enumerated]
              results=[ (full,n) | partial<-domainAssignments
                      , let (full,n)=complete tmpl solveIdx (zip enumerated partial) ]
              fitsFound=[cs | (Just cs,_)<-results, not (degenerate tmpl cs)]
          in (fitsFound,sum (map snd results))
    -- complete one joint assignment: solve the remaining hole from row 0 if
    -- possible, then verify the fully filled template on every row.
    complete tmpl solveIdx partial=
      let h=holeCount tmpl
          lookupC i=maybe 0 id (lookup i partial)
          fillPartial=fillHoles [VI (lookupC i) | i<-[0..h-1]] tmpl
      in case solveIdx of
          Nothing->let (ok,n)=checkAll fillPartial in (if ok then Just [lookupC i | i<-[0..h-1]] else Nothing,n)
          Just s->case rows of
            []->(Nothing,0)
            ((f0,t0):_)->
              case substHoles (\i->if i==s then THole i else TConst (VI (lookupC i))) tmpl of
                TApp op as->
                  let pos=case [k | (k,THole _)<-zip [0::Int ..] as] of (k:_)->k; []->(-1)
                      others=[evalT f0 a | (k,a)<-zip [0::Int ..] as, k/=pos]
                      n0=length others
                  in case sequence others of
                      Left _->(Nothing,n0)
                      Right vs->
                        let argVals=insertAt pos (VI 0) vs
                        in case invertOp op pos argVals t0 of
                          Nothing->(Nothing,n0)
                          Just c->let cs=[if i==s then (case c of VI v->v; VB b->fromEnum b) else lookupC i | i<-[0..h-1]]
                                      (ok,n)=checkAll (fillHoles (map VI cs) tmpl)
                                  in (if ok then Just cs else Nothing,n0+n)
                _->(Nothing,0)
    insertAt k v xs=take k xs++[v]++drop k xs
    checkAll e=loop rows (0::Int)
      where loop [] n=(True,n)
            loop ((f,target):rs) n=if evalT f e==Right target then loop rs (n+1) else (False,n+1)
