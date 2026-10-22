-- LATIS v0.4. A bounded, evidence-directed front-end; R2 is not modified.
module Synthesis.Triggered where

import Language.Induced.Base (Type(..),Value(..),valueKey,d4)
import Latent.Grid
import Latent.Encode
import Latent.Render
import qualified Latent.Object as O
import qualified Synthesis.FeaturePipeline as F
import qualified Synthesis.InducedR2.Learn as R2
import qualified Data.Map.Strict as M
import qualified Data.Set as S
import Data.List (nub,sortOn)
import Control.Exception (evaluate)
import GHC.Clock (getMonotonicTimeNSec)

data Mode = Full | NoMatchedFeaturePruning | NoVisibility | NoIntensionalLifting
  | NoTransformReuse | NoSceneContext | NoRelationInvention | FlatRelations
  | DirectBaseExpansion | R2FallbackOnly deriving (Eq,Ord,Show,Read,Enum,Bounded)
data Config = Config { sourceBudget :: Int, constructBudget :: Int, selectionBudget :: Int
  , maxDepth :: Int, noiseOperators :: Int, r2Config :: R2.InducedConfig } deriving (Eq,Show)
defaultConfig :: Config
defaultConfig=Config 12000 12000 100000 4 0 R2.defaultInduced
data Slot = Object | Position deriving (Eq,Ord,Show)
type Role = F.Selection
type Target = (Role,Slot)
slotType :: Slot -> Type
slotType Object=ObjectT
slotType Position=CoordT
data Status = Unmatched | Matched | Frozen deriving (Eq,Ord,Show)
data Trigger = NeedExplain Type | NeedTransform Type | NeedRef Type | NeedConcept Type
  | NeedConstruct Type | NeedRelation | RefinementTrigger String | FailureTrigger String
  deriving (Eq,Ord,Show)
data Slice = Geometry | Palette | Displacement | AnchorRelation | ConceptSlice
  deriving (Eq,Ord,Show)
data Evidence = Evidence { trigger :: Trigger, parentGoal :: Target, typeReason :: String
  , ontologySlice :: String, provenance :: String } deriving (Eq,Ord,Show)
data Ref = GridAnchor Int | Selected Role Slot | SelectedAnchor Role Int
  deriving (Eq,Ord,Show)
data Term = Input Role Slot | Invoke String [Term] | Reference Ref
  | Output Target | RectanglePart F.Rectangle Slot | Parameter Int Type
  deriving (Eq,Ord,Show)
data Action = Turn Int | Paint Int | Step Int Int | AnchorOffset Int | Noise
  | RelationBody Term deriving (Eq,Ord,Show)
data Operator = Operator { opName :: String, argTypes :: [Type], resultType :: Type
  , opSlice :: Slice, action :: Action, definitionCost :: Int, opLevel :: Int
  , refinementEdges :: [String] } deriving (Eq,Ord,Show)
data Feature = Feature { featureId :: Int, featureType :: Type, denotation :: [Value]
  , expression :: Term, semanticRole :: Role, history :: [String], featureCost :: Int
  , status :: Status, featureDepth :: Int } deriving (Eq,Show)
data Edge = Edge { parents :: [Int], child :: Int, edgeProgram :: String
  , edgeEvidence :: Evidence, argumentEvidence :: [Evidence] } deriving (Eq,Show)
data Match = Match { target :: Target, source :: Int, sameRole :: Bool } deriving (Eq,Show)
data Relation = Relation { relationName :: String, template :: Term, parameterTypes :: [Type]
  , witnesses :: [Int], compressionGain :: Int, searchReduction :: Int
  , decouplingGain :: Int, coverage :: Int, relationLevel :: Int
  , dependencies :: [String] } deriving (Eq,Show)
data Graph = Graph { features :: M.Map Int Feature, edges :: [Edge], matches :: [Match]
  , semanticStates :: M.Map (Type,[String]) [Int], definitions :: M.Map String Operator
  , goals :: M.Map Target [Value], counters :: M.Map String Int, logEvents :: [String]
  , usedDefinitions :: S.Set String, relations :: [Relation], expressionIndex :: M.Map Term Int } deriving (Eq,Show)
data Layout = Layout F.Scalar F.Scalar Int deriving (Eq,Ord,Show)
data Program = Program EncoderConfig Layout (M.Map Target Term) (M.Map String Operator) deriving (Eq,Show)
data FrontResult = FrontResult { frontProgram :: Maybe Program, graph :: Graph
  , frontFailure :: String, optimalWithinGraph :: Bool } deriving (Eq,Show)
-- closureSeconds times only the source-closure phase (the part that
-- Synthesis.Triggered.Parallel can run with several workers).
data Result = Result { front :: FrontResult, fallback :: Maybe R2.InducedResult
  , elapsedSeconds :: Double, fallbackReason :: String, closureSeconds :: Double }

