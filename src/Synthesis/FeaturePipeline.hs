-- A separate search policy: feature alignment, typed transport, then output
-- construction. The executable program never contains training scenes.
module Synthesis.FeaturePipeline where

import Language.Induced.Base hiding (Construct)
import Latent.Grid
import Latent.Encode
import Latent.Render (render)
import qualified Latent.Object as O
import qualified Data.Map.Strict as M
import qualified Data.Set as S
import Data.List (find, nub)
import Control.Monad (foldM)

data Axis = Horizontal | Vertical deriving (Eq,Ord,Show)
data Selection = Unique (Maybe Int) | Extreme (Maybe Int) Axis Bool
  deriving (Eq,Ord,Show)
data Feature = CanvasWidth | CanvasHeight | Background | Objects
  | ObjectWidth Selection | ObjectHeight Selection | ObjectColor Selection
  | ObjectAnchor Selection Int
  deriving (Eq,Ord,Show)

featureType :: Feature -> Type
featureType f=case f of
  Background->ColorT; Objects->ListT PlacedT; ObjectColor _->ColorT
  ObjectAnchor _ _->CoordT; _->IntT

-- Selection is semantic, never an object ID or an ordinal in a case's list.
-- A tie is undefined rather than being broken by encoding order.
select :: Selection -> O.Scene -> Either String O.Object
select sel scene=case candidates of
  [o]->Right o
  []->Left ("missing referent: "++show sel)
  _->Left ("ambiguous referent: "++show sel)
  where
    (colorFilter,ext)=case sel of
      Unique c->(c,Nothing)
      Extreme c a largest->(c,Just (a,largest))
    pool=filter (\o->maybe True (\c->O.color o==Just c) colorFilter) (O.objects scene)
    candidates=case (ext,pool) of
      (_,[])->[]
      (Nothing,_)->pool
      (Just (axis,largest),_)->
        let key o=case axis of Horizontal->cx (O.position o); Vertical->cy (O.position o)
            best=(if largest then maximum else minimum) (map key pool)
        in filter ((==best) . key) pool

observe :: Feature -> O.Scene -> Either String Value
observe f s=case f of
  CanvasWidth->Right (IntV (gridWidth (O.canvas s)))
  CanvasHeight->Right (IntV (gridHeight (O.canvas s)))
  Background->Right (ColorV (O.background s))
  Objects->Right (ListV PlacedT (map PlacedV (O.objects s)))
  ObjectWidth q->IntV . O.width <$> select q s
  ObjectHeight q->IntV . O.height <$> select q s
  ObjectColor q->do o<-select q s; maybe (Left "nonuniform object color") (Right . ColorV) (O.color o)
  ObjectAnchor q a->do
    if a<0 || a>4 then Left "invalid anchor" else pure ()
    o<-select q s
    Right (CoordV (anchor o a))

requiredFeatures :: [Feature]
requiredFeatures=[CanvasWidth,CanvasHeight,Background,Objects]

selectors :: [Selection]
selectors=[Unique c | c<-colors]++[Extreme c a b | c<-colors,a<-[Horizontal,Vertical],b<-[False,True]]
  where colors=Nothing:map Just [0..9]

baseFeatures :: [Feature]
baseFeatures=requiredFeatures++concat
  [[ObjectWidth q,ObjectHeight q,ObjectColor q]++[ObjectAnchor q a | a<-[0..4]] | q<-selectors]

-- All program literals are scalar constants. Raw coordinates, objects,
-- scenes and case-indexed lookup tables cannot enter this language policy.
-- Partial collection indexing is also excluded, including inside lambdas.
portable :: Expr -> Bool
portable e
  | exprType e `elem` [CoordT,VecT,PoseT,PlacedT,ObjectT,SceneT]
      && S.null (freeVars e)=False
  | otherwise=case exprNode e of
  Lit v->case v of
    IntV _->True; ColorV _->True; BoolV _->True; AnchorV _->True; D4V _->True
    _->False
  Prim n as->n `notElem` ["index","head","tail","get","argminBy","argmaxBy"] && all portable as
  _->all portable (children e)

validTransport :: Type -> Expr -> Bool
validTransport t p=typeCheck M.empty p==Right (ArrowT t t)
  && S.null (freeVars p) && portable p

