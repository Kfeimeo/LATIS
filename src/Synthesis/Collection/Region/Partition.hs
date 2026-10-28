-- LATIS Stage E2-C: object-induced strict partition trees.
--
-- A node is a region R (exact coordinate set inside its scene). Splitting R
-- by a placed object d (support D, D <= R, D /= {}) gives
--
--   Split(R,d) = { Separator(D), Content(C_1), ..., Content(C_k) }
--   C_i = the maximal 4-connected components of R \ D,  k >= 1
--
-- so the children are pairwise disjoint and cover R exactly. A split is
-- rejected (Left) when any OTHER placed object whose support lies in R is
-- not wholly inside one C_i (it would be cut), when d is not a scene object
-- inside R, or when D = R (nothing to split). k = 1 is legal but
-- non-separating (lowest priority). Separator pixels belong to the Separator
-- node only.
--
-- Trees are explored lazily (frontier of deferred nodes, largest regions
-- first); `eagerClosure` expands every legal split of a small scene for the
-- lazy-vs-eager differential test. Termination: each child region is a
-- strict subset of its parent (D non-empty), so depth is bounded by the
-- number of pixels; the budget bounds the number of expansions.
module Synthesis.Collection.Region.Partition
  ( RegionRole(..), RegionNode(..), RegionTree(..), SplitResult(..), Adjacency(..)
  , splitRegion, legalSeparators, rootNode, expandLazy, eagerClosure, PartitionBudget(..), defaultPartitionBudget
  , owningRegion, adjacency, regionArea, regionBoundsOf, treeJSON, nodeJSON, verifyPartition, PartitionWitness(..), partitionWitness, verifyPartitionWitness
  , contentRegions, leafKind, components4
  ) where

import Latent.Grid
import Synthesis.Collection.Region.Scene
import Synthesis.Collection.Geometry.Cover (PixelSet, boundsOfPixels, BoundsE(..), Rect(..), rectJSON)
import Synthesis.Collection.Diagnostics (jstr, jobj, jarr, jbool, jmaybe, stableHash)
import qualified Data.Set as S
import qualified Data.Map.Strict as M
import Data.List (sortOn, nub, sort)

data RegionRole = RoleRoot | RoleSeparator | RoleContent deriving (Eq,Ord,Show)
data RegionNode = RegionNode
  { rnId :: Int, rnParent :: Maybe Int, rnDepth :: Int, rnRole :: RegionRole, rnPixels :: PixelSet
  , rnSplitObject :: Maybe Int        -- the separator object that produced this node (and its siblings)
  , rnChildren :: [Int]               -- empty while deferred or a leaf
  , rnLeaf :: Maybe String            -- ObjectLeaf | UniformLeaf | UnsplitLeaf(NoLegalSeparator) | DeferredLeaf | NonSeparatingOnly
  , rnObjects :: [Int]                -- objects wholly inside this region (ids of the scene)
  } deriving (Eq,Show)
data RegionTree = RegionTree { rtScene :: SceneHypothesis, rtNodes :: M.Map Int RegionNode, rtNext :: Int, rtExpansions :: Int, rtDeferred :: [Int], rtSplitsTried :: Int, rtSplitsLegal :: Int, rtKHist :: M.Map Int Int, rtTruncated :: Bool } deriving (Eq,Show)
data SplitResult = SplitResult { srSeparator :: PixelSet, srContents :: [PixelSet], srK :: Int } deriving (Eq,Show)
data Adjacency = Adjacency { adA, adB :: Int, adContacts :: Int, adSeparatedBy :: Maybe Int } deriving (Eq,Show)
data PartitionBudget = PartitionBudget { pbMaxExpansions :: Int, pbMaxDepth :: Int, pbMinArea :: Int } deriving (Eq,Show)
defaultPartitionBudget :: PartitionBudget
defaultPartitionBudget=PartitionBudget 24 3 2

regionArea :: RegionNode -> Int
regionArea=S.size . rnPixels
regionBoundsOf :: RegionNode -> Maybe Rect
regionBoundsOf n=case boundsOfPixels (rnPixels n) of EmptyBounds->Nothing; PixelBounds r->Just r

