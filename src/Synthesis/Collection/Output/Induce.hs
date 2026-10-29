-- LATIS Stage E4: joint induction of one shared construction skeleton Q over
-- ALL training outputs.
--
--   exists Q, theta_1..theta_n :  forall i. Render(Q[theta_i]) == O_i
--
-- 1. every output gets its legal scene candidates (Output.Scene);
-- 2. a view assignment picks one candidate per case (same view for every
--    case first; mixed assignments only afterwards, with a view-switch cost);
-- 3. roles are aligned across cases by STRUCTURE (common Shape AST signature
--    among the alternatives), never by list position: equal object counts ->
--    bounded enumeration of compatible bijections against the roles of the
--    first case (every assignment that reaches the best cost is reported as
--    an ambiguity / alternative); different counts -> classes by (colour,
--    primary signature), classes with equal counts are matched, a class with
--    varying counts becomes a linear Repeat only when every member has the
--    same mask and the positions form an arithmetic progression, otherwise
--    UnsupportedVariableMultiplicity;
-- 4. typed anti-unification column by column: equal values -> literal, a
--    constant offset from an existing hole -> IOff, else a new typed hole;
--    DisjointUnion operands may be swapped per case (both orders tried, the
--    choice recorded); the same hole table serves shapes, positions, canvas
--    and colours, so relations such as "inner = outer + 1" or "object B is 3
--    right of object A" become IOff relations instead of free holes;
-- 5. Render(Q[theta_i]) is checked against O_i for every case (construction
--    witness with pixel provenance); the cost and the non-triviality test
--    (Template.nontrivialStructure) decide the status.
-- Pairwise-only and independent modes exist as ablations. The result never
-- touches the solver's program: prediction_ready = false, every hole is
-- OutputObserved with InputBindingStatus = NotAttempted.
module Synthesis.Collection.Output.Induce
  ( InduceMode(..), InduceConfig(..), induceOff, induceOn, Skeleton(..), RoleMatch(..), InduceResult(..), SkeletonStatus(..)
  , induceOutputSkeleton, instantiateOnOutput, induceJSON, skeletonJSON, statusText, e4MetricNames, e4Metrics, artifactJSON
  ) where

