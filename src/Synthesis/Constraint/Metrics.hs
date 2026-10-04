module Synthesis.Constraint.Metrics where

data JointMode = JointConstraint | NoBidirectionalSkeleton | NoWitnessFirst
  | NoLazyContext | NoStructuralDominance | NoMemoization
  deriving (Eq,Ord,Show,Read,Enum,Bounded)
data Metrics = Metrics
  { expanded :: !Int, partialStates :: !Int, verifierCalls :: !Int
  , propagationIterations :: !Int, propagationRuleCalls :: !Int, deterministicSteps :: !Int
  , branchPoints :: !Int, branchAssignments :: !Int, branchDomainTotal :: !Int, maximumBranchDomain :: !Int
  , contextExpansions :: !Int, expressionTests :: !Int, effectQueries :: !Int, witnessQueries :: !Int
  , dependencyBranches :: !Int, skeletonBranches :: !Int, dependenciesDerived :: !Int
  , witnessHoles :: !Int, enumeratedHoles :: !Int, legacyDependencyChecks :: !Int
  , expressionMemoQueries :: !Int, expressionMemoHits :: !Int
  , partialMemoQueries :: !Int, partialMemoHits :: !Int
  , programMemoQueries :: !Int, programMemoHits :: !Int
  , contradictions :: !Int, provenDominance :: !Int
  , firstExpanded :: Maybe Int, firstSeconds :: Maybe Double, totalSeconds :: !Double
  , previousExpansions :: !Int, gridExpansions :: !Int
  , firstPreviousExpansions :: Maybe Int, firstGridExpansions :: Maybe Int
  , firstContextExpansions :: Maybe Int, firstExpressionTests :: Maybe Int
  , expressionDependenciesDerived :: !Int, dependencyEdgesDerived :: !Int
  , exhaustedBudget :: !Bool, stoppedAtSolutionLimit :: !Bool, exhaustive :: !Bool
  } deriving (Eq,Show)

emptyMetrics :: Metrics
emptyMetrics = Metrics 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 Nothing Nothing 0 0 0 Nothing Nothing Nothing Nothing 0 0 False False False
charge :: Int -> Metrics -> Metrics
charge n m = m {expanded=expanded m+n}