-- Maximal 4-connected components of a coordinate set, in raster order of
-- their first pixel.
components4 :: PixelSet -> [PixelSet]
components4 s0=go s0
  where
    go s | S.null s = []
         | otherwise = let p=minimumRaster s; c=flood s (S.singleton p) [p] in c:go (S.difference s c)
    minimumRaster s=head (sortOn (\(Coord x y)->(y,x)) (S.toList s))
    flood _ seen []=seen
    flood s seen (p:q)=
      let ns=[n | n<-[add p (Vec dx dy) | (dx,dy)<-[(1,0),(-1,0),(0,1),(0,-1)]], S.member n s, not (S.member n seen)]
      in flood s (foldr S.insert seen ns) (ns++q)

objectsInside :: SceneHypothesis -> PixelSet -> [Int]
objectsInside sc r=[poId o | o<-shObjects sc, poSupport o `S.isSubsetOf` r]

-- Split region R by scene object d. Checks every clause of the definition.
splitRegion :: SceneHypothesis -> PixelSet -> Int -> Either String SplitResult
splitRegion sc r d=do
  o<-maybe (Left ("object "++show d++" is not in the scene")) Right (lookup d [(poId x,x) | x<-shObjects sc])
  let dSet=poSupport o
  if S.null dSet then Left "separator support is empty" else Right ()
  if not (dSet `S.isSubsetOf` r) then Left ("object "++show d++" is not wholly inside the region (would be an anonymous cut)") else Right ()
  if dSet==r then Left ("object "++show d++" is the whole region: nothing to split") else Right ()
  let rest=S.difference r dSet
      cs=components4 rest
      straddling=[poId x | x<-shObjects sc, poId x/=d, poSupport x `S.isSubsetOf` r, not (any (\c->poSupport x `S.isSubsetOf` c) cs)]
  if not (null straddling) then Left ("objects "++show straddling++" would be cut across sibling content regions") else Right ()
  Right (SplitResult dSet cs (length cs))

-- Legal separators of a region, best first: separating (k >= 2) before
-- non-separating, then larger k, then larger separator area.
legalSeparators :: SceneHypothesis -> PixelSet -> ([(Int,SplitResult)],[(Int,String)])
legalSeparators sc r=
  let tries=[(poId o,splitRegion sc r (poId o)) | o<-shObjects sc, poSupport o `S.isSubsetOf` r]
      legal=sortOn (\(i,s)->(if srK s>=2 then 0 else 1 :: Int,negate (srK s),negate (S.size (srSeparator s)),i)) [(i,s) | (i,Right s)<-tries]
  in (legal,[(i,e) | (i,Left e)<-tries])

rootNode :: SceneHypothesis -> RegionTree
rootNode sc=
  let dims=dimensions (shGrid sc)
      u=S.fromList (coords dims)
      root=RegionNode 0 Nothing 0 RoleRoot u Nothing [] Nothing (objectsInside sc u)
  in RegionTree sc (M.singleton 0 root) 1 0 [0] 0 0 M.empty False

leafKind :: SceneHypothesis -> RegionNode -> Maybe String
leafKind sc n
  | any (\o->poSupport o==rnPixels n) (shObjects sc) = Just "ObjectLeaf"
  | S.size (S.fromList [c | p<-S.toList (rnPixels n), Just c<-[cell (shGrid sc) p]])<=1 = Just "UniformLeaf"
  | otherwise = Nothing

