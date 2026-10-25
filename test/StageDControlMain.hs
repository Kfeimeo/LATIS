module Main where
import Synthesis.Collection.Unified
import Synthesis.Collection.Parameter
import Synthesis.Collection.Relation
import Synthesis.Collection.Typed
import Latent.Grid
import Latent.Render (render)
import Latent.Encode (encode,defaultEncoder)
import qualified Latent.Object as O
import qualified Data.Map.Strict as M
import Data.List (sort)
import Control.Monad (unless)

assert :: String -> Bool -> IO ()
assert name ok=unless ok (error ("FAIL "++name)) >> putStrLn ("PASS "++name)
must :: Either String a -> a
must=either error id
main :: IO ()
main=do
  let oldCounts=[KConst n | n<-[2,3,4]]++[KCountObjects,KCountColors]++[ctor gap | ctor<-[KFitAcross,KFitDown],gap<-[0..2]]
      oldOffsets=[ctor gap | ctor<-[StepRight,StepDown,StepLeft,StepUp,StepDiagonal],gap<-[0..2]]
  assert "ComposeOnly count universe is exactly migrated C counts" (sort closedCountParameters==sort (map (must . migrateCount) oldCounts))
  assert "ComposeOnly paired offsets are exactly migrated C offsets" (sort closedDeltaPairs==sort (map (must . migrateOffset) oldOffsets))
  assert "ComposeOnly cannot add a constant count 5" (must (checkedParam PositiveCount (TConst (VI 5))) `notElem` closedCountParameters)
  let (right,_) = must (migrateOffset (StepRight 1))
      (_,down) = must (migrateOffset (StepDown 2))
  assert "ComposeOnly cannot mix incompatible diagonal gaps" ((right,down) `notElem` closedDeltaPairs)
  assert "closed movement exposes legacy bbox displacement" (TApp OpAdd [TLeaf CurrentX,TLeaf CurrentWidth] `elem` fixedExpressions "x")
  let big=O.Object 0 (Coord 1 1) (M.fromList [(Coord x 0,1) | x<-[0..2]]) 0
      small=O.Object 1 (Coord 1 10) (M.singleton (Coord 0 0) 2) 0
      scene=O.Scene (Dimensions 30 20) 0 [big,small]
      -- A multi-source rule with no uniquely labelled output object: each
      -- source emits Width(Current)+CountObjects(Input) copies.
      emitted=[O.translate o (Vec (k*(O.width o+1)) 0) | o<-O.objects scene,k<-[0..O.width o+length (O.objects scene)-1]]
      target=must (render scene {O.objects=emitted})
      one=DCase scene (O.canvas scene) target (O.objects (encode defaultEncoder target))
      typed=searchUnified stageDFull [one]
      fixed=searchUnified stageDFull {sdTyped=False,sdVSA=False,sdOrdering=False} [one]
  assert "unlabelled typed joint fallback really executes" (M.findWithDefault 0 "d_joint_fallback" (drMetrics typed)==1 && not (null (drFits typed)))
  assert "unlabelled fallback does not fabricate scalar supervision" (null (drGoals typed))
  assert "ComposeOnly fallback cannot leak typed parameter enumeration" (null (drFits fixed))
  let dense=[O.Object i (Coord x y) (M.singleton (Coord 0 0) (1+(x+y) `mod` 2)) 0 | (i,(x,y))<-zip [0..] [(x,y) | y<-[0..29],x<-[0..7]]]
      legacy=ObjectTransform AllObjects DropOthers (MapEach (Replicate (KConst 4) (StepRight 1)))
      migrated=must (migrateTransform legacy)
      dims=Dimensions 30 30
      old=emitObjects legacy dims dense >>= \es->render (O.Scene dims 0 (map eoObject es))
      translated=emitObjectsInput migrated dims dims dense >>= \es->render (O.Scene dims 0 (map eoObject es))
  assert "legacy migration preserves valid overlapping emissions above new-program cap" (old==translated && either (const False) (const True) old && length (must (emitObjectsInput migrated dims dims dense))==960)
  let unit i x=O.Object i (Coord x 1) (M.singleton (Coord 0 0) 1) 0
      x=must (checkedParam IntegerParam (TLeaf CurrentWidth))
      y=must (checkedParam IntegerParam (TConst (VI 1)))
      compound=ObjectTransform AllObjects DropOthers (Pipeline [SetMerge MergeFillBBox,MapPosition x y])
      proof=must (executePipeline compound (Dimensions 10 10) (Dimensions 10 10) [unit 0 1,unit 1 3])
      result=map eoObject (pwEmitted proof)
  assert "Merge rebuilds changed SizeSig before typed position evaluation" (map O.width result==[3] && map O.position result==[Coord 3 1] && map eoSources (pwEmitted proof)==[[0,1]])
  putStrLn "All strict ComposeOnly control tests passed."
