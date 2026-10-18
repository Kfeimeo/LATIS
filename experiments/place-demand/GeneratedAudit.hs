-- Post-selection expressibility certificates for the generated sample set.
-- Reference programs are written from the generator's rule statements (raster
-- object order); they are NEVER imported into the solver and never seed search.
module Main where
import Language.Induced.Base hiding (anchor)
import ARC.Dataset
import Latent.Encode
import Latent.Render
import Latent.Grid (Vec(..))
import qualified Data.Map.Strict as M
import System.Environment (getArgs)
import System.Directory (createDirectoryIfMissing)
import System.FilePath ((</>),takeDirectory)
import Data.List (intercalate,isPrefixOf)

p :: String -> Type -> [Expr] -> Expr
p name ty args=either error id (call name ty args)
scene=variable "scene" SceneT
xs=variable "xs" (ListT PlacedT)
obj=variable "obj" PlacedT
anchor which o=p "Anchor" CoordT [o,literal (AnchorV which)]
first=p "head" PlacedT [xs]
second=p "index" PlacedT [xs,literal (IntV 1)]
delta a b=p "coordDelta" VecT [a,b]
move o v=p "place" PlacedT [p "objectOf" ObjectT [o],p "coordAdd" CoordT [anchor 0 o,v]]
finish objects=lambda "scene" SceneT (binding "xs" (p "objects" (ListT PlacedT) [scene])
  (p "mkScene" SceneT [p "canvasSize" SizeT [scene],p "background" ColorT [scene],objects]))
mapAll body=finish (p "map" (ListT PlacedT) [lambda "obj" PlacedT body,xs])
relative=mapAll (move obj (delta (anchor 0 second) (anchor 0 first)))
progression=mapAll (move obj (delta (anchor 0 obj) (anchor 0 first)))
negated=mapAll (move obj (delta (anchor 0 first) (anchor 0 second)))
double=mapAll (move obj (p "vecAdd" VecT [delta (anchor 0 second) (anchor 0 first),delta (anchor 0 second) (anchor 0 first)]))
xalign=mapAll (p "place" PlacedT [p "objectOf" ObjectT [obj],p "coord" CoordT [p "x" IntT [anchor 0 first],p "y" IntT [anchor 0 obj]]])
-- round 2: scan-seed shift (sort by x or y; seed = TL(first)+c; each next at previous BR+(1,1)) and mirror_relative (-dx,dy)
sortedBy coordinate=p "sortBy" (ListT PlacedT) [lambda "key" PlacedT (p coordinate IntT [anchor 0 (variable "key" PlacedT)]),xs]
seedshift coordinate c=finish (binding "s" (sortedBy coordinate)
  (p "scan" (ListT PlacedT) [lambda "pair" (PairT PlacedT PlacedT) (move (p "snd" PlacedT [pair]) (p "coordDelta" VecT [p "coordAdd" CoordT [anchor 3 (p "fst" PlacedT [pair]),literal (VecV (Vec 1 1))],anchor 0 (p "snd" PlacedT [pair])]))
                            ,move (p "head" PlacedT [s]) (literal (VecV c)),p "tail" (ListT PlacedT) [s]]))
  where pair=variable "pair" (PairT PlacedT PlacedT); s=variable "s" (ListT PlacedT)
mirror=mapAll (move obj (p "vec" VecT [p "subtract" IntT [literal (IntV 0),p "dx" IntT [delta (anchor 0 second) (anchor 0 first)]],p "dy" IntT [delta (anchor 0 second) (anchor 0 first)]]))
-- round 3: cross-object / scene / sequence context
sizeKey=lambda "key" PlacedT (p "cardinality" IntT [p "ObjectCells" (SetT CellT) [p "objectOf" ObjectT [variable "key" PlacedT]]])
largest=p "argmaxBy" PlacedT [sizeKey,xs]; smallest=p "argminBy" PlacedT [sizeKey,xs]
extremes=mapAll (move obj (delta (anchor 0 largest) (anchor 0 smallest)))
leftmost=p "argminBy" PlacedT [lambda "key" PlacedT (p "x" IntT [anchor 0 (variable "key" PlacedT)]),xs]
leftBorder=mapAll (p "place" PlacedT [p "objectOf" ObjectT [obj],p "coord" CoordT [p "subtract" IntT [p "x" IntT [anchor 0 obj],p "x" IntT [anchor 0 leftmost]],p "y" IntT [anchor 0 obj]]])
chainRight=finish (binding "s" (sortedBy "x")
  (p "scan" (ListT PlacedT) [lambda "pair" (PairT PlacedT PlacedT) (p "place" PlacedT [p "objectOf" ObjectT [p "snd" PlacedT [pair]],p "coord" CoordT [p "add" IntT [p "x" IntT [anchor 3 (p "fst" PlacedT [pair])],literal (IntV 2)],p "y" IntT [anchor 0 (p "fst" PlacedT [pair])]]])
                            ,p "head" PlacedT [s],p "tail" (ListT PlacedT) [s]]))
  where pair=variable "pair" (PairT PlacedT PlacedT); s=variable "s" (ListT PlacedT)
