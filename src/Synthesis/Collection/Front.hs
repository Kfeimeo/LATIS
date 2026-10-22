-- LATIS v0.6 collection front-end: counterfactual-preserving online
-- abstraction. Incremental upgrade of the v0.5 collection front-end; the v0.5
-- module, v0.4 solver and R2 fallback are unchanged. Invariants kept:
-- trigger before expansion; no alignment without an explanation; matched
-- features stop expanding; no concrete cross-item edge at high levels.
module Synthesis.Collection.Front
  ( Mode(..), Config(..), defaultConfig, Status(..), IndexedType(..), Feature(..), MatchEdge(..), KeyCandidate(..)
  , Graph(..), Front(..), Program(..), Execution(..), Definition(..), Body(..)
  , runProgram, frontSearch, metric, expandedFrontier, policyFor, metricNames
  ) where

import Latent.Grid
import Latent.Encode
import Latent.Render
import qualified Latent.Object as O
import qualified Synthesis.Triggered as V4
import qualified Synthesis.InducedR2.Learn as R2
import Synthesis.Collection.Indexed
import Synthesis.Collection.Counterfactual
import Synthesis.Collection.Online
import qualified Data.Map.Strict as M
import qualified Data.Set as S
import Control.Monad (forM, forM_, when, unless, filterM)
import Data.List (sortOn, nub, intercalate)
import Data.Maybe (fromMaybe, isNothing)

data Mode = Full | NoCounterfactual | CollapseByTrainingDenotation | NoIntensionalityPrior | FixedAlignmentKeys
  | NoAlignmentExplanation | NoOnlineAbstraction | PostHocOnly | NoDependentIndex | DirectSetIndexing | R2FallbackOnly
  deriving (Eq,Ord,Show,Read,Enum,Bounded)
data Status = Unmatched | Matched | Frozen deriving (Eq,Ord,Show)
data IndexedType = ObjectT SizeSig | PlacedT SizeSig | ExistsPlacedT | SetT IndexedType | NatT | OrderedT KeyExpr [Int]
  | AlignmentT [Int] | RefT IndexedType | ConceptT IndexedType | ScalarT String deriving (Eq,Ord,Show)
data Feature = Feature
  { featureType :: IndexedType, denotation :: [String], expression :: String, provenance :: [String]
  , trigger :: Maybe Trigger, cost :: Int, status :: Status } deriving (Eq,Show)
data MatchEdge = AbstractEdge String String | ConcreteEdge String String deriving (Eq,Show)
data KeyCandidate = KeyCandidate { kcKey :: KeyExpr, kcOrigin :: Origin, kcSeed :: Bool, kcPhase :: String, kcStatus :: String, kcCost :: Int } deriving (Eq,Show)
data Graph = Graph
  { features :: [Feature], highEdges :: [MatchEdge], abstractions :: [Abstraction], counters :: M.Map String Int, trace :: [String]
  , alignmentEvidence :: [[Alignment]], keyCandidates :: [KeyCandidate], classes :: [SemanticClass]
  , counterfactuals :: [Counterfactual], rejectedCounterfactuals :: [Counterfactual], refinements :: [RNode], highLevelView :: [String] } deriving (Eq,Show)
data Front = Front { program :: Maybe Program, graph :: Graph, failure :: String } deriving (Eq,Show)
data Config = Config { alignmentBudget :: Int, scalarBudget :: Int, synthesisDepth :: Int, synthesisCostBound :: Int, promotionThreshold :: Int
  , legacyConfig :: V4.Config } deriving (Eq,Show)
defaultConfig :: Config
defaultConfig=Config 400 2000 2 5 4 V4.defaultConfig
metric :: String -> Graph -> Int
metric k=M.findWithDefault 0 k . counters
expandedFrontier :: [Feature] -> [Feature]
expandedFrontier=filter ((==Unmatched) . status)
policyFor :: Mode -> ClassPolicy
policyFor m=ClassPolicy (m/=NoCounterfactual) (m==CollapseByTrainingDenotation) (m/=NoIntensionalityPrior)
metricNames :: [String]
metricNames=words "UntriggeredExpansionCount ConcreteCrossItemEdgeCount_high_level expanded_frozen_features alignment_attempts alignment_rejections equality_attempts rejected_size_comparisons unexplained_equalities alignment_lift_attempts alignment_lift_successes accepted_abstractions construction_triggers fallback_count semantic_classes representatives max_representatives_per_class counterfactual_contexts_generated counterfactual_contexts_rejected counterfactual_evaluations counterfactual_splits canonical_merges premature_collapses dropped_by_collapse intensional_candidates literal_candidates alignment_key_candidates synthesized_keys_accepted ordering_ties_rejected alignment_witnesses online_abstractions_proposed online_abstractions_accepted online_abstraction_reuses refinement_expansions_saved operator_applications refinement_expansions active_frontier_size visibility_size visibility_keys search_work alignment_failure_triggers posthoc_abstractions_accepted"

