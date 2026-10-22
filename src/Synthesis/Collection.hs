-- LATIS collection experiment. The v0.4 solver and R2 are deliberately intact.
-- ObjectSet and OrderedView constructors are private: only the latter has rank.
module Synthesis.Collection
  ( Mode(..), Key(..), Trigger(..), Origin(..), SizeSig(..), IndexedType(..)
  , ObjectSet, objectSet, count, OrderedView, orderBy, rank, cardinality
  , sourceSet, orderingOrigin, orderingKey, orderingTrigger, orderingDerivation
  , Alignment, alignmentExpression, alignmentPairs, alignmentLeft, alignmentRight, rankAlign, alignmentLift
  , sizeIndex, objectEqual, observeColor, Feature(..), Status(..)
  , Abstraction(..), Refinement(..), MatchEdge(..), Graph(..), Front(..)
  , Program, Config(..), defaultConfig, frontSearch, runProgram, metric
  , legalComparison, expandedFrontier, synthesizeAlignment, visibleKeys
  ) where

import Latent.Grid
import Latent.Encode
import Latent.Render
import qualified Latent.Object as O
import qualified Synthesis.Triggered as V4
import qualified Synthesis.InducedR2.Learn as R2
import qualified Data.Set as S
import qualified Data.Map.Strict as M
import Data.List (sortOn, nub, find)
import Data.Maybe (listToMaybe)

data Mode = Full | NoDependentIndex | DirectSetIndexing | NoAlignmentExplanation
  | NoEagerAbstraction | NoSemanticCohesion | R2FallbackOnly
  deriving (Eq,Ord,Show,Read,Enum,Bounded)
data SizeSig = SizeSig Int Int deriving (Eq,Ord,Show)
data IndexedType = ObjectT SizeSig | PlacedT SizeSig | ExistsPlacedT
  | SetT IndexedType | NatT | OrderedT Key [Int] | AlignmentT [Int]
  | RefT IndexedType | ConceptT IndexedType deriving (Eq,Ord,Show)
data Origin = InputSet | OutputSet deriving (Eq,Ord,Show)
data Key = XCoord | YCoord | Area | Color | Lex Key Key deriving (Eq,Ord,Show)
data Trigger = NeedCrossItemAlignment | NeedOrderedView | NeedUniqueRef
  | NeedCount | NeedTransform | NeedConstruct | NeedSemanticCohesion deriving (Eq,Ord,Show)
data Status = Unmatched | Matched | Frozen deriving (Eq,Ord,Show)

-- The normalized set payload contains no runtime IDs or enumeration order.
newtype ObjectSet = ObjectSet (S.Set (SizeSig,O.Object)) deriving (Eq,Ord,Show)
objectSet :: [O.Object] -> ObjectSet
objectSet = ObjectSet . S.fromList . map (\o -> (sizeIndex o,o {O.objectId=0,O.orientation=0}))
count :: ObjectSet -> Int
count (ObjectSet s) = S.size s
sizeIndex :: O.Object -> SizeSig
sizeIndex o = SizeSig (O.width o) (O.height o)
objectEqual :: Mode -> O.Object -> O.Object -> Either String Bool
objectEqual mode a b
  | mode/=NoDependentIndex && sizeIndex a/=sizeIndex b = Left "size-index unification failed"
  | otherwise = Right (O.geometry a==O.geometry b)
observeColor :: O.Object -> Maybe Int
observeColor = O.color

-- Keys are a finite ontology slice, not an unrestricted ordering grammar.
visibleKeys :: [Trigger] -> [Key] -> [Key]
visibleKeys ts ontology
  | any (`elem` ts) [NeedCrossItemAlignment,NeedOrderedView,NeedUniqueRef] = nub ontology
  | otherwise = []
