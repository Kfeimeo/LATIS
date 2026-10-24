module Main where
import Synthesis.Collection.Front
import Synthesis.Collection.Typed
import Synthesis.Collection.Referent
import Synthesis.Collection.Counterfactual
import Synthesis.Collection.Indexed
import ARC.StageAEvaluate (fullA, mechanismInstances, instanceTask, Instance(..), trainExactOf, heldExactOf, gridOf)
import ARC.StageBEvaluate
import ARC.CollectionV61Evaluate (v61Tasks)
import ARC.Dataset
import qualified Language.ML as ML
import Language.Types (Ty(..))
import Language.Schema (registry, primitiveName)
import Latent.Grid
import Control.Monad (unless, forM_, when)
import Data.Either (isLeft)
import Data.List (isPrefixOf, isInfixOf, sort, nub)
import qualified Data.Map.Strict as M

assert :: String -> Bool -> IO ()
assert name ok=unless ok (error ("FAIL "++name)) >> putStrLn ("PASS "++name)

-- A tiny leaf language: X (position), W (width), H (height), N (count).
type Leaf=String
leafInfo :: LeafInfo Leaf
leafInfo=LeafInfo (const TyInt) id (const "Object") (\l->["partial leaf" | l=="P"]) (=="P") (=="W")
ctxOf :: String -> [(Leaf,Int)] -> Context Leaf
ctxOf cid env=Context cid "Object[2x1]" (\l->maybe (Left ("unknown leaf "++l)) (Right . VI) (lookup l env))
trainCtxs :: [Context Leaf]
trainCtxs=[ctxOf "c0" [("X",1),("W",2),("H",1),("N",2)],ctxOf "c1" [("X",4),("W",2),("H",2),("N",2)],ctxOf "c2" [("X",7),("W",2),("H",3),("N",2)]]
depCtxs :: [Context Leaf]
depCtxs=[ctxOf "c0:resize" [("X",1),("W",3),("H",1),("N",2)],ctxOf "c0:insert" [("X",1),("W",2),("H",1),("N",3)]]
leaf :: Leaf -> LTerm Leaf
leaf=LLeaf
int :: Int -> LTerm Leaf
int=LConst . VI
nf :: LTerm Leaf -> LTerm Leaf
nf=normalize (liPartial leafInfo)
rel :: LTerm Leaf -> LTerm Leaf -> LTerm Leaf -> Edge Leaf
rel a b f=relate leafInfo trainCtxs depCtxs a b f (map fst (specialValues (nf a)))
rowsOf :: [(M.Map Leaf Int,TVal)] -> [(Leaf -> Either String TVal,TVal)]
rowsOf xs=[(\l->maybe (Left ("unknown leaf "++l)) (Right . VI) (M.lookup l env),t) | (env,t)<-xs]
env :: Int -> Int -> M.Map Leaf Int
env a b=M.fromList [("A",a),("B",b)]
leavesAB :: [(Leaf,TTy)]
leavesAB=[("A",TyInt),("B",TyInt)]
hcA, hcBool :: HoleConfig
hcA=holeConfig (stageAOff {saTypedHoles=True, saParityOps=True})
hcBool=holeConfigB (stageAOff {saTypedHoles=True, saParityOps=True}) True
exprs :: TypedResult Leaf -> [String]
exprs=map (renderT id . cExpr) . trFits

