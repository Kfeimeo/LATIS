-- LATIS Stage E4: typed output construction templates (the shared skeleton Q).
--
--   IntExpr        ::= ILit n | IHole h | IOff h d        (d /= 0; the value of h plus a frozen constant)
--   ColourExpr     ::= CLit c | CHole h
--   ShapeT         ::= TRect x0 y0 x1 y1 | TUnion ShapeT ShapeT | TDiff ShapeT ShapeT
--                      (local object frame; same semantics as ShapeMDL: union needs disjoint
--                       operands, difference needs a non-empty subtrahend strictly inside the minuend)
--   ObjectT        ::= TPlace ShapeT ColourExpr px py       (px,py = canvas position of the local origin)
--   CollectionT    ::= TSingle ObjectT
--                    | TRepeat ObjectT count (dx,dy)         (k-th instance at (px+k*dx, py+k*dy), k in 0..count-1)
--   SceneT         ::= TCanvas w h BackgroundT [CollectionT]
--   BackgroundT    ::= BgLit c | BgHole h | BgNone           (BgNone: every pixel must be an object pixel)
--
-- A template is instantiated with Bindings (hole -> Int) and rendered pixel for
-- pixel; every pixel's provenance (which collection/instance, or residual) is
-- recorded so that a construction witness can be checked independently.
--
-- Cost (frozen before the experiments; integers; never tuned per task):
--   operators: Canvas 1, Place 1, Repeat 2, Rect 1, Union 1, Diff 2, background literal 1 / hole 1 / none 0
--   parameters: literal 1; hole occurrence 1 + hole declaration 2 (lambda_h); offset relation 2
--   bindings:   lambda_b = 1 per (hole, case)
--   views:      lambda_v = 2 per view switch between cases
--   matching:   lambda_m = 1 per alternative role assignment of the same cost beyond the first
-- Reference costs of the degenerate explanations (per training set) are
-- exposed next to it so that a candidate skeleton can be compared with them.
module Synthesis.Collection.Output.Template
  ( HoleId, HoleType(..), IntExpr(..), ColourExpr(..), ShapeT(..), ObjectT(..), CollectionT(..), BackgroundT(..), SceneT(..)
  , Bindings, HoleInfo(..), Rendered(..), renderScene, evalInt, evalColour, shapeOfTemplate
  , templateCost, CostBreakdown(..), costBreakdown, degenerateCosts, independentSceneCost
  , holesOf, intExprHoles, templateSlots, nontrivialStructure, structureSignature, canonicalScene
  , intExprJSON, colourExprJSON, shapeTJSON, objectTJSON, collectionTJSON, sceneTJSON, holeInfoJSON, intExprText, shapeTText, objectTText, sceneTText
  , templateVersion
  ) where

import Latent.Grid
import Synthesis.Collection.Geometry.Cover (Rect(..))
import Synthesis.Collection.Region.ShapeMDL (ShapeExpr(..), evalShape, shapeCost)
import Synthesis.Collection.Diagnostics (jstr, jobj, jarr, jbool, jmaybe)
import qualified Data.Map.Strict as M
import qualified Data.Set as S
import Data.List (sort, nub, intercalate, sortOn)

templateVersion :: String
templateVersion="E4-output-template-v1: Rect/DisjointUnion/Difference shapes in the local frame, Place(shape,colour,x,y), Repeat(object,count,linear placement), Canvas(w,h,background|none); costs Canvas1 Place1 Repeat2 Rect1 Union1 Diff2 Lit1 Hole1+2 Off2 Bind1 View2 Match1"

