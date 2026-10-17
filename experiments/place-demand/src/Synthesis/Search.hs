module Synthesis.Search where
import Latent.Grid
import Latent.Object
import Latent.Encode
import Latent.Correspondence
import Language.DSA
import Language.Effect
import Language.Types
import Language.Schema
import Language.Witness
import Synthesis.Hole
import Synthesis.Residual
import Synthesis.Dependency
import Synthesis.Skeleton
import Synthesis.Verify
import Synthesis.MDL
import qualified Data.Set as S
import Data.List (minimumBy, find)
import Data.Ord (comparing)
import GHC.Clock (getMonotonicTimeNSec)
import Control.Exception (evaluate)
import Data.Word (Word64)

data Mode = Full | NoEffect | NoDependency | NoWitness | Direct
  deriving (Eq,Ord,Show,Read,Enum,Bounded)
data SearchConfig = SearchConfig
  { searchMode :: Mode, encoder :: EncoderConfig, stateBudget :: Int
  , correspondenceBudget :: Int, constantRadius :: Int, solutionLimit :: Int
  } deriving (Eq,Show)
defaultSearch :: SearchConfig
defaultSearch = SearchConfig Full defaultEncoder 1000000 256 2 128

data Pruning = Pruning { opportunities :: !Int, rejected :: !Int } deriving (Eq,Show)
data Stats = Stats
  { expandedStates :: !Int, completePrograms :: !Int, partialSkeletons :: !Int
  , maximumDepth :: !Int, firstSolutionStates :: Maybe Int, firstSolutionSeconds :: Maybe Double
  , wallSeconds :: !Double, witnessResolvedHoles :: !Int, enumeratedHoles :: !Int
  , dependencyRelationChecks :: !Int
  , typePruning :: Pruning, effectPruning :: Pruning, dependencyPruning :: Pruning, witnessPruning :: Pruning
  , validPrograms :: !Int, budgetExhausted :: !Bool
  } deriving (Eq,Show)
emptyStats :: Stats
emptyStats = Stats 0 0 0 0 Nothing Nothing 0 0 0 0 (Pruning 0 0) (Pruning 0 0) (Pruning 0 0) (Pruning 0 0) 0 False
data SearchResult = SearchResult
  { solution :: Maybe Program, statistics :: Stats, synthesisTrace :: [String]
  , limitations :: [String]
  }

data Counts = Counts { holeChecks :: !Int, holeRejects :: !Int, resolved :: !Int, enumHoles :: !Int }
  deriving (Eq,Show)
zeroCounts :: Counts
zeroCounts = Counts 0 0 0 0
plusCounts :: Counts -> Counts -> Counts
plusCounts (Counts a b c d) (Counts e f g h) = Counts (a+e) (b+f) (c+g) (d+h)

opEffects :: Operator -> Effect
opEffects op = maybe S.empty effectSignature (find ((==operatorName op) . primitiveName) registry)

-- Independent typed holes are solved using all object instances, then composed.
-- NoWitness keeps their Cartesian product until exact grid verification.
actionChoices :: SearchConfig -> Bool -> [ObjectExample] -> Operator -> ([Action],Counts)
actionChoices config allowPrev examples op
  | searchMode config == NoWitness || searchMode config == Direct =
      let actions = rawActions config allowPrev op
      in (actions,zeroCounts {enumHoles=if op `elem` [TranslateOp,RecolorOp] then 1 else 0})
  | otherwise = case op of
      TranslateOp -> case traverse (uncurry translateWitness) examples of
        Left _ -> ([],Counts 1 1 0 0)
        Right cs -> case schemaName TranslateOp TVec cs >>= (\name -> translationHole name cs) of
          Left _ -> ([],Counts 1 1 0 0)
          Right hole ->
            let (ps,n,r) = resolveHole hole (witnessVectorGrammar cs allowPrev)
            in (map Move ps,Counts n r (if null ps then 0 else length cs) 0)
      RecolorOp -> case traverse (uncurry recolorWitness) examples of
        Left _ -> ([],Counts 1 1 0 0)
        Right cs -> case schemaName RecolorOp TInt cs >>= (\name -> colorHole name cs) of
          Left _ -> ([],Counts 1 1 0 0)
          Right hole ->
            let (ps,n,r) = resolveHole hole (witnessColorGrammar cs allowPrev)
            in (map Paint ps,Counts n r (if null ps then 0 else length cs) 0)
      _ -> if all (\(c,t) -> fixedWitness op (current c) t) examples
           then ([Fixed op],Counts 1 0 0 0) else ([],Counts 1 1 0 0)

