-- Independent v0.3R language. No legacy synthesis or latent grammar imports.
module Language.Induced.Base
  ( Type(..), Value(..), Env, Expr, Node(..), Primitive(..), Effect(..)
  , base, instances, variable, literal, lambda, application, binding, call
  , exprType, exprNode, exprText, exprLength, symbols, freeVars, bindingAccesses, children
  , evalValue, runFunction, equivalent, valueKey, valueType, anchor, d4
  , Runtime(..), eval, applyRuntime, typeCheck, replaceExpr
  ) where

import Latent.Grid
import qualified Latent.Object as O
import Latent.Render (render)
import qualified Data.Map.Strict as M
import qualified Data.Set as S
import Data.List (intercalate,sortOn)
import Control.Monad (foldM)

data Type = BoolT | IntT | ColorT | CoordT | VecT | SizeT | SceneT | ObjectT
  | PoseT | PlacedT | CellT | AnchorT | D4T | BBoxT | ShapeT
  | ListT Type | SetT Type | OptionT Type | PairT Type Type | ArrowT Type Type
  deriving (Eq,Ord,Show)

-- Experimental PlacedT = rotation-distinct local Object x absolute Coord.
-- Geometry retains its actual orientation; only translation is factored out.
data Value = BoolV Bool | IntV Int | ColorV Int | CoordV Coord | VecV Vec
  | SizeV Dimensions | SceneV O.Scene | ObjectV O.Object | PoseV Coord Int
  | PlacedV O.Object | CellV Coord Int | AnchorV Int | D4V Int | BBoxV O.BBox
  | ShapeV (S.Set Coord) | ListV Type [Value] | SetV Type [Value]
  | OptionV Type (Maybe Value) | PairV Value Value
  deriving (Eq,Ord,Show)
type Env = M.Map String Value

-- Expr's constructor is private. Every public constructor checks types, and
-- persisted/assembled programs are checked again before exact verification.
data Expr = Expr { exprType :: Type, exprNode :: Node } deriving (Eq,Ord,Show)
data Node = Var String | Lit Value | Lam String Type Expr | App Expr Expr
  | Let String Expr Expr | Prim String [Expr] deriving (Eq,Ord,Show)
data Effect = Observe | Construct | PositionEffect | GeometryEffect | ColorEffect
  | Control deriving (Eq,Ord,Show)
data Primitive = Primitive
  { primitiveName :: String, primitiveEffect :: Effect, primitiveWitness :: String
  , primitiveCost :: Int, primitiveSemantics :: String, primitiveTypeScheme :: String
  } deriving (Eq,Ord,Show)

base :: [Primitive]
base = [Primitive n eff wit 1 sem (typeScheme n) | (ns,eff,wit,sem) <-
  [("literal",Observe,"shared-value","typed finite literal; shared scalar values may be deduced from a specification")
  ,("lambda application let if tuple fst snd",Control,"binding/conditional","pure ML evaluation")
  ,("map filter fold scan zipWith sortBy argminBy argmaxBy",Control,"element/step/ordering","bounded finite higher-order lists; scan includes seed")
  ,("range length head tail index concat setToList cardinality contains some none get",Observe,"finite-observation","finite collection operations; partial head/get fail explicitly")
  ,("add subtract multiply equal less lessEqual",Observe,"conditional-arithmetic","integer algebra (no task formula)")
  ,("coord vec size x y dx dy width height coordDelta coordAdd vecAdd scale",Observe,"component/conditional-algebra","orthogonal scalar and coordinate algebra")
  ,("objects cells canvasSize background",Observe,"finite-observation","canonical scene observations")
  ,("mkScene",Construct,"scene/correspondence","canonical scene constructor")
  ,("objectOf BBox Shape ObjectCells ObjectColors colorToInt",Observe,"finite-observation","orthogonal grounded observations; no provenance ID observer")
  ,("Anchor",Observe,"finite-anchor","PlacedObject x AnchorType -> Coord")
  ,("place",PositionEffect,"absolute-placement","Object x Coord -> PlacedObject; rotation-distinct geometry")
  ,("TransformD4",GeometryEffect,"finite-orientation","PlacedObject x D4 -> PlacedObject")
  ,("Recolor",ColorEffect,"color-residual","PlacedObject x Color -> PlacedObject")]
  , n <- words ns]

