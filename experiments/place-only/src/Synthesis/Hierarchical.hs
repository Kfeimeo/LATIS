module Synthesis.Hierarchical where
import Synthesis.Joint
import Synthesis.Search (SearchConfig(..),seconds)
import Synthesis.Constraint.Metrics
import qualified Synthesis.Constraint.State as Z0
import Synthesis.Skeleton (Program,programText,runProgram)
import Synthesis.Verify
import Synthesis.MDL
import Latent.Encode
import Latent.Grid
import Latent.Object
import Latent.Render
import Latent.Fusion.Context
import Latent.Local.Discover
import Latent.Global.Discover
import Latent.Global.Grammar
import Latent.Program
import Latent.MDL.LatentCost
import Latent.Constraint.Propagate
import qualified Data.Set as S
import Data.List (minimumBy,nubBy)
import Data.Ord (comparing)
import GHC.Clock (getMonotonicTimeNSec)
import Control.Exception (evaluate)

data HierarchicalMode = V03Full | NoLocalLatent | NoGlobalLatent | NoFusion
  | NoLatentMDL | EagerLatentEnumeration | NoProgramToLatent | LatentDisabled
  deriving (Eq,Ord,Show,Read,Enum,Bounded)
data Route = Level0 Program | GroundedReference LatentSpec LatentProgram
  | Secondary LatentSpec LatentProgram
instance Show Route where
  show (Level0 p) = programText p
  show (GroundedReference spec (PlaceEach p)) = "Z0.MapPose("++groundText (expand spec p)++")"
  show (Secondary spec p) = "Encode("++show spec++") -> "++show p++" -> Decode(canonical Scene)"
data Candidate = Candidate
  { candidateSpec :: LatentSpec, candidateProgram :: LatentProgram
  , candidateObjective :: Objective, referenceObjective :: Objective, candidateExact :: Bool }
  deriving Show
data LatentMetrics = LatentMetrics
  { latentProposals :: Int, localProposals :: Int, globalProposals :: Int, fusionProposals :: Int
  , acceptedHypotheses :: Int, rejectedHypotheses :: Int, latentBranchPoints :: Int
  , latentPropagationSteps :: Int, latentContradictions :: Int, decoderFailures :: Int
  , reconstructionFailures :: Int, discoveryChecks :: Int, latentExpressionTests :: Int
  , exactVerifierCalls :: Int, totalExpanded :: Int, firstSolutionStates :: Maybe Int
  , wallClock :: Double, deltaMDL :: Maybe Double, level0Cost :: Maybe Double
  , level1Cost :: Maybe Double, latentSymbols :: Int, symbolsSaved :: Int
  , descriptionsSaved :: Int, hitBudget :: Bool } deriving (Eq,Show)
data HierarchicalResult = HierarchicalResult
  { selectedRoute :: Maybe Route, selectedCost :: Maybe Objective, level0Result :: JointResult
  , hierarchicalState :: HierarchicalState, hierarchicalMetrics :: LatentMetrics
  , hierarchicalTrace :: [String], latentCandidates :: [Candidate] }

routeName :: Route -> String
routeName (Level0 _) = "Z0"
routeName (GroundedReference _ _) = "Z0-reference"
routeName (Secondary (Local _) _) = "ZL"
routeName (Secondary (Global _) _) = "ZG"
routeName (Secondary (Fused _ _) _) = "ZF"
runRoute :: Route -> Scene -> Either String Scene
runRoute (Level0 p) = runProgram p
runRoute (GroundedReference spec (PlaceEach p)) = runGround (expand spec p)
runRoute (Secondary spec p) = runLatent spec p
predictRoute :: EncoderConfig -> Route -> Grid -> Either String Grid
predictRoute config p g = runRoute p (encode config g) >>= render
verifyRoute :: [(Scene,Grid)] -> Route -> Bool
verifyRoute pairs p = not (null pairs) && all (\(x,y) -> (runRoute p x >>= render)==Right y) pairs