-- Expand one deferred node (largest area first): choose the best legal
-- separator (k >= 2 preferred); record k; children become deferred unless
-- they are leaves. Returns the tree and what happened.
expandLazy :: PartitionBudget -> RegionTree -> (RegionTree,String)
expandLazy b t
  | null (rtDeferred t) = (t,"no deferred node")
  | rtExpansions t>=pbMaxExpansions b = (t {rtTruncated=True},"expansion budget reached")
  | otherwise =
      let sc=rtScene t
          nid=head (sortOn (\i->(negate (regionArea (rtNodes t M.! i)),i)) (rtDeferred t))
          n=rtNodes t M.! nid
          rest=filter (/=nid) (rtDeferred t)
          (legal,_)=legalSeparators sc (rnPixels n)
          tried=length legal+length (snd (legalSeparators sc (rnPixels n)))
          mark kind=(t {rtNodes=M.insert nid n {rnLeaf=Just kind} (rtNodes t),rtDeferred=rest,rtExpansions=rtExpansions t+1,rtSplitsTried=rtSplitsTried t+tried,rtSplitsLegal=rtSplitsLegal t+length legal},kind)
      in case leafKind sc n of
           Just k->mark k
           Nothing | rnDepth n>=pbMaxDepth b->mark "DeferredLeaf(depth)"
                   | otherwise->case [x | x@(_,s)<-legal, srK s>=2] of
               []->mark (if null legal then "UnsplitLeaf(NoLegalSeparator)" else "NonSeparatingOnly")
               ((d,s):_)->
                 let ids=[rtNext t..]
                     sepN=RegionNode (head ids) (Just nid) (rnDepth n+1) RoleSeparator (srSeparator s) (Just d) [] (Just "ObjectLeaf") [d]
                     cs=[RegionNode i (Just nid) (rnDepth n+1) RoleContent c (Just d) [] Nothing (objectsInside sc c) | (i,c)<-zip (tail ids) (srContents s)]
                     kids=sepN:cs
                     kids'=[k {rnLeaf=if rnRole k==RoleContent then leafKind sc k else rnLeaf k} | k<-kids]
                     deferredKids=[rnId k | k<-kids', rnRole k==RoleContent, rnLeaf k==Nothing, regionArea k>=pbMinArea b]
                     n'=n {rnChildren=map rnId kids',rnSplitObject=Just d}
                 in (t {rtNodes=M.union (M.fromList ((nid,n'):[(rnId k,k) | k<-kids'])) (rtNodes t),rtNext=rtNext t+length kids',rtDeferred=rest++deferredKids
                       ,rtExpansions=rtExpansions t+1,rtSplitsTried=rtSplitsTried t+tried,rtSplitsLegal=rtSplitsLegal t+length legal,rtKHist=M.insertWith (+) (srK s) 1 (rtKHist t)},"split k="++show (srK s)++" by object "++show d)