metricNames :: [String]
metricNames=words "initial_features frozen_features active_frontier_size visibility_size visible_opportunities type_compatible_opportunities operator_applications evaluation_failures deduplicated_features transform_cache_hits unique_transforms construction_triggers intensional_lift_attempts intensional_lift_successes relation_candidates accepted_relations fallback_count search_work construction_work selection_work UntriggeredExpansionCount ConcreteParameterExposureCount expanded_frozen_features"
inc :: String -> Int -> Graph -> Graph
inc k n g=g {counters=M.insertWith (+) k n (counters g)}
metric :: String -> Graph -> Int
metric k=M.findWithDefault 0 k . counters
note :: String -> Graph -> Graph
note s g=g {logEvents=logEvents g++[s]}

operators :: Int -> [Operator]
operators noise=
  [Operator ("D4_"++show k) [ObjectT] ObjectT Geometry (Turn k) 3 0 [] | k<-[1..7]]++
  [Operator ("Recolor_"++show c) [ObjectT] ObjectT Palette (Paint c) 3 0 [] | c<-[0..9]]++
  [Operator ("UnitStep_"++show (x,y)) [CoordT] CoordT Displacement (Step x y) 4 0 [] | (x,y)<-[(1,0),(-1,0),(0,1),(0,-1)]]++
  [Operator ("AnchorOffset_"++show a) [CoordT,ObjectT] CoordT AnchorRelation (AnchorOffset a) 3 0 [] | a<-[1..4]]++
  [Operator ("Irrelevant_"++show k) [CoordT] CoordT ConceptSlice Noise 2 0 [] | k<-[1..noise]]

-- Type graph is constructed once. Reachability is always restricted to the
-- visible slice, including task-local definitions, never the whole library.
typeGraph :: [Operator] -> M.Map Type (S.Set Type)
typeGraph ops=M.fromListWith S.union [(a,S.singleton (resultType p)) | p<-ops,a<-argTypes p]
canReach :: M.Map Type (S.Set Type) -> Type -> Type -> Bool
canReach tg start goal=walk S.empty [start]
  where walk _ []=False
        walk seen (t:ts) | t==goal=True
                        | S.member t seen=walk seen ts
                        | otherwise=walk (S.insert t seen) (S.toList (M.findWithDefault S.empty t tg)++ts)

intrinsic :: O.Object -> O.Object
intrinsic o=o {O.objectId=0,O.position=Coord 0 0,O.orientation=0}
slotValue :: Slot -> O.Object -> Value
slotValue Object=ObjectV . intrinsic
slotValue Position=CoordV . O.position

-- One uniform semantic role must denote exactly one object in every case.
-- IDs may appear in diagnostic scenes, never in an executable expression.
roleCover :: [O.Scene] -> Either String [(Role,[O.Object])]
roleCover scenes=go [] (map O.objects scenes) F.selectors
  where go acc remaining _ | all null remaining=Right (reverse acc)
        go _ _ []=Left "semantic role coverage: missing, tied, or varying object cardinality"
        go acc remaining (r:rs)=case traverse (F.select r) scenes of
          Right os | and (zipWith elem os remaining)->go ((r,os):acc) (zipWith (\o->filter (/=o)) os remaining) rs
          _->go acc remaining rs

insertFeature :: Feature -> Graph -> (Int,Graph)
insertFeature f g=case M.lookup (expression f) (expressionIndex g) of
  Just i->(i,g)
  Nothing->
    let i=M.size (features g); f'=f {featureId=i}
        key=(featureType f,map valueKey (denotation f))
        dup=M.member key (semanticStates g)
    in (i,inc "deduplicated_features" (if dup then 1 else 0) g
        {features=M.insert i f' (features g),semanticStates=M.insertWith (++) key [i] (semanticStates g)
        ,expressionIndex=M.insert (expression f) i (expressionIndex g)})

initial :: [O.Scene] -> [O.Scene] -> [Operator] -> Either String Graph
initial inputs outputs ops=do
  ir<-roleCover inputs; outr<-roleCover outputs
  let targets=M.fromList [((r,s),map (slotValue s) os) | (r,os)<-outr,s<-[Object,Position]]
      empty=Graph M.empty [] [] M.empty (M.fromList [(opName p,p) | p<-ops]) targets
        (M.fromList [(k,0) | k<-metricNames]) [] S.empty [] M.empty
      fs=[Feature 0 (slotType s) (map (slotValue s) os) (Input r s) r
            ["E0.Object",show r,show s,"diagnostic grounding IDs="++show (map O.objectId os)] 0 Unmatched 0 | (r,os)<-ir,s<-[Object,Position]]
      g=foldl' (\st f->snd (insertFeature f st)) empty fs
  pure (inc "initial_features" (length fs+M.size targets) (rematch g))

