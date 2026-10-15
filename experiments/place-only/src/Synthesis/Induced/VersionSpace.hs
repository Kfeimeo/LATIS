module Synthesis.Induced.VersionSpace where
import Language.Induced.Base
import qualified Data.Map.Strict as M
import qualified Data.Set as S
import Data.List (sortOn,nub)

type NodeId=Int
data VSNode = Leaf Expr | Union [NodeId]
  | Join String [NodeId] ([Expr] -> Either String Expr)
data Support = Support { supportSpec :: String, supportWitness :: String } deriving (Eq,Ord,Show)
data Space = Space
  { nodes :: M.Map NodeId VSNode, interned :: M.Map String NodeId
  , provenance :: M.Map NodeId [Support], nextNode :: Int
  , structuralDuplicates :: Int
  }
emptySpace :: Space
emptySpace=Space M.empty M.empty M.empty 1 0

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
