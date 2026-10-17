-- Post-selection expressibility certificates for the generated sample set.
-- Reference programs are written from the generator's rule statements (raster
-- object order); they are NEVER imported into the solver and never seed search.
module Main where
import Language.Induced.Base hiding (anchor)
import ARC.Dataset
import Latent.Encode
import Latent.Render
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
rules=[("relative",relative),("progression",progression),("negated",negated),("double",double),("xalign",xalign)]
predict program input=do
  value<-runFunction program (SceneV (encode defaultEncoder input))
  case value of SceneV result->render result;_->Left "non-scene"
bool b=if b then "true" else "false"
main=do
  args<-getArgs
  let out=case args of [x]->x;_->"results/place-demand/generated_certificates.json"
      names=[(n,r) | (n,r)<-[("dev-relative-0","relative"),("dev-relative-1","relative"),("dev-progression-0","progression"),("dev-progression-1","progression")
                            ,("audit-same-relative-0","relative"),("audit-same-relative-1","relative"),("audit-same-relative-2","relative")
                            ,("audit-same-progression-0","progression"),("audit-same-progression-1","progression"),("audit-same-progression-2","progression")
                            ,("audit-unseen-negated-0","negated"),("audit-unseen-negated-1","negated"),("audit-unseen-double-0","double"),("audit-unseen-double-1","double")
                            ,("audit-unseen-xalign-0","xalign"),("audit-unseen-xalign-1","xalign")]]
  records<-mapM (\(name,rule)->do
    task<-either error id <$> loadTask ("data/place-demand-generated" </> name </> "task.json")
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