typeScheme :: String -> String
typeScheme n=case [show args++" -> "++show t | (name,args,t)<-signatures,name==n] of
  s:_->s
  _->case n of
    "literal"->"forall a. a"
    "lambda"->"forall a b. binder(a,body:b) -> (a -> b)"
    "application"->"forall a b. (a -> b) x a -> b"
    "let"->"forall a b. binder(a,body:b) -> b"
    "map"->"forall a b. (a -> b) x List a -> List b"
    "scan"->"forall a b. ((a x b) -> a) x a x List b -> List a"
    "fold"->"forall a b. ((a x b) -> a) x a x List b -> a"
    "filter"->"forall a. (a -> Bool) x List a -> List a"
    "zipWith"->"forall a b c. ((a x b) -> c) x List a x List b -> List c"
    "sortBy"->"forall a. (a -> Int) x List a -> List a"
    "argminBy"->"forall a. (a -> Int) x List a -> a"
    "argmaxBy"->"forall a. (a -> Int) x List a -> a"
    "tuple"->"forall a b. a x b -> Pair a b"
    "fst"->"forall a b. Pair a b -> a"
    "snd"->"forall a b. Pair a b -> b"
    "if"->"forall a. Bool x a x a -> a"
    "head"->"forall a. List a -> a"; "tail"->"forall a. List a -> List a"
    "index"->"forall a. List a x Int -> a"; "length"->"forall a. List a -> Int"
    "concat"->"forall a. List a x List a -> List a"
    "setToList"->"forall a. Set a -> List a"; "cardinality"->"forall a. Set a -> Int"
    "contains"->"forall a. Set a x a -> Bool"
    "some"->"forall a. a -> Option a"; "none"->"forall a. Option a"
    "get"->"forall a. Option a -> a"
    _->"unknown"

-- Finite monomorphization of polymorphic ML rules. This is a type universe,
-- not a collection of task-shaped production rules.
instances :: String -> Type -> [[Type]]
instances n out = case n of
  "map" -> case out of ListT b -> [[ArrowT a b,ListT a] | a <- elements]; _ -> []
  "filter" -> case out of ListT a -> [[ArrowT a BoolT,ListT a]]; _ -> []
  "fold" -> [[ArrowT (PairT out b) out,out,ListT b] | b <- elements]
  "scan" -> case out of ListT a -> [[ArrowT (PairT a b) a,a,ListT b] | b <- elements]; _ -> []
  "zipWith" -> case out of ListT c -> [[ArrowT (PairT a b) c,ListT a,ListT b] | a<-elements,b<-elements]; _ -> []
  "sortBy" -> case out of ListT a -> [[ArrowT a IntT,ListT a]]; _ -> []
  "argminBy" -> [[ArrowT out IntT,ListT out] | out `elem` elements]
  "argmaxBy" -> [[ArrowT out IntT,ListT out] | out `elem` elements]
  "head" -> [[ListT out]]
  "tail" -> case out of ListT a -> [[ListT a]]; _ -> []
  "index" -> [[ListT out,IntT]]
  "length" -> [[ListT a] | out==IntT,a<-elements]
  "concat" -> case out of ListT a -> [[ListT a,ListT a]]; _ -> []
  "setToList" -> case out of ListT a -> [[SetT a]]; _ -> []
  "cardinality" -> [[SetT a] | out==IntT,a<-elements]
  "contains" -> [[SetT a,a] | out==BoolT,a<-elements]
  "some" -> case out of OptionT a -> [[a]]; _ -> []
  "none" -> case out of OptionT _ -> [[]]; _ -> []
  "get" -> [[OptionT out]]
  "tuple" -> case out of PairT a b -> [[a,b]]; _ -> []
  "fst" -> [[PairT out b] | b<-elements]
  "snd" -> [[PairT a out] | a<-elements]
  "if" -> [[BoolT,out,out]]
  "application" -> [[ArrowT a out,a] | a<-elements]
  "lambda" -> case out of ArrowT _ _ -> [[]]; _ -> []
  "let" -> [[]] -- binding handled by the typed binder constructor
  _ -> [args | (name,args,result)<-signatures,name==n,result==out]
  where elements=[PlacedT,IntT,CoordT,VecT,ColorT,CellT,ObjectT,SceneT]

