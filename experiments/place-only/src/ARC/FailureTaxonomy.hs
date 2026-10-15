module ARC.FailureTaxonomy where
import ARC.Dataset
import Synthesis.Hierarchical
import Synthesis.Joint
import Synthesis.Constraint.Metrics
import Synthesis.Search (SearchConfig(..))
import Latent.Encode
import Latent.Grid
import Latent.Object
import Latent.Correspondence
import qualified Data.Set as S

data Failure = Solved | RepresentationFailureLevel0 | RepresentationFailureLevel1
  | LanguageFailure | SearchFailure | AmbiguityFailure | BudgetFailure
  | VerifierOrImplementationFailure deriving (Eq,Ord,Show,Enum,Bounded)
failureName :: Failure -> String
failureName RepresentationFailureLevel0 = "RepresentationFailure-Level0"
failureName RepresentationFailureLevel1 = "RepresentationFailure-Level1"
failureName f = show f
-- Certificates are conservative, operational claims about the bounded
-- fragment. They are not ground-truth explanations of human ARC intent.
classify :: SearchConfig -> Task -> HierarchicalResult -> Bool -> Bool -> (Failure,String)
classify config task r trainExact testExact
  | trainExact && testExact = (Solved,"Selected program exact on every training and heldout grid")
  | hasRoute && not trainExact = (VerifierOrImplementationFailure,"Selected hypothesis failed independent training-grid re-verification")
  | trainExact = (AmbiguityFailure,"A training-exact hypothesis failed heldout; competing ASTs are recorded. This is observational ambiguity, not a proof that a correct heldout rule is in the grammar")
  | hitBudget (hierarchicalMetrics r) || correspondenceClipped = (BudgetFailure,"State/solution/correspondence bound reached; no impossibility claim")
  | resized = (LanguageFailure,"Canvas dimensions change; all preserved pose/operator programs keep the canvas")
  | splitCertificate = (RepresentationFailureLevel0,"Output separates same-color subsets of a single input component at fixed pixel coordinates: component split required by the supported object correspondence path")
  | purePoseSupported = (RepresentationFailureLevel1,"One-to-one unchanged geometry/color pose correspondence exists, but no shared expression in the bounded secondary coordinate grammar survived; classification limited to this pose fragment")
  | otherwise = (LanguageFailure,"No exact rule in the searched finite operator/pose language; no certificate to distinguish richer transformation language from split/union/occlusion. Canonical Grid round-trip still holds")
  where
    hasRoute=case selectedRoute r of Just _->True; _->False
    latent=[(encode (encoder config) x,encode (encoder config) y) | (x,y)<-training task]
    resized=any (\(x,y)->dimensions x/=dimensions y) (training task)
    graphs=[correspond (correspondenceBudget config) x y | (x,y)<-latent]
    correspondenceClipped=any truncated graphs || stoppedAtSolutionLimit (jointMetrics (level0Result r))
    purePoseSupported=not (null graphs) && all (\g->any (\c->null (removed c) && all (\e->geometry (sourceObject e)==geometry (targetObject e)) (matched c)) (branches g)) graphs
    splitCertificate=any separated latent
    separated (x,y)=any (hasParts y) (objects x)
    hasParts y a = length parts>=2 && S.unions (map (S.fromList . absolutePixels) parts) `S.isProperSubsetOf` pixels
      where pixels=S.fromList (absolutePixels a)
            parts=[b | b<-objects y,not (S.null (S.fromList (absolutePixels b))),S.fromList (absolutePixels b) `S.isProperSubsetOf` pixels]
