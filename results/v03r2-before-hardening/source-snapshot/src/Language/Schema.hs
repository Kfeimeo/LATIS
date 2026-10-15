{-# LANGUAGE GADTs #-}
module Language.Schema where
import Language.Effect
import Language.Types
import Synthesis.Hole
import Data.Type.Equality ((:~:)(Refl))
import qualified Data.Set as S

data Slot = Slot { slotName :: String, slotType :: String } deriving (Eq, Show)
data Primitive = Primitive
  { primitiveName :: String, primitiveType :: String, forwardSemantics :: String
  , effectSignature :: Effect, synthesisSchema :: [Slot], witnessName :: Maybe String
  } deriving (Eq, Show)

registry :: [Primitive]
registry = ml ++ observers ++ relations ++ transforms ++ sceneOps
  where
    pureP n t sem slots = Primitive n t sem S.empty slots Nothing
    ml = [pureP n t sem (mlSlots n) | (n,t,sem) <-
      [("lambda","(a -> b) -> Fn a b","typed lexical closure"), ("application","Fn a b -> a -> b","apply typed closure")
      ,("composition","Fn b c -> Fn a b -> Fn a c","Kleisli composition, propagating failure")
      ,("map","Fn a b -> List a -> List b","independent list transformation")
      ,("filter","Fn a Bool -> List a -> List a","stable predicate subset")
      ,("sortBy","Fn a Int -> List a -> List a","stable ascending sort")
      ,("scan","Fn (s,a) s -> s -> List a -> List s","includes initial accumulator")
      ,("fold","Fn (s,a) s -> s -> List a -> s","left fold")
      ,("if","Bool -> a -> a -> a","lazy selected branch")
      ,("add","Int -> Int -> Int","integer addition"),("subtract","Int -> Int -> Int","integer subtraction")
      ,("multiply","Int -> Int -> Int","integer multiplication"),("less","Int -> Int -> Bool","integer ordering")
      ,("equalInt","Int -> Int -> Bool","integer equality"),("not","Bool -> Bool","Boolean negation")
      ,("tuple","a -> b -> (a,b)","pair construction"),("first","(a,b) -> a","first projection")
      ,("second","(a,b) -> b","second projection"),("list","List a -> List a","typed list construction")
      ,("head","List a -> a","fails on empty list"),("tail","List a -> List a","fails on empty list")
      ,("index","List a -> Int -> a","checked zero-based indexing"),("length","List a -> Int","list length")
      ,("argmin","Fn a Int -> List a -> a","first minimal key; empty fails")
      ,("argmax","Fn a Int -> List a -> a","first maximal key; empty fails")
      ,("iterateWhile","Nat -> Fn s Bool -> Fn s s -> s -> s","bounded transition; fuel required")]]
    mlSlots n = case n of
      "lambda" -> [Slot "body" "a -> b"]
      "application" -> [Slot "function" "Fn a b",Slot "argument" "a"]
      "composition" -> [Slot "after" "Fn b c",Slot "before" "Fn a b"]
      "map" -> [Slot "function" "Fn a b",Slot "list" "List a"]
      "filter" -> [Slot "predicate" "Fn a Bool",Slot "list" "List a"]
      "sortBy" -> [Slot "key" "Fn a Int",Slot "list" "List a"]
      "scan" -> accumulatorSlots
      "fold" -> accumulatorSlots
      "if" -> [Slot "condition" "Bool",Slot "then" "a",Slot "else" "a"]
      "tuple" -> [Slot "first" "a",Slot "second" "b"]
      "first" -> [Slot "tuple" "(a,b)"]
      "second" -> [Slot "tuple" "(a,b)"]
      "list" -> [Slot "elements" "List a"]
      "head" -> [Slot "list" "List a"]
      "tail" -> [Slot "list" "List a"]
      "index" -> [Slot "list" "List a",Slot "index" "Int"]
      "length" -> [Slot "list" "List a"]
      "argmin" -> [Slot "key" "Fn a Int",Slot "list" "List a"]
      "argmax" -> [Slot "key" "Fn a Int",Slot "list" "List a"]
      "not" -> [Slot "value" "Bool"]
      "iterateWhile" -> [Slot "fuel" "Nat",Slot "predicate" "Fn s Bool",Slot "step" "Fn s s",Slot "state" "s"]
      _ -> [Slot "left" "Int",Slot "right" "Int"]
    accumulatorSlots = [Slot "step" "Fn (s,a) s",Slot "initial" "s",Slot "list" "List a"]
    observers = [pureP n t sem [Slot "object" "Object"] | (n,t,sem) <-
      [("TL","Object -> Coord","inclusive top-left"),("TR","Object -> Coord","inclusive top-right")
      ,("BL","Object -> Coord","inclusive bottom-left"),("BR","Object -> Coord","inclusive bottom-right")
      ,("Center","Object -> Coord","integer lattice center, round toward TL")
      ,("width","Object -> Int","bounding width"),("height","Object -> Int","bounding height")
      ,("bbox","Object -> BBox","inclusive bounding box"),("color","Object -> Maybe Color","uniform color if singleton")
      ,("position","Object -> Coord","top-left placement"),("shape","Object -> Shape","uncolored local occupied cells")
      ,("size","Object -> Int","number of occupied cells")]]
    relations = [pureP n t sem [Slot "left" "Object",Slot "right" "Object"] | (n,t,sem) <-
      [("sameShape","Object -> Object -> Bool","normalized occupied cells equal")
      ,("sameColor","Object -> Object -> Bool","color sets equal")
      ,("leftOf","Object -> Object -> Bool","strict disjoint bbox horizontal ordering")
      ,("rightOf","Object -> Object -> Bool","reverse leftOf")
      ,("above","Object -> Object -> Bool","strict disjoint bbox vertical ordering")
      ,("below","Object -> Object -> Bool","reverse above")
      ,("touch4","Object -> Object -> Bool","occupied cells at Manhattan distance 1")
      ,("touch8","Object -> Object -> Bool","occupied cells at Chebyshev distance 1")
      ,("displacement","Object -> Object -> Vec","TL(right) - TL(left)")]]
    transforms =
      [Primitive "Translate" "Object -> Vec -> Object" "add vector to placement" (S.singleton Position)
        [Slot "object" "Object",Slot "vec" "Vec"] (Just "TL(target)-TL(source)")
      ,Primitive "Recolor" "Object -> Color -> Object" "replace all occupied-cell colors" (S.singleton Appearance)
        [Slot "object" "Object",Slot "color" "Color"] (Just "uniform target color")]
      ++ [Primitive n "Object -> Object" sem (S.fromList [Orientation,Geometry]) [Slot "object" "Object"] (Just "finite forward geometry check")
         | (n,sem) <- [("Rotate90","clockwise about local bbox, TL fixed"),("Rotate180","two clockwise turns")
           ,("Rotate270","three clockwise turns"),("ReflectH","reverse local x axis"),("ReflectV","reverse local y axis")]]
    sceneOps =
      [pureP "identity" "a -> a" "return argument" [Slot "value" "a"]
      ,pureP "Objects" "Scene -> List Object" "ordered scene object list" [Slot "scene" "Scene"]
      ,pureP "GridTL" "Scene -> Coord" "canvas origin (0,0)" [Slot "scene" "Scene"]
      ,pureP "GridBR" "Scene -> Coord" "inclusive canvas bottom-right" [Slot "scene" "Scene"]
      ,pureP "subtractCoord" "Coord -> Coord -> Vec" "coordinate difference" [Slot "left" "Coord",Slot "right" "Coord"]
      ,pureP "coordX" "Coord -> Int" "column index" [Slot "coord" "Coord"]
      ,pureP "coordY" "Coord -> Int" "row index" [Slot "coord" "Coord"]
      ,pureP "negate" "Int -> Int" "integer negation" [Slot "value" "Int"]
      ,pureP "true" "Bool" "constant true" []
      ,pureP "bboxUnion" "BBox -> Object -> BBox" "minimal bounding box containing both inputs" [Slot "accumulator" "BBox",Slot "object" "Object"]
      ,Primitive "solidRectangle" "BBox -> Color -> Object" "fill bbox with uniform color" (S.fromList [Geometry,Population]) [Slot "bbox" "BBox",Slot "color" "Color"] Nothing]

primitiveTable :: String
primitiveTable = "| Symbol | Type | Forward semantics | Effect | Synthesis schema | Witness |\n|---|---|---|---|---|---|\n" ++ concatMap row registry
  where row p = "| " ++ primitiveName p ++ " | `" ++ primitiveType p ++ "` | " ++ forwardSemantics p ++ " | " ++ show (S.toList (effectSignature p)) ++ " | " ++ show (synthesisSchema p) ++ " | " ++ maybe "-" id (witnessName p) ++ " |\n"

-- Bind the already-corresponded object slot, then instantiate parameter slots
-- from the primitive's schema. Existential holes are checked with type equality
-- before witness constraints can be attached.
instantiateSchema :: Primitive -> Either Eligibility [SomeHole]
instantiateSchema primitive = traverse instantiate
  [slot | slot <- synthesisSchema primitive, slotName slot /= "object"]
  where instantiate (Slot name "Vec") = Right (SomeHole (Hole name TVec []))
        instantiate (Slot name "Color") = Right (SomeHole (Hole name TInt []))
        instantiate slot = Left (CurrentlyUnsupported ("No task-local parameter grammar for "++slotType slot))
bindWitnessSchema :: Primitive -> Ty a -> [Constraint a] -> Either Eligibility (Hole a)
bindWitnessSchema primitive expected cs = do
  holes <- instantiateSchema primitive
  case holes of
    [SomeHole h] -> case eqTy expected (holeType h) of
      Just Refl -> Right h {constraints=cs}
      Nothing -> Left (ProvenImpossible "primitive parameter type mismatch")
    _ -> Left (CurrentlyUnsupported "expected a single parameter slot after object binding")