signatures :: [(String,[Type],Type)]
signatures =
  [("objects",[SceneT],ListT PlacedT),("cells",[SceneT],SetT CellT)
  ,("canvasSize",[SceneT],SizeT),("background",[SceneT],ColorT)
  ,("mkScene",[SizeT,ColorT,ListT PlacedT],SceneT)
  ,("objectOf",[PlacedT],ObjectT)
  ,("place",[ObjectT,CoordT],PlacedT),("BBox",[ObjectT],BBoxT)
  ,("Shape",[ObjectT],ShapeT),("ObjectCells",[ObjectT],SetT CellT)
  ,("ObjectColors",[ObjectT],SetT ColorT),("colorToInt",[ColorT],IntT)
  ,("Anchor",[PlacedT,AnchorT],CoordT)
  ,("TransformD4",[PlacedT,D4T],PlacedT),("Recolor",[PlacedT,ColorT],PlacedT)
  ,("coord",[IntT,IntT],CoordT),("vec",[IntT,IntT],VecT)
  ,("size",[IntT,IntT],SizeT),("x",[CoordT],IntT),("y",[CoordT],IntT)
  ,("dx",[VecT],IntT),("dy",[VecT],IntT)
  ,("width",[SizeT],IntT),("height",[SizeT],IntT)
  ,("coordDelta",[CoordT,CoordT],VecT),("coordAdd",[CoordT,VecT],CoordT)
  ,("vecAdd",[VecT,VecT],VecT),("scale",[IntT,VecT],VecT)
  ,("range",[IntT,IntT],ListT IntT)] ++
  [(n,[IntT,IntT],IntT) | n<-["add","subtract","multiply"]] ++
  [(n,[IntT,IntT],BoolT) | n<-["equal","less","lessEqual"]]

variable :: String -> Type -> Expr
variable n t=Expr t (Var n)
literal :: Value -> Expr
literal v=Expr (valueType v) (Lit v)
lambda :: String -> Type -> Expr -> Expr
lambda n a body=Expr (ArrowT a (exprType body)) (Lam n a body)
application :: Expr -> Expr -> Either String Expr
application f a=case exprType f of
  ArrowT x y | x==exprType a -> Right (Expr y (App f a))
  _ -> Left "application type mismatch"
binding :: String -> Expr -> Expr -> Expr
binding n a b=Expr (exprType b) (Let n a b)
call :: String -> Type -> [Expr] -> Either String Expr
call n out args
  | validSignature n out (map exprType args) && n `notElem` ["lambda","let","application","literal"] = Right (Expr out (Prim n args))
  | otherwise = Left ("invalid typed primitive application: "++n++" "++show (map exprType args,out))

-- Kernel typing is fully polymorphic; only SEARCH monomorphization is finite.
validSignature :: String -> Type -> [Type] -> Bool
validSignature n out ts=case (n,ts,out) of
  ("map",[ArrowT a b,ListT c],ListT d)->a==c&&b==d
  ("filter",[ArrowT a BoolT,ListT b],ListT c)->a==b&&b==c
  ("sortBy",[ArrowT a IntT,ListT b],ListT c)->a==b&&b==c
  ("scan",[ArrowT (PairT a b) c,d,ListT e],ListT f)->a==c&&c==d&&d==f&&b==e
  ("fold",[ArrowT (PairT a b) c,d,ListT e],f)->a==c&&c==d&&d==f&&b==e
  ("zipWith",[ArrowT (PairT a b) c,ListT d,ListT e],ListT f)->a==d&&b==e&&c==f
  (name,[ArrowT a IntT,ListT b],c) | name `elem` ["argminBy","argmaxBy"]->a==b&&b==c
  ("tuple",[a,b],PairT c d)->a==c&&b==d
  ("fst",[PairT a _],b)->a==b; ("snd",[PairT _ a],b)->a==b
  ("if",[BoolT,a,b],c)->a==b&&b==c
  ("head",[ListT a],b)->a==b; ("tail",[ListT a],ListT b)->a==b
  ("index",[ListT a,IntT],b)->a==b; ("length",[ListT _],IntT)->True
  ("concat",[ListT a,ListT b],ListT c)->a==b&&b==c
  ("setToList",[SetT a],ListT b)->a==b; ("cardinality",[SetT _],IntT)->True
  ("contains",[SetT a,b],BoolT)->a==b
  ("some",[a],OptionT b)->a==b; ("none",[],OptionT _)->True
  ("get",[OptionT a],b)->a==b
  _->ts `elem` instances n out