schemaName :: Operator -> Ty a -> [Constraint a] -> Either String String
schemaName op ty cs = case find ((==operatorName op) . primitiveName) registry of
  Nothing -> Left (show (CurrentlyUnsupported "unregistered primitive"))
  Just p -> case bindWitnessSchema p ty cs of
    Left status -> Left (show status)
    Right hole -> Right (holeName hole)

rawActions :: SearchConfig -> Bool -> Operator -> [Action]
rawActions config allowPrev TranslateOp = map Move (vectorGrammar (constantRadius config) allowPrev)
rawActions _ allowPrev RecolorOp = map Paint (colorGrammar allowPrev)
rawActions _ _ op = [Fixed op]

filterGrammar :: [Predicate]
filterGrammar = map HasColor [0..9] ++ map SizeAtLeast [1..30] ++ map WidthAtLeast [1..30] ++ map HeightAtLeast [1..30]

data Work = Work Skeleton [Program] Counts Int Int
makeWork :: SearchConfig -> [LatentExample] -> Skeleton -> Work
makeWork config examples skeleton = case skeleton of
  MapSkeleton order ->
    let specs = mapExamples order examples
        required = residual [(current c,t) | (c,t) <- specs]
        options = [(op,gate required op) | op <- allOperators]
        allowed = [op | (op,True) <- options]
        choices = [actionChoices config False specs op | op <- allowed]
    in Work skeleton [MapP order a | (as,_) <- choices, a <- as]
         (foldl plusCounts zeroCounts (map snd choices)) (length options) (length options-length allowed)
  ScanSkeleton order ->
    let (starts,steps) = scanExamples order examples
        reqStart = residual [(current c,t) | (c,t) <- starts]
        reqStep = residual [(current c,t) | (c,t) <- steps]
        optsA = [(op,gate reqStart op) | op <- allOperators]
        optsB = [(op,gate reqStep op) | op <- allOperators]
        choicesA = [actionChoices config False starts op | (op,True) <- optsA]
        choicesB = [actionChoices config True steps op | (op,True) <- optsB]
        counts = foldl plusCounts zeroCounts (map snd (choicesA++choicesB))
        as = concatMap fst choicesA
        bs = concatMap fst choicesB
    in Work skeleton [ScanP order a b | a <- as, b <- bs] counts (length optsA+length optsB)
         (length (filter (not . snd) (optsA++optsB)))
  FilterSkeleton -> Work skeleton (map FilterP filterGrammar) zeroCounts 0 0
  FoldSkeleton -> Work skeleton [FoldBBoxP] zeroCounts 0 0
  IterateSkeleton n v -> Work skeleton [IterateP n v] zeroCounts 0 0
  where
    gate required op
      | searchMode config `elem` [NoEffect,Direct] = True
      | otherwise = case eligibility required (opEffects op) of ProvenImpossible _ -> False; _ -> True

-- Direct baseline: a bounded object-program enumerator over the same finite
-- grammar, with no output-derived matching, effects, dependencies, or witnesses.
-- It enumerates complete Cartesian programs; it is deliberately not LATIS's
-- primary solver. This empty repository had no pre-existing baseline to invoke.
directWork :: SearchConfig -> [Work]
directWork config = [Work (MapSkeleton o) [MapP o a | a <- startActions] zeroCounts {enumHoles=2} 0 0 | o <- allOrders]
  ++ [Work FilterSkeleton (map FilterP filterGrammar) zeroCounts 0 0, Work FoldSkeleton [FoldBBoxP] zeroCounts 0 0]
  ++ [Work (ScanSkeleton o) [ScanP o a b | a <- startActions, b <- stepActions] zeroCounts {enumHoles=4} 0 0 | o <- allOrders]
  ++ [Work sk [IterateP n v] zeroCounts {enumHoles=2} 0 0 | sk@(IterateSkeleton n v) <- blindIterationSkeletons]
  where
    startActions = concatMap (rawActions config False) allOperators
    stepActions = concatMap (rawActions config True) allOperators