keyValue :: Key -> O.Object -> Maybe [Int]
keyValue XCoord o = Just [cx (O.position o)]
keyValue YCoord o = Just [cy (O.position o)]
keyValue Area o = Just [O.size o]
keyValue Color o = (:[]) <$> observeColor o
keyValue (Lex a b) o = (++) <$> keyValue a o <*> keyValue b o
data OrderedView = OrderedView
  { sourceSet :: ObjectSet, orderingOrigin :: Origin, orderingKey :: Key
  , cardinality :: Int, orderingTrigger :: Trigger, orderingDerivation :: String
  , orderedPayload :: [O.Object] } deriving (Eq,Show)
orderBy :: [Key] -> Trigger -> Origin -> Key -> ObjectSet -> Either String OrderedView
orderBy ontology tr origin key source@(ObjectSet s)
  | key `notElem` visibleKeys [tr] ontology = Left "ordering key is not visible under this trigger"
  | otherwise = do
      keyed <- traverse (\(_,o) -> maybe (Left "partial ordering observer") (\v->Right (v,o)) (keyValue key o)) (S.toList s)
      if length (nub (map fst keyed))/=length keyed then Left "non-unique ordering key: no implicit tie breaker"
        else Right (OrderedView source origin key (count source) tr
          ("OrderBy("++show key++","++show origin++")") (map snd (sortOn fst keyed)))
rank :: OrderedView -> Int -> Either String O.Object
rank v i | i<0 || i>=cardinality v = Left "Fin(n) out of bounds"
         | otherwise = Right (orderedPayload v !! i)
data Alignment = Alignment
  { alignmentExpression :: (Key,Key), alignmentLeft :: OrderedView, alignmentRight :: OrderedView
  } deriving (Eq,Show)
rankAlign :: OrderedView -> OrderedView -> Either String Alignment
rankAlign a b
  | cardinality a/=cardinality b = Left "RankAlign cardinality constraint failed"
  | orderingOrigin a/=InputSet || orderingOrigin b/=OutputSet = Left "RankAlign origins must be InputSet/OutputSet"
  | otherwise = Right (Alignment (orderingKey a,orderingKey b) a b)
alignmentPairs :: Alignment -> [(O.Object,O.Object)]
alignmentPairs a = zip (orderedPayload (alignmentLeft a)) (orderedPayload (alignmentRight a))
synthesizeAlignment :: [Key] -> (Key,Key) -> [(ObjectSet,ObjectSet)] -> Either String [Alignment]
synthesizeAlignment ontology (a,b) = traverse $ \(x,y)-> do
  u <- orderBy ontology NeedCrossItemAlignment InputSet a x
  v <- orderBy ontology NeedCrossItemAlignment OutputSet b y
  rankAlign u v

-- Concrete pairings are diagnostic evidence only. Lift must reproduce the
-- exact unordered relation in EVERY example with ONE symbolic expression.
alignmentLift :: [Key] -> [(ObjectSet,ObjectSet)] -> [[(O.Object,O.Object)]] -> Either String (Key,Key)
alignmentLift keys sets pairs
  | null sets || length sets/=length pairs = Left "AlignmentLift example count"
  | otherwise = maybe (Left "AlignmentLift: no common intensional explanation") Right $ listToMaybe
      [(a,b) | a<-keys,b<-keys, Right ws<-[synthesizeAlignment keys (a,b) sets]
       ,map (S.fromList . alignmentPairs) ws==map (S.fromList . map normalize) pairs]
  where normalize (a,b)=(clean a,clean b)
        clean o=o {O.objectId=0,O.orientation=0}

-- Equality is only called after this origin/witness check.
legalComparison :: Origin -> Origin -> Maybe Alignment -> O.Object -> O.Object -> Bool
legalComparison a b witness x y
  | a==b = x==y -- same canonical feature, not merely same type
  | a==InputSet && b==OutputSet = maybe False (elem (x,y) . alignmentPairs) witness
  | otherwise = maybe False (elem (y,x) . alignmentPairs) witness

data Feature = Feature
  { featureType :: IndexedType, denotation :: [String], expression :: String
  , provenance :: [String], trigger :: Maybe Trigger, cost :: Int, status :: Status
  } deriving (Eq,Show)