valueType :: Value -> Type
valueType v=case v of
  BoolV _->BoolT; IntV _->IntT; ColorV _->ColorT; CoordV _->CoordT; VecV _->VecT
  SizeV _->SizeT; SceneV _->SceneT; ObjectV _->ObjectT; PoseV _ _->PoseT
  PlacedV _->PlacedT; CellV _ _->CellT; AnchorV _->AnchorT; D4V _->D4T
  BBoxV _->BBoxT; ShapeV _->ShapeT; ListV t _->ListT t; SetV t _->SetT t
  OptionV t _->OptionT t; PairV a b->PairT (valueType a) (valueType b)

children :: Expr -> [Expr]
children e=case exprNode e of
  Lam _ _ b->[b]; App a b->[a,b]; Let _ a b->[a,b]; Prim _ as->as; _->[]
exprLength :: Expr -> Int
exprLength e=1+sum (map exprLength (children e))
symbols :: Expr -> S.Set String
symbols e=S.unions (local:map symbols (children e))
  where local=S.fromList $ case exprNode e of
          Var _->[]; Lit _->["literal"]; Lam _ _ _->["lambda"]; App _ _->["application"]
          Let _ _ _->["let"]; Prim n _->[n]
freeVars :: Expr -> S.Set String
freeVars e=case exprNode e of
  Var n->S.singleton n; Lam n _ b->S.delete n (freeVars b)
  Let n a b->S.union (freeVars a) (S.delete n (freeVars b))
  _->S.unions (map freeVars (children e))

-- Access paths are derived from syntax/bindings, not named dependencies. A
-- scan's pair parameter naturally gives v1.0 and v1.1 (previous state/current
-- element); these meanings come from the generic scan witness graph.
bindingAccesses :: Expr -> S.Set String
bindingAccesses e=case exprNode e of
  Prim "fst" [a]->S.map (++".0") (freeVars a)
  Prim "snd" [a]->S.map (++".1") (freeVars a)
  Var n->S.singleton n
  _->S.unions (map bindingAccesses (children e))
exprText :: Expr -> String
exprText e=case exprNode e of
  Var n->n; Lit (AnchorV i)->["TL","TR","BL","BR","Center"]!!i
  Lit v->show v; Lam n t b->"(lambda "++n++":"++show t++". "++exprText b++")"
  App f a->"application("++exprText f++","++exprText a++")"
  Let n a b->"let "++n++"="++exprText a++" in "++exprText b
  Prim n as->n++"("++intercalate "," (map exprText as)++")"

typeCheck :: M.Map String Type -> Expr -> Either String Type
typeCheck env e=do
  t<-case exprNode e of
    Var n->maybe (Left ("unbound "++n)) Right (M.lookup n env)
    Lit v->if validValue v then Right (valueType v) else Left "malformed literal"
    Lam n a b->ArrowT a <$> typeCheck (M.insert n a env) b
    App f a->do tf<-typeCheck env f; ta<-typeCheck env a
                case tf of ArrowT x y | x==ta->Right y; _->Left "ill-typed application"
    Let n a b->do ta<-typeCheck env a; typeCheck (M.insert n ta env) b
    Prim n as->do ts<-traverse (typeCheck env) as
                  if validSignature n (exprType e) ts then Right (exprType e) else Left ("ill-typed "++n)
  if t==exprType e then Right t else Left "type annotation mismatch"
  where
    validValue v=case v of
      ColorV c->c>=0&&c<=9; AnchorV i->i>=0&&i<5; D4V i->i>=0&&i<8
      ListV t xs->all (\x->valueType x==t && validValue x) xs
      SetV t xs->all (\x->valueType x==t && validValue x) xs
      OptionV t x->maybe True (\a->valueType a==t && validValue a) x
      PairV a b->validValue a&&validValue b; _->True

-- Grounded observational equality ignores input provenance IDs/orientation tags
-- (the tags have no observer); geometry/pose/cells remain exact.
normalize :: Value -> Value
normalize v=case v of
  PlacedV o->PlacedV (o {O.objectId=0,O.orientation=0})
  ObjectV o->ObjectV (o {O.objectId=0,O.position=Coord 0 0,O.orientation=0})
  ListV t xs->ListV t (map normalize xs)
  SetV t xs->SetV t (S.toList (S.fromList (map normalize xs)))
  PairV a b->PairV (normalize a) (normalize b)
  OptionV t x->OptionV t (normalize <$> x)
  _->v
valueKey :: Value -> String
valueKey (SceneV s)=either (const (show s)) (show . rows) (render s)
valueKey v=show (normalize v)
equivalent :: Value -> Value -> Bool
equivalent a b=valueType a==valueType b && valueKey a==valueKey b