-- A small finite initial library; callers can supply additional checked Base
-- functions. No task-specific numeric coordinate is mined from one example.
defaultLibrary :: [Expr]
defaultLibrary=ints++colors++objects
  where
    build n t es=either error id (call n t es)
    v=variable "feature" IntT
    ints=[lambda "feature" IntT (build n IntT [v,literal (IntV k)])
         | n<-["add","subtract","multiply"],k<-[-2..2],k/=0]
    colors=[lambda "feature" ColorT (literal (ColorV c)) | c<-[0..9]]
    o=variable "object" PlacedT
    xs=variable "feature" (ListT PlacedT)
    maps=[lambda "object" PlacedT (build n PlacedT [o,literal k])
         | (n,ks)<-[("TransformD4",map D4V [1..7]),("Recolor",map ColorV [0..9])],k<-ks]
    objects=[lambda "feature" (ListT PlacedT) (build "map" (ListT PlacedT) [f,xs]) | f<-maps]

data Config = Config
  { transformBudget :: Int, constructionBudget :: Int, compositionDepth :: Int
  , encoder :: EncoderConfig
  } deriving (Eq,Show)
defaultConfig :: Config
defaultConfig=Config 20000 20000 2 defaultEncoder

data Stage = SameIdentity | SameProgram | CrossIdentity | CrossProgram | ConstructOutput
  deriving (Eq,Ord,Show)
data Scalar = Constant Int | OutputWidth | OutputHeight deriving (Eq,Ord,Show)
data Rectangle = Rectangle
  { rectangleRole :: Selection, rectangleWidth :: Scalar, rectangleHeight :: Scalar
  , rectangleColor :: Int, canvasAnchor :: Int, shapeAnchor :: Int
  } deriving (Eq,Ord,Show)
data Recipe = ScalarConstant Value | Rectangles [Rectangle] deriving (Eq,Ord,Show)
data Rule = Transport Stage Feature (Maybe Expr) | Construct Recipe
  deriving (Eq,Ord,Show)
data Program = Program EncoderConfig (M.Map Feature Rule) deriving (Eq,Show)
data Result = Result
  { program :: Maybe Program, resolved :: M.Map Feature Rule, unresolved :: [Feature]
  , transformWork :: Int, constructionWork :: Int, reusedPrograms :: Int
  , trace :: [String], failure :: String
  } deriving (Eq,Show)

data Search = Search
  { rules :: M.Map Feature Rule, libraryHits :: M.Map Type [Expr]
  , spent :: Int, reused :: Int, events :: [String]
  }

sameValues :: [Value] -> [Value] -> Bool
sameValues xs ys=length xs==length ys && and (zipWith equivalent xs ys)

-- The intermediate representation is a vector of the same named observers
-- on each case. Optional missing/ambiguous references never become features.
representation :: [O.Scene] -> M.Map Feature [Value]
representation ss=M.fromList [(f,vs) | f<-baseFeatures,Right vs<-[traverse (observe f) ss]]

transportCandidates :: Int -> Type -> [Expr] -> [Expr]
transportCandidates depth t library=concat (take (max 0 depth) levels)
  where
    atoms=nub (filter (validTransport t) library)
    levels=atoms:[ [lambda "composed" t body
                  | p<-atoms,q<-prev
                  ,Right x<-[application q (variable "composed" t)]
                  ,Right body<-[application p x]] | prev<-levels]

identityPhase :: Stage -> Bool -> M.Map Feature [Value] -> M.Map Feature [Value] -> Search -> Search
identityPhase stage same inputs outputs st=foldl step st requiredFeatures
  where
    step s target | M.member target (rules s)=s
    step s target=case M.lookup target outputs >>= (\ys->find (\(_,xs)->sameValues xs ys) sources) of
      Nothing->s
      Just (source,_)->s {rules=M.insert target (Transport stage source Nothing) (rules s)
                        ,events=events s++[show stage++": "++show target++" <- "++show source]}
      where sources=[(f,vs) | (f,vs)<-M.toAscList inputs,featureType f==featureType target,(f==target)==same]

programPhase :: Stage -> Bool -> Int -> Config -> [Expr] -> M.Map Feature [Value]
             -> M.Map Feature [Value] -> Search -> Search
programPhase stage same limit conf library inputs outputs initial=foldl step initial requiredFeatures
  where
    step s target | M.member target (rules s)=s
    step s target=case M.lookup target outputs of
      Nothing->s
      Just ys->search s ys candidates
      where
        t=featureType target
        known=M.findWithDefault [] t (libraryHits s)
        fresh=transportCandidates (compositionDepth conf) t library
        sources=[(f,vs) | (f,vs)<-M.toAscList inputs,featureType f==t,(f==target)==same]
        -- Reuse is a candidate priority, not a cached success for another feature.
        candidates=if null sources then [] else [(f,xs,p,True) | p<-known,(f,xs)<-sources]
                ++[(f,xs,p,False) | p<-fresh,p `notElem` known,(f,xs)<-sources]
        search state _ []=state
        search state ys ((source,xs,p,wasKnown):rest)
          | spent state+length xs>limit=state
          | otherwise=
            let next=state {spent=spent state+length xs}
            in case traverse (runFunction p) xs of
              Right vs | sameValues vs ys->next
                { rules=M.insert target (Transport stage source (Just p)) (rules next)
                , libraryHits=M.insertWith (++) t [p] (libraryHits next)
                , reused=reused next+if wasKnown then 1 else 0
                , events=events next++[show stage++": "++show target++" <- "++show source++"; "++exprText p++if wasKnown then "; reused typed program" else ""] }
              _->search next ys rest

