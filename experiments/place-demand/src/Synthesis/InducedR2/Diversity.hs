-- Training equivalence is an index, never a license to erase dependencies.
module Synthesis.InducedR2.Diversity where
import Language.Induced.Base
import Synthesis.InducedR1.Abstraction (normalize)
import Synthesis.InducedR2.NormalForm (normalForm)
import Latent.Grid (Coord(..),Vec(..),Dimensions(..))
import qualified Data.Map.Strict as M
import qualified Data.Set as S
import Data.List (sortOn,foldl',intercalate)

data StructuralSignature = StructuralSignature
  { signatureFV :: [String], dependencyProvenance :: [String]
  , literalProvenance :: [String], observerProvenance :: [String]
  , effectProvenance :: [String], structuralForm :: String
  } deriving (Eq,Ord,Show)

signatureOf :: Expr -> StructuralSignature
signatureOf original=StructuralSignature (S.toList (freeVars original))
  (sortOn id (paths [] canonicalExpr)) (sortOn id (literals canonicalExpr))
  (S.toList (symbols canonicalExpr `S.intersection` observers))
  (S.toList (S.fromList [show (primitiveEffect p) | p<-base,S.member (primitiveName p) (symbols canonicalExpr)]))
  (form canonicalExpr)
  where
    canonicalExpr=normalize (normalForm original)
    observers=S.fromList (words "width height canvasSize objects cells Anchor x y dx dy cardinality ObjectCells ObjectColors BBox Shape poseOf objectOf head tail index sortBy argminBy argmaxBy")
    paths ps e=case exprNode e of
      Var n->[show (reverse ps)++":"++n]
      _->concat [paths (label e:ps) x | x<-children e]
    label e=case exprNode e of Prim n _->n; Lam _ _ _->"lambda"; Let _ _ _->"let"; App _ _->"apply"; _->"literal"
    form e=case exprNode e of
      Var n->"var:"++show n
      Lit v->"lit:"++show (valueType v)++":"++literalKind v++":"++valueKey v
      Lam _ t b->"lambda:"++show t++"("++form b++")"
      Let _ a b->"let("++form a++","++form b++")"
      App a b->"apply("++form a++","++form b++")"
      Prim n es->n++"["++intercalate "," (map form es)++"]"

literalKind :: Value -> String
literalKind v=case v of
  IntV i | i `elem` [-1,0,1]->show i
  IntV _->"unexplained"
  AnchorV i->"enum:"++show i
  D4V i->"enum:"++show i
  ColorV i->"color:"++show i
  BoolV b->show b
  _->valueKey v
literals :: Expr -> [String]
literals e=case exprNode e of Lit v->[show (valueType v)++":"++literalKind v++":"++valueKey v]; _->concatMap literals (children e)
ungroundedCost :: Expr -> Int
ungroundedCost e=case exprNode e of
  Lit v->penalty v
  _->sum (map ungroundedCost (children e))
  where
    integer i | i `elem` [-1,0,1]=0
              | otherwise=1+bits (abs (toInteger i))
    bits 0=0; bits n=1+bits (n `div` 2)
    penalty (IntV i)=integer i
    penalty (CoordV (Coord x y))=integer x+integer y
    penalty (VecV (Vec x y))=integer x+integer y
    penalty (SizeV (Dimensions x y))=integer x+integer y
    penalty _=0 -- finite enums/color constants are Base domain literals
effectCost :: Expr -> Int
effectCost e=sum [1 | p<-base,primitiveEffect p `elem` [PositionEffect,GeometryEffect,ColorEffect],S.member (primitiveName p) (symbols e)]
rankWith :: Bool -> Expr -> (Int,Int,String)
rankWith prior e=(exprLength e+(if prior then 8*ungroundedCost e else 0)+effectCost e,exprLength e,exprText e)

-- Best representative for EACH signature, not a cap on aliases per class.
representatives :: Bool -> [Expr] -> [Expr]
representatives prior es=sortOn (rankWith prior) (M.elems (M.fromListWith better [(signatureOf e,e) | e<-es]))
  where better a b=if rankWith prior a<=rankWith prior b then a else b

selectBy :: Ord k => Bool -> Int -> (a->k) -> (a->Expr) -> [a] -> [a]
selectBy diverse aliasCap denotation expression xs=sortOn (rankWith True . expression) (M.elems kept)
  where
    -- In diversity mode every (denotation,signature) has its own representative.
    kept=if diverse then M.fromListWith better [((denotation x,Just (signatureOf (expression x))),x) | x<-xs]
         else snd (foldl' insert (M.empty,M.empty) (sortOn (rankWith False . expression) xs))
    better a b=if rankWith True (expression a)<=rankWith True (expression b) then a else b
    insert acc@(counts,ys) x
      | M.member (denotation x,Just (signatureOf (expression x))) ys=acc
      | M.findWithDefault 0 (denotation x) counts>=aliasCap=acc
      | otherwise=let n=M.findWithDefault 0 (denotation x) counts in
         (M.insert (denotation x) (n+1) counts,M.insert (denotation x,Just (signatureOf (expression x))) x ys)