data Runtime = Ground Value | Closure (Runtime -> Either String Runtime)
applyRuntime :: Runtime -> Runtime -> Either String Runtime
applyRuntime (Closure f) x=f x
applyRuntime _ _=Left "expected function"
ground :: Runtime -> Either String Value
ground (Ground v)=Right v
ground _=Left "expected ground value"
evalValue :: Env -> Expr -> Either String Value
evalValue env e=eval (M.map Ground env) e >>= ground
runFunction :: Expr -> Value -> Either String Value
runFunction e x=do f<-eval M.empty e; applyRuntime f (Ground x) >>= ground
eval :: M.Map String Runtime -> Expr -> Either String Runtime
eval env e=case exprNode e of
  Var n->maybe (Left ("unbound "++n)) Right (M.lookup n env)
  Lit v->Right (Ground v)
  Lam n _ b->Right (Closure (\v->eval (M.insert n v env) b))
  App f x->do a<-eval env f; b<-eval env x; applyRuntime a b
  Let n a b->do v<-eval env a; eval (M.insert n v env) b
  Prim "if" [p,a,b]->do v<-eval env p >>= ground
                        case v of BoolV yes->eval env (if yes then a else b); _->Left "if expects Bool"
  Prim n args->traverse (eval env) args >>= forward n (exprType e)

anchor :: O.Object -> Int -> Coord
anchor o i=([O.tl,O.tr,O.bl,O.br,O.center]!!i) o
d4 :: O.Object -> Int -> O.Object
d4 o i=([id,O.rotate90,O.rotate180,O.rotate270,O.reflectH,O.reflectV,O.reflectH . O.rotate90,O.reflectV . O.rotate90]!!i) o

forward :: String -> Type -> [Runtime] -> Either String Runtime
forward n out rs=case (n,rs) of
  ("map",[f,Ground (ListV _ xs)])->Ground . ListV (element out) <$> traverse (applyG f) xs
  ("filter",[f,Ground (ListV t xs)])->do
    flags<-traverse (applyG f) xs
    pure (Ground (ListV t [x | (x,BoolV True)<-zip xs flags]))
  ("sortBy",[f,Ground (ListV t xs)])->do
    ks<-traverse (applyG f) xs
    pure (Ground (ListV t (map snd (sortOn fst (zip ks xs)))))
  ("argminBy",[f,Ground (ListV _ xs)])->extreme False f xs
  ("argmaxBy",[f,Ground (ListV _ xs)])->extreme True f xs
  ("scan",[f,Ground seed,Ground (ListV _ xs)])->Ground . ListV (valueType seed) <$> scan f seed xs
  ("fold",[f,Ground seed,Ground (ListV _ xs)])->Ground <$> foldM (\a b->applyG f (PairV a b)) seed xs
  ("zipWith",[f,Ground (ListV _ xs),Ground (ListV _ ys)])->Ground . ListV (element out) <$> traverse (applyG f . uncurry PairV) (zip xs ys)
  _->do vs<-traverse ground rs; Ground <$> scalar n out vs
  where
    element (ListT t)=t; element _=out
    applyG f v=applyRuntime f (Ground v) >>= ground
    scan _ a []=Right [a]
    scan f a (b:bs)=do next<-applyG f (PairV a b); rest<-scan f next bs; pure (a:rest)
    extreme rev f xs=do
      ks<-traverse (applyG f) xs
      case (if rev then reverse else id) (sortOn fst (zip ks xs)) of
        (_,a):_->Right (Ground a); _->Left "argmin/argmax: empty list"

