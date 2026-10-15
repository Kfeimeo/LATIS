module Main where
import Language.Induced.Base
import Synthesis.Induced.Learn
import Synthesis.Induced.Specification
import Synthesis.Induced.Witness
import Synthesis.Induced.Observers
import Synthesis.Induced.VersionSpace
import Synthesis.Induced.Abstraction
import ARC.Dataset
import Latent.Grid
import Latent.Render
import qualified Latent.Object as O
import qualified Data.Map.Strict as M
import qualified Data.Set as S
import Control.Monad (unless,forM_)

assert :: String -> Bool -> IO ()
assert label ok=unless ok (error label)
must :: Either String a -> a
must=either error id
op :: String -> Type -> [Expr] -> Expr
op n t=must . call n t
v :: Value -> Expr
v=literal

main :: IO ()
main=do
  let forbidden=words "Attach Start Progression AlignmentTask ChainObjects MapPose ScanP OrderedPoseSequence PointwisePose AttachChain ProgressionTask"
  assert "no structural priors in registry" (all (`notElem` map primitiveName base) forbidden)
  assert "complete primitive metadata" (all (\p->primitiveTypeScheme p/="unknown"&&primitiveCost p>0&&not (null (primitiveSemantics p))) base)
  assert "reject Color/Int confusion" (case call "add" IntT [v (ColorV 2),v (IntV 1)] of Left _->True; _->False)
  let pair=op "tuple" (PairT BoolT (ListT IntT)) [v (BoolV True),v (ListV IntT [IntV 7])]
  assert "fully polymorphic pair typing" (evalValue M.empty (op "snd" (ListT IntT) [pair])==Right (ListV IntT [IntV 7]))
  let x=variable "x" IntT
      inc=lambda "x" IntT (op "add" IntT [x,v (IntV 1)])
      xs=v (ListV IntT (map IntV [1,2,3]))
      sumFn=lambda "p" (PairT IntT IntT) (op "add" IntT [op "fst" IntT [variable "p" (PairT IntT IntT)],op "snd" IntT [variable "p" (PairT IntT IntT)]])
  assert "application semantics" (runFunction inc (IntV 5)==Right (IntV 6))
  assert "let preserves lexical scope" (evalValue M.empty (binding "x" (v (IntV 4)) (op "add" IntT [x,v (IntV 3)]))==Right (IntV 7))
  assert "map" (evalValue M.empty (op "map" (ListT IntT) [inc,xs])==Right (ListV IntT (map IntV [2,3,4])))
  assert "scan includes seed" (evalValue M.empty (op "scan" (ListT IntT) [sumFn,v (IntV 0),xs])==Right (ListV IntT (map IntV [0,1,3,6])))
  assert "fold" (evalValue M.empty (op "fold" IntT [sumFn,v (IntV 0),xs])==Right (IntV 6))
  assert "zipWith" (evalValue M.empty (op "zipWith" (ListT IntT) [sumFn,xs,xs])==Right (ListV IntT (map IntV [2,4,6])))
  assert "bounded range" (case evalValue M.empty (op "range" (ListT IntT) [v (IntV 0),v (IntV 5000)]) of Left _->True; _->False)
  assert "empty head fails" (case evalValue M.empty (op "head" IntT [v (ListV IntT [])]) of Left _->True; _->False)
  assert "Option" (evalValue M.empty (op "get" BoolT [op "some" (OptionT BoolT) [v (BoolV True)]])==Right (BoolV True))
  assert "Set membership" (evalValue M.empty (op "contains" BoolT [v (SetV ColorT [ColorV 2]),v (ColorV 2)])==Right (BoolV True))
  let o=O.Object 19 (Coord 2 3) (M.fromList [(Coord 0 0,3),(Coord 1 0,3),(Coord 0 1,3)]) 2
      s=O.Scene (Dimensions 8 9) 0 [o]
      placed=v (PlacedV o)
      recovered=op "place" PlacedT [op "objectOf" ObjectT [placed],op "poseOf" PoseT [placed]]
  assert "Object x Pose adapter preserves canonical fields" (evalValue M.empty recovered==Right (PlacedV o))
  case evalValue M.empty (op "cells" (SetT CellT) [v (SceneV s)]) of
    Right (SetV CellT cs)->assert "cells are lossless same-scene view" (gridFromCells (O.canvas s) 0 [(p,c) | CellV p c<-cs]==render s)
    _->error "cells observation"
  forM_ [0..7] $ \i->assert "D4 preserves cell count" (O.size (d4 o i)==O.size o)
  let target=O.translate o (Vec 4 2)
      task=pointTask PlacedT [(M.singleton "a" (PlacedV o),PlacedV target)]
      primitive=case filter ((=="Translate") . primitiveName) base of p:_->p; _->error "registry"
      ds=witness 32 primitive task (observations task)
  assert "Translate derives instance vector" (any (\d->case decompositionChildren d of [_,q]->map snd (points q)==[VecV (Vec 4 2)]; _->False) ds)
  let tupleVar=variable "p" (PairT PlacedT PlacedT)
      delta=op "coordDelta" VecT [op "Anchor" CoordT [op "fst" PlacedT [tupleVar],v (AnchorV 3)],op "Anchor" CoordT [op "snd" PlacedT [tupleVar],v (AnchorV 0)]]
  assert "FV and projection dependencies derived from syntax" (freeVars delta==S.singleton "p"&&bindingAccesses delta==S.fromList ["p.0","p.1"])
  official<-loadTask "data/03560426.json" >>= pure . must
  result<-inducedSearch InducedTSLFull defaultInduced (training official)
  let exact r=maybe False (\p->all (\(a,b)->predictInduced defaultInduced p a==Right b) (training official)) (inducedProgram r)
  assert "03560426 train exact independent solver" (exact result)
  assert "03560426 heldout exact" (maybe False (\p->all (\t->Just (predictInduced defaultInduced p (testInput t))==fmap Right (testOutput t)) (tests official)) (inducedProgram result))
  let rect ident color px py w h=O.Object ident (Coord px py) (M.fromList [(Coord a b,color) | a<-[0..w-1],b<-[0..h-1]]) 0
      changed=[rect 0 2 2 9 2 3,rect 1 5 6 7 3 2,rect 2 7 10 5 1 4]
      expected=case changed of
        a:b:c:_->let a'=a {O.position=Coord 0 0}; b'=b {O.position=O.br a'}; c'=c {O.position=O.br b'} in [a',b',c']
        _->error "fixture"
      inputChanged=must (render (O.Scene (Dimensions 16 17) 0 changed))
      outputChanged=must (render (O.Scene (Dimensions 16 17) 0 expected))
  assert "core learned tail and canvas observer generalize to changed size/first-x" (maybe False (\p->predictInduced defaultInduced p inputChanged==Right outputChanged) (inducedProgram result))
  assert "scan activated by nonempty root support" (M.member "scan" (inducedSignature result))
  assert "all portfolio programs well typed and exact" (all (\p->typeCheck M.empty p==Right (ArrowT SceneT SceneT)&&all (\(a,b)->predictInduced defaultInduced p a==Right b) (training official)) (inducedPortfolio result))
  assert "dictionary found only after synthesis" (not (null (inducedInventions result))&&null (discover (take 1 (inducedPortfolio result))))
  assert "no forbidden activated symbols" (all (`notElem` M.keys (inducedSignature result)) forbidden)
  assert "memoization exercised" (M.findWithDefault 0 "memo_hits" (inducedMetrics result)>0)
  let grid=must (render s)
      translated=must (render (s {O.objects=[O.translate o (Vec 1 0)]}))
      small=[(grid,translated)]
  full<-inducedSearch InducedTSLFull defaultInduced small
  eager<-inducedSearch NoVersionSpaceSharing defaultInduced small
  assert "sharing ablation actually materializes children" (M.findWithDefault 0 "memo_hits" (inducedMetrics eager)==0&&M.findWithDefault 0 "materialized_child_asts" (inducedMetrics eager)>0)
  assert "sharing preserves exact soundness" (all (\r->maybe False (\p->predictInduced defaultInduced p grid==Right translated) (inducedProgram r)) [full,eager])
  noEffect<-inducedSearch NoEffectPropagation defaultInduced small
  noFV<-inducedSearch NoFVDependency defaultInduced small
  noAbs<-inducedSearch NoTaskAbstraction defaultInduced small
  bottom<-inducedSearch NoWitness (defaultInduced {workBudget=2000}) small
  assert "effect ablation disables rule" (M.findWithDefault 0 "effect_pruned" (inducedMetrics noEffect)==0)
  assert "FV ablation disables projected binding coalescing" (M.findWithDefault 0 "fv_bindings_eliminated" (inducedMetrics noFV)==0)
  assert "abstraction ablation disables invention" (null (inducedInventions noAbs))
  assert "NoWitness uses actual bottom-up work and zero witnesses" (M.findWithDefault 0 "witness_calls" (inducedMetrics bottom)==0&&M.findWithDefault 0 "bottom_up_terms" (inducedMetrics bottom)>0)
  let deadSupport=Support "dead" "dead"
      (deadId,store)=insertNode True "dead" (Leaf (v (IntV 4))) deadSupport emptySpace
  assert "unreachable nodes do not enter TSL" (M.null (signature store 0)&&deadId/=0)
  putStrLn "Induced tests passed: typed kernel, lossless grounding, witness constraints, VSA soundness, core/heldout, provenance, invention and executable ablations."