scalarValue :: M.Map Feature Value -> Scalar -> Either String Int
scalarValue _ (Constant n)=Right n
scalarValue env s=case M.lookup (if s==OutputWidth then CanvasWidth else CanvasHeight) env of
  Just (IntV n)->Right n
  _->Left ("unresolved output dependency: "++show s)

-- Geometric anchors are recomputed on every case. There is no coordinate
-- literal and no fallback to a first training example.
dimensionAnchor :: Dimensions -> Int -> Either String Coord
dimensionAnchor (Dimensions w h) a
  | w<=0 || h<=0=Left "nonpositive dimensions"
  | otherwise=case a of
      0->Right (Coord 0 0); 1->Right (Coord (w-1) 0)
      2->Right (Coord 0 (h-1)); 3->Right (Coord (w-1) (h-1))
      4->Right (Coord ((w-1) `div` 2) ((h-1) `div` 2))
      _->Left "invalid anchor"

constructRectangle :: M.Map Feature Value -> Rectangle -> Either String O.Object
constructRectangle env r=do
  cw<-scalarValue env OutputWidth; ch<-scalarValue env OutputHeight
  w<-scalarValue env (rectangleWidth r); h<-scalarValue env (rectangleHeight r)
  if cw>30 || ch>30 || w>30 || h>30 || rectangleColor r<0 || rectangleColor r>9
    then Left "construction outside ARC domain" else pure ()
  a<-dimensionAnchor (Dimensions cw ch) (canvasAnchor r)
  b<-dimensionAnchor (Dimensions w h) (shapeAnchor r)
  let p=Coord (cx a-cx b) (cy a-cy b)
  if not (inBounds (Dimensions cw ch) p) || not (inBounds (Dimensions cw ch) (Coord (cx p+w-1) (cy p+h-1)))
    then Left "constructed rectangle outside output canvas" else
    Right (O.Object 0 p (M.fromList [(Coord x y,rectangleColor r) | y<-[0..h-1],x<-[0..w-1]]) 0)

evalRecipe :: M.Map Feature Value -> Recipe -> Either String Value
evalRecipe _ (ScalarConstant v)=case v of
  IntV _->Right v; ColorV _->Right v
  _->Left "non-scalar construction literal rejected"
evalRecipe env (Rectangles rs)=ListV PlacedT . map PlacedV <$> traverse (constructRectangle env) rs

-- Output-wise witness: ALL outputs enter together, without any input scene.
-- Each proposal must explain a common semantic role in every output. The
-- caller subsequently tests executability from the partial output and exact
-- grids; observing an output is never itself an executable recipe.
outputWitness :: Int -> [O.Scene] -> (Maybe Recipe,Int,String)
outputWitness budget outputs
  | null outputs=(Nothing,0,"empty output witness")
  | otherwise=cover [] (map O.objects outputs) 0 selectors
  where
    env s=M.fromList [(CanvasWidth,IntV (gridWidth (O.canvas s))),(CanvasHeight,IntV (gridHeight (O.canvas s)))]
    cost=length outputs
    cover recipes remaining used _ | all null remaining=(Just (Rectangles (reverse recipes)),used,"all-output witness covered every object")
    cover _ _ used []=(Nothing,used,"output role/constructor grammar exhausted")
    cover recipes remaining used (role:rest)
      | used+cost>budget=(Nothing,used,"output witness budget exhausted")
      | otherwise=case traverse (select role) outputs of
          Right os | and (zipWith elem os remaining)->
            let (found,used')=tryRecipes os (used+cost) (proposals role os)
            in case found of
              Nothing->if used'>=budget then (Nothing,used',"output witness budget exhausted") else cover recipes remaining used' rest
              Just r->cover (r:recipes) (zipWith (\o->filter (/=o)) os remaining) used' rest
          _->cover recipes remaining (used+cost) rest
    shared ns=case nub ns of [n]->[Constant n]; _->[]
    proposals role os=
      [Rectangle role w h c a b
      | [c]<-[nub [k | Just k<-map O.color os]]
      ,all ((==Just c) . O.color) os
      ,w<-OutputWidth:OutputHeight:shared (map O.width os)
      ,h<-OutputHeight:OutputWidth:shared (map O.height os)
      ,a<-[0..4],b<-[0..4]]
    tryRecipes _ used []=(Nothing,used)
    tryRecipes os used (r:rs)
      | used+cost>budget=(Nothing,used)
      | otherwise=case traverse (\s->constructRectangle (env s) r) outputs of
          Right built | and (zipWith (\a b->equivalent (PlacedV a) (PlacedV b)) built os)->(Just r,used+cost)
          _->tryRecipes os (used+cost) rs