search :: SearchConfig -> [TrainingPair] -> IO SearchResult
search config pairs = do
  begin <- getMonotonicTimeNSec
  let prepared = [(encode (encoder config) x,y) | (x,y) <- pairs]
  if null pairs then pure (SearchResult Nothing emptyStats [] ["No training examples"])
  else if searchMode config == Direct then do
    (valid,stats) <- runWorks begin config prepared [] emptyStats (directWork config)
    finish begin valid stats ["Direct bounded enumeration; no output-derived constraints"] []
  else do
    let latent = [(x,encode (encoder config) y) | (x,y) <- prepared]
        graphs = [correspond (correspondenceBudget config) x y | (x,y) <- latent]
        rawBranches = take (correspondenceBudget config+1) (sequence (map branches graphs))
        combined = take (correspondenceBudget config) rawBranches
        branchClipped = length rawBranches > correspondenceBudget config
        notes = concatMap diagnostics graphs ++ ["CurrentlyUnsupported: cross-example correspondence branch budget exceeded" | branchClipped]
        graphTrace = concat [ ["Pair " ++ show i ++ ": " ++ show (length (objects x)) ++ " input / " ++ show (length (objects y)) ++ " visible output objects",
                           "Correspondence edges=" ++ show (length (edges g)) ++ ", legal branches=" ++ show (length (branches g))]
                         ++ ["  " ++ show (objectId (sourceObject e)) ++ " -> " ++ show (objectId (visibleObject e)) ++
                            "; TL " ++ show (position (sourceObject e)) ++ " -> " ++ show (position (targetObject e)) ++
                            "; full size=" ++ show (size (targetObject e)) ++ "; visible size=" ++ show (size (visibleObject e)) ++
                            "; painted before=" ++ show (S.toList (occludedBy e)) | e <- edges g]
                         | (i,((x,y),g)) <- zip [1::Int ..] (zip latent graphs)]
        extras = detectFold latent ++ detectIteration latent
    edgeCount <- evaluate (sum (map (length . edges) graphs))
    branchCount <- evaluate (length combined)
    let initialStats = emptyStats {expandedStates=edgeCount+branchCount,maximumDepth=2}
        branchExamples = [[(x,y,c) | ((x,y),c) <- zip latent cs] | cs <- combined]
        analyses = [if searchMode config == NoDependency then ([],0) else analyzeDependencies ex | ex <- branchExamples]
        evidence = map fst analyses
        relationChecks = sum (map snd analyses)
        branchWorks = concat [map (makeWork config ex) skeletons | (ex,es) <- zip branchExamples evidence,
           let skeletons = if searchMode config == NoDependency then blindSkeletons else map evidenceSkeleton es]
        extraWorks = [makeWork config [] (evidenceSkeleton e) | e <- extras, searchMode config /= NoDependency]
        potential = length blindSkeletons * branchCount
        accepted = sum (map length evidence)
        depStats = initialStats {dependencyPruning=Pruning potential (if searchMode config == NoDependency then 0 else potential-accepted),
          dependencyRelationChecks=relationChecks,expandedStates=expandedStates initialStats+relationChecks}
        trace = graphTrace ++ ["Residual: " ++ show (S.toList (residual (correspondencePairs c))) | ex <- branchExamples, (_,_,c) <- ex]
                ++ ["Dependency: " ++ show e | es <- evidence, e <- es] ++ ["Dependency: " ++ show e | e <- extras]
    (valid,stats) <- runWorks begin config prepared [] depStats (extraWorks++branchWorks)
    finish begin valid stats trace notes
  where
    finish begin valid stats trace notes = do
      let chosen = case valid of [] -> Nothing; _ -> Just (minimumBy (comparing (totalCost . objective 1 2)) valid)
      -- MDL is applied only after exact training-grid verification.
      _ <- evaluate (maybe 0 programLength chosen)
      end <- getMonotonicTimeNSec
      let unsupported = [show (CurrentlyUnsupported "No exact-valid program in the bounded grammar; composition, segmentation, or a larger parameter grammar may be needed") | null valid, not (budgetExhausted stats)]
      pure (SearchResult chosen stats {wallSeconds=seconds begin end} trace (notes++unsupported))

