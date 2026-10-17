module Language.Effect where
import qualified Data.Set as S

data Field = Position | Geometry | Orientation | Appearance | Population | Canvas
  deriving (Eq, Ord, Show, Read, Enum, Bounded)
type Effect = S.Set Field
data Eligibility = ProvenImpossible String | CurrentlyUnsupported String | Eligible
  deriving (Eq, Show)

-- A one-step operator that cannot write a required field cannot satisfy this
-- residual. Extra effects are not impossible: symmetric shapes can be invariant.
-- Unsupported operators are retained as diagnostics, never hard-pruned proofs.
eligibility :: Effect -> Effect -> Eligibility
eligibility required writes
  | required `S.isSubsetOf` writes = Eligible
  | otherwise = ProvenImpossible ("cannot modify " ++ show (S.toList (required S.\\ writes)))
