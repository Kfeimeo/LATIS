module Synthesis.Skeleton where
import Latent.Grid
import Latent.Object
import Language.DSA
import Language.ML (Expr(..),eval)
import Language.Types
import Synthesis.Hole
import Data.List (sortOn)
import qualified Data.Map.Strict as M
import qualified Data.Set as S

data Order = ExtractionOrder | LeftToRight | TopToBottom | ByColor | BySize | RightToLeft
  deriving (Eq, Ord, Show, Read, Enum, Bounded)
allOrders :: [Order]
allOrders = [LeftToRight,TopToBottom,ByColor,BySize,ExtractionOrder,RightToLeft]
orderObjects :: Order -> [Object] -> [Object]
orderObjects ExtractionOrder = id
orderObjects LeftToRight = sortOn (cx . tl)
orderObjects RightToLeft = sortOn (negate . cx . tl)
orderObjects TopToBottom = sortOn (cy . tl)
orderObjects ByColor = sortOn (maybe (-1) id . color)
orderObjects BySize = sortOn size

data Action = Fixed Operator | Move (Param Vec) | Paint (Param Int) | Chain Action Action
instance Show Action where show = actionText
actionText :: Action -> String
actionText (Fixed op) = operatorName op ++ "(current)"
actionText (Move p) = "Translate(current, " ++ paramText p ++ ")"
actionText (Paint p) = "Recolor(current, " ++ paramText p ++ ")"
actionText (Chain a b) = "compose(" ++ actionText b ++ ", " ++ actionText a ++ ")"
runAction :: Action -> Context -> Either String Object
runAction (Fixed op) c = fixedTransform op (current c)
runAction (Move p) c = translate (current c) <$> evalParam c p
runAction (Paint p) c = do n <- evalParam c p; if n < 0 || n > 9 then Left "invalid color" else Right (recolor (current c) n)
runAction (Chain a b) c = do o <- runAction a c; runAction b c {current=o}
actionOperator :: Action -> Operator
actionOperator (Fixed op) = op
actionOperator (Move _) = TranslateOp
actionOperator (Paint _) = RecolorOp
actionOperator (Chain _ b) = actionOperator b
actionPrevious :: Action -> Bool
actionPrevious (Move p) = usesPrevious p
actionPrevious (Paint p) = usesPrevious p
actionPrevious (Chain a b) = actionPrevious a || actionPrevious b
actionPrevious _ = False

data Predicate = HasColor Int | SizeAtLeast Int | WidthAtLeast Int | HeightAtLeast Int
  deriving (Eq, Ord, Show)
predicate :: Predicate -> Object -> Bool
predicate (HasColor c) o = color o == Just c
predicate (SizeAtLeast n) o = size o >= n
predicate (WidthAtLeast n) o = width o >= n
predicate (HeightAtLeast n) o = height o >= n

data Program = IdentityP | MapP Order Action | ScanP Order Action Action | FilterP Predicate
  | FoldBBoxP | IterateP Int Vec
instance Show Program where show = programText
programText :: Program -> String
programText IdentityP = "identity(scene)"
programText (MapP order action) = "map(lambda current: " ++ actionText action ++ ", sortBy(" ++ show order ++ ", objects))"
programText (ScanP order start step) = "objects = sortBy(" ++ show order ++ ", objects)\nStart = lambda current: " ++ actionText start ++ "\nAttach = lambda prev,current: " ++ actionText step ++ "\nscan(Attach, Start(head(objects)), tail(objects))"
programText (FilterP p) = "filter(" ++ show p ++ ", objects)"
programText FoldBBoxP = "fold(bboxUnion, bbox(head(objects)), tail(objects)) |> solidRectangle"
programText (IterateP fuel v) = "iterateWhile(" ++ show fuel ++ ", true, map(Translate(_," ++ show v ++ ")), scene)"

runProgram :: Program -> Scene -> Either String Scene
runProgram IdentityP z = Right z
runProgram (MapP order action) z = do
  let os = orderObjects order (objects z)
      f = Fn (\o -> runAction action (Context o Nothing (canvas z)))
  placed <- eval (Map (Value (TFn TObject TObject) f) (Value (TList TObject) os))
  pure z {objects=placed}
runProgram (ScanP order start step) z = case orderObjects order (objects z) of
  [] -> Right z
  o:os -> do
    initial <- runAction start (Context o Nothing (canvas z))
    let f = Fn (\(prev,obj) -> runAction step (Context obj (Just prev) (canvas z)))
    placed <- eval (Scan (Value (TFn (TPair TObject TObject) TObject) f) (Value TObject initial) (Value (TList TObject) os))
    pure z {objects=placed}
runProgram (FilterP p) z = do
  kept <- eval (Filter (Value (TFn TObject TBool) (Fn (Right . predicate p))) (Value (TList TObject) (objects z)))
  pure z {objects=kept}
runProgram FoldBBoxP z = case objects z of
  [] -> Left "fold: empty object list"
  o:os -> do
    c <- maybe (Left "fold: nonuniform color") Right (color o)
    if any ((/= Just c) . color) os then Left "fold: unequal colors" else do
      let combine (BBox (Coord x y) (Coord a b), obj) =
            let BBox (Coord u v) (Coord s t) = bbox obj
            in Right (BBox (Coord (min x u) (min y v)) (Coord (max a s) (max b t)))
      BBox origin corner <- eval (Fold (Value (TFn (TPair TBBox TObject) TBBox) (Fn combine)) (Value TBBox (bbox o)) (Value (TList TObject) os))
      let geom = M.fromList [(Coord x y,c) | y <- [0..cy corner-cy origin], x <- [0..cx corner-cx origin]]
      pure z {objects=[Object (objectId o) origin geom 0]}
runProgram (IterateP fuel v) z =
  eval (IterateWhile (Value TInt fuel) (Value (TFn TScene TBool) (Fn (const (Right True))))
    (Value (TFn TScene TScene) (Fn (\s -> runProgram (MapP ExtractionOrder (Move (ConstantVector v))) s))) (Value TScene z))

data Skeleton = MapSkeleton Order | ScanSkeleton Order | FilterSkeleton | FoldSkeleton | IterateSkeleton Int Vec
  deriving (Eq, Ord, Show)

actionSymbols :: Action -> S.Set String
actionSymbols (Fixed IdentityOp) = S.singleton "identity"
actionSymbols (Fixed op) = S.singleton (operatorName op)
actionSymbols (Move p) = S.insert "Translate" (paramSymbols p)
actionSymbols (Paint p) = S.insert "Recolor" (paramSymbols p)
actionSymbols (Chain a b) = S.insert "composition" (actionSymbols a `S.union` actionSymbols b)
actionLength :: Action -> Int
actionLength (Move p) = 2 + paramLength p
actionLength (Paint p) = 2 + paramLength p
actionLength (Chain a b) = 1 + actionLength a + actionLength b
actionLength _ = 2