expandedFrontier :: [Feature] -> [Feature]
expandedFrontier = filter ((==Unmatched) . status)
data MatchEdge = AbstractEdge String String | ConcreteEdge String String deriving (Eq,Show)
data Refinement = Refinement
  { nodeName :: String, operation :: String, dependencies :: [String] } deriving (Eq,Show)
data Abstraction = Abstraction
  { abstractionName :: String, contract :: String, inputTypes :: [String], outputTypes :: [String]
  , hiddenRefinement :: [Refinement], abstractionDependencies :: [String]
  , abstractionProvenance :: [String], abstractionCost :: Int } deriving (Eq,Show)
data Graph = Graph
  { features :: [Feature], highEdges :: [MatchEdge], abstractions :: [Abstraction]
  , counters :: M.Map String Int, trace :: [String], alignmentEvidence :: [[Alignment]]
  } deriving (Eq,Show)
data Front = Front { program :: Maybe Program, graph :: Graph, failure :: String } deriving (Eq,Show)
metric :: String -> Graph -> Int
metric k = M.findWithDefault 0 k . counters
inc :: String -> Int -> Graph -> Graph
inc k n g=g {counters=M.insertWith (+) k n (counters g)}
data Config = Config { ontologyKeys :: [Key], alignmentBudget :: Int, scalarBudget :: Int
  , legacyConfig :: V4.Config } deriving (Eq,Show)
defaultConfig :: Config
defaultConfig=Config [XCoord,YCoord,Area,Color,Lex XCoord YCoord,Lex YCoord XCoord] 36 2000 V4.defaultConfig

-- A small generic sequence-local scalar language. There are no Attach/At/Chain
-- primitives and no object IDs. Previous refers to the previous OUTPUT rank.
data Atom = CurrentX | CurrentY | CurrentWidth | CurrentHeight
  | PreviousX | PreviousY | PreviousWidth | PreviousHeight deriving (Eq,Ord,Show,Enum,Bounded)
data Scalar = Literal Int | Observe Atom | Plus Scalar Scalar deriving (Eq,Ord,Show)
data Body = Body Scalar Scalar Scalar Scalar deriving (Eq,Show)
data Definition = Definition Key Body Bool deriving (Eq,Show)
data Execution = Inline Definition | Call String deriving (Eq,Show)
data Program = Program EncoderConfig Execution (M.Map String Definition) deriving (Eq,Show)
value :: O.Object -> Maybe O.Object -> Scalar -> Either String Int
value _ _ (Literal n)=Right n
value cur prev (Plus a b)=(+) <$> value cur prev a <*> value cur prev b
value cur prev (Observe a)=case a of
  CurrentX->Right (cx (O.position cur)); CurrentY->Right (cy (O.position cur))
  CurrentWidth->Right (O.width cur); CurrentHeight->Right (O.height cur)
  _->case prev of
    Nothing->Left "Previous is unavailable at first rank"
    Just p->Right $ case a of
      PreviousX->cx (O.position p); PreviousY->cy (O.position p)
      PreviousWidth->O.width p; PreviousHeight->O.height p
scalarTerms :: [Scalar]
scalarTerms = let base=map Observe [minBound..maxBound]; lits=map Literal [-1,0,1]
  in base++lits++[Plus a b | a<-base,b<-lits, b/=Literal 0]
      ++[Plus (Plus a b) c | a<-base,b<-base,c<-lits]
