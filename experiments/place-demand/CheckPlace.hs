import Language.Induced.Base
import Latent.Grid
import qualified Latent.Object as O
import qualified Data.Map.Strict as M
import Control.Monad (unless, forM_)

main :: IO ()
main = do
  let check label ok = unless ok (error label)
      obj = O.Object 7 (Coord 4 5) (M.fromList [(Coord 0 0,2),(Coord 1 0,3),(Coord 0 2,2)]) 0
      must (Right x) = x
      must (Left e) = error e
      source = literal (PlacedV obj)
      local = must (call "objectOf" ObjectT [source])
  check "Translate absent from registry" (all ((/="Translate") . primitiveName) base)
  check "poseOf absent from registry" (all ((/="poseOf") . primitiveName) base)
  check "Translate cannot be constructed" (case call "Translate" PlacedT [source,literal (VecV (Vec 1 2))] of Left _->True; _->False)
  check "rotation is distinct object geometry" (not (equivalent (ObjectV obj) (ObjectV (O.rotate90 obj))))
  check "translation is equivalent local geometry" (equivalent (ObjectV obj) (ObjectV (O.translate obj (Vec 3 7))))
  forM_ [Vec x y | x<-[-4..4], y<-[-4..4]] $ \v -> do
    let origin = must (call "Anchor" CoordT [source,literal (AnchorV 0)])
        target = must (call "coordAdd" CoordT [origin,literal (VecV v)])
        result = must (call "place" PlacedT [local,target])
    check "arbitrary translation via ordinary composition" (equivalent (must (evalValue M.empty result)) (PlacedV (O.translate obj v)))
    check "composition is type checked" (typeCheck M.empty result==Right PlacedT)
  putStrLn "PASS: registry, rejected Translate, rotation-distinct semantics, 81 composed translations, type checking"