scalar :: String -> Type -> [Value] -> Either String Value
scalar n out vs=case (n,vs) of
  ("objects",[SceneV s])->Right (ListV PlacedT (map PlacedV (O.objects s)))
  ("cells",[SceneV s])->do
    g<-render s
    pure (SetV CellT [CellV p c | p<-coords (canvasOf s),Just c<-[cell g p]])
  ("canvasSize",[SceneV s])->Right (SizeV (O.canvas s))
  ("background",[SceneV s])->Right (ColorV (O.background s))
  ("mkScene",[SizeV sz,ColorV c,ListV PlacedT xs])->do os<-traverse placed xs; pure (SceneV (O.Scene sz c os))
  ("objectOf",[PlacedV o])->Right (ObjectV (o {O.position=Coord 0 0,O.orientation=0}))
  ("place",[ObjectV o,CoordV p])->Right (PlacedV (o {O.position=p,O.orientation=0}))
  ("BBox",[ObjectV o])->Right (BBoxV (O.bbox o))
  ("Shape",[ObjectV o])->Right (ShapeV (O.shape o))
  ("ObjectCells",[ObjectV o])->Right (SetV CellT [CellV p c | (p,c)<-M.toList (O.geometry o)])
  ("ObjectColors",[ObjectV o])->Right (SetV ColorT (map ColorV (S.toList (O.colors o))))
  ("colorToInt",[ColorV c])->Right (IntV c)
  ("Anchor",[PlacedV o,AnchorV i]) | i>=0&&i<5->Right (CoordV (anchor o i))
  ("TransformD4",[PlacedV o,D4V i]) | i>=0&&i<8->Right (PlacedV (d4 o i))
  ("Recolor",[PlacedV o,ColorV c]) | c>=0&&c<=9->Right (PlacedV (O.recolor o c))
  ("coord",[IntV x,IntV y])->Right (CoordV (Coord x y))
  ("vec",[IntV x,IntV y])->Right (VecV (Vec x y))
  ("size",[IntV w,IntV h]) | w>0&&h>0->Right (SizeV (Dimensions w h))
  ("x",[CoordV p])->Right (IntV (cx p)); ("y",[CoordV p])->Right (IntV (cy p))
  ("dx",[VecV (Vec x _)])->Right (IntV x); ("dy",[VecV (Vec _ y)])->Right (IntV y)
  ("width",[SizeV s])->Right (IntV (gridWidth s)); ("height",[SizeV s])->Right (IntV (gridHeight s))
  ("coordDelta",[CoordV a,CoordV b])->Right (VecV (difference a b))
  ("coordAdd",[CoordV a,VecV b])->Right (CoordV (add a b))
  ("vecAdd",[VecV (Vec a b),VecV (Vec c d)])->Right (VecV (Vec (a+c) (b+d)))
  ("scale",[IntV k,VecV (Vec a b)])->Right (VecV (Vec (k*a) (k*b)))
  ("add",[IntV a,IntV b])->Right (IntV (a+b))
  ("subtract",[IntV a,IntV b])->Right (IntV (a-b))
  ("multiply",[IntV a,IntV b])->Right (IntV (a*b))
  ("equal",[IntV a,IntV b])->Right (BoolV (a==b))
  ("less",[IntV a,IntV b])->Right (BoolV (a<b))
  ("lessEqual",[IntV a,IntV b])->Right (BoolV (a<=b))
  ("tuple",[a,b])->Right (PairV a b); ("fst",[PairV a _])->Right a; ("snd",[PairV _ b])->Right b
  ("range",[IntV a,IntV b]) | abs (b-a)<=4096->Right (ListV IntT (map IntV [a..b-1]))
  ("length",[ListV _ xs])->Right (IntV (length xs))
  ("cardinality",[SetV _ xs])->Right (IntV (S.size (S.fromList xs)))
  ("setToList",[SetV t xs])->Right (ListV t (S.toList (S.fromList xs)))
  ("contains",[SetV _ xs,a])->Right (BoolV (any (equivalent a) xs))
  ("head",[ListV _ (a:_)])->Right a; ("tail",[ListV t (_:xs)])->Right (ListV t xs)
  ("index",[ListV _ xs,IntV i]) | i>=0&&i<length xs->Right (xs!!i)
  ("concat",[ListV t a,ListV u b]) | t==u&&length a+length b<=4096->Right (ListV t (a++b))
  ("some",[a])->Right (OptionV (valueType a) (Just a))
  ("none",[]) ->case out of OptionT t->Right (OptionV t Nothing); _->Left "none type"
  ("get",[OptionV _ (Just a)])->Right a
  _->Left ("undefined bounded semantics: "++n)
  where placed (PlacedV o)=Right o; placed _=Left "mkScene expects PlacedObject"
        canvasOf=O.canvas

replaceExpr :: Expr -> Expr -> Expr -> Expr
replaceExpr old new e
  | old==e=new
  | otherwise=case exprNode e of
      Lam n t b->lambda n t (rec b)
      Let n a b->binding n (rec a) (rec b)
      App f a->either (const e) id (application (rec f) (rec a))
      Prim n as->either (const e) id (call n (exprType e) (map rec as))
      _->e
  where rec=replaceExpr old new