-- Executable program. The high level sees Call(I_0) and the contract; the
-- definition (ordering key, sequence body) and the scalar abstraction library
-- are the hidden refinement, expanded only when executing (RefinementTrigger).
data Body = Body { bodyFirst :: (Scalar,Scalar), bodyNext :: (Scalar,Scalar) } deriving (Eq,Show)
data Definition = Definition { defKey :: KeyExpr, defBody :: Body, defUnsafe :: Bool } deriving (Eq,Show)
data Execution = Inline Definition | CallTop String deriving (Eq,Show)
data Program = Program { progEncoder :: EncoderConfig, progExec :: Execution, progDefs :: M.Map String Definition
  , progLibrary :: Library, progDependent :: Bool } deriving (Eq,Show)
runProgram :: Program -> Grid -> Either String Grid
runProgram (Program enc ex defs lib dep) grid=do
  let scene=encode enc grid
      objs=O.objects scene
      set=objectSet objs
  Definition key body unsafe <- case ex of
    Inline d->Right d
    CallTop n->maybe (Left "missing abstraction refinement") Right (M.lookup n defs)
  items <- if unsafe then Right (map placedFromObject objs) else orderedItems <$> orderBy [key] NeedOrderedView InputSet key set
  out <- walk body (O.canvas scene) set Nothing (zip [0::Int ..] items)
  render scene {O.objects=map placedToObject out}
  where
    walk _ _ _ _ []=Right []
    walk body dims set prev ((i,p):rest)=do
      let ctx=Ctx dims set p prev dep
          (fx,fy)=if i==0 then bodyFirst body else bodyNext body
      x<-evalScalar lib ctx fx
      y<-evalScalar lib ctx fy
      let moved=p {placedPos=Coord x y}
      (moved:) <$> walk body dims set (Just moved) rest

-- Search state and a small state monad (no mtl dependency).
data St = St { stGraph :: Graph, stStep :: Int, stNextAbs :: Int, stLibrary :: Library
  , stViews :: M.Map (KeyExpr,Origin,Int) OrderedView, stTried :: S.Set (KeyExpr,KeyExpr)
  , stCF :: [(Int,Ctx -> Ctx)], stDerivation :: [RNode], stResults :: [String] }
newtype Search a = Search { runSearch :: St -> (a,St) }
instance Functor Search where fmap f (Search g)=Search (\s->let (a,s')=g s in (f a,s'))
instance Applicative Search where
  pure a=Search (\s->(a,s))
  Search f <*> Search g=Search (\s->let (h,s1)=f s; (a,s2)=g s1 in (h a,s2))
instance Monad Search where Search g >>= k=Search (\s->let (a,s1)=g s in runSearch (k a) s1)
gets :: (St -> a) -> Search a
gets f=Search (\s->(f s,s))
modify :: (St -> St) -> Search ()
modify f=Search (\s->((),f s))
onGraph :: (Graph -> Graph) -> Search ()
onGraph f=modify (\s->s {stGraph=f (stGraph s)})
inc :: String -> Int -> Search ()
inc k n=onGraph (\g->g {counters=M.insertWith (+) k n (counters g)})
setMax :: String -> Int -> Search ()
setMax k n=onGraph (\g->g {counters=M.insertWith max k n (counters g)})
tick :: Search Int
tick=Search (\s->let n=stStep s+1 in (n,s {stStep=n}))
traceMsg :: String -> Search ()
traceMsg m=onGraph (\g->g {trace=trace g++[m]})
addFeature :: Feature -> Search ()
addFeature f=onGraph (\g->g {features=features g++[f]})
-- Every materialized refinement node is a counted expansion.
addNodes :: [RNode] -> Search ()
addNodes ns=do
  inc "refinement_expansions" (length ns)
  modify (\s->s {stDerivation=stDerivation s++ns, stGraph=(stGraph s) {refinements=refinements (stGraph s)++ns}})
addResult :: String -> Search ()
addResult r=modify (\s->s {stResults=stResults s++[r]})
visible :: String -> Search [Abstraction]
visible family=gets (\s->[a | a<-abstractions (stGraph s), absFamily a==family, uAccepted (absUtility a), absPromotionStep a>=0])

seedGraph :: [(O.Scene,O.Scene)] -> Graph
seedGraph pairs=Graph fs [] [] (M.fromList [(k,0) | k<-metricNames]) [] [] [] [] [] [] [] []
  where fs=[Feature (SetT ExistsPlacedT) (map (show . count . objectSet . O.objects . side) pairs) (show origin)
              ["Objects(Scene)","existential size-index packaging"] Nothing 0 Unmatched
           | (origin,side)<-[(InputSet,fst),(OutputSet,snd)]]
