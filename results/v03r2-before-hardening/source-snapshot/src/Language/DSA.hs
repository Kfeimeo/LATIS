module Language.DSA where
import Latent.Grid
import Latent.Object
import qualified Data.Set as S

data Operator = IdentityOp | TranslateOp | Rotate90Op | Rotate180Op | Rotate270Op | ReflectHOp | ReflectVOp | RecolorOp
  deriving (Eq, Ord, Show, Read, Enum, Bounded)
operatorName :: Operator -> String
operatorName IdentityOp = "identity"
operatorName TranslateOp = "Translate"
operatorName Rotate90Op = "Rotate90"
operatorName Rotate180Op = "Rotate180"
operatorName Rotate270Op = "Rotate270"
operatorName ReflectHOp = "ReflectH"
operatorName ReflectVOp = "ReflectV"
operatorName RecolorOp = "Recolor"
fixedTransform :: Operator -> Object -> Either String Object
fixedTransform IdentityOp = Right
fixedTransform Rotate90Op = Right . rotate90
fixedTransform Rotate180Op = Right . rotate180
fixedTransform Rotate270Op = Right . rotate270
fixedTransform ReflectHOp = Right . reflectH
fixedTransform ReflectVOp = Right . reflectV
fixedTransform _ = const (Left "Parameterized primitive needs a typed hole")
sameShape, sameColor, leftOf, rightOf, above, below, touch4, touch8 :: Object -> Object -> Bool
sameShape a b = shape a == shape b
sameColor a b = colors a == colors b
leftOf a b = cx (br a) < cx (tl b)
rightOf = flip leftOf
above a b = cy (br a) < cy (tl b)
below = flip above
touch4 = touch (\dx dy -> abs dx+abs dy == 1)
touch8 = touch (\dx dy -> max (abs dx) (abs dy) == 1)
touch :: (Int -> Int -> Bool) -> Object -> Object -> Bool
touch metric a b = or [metric (cx p-cx q) (cy p-cy q) | (p,_) <- absolutePixels a, (q,_) <- absolutePixels b]
displacement :: Object -> Object -> Vec
displacement a b = difference (tl b) (tl a)
allOperators :: [Operator]
allOperators = [minBound..maxBound]
operatorEffects :: Operator -> S.Set String
operatorEffects IdentityOp = S.empty
operatorEffects TranslateOp = S.singleton "position"
operatorEffects RecolorOp = S.singleton "appearance"
operatorEffects _ = S.fromList ["orientation","geometry"]