import Latent.Grid
import Synthesis.Collection.Geometry.View (ViewId(..), viewText)
import Synthesis.Collection.Geometry.Cover (PixelSet, Rect(..))
import Synthesis.Collection.Region.ShapeMDL (ShapeExpr(..), shapeText, shapeCost, shapeAlternatives)
import Synthesis.Collection.Output.Template
import Synthesis.Collection.Output.Scene
import Synthesis.Collection.Diagnostics (jstr, jobj, jarr, jbool, jmaybe, stableHash, timedForce)
import qualified Data.Map.Strict as M
import qualified Data.Set as S
import Data.List (sortOn, nub, sort, intercalate, foldl', permutations)
import Data.Maybe (isJust, mapMaybe)

data InduceMode = JointAll | IndependentOnly | PairwiseOnly | FirstSceneOnly deriving (Eq,Show)
data InduceConfig = InduceConfig
  { icEnabled :: Bool, icMode :: InduceMode, icBudget :: OutputBudget
  , icAuditSolved :: Bool      -- also run on tasks the solver already solved (audit mode; never changes the program)
  , icSharing :: Bool          -- memoise role anti-unification columns (structural sharing); off = recompute
  , icMDLScore :: Bool         -- choose among common structures by total Shape AST cost (off: first alternative order)
  } deriving (Eq,Show)
induceOff, induceOn :: InduceConfig
induceOff=InduceConfig False JointAll defaultOutputBudget True True True
induceOn=InduceConfig True JointAll defaultOutputBudget True True True

data SkeletonStatus = StructureVerifiedAllOutputs | StructureVerifiedSubset | NoNontrivialSharedStructure | RepresentationUnavailable | ExhaustedInBoundedGrammar | BudgetTruncated | NotAttempted | SingleOutputStructuralCompression deriving (Eq,Show)
statusText :: SkeletonStatus -> String
statusText=show

data RoleMatch = RoleMatch { rmRole :: Int, rmKind :: String, rmMembers :: [(Int,[Int])], rmSignature :: String, rmSwaps :: [(Int,String)] } deriving (Eq,Show)   -- (case, object ids)
data Skeleton = Skeleton
  { skScene :: SceneT, skBindings :: [(Int,Bindings)], skHoles :: [HoleInfo], skViews :: [(Int,ViewId)], skRoles :: [RoleMatch]
  , skCost :: CostBreakdown, skAmbiguity :: Int, skRenderOk :: [(Int,Bool)], skProvenance :: [(Int,[(String,Int)])], skNontrivial :: Either String ()
  , skSignatureChoice :: [(Int,String)]
  , skCheaperOtherView :: Maybe Int                -- total cost of the cheapest independent explanations over ANY view when that is below the skeleton's own-view independent total
  } deriving (Eq,Show)
data InduceResult = InduceResult
  { irStatus :: SkeletonStatus, irReason :: String, irBest :: Maybe Skeleton, irAlternatives :: [Skeleton]
  , irScenes :: [[OutputSceneCandidate]], irRejectedViews :: [(Int,ViewId,String)], irFailures :: [(String,String)]   -- (view assignment, reason)
  , irCounters :: M.Map String Int, irIndependent :: [(Int,Int)], irDegenerate :: [(String,Int)], irTruncated :: [String]
  , irPairwise :: Maybe [((Int,Int),String)], irConfig :: InduceConfig, irCases :: Int } deriving (Eq,Show)

-- ---------------------------------------------------------------- hole table

data HT = HT { htNext :: Int, htHoles :: [(HoleId,HoleType,[Int],String)] }   -- values indexed by case position
emptyHT :: HT
emptyHT=HT 0 []
-- Anti-unify one integer column: literal, offset from an existing int hole, or a new hole.
unifyInt :: String -> [Int] -> HT -> (IntExpr,HT)
unifyInt role vs ht
  | all (==head vs) vs = (ILit (head vs),ht)
  | otherwise = case [(h,d) | (h,HInt,ws,_)<-htHoles ht, let ds=zipWith (-) vs ws, all (==head ds) ds, let d=head ds] of
      ((h,0):_)->(IHole h,ht)
      ((h,d):_)->(IOff h d,ht)
      []->let h=htNext ht in (IHole h,ht {htNext=h+1,htHoles=htHoles ht++[(h,HInt,vs,role)]})
unifyColour :: String -> [Int] -> HT -> (ColourExpr,HT)
unifyColour role vs ht
  | all (==head vs) vs = (CLit (head vs),ht)
  | otherwise = case [h | (h,HColour,ws,_)<-htHoles ht, ws==vs] of
      (h:_)->(CHole h,ht)
      []->let h=htNext ht in (CHole h,ht {htNext=h+1,htHoles=htHoles ht++[(h,HColour,vs,role)]})
unifyInts :: String -> [[Int]] -> HT -> ([IntExpr],HT)   -- columns
unifyInts role cols ht=foldl' (\(acc,t) (k,col)->let (e,t')=unifyInt (role++"/"++show k) col t in (acc++[e],t')) ([],ht) (zip [0::Int ..] cols)

-- Anti-unify shapes with the same signature; DisjointUnion operands may be
-- swapped per case (the swap list records which cases were swapped).
unifyShapes :: String -> [ShapeExpr] -> HT -> Maybe (ShapeT,HT,[(Int,String)])
unifyShapes role es ht=case es of
  (SRect _:_) | all isRect es -> let cols=[[rx0 r | SRect r<-es],[ry0 r | SRect r<-es],[rx1 r | SRect r<-es],[ry1 r | SRect r<-es]]
                                     (ps,ht')=unifyInts (role++"/rect") cols ht
                                 in case ps of [a,b,c,d]->Just (TRect a b c d,ht',[]); _->Nothing
  (SDiff _ _:_) | all isDiff es -> do
      (l,ht1,s1)<-unifyShapes (role++"/minuend") [a | SDiff a _<-es] ht
      (r,ht2,s2)<-unifyShapes (role++"/subtrahend") [b | SDiff _ b<-es] ht1
      Just (TDiff l r,ht2,s1++s2)
  (SUnion a0 b0:rest) | all isUnion es ->
      -- per case choose the operand order that unifies with the first case's structure; prefer no swap, then fewer new holes
      let options=sequence [orders a0 b0 e | e<-rest]
          tryOrder ords=do
            let lefts=a0:[l | (l,_,_)<-ords]; rights=b0:[r | (_,r,_)<-ords]
            (l,ht1,s1)<-unifyShapes (role++"/left") lefts ht
            (r,ht2,s2)<-unifyShapes (role++"/right") rights ht1
            Just (TUnion l r,ht2,s1++s2++[(i,"union operands swapped") | (i,(_,_,True))<-zip [1::Int ..] ords])
          scored=[(length (htHoles h2),k) | k<-take 16 options, Just (_,h2,_)<-[tryOrder k]]
      in case sortOn fst scored of
           ((_,k):_)->tryOrder k
           []->Nothing
  _->Nothing
  where
    isRect (SRect _)=True; isRect _=False
    isDiff (SDiff _ _)=True; isDiff _=False
    isUnion (SUnion _ _)=True; isUnion _=False
    orders a0 b0 (SUnion a b)=[(a,b,False) | structureSignature a==structureSignature a0 && structureSignature b==structureSignature b0]++[(b,a,True) | structureSignature b==structureSignature a0 && structureSignature a==structureSignature b0]
    orders _ _ _=[]

-- ---------------------------------------------------------------- role alignment

type Column=[OutObj]   -- one object per case, same role

signaturesOf :: OutObj -> [String]
signaturesOf o=nub (map structureSignature (ooAlts o))
compatible :: OutObj -> OutObj -> Bool
compatible a b=not (null (filter (`elem` signaturesOf b) (signaturesOf a)))

-- All bijections of `objs` onto the role objects `roles` with pairwise
-- structural compatibility, bounded.
bijections :: Int -> [OutObj] -> [OutObj] -> ([[OutObj]],Int,Bool)   -- (assignments: object for role k, compatibility checks, truncated)
bijections cap roles objs=
  let go [] _ checks=([[]],checks,False)
      go (r:rs) avail checks=
        let cands=[o | o<-avail, compatible r o]
            checks1=checks+length avail
            (results,c2,tr)=foldl' (\(acc,c,t) o->
                if length acc>=cap then (acc,c,True)
                else let (subs,c',t')=go rs (filter ((/=ooId o) . ooId) avail) c in (acc++map (o:) (take (cap-length acc) subs),c',t||t'||length subs>cap-length acc)) ([],checks1,False) cands
        in (results,c2,tr)
  in go roles objs 0

-- ---------------------------------------------------------------- joint skeleton for one view assignment

data Attempt = Attempt { atSkeletons :: [Skeleton], atFailure :: Maybe String, atCounters :: [(String,Int)], atTruncated :: [String] }

attempt :: InduceConfig -> [Grid] -> [OutputSceneCandidate] -> Attempt
attempt cfg outputs cands=
  let b=icBudget cfg
      n=length cands
      views=[(oscCase c,oscView c) | c<-cands]
      viewSwitches=length (nub (map oscView cands))-1
      dimsW=[fst (oscDims c) | c<-cands]; dimsH=[snd (oscDims c) | c<-cands]
      bgs=[oscBackground c | c<-cands]
      objsPer=[oscObjects c | c<-cands]
      counts=map length objsPer
      indep=[(oscCase c,oscSceneCost c) | c<-cands]
      failWith why cs=Attempt [] (Just why) cs []
  in if any isJust bgs && not (all isJust bgs) then failWith "BackgroundKindMismatch: some outputs have a uniform residual and others none under this view assignment" []
     else if all (==head counts) counts then
       -- equal counts: roles = objects of the first case (labels only), bounded bijection enumeration for the other cases
       let roles=sortOn (\o->(ooY o,ooX o,ooId o)) (head objsPer)
           perCase=[bijections (obMatching b) roles os | os<-tail objsPer]
           checks=sum [c | (_,c,_)<-perCase]
           truncatedMatch=any (\(_,_,t)->t) perCase
           assignments=take (obMatching b) (sequence (map (\(as,_,_)->as) perCase))   -- each: list over cases 1..n-1 of role->object lists
           truncatedProduct=length (take (obMatching b+1) (sequence (map (\(as,_,_)->as) perCase)))>obMatching b
           built=[ (sk,asg) | asg<-assignments, Just sk<-[buildSkeleton cfg outputs cands views viewSwitches dimsW dimsH bgs indep (roles:asg) []]]
       in if any (\(as,_,_)->null as) perCase then Attempt [] (Just ("NoJointRoleAlignment: case "++show (head [oscCase c | (c,(as,_,_))<-zip (tail cands) perCase, null as])++" has no structurally compatible bijection onto the roles of case "++show (oscCase (head cands)))) [("pairwise_match_checks",checks)] []
          else if null built then Attempt [] (Just "ShapeASTMissing: no common Shape AST structure for some role across all outputs") [("pairwise_match_checks",checks),("joint_consistency_checks",length assignments),("joint_consistency_rejected",length assignments)] [s | (s,t)<-[("matching",truncatedMatch||truncatedProduct)], t]
          else
            let best=minimum [cbTotal (skCost sk) | (sk,_)<-built]
                winners=[sk | (sk,_)<-built, cbTotal (skCost sk)==best]
                distinct=nubOn (canonicalScene . skScene) winners
                others=sortOn (cbTotal . skCost) (nubOn (canonicalScene . skScene) [sk | (sk,_)<-built, cbTotal (skCost sk)/=best])
                amb=length winners
                sks=[sk {skAmbiguity=amb, skCost=(skCost sk) {cbMatching=max 0 (amb-1), cbTotal=cbTotal (skCost sk)+max 0 (amb-1)}} | sk<-distinct]++others
            in Attempt (take (obSkeletons b) sks) Nothing [("pairwise_match_checks",checks),("joint_consistency_checks",length assignments),("joint_consistency_rejected",length assignments-length built),("ambiguous_matches",max 0 (amb-1))] [s | (s,t)<-[("matching",truncatedMatch||truncatedProduct)], t]
     else
       -- different counts: classes by (colour, primary signature); equal-count classes are matched, varying ones must be linear repeats
       let classKey o=(ooColour o,case ooAlts o of (e:_)->structureSignature e; []->"")
           classes=nub (sort (concatMap (map classKey) objsPer))
           perClass=[(k,[[o | o<-os, classKey o==k] | os<-objsPer]) | k<-classes]
           missing=[k | (k,cols)<-perClass, any null cols]
       in if not (null missing) then failWith ("NoJointRoleAlignment: object class "++show (head missing)++" is absent in some output (counts "++show counts++")") []
          else case buildWithClasses cfg outputs cands views viewSwitches dimsW dimsH bgs indep perClass of
                 Left why->failWith why []
                 Right sk->Attempt [sk] Nothing [("joint_consistency_checks",1)] []
  where nubOn f=go S.empty where go _ []=[]; go seen (x:xs)=if S.member (f x) seen then go seen xs else x:go (S.insert (f x) seen) xs

-- Build the skeleton for equal-count roles given, per case, the object list in role order.
buildSkeleton :: InduceConfig -> [Grid] -> [OutputSceneCandidate] -> [(Int,ViewId)] -> Int -> [Int] -> [Int] -> [Maybe Int] -> [(Int,Int)] -> [[OutObj]] -> [(Int,[OutObj])] -> Maybe Skeleton
buildSkeleton cfg outputs cands views viewSwitches dimsW dimsH bgs indep perCaseRoleObjs _=
  let columns=transpose' perCaseRoleObjs   -- one column per role
      ht0=emptyHT
      (w,ht1)=unifyInt "canvas/width" dimsW ht0
      (h,ht2)=unifyInt "canvas/height" dimsH ht1
      (bg,ht3)=case sequence bgs of
        Just cs->let (c,t)=unifyColour "canvas/background" cs ht2 in (case c of CLit k->BgLit k; CHole k->BgHole k,t)
        Nothing->(BgNone,ht2)
      step (acc,ht,sigs,swapsAcc) (r,col)=case acc of
        Nothing->(Nothing,ht,sigs,swapsAcc)
        Just objs->case unifyRole cfg ("object"++show r) col ht of
          Nothing->(Nothing,ht,sigs,swapsAcc)
          Just (o,ht',sig,sw)->(Just (objs++[TSingle o]),ht',sigs++[(r,sig)],swapsAcc++[(r,sw)])
      (objsM,htF,sigChoice,swaps)=foldl' step (Just [],ht3,[],[]) (zip [0::Int ..] columns)
  in case objsM of
       Nothing->Nothing
       Just objs->
         let sc=TCanvas w h bg objs
             roles=[RoleMatch r "single" [(oscCase c,[ooId o]) | (c,o)<-zip cands (map (!!r) perCaseRoleObjs)] (maybe "" id (lookup r sigChoice)) (maybe [] id (lookup r swaps)) | r<-[0..length columns-1]]
         in Just (finishSkeleton cfg outputs cands views viewSwitches indep sc htF roles sigChoice)

-- Different-count build: classes -> singles (equal counts, matched by structure) + linear repeats.
buildWithClasses :: InduceConfig -> [Grid] -> [OutputSceneCandidate] -> [(Int,ViewId)] -> Int -> [Int] -> [Int] -> [Maybe Int] -> [(Int,Int)] -> [((Int,String),[[OutObj]])] -> Either String Skeleton
buildWithClasses cfg outputs cands views viewSwitches dimsW dimsH bgs indep perClass=do
  let ht0=emptyHT
      (w,ht1)=unifyInt "canvas/width" dimsW ht0
      (h,ht2)=unifyInt "canvas/height" dimsH ht1
      (bg,ht3)=case sequence bgs of
        Just cs->let (c,t)=unifyColour "canvas/background" cs ht2 in (case c of CLit k->BgLit k; CHole k->BgHole k,t)
        Nothing->(BgNone,ht2)
  (cols,htF,roles,sigs)<-foldlE (\(acc,ht,rs,sg) (ci,(key,perCase))->
      let counts=map length perCase in
      if all (==head counts) counts then
        -- equal-count class: align by (y,x) raster order inside the class after structure check (bounded), single roles
        let sorted=map (sortOn (\o->(ooY o,ooX o,ooId o))) perCase
            columns=transpose' sorted
        in foldlE (\(acc',ht',rs',sg') (k,col)->case unifyRole cfg ("class"++show ci++"/object"++show k) col ht' of
              Nothing->Left ("ShapeASTMissing: class "++show key++" member "++show k++" has no common Shape AST structure across outputs")
              Just (o,ht'',sig,sw)->Right (acc'++[TSingle o],ht'',rs'++[RoleMatch (length rs') "single" [(oscCase c,[ooId ob]) | (c,ob)<-zip cands col] sig sw],sg'++[(length rs',sig)])) (acc,ht,rs,sg) (zip [0::Int ..] columns)
      else do
        -- varying count: every member of a case must have the same mask; positions (sorted) must be an arithmetic progression
        let masks=[nub (map ooMask os) | os<-perCase]
        if any ((/=1) . length) masks then Left ("UnsupportedVariableMultiplicity: class "++show key++" has members with different masks inside one output (counts "++show counts++"); only uniform linear repeats are expressible") else Right ()
        let sortedPos=[sortOn (\o->(ooY o,ooX o)) os | os<-perCase]
            firsts=map head sortedPos
            steps=[[(ooX b-ooX a,ooY b-ooY a) | (a,b)<-zip os (tail os)] | os<-sortedPos]
        if any (\ss->length (nub ss)>1) steps then Left ("UnsupportedVariableMultiplicity: class "++show key++" members are not placed on an arithmetic progression (counts "++show counts++")") else Right ()
        let stepOf ss=case ss of (s:_)->Just s; []->Nothing
            caseSteps=map stepOf steps
            known=[s | Just s<-caseSteps]
        if null known then Left ("UnsupportedVariableMultiplicity: class "++show key++" never has two members, no placement relation observable") else Right ()
        let fill=case nub known of [s]->s; _->head known
            stepsFilled=[maybe fill id s | s<-caseSteps]
        if length (nub known)>1 && any (not . isJust) caseSteps then Left ("UnsupportedVariableMultiplicity: class "++show key++" step varies and some output has a single member") else Right ()
        case unifyRole cfg ("class"++show ci++"/repeat") firsts ht of
          Nothing->Left ("ShapeASTMissing: repeat class "++show key++" has no common Shape AST structure")
          Just (o,ht',sig,sw)->
            let (cnt,ht2)=unifyInt ("class"++show ci++"/count") counts ht'
                (dx,ht3')=unifyInt ("class"++show ci++"/dx") (map fst stepsFilled) ht2
                (dy,ht4)=unifyInt ("class"++show ci++"/dy") (map snd stepsFilled) ht3'
            in Right (acc++[TRepeat o cnt (dx,dy)],ht4,rs++[RoleMatch (length rs) "repeat" [(oscCase c,map ooId os) | (c,os)<-zip cands perCase] sig sw],sg++[(length rs,sig)])) ([],ht3,[],[]) (zip [0::Int ..] perClass)
  let sc=TCanvas w h bg cols
  Right (finishSkeleton cfg outputs cands views viewSwitches indep sc htF roles sigs)
  where foldlE f z xs=case xs of []->Right z; (x:rest)->f z x >>= \z'->foldlE f z' rest

-- One role column -> object template (common signature chosen by total AST cost or first-alternative order).
unifyRole :: InduceConfig -> String -> Column -> HT -> Maybe (ObjectT,HT,String,[(Int,String)])
unifyRole cfg role col ht=
  let common=[s | s<-signaturesOf (head col), all (\o->s `elem` signaturesOf o) (tail col)]
      pick s o=case [e | e<-ooAlts o, structureSignature e==s] of (e:_)->e; []->SRect (Rect 0 0 0 0)
      scoreSig s=if icMDLScore cfg then sum [shapeCost (pick s o) | o<-col] else 0
      ordered=take (obStructures (icBudget cfg)) (sortOn (\s->(scoreSig s,s)) common)
      tryS s=do
        (sh,ht1,sw)<-timedForce "e4_antiunify" (\(a,_,_)->length (shapeTText a)) <$> unifyShapes (role++"/shape") [pick s o | o<-col] ht
        let (c,ht2)=unifyColour (role++"/colour") (map ooColour col) ht1
            (px,ht3)=unifyInt (role++"/x") (map ooX col) ht2
            (py,ht4)=unifyInt (role++"/y") (map ooY col) ht3
        Just (TPlace sh c px py,ht4,s,sw)
      results=[r | s<-ordered, Just r<-[tryS s]]
  in case sortOn (\(o,_,_,_)->shapeCostTemplate o) results of (r:_)->Just r; []->Nothing
  where shapeCostTemplate o=templateCost (TCanvas (ILit 1) (ILit 1) BgNone [TSingle o])

finishSkeleton :: InduceConfig -> [Grid] -> [OutputSceneCandidate] -> [(Int,ViewId)] -> Int -> [(Int,Int)] -> SceneT -> HT -> [RoleMatch] -> [(Int,String)] -> Skeleton
finishSkeleton _ outputs cands views viewSwitches indep sc ht roles sigs=
  let caseIds=map oscCase cands
      bindings=[(c,M.fromList [(h,vs!!k) | (h,_,vs,_)<-htHoles ht]) | (k,c)<-zip [0..] caseIds]
      holes=[HoleInfo h ty role (zip caseIds vs) (constraintsOf h) (occ h) "OutputObserved" "NotAttempted" | (h,ty,vs,role)<-htHoles ht]
      renders=[(c,timedForce "e4_render" (either length (M.size . rdProvenance)) (renderScene sc b)) | (c,b)<-bindings]
      ok=[(c,either (const False) (\r->rdGrid r==(outputs!!c)) res) | (c,res)<-renders]
      prov=[(c,either (const []) rdObjectPixels res) | (c,res)<-renders]
      cb0=costBreakdown (length cands) viewSwitches 1 (map snd indep) sc
  in Skeleton sc bindings holes views roles cb0 1 ok prov (nontrivialStructure cb0 sc) sigs Nothing
  where
    allInts=[stW sc,stH sc]++concatMap collInts (stObjects sc)
    collInts (TSingle o)=objInts o
    collInts (TRepeat o n (dx,dy))=objInts o++[n,dx,dy]
    objInts o=shInts (otShape o)++[otX o,otY o]
    shInts (TRect a b c d)=[a,b,c,d]
    shInts (TUnion l r)=shInts l++shInts r
    shInts (TDiff l r)=shInts l++shInts r
    occ h=length [() | e<-allInts, h `elem` intExprHoles e]+length [() | TSingle (TPlace _ (CHole k) _ _)<-stObjects sc, k==h]+length [() | TRepeat (TPlace _ (CHole k) _ _) _ _<-stObjects sc, k==h]+(case stBg sc of BgHole k | k==h->1; _->0)
    constraintsOf h=["offset "++show d++" from ?"++show h++" at another slot" | IOff k d<-allInts, k==h]++["shared by "++show (occ h)++" slots" | occ h>1]

transpose' :: [[a]] -> [[a]]
transpose' []=[]
transpose' xss | any null xss=[]
               | otherwise=map head xss:transpose' (map tail xss)

-- ---------------------------------------------------------------- top level

induceOutputSkeleton :: InduceConfig -> [Grid] -> InduceResult
induceOutputSkeleton cfg outputs
  | not (icEnabled cfg) || null outputs = InduceResult NotAttempted "sidecar disabled or no training output" Nothing [] [] [] [] M.empty [] [] [] Nothing cfg (length outputs)
  | otherwise =
      let b=icBudget cfg
          -- structural sharing = one lazy per-task table of shape alternatives keyed by the exact normalised mask;
          -- with sharing off every object enumerates its own alternatives (same results, more work)
          alts0=if icSharing cfg then altLookupFor b outputs else \m->shapeAlternatives (obMDL b) (obShapeAlts b) m
          -- FirstSceneOnly = the locally cheapest explanation only: cheapest scene per case AND cheapest Shape AST per object
          alts=if icMode cfg==FirstSceneOnly then (\m->let (as,st)=alts0 m in (take 1 as,st++"; first alternative only")) else alts0
          scenesPer=[outputScenes b alts k g | (k,g)<-zip [0..] outputs]
          scenes=map fst scenesPer
          rejected=[(k,v,e) | (k,(_,rs))<-zip [0..] scenesPer, (v,e)<-rs]
          n=length outputs
          -- independent reference: cheapest legal scene per case
          indepCosts=[(k,case cs of (c:_)->oscSceneCost c; []->0) | (k,cs)<-zip [0..] scenes]
          degenerate=degenerateCosts outputs (map snd indepCosts)
          anyNoView=[k | (k,cs)<-zip [0::Int ..] scenes, null cs]
          -- a case without a legal candidate: either every view is inapplicable / not single-colour-residual
          -- (NoLegalOutputView) or the only legal scenes exceed the object budget (ObjectRepresentationUnavailable)
          noViewReason ks=
            let overBudget k=[e | (k',_,e)<-rejected, k'==k, take 31 e=="ObjectRepresentationUnavailable"]
                ob=[k | k<-ks, not (null (overBudget k))]
            in if null ob then "NoLegalOutputView: output(s) "++show ks++" have no legal single-colour-residual scene under any view"
               else "ObjectRepresentationUnavailable: output(s) "++show ob++" exceed the object budget ("++show (obMaxObjects b)++") in every legal view ("++head (overBudget (head ob))++")"++(if length ob<length ks then "; output(s) "++show [k | k<-ks, k `notElem` ob]++" have no legal view at all" else "")
          -- view assignments
          sameView=[[c | cs<-scenes, c<-take 1 [x | x<-cs, oscView x==v]] | v<-nub (map oscView (concat scenes)), all (any ((==v) . oscView)) scenes]
          firstOnly=[[head cs | cs<-scenes]]
          mixed=take (obViewCombos b) (sortOn (sum . map oscSceneCost) (filter (\cs->length (nub (map oscView cs))>1) (sequence (map (take 3) scenes))))
          assignments=case icMode cfg of
            FirstSceneOnly->firstOnly
            _->sortOn (\cs->(sum (map oscSceneCost cs),show (map oscView cs))) sameView
          attempts=[(cs,attempt cfg outputs cs) | cs<-assignments]
          -- mixed assignments only when no same-view skeleton is non-trivial
          attempts'=if any (\(_,a)->any (isRightE . skNontrivial) (atSkeletons a)) attempts || icMode cfg==FirstSceneOnly then attempts else attempts++[(cs,attempt cfg outputs cs) | cs<-mixed]
          cheapestAny=sum (map snd indepCosts)
          allSk=[sk {skCheaperOtherView=if cheapestAny<cbIndependent (skCost sk) then Just cheapestAny else Nothing} | sk<-sortOn (\sk->(cbTotal (skCost sk),cbHoleCount (skCost sk),sceneTText (skScene sk))) (concatMap (atSkeletons . snd) attempts')]
          verifiedAll sk=all snd (skRenderOk sk)
          good=[sk | sk<-allSk, verifiedAll sk, isRightE (skNontrivial sk)]
          trivial=[sk | sk<-allSk, verifiedAll sk, not (isRightE (skNontrivial sk))]
          subset=[sk | sk<-allSk, not (verifiedAll sk)]
          failures=[(show (map oscView cs),why) | (cs,a)<-attempts', Just why<-[atFailure a]]
          truncated=nub (concatMap (atTruncated . snd) attempts')
          counters=M.fromListWith (+) (concatMap (atCounters . snd) attempts'++
            [("output_scenes_generated",sum (map length scenes)),("output_scenes_verified",length [() | cs<-scenes, c<-cs, oscReconstructed c]),("output_scenes_rejected",length rejected)
            ,("output_views_attempted",length attempts'),("output_views_selected",maybe 0 (const 1) (listToMaybe' good))
            ,("output_shape_ast_enumerated",sum [length (ooAlts o) | cs<-scenes, c<-cs, o<-oscObjects c])
            ,("antiunify_memo_hits",if icSharing cfg then max 0 (length [() | cs<-scenes, c<-cs, o<-oscObjects c]-length (nub [ooMask o | cs<-scenes, c<-cs, o<-oscObjects c])) else 0),("shared_skeletons_enumerated",length allSk),("shared_skeletons_verified_all",length (good++trivial)),("shared_skeletons_partial",length subset),("shared_skeletons_rejected",length failures)
            ,("holes_total",maybe 0 (cbHoleCount . skCost) (listToMaybe' good)),("holes_int",maybe 0 (length . fst . holesOf . skScene) (listToMaybe' good)),("holes_colour",maybe 0 (length . snd . holesOf . skScene) (listToMaybe' good))
            ,("holes_with_constraints",maybe 0 (length . filter (not . null . hiConstraints) . skHoles) (listToMaybe' good))
            ,("witness_replay_pass",sum [length (filter snd (skRenderOk sk)) | sk<-allSk]),("witness_replay_fail",sum [length (filter (not . snd) (skRenderOk sk)) | sk<-allSk])
            ,("independent_cost",sum (map snd indepCosts)),("shared_cost",maybe 0 (cbTotal . skCost) (listToMaybe' good)),("e4_structural_work",sum (concatMap (map snd . atCounters . snd) attempts')+length allSk)])
          pairwise=if icMode cfg==PairwiseOnly && n>=2 then Just [((i,j),pairStatus i j) | i<-[0..n-1], j<-[i+1..n-1]] else Nothing
          pairStatus i j=let r=induceOutputSkeleton cfg {icMode=JointAll} [outputs!!i,outputs!!j] in statusText (irStatus r)
          (status,reason)
            | icMode cfg==IndependentOnly = (NotAttempted,"IndependentOnly: per-output independent encodings only ("++show (map snd indepCosts)++"); no cross-output induction attempted")
            | not (null anyNoView) = (RepresentationUnavailable,noViewReason anyNoView)
            | n==1 && not (null good) = (SingleOutputStructuralCompression,"one training output only: a structural compression of a single output is not a cross-output regularity")
            | n==1 = (SingleOutputStructuralCompression,"one training output only; no shared structure can be claimed")
            | not (null good) = (StructureVerifiedAllOutputs,"shared skeleton renders every training output pixel for pixel; parameters are OutputObserved, prediction_ready=false")
            | not (null trivial) = (NoNontrivialSharedStructure,either id (const "") (skNontrivial (head trivial)))
            | not (null subset) = (StructureVerifiedSubset,"a skeleton renders only some outputs: "++show [c | sk<-take 1 subset, (c,False)<-skRenderOk sk])
            | not (null truncated) = (BudgetTruncated,"budget exhausted in: "++intercalate ", " truncated)
            | all (isRepresentation . snd) failures && not (null failures) = (RepresentationUnavailable,snd (head failures))
            | not (null failures) = (ExhaustedInBoundedGrammar,snd (head failures))
            | otherwise = (ExhaustedInBoundedGrammar,"no view assignment produced a skeleton")
          best=case good of (sk:_)->Just sk; []->case trivial of (sk:_)->Just sk; []->Nothing
          altsK=take (obSkeletons b) (drop 1 (good++trivial))
      in InduceResult status reason (if icMode cfg==IndependentOnly then Nothing else best) altsK scenes rejected failures counters indepCosts degenerate truncated pairwise cfg n
  where
    isRightE (Right _)=True
    isRightE _=False
    listToMaybe' (x:_)=Just x
    listToMaybe' []=Nothing
    isRepresentation why=any (`isPrefixOfS` why) ["ShapeASTMissing","UnsupportedVariableMultiplicity","NoJointRoleAlignment","BackgroundKindMismatch","ObjectRepresentationUnavailable"]
    isPrefixOfS p s=take (length p) s==p

-- Heldout structural diagnostic: can the FROZEN skeleton be instantiated on
-- a new output (same view family, structure-compatible role bijection, every
-- hole consistent across its occurrences, render equal)? This is
-- oracle_parameter_structural_reconstruction, never a prediction.
instantiateOnOutput :: InduceConfig -> Skeleton -> Grid -> Either String (Bindings,ViewId)
instantiateOnOutput cfg sk g=
  let b=icBudget cfg
      alts=altLookupFor b [g]
      (cands,_)=outputScenes b alts 0 g
      wanted=nub (map snd (skViews sk))
      ordered=[c | v<-wanted, c<-cands, oscView c==v]++[c | c<-cands, oscView c `notElem` wanted]
      tryCand c=do
        let objs=oscObjects c
            singles=[o | TSingle o<-stObjects (skScene sk)]
            repeats=[(o,n,st) | TRepeat o n st<-stObjects (skScene sk)]
        if not (null repeats) && not (null singles) then Left "instantiate: mixed single/repeat skeletons are matched greedily (singles first)" else Right ()
        -- singles: bounded bijection by signature
        let sigOf t=structureSignature (templateSig t)
            compat t o=sigOf t `elem` signaturesOf o
            perms=take (obMatching b) [p | p<-permutations objs, length p==length singles+sum [0 | _<-repeats], and (zipWith compat singles p)]
            solveWith p=do
              eqs<-fmap concat (sequence [matchObject t o | (t,o)<-zip singles p])
              let dimsEq=[(stW (skScene sk),fst (oscDims c)),(stH (skScene sk),snd (oscDims c))]
              eqs2<-fmap concat (sequence [matchInt e v | (e,v)<-dimsEq])
              bgEq<-case (stBg (skScene sk),oscBackground c) of
                (BgNone,Nothing)->Right []
                (BgLit k,Just v) | k==v->Right []
                (BgHole hh,Just v)->Right [(hh,v)]
                _->Left "background kind/colour mismatch"
              solveEqs (eqs++eqs2++bgEq)
        if null repeats then
          case [bnd | p<-perms, Right bnd<-[solveWith p], either (const False) (\r->rdGrid r==g) (renderScene (skScene sk) bnd)] of
            (bnd:_)->Right (bnd,oscView c)
            []->Left "no structure-compatible role assignment with consistent hole values renders this output"
        else Left "instantiate: repeat skeletons are not instantiated on heldout outputs in this version (reported as not_attempted)"
  in case [r | c<-ordered, Right r<-[tryCand c]] of
       (r:_)->Right r
       []->Left (case ordered of []->"NoLegalOutputView"; _->either id (const "no instantiation") (tryCand (head ordered)))
  where
    templateSig :: ObjectT -> ShapeExpr
    templateSig o=sigShape (otShape o)
    sigShape (TRect _ _ _ _)=SRect (Rect 0 0 0 0)
    sigShape (TUnion l r)=SUnion (sigShape l) (sigShape r)
    sigShape (TDiff l r)=SDiff (sigShape l) (sigShape r)
    matchObject t o=do
      let cands=[e | e<-ooAlts o, structureSignature e==structureSignature (templateSig t)]
      case cands of
        []->Left "no alternative with the role's structure"
        _->do
          shapeEqs<-firstRight [matchShape (otShape t) e | e<-cands]
          cEq<-case otColour t of CLit k->if k==ooColour o then Right [] else Left "colour literal mismatch"; CHole hh->Right [(hh,ooColour o)]
          xEq<-matchInt (otX t) (ooX o); yEq<-matchInt (otY t) (ooY o)
          Right (shapeEqs++cEq++xEq++yEq)
    firstRight xs=case [r | Right r<-xs] of (r:_)->Right r; []->Left "no shape alternative matches the template"
    matchShape (TRect a b c d) (SRect r)=concat <$> sequence [matchInt a (rx0 r),matchInt b (ry0 r),matchInt c (rx1 r),matchInt d (ry1 r)]
    matchShape (TUnion l r) (SUnion x y)=case (++) <$> matchShape l x <*> matchShape r y of Right e->Right e; Left _->(++) <$> matchShape l y <*> matchShape r x
    matchShape (TDiff l r) (SDiff x y)=(++) <$> matchShape l x <*> matchShape r y
    matchShape _ _=Left "shape structure mismatch"
    matchInt (ILit k) v=if k==v then Right [] else Left ("literal "++show k++" /= "++show v)
    matchInt (IHole hh) v=Right [(hh,v)]
    matchInt (IOff hh d) v=Right [(hh,v-d)]
    solveEqs eqs=let m=M.fromListWith (\a bb->if a==bb then a else minBound) eqs in if any (==minBound) (M.elems m) then Left "hole constraint conflict" else Right m

-- ---------------------------------------------------------------- metrics / JSON

e4MetricNames :: [String]
e4MetricNames=words "e4_attempted e4_status_code e4_output_scenes_generated e4_output_scenes_verified e4_output_scenes_rejected e4_output_views_attempted e4_output_views_selected e4_output_shape_ast_enumerated e4_pairwise_match_checks e4_ambiguous_matches e4_joint_consistency_checks e4_joint_consistency_rejected e4_shared_skeletons_enumerated e4_shared_skeletons_verified_all e4_shared_skeletons_partial e4_shared_skeletons_rejected e4_holes_total e4_holes_int e4_holes_colour e4_holes_with_constraints e4_antiunify_memo_hits e4_independent_cost e4_shared_cost e4_witness_replay_pass e4_witness_replay_fail e4_structural_work e4_budget_truncated e4_nontrivial"
e4Metrics :: InduceResult -> [(String,Int)]
e4Metrics r=[("e4_attempted",if irStatus r==NotAttempted then 0 else 1),("e4_status_code",statusCode (irStatus r)),("e4_budget_truncated",if null (irTruncated r) then 0 else 1)
  ,("e4_nontrivial",if irStatus r==StructureVerifiedAllOutputs then 1 else 0)]++[("e4_"++k,M.findWithDefault 0 k (irCounters r)) | k<-["output_scenes_generated","output_scenes_verified","output_scenes_rejected","output_views_attempted","output_views_selected","output_shape_ast_enumerated","pairwise_match_checks","ambiguous_matches","joint_consistency_checks","joint_consistency_rejected","shared_skeletons_enumerated","shared_skeletons_verified_all","shared_skeletons_partial","shared_skeletons_rejected","holes_total","holes_int","holes_colour","holes_with_constraints","antiunify_memo_hits","independent_cost","shared_cost","witness_replay_pass","witness_replay_fail","e4_structural_work"]]
  where statusCode s=case s of StructureVerifiedAllOutputs->1; StructureVerifiedSubset->2; NoNontrivialSharedStructure->3; RepresentationUnavailable->4; ExhaustedInBoundedGrammar->5; BudgetTruncated->6; NotAttempted->0; SingleOutputStructuralCompression->7

costJSON :: CostBreakdown -> String
costJSON c=jobj [("c_ast",show (cbAst c)),("c_holes",show (cbHoles c)),("c_bindings",show (cbBindings c)),("c_views",show (cbViews c)),("c_matching",show (cbMatching c)),("total",show (cbTotal c))
  ,("independent_total",show (cbIndependent c)),("compression_ratio",show (fromIntegral (cbTotal c)/fromIntegral (max 1 (cbIndependent c)) :: Double)),("holes",show (cbHoleCount c)),("slots",show (cbSlots c)),("literals",show (cbLiterals c)),("relations",show (cbRelations c))
  ,("optimality",jstr "observed best among the enumerated candidates of the bounded grammar; not a global MDL optimum")]
skeletonJSON :: Skeleton -> String
skeletonJSON sk=jobj [("skeleton",sceneTJSON (skScene sk)),("text",jstr (sceneTText (skScene sk))),("skeleton_id",jstr (stableHash (show (canonicalScene (skScene sk)))))
  ,("holes",jarr (map holeInfoJSON (skHoles sk))),("bindings",jarr [jobj [("case_index",show c),("values",jobj [("?"++show h,show v) | (h,v)<-M.toList b])] | (c,b)<-skBindings sk])
  ,("views",jarr [jobj [("case_index",show c),("view",jstr (viewText v))] | (c,v)<-skViews sk])
  ,("roles",jarr [jobj [("role",show (rmRole r)),("kind",jstr (rmKind r)),("signature",jstr (rmSignature r)),("members",jarr [jobj [("case_index",show c),("object_ids",show ids)] | (c,ids)<-rmMembers r]),("union_swaps",jarr [jobj [("case_position",show c),("note",jstr s)] | (c,s)<-rmSwaps r])] | r<-skRoles sk])
  ,("cost",costJSON (skCost sk)),("independent_cheapest_any_view",jmaybe show (skCheaperOtherView sk)),("independent_note",jstr "cost.independent_total = the outputs encoded alone under the skeleton's own view assignment (the anti-unification reference); independent_cheapest_any_view is set when some other view explains the outputs more cheaply (e.g. a background-only canvas)"),("ambiguity",show (skAmbiguity sk)),("nontrivial",either (\e->jobj [("ok",jbool False),("why",jstr e)]) (const (jobj [("ok",jbool True)])) (skNontrivial sk))
  ,("construction_witness",jarr [jobj [("case_index",show c),("render_equals_output",jbool ok),("pixel_provenance",jarr [jobj [("source",jstr s),("pixels",show n)] | (s,n)<-maybe [] id (lookup c (skProvenance sk))])] | (c,ok)<-skRenderOk sk])
  ,("input_binding_witness",jobj [("status",jstr "NotAttempted"),("prediction_ready",jbool False),("note",jstr "every parameter value is observed on a training output; no input-side program binds any hole (E5)")])]
induceJSON :: InduceResult -> String
induceJSON r=jobj [("status",jstr (statusText (irStatus r))),("reason",jstr (irReason r)),("cases",show (irCases r)),("prediction_ready",jbool False),("input_binding_status",jstr "NotAttempted")
  ,("mode",jstr (show (icMode (irConfig r)))),("budget",jstr (show (icBudget (irConfig r))))
  ,("best",jmaybe skeletonJSON (irBest r)),("alternatives",jarr (map skeletonJSON (irAlternatives r)))
  ,("output_scenes",jarr [jarr (map oscJSON cs) | cs<-irScenes r]),("rejected_views",jarr [jobj [("case_index",show k),("view",jstr (viewText v)),("reason",jstr e)] | (k,v,e)<-irRejectedViews r])
  ,("failures",jarr [jobj [("view_assignment",jstr a),("reason",jstr w)] | (a,w)<-irFailures r]),("independent_costs",jarr [jobj [("case_index",show k),("cost",show c)] | (k,c)<-irIndependent r])
  ,("degenerate_reference_costs",jobj [(k,show v) | (k,v)<-irDegenerate r]),("budget_truncated",jarr (map jstr (irTruncated r)))
  ,("pairwise",jmaybe (\ps->jarr [jobj [("pair",jarr [show i,show j]),("status",jstr s)] | ((i,j),s)<-ps]) (irPairwise r))
  ,("counters",jobj [(k,show v) | (k,v)<-M.toList (irCounters r)]),("metrics",jobj [(k,show v) | (k,v)<-e4Metrics r])]
-- Versioned artifact for E5: skeleton, typed holes with constraints and per-case observed values, witnesses; no test labels, no case-id branches.
artifactJSON :: String -> InduceResult -> String
artifactJSON taskId r=jobj [("artifact",jstr "OutputSkeletonArtifact"),("version",jstr "1"),("template_version",jstr templateVersion),("task_id",jstr taskId),("status",jstr (statusText (irStatus r)))
  ,("prediction_ready",jbool False),("input_binding_status",jstr "NotAttempted"),("skeleton",jmaybe skeletonJSON (irBest r)),("alternatives",jarr (map skeletonJSON (irAlternatives r)))
  ,("note",jstr "holes are OutputObserved; E5 must bind every hole from input-side typed features before any prediction")]
  where _=(mapMaybe (const (Nothing::Maybe Int)) ([]::[Int]),sort ([]::[Int]))