type HoleId = Int
data HoleType = HInt | HColour deriving (Eq,Ord,Show)
data IntExpr = ILit Int | IHole HoleId | IOff HoleId Int deriving (Eq,Ord,Show)
data ColourExpr = CLit Int | CHole HoleId deriving (Eq,Ord,Show)
data ShapeT = TRect IntExpr IntExpr IntExpr IntExpr | TUnion ShapeT ShapeT | TDiff ShapeT ShapeT deriving (Eq,Ord,Show)
data ObjectT = TPlace { otShape :: ShapeT, otColour :: ColourExpr, otX :: IntExpr, otY :: IntExpr } deriving (Eq,Ord,Show)
data CollectionT = TSingle ObjectT | TRepeat ObjectT IntExpr (IntExpr,IntExpr) deriving (Eq,Ord,Show)
data BackgroundT = BgLit Int | BgHole HoleId | BgNone deriving (Eq,Ord,Show)
data SceneT = TCanvas { stW :: IntExpr, stH :: IntExpr, stBg :: BackgroundT, stObjects :: [CollectionT] } deriving (Eq,Ord,Show)
type Bindings = M.Map HoleId Int

-- Every hole of a skeleton with its provenance; E4 never produces an input binding.
data HoleInfo = HoleInfo
  { hiId :: HoleId, hiType :: HoleType, hiRole :: String            -- structural role (path in the template)
  , hiValues :: [(Int,Int)]                                          -- (case, output-observed value)
  , hiConstraints :: [String]                                        -- offsets / shared occurrences
  , hiOccurrences :: Int
  , hiOrigin :: String                                               -- "OutputObserved"
  , hiInputBinding :: String                                         -- "NotAttempted"
  } deriving (Eq,Show)

-- ---------------------------------------------------------------- evaluation / rendering

evalInt :: Bindings -> IntExpr -> Either String Int
evalInt _ (ILit n)=Right n
evalInt b (IHole h)=maybe (Left ("unbound hole ?"++show h)) Right (M.lookup h b)
evalInt b (IOff h d)=maybe (Left ("unbound hole ?"++show h)) (Right . (+d)) (M.lookup h b)
evalColour :: Bindings -> ColourExpr -> Either String Int
evalColour _ (CLit c)=Right c
evalColour b (CHole h)=maybe (Left ("unbound colour hole ?"++show h)) Right (M.lookup h b)

shapeOfTemplate :: Bindings -> ShapeT -> Either String ShapeExpr
shapeOfTemplate b (TRect x0 y0 x1 y1)=do
  a<-evalInt b x0; c<-evalInt b y0; d<-evalInt b x1; e<-evalInt b y1
  if d<a || e<c then Left ("template rectangle inverted "++show (a,c,d,e)) else Right (SRect (Rect a c d e))
shapeOfTemplate b (TUnion l r)=SUnion <$> shapeOfTemplate b l <*> shapeOfTemplate b r
shapeOfTemplate b (TDiff l r)=SDiff <$> shapeOfTemplate b l <*> shapeOfTemplate b r

data Rendered = Rendered { rdGrid :: Grid, rdProvenance :: M.Map Coord String, rdObjectPixels :: [(String,Int)] } deriving (Eq,Show)