proposals :: HierarchicalMode -> [Scene] -> [LatentSpec]
proposals mode scenes = map Local ls++map Global gs++
  [Fused a b | mode/=NoFusion, a<-ls,b<-gs, b==SceneBBox]
  where eager=mode==EagerLatentEnumeration
        ls=if mode==NoLocalLatent || mode==LatentDisabled then [] else if eager then boundedLocal else discoverLocal scenes
        gs=if mode==NoGlobalLatent || mode==LatentDisabled then [] else if eager then boundedGlobal else discoverGlobal scenes

hierarchicalSearch :: HierarchicalMode -> SearchConfig -> [TrainingPair] -> IO HierarchicalResult
hierarchicalSearch mode config pairs = do
  started <- getMonotonicTimeNSec
  let prepared=[(encode (encoder config) x,y) | (x,y)<-pairs]
      scenes=map fst prepared
      eager=proposals mode scenes
      eagerChecks=[(spec,traverse (encodeFusion spec) scenes) | spec<-eager]
      forceEncodings=sum [case value of Left _->1; Right contexts->sum [if reconstruction c then 1 else 2 | c<-contexts] | (_,value)<-eagerChecks] :: Int
  if mode==EagerLatentEnumeration then evaluate forceEncodings >> pure () else pure ()
  baseline <- jointSearch JointConstraint config pairs
  let baseCost=objective 1 2 <$> jointSolution baseline
      costly=maybe True ((>25) . totalCost) baseCost
      trigger=mode/=LatentDisabled && (mode==EagerLatentEnumeration || costly)
      proposed=if trigger then eager else []
      checkCount=if trigger then ((if mode==NoLocalLatent then 0 else length boundedLocal)+
        (if mode==NoGlobalLatent then 0 else length boundedGlobal))*length scenes else 0
      remaining=max 0 (stateBudget config-expanded (jointMetrics baseline)-checkCount)
      considered=take remaining proposed
      checks=if mode==EagerLatentEnumeration then take remaining eagerChecks else
        [(spec,traverse (encodeFusion spec) scenes) | spec<-considered]
      decoded=[(spec,contexts) | (spec,Right contexts)<-checks,all reconstruction contexts]
      failures=length [() | (_,Left _)<-checks]
      decodeErrors=length [() | (_,Right contexts)<-checks,c<-contexts,Left _<-[decodeFusion c]]
      badRoundtrips=length [() | (_,Right contexts)<-checks,c<-contexts,Right z<-[decodeFusion c],z/=canonical c]
      domains=[LatentDomain (LatentHypothesis spec contexts
        [Provenance "DetectLatentRegularity" ["shared encoder structure validated on every training scene",show spec],
         Provenance "ProposeLocalAbstraction / ProposeGlobalAbstraction" ["canonical object/pose observations only; no test output"]] a d)
        (candidatePrograms spec) (S.fromList [PointwisePose,OrderedPoseSequence]) []
        | (spec,contexts)<-decoded,let (a,d)=codecLengths spec]
      initial=HierarchicalState (finalState baseline) domains False
      bundles=nubBy (\a b -> fst a==fst b) [(Z0.branchId f,Z0.frameExamples f) | f<-Z0.partialProgram (finalState baseline),not (null (Z0.frameExamples f))]
      (fixed,work)=propagateToFixpoint (mode/=NoProgramToLatent) (map snd bundles) initial
      branchList=[(hypothesisSpec (hypothesis d),p) | d<-activeHypotheses fixed,p<-expressionDomain d]
      usedBefore=expanded (jointMetrics baseline)+checkCount+length considered*length scenes+expressionChecks work
      available=max 0 (stateBudget config-usedBefore)
      frontier=take (available `div` 2) branchList
      assess (spec,p)=do
        exact<-evaluate (verifyRoute prepared (Secondary spec p))
        refExact<-evaluate (verifyRoute prepared (GroundedReference spec p))
        pure (Candidate spec p (latentObjective (mode==NoLatentMDL) spec p) (groundObjective spec p) (exact && refExact))
  candidates<-traverse assess frontier
  ended<-getMonotonicTimeNSec
  let valid=filter candidateExact candidates
      z0Options=maybe [] (\p -> [(Level0 p,objective 1 2 p)]) (jointSolution baseline)++
        [(GroundedReference (candidateSpec c) (candidateProgram c),referenceObjective c) | c<-valid]
      z0=best z0Options
      j0=totalCost . snd <$> z0
      higherOptions=[(Secondary (candidateSpec c) (candidateProgram c),candidateObjective c) | c<-valid,
        maybe True (totalCost (candidateObjective c)<) j0]
      chosen=best (maybe [] pure z0++higherOptions)
      secondaryChosen=case chosen of Just (Secondary _ _,_)->True; _->False
      lowestHigher=best [(Secondary (candidateSpec c) (candidateProgram c),candidateObjective c) | c<-valid]
      j1=totalCost . snd <$> lowestHigher
      accepted=if secondaryChosen then 1 else 0
      total=usedBefore+2*length frontier
      isBudget=exhaustedBudget (jointMetrics baseline) || length considered<length proposed || length frontier<length branchList
      symbols=case chosen of Just (Secondary s (PlaceEach p),_)->S.size (codecSymbols s `S.union` exprSymbols p); _->0
      savings=case (z0,chosen) of (Just (_,a),Just (_,b)) | secondaryChosen -> symbolKinds a-symbolKinds b; _->0
      lSavings=case (z0,chosen) of (Just (_,a),Just (_,b)) | secondaryChosen -> descriptionLength a-descriptionLength b; _->0
      first=case firstExpanded (jointMetrics baseline) of
        Just n->Just (n+if mode==EagerLatentEnumeration then length proposed*length scenes else 0)
        Nothing->case [i | (i,c)<-zip [1..] candidates,candidateExact c] of i:_->Just (usedBefore+2*i); _->Nothing
      metrics=LatentMetrics (length considered) (length [() | Local _<-considered]) (length [() | Global _<-considered])
        (length [() | Fused _ _<-considered]) accepted (length considered-accepted)
        (if length frontier>1 then 1 else 0) (propagationRounds work) (emptyHypotheses work) decodeErrors badRoundtrips
        checkCount (expressionChecks work) (verifierCalls (jointMetrics baseline)+2*length candidates) total first
        (seconds started ended) ((-) <$> j0 <*> j1) j0 j1 symbols savings lSavings isBudget
      trace=["Z0 canonical scenes="++show scenes,"Level-0 synthesis="++maybe "none" programText (jointSolution baseline),
        "Level-0 legacy cost="++show baseCost,
        "Latent discovery trigger="++if not trigger then "none: cheap exact Z0 retained" else if mode==EagerLatentEnumeration then "eager bounded grammar before Z0 (ablation)" else "Z0 absent or cost >25; inspect repeated relational / structural constraints"]++
        ["Proposed A / D / Z / C / L: "++show (hypothesis d) | d<-domains]++
        ["Decoder/reconstruction: "++show (length decoded)++" exact canonical Scene reconstructions; encoder guard rejections="++show failures++" decoder failures="++show decodeErrors++" reconstruction failures="++show badRoundtrips]++
        propagationTrace work++
        ["Rejected representation "++show spec++": encoder guard not shared across training scenes" | (spec,Left _)<-checks]++
        ["Exact verifier / MDL comparison: "++show c | c<-candidates]++
        ["DetectLatentDominance: only exact-valid candidates compete; secondary requires strict J1<J0, or absent Z0",
         "Z0 expanded reference cost="++show j0++"; Z1 cost="++show j1++"; DeltaMDL="++show (deltaMDL metrics),
         "Selected representation="++maybe "none" (routeName . fst) chosen,
         "Final program="++maybe "none" (show . fst) chosen,
         "Training exact="++show (maybe False (verifyRoute prepared . fst) chosen),
         "Heldout outputs are inaccessible to synthesis; evaluation runs after selection",
         "Cross-latent iterative propagation="++crossLatentPropagation]
  pure (HierarchicalResult (fst <$> chosen) (snd <$> chosen) baseline fixed metrics trace candidates)
  where best []=Nothing
        best xs=Just (minimumBy (comparing (\(r,c)->(totalCost c,show r))) xs)