finish :: Maybe Program -> String -> Graph -> Front
finish p why g=Front p g {counters=M.union (M.fromList
  [("ConcreteCrossItemEdgeCount_high_level",length [() | ConcreteEdge _ _<-highEdges g])
  ,("UntriggeredExpansionCount",length [() | f<-features g, cost f>0, isNothing (trigger f)])
  ,("expanded_frozen_features",0)
  ,("active_frontier_size",length (expandedFrontier (features g)))
  ,("refinement_expansions",length (refinements g))
  ,("search_work",metric "operator_applications" g+length (refinements g))
  ,("visibility_size",metric "visibility_keys" g+length [() | a<-abstractions g, uAccepted (absUtility a), absPromotionStep a>=0, absFamily a/="OrderedCorrespondence"])
  ,("accepted_abstractions",length [() | a<-abstractions g, uAccepted (absUtility a)])]) (counters g)} why

scanKey :: KeyExpr
scanKey=Lex (Anchor TL AY) (Anchor TL AX)

frontSearch :: Mode -> Config -> [(Grid,Grid)] -> Front
frontSearch mode conf examples
  | mode==R2FallbackOnly = finish Nothing "R2FallbackOnly" (seedGraph [])
  | null examples = finish Nothing "grounding: empty training set" (seedGraph [])
  | any (\(a,b)->O.canvas a/=O.canvas b) scenes = finish Nothing "layout: collection frontend requires unchanged canvas" (seedGraph scenes)
  | otherwise =
      let (r,st)=runSearch main (St (seedGraph scenes) 0 1 M.empty M.empty S.empty [] [] [])
      in finish (either (const Nothing) Just r) (either id (const "None") r) (stGraph st)
  where
    enc=R2.inducedEncoder (V4.r2Config (legacyConfig conf))
    scenes=[(encode enc x,encode enc y) | (x,y)<-examples]
    sets=[(objectSet (O.objects a),objectSet (O.objects b)) | (a,b)<-scenes]
    dims=map (O.canvas . fst) scenes
    cases=[0..length scenes-1]
    ncases=length scenes
    dep=mode/=NoDependentIndex
    pol=policyFor mode
    online=mode `notElem` [NoOnlineAbstraction,PostHocOnly]
    inSet c=fst (sets !! c)
    tag c=("case"++show c++":")
    defaultWhy="alignment: no unique common ordering"

    main :: Search (Either String Program)
    main=do
      forM_ [(InputSet,fst),(OutputSet,snd)] $ \(o,side)->addFeature (Feature NatT (map (show . count . side) sets) ("Count("++show o++")")
        [show o] (Just NeedCount) 1 (if all (\(a,b)->count a==count b) sets then Frozen else Unmatched))
      if any (\(a,b)->count a/=count b) sets then pure (Left "RankAlign: unequal input/output cardinality") else do
        pre<-prePath
        case pre of
          Left err->pure (Left err)
          Right (Just p)->pure (Right p)
          Right Nothing->explained

    -- Deliberate ablations that pair items without an alignment explanation.
    prePath :: Search (Either String (Maybe Program))
    prePath
      | mode==DirectSetIndexing = do
          let ps=[runtimePairs (O.objects x) (O.objects y) | (x,y)<-scenes]
          traceMsg "DirectSetIndexing: raw encoder enumeration; deliberate unsafe ablation"
          onGraph (\g->g {highEdges=highEdges g++[ConcreteEdge (show a) (show b) | (a,b)<-concat ps]})
          r<-realize [] (scanKey,scanKey) ps [] True
          pure (fmap Just r)
      | mode==NoAlignmentExplanation = do
          let greedy xs ys=go (map placedFromObject xs) (map placedFromObject ys) 0
                where go [] _ n=(Just [],n)
                      go (a:as) outs n=case break (\b->observeColor a/=Nothing && observeColor a==observeColor b) outs of
                        (_,[])->(Nothing,n+length outs)
                        (before,b:after)->let (rest,n')=go as (before++after) (n+length before+1) in (fmap ((a,b):) rest,n')
              attempts=[greedy (O.objects x) (O.objects y) | (x,y)<-scenes]
          inc "equality_attempts" (sum (map snd attempts))
          inc "operator_applications" (sum (map snd attempts))
          case traverse fst attempts of
            Nothing->do traceMsg "NoAlignmentExplanation: Cartesian Color equality found no total pairing; explained search follows"; pure (Right Nothing)
            Just ps->do
              inc "unexplained_equalities" (length (concat ps))
              onGraph (\g->g {highEdges=highEdges g++[ConcreteEdge (show a) (show b) | (a,b)<-concat ps]})
              traceMsg "NoAlignmentExplanation: unaligned Cartesian Color equality admitted before explained search"
              r<-realize [] (scanKey,scanKey) ps [] True
              case r of
                Right p->pure (Right (Just p))
                Left err->do traceMsg ("unexplained pairing failed realization: "++err); pure (Right Nothing)
      | otherwise = pure (Right Nothing)

    explained :: Search (Either String Program)
    explained=do
      r1<-phase "seed" [NeedCrossItemAlignment]
      case r1 of
        Right p->pure (Right p)
        Left why1
          | mode==FixedAlignmentKeys->pure (Left (why1++"; FixedAlignmentKeys: key synthesis disabled"))
          | otherwise->do
              inc "alignment_failure_triggers" 1
              traceMsg "AlignmentFailure: seed ontology exhausted; synthesized key grammar unlocked under NeedCrossItemAlignment"
              r2<-phase "synthesized" [NeedCrossItemAlignment,AlignmentFailure]
              pure (either (\w->Left (if w==defaultWhy then why1 else w)) Right r2)

    -- Trigger before expansion: keys exist only under an ordering trigger.
    phase :: String -> [Trigger] -> Search (Either String Program)
    phase name triggers=do
      let keys=visibleKeyGrammar (KeyContext triggers (mode==FixedAlignmentKeys) (synthesisDepth conf) (synthesisCostBound conf))
      setMax "visibility_keys" (length keys)
      traceMsg ("phase "++name++": "++show (length keys)++" visible keys")
      legalIn<-filterM (legalKey name keys InputSet) keys
      legalOut<-filterM (legalKey name keys OutputSet) keys
      tried<-gets stTried
      used<-gets (metric "alignment_key_candidates" . stGraph)
      let pairs=sortOn (\(a,b)->keyCost a+keyCost b) [(a,b) | a<-legalIn, b<-legalOut, not (S.member (a,b) tried)]
          budgeted=take (max 0 (alignmentBudget conf-used)) pairs
      inc "alignment_key_candidates" (length budgeted)
      when (length budgeted<length pairs) (traceMsg "alignment budget exhausted")
      loop (nub (legalIn++legalOut)) budgeted defaultWhy
    legalKey :: String -> [KeyExpr] -> Origin -> KeyExpr -> Search Bool
    legalKey name keys origin key=do
      let side=if origin==InputSet then fst else snd
          results=[(c,orderBy keys NeedCrossItemAlignment origin key (side (sets !! c))) | c<-cases]
      inc "operator_applications" ncases
      case [e | (_,Left e)<-results] of
        (e:_)->do
          when (take 10 e=="non-unique") (inc "ordering_ties_rejected" 1)
          onGraph (\g->g {keyCandidates=keyCandidates g++[KeyCandidate key origin (isSeedKey key) name ("rejected: "++e) (keyCost key)]})
          pure False
        []->do
          modify (\s->s {stViews=foldr (\(c,Right v)->M.insert (key,origin,c) v) (stViews s) results})
          unless (isSeedKey key) (inc "synthesized_keys_accepted" 1)
          onGraph (\g->g {keyCandidates=keyCandidates g++[KeyCandidate key origin (isSeedKey key) name "strict ordering on every case" (keyCost key)]})
          pure True
    loop :: [KeyExpr] -> [(KeyExpr,KeyExpr)] -> String -> Search (Either String Program)
    loop _ [] why=pure (Left why)
    loop keys ((kIn,kOut):rest) why=do
      modify (\s->s {stTried=S.insert (kIn,kOut) (stTried s), stDerivation=[], stResults=[], stCF=[]})
      inc "alignment_attempts" 1
      aligned<-alignAttempt kIn kOut (length rest)
      case aligned of
        Left err->do inc "alignment_rejections" 1; loop keys rest ("alignment: "++err)
        Right (ws,resultIds)->do
          onGraph (\g->g {alignmentEvidence=alignmentEvidence g++[ws]})
          inc "alignment_witnesses" (length ws)
          let ps=map alignmentPairs ws
              admitted=and [legalComparison InputSet OutputSet (Just w) a b | w<-ws, (a,b)<-alignmentPairs w]
          if not admitted then loop keys rest "alignment witness rejection" else do
            ok<-validateColor ps resultIds
            if not ok then do
              inc "alignment_rejections" 1
              loop keys rest (if why==defaultWhy then "alignment validation: aligned Color observer differs" else why)
            else do
              r<-realize keys (kIn,kOut) ps ws False
              case r of
                Right p->pure (Right p)
                Left err->loop keys rest err
    -- One explained alignment attempt. After promotion, the per-case
    -- order/order/align chain is a single Call(I_k) node (reuse).
    alignAttempt :: KeyExpr -> KeyExpr -> Int -> Search (Either String ([Alignment],[String]))
    alignAttempt kIn kOut remaining=do
      views<-gets stViews
      inc "operator_applications" ncases
      case traverse (\c->rankAlign (views M.! (kIn,InputSet,c)) (views M.! (kOut,OutputSet,c))) cases of
        Left e->pure (Left e)
        Right ws->do
          ops<-visible "RankCorrespondence"
          ids<-case ops of
            (ab:_)->do
              step<-tick
              let node=RNode ("call:"++absName ab++":"++show step) "Call" [PAbs (absName ab),PConcept (show kIn),PConcept (show kOut)]
                         ["set:Input","set:Output","abstraction:"++absName ab] "alignment"
              reuse ab step (3*ncases-1) [node]
              pure (replicate ncases (rnId node))
            []->do
              let instances=[(tag c,alignmentNodes (tag c) kIn kOut) | c<-cases]
              addNodes (concatMap snd instances)
              propose "RankCorrespondence" instances remaining
                ("RankCorrespondence(kIn,kOut): order both sets by visible keys, align equal ranks; explained correspondence, no object identity"
                ,["Set[exists sigma.Placed[sigma]] (Input)","Set[exists sigma.Placed[sigma]] (Output)"],"Alignment[Input,Output,n]"
                ,[("kIn","Concept KeyExpr"),("kOut","Concept KeyExpr")],["alignment"]
                ,["strict ordering on every case for both keys","equal cardinality per case"],Nothing)
              pure [tag c++"rank-align" | c<-cases]
          pure (Right (ws,ids))
    validateColor :: [[(Placed,Placed)]] -> [String] -> Search Bool
    validateColor ps resultIds=do
      let flat=concat ps
          ok=all (\(a,b)->observeColor a/=Nothing && observeColor a==observeColor b) flat
      inc "operator_applications" (length flat)
      let nodes=[RNode (tag c++"validate-color") "Compare" [PRef "Color"] [r] "alignment" | (c,r)<-zip cases resultIds]
      addNodes nodes
      when ok (mapM_ (addResult . rnId) nodes)
      pure ok

    -- Online proposal: anti-unify the per-case instances, score the utility,
    -- promote into VisibleOps when it reaches the threshold.
    propose :: String -> [(String,[RNode])] -> Int -> (String,[String],String,[(String,String)],[String],[String],Maybe AbsDef) -> Search ()
    propose family instances remaining (contract,inputs,output,params,slice,witness,mdef)=when online $ do
      inc "online_abstractions_proposed" 1
      step<-tick
      case antiUnify instances of
        Left why->traceMsg ("abstraction rejected ("++family++"): "++why)
        Right (pattern,_)->do
          let u=utility (promotionThreshold conf) remaining (length instances) pattern params
          n<-gets stNextAbs
          let name="I_"++show n
              ab=Abstraction name family contract inputs output params pattern
                   (nub [d | node<-pattern, d<-rnDeps node, take 12 d=="abstraction:"]) slice witness
                   ["anti-unified from "++show (length instances)++" per-case instances","typed parametrization of Concept/Constant parameters"]
                   (length pattern) (1+length params) u step (if uAccepted u then step else -1) Nothing 0 0 mdef
          onGraph (\g->g {abstractions=abstractions g++[ab]})
          if uAccepted u then do
            modify (\s->s {stNextAbs=n+1, stLibrary=maybe id (M.insert name) mdef (stLibrary s)})
            inc "online_abstractions_accepted" 1
            traceMsg ("promote "++name++" ("++family++") utility="++show (uTotal u)++" at step "++show step)
          else traceMsg ("proposal "++family++" below threshold: utility="++show (uTotal u))
    reuse :: Abstraction -> Int -> Int -> [RNode] -> Search ()
    reuse ab step saved nodes=do
      addNodes nodes
      inc "online_abstraction_reuses" 1
      inc "refinement_expansions_saved" saved
      onGraph (\g->g {abstractions=[if absName a==absName ab then a {absReuseCount=absReuseCount a+1, absSaved=absSaved a+saved
        , absFirstReuseStep=Just (fromMaybe step (absFirstReuseStep a))} else a | a<-abstractions g]})
      traceMsg ("reuse "++absName ab++" at step "++show step++" saved "++show saved++" refinement expansions")

    -- Realization: indexed equality, lift, NeedConstruct, counterfactual
    -- contexts, slot fitting with semantic classes, exact whole-grid check.
    realize :: [KeyExpr] -> (KeyExpr,KeyExpr) -> [[(Placed,Placed)]] -> [Alignment] -> Bool -> Search (Either String Program)
    realize keys expr ps ws unsafe=do
      let flat=concat ps
          comparisons=map (uncurry (objectEqual dep)) flat
          shapeOK=all (==Right True) comparisons
      inc "equality_attempts" (length flat)
      inc "operator_applications" (length flat)
      inc "rejected_size_comparisons" (length [() | Left _<-comparisons])
      abstractMatches keys expr ps ws unsafe
      unless shapeOK $ do
        inc "construction_triggers" 1
        addFeature (Feature (ConceptT (SetT ExistsPlacedT)) (map (show . map (placedSig . fst)) ps)
          "PreserveInputGeometry(AlignedRef); validate via Render" ["unresolved indexed geometry","full output witness"] (Just NeedConstruct) 1 Unmatched)
        let nodes=[RNode (tag c++"construct") "PreserveInputGeometry" [PRef "AlignedRef"] [] "realization" | c<-cases]
        addNodes nodes
        mapM_ (addResult . rnId) nodes
        traceMsg "NeedConstruct: preserved indexed geometry; defer validation to full scene"
      cfs<-forM cases $ \c->do
        let (legal,illegal)=counterfactualContexts (if unsafe then scanKey else fst expr) c (dims !! c) (inSet c)
        onGraph (\g->g {counterfactuals=counterfactuals g++map fst legal, rejectedCounterfactuals=rejectedCounterfactuals g++illegal})
        inc "counterfactual_contexts_generated" (length legal)
        inc "counterfactual_contexts_rejected" (length illegal)
        pure [(c,f) | (_,f)<-legal]
      modify (\s->s {stCF=concat cfs})
      bodyR<-fitBody ps
      case bodyR of
        Left err->pure (Left err)
        Right body->do
          lib<-gets stLibrary
          let def=Definition (fst expr) body unsafe
              inline=Program enc (Inline def) M.empty lib dep
          if all (\(x,y)->runProgram inline x==Right y) examples then finalize def ps
          else pure (Left "realization: final grid exact check failed")
    abstractMatches :: [KeyExpr] -> (KeyExpr,KeyExpr) -> [[(Placed,Placed)]] -> [Alignment] -> Bool -> Search ()
    abstractMatches keys expr ps ws unsafe
      | unsafe = traceMsg "runtime enumeration is not an alignment explanation"
      | otherwise = do
          inc "alignment_lift_attempts" 1
          case alignmentLift keys sets ps of
            Left err->traceMsg err
            Right lifted->do
              inc "alignment_lift_successes" 1
              traceMsg ("AlignmentLift "++show lifted)
              let exprText="RankAlign(OrderBy("++show (fst expr)++",InputSet),OrderBy("++show (snd expr)++",OutputSet))"
              onGraph (\g->g {highEdges=highEdges g++[AbstractEdge ("Rank(Input,"++show expr++",i).Color") ("Rank(Output,"++show expr++",i).Color")]})
              mapM_ addFeature $
                [Feature (AlignmentT (map length ps)) (map (show . map (\(a,b)->(placedPos a,placedPos b))) ps) exprText
                   ["rank witness before comparison",show expr] (Just NeedCrossItemAlignment) 3 Frozen
                ,Feature (RefT ExistsPlacedT) (map (show . map (\(a,b)->(placedSig a,placedPos a,placedSig b,placedPos b))) ps) ("Rank("++exprText++",i)")
                   [exprText,"forall i:Fin(Count(S))"] (Just NeedUniqueRef) 1 Frozen]
                ++[Feature (OrderedT key (map cardinality vs)) (map (show . map placedPos . orderedItems) vs) ("OrderBy("++show key++","++show origin++")")
                   [show origin,"unique key; no implicit ties",if isSeedKey key then "seed key" else "synthesized key"] (Just NeedCrossItemAlignment) (keyCost key) Frozen
                  | (key,origin,vs)<-[(fst expr,InputSet,map alignmentLeft ws),(snd expr,OutputSet,map alignmentRight ws)]]

    -- Sequence-local body: per axis one shared expression, else First/Following.
    fitBody :: [[(Placed,Placed)]] -> Search (Either String Body)
    fitBody ps=do
      let rowsFor axis=[Row c i (Ctx (dims !! c) (inSet c) x prev dep) (obsPos axis y)
                       | (c,pairs)<-zip cases ps, (i,(x,y))<-zip [0..] pairs
                       , let prev=if i==0 then Nothing else let (pin,pout)=pairs !! (i-1) in Just pin {placedPos=placedPos pout}]
          axisFit axis remainingAfter=do
            let rs=rowsFor axis
            shared<-fitSlot ("shared-"++show axis) rs remainingAfter
            case shared of
              Right e->pure (Right (e,e))
              Left _->do
                f<-fitSlot ("first-"++show axis) (filter ((==0) . rowRank) rs) (remainingAfter+1)
                n<-fitSlot ("following-"++show axis) (filter ((>0) . rowRank) rs) remainingAfter
                pure ((,) <$> f <*> n)
      xr<-axisFit AX 1
      case xr of
        Left e->pure (Left e)
        Right (fx,nx)->do
          yr<-axisFit AY 0
          pure (fmap (\(fy,ny)->Body (fx,fy) (nx,ny)) yr)
    fitSlot :: String -> [Row] -> Int -> Search (Either String Scalar)
    fitSlot name rows' remaining=do
      let slotAxis=if take 2 (reverse name)=="YA" then AY else AX
      step<-tick
      lib<-gets stLibrary
      cfs<-gets stCF
      ops<-visible "SequentialScalar"
      let calls=[(ab,Call (absName ab) args) | ab<-ops, Just d<-[absDef ab], args<-argCombos (absParamKinds d)]
      (callFits,n1)<-pure (evaluateAll lib rows' (map snd calls))
      inc "operator_applications" n1
      if null rows' then do traceMsg (name++": no rows; trivially satisfied"); pure (Right (Lit 0)) else
        if not (null callFits) then do
          let ab=head [a | (a,c)<-calls, c `elem` callFits]
              node=RNode (name++":call:"++show step) "Call" [PAbs (absName ab)] ["abstraction:"++absName ab,"ref:Current","ref:Previous"] "scalar"
          reuse ab step (uNodesHidden (absUtility ab)*ncases-1) [node]
          addResult (rnId node)
          let (cls,evals)=buildClass pol lib name slotAxis rows' cfs callFits
          recordClass cls evals
          addFeature (Feature (ScalarT name) (map (show . rowTarget) rows') (show (scSelected cls)) ["Call of accepted online abstraction",intensionality (scSelected cls)] (Just NeedTransform) (scalarLength (scSelected cls)) Frozen)
          pure (Right (scSelected cls))
        else do
          let (fits,n2)=evaluateAll lib rows' (take (scalarBudget conf) scalarTerms)
          inc "operator_applications" n2
          if null fits then pure (Left ("feature transformation: no uniform "++name++" scalar expression")) else do
            let (cls,evals)=buildClass pol lib name slotAxis rows' cfs fits
            recordClass cls evals
            let e=scSelected cls
                instances=[(tag c++name++":",scalarNodes (tag c++name++":") e) | c<-cases]
            addNodes (concatMap snd instances)
            mapM_ (\c->addResult (tag c++name++":r")) cases
            addFeature (Feature (ScalarT name) (map (show . rowTarget) rows') (show e) [("semantic class of "++show (length (scReps cls))++" representatives"),intensionality e] (Just NeedTransform) (scalarLength e) Frozen)
            when (scalarLength e>=3) $ do
              let (pbody,_,params)=parametrize e
              propose "SequentialScalar" instances remaining
                ("SequentialScalar(axis,c): sequence-local scalar pattern over Current/Previous/Scene/Set references; axis and literal offsets are free parameters"
                ,["Ref Current","Ref Previous (alignment-derived)","Scene","InputSet"],"Int",params,["scalar"]
                ,["training-exact on every case for slot "++name],Just (AbsDef pbody (map snd params)))
            pure (Right e)
    argCombos :: [String] -> [[Arg]]
    argCombos kinds=sequence [if k=="Constant" then map ArgInt [-1,0,1] else map ArgAxis [AX,AY] | k<-kinds]
    evaluateAll :: Library -> [Row] -> [Scalar] -> ([Scalar],Int)
    evaluateAll lib rows' terms=foldr (\e (fs,n)->let (ok,m)=check e in (if ok then e:fs else fs,n+m)) ([],0) terms
      where check e=go rows' 0
              where go [] n=(True,n)
                    go (r:rs) n=if evalScalar lib (rowCtx r) e==Right (rowTarget r) then go rs (n+1) else (False,n+1)
    recordClass :: SemanticClass -> Int -> Search ()
    recordClass cls evals=do
      onGraph (\g->g {classes=classes g++[cls]})
      inc "semantic_classes" 1
      inc "representatives" (length (scReps cls))
      setMax "max_representatives_per_class" (length (scReps cls))
      inc "counterfactual_evaluations" evals
      inc "counterfactual_splits" (scSplits cls)
      inc "canonical_merges" (scMerges cls)
      inc "premature_collapses" (scPrematureCollapses cls)
      inc "dropped_by_collapse" (scDropped cls)
      inc "intensional_candidates" (length [() | r<-scReps cls, repClass r/="literal-derived"])
      inc "literal_candidates" (length [() | r<-scReps cls, repClass r=="literal-derived"])
      traceMsg ("class "++scSlot cls++": "++show (length (scReps cls))++" representatives, "++show (scSplits cls)++" counterfactual splits; selected "++show (scSelected cls))

    -- Final wrapping (I_0) and the high-level view. PostHocOnly additionally
    -- extracts scalar abstractions now, after the search, without feedback.
    finalize :: Definition -> [[(Placed,Placed)]] -> Search (Either String Program)
    finalize def0 ps=do
      def<-if mode==PostHocOnly then postHoc def0 else pure def0
      results<-gets stResults
      addNodes [RNode "realize" "Realize" [] results "realization"]
      nodes<-gets stDerivation
      lib<-gets stLibrary
      let Definition key body unsafe=def
          slotExprs=[fst (bodyFirst body),snd (bodyFirst body),fst (bodyNext body),snd (bodyNext body)]
          usedAbs=nub [n | e<-slotExprs, n<-callsIn e]
          wrap=mode/=NoOnlineAbstraction && not unsafe && cohesive nodes
          contract="OrderedCorrespondence; equal counts; unique keys; preserve indexed objects; realize positions"
          top=Abstraction "I_0" "OrderedCorrespondence" contract ["Set[exists sigma.Placed[sigma]]"] "Set[exists sigma.Placed[sigma]]" []
                nodes (["OrderBy","RankAlign","Position","indexed object equality"]++usedAbs) ["alignment","scalar","realization"]
                ["stable symbolic expression across "++show ncases++" training cases","AlignmentLift","whole-grid exact check"]
                ["final wrapping of the successful derivation (cohesion-gated, not utility-promoted)",show body]
                (length nodes) 1 (Utility ncases (length nodes) 1 0 0 0 0 0 0 1 1 0 (promotionThreshold conf) True) 0 0 Nothing 0 0 Nothing
          (exec,defs)=if wrap then (CallTop "I_0",M.singleton "I_0" def) else (Inline def,M.empty)
          p=Program enc exec defs lib dep
      when wrap (onGraph (\g->g {abstractions=abstractions g++[top]}))
      addFeature (Feature (ConceptT (SetT ExistsPlacedT)) (map (show . map (placedPos . snd)) ps) (show exec)
        ["sequence-local First/Current/Previous",if wrap then "hidden refinement: "++show (length nodes)++" nodes" else show body] (Just NeedTransform) (length (show body)) Frozen)
      onGraph (\g->g {features=[if trigger f==Just NeedConstruct then f {status=Frozen} else f | f<-features g]
        , highLevelView=["Input : Set[exists sigma.Placed[sigma]]","Output : Set[exists sigma.Placed[sigma]]","Count(Input) = Count(Output) : Nat"
          ,(if wrap then "Call(I_0) : "++contract else "Inline "++show def)]
          ++["VisibleOp "++absName a++" : "++absContract a | a<-abstractions g, uAccepted (absUtility a), absPromotionStep a>=0, absFamily a/="OrderedCorrespondence"]})
      if all (\(x,y)->runProgram p x==Right y) examples then pure (Right p) else pure (Left "realization: wrapped program diverged from inline definition")
    callsIn :: Scalar -> [String]
    callsIn (Call n _)=[n]
    callsIn (Plus a b)=callsIn a++callsIn b
    callsIn _=[]
    postHoc :: Definition -> Search Definition
    postHoc def=do
      let Body (fx,fy) (nx,ny)=defBody def
          slots=[("first-AX",fx),("first-AY",fy),("following-AX",nx),("following-AY",ny)]
          groups=M.toList (M.fromListWith (++) [(pbody,[(name,e,args)]) | (name,e)<-slots, scalarLength e>=3, let (pbody,args,_)=parametrize e])
      rewrites<-forM groups $ \(pbody,members)->do
        let instances=[(tag c++name++":",scalarNodes (tag c++name++":") e) | (name,e,_)<-members, c<-cases]
            (_,_,params)=parametrize (let (_,e,_)=head members in e)
        inc "online_abstractions_proposed" 1
        step<-tick
        case antiUnify instances of
          Left why->do traceMsg ("post-hoc abstraction rejected: "++why); pure []
          Right (pattern,_)->do
            let u=utility (promotionThreshold conf) 0 (length instances) pattern params
            n<-gets stNextAbs
            let name="I_"++show n
                ab=Abstraction name "SequentialScalar" "SequentialScalar(axis,c): post-hoc wrapped sequence-local scalar pattern" ["Ref Current","Ref Previous (alignment-derived)","Scene","InputSet"] "Int" params pattern [] ["scalar"]
                     ["training-exact slots: "++intercalate "," [s | (s,_,_)<-members]] ["post-hoc extraction after search; no feedback into this run"] (length pattern) (1+length params) u step (if uAccepted u then step else -1) Nothing 0 0 (Just (AbsDef pbody (map snd params)))
            onGraph (\g->g {abstractions=abstractions g++[ab]})
            if uAccepted u then do
              modify (\s->s {stNextAbs=n+1, stLibrary=M.insert name (AbsDef pbody (map snd params)) (stLibrary s)})
              inc "posthoc_abstractions_accepted" 1
              traceMsg ("post-hoc wrap "++name++" utility="++show (uTotal u))
              pure [(s,Call name args) | (s,_,args)<-members]
            else pure []
      let table=concat rewrites
          sub s e=fromMaybe e (lookup s table)
      pure def {defBody=Body (sub "first-AX" fx,sub "first-AY" fy) (sub "following-AX" nx,sub "following-AY" ny)}
