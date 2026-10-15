{-# LANGUAGE GADTs #-}
module Language.Types where
import Latent.Grid
import Latent.Object
import Data.Type.Equality

newtype Fn a b = Fn { runFn :: a -> Either String b }
data Ty a where
  TObject :: Ty Object
  TScene :: Ty Scene
  TCoord :: Ty Coord
  TVec :: Ty Vec
  TInt :: Ty Int
  TBool :: Ty Bool
  TBBox :: Ty BBox
  TShape :: Ty [Coord]
  TList :: Ty a -> Ty [a]
  TPair :: Ty a -> Ty b -> Ty (a,b)
  TFn :: Ty a -> Ty b -> Ty (Fn a b)

typeName :: Ty a -> String
typeName TObject = "Object"
typeName TScene = "Scene"
typeName TCoord = "Coord"
typeName TVec = "Vec"
typeName TInt = "Int"
typeName TBool = "Bool"
typeName TBBox = "BBox"
typeName TShape = "Shape"
typeName (TList t) = "List(" ++ typeName t ++ ")"
typeName (TPair a b) = "(" ++ typeName a ++ "," ++ typeName b ++ ")"
typeName (TFn a b) = typeName a ++ " -> " ++ typeName b

eqTy :: Ty a -> Ty b -> Maybe (a :~: b)
eqTy TObject TObject = Just Refl
eqTy TScene TScene = Just Refl
eqTy TCoord TCoord = Just Refl
eqTy TVec TVec = Just Refl
eqTy TInt TInt = Just Refl
eqTy TBool TBool = Just Refl
eqTy TBBox TBBox = Just Refl
eqTy TShape TShape = Just Refl
eqTy (TList a) (TList b) = do Refl <- eqTy a b; pure Refl
eqTy (TPair a b) (TPair c d) = do Refl <- eqTy a c; Refl <- eqTy b d; pure Refl
eqTy (TFn a b) (TFn c d) = do Refl <- eqTy a c; Refl <- eqTy b d; pure Refl
eqTy _ _ = Nothing