fitScalar :: Int -> [(O.Object,Maybe O.Object,Int)] -> Maybe Scalar
fitScalar budget rows' = find (\e->all (\(x,p,y)->value x p e==Right y) rows') (take budget scalarTerms)
fitBody :: Int -> [[(O.Object,O.Object)]] -> Either String Body
fitBody budget cases = do
  let rows'=[(i==0,x,if i==0 then Nothing else let (pi',po)=ps !! (i-1) in Just pi' {O.position=O.position po},y)
            | ps<-cases,(i,(x,y))<-zip [0::Int ..] ps]
      fit first axis=let values=[(f,(x,p,if axis then cx (O.position y) else cy (O.position y))) | (f,x,p,y)<-rows']
        in case fitScalar budget (map snd values) of
          Just common->Right common
          Nothing->maybe (Left ("feature transformation: no uniform "++show (first,axis)++" scalar expression")) Right
            (fitScalar budget [v | (f,v)<-values,f==first])
  Body <$> fit True True <*> fit True False <*> fit False True <*> fit False False
runProgram :: Program -> Grid -> Either String Grid
runProgram (Program enc executable defs) grid = do
  let scene=encode enc grid
  Definition key body unsafe <- case executable of Inline b->Right b; Call n->maybe (Left "missing abstraction refinement") Right (M.lookup n defs)
  os <- if unsafe then Right (O.objects scene) else orderedPayload <$> orderBy [key] NeedOrderedView InputSet key (objectSet (O.objects scene))
  out <- walk body Nothing os
  render scene {O.objects=out}
  where
    walk _ _ []=Right []
    walk body@(Body fx fy sx sy) prev (o:os)=do
      let (x,y)=if maybe True (const False) prev then (fx,fy) else (sx,sy)
      pos<-Coord <$> value o prev x <*> value o prev y
      let moved=o {O.position=pos}
      rest<-walk body (Just moved) os
      pure (moved:rest)

seed :: [(O.Scene,O.Scene)] -> Graph
seed pairs=Graph fs [] [] (M.fromList [(k,0) | k<-words
  "UntriggeredExpansionCount ConcreteCrossItemEdgeCount_high_level expanded_frozen_features alignment_attempts alignment_rejections equality_attempts rejected_size_comparisons unexplained_equalities alignment_lift_attempts alignment_lift_successes accepted_abstractions scalar_candidate_bound construction_triggers fallback_count"]) [] []
  where
    fs=[Feature (SetT ExistsPlacedT) (map (show . objectSet . O.objects . side) pairs) (show origin)
          ["Objects(Scene)","existential size-index packaging"] Nothing 0 Unmatched
       | (origin,side)<-[(InputSet,fst),(OutputSet,snd)]]
addFeature :: Feature -> Graph -> Graph
addFeature f g=g {features=features g++[f]}
finish :: Maybe Program -> String -> Graph -> Front
finish p why g=Front p g {counters=M.insert "ConcreteCrossItemEdgeCount_high_level"
  (length [() | ConcreteEdge _ _<-highEdges g]) $ M.insert "UntriggeredExpansionCount"
  (length [() | f<-features g,cost f>0,trigger f==Nothing]) (counters g)} why

-- One small-interface connected subgraph, checked before invention. External
-- users must be confined to the declared result; all node dependencies exist.
cohesive :: [Refinement] -> Bool
cohesive ns=length ns>=4 && all (\n->all (`elem` names) (dependencies n)) ns
  && all (\n->nodeName n=="compare" || any (elem (nodeName n) . dependencies) ns) ns
  where names=map nodeName ns
pack :: Mode -> (Key,Key) -> [Alignment] -> Body -> Bool -> (Execution,M.Map String Definition,[Abstraction])
pack mode expr ws body unsafe
  | unsafe || mode==NoSemanticCohesion || not (cohesive nodes) = (Inline def,M.empty,[])
  | otherwise = (Call "I_0",M.singleton "I_0" def,[Abstraction "I_0"
      ("OrderedCorrespondence; equal counts; unique keys; preserve indexed objects; realize positions")
      ["Set[exists sigma.Placed[sigma]]"] ["Set[exists sigma.Placed[sigma]]"] nodes
      ["OrderBy","RankAlign","Position","indexed object equality"]
      ["stable symbolic expression across "++show (length ws)++" training cases","AlignmentLift",show body]
      (length nodes+length (show body))])
  where def=Definition (fst expr) body unsafe
        nodes=[Refinement "input-order" ("OrderBy "++show (fst expr)) []
              ,Refinement "output-order" ("OrderBy "++show (snd expr)) []
              ,Refinement "alignment" "RankAlign" ["input-order","output-order"]
              ,Refinement "compare" ("Compare; sequence-local transformation "++show body) ["alignment"]]

frontSearch :: Mode -> Config -> [(Grid,Grid)] -> Front
frontSearch mode conf examples
  | mode==R2FallbackOnly = finish Nothing "R2FallbackOnly" empty
  | null examples = finish Nothing "grounding: empty training set" empty
  | any (\(a,b)->O.canvas a/=O.canvas b) scenes = finish Nothing "layout: collection frontend requires unchanged canvas" empty
  | any (uncurry (/=) . (\(a,b)->(count a,count b))) sets = finish Nothing "RankAlign: unequal input/output cardinality" counted
  | mode==DirectSetIndexing = tryUnsafe counted
  | otherwise = search candidates diagnostic "alignment: no unique common ordering"
  where
    enc=R2.inducedEncoder (V4.r2Config (legacyConfig conf))
    scenes=[(encode enc x,encode enc y) | (x,y)<-examples]
    sets=[(objectSet (O.objects a),objectSet (O.objects b)) | (a,b)<-scenes]
    empty=seed scenes
    counted=foldr addFeature empty [Feature NatT (map (show . count . side) sets) ("Count("++show origin++")")
      [show origin] (Just NeedCount) 1 (if all (\(a,b)->count a==count b) sets then Frozen else Unmatched)
      | (origin,side)<-[(InputSet,fst),(OutputSet,snd)]]
    keys=visibleKeys [NeedCrossItemAlignment] (ontologyKeys conf)
    candidates=take (max 0 (alignmentBudget conf)) [(a,b) | a<-keys,b<-keys]
    -- The equality-without-witness ablation really visits the Cartesian product.
    diagnostic | mode/=NoAlignmentExplanation = counted
               | otherwise =
                   let comparisons=[(a,b) | (x,y)<-scenes,a<-O.objects x,b<-O.objects y]
                       hits=[(a,b) | (a,b)<-comparisons,objectEqual mode a b==Right True]
                   in inc "equality_attempts" (length comparisons) . inc "unexplained_equalities" (length hits) $ counted
                                {highEdges=[ConcreteEdge (show a) (show b) | (a,b)<-hits]
                                ,trace=["NoAlignmentExplanation: unaligned Cartesian equality admitted before explained search"]}
    search [] g why=finish Nothing (why++if length candidates<length keys*length keys then "; alignment budget exhausted" else "") g
    search (expr:rest) g why=case synthesizeAlignment keys expr sets of
      Left err->search rest (inc "alignment_rejections" 1 (inc "alignment_attempts" 1 g)) (if why=="alignment: no unique common ordering" then "alignment: "++err else why)
      Right ws->
        let ps=map alignmentPairs ws
            admitted=and [legalComparison InputSet OutputSet (Just w) a b | w<-ws,(a,b)<-alignmentPairs w]
            g1=inc "alignment_attempts" 1 $ g {alignmentEvidence=alignmentEvidence g++[ws]}
        in if not admitted then search rest g1 "alignment witness rejection" else
          case realize expr ps ws g1 False of
            (Just p,g2,_)->finish (Just p) "None" g2
            (_,g2,err)->search rest g2 (if take 11 err=="realization" || take 11 why/="realization" then err else why)
    realize expr ps ws g unsafe =
      let flat=concat ps
          comparisons=map (uncurry (objectEqual mode)) flat
          g1=inc "equality_attempts" (length flat) . inc "rejected_size_comparisons" (length [() | Left _<-comparisons]) $ g
          -- Polymorphic color observations can validate a witness even when
          -- object equality is forbidden by size-index mismatch.
          colorOK=all (\(a,b)->observeColor a/=Nothing && observeColor a==observeColor b) flat
          shapeOK=all (==Right True) comparisons
          g2=if not colorOK then g1 else abstractMatches expr ps ws g1 unsafe
          -- Observed components may be occluded. Reuse a complete, indexed
          -- input object as a construction hypothesis; never equate it with
          -- a different-sized observed output. Whole-scene execution validates
          -- this branch. Previous dimensions are those of the constructed
          -- object, not its visible fragment (fitBody uses the same semantics).
          gConstruct=if shapeOK then g2 else inc "construction_triggers" 1 $
            addFeature (Feature (ConceptT (SetT ExistsPlacedT)) (map (show . map (sizeIndex . fst)) ps)
              "PreserveInputGeometry(AlignedRef); validate via Render" ["unresolved indexed geometry","full output witness"]
              (Just NeedConstruct) 1 Unmatched) g2 {trace=trace g2++["NeedConstruct: preserved indexed geometry; defer validation to full scene"]}
      in if not colorOK then (Nothing,g2,"alignment validation: aligned Color observer differs")
         else case fitBody (scalarBudget conf) ps of
           Left err->(Nothing,gConstruct,err)
           Right body->
             let (exec,defs,abs')=pack mode expr ws body unsafe
                 p=Program enc exec defs
                 checked=inc "scalar_candidate_bound" (min (scalarBudget conf) (length scalarTerms)*8) gConstruct
                 g3=inc "accepted_abstractions" (length abs') $
                   addFeature (Feature (ConceptT (SetT ExistsPlacedT)) (map (show . map (O.position . snd)) ps)
                     (show exec) ["sequence-local First/Current/Previous",show body] (Just NeedTransform) (length (show body)) Frozen)
                     checked {abstractions=abstractions checked++abs',features=map (\f->if trigger f==Just NeedConstruct then f {status=Frozen} else f) (features checked)}
                 inline=Program enc (Inline (Definition (fst expr) body unsafe)) M.empty
             in if all (\(x,y)->runProgram inline x==Right y) examples then (Just p,g3,"None")
                else (Nothing,checked,"realization: final grid exact check failed")
    abstractMatches expr ps ws g unsafe =
      let lifted=if unsafe then Left "runtime enumeration is not an alignment explanation" else alignmentLift keys sets ps
          g1=inc "alignment_lift_attempts" 1 g
          exprText="RankAlign(OrderBy("++show (fst expr)++",InputSet),OrderBy("++show (snd expr)++",OutputSet))"
          fs=[Feature (AlignmentT (map length ps)) (map (show . map (\(a,b)->(O.position a,O.position b))) ps)
                exprText ["rank witness before comparison",show expr] (Just NeedCrossItemAlignment) 3 Frozen
             ,Feature (RefT ExistsPlacedT) (map (show . map (\(a,b)->(sizeIndex a,O.position a,sizeIndex b,O.position b))) ps) ("Rank("++exprText++",i)")
                [exprText,"forall i:Fin(Count(S))"] (Just NeedUniqueRef) 1 Frozen]
          es | mode==NoEagerAbstraction || unsafe = [ConcreteEdge (show a) (show b) | (a,b)<-concat ps]
             | otherwise = [AbstractEdge ("Rank(Input,"++show expr++",i).Color") ("Rank(Output,"++show expr++",i).Color")]
      in case lifted of
        Left err->g1 {trace=trace g1++[err],highEdges=highEdges g1++if unsafe then es else []}
        Right liftedExpr->inc "alignment_lift_successes" 1 $ foldr addFeature
          g1 {highEdges=highEdges g1++es,trace=trace g1++["AlignmentLift "++show liftedExpr]}
          (fs++[Feature (OrderedT key (map cardinality vs)) (map show vs) ("OrderBy("++show key++","++show origin++")")
            [show origin,"unique key; no implicit ties"] (Just NeedCrossItemAlignment) 1 Frozen
            | (key,origin,vs)<-[(fst expr,InputSet,map alignmentLeft ws),(snd expr,OutputSet,map alignmentRight ws)]])
    tryUnsafe g=
      let ps=[zip (O.objects x) (O.objects y) | (x,y)<-scenes]
          (p,g',why)=realize (YCoord,YCoord) ps [] g True
      in finish p why g' {trace=trace g'++["DirectSetIndexing: raw encoder enumeration; deliberate unsafe ablation"]}