seconds :: Word64 -> Word64 -> Double
seconds a b = fromIntegral (b-a) / 1e9

runWorks :: Word64 -> SearchConfig -> [(Scene,Grid)] -> [Program] -> Stats -> [Work] -> IO ([Program],Stats)
runWorks _ _ _ valid stats [] = pure (valid,stats)
runWorks begin config pairs valid stats (Work _ programs counts effectN effectR:rest)
  | expandedStates stats >= stateBudget config = pure (valid,stats {budgetExhausted=True})
  | length valid >= solutionLimit config = pure (valid,stats)
  | otherwise = do
      checks <- evaluate (holeChecks counts)
      let Pruning wn wr = witnessPruning stats
          Pruning en er = effectPruning stats
          stats' = stats {expandedStates=expandedStates stats+1+effectN+checks,
            partialSkeletons=partialSkeletons stats+1,maximumDepth=max 6 (maximumDepth stats),
            witnessPruning=Pruning (wn+checks) (wr+holeRejects counts),effectPruning=Pruning (en+effectN) (er+effectR),
            witnessResolvedHoles=witnessResolvedHoles stats+resolved counts,enumeratedHoles=enumeratedHoles stats+enumHoles counts}
      (found,after) <- runPrograms begin config pairs valid stats' programs
      runWorks begin config pairs found after rest

runPrograms :: Word64 -> SearchConfig -> [(Scene,Grid)] -> [Program] -> Stats -> [Program] -> IO ([Program],Stats)
runPrograms _ _ _ valid stats [] = pure (valid,stats)
runPrograms begin config pairs valid stats (p:rest)
  | expandedStates stats >= stateBudget config = pure (valid,stats {budgetExhausted=True})
  | length valid >= solutionLimit config = pure (valid,stats)
  | otherwise = do
      good <- evaluate (verifyLatent pairs p)
      now <- getMonotonicTimeNSec
      let first = good && firstSolutionStates stats == Nothing
          stats' = stats {expandedStates=expandedStates stats+1,completePrograms=completePrograms stats+1,maximumDepth=7,
            validPrograms=validPrograms stats+if good then 1 else 0,
            firstSolutionStates=if first then Just (expandedStates stats+1) else firstSolutionStates stats,
            firstSolutionSeconds=if first then Just (seconds begin now) else firstSolutionSeconds stats}
      runPrograms begin config pairs (if good then p:valid else valid) stats' rest

selectedWitnessTrace :: SearchConfig -> [TrainingPair] -> Program -> [String]
selectedWitnessTrace config pairs p = case p of
  ScanP order start step -> concat [showPair i x y order start step | (i,(x,y)) <- zip [1::Int ..] pairs]
  _ -> []
  where
    showPair i x y order start step =
      let a = encode (encoder config) x; b = encode (encoder config) y
          graph = correspond (correspondenceBudget config) a b
      in case branches graph of
        [] -> []
        c:_ -> let (first,rest) = scanExamples order [(a,b,c)]
               in ["Pair " ++ show i ++ " witness " ++ tag ++ ": object=" ++ show (objectId (current ctx)) ++
                   ", target TL=" ++ show (tl target) ++ ", required Vec=" ++ show (difference (tl target) (tl (current ctx))) ++
                   ", expression=" ++ actionText action
                  | (tag,action,instances) <- [("Start",start,first),("Attach",step,rest)], (ctx,target) <- instances]