rules=[("relative",relative),("progression",progression),("negated",negated),("double",double),("xalign",xalign)
      ,("seedshift_x",seedshift "x" (Vec 2 1)),("seedshift_y",seedshift "y" (Vec 1 3)),("mirror_relative",mirror)
      ,("extremes_delta",extremes),("to_left_border",leftBorder),("chain_right",chainRight)]
predict program input=do
  value<-runFunction program (SceneV (encode defaultEncoder input))
  case value of SceneV result->render result;_->Left "non-scene"
bool b=if b then "true" else "false"
main=do
  args<-getArgs
  let out=case args of (x:_)->x;_->"results/place-demand/generated_certificates.json"
      round2=case args of [_,"--round2"]->True;_->False
      round3=case args of [_,"--round3"]->True;_->False
      dataDir=if round3 then "data/place-demand-generated-round3" else if round2 then "data/place-demand-generated-round2" else "data/place-demand-generated"
      names=if round3 then [("audit3-crossobj-extremes-0","extremes_delta"),("audit3-crossobj-extremes-1","extremes_delta"),("audit3-scene-leftborder-0","to_left_border"),("audit3-scene-leftborder-1","to_left_border")
                          ,("audit3-sequence-chain-0","chain_right"),("audit3-sequence-chain-1","chain_right")] else if round2 then [("audit2-same-relative-0","relative"),("audit2-same-progression-0","progression"),("audit2-same-negated-0","negated"),("audit2-same-double-0","double"),("audit2-same-xalign-0","xalign")
                          ,("audit2-nonlocal-seedshift-x-0","seedshift_x"),("audit2-nonlocal-seedshift-x-1","seedshift_x"),("audit2-nonlocal-seedshift-y-0","seedshift_y")
                          ,("audit2-newstruct-mirror-0","mirror_relative"),("audit2-newstruct-mirror-1","mirror_relative")] else [(n,r) | (n,r)<-[("dev-relative-0","relative"),("dev-relative-1","relative"),("dev-progression-0","progression"),("dev-progression-1","progression")
                            ,("audit-same-relative-0","relative"),("audit-same-relative-1","relative"),("audit-same-relative-2","relative")
                            ,("audit-same-progression-0","progression"),("audit-same-progression-1","progression"),("audit-same-progression-2","progression")
                            ,("audit-unseen-negated-0","negated"),("audit-unseen-negated-1","negated"),("audit-unseen-double-0","double"),("audit-unseen-double-1","double")
                            ,("audit-unseen-xalign-0","xalign"),("audit-unseen-xalign-1","xalign")]]
  records<-mapM (\(name,rule)->do
    task<-either error id <$> loadTask (dataDir </> name </> "task.json")
    let program=maybe (error rule) id (lookup rule rules)
        typed=typeCheck M.empty program==Right (ArrowT SceneT SceneT)
        train=all (\(x,y)->predict program x==Right y) (training task)
        held=all (\q->maybe False (\y->predict program (testInput q)==Right y) (testOutput q)) (tests task)
    if not (typed&&train&&held) then error (name++": reference program does not reproduce the generated data") else pure ()
    putStrLn (name++": checked Base certificate ("++rule++"); train/heldout exact")
    pure ("{\"task\":"++show name++",\"rule\":"++show rule++",\"program\":"++show (exprText program)++",\"type_checked\":"++bool typed
         ++",\"train_exact\":"++bool train++",\"heldout_exact\":"++bool held++",\"base_code_length\":"++show (exprLength program)++"}")
    ) names
  createDirectoryIfMissing True (takeDirectory out)
  writeFile out ("{\"purpose\":\"independent generator-rule references for generated samples; never search seeds or inventions\",\"selection_feedback\":false,\"certificates\":["++intercalate "," records++"]}\n")
