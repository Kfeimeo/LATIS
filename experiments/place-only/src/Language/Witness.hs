module Language.Witness where
import Latent.Grid
import Latent.Object
import Synthesis.Hole
import Language.DSA
import Language.Types (Ty(TVec,TInt))

translateWitness :: Context -> Object -> Either String (Constraint Vec)
translateWitness c target
  | geometry (current c) /= geometry target = Left "Translate cannot satisfy geometry/appearance specification"
  | otherwise = Right (Constraint c (difference (tl target) (tl (current c))))
recolorWitness :: Context -> Object -> Either String (Constraint Int)
recolorWitness c target
  | shape (current c) /= shape target || position (current c) /= position target = Left "Recolor cannot satisfy geometry/position specification"
  | otherwise = maybe (Left "CurrentlyUnsupported: multicolor recoloring") (Right . Constraint c) (color target)
fixedWitness :: Operator -> Object -> Object -> Bool
fixedWitness op source target = case fixedTransform op source of
  Left _ -> False
  Right actual -> geometry actual == geometry target && position actual == position target

satisfies :: Eq a => [Constraint a] -> Param a -> Bool
satisfies cs p = all (\(Constraint c expected) -> evalParam c p == Right expected) cs

-- Return the actual expression checks to keep instrumentation reproducible.
resolveHole :: Eq a => Hole a -> [Param a] -> ([Param a],Int,Int)
resolveHole hole grammar = (valid,length grammar,length grammar-length valid)
  where valid = filter (satisfies (constraints hole)) grammar

translationHole :: String -> [Constraint Vec] -> Either String (Hole Vec)
translationHole name cs = do
  unified <- antiUnify TVec name [(c,ConstantVector v) | Constraint c v <- cs]
  pure (case unified of Shared _ -> Hole name TVec cs; Parameterized hole -> hole)
colorHole :: String -> [Constraint Int] -> Either String (Hole Int)
colorHole name cs = do
  unified <- antiUnify TInt name [(c,ConstantInt v) | Constraint c v <- cs]
  pure (case unified of Shared _ -> Hole name TInt cs; Parameterized hole -> hole)

-- Witnesses supply numeric values directly; never enumerate the Vec lattice in
-- this path. A shared constant is introduced only when all specifications agree.
witnessVectorGrammar :: [Constraint Vec] -> Bool -> [Param Vec]
witnessVectorGrammar cs allowPrevious = shared ++
  [VectorDifference a b | a <- coordinateGrammar allowPrevious, b <- coordinateGrammar allowPrevious, paramText a /= paramText b]
  where shared = case cs of
          Constraint _ v:rest | all ((==v) . requiredValue) rest -> [ConstantVector v]
          _ -> []
witnessColorGrammar :: [Constraint Int] -> Bool -> [Param Int]
witnessColorGrammar cs allowPrevious = [ObjectColor Current] ++ [ObjectColor Previous | allowPrevious] ++ shared
  where shared = case cs of
          Constraint _ c:rest | all ((==c) . requiredValue) rest -> [ConstantInt c]
          _ -> []
