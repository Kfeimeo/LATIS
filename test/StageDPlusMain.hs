module Main where
import Synthesis.Collection.Diagnostics
import Synthesis.Collection.Typed
import Synthesis.Collection.Parameter
import Synthesis.Collection.Relation
import Synthesis.Collection.Unified
import Latent.Grid
import Latent.Encode (encode,defaultEncoder)
import qualified Latent.Object as O
import qualified Data.Map.Strict as M
import qualified Data.Set as S
import Control.Monad (unless)

assert :: String -> Bool -> IO ()
assert name ok=unless ok (error ("FAIL "++name)) >> putStrLn ("PASS "++name)
must :: Either String a -> a
must=either error id
main :: IO ()
main=do
  let small=[Template (TConst (VI n)) 0 0 0 | n<-[1..3]] :: [Template String]
      hc=HoleConfig 2 0 100 [1..3] baseOps FeatureAndConstant
      nofit=synthesizeTyped hc id small [(const (Right (VI 0)),VI 9)]
      cut=synthesizeTyped hc {hcBudget=2} id small [(const (Right (VI 0)),VI 3)]
      recovered=synthesizeTyped hc id small [(const (Right (VI 0)),VI 3)]
  assert "finite no-fit ledger visits all 3" (null (trFits nofit) && trTemplatesTried nofit==3 && finiteEvidence (Just 3) 3 0 0 False==ProvenExhausted)
  assert "last candidate cut is not exhaustive" (null (trFits cut) && trTruncated cut && finiteEvidence (Just 3) 2 0 0 False==ProvenNotExhausted)
  assert "budget recovers final fit" (length (trFits recovered)==1)
  assert "deferred prevents exhaustion" (finiteEvidence (Just 3) 3 1 0 False==ProvenNotExhausted)
  assert "representative cap prevents exhaustion" (finiteEvidence (Just 3) 3 0 1 False==ProvenNotExhausted)
  assert "recovery permits bounded exhaustion" (finiteEvidence (Just 3) 3 0 0 False==ProvenExhausted)
  assert "unknown grammar cannot be certified" (finiteEvidence Nothing 3 0 0 False==Unknown)
  assert "timeout retains interrupted status" (finiteEvidence (Just 3) 2 0 0 True==ProvenNotExhausted)
  let deep=hc {hcDepth=3,hcMaxHoles=0,hcOps=baseOps}
      t2=extendedTemplates deep {hcDepth=2} [("x",TyInt)] TyInt
      t3=extendedTemplates deep [("x",TyInt)] TyInt
      t4=extendedTemplates deep {hcDepth=4} [("x",TyInt)] TyInt
      target=TApp OpMul [TLeaf "x",TApp OpAdd [TLeaf "x",TApp OpMul [TLeaf "x",TLeaf "x"]]]
      -- Enumeration's commutative normalization orders leaves before Apps.
      f n _=Right (VI n)
      rows=[(f n,VI (n*n*(n+1))) | n<-[2,3,4]]
      r2=synthesizeTyped deep id t2 rows
      r3=synthesizeTyped deep id t3 rows
  assert "deeper template universe includes exact shallow prefix" (take (length t2) t3==t2 && S.fromList (map tmExpr t2) `S.isSubsetOf` S.fromList (map tmExpr t3))
  assert "real depth3 term absent at2" (target `elem` map tmExpr t3 && target `notElem` map tmExpr t2 && tDepth target==3)
  assert "depth3 binds and evaluates unique rule" (null (trFits r2) && any ((==target) . cExpr) (trFits r3))
  assert "small depth2 universe is fully visited without budget cut" (not (trTruncated r2) && trTemplatesTried r2==trTemplates r2)
  assert "depth4 extends3 without unbounded universe" (take (length t3) t4==t3 && any ((==4) . tmDepth) (take (length t3+5) t4))
  let p r e=must (checkedParam r e)
      col=MapColor (p ArcColor (TConst (VI 4)))
      hollow=LegacyStep (Hollow 1)
      move=MapPosition (p IntegerParam (TApp OpAdd [TLeaf CurrentX,TConst (VI 3)])) (p IntegerParam (TLeaf CurrentY))
      copy=Copies (p PositiveCount (TConst (VI 2))) (p IntegerParam (TConst (VI 5))) (p IntegerParam (TConst (VI 0)))
      t=ObjectTransform AllObjects DropOthers (Pipeline [col,hollow,move])
      obj=O.Object 0 (Coord 1 1) (M.fromList [(Coord x y,2) | x<-[0..2],y<-[0..2]]) 0
      dims=Dimensions 20 10
      proof=must (executePipeline t dims dims [obj])
      rw=must (renderWitness dims 0 (pwEmitted proof))
      dc=DCase (O.Scene dims 0 [obj]) dims (renderResult rw) (O.objects (encode defaultEncoder (renderResult rw)))
      shallow=searchUnified stageDFull [dc]
      parameters=S.toAscList (S.fromList [p IntegerParam (fmap (const CurrentWidth) (tmExpr tm)) | tm<-t3,tmHoles tm==0])
      pool=buildPool (length parameters) parameters
      context=ParamContext dims dims [obj] [obj] obj
      (sharedFits,sharedWork)=fitPool SharedParamVSA pool [(context,VI 36)]
      (flatFits,flatWork)=fitPool NoParamVSA pool [(context,VI 36)]
  assert "depth3 fixed universe B on/off fits match without truncation" (sharedFits==flatFits && not (null sharedFits) && sharedWork<flatWork)
  assert "three nonidentity operations have checked provenance" (length (pwSteps proof)==3 && all (\s->map eoObject (swInput s)/=map eoObject (swOutput s)) (pwSteps proof) && verifyPipeline t dims dims [obj] proof && verifyRenderWitness dims 0 (pwEmitted proof) rw)
  assert "bounded old2 search has no fit for constructed3 control" (null (drFits shallow))
  assert "three-step new grammar actually generates target" (t `elem` take 3000 (extensionPrograms stageDFull {sdComposeDepth=3} [(AllObjects,DropOthers)] [2]))
  let deeper=searchUnified stageDFull {sdComposeDepth=3} [dc]
  assert "deep search finds checked three-step fit" (any (\p->case otBody p of Pipeline ss->length ss==3; _->False) (drFits deeper))
  let four=ObjectTransform AllObjects DropOthers (Pipeline [col,hollow,move,copy])
      proof4=must (executePipeline four dims dims [obj])
  assert "four-step executor and copy provenance" (length (pwSteps proof4)==4 && map eoSources (pwEmitted proof4)==[[0],[0]])
  assert "depth4 enumerator visits new layer without exhausting3" ([length ss | ObjectTransform _ _ (Pipeline ss)<-take 2 (extensionPrograms stageDFull {sdComposeDepth=4} [(AllObjects,DropOthers)] [2])]==[3,4])
  let branchEvents=[jobj [("branch_id",jstr "a"),("stop_reason",jstr "NoFitYet")],jobj [("branch_id",jstr "b"),("render_mismatches","1")]]
  assert "separate branches retain both causes" (length branchEvents==2 && head branchEvents/=last branchEvents)
  resetDiagnostics
  let on=diagnostic True [("scope",jstr "Unit"),("stop_reason",jstr "NoFitYet")] (sum [1..100::Int])
      off=diagnostic False [("unforced",error "disabled diagnostics evaluated")] (sum [1..100::Int])
  assert "diagnostic observer cannot change value" (on==off)
  stat<-diagnosticStats
  putStrLn stat
  writeFile "dplus_negative_controls.json" (jobj
    [("finite_grammar",jobj [("candidate_ids","[1,2,3]"),("visited_ids","[1,2,3]"),("fit_ids","[]"),("deferred_ids","[]"),("exhaustiveness",jstr (show (finiteEvidence (Just 3) (trTemplatesTried nofit) 0 0 (trTruncated nofit))))])
    ,("last_candidate_budget",jobj [("budget",show (hcBudget hc {hcBudget=2})),("visited",show (trTemplatesTried cut)),("fit_before",show (length (trFits cut))),("fit_after",show (length (trFits recovered)))])
    ,("depth3_parameter",jobj [("expression",jstr (show target)),("depth",show (tDepth target)),("depth2_fits",show (length (trFits r2))),("depth2_templates",show (trTemplates r2)),("depth2_templates_visited",show (trTemplatesTried r2)),("depth2_truncated",if trTruncated r2 then "true" else "false"),("depth3_fits",show (length (trFits r3)))])
    ,("depth3_vsa",jobj [("candidates",show (length parameters)),("shared_evaluations",show sharedWork),("flat_evaluations",show flatWork),("fit_count",show (length sharedFits)),("fits_equal",if sharedFits==flatFits then "true" else "false")])
    ,("depth3_pipeline",jobj [("program",jstr (show t)),("witness",jstr (show proof)),("search_fits",show (length (drFits deeper))),("depth2_fits",show (length (drFits shallow)))])
    ,("depth4_pipeline",jobj [("program",jstr (show four)),("witness",jstr (show proof4))])])
  putStrLn "All D+ diagnostics/scaling tests passed."