-- Eager closure of ONE tree policy (best separator per node) until no
-- deferred node remains or the budget cuts; the frontier is reported.
eagerClosure :: PartitionBudget -> RegionTree -> RegionTree
eagerClosure b t
  | null (rtDeferred t) || rtTruncated t = t
  | otherwise = let (t',_)=expandLazy b t in if t'==t then t else eagerClosure b t'

contentRegions :: RegionTree -> [RegionNode]
contentRegions t=sortOn (\n->(rnDepth n,negate (regionArea n),rnId n)) [n | n<-M.elems (rtNodes t), rnRole n/=RoleSeparator]

-- Deepest node whose pixel set wholly contains the object (separator nodes
-- count: the separator's owning region is its Separator node).
owningRegion :: RegionTree -> PlacedObject -> Maybe Int
owningRegion t o=case sortOn (\n->(negate (rnDepth n),rnId n)) [n | n<-M.elems (rtNodes t), poSupport o `S.isSubsetOf` rnPixels n] of
  (n:_)->Just (rnId n)
  []->Nothing

-- Pixel-contact adjacency between sibling regions (4-neighbour contacts),
-- plus the separator relation.
adjacency :: RegionTree -> [Adjacency]
adjacency t=
  [Adjacency (rnId a) (rnId b) n sepBy | a<-ns, b<-ns, rnId a<rnId b, rnParent a==rnParent b, let n=contacts (rnPixels a) (rnPixels b), n>0 || sepByJ a b/=Nothing, let sepBy=sepByJ a b]
  where
    ns=M.elems (rtNodes t)
    contacts x y=length [() | p<-S.toList x, d<-[Vec 1 0,Vec (-1) 0,Vec 0 1,Vec 0 (-1)], S.member (add p d) y]
    sepByJ a b=if rnRole a==RoleContent && rnRole b==RoleContent && rnSplitObject a==rnSplitObject b then rnSplitObject a else Nothing

-- Independent check of a whole tree against the scene: every expanded node
-- is exactly separator + components of (R \ D), children disjoint and
-- covering, separator is a real scene object inside R, no object straddles
-- siblings, root = canvas, depths/parents consistent.
verifyPartition :: RegionTree -> Either String ()
verifyPartition t=do
  let sc=rtScene t; ns=rtNodes t
      u=S.fromList (coords (dimensions (shGrid sc)))
  root<-maybe (Left "no root") Right (M.lookup 0 ns)
  if rnPixels root/=u then Left "root is not the whole canvas" else Right ()
  mapM_ checkNode (M.elems ns)
  where
    checkNode n
      | null (rnChildren n) = Right ()
      | otherwise = do
          let sc=rtScene t
          kids<-traverse (\i->maybe (Left ("missing child "++show i)) Right (M.lookup i (rtNodes t))) (rnChildren n)
          d<-maybe (Left "expanded node without split object") Right (rnSplitObject n)
          s<-splitRegion sc (rnPixels n) d
          let seps=[k | k<-kids, rnRole k==RoleSeparator]; cs=[rnPixels k | k<-kids, rnRole k==RoleContent]
          case seps of [sp] | rnPixels sp==srSeparator s->Right (); _->Left "separator child differs from the object support"
          if S.fromList cs/=S.fromList (srContents s) then Left "content children are not the 4-connected components of R \\ D" else Right ()
          if S.unions (map rnPixels kids)/=rnPixels n then Left "children do not cover the parent" else Right ()
          if sum (map (S.size . rnPixels) kids)/=S.size (rnPixels n) then Left "children overlap" else Right ()
          if any (\k->rnParent k/=Just (rnId n) || rnDepth k/=rnDepth n+1) kids then Left "parent/depth inconsistent" else Right ()
          if any (\k->rnObjects k/=objectsInside sc (rnPixels k) && rnRole k==RoleContent) kids then Left "object membership differs from recomputation" else Right ()

-- Serializable witness of one tree, replayable by verifyPartitionWitness.
data PartitionWitness = PartitionWitness { pwTree :: RegionTree, pwHash :: String } deriving (Eq,Show)
partitionWitness :: RegionTree -> PartitionWitness
partitionWitness t=PartitionWitness t (stableHash (show [(rnId n,rnParent n,rnRole n,S.toList (rnPixels n),rnSplitObject n) | n<-M.elems (rtNodes t)]))
verifyPartitionWitness :: PartitionWitness -> Either String ()
verifyPartitionWitness w=do
  if pwHash (partitionWitness (pwTree w))/=pwHash w then Left "tree hash differs" else Right ()
  verifyPartition (pwTree w)

nodeJSON :: RegionTree -> RegionNode -> String
nodeJSON t n=jobj [("region_id",show (rnId n)),("parent_id",jmaybe show (rnParent n)),("depth",show (rnDepth n)),("role",jstr (show (rnRole n))),("area",show (regionArea n))
  ,("colours",show (nub (sort [c | p<-S.toList (rnPixels n), Just c<-[cell (shGrid (rtScene t)) p]])))
  ,("bounds",jmaybe rectJSON (regionBoundsOf n)),("split_object_id",jmaybe show (rnSplitObject n)),("children",show (rnChildren n)),("leaf",jmaybe jstr (rnLeaf n)),("objects",show (rnObjects n))
  ,("pixels",jarr [jarr [show x,show y] | Coord x y<-take 400 (S.toList (rnPixels n))]),("pixels_truncated",jbool (S.size (rnPixels n)>400)),("view",jstr (show (shView (rtScene t))))]
treeJSON :: RegionTree -> String
treeJSON t=jobj [("scene",sceneJSON (rtScene t)),("nodes",jarr (map (nodeJSON t) (M.elems (rtNodes t)))),("expansions",show (rtExpansions t)),("deferred",show (rtDeferred t)),("truncated",jbool (rtTruncated t))
  ,("splits_tried",show (rtSplitsTried t)),("splits_legal",show (rtSplitsLegal t)),("k_histogram",jobj [(show k,show v) | (k,v)<-M.toList (rtKHist t)])
  ,("adjacency",jarr [jobj [("a",show (adA a)),("b",show (adB a)),("contacts",show (adContacts a)),("separated_by",jmaybe show (adSeparatedBy a))] | a<-adjacency t])
  ,("leaf_kinds",show (nub [l | n<-M.elems (rtNodes t), Just l<-[rnLeaf n]])),("verified",jstr (either id (const "passed") (verifyPartition t)))]