main :: IO ()
main=do
  vertical<-loadTask "data/03560426.json" >>= either error pure
  -- 1. B0: ML connectives, typed registry, enumeration
  let b=ML.Value TBool; i=ML.Value TInt
  assert "ML And/Or semantics" (ML.eval (ML.And (b True) (b False))==Right False && ML.eval (ML.Or (b True) (b False))==Right True && ML.eval (ML.And (b True) (b True))==Right True && ML.eval (ML.Or (b False) (b False))==Right False)
  assert "ML And is strict: a failing argument fails the connective" (isLeft (ML.eval (ML.And (b False) (ML.IsOdd (ML.Mod (i 1) (i 0))))))
  assert "schema registry lists and/or/less/equalInt/not" (all (`elem` map primitiveName registry) ["and","or","less","equalInt","not"])
  assert "typed registry: Lt/Gt/Eq/And/Or/Not evaluate through ML" (applyOp OpLt [VI 1,VI 2]==Right (VB True) && applyOp OpGt [VI 1,VI 2]==Right (VB False) && applyOp OpEq [VI 3,VI 3]==Right (VB True)
    && applyOp OpAnd [VB True,VB False]==Right (VB False) && applyOp OpOr [VB True,VB False]==Right (VB True) && applyOp OpNot [VB True]==Right (VB False))
  assert "typed registry: Gt(a,b) == Lt(b,a) on a grid of values" (and [applyOp OpGt [VI x,VI y]==applyOp OpLt [VI y,VI x] | x<-[-3..3], y<-[-3..3]])
  assert "typed registry rejects ill-typed comparisons/connectives" (isLeft (applyOp OpLt [VB True,VI 1]) && isLeft (applyOp OpAnd [VI 1,VI 2]) && isLeft (applyOp OpNot [VI 0]) && isLeft (applyOp OpIf [VI 1,VI 2,VI 3]))
  let tA=enumerateTemplates hcA leavesAB TyInt
      tB=enumerateTemplates hcBool leavesAB TyInt
      usesBool t=any (`elem` boolOps) (opsOf (tmExpr t))
  assert "B0 enumeration: the Stage A templates are exactly the Bool-free templates, in the same order" (filter (not . usesBool) tB==tA && length tB>length tA)
  assert "B0 enumeration: comparisons only appear under a Bool demand (If condition)" (all (\t->boolOnlyUnderIf (tmExpr t)) tB && any (\t->"If(Lt(" `isPrefixOf` renderT id (tmExpr t)) tB)
  assert "B0 enumeration: no constant condition (Lt(?c0,?c1)) and no x<x" (not (any (\t->"If(Lt(?c0,?c1)" `isPrefixOf` renderT id (tmExpr t) || "Lt(A,A)" `isInfixOf` renderT id (tmExpr t)) tB))
  let boolTargets=enumerateTemplates hcBool leavesAB TyBool
  assert "B0 enumeration: And/Or/Not reachable for a Bool target (depth 2)" (all (\e->e `elem` map (renderT id . tmExpr) boolTargets) ["And(IsOdd(A),IsOdd(B))","Not(Lt(A,B))","Or(IsOdd(A),Lt(A,B))"])
  let threshold=synthesizeTyped hcBool id tB (rowsOf [(env 3 10,VI 10),(env 1 5,VI 1),(env 5 7,VI 7),(env 2 9,VI 2),(env 4 1,VI 1)])
  assert "If(Lt(2,A),B,A) is synthesized with a domain-fitted threshold" ("If(Lt(2,A),B,A)" `elem` exprs threshold)
  let minFit=synthesizeTyped hcBool id tB (rowsOf [(env 3 10,VI 3),(env 8 5,VI 5),(env 5 7,VI 5),(env 2 9,VI 2)])
  assert "If(Lt(A,B),A,B) (min) is synthesized" ("If(Lt(A,B),A,B)" `elem` exprs minFit)
  let parityBoth=synthesizeTyped hcBool id boolTargets (rowsOf [(env 3 5,VB True),(env 3 4,VB False),(env 2 5,VB False),(env 1 1,VB True)])
  assert "Bool target: And(IsOdd(A),IsOdd(B)) is synthesized and evaluates" ("And(IsOdd(A),IsOdd(B))" `elem` exprs parityBoth)
  assert "Stage A FullA enumeration unchanged by the registry extension (no Bool op in holeConfig)" (not (any (`elem` boolOps) (hcOps hcA)))
  -- 2. B0: Bounds
  let px=Placed (SizeSig 1 1) [3] (Coord 4 2)
      rect=Placed (SizeSig 3 2) [1,1,1,1,1,1] (Coord 5 1)
      hollow=Placed (SizeSig 3 3) [2,2,2,2,0,2,2,2,2] (Coord 0 0)
      big=Placed (SizeSig 30 30) (replicate 900 7) (Coord 0 0)
      emptyO=Placed (SizeSig 1 1) [0] (Coord 2 2)
  assert "Bounds: single pixel min==max" (objectBounds px==Right (Bounds 4 4 2 2))
  assert "Bounds: rectangle inclusive maxima (x right, y down)" (objectBounds rect==Right (Bounds 5 7 1 2))
  assert "Bounds: hollow shape uses the occupied extent" (objectBounds hollow==Right (Bounds 0 2 0 2))
  assert "Bounds: top-left origin / extreme 30x30" (objectBounds big==Right (Bounds 0 29 0 29))
  assert "Bounds: translation shifts all four bounds" (objectBounds rect {placedPos=Coord 8 5}==Right (Bounds 8 10 5 6))
  assert "Bounds: empty object is an explicit error" (isLeft (objectBounds emptyO))
  let set0=objectSet [placedToObject rect,placedToObject px]
      ctx0=Ctx (Dimensions 12 8) set0 rect Nothing True (Dimensions 12 8)
  assert "Max atom == Pos+Ext-1 and SetMax is the collection maximum" (evalScalar M.empty ctx0 (Atom (Max Current (Ax AX)))==Right 7 && evalScalar M.empty ctx0 (Atom (Max Current (Ax AY)))==Right 2
    && evalScalar M.empty ctx0 (Atom (SetMax (Ax AX)))==Right 7 && evalScalar M.empty ctx0 (Atom (SetMax (Ax AY)))==Right 2 && evalScalar M.empty ctx0 (Atom (SetMin (Ax AX)))==Right 4)
  assert "Max of Previous at first rank is an explicit error" (isLeft (evalScalar M.empty ctx0 (Atom (Max Previous (Ax AX)))))
  assert "Bounds atoms are not in the v0.6.1 atom list nor in slotLeaves; they appear only in slotLeavesB True" (not (any (`elem` atoms) boundsAtoms) && slotLeaves AX==slotLeavesB False AX
    && (LeafAtom (Max Current (Ax AX)),TyInt) `elem` slotLeavesB True AX && (LeafAtom (Max Current (Ax AY)),TyInt) `notElem` slotLeavesB True AX)
  assert "Bounds observation does not change the object or the set" (count set0==2 && objectBounds rect==objectBounds rect)
  -- 3. B1: normal forms, special values, bounded inlining
  assert "NF: constant folding and identities" (nf (LApp OpAdd [leaf "X",int 0])==leaf "X" && nf (LApp OpAdd [int 1,int 2])==int 3 && nf (LApp OpSub [leaf "X",leaf "X"])==int 0
    && nf (LApp OpMul [leaf "X",int 1])==leaf "X" && nf (LApp OpMod [leaf "X",int 1])==int 0 && nf (LApp OpIf [LApp OpLt [leaf "X",leaf "W"],leaf "H",leaf "H"])==leaf "H")
  assert "NF: Gt is canonicalized to Lt with swapped arguments; x<x and x==x fold" (nf (LApp OpGt [leaf "X",leaf "W"])==LApp OpLt [leaf "W",leaf "X"] && nf (LApp OpLt [leaf "X",leaf "X"])==LConst (VB False) && nf (LApp OpEq [leaf "H",leaf "H"])==LConst (VB True))
  assert "NF: commutative arguments are sorted (one canonical order)" (nf (LApp OpAdd [int 2,leaf "X"])==nf (LApp OpAdd [leaf "X",int 2]) && nf (LApp OpAnd [LApp OpIsOdd [leaf "W"],LApp OpIsOdd [leaf "X"]])==nf (LApp OpAnd [LApp OpIsOdd [leaf "X"],LApp OpIsOdd [leaf "W"]]))
  assert "NF: subterm-dropping identities do not fire on partial subterms (no precondition weakening)" (nf (LApp OpSub [leaf "P",leaf "P"])==LApp OpSub [leaf "P",leaf "P"] && nf (LApp OpMul [leaf "P",int 0])==LApp OpMul [leaf "P",int 0])
  assert "NF: opaque nodes never fold" (nf (LApp OpAdd [LOpaque "hole",int 0])==LOpaque "hole" && nf (LApp OpSub [LOpaque "h",LOpaque "h"])==LApp OpSub [LOpaque "h",LOpaque "h"])
  assert "NF: determinism and idempotence" (all (\t->nf (nf t)==nf t) [LApp OpAdd [LApp OpMul [leaf "X",int 1],int 0],LApp OpIf [LApp OpNot [LApp OpLt [leaf "X",leaf "W"]],leaf "H",leaf "N"]])
  assert "special values are the constant nodes of the NF (closed subtrees folded, atomic)" (specialValues (nf (LApp OpAdd [leaf "X",LApp OpAdd [int 1,int 1]]))==[([1],VI 2)] && null (specialValues (LApp OpAdd [leaf "X",leaf "W"])))
  assert "type checking rejects ill-typed lambda terms" (isLeft (typeOfTerm (const TyInt) (LApp OpAdd [leaf "X",LApp OpLt [leaf "X",leaf "W"]])) && typeOfTerm (const TyInt) (LApp OpIf [LApp OpLt [leaf "X",leaf "W"],leaf "H",int 1])==Right TyInt)
  let lib=M.fromList [("I_1",AbsDef (Plus (Atom (Pos Current (AxisVar 0))) (ConstVar 0)) ["Concept Axis","Constant"]),("I_2",AbsDef (Plus (Call "I_1" [ArgAxis AX,ArgInt 1]) (Lit 1)) [])]
  assert "bounded inlining of known abstractions" (lambdaFromScalar 2 lib (Call "I_1" [ArgAxis AX,ArgInt 2])==LApp OpAdd [LLeaf (LeafAtom (Pos Current (Ax AX))),LConst (VI 2)])
  assert "inlining beyond the depth bound and unknown abstractions are Opaque, never folded" (hasOpaque (lambdaFromScalar 1 lib (Call "I_2" [])) && hasOpaque (lambdaFromScalar 3 M.empty (Call "I_9" [])) && isLeft (evalL (const (Right (VI 0))) (lambdaFromScalar 0 lib (Call "I_1" [ArgAxis AX,ArgInt 2]))))
  -- 4. B2: the relation, positive and negative controls
  let xPlus2=LApp OpAdd [leaf "X",int 2]; xPlusW=LApp OpAdd [leaf "X",leaf "W"]; xPlusH=LApp OpAdd [leaf "X",leaf "H"]; xPlusN=LApp OpAdd [leaf "X",leaf "N"]
      e1=rel xPlus2 xPlusW (leaf "W")
  assert "X+2 -> X+Width is confirmed (structural, case-agree, observed dependency via resize, type ok)" (eStatus e1==Confirmed && case eCase e1 of CaseAgree cs->length cs==3; _->False)
  assert "the structural witness records the path, the replaced value and the replacement" (swPaths (eStructural e1)==[[1]] && swReplaced (eStructural e1)==VI 2 && swReplacement (eStructural e1)==leaf "W" && swVersion (eStructural e1)==sigmaVersion)
  assert "the type witness records the sort-determined domain of Width" (twOk (eType e1) && "proven on Object[2x1]" `isPrefixOf` twDomain (eType e1))
  let ifA=LApp OpIf [LApp OpGt [leaf "W",int 3],leaf "X",leaf "H"]; ifB=LApp OpIf [LApp OpGt [leaf "W",leaf "H"],leaf "X",leaf "H"]
      ctxsIf=[ctxOf "d0" [("X",1),("W",2),("H",3),("N",2)],ctxOf "d1" [("X",4),("W",5),("H",3),("N",2)]]
      e2=relate leafInfo ctxsIf depCtxs ifA ifB (leaf "H") (map fst (specialValues (nf ifA)))
  assert "Bool threshold: If(W>3,a,b) -> If(W>H,a,b) is confirmed when H==3 on the contexts (Gt canonicalized to Lt)" (eStatus e2==Confirmed && swAfter (eStructural e2)==nf ifB)
  let e3=rel xPlus2 xPlusW (LApp OpLt [leaf "X",leaf "W"])
  assert "type mismatch (Bool replacement for an Int value) is rejected" (case eStatus e3 of Rejected r->"type witness" `isPrefixOf` r; _->False)
  let e4=relate leafInfo trainCtxs depCtxs xPlusW xPlusH (leaf "H") [[1]]
  assert "a training-constant leaf (Width==2) is not a special value: no edge from X+W to X+H" (case eStatus e4 of Rejected r->"type witness" `isPrefixOf` r; _->False)
  let e5=rel xPlus2 xPlusW (LApp OpSub [leaf "W",leaf "W"])
  assert "x-x is a fake dependency: rejected by the dependency witness (NF is closed)" (case eStatus e5 of Rejected r->"dependency witness" `isPrefixOf` r || "structural" `isPrefixOf` r; _->False)
  let e6=rel xPlus2 (LApp OpAdd [leaf "H",int 2]) (leaf "W")
  assert "train-equivalent terms without a structural replacement are not related" (case eStatus e6 of Rejected r->"structural witness" `isPrefixOf` r; _->False)
  let wide=trainCtxs++[ctxOf "c3" [("X",2),("W",3),("H",1),("N",2)]]
      e7=relate leafInfo wide depCtxs xPlus2 xPlusW (leaf "W") [[1]]
  assert "training inconsistency: case support withdrawn (NotSupported), witnesses still reported" (eStatus e7==NotSupported && case eCase e7 of CaseDisagree a d->length a==3 && d==["c3"]; _->False)
  let partialCtx=[ctxOf "p0" [("X",1),("W",2),("H",1),("N",2)]]   -- P is missing: precondition not met
      e8=relate leafInfo partialCtx [] (LApp OpAdd [leaf "P",int 2]) (LApp OpAdd [leaf "P",leaf "W"]) (leaf "W") [[1]]
  assert "precondition not met: case witness is Unknown/NotApplicable, never agreement" (case eCase e8 of CaseUnknown r->"NotApplicable" `isPrefixOf` r; _->False)
  let e9=rel xPlus2 xPlusN (leaf "N")
  assert "dependency observed only through a counterfactual (insert): confirmed; without it: pending" (eStatus e9==Confirmed && eStatus (relate leafInfo trainCtxs [] xPlus2 xPlusN (leaf "N") [[1]])==PendingDependency)
  assert "substitution keeps the binder: the replacement's leaves are the free input dependencies of the result" (sort (nub (lLeaves (swAfter (eStructural e1))))==["W","X"])
  -- 5. B3/B4: graph, classes, VSA, schedules, refresh
  let sb=(stageB fullB) {sbGraphBudget=5000}
      leaves=[("X",TyInt),("W",TyInt),("H",TyInt),("N",TyInt)]
      g=buildGraph sb hcA leafInfo leaves TyInt trainCtxs depCtxs []
      st=rgStats g
      nodeOf t=M.lookup (nf t) (rgIndex g)
  assert "graph: X+2, X+W, X+N, X+H are nodes; X+2/X+W/X+N share one agreement class, X+H does not" (all (/=Nothing) [nodeOf xPlus2,nodeOf xPlusW,nodeOf xPlusN,nodeOf xPlusH]
    && length (nub [rgClassOf g M.! i | Just i<-[nodeOf xPlus2,nodeOf xPlusW,nodeOf xPlusN]])==1 && (rgClassOf g M.! (maybe 0 id (nodeOf xPlusH)))/=(rgClassOf g M.! (maybe 0 id (nodeOf xPlus2))))
  let confirmedPairs=[(eFrom e,eTo e) | e<-rgEdges g, eStatus e==Confirmed]
  assert "graph: confirmed edges X+2 -> X+W and X+2 -> X+N (incomparable branches both kept)" (all (`elem` confirmedPairs) [(i,j) | Just i<-[nodeOf xPlus2], Just j<-[nodeOf xPlusW]] && all (`elem` confirmedPairs) [(i,j) | Just i<-[nodeOf xPlus2], Just j<-[nodeOf xPlusN]]
    && not (any (\(a,c)->Just a==nodeOf xPlusW && Just c==nodeOf xPlusN || Just a==nodeOf xPlusN && Just c==nodeOf xPlusW) confirmedPairs))
  assert "graph: generality X+2 < X+W, acyclic (sccs == nodes), closure counted, every confirmed edge fully witnessed" (M.findWithDefault 0 (maybe 0 id (nodeOf xPlus2)) (rgGenerality g)<M.findWithDefault 0 (maybe 0 id (nodeOf xPlusW)) (rgGenerality g)
    && gsSCCs st==gsNodes st && gsClosureEdges st>=gsEdgesConfirmed st && gsWitnessFull st==gsEdgesConfirmed st && gsEdgesConfirmed st>0)
  assert "VSA: expansion of every class equals the plain candidate list; unions exist; sharing ratio >= 1" (gsExpansionOk st && gsVSAUnions st>0 && gsSharingAvgX100 st>=100 && gsExpanded st==gsNodes st)
  assert "VSA: shared DAG evaluation does strictly less work than the per-term reference" (gsDAGEvaluations st<gsReferenceEvaluations st && gsBuildWork st==gsDAGEvaluations st)
  let gPlain=buildGraph sb {sbSharedVSA=False} hcA leafInfo leaves TyInt trainCtxs depCtxs []
  assert "NoSharedVSA: identical classes and edges, build work equals the reference evaluations, no DAG evaluation performed" (rgClasses gPlain==rgClasses g && length [() | e<-rgEdges gPlain, eStatus e==Confirmed]==gsEdgesConfirmed st && gsBuildWork (rgStats gPlain)==gsReferenceEvaluations st && gsDAGEvaluations (rgStats gPlain)==0)
  let vsaIds=[rgRoots g M.! i | i<-M.keys (rgNodes g)]
  assert "VSA: proven-equal terms (x+0, x) share one node; train-equal terms (X+2, X+W) are distinct nodes in one class" (fst (intern (nf (LApp OpAdd [leaf "X",int 0])) (rgVSA g))==fst (intern (leaf "X") (rgVSA g)) && length (nub vsaIds)==length vsaIds)
  assert "graph determinism: rebuilding gives the same hash, nodes and edges" (let g2=buildGraph sb hcA leafInfo leaves TyInt trainCtxs depCtxs [] in rgSnapshotHash g2==rgSnapshotHash g && rgStats g2==st && map (\e->(eFrom e,eTo e,eStatus e)) (rgEdges g2)==map (\e->(eFrom e,eTo e,eStatus e)) (rgEdges g))
  let orders=[(s,scheduleOrder s g) | s<-[minBound..maxBound]]
      gen i=M.findWithDefault 0 i (rgGenerality g)
  assert "schedules are permutations of the same node set" (all (\(_,o)->sort o==M.keys (rgNodes g)) orders)
  assert "GeneralFirst starts at maximal generality, SpecificFirst at 0, CostFirst is cost-monotone" (gen (head (scheduleOrder GeneralFirst g))==maximum (M.elems (rgGenerality g)) && gen (head (scheduleOrder SpecificFirst g))==0
    && and (zipWith (\a c->rfCost (rgNodes g M.! a)<=rfCost (rgNodes g M.! c)) (scheduleOrder CostFirst g) (tail (scheduleOrder CostFirst g))))
  assert "Interleaved rotates fairly over the generality layers" (let o=take 3 (scheduleOrder Interleaved g) in length (nub (map gen o))==min 3 (gsLayers st))
  let g'=refreshGraph sb leafInfo g wide depCtxs
      st'=rgStats g'
      edgeW=[e | e<-rgEdges g', Just (eFrom e)==nodeOf xPlus2, Just (eTo e)==nodeOf xPlusW]
  assert "new case (width 3) withdraws the case support of X+2 -> X+W; the edge, its structural witness and both nodes remain; X+2 -> X+N stays confirmed" (length edgeW==1 && eStatus (head edgeW)==NotSupported
    && swReplacement (eStructural (head edgeW))==leaf "W" && M.size (rgNodes g')==M.size (rgNodes g) && length (rgEdges g')==length (rgEdges g) && gsEdgesConfirmed st'<gsEdgesConfirmed st
    && any (\e->Just (eFrom e)==nodeOf xPlus2 && Just (eTo e)==nodeOf xPlusN && eStatus e==Confirmed) (rgEdges g'))
  assert "no permanent candidate collapse: re-grounding on the original contexts restores the confirmed edge" (let g''=refreshGraph sb leafInfo g' trainCtxs depCtxs in gsEdgesConfirmed (rgStats g'')==gsEdgesConfirmed st)
  let rowsK=[(0,VI 3),(1,VI 6),(2,VI 9)]   -- target X+2 on the three contexts
      cs=searchClasses sb g rowsK
  assert "class search: one check per class, the fitting class yields X+2, X+W and X+N; lookups = checks x rows" (all (\t->maybe False (`elem` csFits cs) (nodeOf t)) [xPlus2,xPlusW,xPlusN] && csRowLookups cs==csClassChecks cs*3 && csFittingClasses cs>=1 && csCandidatesCovered cs>0)
  let flat=searchFlat sb g [(cxEval c,t) | (c,(_,t))<-zip trainCtxs rowsK]
  assert "flat search finds the same fitting candidates with per-term row evaluations" (sort (csFits flat)==sort (csFits cs) && csRowEvaluations flat>csRowLookups cs)
  let tiny=searchClasses sb {sbLayerBudget=1} g rowsK
  assert "per-layer budget truncation is reported" (csTruncated tiny && sum (M.elems (csLayerTruncated tiny))>0)
  -- 6. front end: mechanism tasks, regression against Stage A FullA
  let run conf t=frontSearch SafeOnline conf (training t)
      m k f=metric k (graph f)
  forM_ (mechanismInstancesB 2) $ \ins->do
    let t=instanceTaskB ins; fam=insFamilyB ins; label=taskId t
    forM_ namedConfigsB $ \(cn,conf)->do
      let f=run conf t
      assert (label++" "++cn++": invariants (no concrete high edges, no untriggered expansions, VSA expansion check)") (m "ConcreteCrossItemEdgeCount_high_level" f==0 && m "UntriggeredExpansionCount" f==0 && m "b_vsa_expansion_mismatch" f==0)
      when (cn `elem` familyExpectationB fam) $ assert (label++" "++cn++": train-exact (positive control)") (trainExactOf t f)
    let full=run fullB t
    when (fam==ThresholdIf) $ putStrLn ("INFO "++label++" BaselineA train-exact="++show (trainExactOf t (run baselineA t))++" (Stage A typed holes reach Height>2 by composition, e.g. isOdd(Height div 3); reported, not a negative control)")
    when (fam==MoveToOwnRightEdge) $ assert (label++": FullB heldout exact (scoring only)") (heldExactOf t full)
    when (fam==ThresholdIf) $ putStrLn ("INFO "++label++" heldout: FullB="++show (heldExactOf t full)++" B0Only="++show (heldExactOf t (run b0Only t))++" (reported, not asserted: many train-exact fits)")
    when (fam `elem` [CaseSupportedWidth,ConstantTruthWidth,IncomparableBranches]) $ do
      assert (label++": FullB used the hierarchy and built a snapshot with confirmed edges") (m "b_snapshots_built" full>=1 && m "b_edges_confirmed" full>0 && m "b_hierarchy_solved_slots" full>=1)
      let perm=frontSearch SafeOnline fullB {enumerationSeed=Just (insSeedB ins+5)} (training t)
      assert (label++": permutation invariance (definitions, execution, test predictions and snapshot hash; the Program record itself carries the seed)") (fmap progDefs (program perm)==fmap progDefs (program full) && fmap progExec (program perm)==fmap progExec (program full) && [runProgram p (testInput q) | Just p<-[program perm], q<-tests t]==[runProgram p (testInput q) | Just p<-[program full], q<-tests t] && [rsHash r | r<-referents (graph perm)]==[rsHash r | r<-referents (graph full)])
      assert (label++": determinism") (program (run fullB t)==program full)
  let [c1,c2]=[instanceTaskB i | fam<-[CaseSupportedWidth,ConstantTruthWidth], i<-mechanismInstancesB 1, insFamilyB i==fam]
      f1=run fullB c1; f2=run fullB c2
  assert "counterexample pair: identical training grids give an identical program (non-identifiable from training)" (training c1==training c2 && program f1==program f2)
  putStrLn ("INFO counterexample pair heldout: CaseSupportedWidth="++show (heldExactOf c1 f1)++" ConstantTruthWidth="++show (heldExactOf c2 f2)++" (at most one can be right; reported, not asserted)")
  assert "counterexample pair: at most one heldout is right" (not (heldExactOf c1 f1 && heldExactOf c2 f2))
  assert "counterexample pair: the constant (4) and an Ext-dependent reading both survive in one class" (any (\c->any (\r->"TConst (VI 4)" `isInfixOf` r) (scRepTexts c) && any (\r->"Ext Current" `isInfixOf` r) (scRepTexts c)) (classes (graph f1)))
  -- regression: BaselineA == Stage A FullA on the Stage A mechanism instances and the v0.6.1 tasks
  forM_ ([(taskId (instanceTask i),instanceTask i) | i<-mechanismInstances 1]++v61Tasks vertical) $ \(name,t)->do
    let base=run fullA t; a=run baselineA t
    assert (name++": BaselineA program == Stage A FullA program") (program a==program base && failure a==failure base && m "search_work" a==m "search_work" base)
  let v=run fullB vertical
  assert "03560426 FullB: train and heldout exact (grammar path, no snapshot built)" (trainExactOf vertical v && heldExactOf vertical v && m "b_snapshots_built" v==0)
  putStrLn "All stage-b tests passed."
  where
    opsOf (TApp op as)=op:concatMap opsOf as
    opsOf _=[]
    boolOnlyUnderIf e=go False e
      where go underBool (TApp op as)=(op `notElem` boolOps || underBool) && and [go (underBool || (op==OpIf && k==0) || snd (opSignature op)==TyBool && op `elem` boolOps) a | (k,a)<-zip [0::Int ..] as]
            go _ _=True