-- Render Q[theta]: objects must be pairwise disjoint and inside the canvas; with
-- BgNone every pixel must be covered. The provenance names "c<i>" (collection
-- i), "c<i>#<k>" (k-th repeat instance) or "residual".
renderScene :: SceneT -> Bindings -> Either String Rendered
renderScene sc b=do
  w<-evalInt b (stW sc); h<-evalInt b (stH sc)
  if w<1 || h<1 || w>30 || h>30 then Left ("canvas "++show (w,h)++" outside 1..30") else Right ()
  let dims=Dimensions w h
  bg<-case stBg sc of BgLit c->Right (Just c); BgHole hh->Just <$> evalInt b (IHole hh); BgNone->Right Nothing
  instances<-fmap concat (sequence [instancesOf i c | (i,c)<-zip [0::Int ..] (stObjects sc)])
  painted<-foldlE paint M.empty instances
  let prov=M.map snd painted
      uncovered=[p | p<-coords dims, not (M.member p painted)]
  rows'<-case bg of
    Just c->Right [[maybe c fst (M.lookup (Coord x y) painted) | x<-[0..w-1]] | y<-[0..h-1]]
    Nothing->if null uncovered then Right [[maybe 0 fst (M.lookup (Coord x y) painted) | x<-[0..w-1]] | y<-[0..h-1]] else Left ("BgNone but "++show (length uncovered)++" pixels are not object pixels (no background may be invented)")
  g<-mkGrid rows'
  let prov'=foldr (\p m->M.insert p "residual" m) prov uncovered
  Right (Rendered g (if bg==Nothing then prov else prov') [(nm,S.size px) | (nm,_,px)<-instances])
  where
    instancesOf i (TRepeat o cnt (sx,sy))=do
      n<-evalInt b cnt
      if n<1 || n>30 then Left ("repeat count "++show n++" outside 1..30") else Right ()
      dx<-evalInt b sx; dy<-evalInt b sy
      sequence [do (c,px)<-objectPixels o (k*dx) (k*dy); Right ("c"++show i++"#"++show k,c,px) | k<-[0..n-1]]
    instancesOf i (TSingle o)=do (c,px)<-objectPixels o 0 0; Right [("c"++show i,c,px)]
    objectPixels o ox oy=do
      sh<-shapeOfTemplate b (otShape o)
      local<-evalShape sh
      c<-evalColour b (otColour o)
      px<-evalInt b (otX o); py<-evalInt b (otY o)
      Right (c,S.map (\(Coord x y)->Coord (x+px+ox) (y+py+oy)) local)
    paint m (nm,c,px)=do
      let clash=[p | p<-S.toList px, M.member p m]
      if not (null clash) then Left ("object "++nm++" overlaps an earlier object on "++show (length clash)++" pixels (templates place disjoint objects)") else Right ()
      Right (foldr (\p acc->M.insert p (c,nm) acc) m (S.toList px))
    foldlE f z xs=case xs of []->Right z; (x:rest)->f z x >>= \z'->foldlE f z' rest

-- ---------------------------------------------------------------- holes / slots / signatures

intExprHoles :: IntExpr -> [HoleId]
intExprHoles (ILit _)=[]
intExprHoles (IHole h)=[h]
intExprHoles (IOff h _)=[h]
shapeInts :: ShapeT -> [IntExpr]
shapeInts (TRect a b c d)=[a,b,c,d]
shapeInts (TUnion l r)=shapeInts l++shapeInts r
shapeInts (TDiff l r)=shapeInts l++shapeInts r
objectInts :: ObjectT -> [IntExpr]
objectInts o=shapeInts (otShape o)++[otX o,otY o]
collectionInts :: CollectionT -> [IntExpr]
collectionInts (TSingle o)=objectInts o
collectionInts (TRepeat o n (dx,dy))=objectInts o++[n,dx,dy]
collectionColours :: CollectionT -> [ColourExpr]
collectionColours (TSingle o)=[otColour o]
collectionColours (TRepeat o _ _)=[otColour o]
-- Informative integer slots of a collection: every slot except the (x0,y0) anchor
-- of the first rectangle of the object's shape, which is 0 by construction of the
-- normalised local frame and therefore never evidence of shared structure.
informativeInts :: CollectionT -> [IntExpr]
informativeInts c=let (o,extra)=case c of TSingle ob->(ob,[]); TRepeat ob n (dx,dy)->(ob,[n,dx,dy]) in stripAnchor (shapeInts (otShape o))++[otX o,otY o]++extra
  where stripAnchor (_:_:rest)=rest
        stripAnchor xs=xs
-- (int holes, colour holes), distinct, in order of first occurrence
holesOf :: SceneT -> ([HoleId],[HoleId])
holesOf sc=(nub (concatMap intExprHoles ([stW sc,stH sc]++concatMap collectionInts (stObjects sc)))
           ,nub ([h | CHole h<-concatMap collectionColours (stObjects sc)]++[h | BgHole h<-[stBg sc]]))
-- number of parameter slots (every int/colour/background position)
templateSlots :: SceneT -> Int
templateSlots sc=2+sum (map (length . collectionInts) (stObjects sc))+length (stObjects sc)+(case stBg sc of BgNone->0; _->1)

-- Operator skeleton of a concrete shape (coordinates erased): the key of anti-unification.
structureSignature :: ShapeExpr -> String
structureSignature (SRect _)="R"
structureSignature (SUnion a b)="U("++structureSignature a++","++structureSignature b++")"
structureSignature (SDiff a b)="D("++structureSignature a++","++structureSignature b++")"

-- Canonical form: alpha-rename holes in order of first occurrence (0,1,2,...);
-- union operands and collections are NOT reordered here (their order was
-- fixed by the matching witness), so two skeletons are equal iff they are
-- the same structure with the same literal/relation pattern.
canonicalScene :: SceneT -> SceneT
canonicalScene sc=
  let (hi,hc)=holesOf sc
      ren=M.fromList (zip (hi++hc) [0..])
      ri e=case e of ILit n->ILit n; IHole h->IHole (ren M.! h); IOff h d->IOff (ren M.! h) d
      rc e=case e of CLit c->CLit c; CHole h->CHole (ren M.! h)
      rs s=case s of TRect a b c d->TRect (ri a) (ri b) (ri c) (ri d); TUnion l r->TUnion (rs l) (rs r); TDiff l r->TDiff (rs l) (rs r)
      ro o=TPlace (rs (otShape o)) (rc (otColour o)) (ri (otX o)) (ri (otY o))
      rcol c=case c of TSingle o->TSingle (ro o); TRepeat o n (dx,dy)->TRepeat (ro o) (ri n) (ri dx,ri dy)
  in TCanvas (ri (stW sc)) (ri (stH sc)) (case stBg sc of BgHole h->BgHole (ren M.! h); x->x) (map rcol (stObjects sc))

-- ---------------------------------------------------------------- cost

data CostBreakdown = CostBreakdown
  { cbAst :: Int, cbHoles :: Int, cbBindings :: Int, cbViews :: Int, cbMatching :: Int, cbTotal :: Int
  , cbIndependent :: Int, cbHoleCount :: Int, cbSlots :: Int, cbLiterals :: Int, cbRelations :: Int } deriving (Eq,Show)

intCost :: IntExpr -> (Int,Int,Int)   -- (ast, literal?, relation?)
intCost (ILit _)=(1,1,0)
intCost (IHole _)=(1,0,0)
intCost (IOff _ _)=(2,0,1)
shapeCostT :: ShapeT -> Int
shapeCostT (TRect a b c d)=1+sum [x | (x,_,_)<-map intCost [a,b,c,d]]
shapeCostT (TUnion l r)=1+shapeCostT l+shapeCostT r
shapeCostT (TDiff l r)=2+shapeCostT l+shapeCostT r
collectionCost :: CollectionT -> Int
collectionCost (TSingle o)=1+shapeCostT (otShape o)+1+sum [x | (x,_,_)<-map intCost [otX o,otY o]]
collectionCost (TRepeat o n (dx,dy))=2+shapeCostT (otShape o)+1+sum [x | (x,_,_)<-map intCost [otX o,otY o,n,dx,dy]]
-- C_AST(Q) + lambda_h * holes (2 per declared hole)
templateCost :: SceneT -> Int
templateCost sc=
  let (hi,hc)=holesOf sc
  in 1+sum [x | (x,_,_)<-map intCost [stW sc,stH sc]]+(case stBg sc of BgNone->0; _->1)+sum (map collectionCost (stObjects sc))+2*(length hi+length hc)

-- Cost of ONE output encoded on its own (every parameter a literal): the
-- per-case reference C_independent.
independentSceneCost :: SceneT -> Int
independentSceneCost sc=templateCost (TCanvas (lit (stW sc)) (lit (stH sc)) bg' (map mapCol (stObjects sc)))
  where
    lit e=case e of ILit n->ILit n; _->ILit 0
    bg'=case stBg sc of BgHole _->BgLit 0; x->x
    mapCol (TSingle o)=TSingle (mapObj o)
    mapCol (TRepeat o n (dx,dy))=TRepeat (mapObj o) (lit n) (lit dx,lit dy)
    mapObj o=TPlace (mapShape (otShape o)) (case otColour o of CHole _->CLit 0; c->c) (lit (otX o)) (lit (otY o))
    mapShape s=case s of TRect a b c d->TRect (lit a) (lit b) (lit c) (lit d); TUnion l r->TUnion (mapShape l) (mapShape r); TDiff l r->TDiff (mapShape l) (mapShape r)

costBreakdown :: Int -> Int -> Int -> [Int] -> SceneT -> CostBreakdown
costBreakdown ncases viewSwitches altAssignments independentPerCase sc=
  let (hi,hc)=holesOf sc
      nh=length hi+length hc
      ast=templateCost sc-2*nh
      ints=[stW sc,stH sc]++concatMap informativeInts (stObjects sc)
      lits=length [() | ILit _<-ints]+length [() | CLit _<-concatMap collectionColours (stObjects sc)]+(case stBg sc of BgLit _->1; _->0)
      rels=length [() | IOff _ _<-ints]
      binds=ncases*nh
      views=2*viewSwitches
      match=max 0 (altAssignments-1)
  in CostBreakdown ast (2*nh) binds views match (ast+2*nh+binds+views+match) (sum independentPerCase) nh (templateSlots sc) lits rels

-- Reference costs of the degenerate "explanations" of the same training set:
-- one hole per output pixel, the whole output as a hole (= independent
-- encoding), a case-id switch over the independent encodings.
degenerateCosts :: [Grid] -> [Int] -> [(String,Int)]
degenerateCosts outputs independentPerCase=
  [("PerPixelHoles",sum [let Dimensions w h=dimensions g in 1+2*w*h+w*h | g<-outputs]+2*length outputs)
  ,("WholeOutputHole",sum independentPerCase+1+2)
  ,("CaseIdSwitch",sum independentPerCase+length outputs+1)]

-- Non-trivial shared structure: strictly cheaper than every degenerate
-- reference and than the independent encodings, at least one literal or
-- relation among the object/shape parameters (not only the canvas), and not
-- every slot a free hole.
nontrivialStructure :: CostBreakdown -> SceneT -> Either String ()
nontrivialStructure cb sc
  | cbTotal cb>=cbIndependent cb = Left ("OnlyTrivialSkeleton: shared cost "++show (cbTotal cb)++" is not below the independent encodings "++show (cbIndependent cb))
  | cbHoleCount cb>=cbSlots cb = Left "OnlyTrivialSkeleton: every parameter slot is a free hole"
  | objLits+objRels==0 = Left "OnlyTrivialSkeleton: no informative literal or relation inside the object/shape templates (the normalised anchor (0,0) and canvas constants do not count)"
  | null (stObjects sc) = Left "OnlyTrivialSkeleton: no object constructor"
  | otherwise = Right ()
  where ints=concatMap informativeInts (stObjects sc)
        objLits=length [() | ILit _<-ints]+length [() | CLit _<-concatMap collectionColours (stObjects sc)]
        objRels=length [() | IOff _ _<-ints]

-- ---------------------------------------------------------------- text / JSON

intExprText :: IntExpr -> String
intExprText (ILit n)=show n
intExprText (IHole h)="?"++show h
intExprText (IOff h d)="?"++show h++(if d>=0 then "+" else "")++show d
colourText :: ColourExpr -> String
colourText (CLit c)="colour "++show c
colourText (CHole h)="colour ?"++show h
shapeTText :: ShapeT -> String
shapeTText (TRect a b c d)="Rect("++intercalate "," (map intExprText [a,b,c,d])++")"
shapeTText (TUnion l r)="("++shapeTText l++" (+) "++shapeTText r++")"
shapeTText (TDiff l r)="("++shapeTText l++" \\ "++shapeTText r++")"
objectTText :: ObjectT -> String
objectTText o="Place("++shapeTText (otShape o)++", "++colourText (otColour o)++", at ("++intExprText (otX o)++","++intExprText (otY o)++"))"
collectionText :: CollectionT -> String
collectionText (TSingle o)=objectTText o
collectionText (TRepeat o n (dx,dy))="Repeat("++objectTText o++", count "++intExprText n++", step ("++intExprText dx++","++intExprText dy++"))"
sceneTText :: SceneT -> String
sceneTText sc="Canvas("++intExprText (stW sc)++"x"++intExprText (stH sc)++", "++(case stBg sc of BgLit c->"background "++show c; BgHole h->"background ?"++show h; BgNone->"no residual")++") { "++intercalate "; " (map collectionText (stObjects sc))++" }"

intExprJSON :: IntExpr -> String
intExprJSON (ILit n)=jobj [("kind",jstr "Lit"),("value",show n)]
intExprJSON (IHole h)=jobj [("kind",jstr "Hole"),("hole",show h)]
intExprJSON (IOff h d)=jobj [("kind",jstr "Offset"),("hole",show h),("offset",show d)]
colourExprJSON :: ColourExpr -> String
colourExprJSON (CLit c)=jobj [("kind",jstr "Lit"),("value",show c)]
colourExprJSON (CHole h)=jobj [("kind",jstr "Hole"),("hole",show h)]
shapeTJSON :: ShapeT -> String
shapeTJSON (TRect a b c d)=jobj [("kind",jstr "Rect"),("x0",intExprJSON a),("y0",intExprJSON b),("x1",intExprJSON c),("y1",intExprJSON d)]
shapeTJSON (TUnion l r)=jobj [("kind",jstr "DisjointUnion"),("left",shapeTJSON l),("right",shapeTJSON r)]
shapeTJSON (TDiff l r)=jobj [("kind",jstr "Difference"),("left",shapeTJSON l),("right",shapeTJSON r)]
objectTJSON :: ObjectT -> String
objectTJSON o=jobj [("kind",jstr "Place"),("shape",shapeTJSON (otShape o)),("colour",colourExprJSON (otColour o)),("x",intExprJSON (otX o)),("y",intExprJSON (otY o)),("text",jstr (objectTText o))]
collectionTJSON :: CollectionT -> String
collectionTJSON (TSingle o)=jobj [("kind",jstr "Single"),("object",objectTJSON o)]
collectionTJSON (TRepeat o n (dx,dy))=jobj [("kind",jstr "Repeat"),("object",objectTJSON o),("count",intExprJSON n),("dx",intExprJSON dx),("dy",intExprJSON dy),("placement",jstr "linear")]
sceneTJSON :: SceneT -> String
sceneTJSON sc=jobj [("kind",jstr "Canvas"),("width",intExprJSON (stW sc)),("height",intExprJSON (stH sc))
  ,("background",case stBg sc of BgLit c->jobj [("kind",jstr "Lit"),("value",show c)]; BgHole h->jobj [("kind",jstr "Hole"),("hole",show h)]; BgNone->jobj [("kind",jstr "None")])
  ,("objects",jarr (map collectionTJSON (stObjects sc))),("text",jstr (sceneTText sc)),("template_version",jstr templateVersion)]
holeInfoJSON :: HoleInfo -> String
holeInfoJSON h=jobj [("hole",show (hiId h)),("type",jstr (show (hiType h))),("role",jstr (hiRole h)),("values",jarr [jobj [("case_index",show c),("value",show v)] | (c,v)<-hiValues h])
  ,("constraints",jarr (map jstr (hiConstraints h))),("occurrences",show (hiOccurrences h)),("origin",jstr (hiOrigin h)),("input_binding_status",jstr (hiInputBinding h))]
  where _=(jbool,jmaybe,sort [0::Int],sortOn id [0::Int],shapeCost)