unmatched :: Graph -> [Target]
unmatched g=[t | t<-M.keys (goals g),all ((/=t) . target) (matches g)]
rematch :: Graph -> Graph
rematch g=g {matches=allMatches,features=foldl' (\fs i->M.adjust (\f->f {status=Frozen}) i fs) (features g) newlyFrozen}
  where
    allMatches=sortOn (\m->(not (sameRole m),target m,source m))
      [Match t (featureId f) (fst t==semanticRole f)
      | (t,ys)<-M.toAscList (goals g)
      ,i<-M.findWithDefault [] (slotType (snd t),map valueKey ys) (semanticStates g)
      ,Just f<-[M.lookup i (features g)]]
    frozen=S.fromList (map source allMatches)
    newlyFrozen=S.toList (frozen `S.difference` S.fromList (map source (matches g)))

referenceValue :: O.Scene -> Layout -> Ref -> Either String Value
referenceValue scene layout ref=case ref of
  GridAnchor a->do d<-layoutDimensions scene layout; CoordV <$> F.dimensionAnchor d a
  Selected r s->slotValue s <$> F.select r scene
  SelectedAnchor r a->do
    o<-F.select r scene
    p<-F.dimensionAnchor (Dimensions (O.width o) (O.height o)) a
    Right (CoordV (add (O.position o) (Vec (cx p) (cy p))))
layoutDimensions :: O.Scene -> Layout -> Either String Dimensions
layoutDimensions s (Layout w h _)=Dimensions <$> scalar w <*> scalar h
  where scalar=F.scalarValue (M.fromList [(F.CanvasWidth,IntV (gridWidth (O.canvas s))),(F.CanvasHeight,IntV (gridHeight (O.canvas s)))])

evalTerm :: M.Map String Operator -> O.Scene -> Layout -> M.Map Target Term -> Term -> Either String Value
evalTerm defs scene layout assignment=go S.empty []
  where
    go seen params t=case t of
      Input r s->slotValue s <$> F.select r scene
      Reference r->referenceValue scene layout r
      Parameter i ty->case drop i params of v:_ | valueType' v==ty->Right v; _->Left "relation parameter type"
      Output key | S.member key seen->Left "cyclic output dependency"
                 | otherwise->maybe (Left "unresolved output dependency") (go (S.insert key seen) params) (M.lookup key assignment)
      RectanglePart r slot->do
        Dimensions w h<-layoutDimensions scene layout
        o<-F.constructRectangle (M.fromList [(F.CanvasWidth,IntV w),(F.CanvasHeight,IntV h)]) r
        pure (slotValue slot o)
      Invoke name ts->do
        p<-maybe (Left ("unknown definition "++name)) Right (M.lookup name defs)
        vs<-traverse (go seen params) ts
        if map valueType' vs/=argTypes p then Left "operator argument types" else case (action p,vs) of
          (Turn k,[ObjectV o])->Right (ObjectV (intrinsic (d4 o k)))
          (Paint c,[ObjectV o])->Right (ObjectV (O.recolor o c))
          (Step x y,[CoordV a])->Right (CoordV (add a (Vec x y)))
          (AnchorOffset a,[CoordV pos,ObjectV o])->do
            b<-F.dimensionAnchor (Dimensions (O.width o) (O.height o)) a
            Right (CoordV (add pos (Vec (cx b) (cy b))))
          (Noise,[v])->Right v
          (RelationBody body,_)->go seen vs body
          _->Left "invalid operator implementation"

valueType' :: Value -> Type
valueType' (ObjectV _)=ObjectT
valueType' (CoordV _)=CoordT
valueType' _=SceneT

-- Index by demand slice and input type. Adding an invisible library does not
-- add per-feature candidate visits in Full.
operatorIndex :: [Operator] -> M.Map (Slice,Type) [Operator]
operatorIndex ops=M.fromListWith (++) [((opSlice p,t),[p]) | p<-ops,t<-take 1 (argTypes p)]
visible :: Mode -> M.Map (Slice,Type) [Operator] -> Graph -> Feature -> [(Target,[Operator])]
visible mode index g f=[(t,filter (\p->canReach (typeGraph candidates) (resultType p) (slotType (snd t))) candidates)
  | t<-unmatched g,let candidates=concat [M.findWithDefault [] (s,featureType f) index | s<-slices t]]
  where
    slices t | mode `elem` [NoVisibility,DirectBaseExpansion]=[Geometry,Palette,Displacement,AnchorRelation,ConceptSlice]
             | featureType f==ObjectT && snd t==Object=[Geometry,Palette]
             | featureType f==CoordT && snd t==Position=[Displacement,AnchorRelation]
             | otherwise=[]

sourceClosure :: Mode -> Config -> [O.Scene] -> Layout -> Graph -> Graph
sourceClosure mode conf inputs layout start=loop 1 start
  where
    index=operatorIndex (M.elems (definitions start))
    typeCounts=M.fromListWith (+) [(t,1::Int) | p<-M.elems (definitions start),t<-take 1 (argTypes p)]
    loop depth g
      | depth>maxDepth conf || null (unmatched g) || metric "search_work" g>=sourceBudget conf=g
      | otherwise=
        let frontier=[featureId f | f<-M.elems (features g),featureDepth f==depth-1
                     ,mode `elem` [NoMatchedFeaturePruning,DirectBaseExpansion] || status f==Unmatched]
            g0=inc ("frontier_depth_"++show depth) (length frontier) g
            g1=foldl' (expand depth) g0 frontier
            g2=inc ("matched_features_by_depth_"++show depth) (length (matches g1)-length (matches g)) g1
        in if M.size (features g2)==M.size (features g) then g2 else loop (depth+1) g2
    expand depth g fid=case M.lookup fid (features g) of
      Nothing->g
      Just f | status f==Frozen && mode `notElem` [NoMatchedFeaturePruning,DirectBaseExpansion]->g
      Just f->
        let visibleGroups=visible mode index g f
            -- A single visible operator may explain several goals; do not
            -- re-enumerate its argument joins for every target.
            jobs=M.elems (M.fromListWith (\a _->a) [(opName p,(t,p)) | (t,ps)<-visibleGroups,p<-ps])
            typed=M.findWithDefault 0 (featureType f) typeCounts
            g0=inc "visible_opportunities" (length jobs) . inc "type_compatible_opportunities" typed
               . inc "visibility_size" (length jobs) $ g
        in foldl' (apply depth f) g0 jobs
    apply depth f g (goal,p)
      | metric "search_work" g+applicationCost>sourceBudget conf=g
      | status (features g M.! featureId f)==Frozen && mode `notElem` [NoMatchedFeaturePruning,DirectBaseExpansion]=g
      | otherwise=
        let extra=case drop 1 (argTypes p) of
              []->Just []
              [ObjectT]->case [q | q<-M.elems (features g),featureDepth q==0,semanticRole q==semanticRole f,featureType q==ObjectT] of
                q:_->Just [q]; _->Nothing
              _->Nothing
        in case extra of
          Nothing->g
          Just readonly->
            let args=f:readonly
                term=Invoke (opName p) (map expression args)
                reason=if mode `elem` [NoVisibility,DirectBaseExpansion] then FailureTrigger "ablation: explicitly widen visible type slice"
                       else if null readonly then NeedTransform (resultType p) else NeedRelation
                proof=Evidence reason goal (show (argTypes p)++" -> "++show (resultType p)) (show (opSlice p)) (show (map featureId args))
                argProofs=[Evidence (if i==0 then NeedExplain (featureType q) else NeedRef (featureType q)) goal
                            (show (featureType q)) (show (opSlice p)) ("read-only dependency "++show (featureId q)) | (i,q)<-zip [0::Int ..] args]
                          ++[Evidence (NeedRef ty) goal (show ty) (show (opSlice p)) ("Constant "++value)
                            | (ty,value)<-case action p of
                                Turn k->[(IntT,show k)]; Paint c->[(ColorT,show c)]
                                Step x y->[(IntT,show x),(IntT,show y)]; AnchorOffset a->[(IntT,show a)]; _->[]]
                used=S.member (opName p) (usedDefinitions g)
                g0=inc "operator_applications" 1 . inc "search_work" applicationCost
                  . inc "definition_build_work" buildCost
                  . inc "expanded_frozen_features" (if status f==Frozen then 1 else 0)
                  . inc (if used && mode/=NoTransformReuse then "transform_cache_hits" else "unique_transforms") 1 $
                    g {usedDefinitions=S.insert (opName p) (usedDefinitions g)}
            in case traverse (\s->evalTerm (definitions g) s layout M.empty term) inputs of
              Left _->inc "evaluation_failures" 1 g0
              Right vs->let fresh=Feature 0 (resultType p) vs term (semanticRole f)
                                  (concatMap history args++[opName p]) (sum (map featureCost args)+1) Unmatched depth
                            (i,g1)=insertFeature fresh g0
                            edge=Edge (map featureId args) i (opName p) proof argProofs
                        in inc ("generated_features_by_depth_"++show depth) (M.size (features g1)-M.size (features g))
                             (rematch g1 {edges=edges g1++[edge]})
      where
        buildCost=if mode/=NoTransformReuse && S.member (opName p) (usedDefinitions g) then 0 else definitionCost p
        applicationCost=length inputs+buildCost

-- Context is not in F0 or in the saturation index. This is the only path
-- that exposes it to a learner, after source closure has stopped.
construct :: Mode -> Config -> [O.Scene] -> [O.Scene] -> Layout -> Graph -> Graph
construct mode conf inputs outputs layout g0=foldl' targetStep g0 (unmatched g0)
  where
    targetStep g t
      | mode==NoSceneContext=note ("NeedConstruct blocked by NoSceneContext: "++show t) g
      | otherwise=
        let g1=note ("NeedConstruct "++show (slotType (snd t))++"; source closure closed; target="++show t)
                    (inc "construction_triggers" 1 g)
            refs=if mode==NoIntensionalLifting then [] else
              case snd t of
                Object->[Reference (Selected r Object) | r<-F.selectors]
                Position->[Reference (GridAnchor a) | a<-[0..4]]++
                  [Reference (SelectedAnchor r a) | r<-F.selectors,a<-[0..4]]++
                  [Output other | other<-M.keys (goals g),other/=t,snd other==Position,other `notElem` unmatched g]
            g2=foldl' (tryTerm t "LearnRef") g1 refs
        in if t `notElem` unmatched g2 || mode==NoIntensionalLifting then g2 else
          case traverse (F.select (fst t)) outputs of
            Left _->g2
            Right os->
              let scenes=zipWith (\s o->s {O.objects=[o]}) outputs os
                  cap=max 0 (constructBudget conf-metric "construction_work" g2)
                  (recipe,work,why)=F.outputWitness cap scenes
                  g3=inc "construction_work" work (note ("OutputWiseWitness "++show t++": "++why) g2)
              in case recipe of
                Just (F.Rectangles [r])->tryTerm t "LearnConcept" g3 (RectanglePart r (snd t))
                _->g3
    tryTerm t kind g term
      | metric "construction_work" g+length inputs>constructBudget conf=g
      | otherwise=
        let -- Read-only output dependencies use a previously supported
            -- candidate; final selection rechecks the actual assignment.
            as=M.fromList [(target m,expression (features g M.! source m)) | m<-reverse (matches g)]
            vals=traverse (\s->evalTerm (definitions g) s layout as term) inputs
            g1=inc "construction_work" (length inputs) (inc "intensional_lift_attempts" 1 g)
        in case vals of
          Right vs | F.sameValues vs (goals g M.! t)->
            let f=Feature 0 (slotType (snd t)) vs term (fst t) [kind,show term] 1 Unmatched (maxDepth conf+1)
                (i,g2)=insertFeature f g1
                ev=Evidence (if kind=="LearnRef" then NeedRef (featureType f) else NeedConcept (featureType f)) t
                      ("SceneContext -> "++show (featureType f)) "construction/intensional" ("all "++show (length outputs)++" output cases")
                deps=case term of Output other->[source m | m<-take 1 [m | m<-matches g,target m==other]]; _->[]
            in inc "intensional_lift_successes" 1 (rematch g2 {edges=edges g2++[Edge deps i kind ev [ev]]})
          _->g1

layoutFor :: [O.Scene] -> [O.Scene] -> Either String Layout
layoutFor inputs outputs=do
  w<-choose (map (gridWidth . O.canvas) outputs)
  h<-choose (map (gridHeight . O.canvas) outputs)
  bg<-case nub (map O.background outputs) of [c]->Right c; _->Left "varying output background"
  Right (Layout w h bg)
  where choose ys | ys==map (gridWidth . O.canvas) inputs=Right F.OutputWidth
                  | ys==map (gridHeight . O.canvas) inputs=Right F.OutputHeight
                  | [n]<-nub ys=Right (F.Constant n)
                  | otherwise=Left "output layout not expressible"

runProgram :: Program -> Grid -> Either String Grid
runProgram (Program enc layout@(Layout _ _ bg) assignments defs) input=do
  let s=encode enc input
  dims<-layoutDimensions s layout
  if gridWidth dims>30 || gridHeight dims>30 then Left "output dimensions outside ARC" else pure ()
  os<-traverse (build s) (nub (map fst (M.keys assignments)))
  render (O.Scene dims bg os)
  where
    build s role=do
      o<-maybe (Left "missing Object target") (evalTerm defs s layout assignments) (M.lookup (role,Object) assignments)
      p<-maybe (Left "missing Position target") (evalTerm defs s layout assignments) (M.lookup (role,Position) assignments)
      case (o,p) of (ObjectV obj,CoordV pos)->Right (obj {O.position=pos}); _->Left "decoder type mismatch"

termCalls :: Term -> [String]
termCalls (Invoke n as)=n:concatMap termCalls as
termCalls _=[]
termRefs :: Term -> [Term]
termRefs t=case t of Invoke _ as->concatMap termRefs as; Input _ _->[t]; Reference _->[t]; Output _->[t]; RectanglePart _ _->[t]; Parameter _ _->[]
explanationCost :: Mode -> Graph -> M.Map Target Term -> Int
explanationCost mode g as=sum [maybe 1 definitionCost (M.lookup n (definitions g)) | n<-charged]
  +length calls+length refs+sum [5 | RectanglePart _ _<-refs]
  where calls=concatMap termCalls (M.elems as)
        charged=if mode==NoTransformReuse then calls else nub calls
        refs=concatMap termRefs (M.elems as)

-- Exhaustive branch-and-bound over the finite derivation graph. A truncated
-- selection is a failure, never falsely reported as a certified optimum.
selectExplanation :: Mode -> Config -> [(Grid,Grid)] -> EncoderConfig -> Layout -> Graph
                  -> (Maybe Program,Bool,Int)
selectExplanation mode conf pairs enc layout g=
  let choices=[(t,nub [expression (features g M.! source m) | m<-matches g,target m==t]) | t<-M.keys (goals g)]
      (best,used,complete)=visit choices M.empty Nothing 0
  in (fmap (\(_,as)->Program enc layout as (definitions g)) best,complete,used)
  where
    visit _ _ best used | used>=selectionBudget conf=(best,used,False)
    visit remaining as best used
      | maybe False (\(cost,_)->explanationCost mode g as>cost) best=(best,used+1,True)
      | otherwise=case remaining of
          []->let p=Program enc layout as (definitions g); cost=explanationCost mode g as
                  valid=all (\(x,y)->runProgram p x==Right y) pairs
              in (if valid && maybe True (\(c,_)->cost<c) best then Just (cost,as) else best,used+1,True)
          (t,terms):rest->foldl' (\(b,n,complete) term->if not complete then (b,n,False) else
               let (b',n',ok)=visit rest (M.insert t term as) b n in (b',n',ok)) (best,used+1,True) terms