evalRule :: O.Scene -> M.Map Feature Value -> Rule -> Either String Value
evalRule input _ (Transport _ f p)=do
  v<-observe f input
  maybe (Right v) (\e->if validTransport (featureType f) e then runFunction e v else Left "nonportable transport") p
evalRule _ partial (Construct r)=evalRecipe partial r

-- A fixed acyclic decoding order: dimensions/background precede objects.
-- Only already computed output features are passed to constructors.
runProgram :: Program -> Grid -> Either String Grid
runProgram (Program enc rs) input=do
  let scene=encode enc input
  vs<-foldM (\partial f->do
    rule<-maybe (Left ("unresolved feature: "++show f)) Right (M.lookup f rs)
    v<-evalRule scene partial rule
    if valueType v/=featureType f then Left "feature type mismatch" else Right (M.insert f v partial)) M.empty requiredFeatures
  case map (`M.lookup` vs) requiredFeatures of
    [Just (IntV w),Just (IntV h),Just (ColorV bg),Just (ListV PlacedT os)]->do
      objects'<-traverse (\v->case v of PlacedV o->Right o; _->Left "non-object in output") os
      if w>30 || h>30 then Left "output outside ARC domain" else render (O.Scene (Dimensions w h) bg objects')
    _->Left "invalid intermediate representation"

synthesize :: Config -> [Expr] -> [(Grid,Grid)] -> Result
synthesize conf library pairs
  | null pairs=Result Nothing M.empty requiredFeatures 0 0 0 [] "empty training set"
  | transformBudget conf<0 || constructionBudget conf<0 || compositionDepth conf<0=
      Result Nothing M.empty requiredFeatures 0 0 0 [] "invalid budget"
  | otherwise=
    let inputs=map (encode (encoder conf) . fst) pairs
        outputs=map (encode (encoder conf) . snd) pairs
        im=representation inputs; om=representation outputs
        s0=Search M.empty M.empty 0 0 []
        s1=identityPhase SameIdentity True im om s0
        -- Reserve half of the transform cap for cross-feature search.
        s2=programPhase SameProgram True (transformBudget conf `div` 2) conf library im om s1
        s3=identityPhase CrossIdentity False im om s2
        s4=programPhase CrossProgram False (transformBudget conf) conf library im om s3
        missing=[f | f<-requiredFeatures,M.notMember f (rules s4)]
        (finalRules,cwork,constructionTrace)=constructMissing outputs om (rules s4) 0 missing
        remaining=[f | f<-requiredFeatures,M.notMember f finalRules]
        candidate=Program (encoder conf) finalRules
        exact=null remaining && all (\(x,y)->runProgram candidate x==Right y) pairs
    in Result (if exact then Just candidate else Nothing) finalRules remaining (spent s4) cwork (reused s4)
       (events s4++["Transform phases closed (finite grammar or budget); unresolved="++show missing]++constructionTrace)
       (if exact then "None" else if null remaining then "exact grid verification failed" else "bounded search unresolved")
  where
    constructMissing _ _ rs used []=(rs,used,[])
    constructMissing outputs om rs used (f:fs)=
      let budget=constructionBudget conf-used
          (proposal,cost,reason)=if f==Objects then outputWitness budget outputs else
            case M.lookup f om of
              Just (v:vs) | length outputs<=budget && all (equivalent v) vs->
                (Just (ScalarConstant v),length outputs,"shared scalar across all outputs")
              _->(Nothing,0,"no shared scalar or construction budget exhausted")
          -- Reject witness dependencies that are unavailable from the learned
          -- partial decoder, even if they were available in observed outputs.
          rs'=maybe rs (\r->M.insert f (Construct r) rs) proposal
          (end,total,notes)=constructMissing outputs om rs' (used+cost) fs
      in (end,total,("ConstructOutput "++show f++": "++reason):notes)
