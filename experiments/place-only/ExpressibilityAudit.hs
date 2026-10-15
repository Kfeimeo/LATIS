-- Independent post-selection expressibility audit. These references follow
-- the old fixture equations; they are NEVER imported into any learner or TSL.
module Main where
import Language.Induced.Base hiding (anchor)
import ARC.Dataset
import Latent.Encode
import Latent.Render
import Latent.Grid (Grid)
import qualified Data.Map.Strict as M
import System.Environment (getArgs)
import System.Directory (createDirectoryIfMissing)
import System.FilePath ((</>),takeDirectory)
import Data.List (intercalate)

p :: String -> Type -> [Expr] -> Expr
p name ty args=either error id (call name ty args)
scene=variable "scene" SceneT
xs=variable "xs" (ListT PlacedT)
obj=variable "obj" PlacedT
anchor which o=p "Anchor" CoordT [o,literal (AnchorV which)]
axis coordinate which o=p coordinate IntT [anchor which o]
key coordinate which=lambda "key" PlacedT (axis coordinate which (variable "key" PlacedT))
extreme operation coordinate which=p operation PlacedT [key coordinate which,xs]
add a b=p "add" IntT [a,b]
sub a b=p "subtract" IntT [a,b]
vec a b=p "vec" VecT [a,b]
zero=literal (IntV 0)
first=p "head" PlacedT [xs]
second=p "index" PlacedT [xs,literal (IntV 1)]
delta a b=p "coordDelta" VecT [a,b]
move o v=p "place" PlacedT [p "objectOf" ObjectT [o],p "coordAdd" CoordT [anchor 0 o,v]]
finish objects=lambda "scene" SceneT (binding "xs" (p "objects" (ListT PlacedT) [scene])
  (p "mkScene" SceneT [p "canvasSize" SizeT [scene],p "background" ColorT [scene],objects]))

-- min(0 axis) + max(3 axis), expressed with existing higher-order Base ops.
reflection coordinate=finish (binding "axisBound" bound
  (p "map" (ListT PlacedT) [lambda "obj" PlacedT (move obj displacement),xs]))
  where
    bound=add (axis coordinate 0 (extreme "argminBy" coordinate 0))
              (axis coordinate 3 (extreme "argmaxBy" coordinate 3))
    offset=sub (sub (variable "axisBound" IntT) (axis coordinate 3 obj)) (axis coordinate 0 obj)
    displacement=if coordinate=="x" then vec offset zero else vec zero offset
localSwap=finish (binding "step" (vec (sub (axis "y" 0 second) (axis "y" 0 first))
                                      (sub (axis "x" 0 second) (axis "x" 0 first)))
  (p "map" (ListT PlacedT) [lambda "obj" PlacedT (move obj (variable "step" VecT)),xs]))
fusion=finish (binding "step" (delta (anchor 0 second) (anchor 0 first))
  (p "scan" (ListT PlacedT) [lambda "pair" (PairT PlacedT PlacedT) stepFunction,
                             move first (delta start (anchor 0 first)),p "tail" (ListT PlacedT) [xs]]))
  where
    pair=variable "pair" (PairT PlacedT PlacedT)
    previous=p "fst" PlacedT [pair];next=p "snd" PlacedT [pair]
    start=p "coord" CoordT [axis "x" 0 (extreme "argminBy" "x" 0),axis "y" 0 (extreme "argminBy" "y" 0)]
    stepFunction=move next (delta (p "coordAdd" CoordT [anchor 0 previous,variable "step" VecT]) (anchor 0 next))
trap=finish (binding "step" (vec (p "if" IntT [p "equal" BoolT [axis "x" 0 first,add (literal (IntV 1)) (literal (IntV 1))],literal (IntV 3),literal (IntV 7)]) zero)
  (p "map" (ListT PlacedT) [lambda "obj" PlacedT (move obj (variable "step" VecT)),xs]))

relative=finish (p "map" (ListT PlacedT) [lambda "obj" PlacedT (move obj (delta (anchor 4 second) (anchor 2 first))),xs])
progression=finish (p "map" (ListT PlacedT) [lambda "obj" PlacedT (move obj (delta (anchor 0 obj) (anchor 2 first))),xs])

predict program input=do
  value<-runFunction program (SceneV (encode defaultEncoder input))
  case value of SceneV result->render result;_->Left "non-scene"
bool b=if b then "true" else "false"
main=do
  args<-getArgs
  let out=case args of [x]->x;_->"results/place-only/base_certificates.json"
      references=[("A-absolute-relative",relative),("B-repeated-progression",progression),("I-equivalent-representations",relative),("C-scene-axis",reflection "x"),("E-local-better",localSwap),
                  ("F-global-better",reflection "y"),("G-fusion",fusion),("H-overfitting-trap",trap)]
  records<-mapM (\(name,program)->do
    task<-either error id <$> loadTask ("results/v03/stress" </> name </> "task.json")
    let typed=typeCheck M.empty program==Right (ArrowT SceneT SceneT)
        train=all (\(x,y)->predict program x==Right y) (training task)
        held=all (\q->maybe False (\y->predict program (testInput q)==Right y) (testOutput q)) (tests task)
    if not (typed&&train&&held) then error (name++": invalid independent Base reference") else pure ()
    putStrLn (name++": checked Base certificate; train/heldout exact")
    pure ("{\"task\":"++show name++",\"program\":"++show (exprText program)++",\"type_checked\":"++bool typed
         ++",\"train_exact\":"++bool train++",\"heldout_exact\":"++bool held++",\"base_code_length\":"++show (exprLength program)++"}")
    ) references
  createDirectoryIfMissing True (takeDirectory out)
  writeFile out ("{\"purpose\":\"independent fixture-equation references; never search seeds or inventions\",\"selection_feedback\":false,\"certificates\":["++intercalate "," records++"]}\n")
