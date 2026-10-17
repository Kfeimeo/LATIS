{-# LANGUAGE GADTs #-}
module Synthesis.Constraint.Propagate where
import Synthesis.Constraint.State
import Synthesis.Constraint.Metrics
import Synthesis.Expression.FreeVars
import Synthesis.Expression.Domain
import Synthesis.Search.Memo
import Synthesis.Residual
import Synthesis.Hole
import Synthesis.Dependency
import Synthesis.Skeleton
import Synthesis.Search (opEffects,filterGrammar,schemaName)
import Language.DSA
import Language.Effect
import Language.Types
import Language.Witness
import Latent.Object
import Latent.Correspondence
import qualified Data.Map.Strict as M
import qualified Data.Set as S
import Data.List (sortOn)

data Engine = Engine { counters :: Metrics, memo :: Memo, events :: [String] }
emptyEngine :: Engine
emptyEngine = Engine emptyMetrics emptyMemo []
emit :: String -> Engine -> Engine
emit s e = e {events=s:events e}
count :: (Metrics -> Metrics) -> Engine -> Engine
count f e = e {counters=f (counters e)}

initialState :: JointMode -> [[LatentExample]] -> [Evidence] -> (ConstraintState,Engine)
initialState mode bundles extras = (state,engine)
  where
    analyses = [(if mode == NoWitnessFirst then analyzeDependencies ex else ([],0)) | ex <- bundles]
    checks = sum (map snd analyses)
    ordinary = [makeFrame bid order ex fs | (bid,(ex,(evidence,_))) <- zip [0..] (zip bundles analyses), order <- allOrders,
      let fs = if mode == NoWitnessFirst then S.fromList [family sk | Evidence sk _ <- evidence, hasOrder order sk]
               else S.fromList [MapFamily,ScanFamily,FilterFamily], not (S.null fs)]
    macros = [Frame ("macro"++show i) (-1) ExtractionOrder [] (S.singleton (family sk)) M.empty M.empty [] (Just (program sk)) S.empty False
      | (i,Evidence sk _) <- zip [0::Int ..] extras]
    state = ConstraintState (ordinary++macros) S.empty S.empty
      (M.fromList [(nodeId n,residual [(current (instanceContext i),instanceTarget i) | i<-nodeInstances n]) | f<-ordinary,n<-M.elems (nodes f)])
      (M.fromList [(bid,[c | (_,_,c) <- ex]) | (bid,ex) <- zip [0..] bundles]) False
    engine = emit ("Initial Sigma: "++show (length ordinary)++" guarded order/correspondence frames; Gamma fresh; D empty; context={current}")
      $ emit ("Initial correspondence bundles="++show bundles++"; residuals="++show (M.toList (residualSpecification state)))
      $ count (\m -> (charge checks m) {legacyDependencyChecks=checks}) emptyEngine
    family (MapSkeleton _) = MapFamily
    family (ScanSkeleton _) = ScanFamily
    family FilterSkeleton = FilterFamily
    family FoldSkeleton = FoldFamily
    family (IterateSkeleton _ _) = IterateFamily
    hasOrder o (MapSkeleton p) = o==p
    hasOrder o (ScanSkeleton p) = o==p
    hasOrder _ FilterSkeleton = True
    hasOrder _ _ = False
    program FoldSkeleton = FoldBBoxP
    program (IterateSkeleton n v) = IterateP n v
    program _ = IdentityP
    makeFrame bid order ex fs = Frame (show bid++"/"++show order) bid order ex fs
      (M.fromList [(r,allOperators) | r <- [Body,Initial,Step]])
      (M.fromList [((r,op),Node (show bid++"/"++show order++"/"++show r++"/"++show op) r op
         (instances r order ex) Uninstantiated (scopeFor (mode/=NoBidirectionalSkeleton) (mode/=NoLazyContext) r)
         0 S.empty S.empty False Nothing False) | r <- [Body,Initial,Step], op <- allOperators])
      filterGrammar Nothing S.empty False
    instances role order ex = concat [decorate i values | (i,example) <- zip [1..] ex,
      let (a,b)=scanExamples order [example]; values=case role of Body -> mapExamples order [example]; Initial -> a; Step -> b]
    decorate i xs = [Instance c t i (objectId (current c)) | (c,t) <- xs]

-- Necessary later-wins ordering from correspondence, independent of parameters.
orderLegal :: Frame -> Bool
orderLegal f = all legal (frameExamples f)
  where legal (x,_,c) = all (\edge -> all (before (objectId (visibleObject edge))) (S.toList (occludedBy edge))) (matched c)
          where ids = [objectId (visibleObject edge) | o <- orderObjects (frameOrder f) (objects x), edge <- matched c, objectId o==objectId (sourceObject edge)]
                table = M.fromList (zip ids [0::Int ..])
                before a b = M.lookup a table < M.lookup b table

-- Each change reduces a finite domain or advances one finite context cursor.
-- Rule order is deterministic; it never chooses one of several surviving terms.
propagateToFixpoint :: JointMode -> ConstraintState -> Engine -> (ConstraintState,Engine)
propagateToFixpoint mode state engine
  | atFixedPoint state = (state,engine)
  | otherwise = loop (0::Int) state engine
  where
    loop roundNo s e =
      let e0=count (\m -> m {propagationIterations=propagationIterations m+1}) e
          (fs,records,e1)=foldl visit ([],[],e0) (partialProgram s)
          s1=addRecords records s {partialProgram=fs,correspondenceDomain=M.fromList
            [(branchId f,[c | (_,_,c)<-frameExamples f]) | f<-fs,branchId f>=0,not (S.null (families f))]}
          changed=not (sameState s1 s)
          added=S.toList (constraintSet s1 S.\\ constraintSet s)
          changes=[frameSummary f | (f,old)<-zip fs (partialProgram s),frameProgress f/=frameProgress old]
          e2=emit ("Propagation round "++show roundNo++": added="++show added++"; removed constraints=[] (proofs retained); domain changes="++show changes++"; "++if changed then "continue" else "fixed point") e1
      in if changed then loop (roundNo+1) s1 e2 else (s1 {atFixedPoint=True},e2)
    visit (fs,rs,e) f =
      let (g,cs,e')=propagateFrame mode f (count (\m->m {propagationRuleCalls=propagationRuleCalls m+1}) e)
          changed=frameProgress f/=frameProgress g
          en=if changed then count (\m->(charge 1 m) {deterministicSteps=deterministicSteps m+1}) e' else e'
      in (fs++[g],rs++cs,en)

propagateFrame :: JointMode -> Frame -> Engine -> (Frame,[ConstraintRecord],Engine)
propagateFrame mode f e
  | S.null (families f) || macroPresent f = (f,[],e)
  | not (orderLegal f) = contradiction "occlusion order conflicts with skeleton order" f e
  | otherwise =
    let unchanged=all (\(_,_,q) -> all (\(a,b)->objectResidual a b==S.empty) (correspondencePairs q)) (frameExamples f)
        full=all (null . removed . third) (frameExamples f)
        keep fam=case fam of MapFamily -> full; ScanFamily -> full; FilterFamily -> unchanged; _ -> True
        f0=f {families=S.filter keep (families f),predicates=if unchanged then filter (filterFits f) (predicates f) else []}
        (f1,rs,e1)=foldl run (f0,[],e) [Body,Initial,Step]
        ds=concat [record DependencyConstraint (nodeId n++": "++actionText a++" FV="++show (S.toList (actionFreeVars a))) "expression-free-variables" f (sample n) ["typed witness value constraints","current operand bound by primitive schema"]:
          [record DependencyConstraint (nodeId n++": guarded output "++show (objectId (instanceTarget i))++" <- "++binding source i++" via "++actionText a)
            "expression-dependency-edge" f (Just i) ["FV of typed expression","correspondence/context binding"]
            | i<-nodeInstances n,source<-S.toList (actionFreeVars a)]
           | n <- M.elems (nodes f1), a <- nodeActions n]
        pairs=[(actionText a,actionText b) | a <- roleActions f1 Initial,b <- roleActions f1 Step,
          actionText a==actionText b,not (actionPrevious a),any ((==actionText a) . actionText) (roleActions f1 Body)]
        fresh=S.fromList pairs S.\\ dominancePairs f1
        f2=f1 {dominancePairs=if mode==NoStructuralDominance then S.empty else dominancePairs f1 `S.union` fresh}
        dom=[record StructuralConstraint ("Scan("++a++","++b++") -> Map("++a++")") "global-scan-map-rewrite" f Nothing
          ["same AST in seed and step","FV excludes Previous","scan includes seed","same sorting and rendering"] | (a,b)<-S.toList fresh,mode/=NoStructuralDominance]
        e2=if S.null fresh || mode==NoStructuralDominance then e1 else
          count (\m -> (charge (S.size fresh) m) {provenDominance=provenDominance m+S.size fresh}) (emit ("ProvenDominated: "++show pairs++"; other training-equivalent terms PreferredLater") e1)
        facts=rs++ds++dom++[record StructuralConstraint ("supported structures="++show (activeFamilies f2)) "dependency-skeleton-support" f Nothing ["Map requires no Previous","Scan requires supported seed and step"],
          record StructuralConstraint ("population/unchanged domains="++show (S.toList (families f0))) "population-and-filter-support" f Nothing ["removed objects="++show (map (map objectId . removed . third) (frameExamples f)),"unchanged matched residual="++show unchanged],
          record StructuralConstraint ("order="++show (frameOrder f)++" satisfies occlusion DAG") "occlusion-order-support" f Nothing [show [matched c | (_,_,c)<-frameExamples f]]]
        f3=f2 {families=S.filter (possible f2) (families f2)}
    in if S.null (families f3) then let (bad,cr,e3)=contradiction "all operator/context supports exhausted" f3 e2 in (bad,facts++cr,e3)
       else (f3,facts,e2)
  where
    third (_,_,q)=q
    possible g MapFamily = not (null (roleActions g Body)) || rolePending g Body || roleHasFuture g Body
    possible g ScanFamily = not (null (scanPairs g)) || any (rolePending g) [Initial,Step] || any (roleHasFuture g) [Initial,Step]
    possible g FilterFamily = not (null (predicates g))
    possible _ _ = True
    run (g,rs,en) role
      | not (roleNeeded (families g) role) = (g,rs,en)
      | otherwise = let (ns,records,en')=foldl visit (nodes g,[],en) (M.findWithDefault [] role (operatorDomains g))
                        ops=[op | op <- M.findWithDefault [] role (operatorDomains g), Just n <- [M.lookup (role,op) ns],not (rejectedNode n)]
                    in (g {nodes=ns,operatorDomains=M.insert role ops (operatorDomains g)},rs++records,en')
      where visit (ns,acc,engine) op = case M.lookup (role,op) ns of
              Nothing -> (ns,acc,engine)
              Just n -> let (n',cs,en')=propagateNode mode g n (count (\m->m {propagationRuleCalls=propagationRuleCalls m+1}) engine) in (M.insert (role,op) n' ns,acc++cs,en')

sample :: Node -> Maybe Instance
sample n = case nodeInstances n of a:_ -> Just a; _ -> Nothing
rejectedNode :: Node -> Bool
rejectedNode n = case nodePayload n of RejectedPayload _ -> True; _ -> False
contradiction :: String -> Frame -> Engine -> (Frame,[ConstraintRecord],Engine)
contradiction why f e = (f {families=S.empty,contradictionRecorded=True},
  [record StructuralConstraint why "contradiction" f Nothing ["necessary constraints"]],
  if contradictionRecorded f then e else count (\m -> (charge 1 m) {contradictions=contradictions m+1}) (emit (frameId f++" contradiction before complete program: "++why) e))
filterFits :: Frame -> Predicate -> Bool
filterFits f p = all (\(x,_,c)-> all (\o -> predicate p o == (objectId o `S.notMember` gone c)) (objects x)) (frameExamples f)
  where gone c=S.fromList (map objectId (removed c))

propagateNode :: JointMode -> Frame -> Node -> Engine -> (Node,[ConstraintRecord],Engine)
propagateNode mode f n e
  | rejectedNode n || nodeReady n = (n,[],e)
  | not (witnessDone n) =
    let req=residual [(current (instanceContext i),instanceTarget i) | i <- nodeInstances n]
        e0=count (\m -> (charge 1 m) {effectQueries=effectQueries m+1,propagationRuleCalls=propagationRuleCalls m+1}) e
        eff=record EffectConstraint (nodeId n++" required="++show req++" writes="++show (opEffects (nodeOperator n))) "effect-subset" f (sample n) []
    in case eligibility req (opEffects (nodeOperator n)) of
      ProvenImpossible why -> (n {nodePayload=RejectedPayload why,witnessDone=True,nodeReady=True},[eff],emit (nodeId n++" effect removes operator: "++why) e0)
      _ -> bind req eff e0
  | otherwise = probe mode f n e
  where
    bind _ eff e0 =
      let is=nodeInstances n; xs=[(instanceContext i,instanceTarget i) | i<-is]
          e1=count (\m -> (charge (length xs) m) {witnessQueries=witnessQueries m+length xs}) e0
          result=case nodeOperator n of
            TranslateOp -> do cs<-traverse (uncurry translateWitness) xs; name<-schemaName TranslateOp TVec cs; h<-translationHole name cs; pure (VectorPayload h [])
            RecolorOp -> do cs<-traverse (uncurry recolorWitness) xs; name<-schemaName RecolorOp TInt cs; h<-colorHole name cs; pure (ColorPayload h [])
            op -> if all (\(c,t)->fixedWitness op (current c) t) xs then Right (FixedPayload (Fixed op)) else Left "fixed witness contradicts output"
          payload=either RejectedPayload id result
          n1=n {nodePayload=payload,witnessDone=True,nodeReady=case payload of FixedPayload _->True; RejectedPayload _->True; _->False,
            scopePlan=case payload of FixedPayload _->[]; RejectedPayload _->[]; _->scopePlan n}
          values=case payload of VectorPayload h _->[show (requiredValue c) | c<-constraints h]; ColorPayload h _->[show (requiredValue c) | c<-constraints h]; _->[]
          typeText=case nodeOperator n of TranslateOp->typeName TVec; RecolorOp->typeName TInt; _->"Object -> Object"
          records=eff:record TypeConstraint (nodeId n++" schema parameter type="++typeText) "typed-schema-binding" f (sample n) ["registry schema"]:
            [record ValueConstraint (nodeId n++" required="++v) "operator-witness" f (Just i)
               ["source="++show (current (instanceContext i)),"target="++show (instanceTarget i)] | (i,v)<-zip is values]
          e2=emit (nodeId n++" witness values="++show values++either (" rejected: "++) (const "") result)
            $ count (\m -> (charge 1 m) {witnessHoles=witnessHoles m+if null values then 0 else 1,deterministicSteps=deterministicSteps m+1}) e1
      in (n1,records,e2)

binding :: Source -> Instance -> String
binding CurrentSource i="CurrentSource(input object "++show (objectId (current (instanceContext i)))++")"
binding PreviousSource i="PreviousSource(prior output object "++show (objectId <$> previous (instanceContext i))++")"
binding GridSource i="GridSource("++show (contextCanvas (instanceContext i))++")"

probe :: JointMode -> Frame -> Node -> Engine -> (Node,[ConstraintRecord],Engine)
probe mode f n e
  | scopeCursor n >= length (scopePlan n) = (n {nodeReady=True},[],e)
  | otherwise = case nodePayload n of
      VectorPayload h old -> let (ps,n',en)=resolve h old in finish (n' {nodePayload=VectorPayload h ps}) en
      ColorPayload h old -> let (ps,n',en)=resolve h old in finish (n' {nodePayload=ColorPayload h ps}) en
      _ -> (n {nodeReady=True},[],e)
  where
    scope=scopePlan n!!scopeCursor n
    finish n' en = (n',[record DependencyConstraint (nodeId n++" context="++show (S.toList scope)) "lazy-context-support" f (sample n)
         ["previous smaller context exhausted or first context","skeleton admissible binders"]],en)
    resolve :: (Eq a,Show a) => Hole a -> [Param a] -> ([Param a],Node,Engine)
    resolve h old =
      let key=domainKey h scope; allTerms=scopedGrammar h scope
          cached=if mode==NoMemoization then Nothing else M.lookup key (expressionCache (memo e))
          fresh=[p | p<-allTerms,paramText p `S.notMember` testedTerms n]
          valid=case cached of Just cachedTerms->[p | p<-allTerms,paramText p `elem` cachedTerms]; Nothing->filter (satisfies (constraints h)) fresh
          terms=uniqueParams (old++valid)
          finished=not (null terms) || scopeCursor n+1==length (scopePlan n)
          n'=n {scopeCursor=scopeCursor n+1,testedTerms=testedTerms n `S.union` S.fromList (map paramText allTerms),
            passedTerms=S.fromList (map paramText terms),nodeReady=finished}
          accepted=[p | p<-allTerms,paramText p `elem` map paramText terms]
          cache'=if mode==NoMemoization then memo e else (memo e) {expressionCache=M.insert key (map paramText accepted) (expressionCache (memo e))}
          tests=case cached of Just _->0; _->length fresh
          expansion=if scopeCursor n==0 then 0 else 1
          en=emit (nodeId n++" type="++typeName (holeType h)++" context="++show (S.toList scope)++" tests="++show tests++" memo="++show (maybe False (const True) cached)++
              " candidates="++show [(paramText p,S.toList (freeVars p),rankParam p, paramText p `elem` map paramText terms) | p<-allTerms]++
              " remaining domain="++show [(paramText p,S.toList (freeVars p)) | p<-terms])
            $ count (\m -> (charge (tests+expansion) m) {expressionTests=expressionTests m+tests,contextExpansions=contextExpansions m+expansion,
              previousExpansions=previousExpansions m+if expansion==1 && PreviousSource `S.member` scope then 1 else 0,
              gridExpansions=gridExpansions m+if expansion==1 && GridSource `S.member` scope then 1 else 0,
              expressionMemoQueries=expressionMemoQueries m+1,expressionMemoHits=expressionMemoHits m+maybe 0 (const 1) cached}) e {memo=cache'}
      in (sortOn rankParam terms,n',en)

-- Deferred domains retain all earlier terms. Advancing one frontier preserves
-- cross-products, so a cheap expression never erases a later valid solution.
advanceFrontier :: ConstraintState -> Maybe ConstraintState
advanceFrontier s = case [(frameId f,k) | f<-partialProgram s,(k,n)<-M.toList (nodes f),roleNeeded (families f) (nodeRole n),
    not (rejectedNode n),scopeCursor n<length (scopePlan n),nodeReady n] of
  [] -> Nothing
  (fid,key):_ -> Just s {atFixedPoint=False,partialProgram=map advance (partialProgram s)}
    where advance f | frameId f/=fid=f
                    | otherwise=f {nodes=M.adjust (\n->n {nodeReady=False}) key (nodes f)}