-- Typed structural anti-unification. Every root/ref is lifted to a parameter;
-- the same dependency used twice remains the same parameter. No raw runtime
-- value (and especially no provenance ID/coordinate) can enter the template.
abstractTerm :: M.Map String Operator -> Term -> (Term,[Term],[Type])
abstractTerm defs term=let (body,bindings)=go [] term in (body,bindings,map ty bindings)
  where
    ty t=case t of
      Input _ s->slotType s
      Output (_,s)->slotType s
      Reference (Selected _ s)->slotType s
      Reference _->CoordT
      RectanglePart _ s->slotType s
      Parameter _ t'->t'
      Invoke n _->maybe SceneT resultType (M.lookup n defs)
    go bs (Invoke n args)=let (as,bs')=foldl' (\(acc,b) a->let (a',b')=go b a in (acc++[a'],b')) ([],bs) args in (Invoke n as,bs')
    go bs t=let bs'=if t `elem` bs then bs else bs++[t]
                i=length (takeWhile (/=t) bs')
            in (Parameter i (ty t),bs')
subterms :: Term -> [Term]
subterms t@(Invoke _ as)=t:concatMap subterms as
subterms _=[]

invent :: Mode -> Graph -> Program -> (Graph,Program)
invent mode g p@(Program enc layout assignment defs)
  | mode `elem` [NoRelationInvention,DirectBaseExpansion]=(g,p)
  | otherwise=
    let supported=[(featureId f,t) | m<-matches g,let f=features g M.! source m,t<-subterms (expression f)]
        groups=M.fromListWith (++) [(body,[(i,t,args,tys)]) | (i,t)<-supported,let (body,args,tys)=abstractTerm defs t]
        candidates=[(body,nubByTerm xs) | (body,xs)<-M.toList groups,length (nub (map (\(_,t,_,_)->t) xs))>=2]
        rawRelations=[Relation ("I_"++show i) body tys (nub [n | (n,_,_,_)<-xs]) gain reduction decoupling (length xs) 1 deps
          | (i,(body,xs))<-zip [1::Int ..] (sortOn (length . termCalls . fst) candidates)
          ,(_,_,_,tys):_<-[xs]
          ,let deps=nub (termCalls body)
          ,let gain=(length xs-1)*max 0 (length (termCalls body)-1)
          ,let reduction=(length xs-1)*length (termCalls body)
          ,let decoupling=length tys
          ,gain+reduction+decoupling>0]
        addRelation (previous,ds) r=
          let lower t=case [(old,args) | old<-reverse previous,let (patternBody,args,_)=abstractTerm ds t,patternBody==template old] of
                (old,args):_->Invoke (relationName old) args
                []->case t of Invoke n as->Invoke n (map lower as); _->t
              body=if mode==FlatRelations then template r else lower (template r)
              deps=nub (termCalls body)
              level=if mode==FlatRelations then 0 else 1+maximum (0:[opLevel dependency | n<-deps,Just dependency<-[M.lookup n ds]])
              r'=r {dependencies=deps,relationLevel=level}
              op=Operator (relationName r) (parameterTypes r) (termType (template r)) ConceptSlice (RelationBody body)
                   (1+length (termCalls body)) level deps
          in if validTemplate ds (parameterTypes r) body then (previous++[r'],M.insert (opName op) op ds) else (previous,ds)
        (accepted,defs')=foldl' addRelation ([],defs) rawRelations
        -- Accepted TSL definitions are actually called by the executable,
        -- with their lifted arguments; refinement follows only stored edges.
        rewrite t=case [ (r,args) | r<-reverse accepted,let (body,args,_)=abstractTerm defs t,body==template r] of
          (r,args):_->Invoke (relationName r) args
          []->case t of Invoke n as->Invoke n (map rewrite as); _->t
        p'=Program enc layout (M.map rewrite assignment) defs'
        g'=inc "relation_candidates" (length candidates) . inc "accepted_relations" (length accepted) $
             g {relations=accepted,definitions=defs'}
    in (g',p')
  where
    nubByTerm xs=M.elems (M.fromList [(t,x) | x@(_,t,_,_)<-xs])
    termType (Invoke n _)=maybe SceneT resultType (M.lookup n defs)
    termType (Parameter _ t)=t
    termType _=SceneT

validTemplate :: M.Map String Operator -> [Type] -> Term -> Bool
validTemplate defs params term=case check term of Just _->True; _->False
  where
    check (Parameter i t) | i>=0 && take 1 (drop i params)==[t]=Just t
    check (Invoke n args)=do
      p<-M.lookup n defs
      ts<-traverse check args
      if ts==argTypes p then Just (resultType p) else Nothing
    check _=Nothing -- no captured object/coordinate/role; lift it first

refine :: Graph -> Trigger -> String -> Either String [String]
refine g reason name=case M.lookup name (definitions g) of
  Nothing->Left "unknown relation"
  Just op->case reason of
    RefinementTrigger n | n==name->Right (refinementEdges op)
    FailureTrigger _->Right (refinementEdges op) -- widening is requested separately through visible slices
    _->Left "refinement requires a matching refinement/failure trigger"

audit :: Graph -> Graph
audit g=g {counters=M.insert "UntriggeredExpansionCount" untriggered
                 (M.insert "ConcreteParameterExposureCount" exposed (counters g))}
  where
    untriggered=length [() | e<-edges g
      ,null (typeReason (edgeEvidence e)) || null (ontologySlice (edgeEvidence e))
       || null (provenance (edgeEvidence e)) || M.notMember (parentGoal (edgeEvidence e)) (goals g)
       || null (argumentEvidence e) || any (null . provenance) (argumentEvidence e)]
    exposed=length [() | r<-relations g,not (validTemplate (definitions g) (parameterTypes r) (template r))]

controlledWidening :: Int -> Graph -> Trigger -> Type -> Either String [String]
controlledWidening cap g reason ty=case reason of
  FailureTrigger _->Right (take (max 0 cap) [opName p | p<-M.elems (definitions g),take 1 (argTypes p)==[ty]])
  _->Left "only FailureTrigger can widen the registered ontology slice"

-- The front-end is split into three pure stages so that the source closure
-- (the only stage Synthesis.Triggered.Parallel may run with worker threads)
-- can be swapped while grounding, construction and selection stay identical.
data Prepared = Prepared { preparedInputs :: [O.Scene], preparedOutputs :: [O.Scene], preparedGraph :: Graph }
closureLayout :: Layout
closureLayout=Layout F.OutputWidth F.OutputHeight 0
emptyGraph :: Graph
emptyGraph=Graph M.empty [] [] M.empty M.empty M.empty (M.fromList [(k,0) | k<-metricNames]) [] S.empty [] M.empty

frontPrepare :: Mode -> Config -> [(Grid,Grid)] -> Either FrontResult Prepared
frontPrepare mode conf pairs
  | null pairs=Left (FrontResult Nothing emptyGraph "empty training specification" False)
  | mode==R2FallbackOnly=Left (FrontResult Nothing emptyGraph "R2FallbackOnly" False)
  | any (<0) [sourceBudget conf,constructBudget conf,selectionBudget conf,maxDepth conf,noiseOperators conf]=Left (FrontResult Nothing emptyGraph "invalid configuration" False)
  | otherwise=case initial inputs outputs (operators (noiseOperators conf)) of
      Left err->Left (FrontResult Nothing emptyGraph ("grounding: "++err) False)
      Right g0->Right (Prepared inputs outputs g0)
  where
    enc=R2.inducedEncoder (r2Config conf)
    inputs=map (encode enc . fst) pairs; outputs=map (encode enc . snd) pairs

frontSearch :: Mode -> Config -> [(Grid,Grid)] -> FrontResult
frontSearch mode conf pairs=case frontPrepare mode conf pairs of
  Left r->r
  Right p->frontFinish mode conf pairs p (sourceClosure mode conf (preparedInputs p) closureLayout (preparedGraph p))

frontFinish :: Mode -> Config -> [(Grid,Grid)] -> Prepared -> Graph -> FrontResult
frontFinish mode conf pairs (Prepared inputs outputs _) sourceGraph=
        let copyLayout=and [O.canvas a==O.canvas b && O.background a==O.background b | (a,b)<-zip inputs outputs]
            contextGraph=if copyLayout then sourceGraph else inc "construction_triggers" 1
              (note "NeedConstruct SceneT: source closure closed; infer decoder layout from all contexts" sourceGraph)
            layoutResult=if mode==NoSceneContext && not copyLayout then Left "NoSceneContext blocks layout construction" else layoutFor inputs outputs
        in case layoutResult of
        Left err->FrontResult Nothing contextGraph ("layout: "++err) False
        Right layout->
          let g2=construct mode conf inputs outputs layout contextGraph
              (selected,complete,work)=if null (unmatched g2) then selectExplanation mode conf pairs enc layout g2 else (Nothing,True,0)
              g3=inc "selection_work" work g2
              (g4,selected')=case selected of Just p | complete->let (gg,pp)=invent mode g3 p in (gg,Just pp); _->(g3,Nothing)
              exact=maybe False (\p->all (\(x,y)->runProgram p x==Right y) pairs) selected'
              final=audit . inc "source_search_work" (metric "search_work" g4)
                . inc "search_work" (metric "construction_work" g4+metric "selection_work" g4)
                . inc "frozen_features" (length [() | f<-M.elems (features g4),status f==Frozen])
                . inc "active_frontier_size" (length [() | f<-M.elems (features g4),status f==Unmatched]) $ g4
              why | not (null (unmatched g2))="source closure/construction unresolved: "++show (unmatched g2)
                  | not complete="global explanation selection budget exhausted"
                  | not exact="complete graph had no exact acyclic decoder"
                  | otherwise="None"
          in FrontResult (if exact then selected' else Nothing) final why (complete && exact)
  where
    enc=R2.inducedEncoder (r2Config conf)

-- Forces the closure graph far enough that its construction is attributed to
-- the closure timer rather than to the later pure stages.
forceClosure :: Graph -> IO ()
forceClosure g=do
  _<-evaluate (metric "search_work" g+M.size (features g)+length (matches g)+length (edges g)+M.size (semanticStates g))
  pure ()

-- Runs the front-end with an arbitrary (possibly IO-backed) source closure,
-- then the unchanged R2 fallback. The serial `solve` is the identity closure.
solveClosure :: ([O.Scene] -> Layout -> Graph -> IO Graph) -> Mode -> Config -> [(Grid,Grid)] -> IO Result
solveClosure closure mode conf pairs=do
  t0<-getMonotonicTimeNSec
  (f,closureTime)<-case frontPrepare mode conf pairs of
    Left r->pure (r,0)
    Right p->do
      c0<-getMonotonicTimeNSec
      g<-closure (preparedInputs p) closureLayout (preparedGraph p)
      forceClosure g
      c1<-getMonotonicTimeNSec
      pure (frontFinish mode conf pairs p g,fromIntegral (c1-c0)/1e9)
  _<-evaluate (metric "search_work" (graph f)+M.size (features (graph f))+length (show (frontProgram f))+length (frontFailure f))
  old<-case frontProgram f of Just _->pure Nothing; Nothing->Just <$> R2.inducedSearch R2.Full (r2Config conf) pairs
  t1<-getMonotonicTimeNSec
  let reason=if maybe False (const True) old then frontFailure f else "None"
      f'=f {graph=inc "fallback_count" (maybe 0 (const 1) old) (graph f)}
  pure (Result f' old (fromIntegral (t1-t0)/1e9) reason closureTime)

solve :: Mode -> Config -> [(Grid,Grid)] -> IO Result
solve mode conf=solveClosure (\inputs layout g->pure (sourceClosure mode conf inputs layout g)) mode conf

predict :: Config -> Result -> Grid -> Either String Grid
predict conf r x=case frontProgram (front r) of
  Just p->runProgram p x
  Nothing->case fallback r >>= R2.inducedProgram of
    Just p->R2.predictInduced (r2Config conf) p x
    Nothing->Left "front-end and R2 have no exact training program"
