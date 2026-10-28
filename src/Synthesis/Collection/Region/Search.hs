-- LATIS Stage E3: Region-first, breadth-first, goal-fair search over scene
-- views and region programs, with one provable safe prune.
--
-- Goals: one RegionRuleGoal per (view, layer). A goal owns an ordered
-- candidate list and a cursor; the scheduler gives every goal of the current
-- layer a bounded quantum of candidates per round (deficit round-robin), so
-- no single view can consume the whole budget; a goal with candidates left
-- is Deferred and resumes from its cursor (never re-enumerated).
--
--   layer 0: whole-canvas / large-region simple rules (Root, largest content; Crop, Clear)
--   layer 1: other region selectors; Recolor/Fill/Translate
--   layer 2: cross-region StampAtMarkers
--
-- Region-first ordering sorts candidates by the expected region size class
-- (root > largest > other > smallest) before cost; the non-region-first
-- order is by cost alone. The non-breadth scheduler exhausts one view before
-- the next (the old depth-first habit) with the same universe.
--
-- Safe prune (proof-carrying, PreserveExcept skeleton only): a program whose
-- declared effect is Local with write set = the selected region and output
-- dims = input dims cannot fit a case whose target differs from the input
-- outside that region (or has other dims). Candidates pruned this way are
-- recorded in a DependencyWitness with the pixel evidence; CrossRegion and
-- Selection programs are never pruned. SharedRule: for Root-level
-- RecolorObjects the fitting colour must fit every depth-1 region, so the
-- executed colour set is the intersection of per-region fits.
--
-- Stage E3.1 (all switchable, all off = the E3 behaviour bit for bit):
--   rcPrecheck   input-side selector precheck. Before a candidate is handed
--                to the dependency prune or the executor, every selector it
--                evaluates (target, Stamp source) is resolved on the INPUT
--                tree of every training case through the same
--                `resolveSelector` the executor uses. A candidate whose
--                selector fails (empty / non-unique / tie / root unsplit) on
--                some case, or whose Stamp source and target coincide on some
--                case, is recorded as PrecheckedInvalid with the per-case
--                cardinality witness and never executed. It still belongs to
--                the fixed universe and still consumes its quantum slot (like
--                a pruned candidate); it never consumes the execution budget.
--                No target grid is read. An Unknown verdict falls back to
--                execution (there is none for the current selector language,
--                which has no branches, bindings or local scopes).
--   rcLazyMDL    object shapes come from the per-task exact MDLCache instead
--                of being optimised per object; the optimum, the scene cost
--                and the view order are the same.
--   rcMDLRecord  shapes are computed and recorded even when rcMDL is off
--                (trace/audit); off with rcMDL off = NotComputed (null).
--   rcSelectorPriority  scheduling-only variant: within a layer the goals
--                are served in increasing order of their number of
--                precheck-valid candidates, and inside a goal the valid
--                candidates come first (cost, text); the size-class key is
--                not used. The universe is unchanged.
module Synthesis.Collection.Region.Search
  ( RegionConfig(..), regionConfigOff, regionConfigOn, RegionSearch(..), GoalLedger(..), Exposure(..), DependencyWitness(..), PrunedCandidate(..)
  , SelectorCheck(..), PrecheckVerdict(..), PrecheckedCandidate(..), decideFromChecks, verdictKind
  , searchRegions, regionSearchJSON, regionMetricNames, regionMetrics, treeHashOf
  ) where

import Latent.Grid
import Synthesis.Collection.Region.Scene
import Synthesis.Collection.Region.Partition
import Synthesis.Collection.Region.Program
import Synthesis.Collection.Region.ShapeMDL (defaultMDLBudget, rectCoverBudget, mrRectCover, mrStatus)
import Synthesis.Collection.Region.MDLCache
import Synthesis.Collection.Geometry.View (ViewId(..), viewText, allBackgroundViews, viewRegions, ViewResult(..), Region(..))
import Synthesis.Collection.Diagnostics (jstr, jobj, jarr, jbool, jmaybe, stableHash, traceAt, traceCand, levelBranches, levelCandidates, timedForce)
import qualified Data.Set as S
import qualified Data.Map.Strict as M
import qualified Data.Map as ML
import Data.List (sortOn, nub, sort, foldl')
import Data.Maybe (isJust)
import Debug.Trace (traceEvent)

data RegionConfig = RegionConfig
  { rcEnabled :: Bool, rcRegionFirst :: Bool, rcBreadth :: Bool, rcSafePrune :: Bool, rcMDL :: Bool
  , rcQuantum :: Int            -- candidates per goal per round (breadth); skipped candidates count
  , rcExecutionBudget :: Int    -- total program executions (a program execution = all its cases)
  , rcFirstFitStop :: Bool      -- stop at the first train-exact program (False: collect every fit, for differentials)
  , rcPartition :: PartitionBudget
  , rcPrecheck :: Bool, rcLazyMDL :: Bool, rcMDLRecord :: Bool, rcSelectorPriority :: Bool } deriving (Eq,Show)
regionConfigOff, regionConfigOn :: RegionConfig
regionConfigOff=RegionConfig False False False False False 0 0 True defaultPartitionBudget False False False False
regionConfigOn=RegionConfig True True True True True 6 2400 True defaultPartitionBudget False False True False

data Exposure = Exposure { exIndex :: Int, exCandidateIndex :: Int, exView :: ViewId, exLayer :: Int, exProgram :: RegionProgram, exOutcome :: String, exReason :: String, exRegionArea :: Maybe Int } deriving (Eq,Show)
data GoalLedger = GoalLedger { glId :: String, glView :: ViewId, glLayer :: Int, glTotal :: Int, glCursor :: Int, glUsed :: Int, glAllocated :: Int, glDeferred :: Int, glResumed :: Int, glStatus :: String, glFits :: Int, glPrechecked :: Int, glPruned :: Int, glValidCandidates :: Maybe Int } deriving (Eq,Show)
data PrunedCandidate = PrunedCandidate { pcProgram :: RegionProgram, pcReason :: String, pcEvidence :: String } deriving (Eq,Show)
data DependencyWitness = DependencyWitness
  { dwSkeleton :: String, dwScope :: String, dwChangedRegions :: [(Int,ViewId,[Int])]   -- (case, view, depth-1 regions where target /= input)
  , dwDimsPreserved :: Bool, dwPruned :: [PrunedCandidate], dwKept :: Int, dwNote :: String } deriving (Eq,Show)

-- Input-side evidence for one (view, selector): the structured outcome on
-- every training case's tree plus the identity (hash) of each tree.
data SelectorCheck = SelectorCheck { scView :: ViewId, scSelector :: RegionSelector, scCases :: [(Int,SelectorOutcome)], scTreeHashes :: [(Int,String)] } deriving (Eq,Show)
data PrecheckVerdict
  = PrecheckValid
  | PrecheckInvalid { pvRole :: String, pvSelector :: RegionSelector, pvCase :: Int, pvKind :: String, pvEvidence :: String }
  | PrecheckUnknown String
  deriving (Eq,Show)
data PrecheckedCandidate = PrecheckedCandidate { pkProgram :: RegionProgram, pkCandidateIndex :: Int, pkVerdict :: PrecheckVerdict } deriving (Eq,Show)
verdictKind :: PrecheckVerdict -> String
verdictKind PrecheckValid="ValidSelected"
verdictKind (PrecheckInvalid _ _ _ k _)=k
verdictKind (PrecheckUnknown _)="DeferredUnknown"

-- The decision rule, separated from the cache so that it can be tested with
-- synthetic (including unknown) outcomes: a program is invalid iff some
-- selector it evaluates is not OK on some case (first failure in (role,
-- case) order), or its Stamp source and target select the same region on
-- some case; an unknown outcome anywhere makes the verdict Unknown (execute).
decideFromChecks :: RegionProgram -> [(String,RegionSelector,[(Int,Maybe SelectorOutcome)])] -> PrecheckVerdict
decideFromChecks p checks=
  case [(role,s,k) | (role,s,cs)<-checks, (k,Nothing)<-cs] of
    ((role,s,k):_)->PrecheckUnknown (role++" selector "++selectorText s++" has no input-side verdict on case "++show k)
    []->case [(role,s,k,o) | (role,s,cs)<-checks, (k,Just o)<-cs, not (isOK o)] of
      ((role,s,k,o):_)->PrecheckInvalid role s k (outcomeKind o) ("case "++show k++": "++either id (const "") (outcomeText o)++"; matched ids "++show (outcomeIds o))
      []->case rpAction p of
        StampAtMarkers _->
          let tgt=[(k,outcomeIds o) | (role,_,cs)<-checks, role=="target", (k,Just o)<-cs]
              src=[(k,outcomeIds o) | (role,_,cs)<-checks, role=="source", (k,Just o)<-cs]
          in case [k | (k,a)<-tgt, Just b<-[lookup k src], a==b] of
               (k:_)->PrecheckInvalid "source" (case rpAction p of StampAtMarkers s->s; _->rpSelector p) k "InvalidSameRegion" ("case "++show k++": StampAtMarkers: source and target are the same region "++show (lookup k tgt))
               []->PrecheckValid
        _->PrecheckValid
  where isOK (SelOK _)=True
        isOK _=False

data RegionSearch = RegionSearch
  { rsViews :: [(ViewId,String)]                 -- legal views (scene legal on every case) with evidence
  , rsRejectedViews :: [(ViewId,String)]
  , rsTrees :: [(Int,ViewId,RegionTree)]
  , rsGoals :: [GoalLedger], rsExposures :: [Exposure], rsFits :: [RegionProgram]
  , rsExecuted :: Int, rsPruned :: Int, rsBudgetCut :: Bool, rsDependency :: [DependencyWitness]
  , rsFirstViewExposure :: M.Map String Int      -- view -> exposure index of its first executed candidate
  , rsFirstFitExposure :: Maybe Int, rsUniverse :: Int, rsSceneCost :: [(ViewId,Int)]
  -- Stage E3.1
  , rsConsidered :: Int                          -- candidates taken from goal lists (executed + prechecked + pruned)
  , rsPrechecked :: [PrecheckedCandidate], rsPrecheckWitness :: [SelectorCheck], rsPrecheckLookups :: Int, rsPrecheckEntriesReferenced :: Int
  , rsFirstFitCandidate :: Maybe Int, rsPrunedBeforeFit :: Int, rsPrecheckedBeforeFit :: Int
  , rsMDLCache :: Maybe MDLCache, rsMDLObjects :: Int, rsShapeBasis :: String, rsGoalOrder :: [String], rsConfig :: RegionConfig } deriving (Eq,Show)

layerOf :: RegionProgram -> Int
layerOf p=case rpAction p of
  StampAtMarkers _->2
  CropRegion->if rpSelector p `elem` [SelRoot,SelLargestContent,SelContentWithObjects,SelContentWithoutObjects] then 0 else 1
  PreserveExcept ClearRegion->if rpSelector p `elem` [SelRoot,SelLargestContent] then 0 else 1
  _->1
sizeClass :: RegionSelector -> Int
sizeClass s=case s of SelRoot->0; SelLargestContent->1; SelSmallestContent->3; _->2

-- Identity of a tree (every node's id, parent, role, depth, pixels, objects).
treeHashOf :: RegionTree -> String
treeHashOf t=stableHash (show [(rnId n,rnParent n,rnRole n,rnDepth n,S.toList (rnPixels n),rnObjects n) | n<-M.elems (rtNodes t)])

-- Scheduler state (one record instead of the E3 tuple; same transitions).
data SState = SState
  { ssGoals :: [GoalLedger], ssExps :: [Exposure], ssNExps :: !Int, ssFits :: [RegionProgram], ssEx :: !Int, ssPr :: !Int, ssPrl :: [PrunedCandidate]
  , ssPc :: !Int, ssPcl :: [PrecheckedCandidate], ssFv :: M.Map String Int, ssFf :: Maybe Int, ssFfCand :: Maybe Int, ssCut :: Bool, ssConsidered :: !Int
  , ssPrBeforeFit :: !Int, ssPcBeforeFit :: !Int }

searchRegions :: RegionConfig -> [(Grid,Grid)] -> RegionSearch
searchRegions cfg pairs=
  let views0=LegacyView:allBackgroundViews
      ncases=length pairs
      -- regions of every view on every input (shared by the scene builder and the MDL cache)
      vrs=[(v,[viewRegions v x | (x,_)<-pairs]) | v<-views0]
      supports=[rgPixels r | (_,ers)<-vrs, Right vr<-ers, r<-vrRegions vr]
      wantShapes=rcMDL cfg || rcMDLRecord cfg
      cache=buildMDLCache defaultMDLBudget rectCoverBudget supports
      shapeSrc | not wantShapes = NoShapes
               | rcLazyMDL cfg = CachedShapes cache
               | otherwise = EagerShapes defaultMDLBudget rectCoverBudget
      shapeBasis | not wantShapes = "not_computed"
                 | rcLazyMDL cfg = "mdl_cached"
                 | otherwise = "mdl_eager"
      forceScene=either length (\s->S.size (shResidual s)+length (shObjects s))
      scenes=[(v,[timedForce "scene_build" forceScene (vr >>= sceneFromRegions shapeSrc v x) | ((x,_),vr)<-zip pairs ers]) | (v,ers)<-vrs]
      legal=[(v,ss) | (v,rs)<-scenes, Right ss<-[sequence rs]]
      rejected=[(v,e) | (v,rs)<-scenes, Left e<-[sequence rs]]
      forceTree (t,_)=M.size (rtNodes t)+sum (map regionArea (M.elems (rtNodes t)))
      trees=[(k,v,fst (timedForce "partition_expand" forceTree (expandLazy (rcPartition cfg) (rootNode s)))) | (v,ss)<-legal, (k,s)<-zip [0..] ss]
      treeHashes=ML.fromList [((k,v),treeHashOf t) | (k,v,t)<-trees]   -- lazy, computed on demand
      -- shared colour constants of actions come from the training scenes (inputs and targets), as in the Stage C grammar
      colours=sort (nub [c | (x,y)<-pairs, c<-concat (rows x)++concat (rows y)])
      sels=enumerateSelectors colours
      acts=enumerateActions colours sels
      -- view order: cheapest scene (MDL) first when MDL is on, else fixed view order
      viewOrder=if rcMDL cfg then map fst (sortOn (\(v,ss)->(sum (map (scTotal . shCost) ss),show v)) legal) else map fst legal
      universe=[RegionProgram v s a | v<-viewOrder, s<-sels, a<-acts]
      treeOf k v=head [t | (k',v',t)<-trees, k'==k, v'==v]
      -- ---- Stage E3.1 input-side selector precheck (lazy exact cache keyed by (view, selector); trees are fixed for the search)
      checkOf v s=SelectorCheck v s [(k,resolveSelector s (treeOf k v)) | k<-[0..ncases-1]] [(k,treeHashes ML.! (k,v)) | k<-[0..ncases-1]]
      checks=ML.fromList [((v,s),timedForce "selector_precheck" (length . concatMap (outcomeKind . snd) . scCases) (checkOf v s)) | v<-map fst legal, s<-sels]
      precheckOf p=decideFromChecks p [(role,s,[(k,Just o) | (k,o)<-scCases (checks ML.! (rpView p,s))]) | (role,s)<-programSelectors p]
      invalidByPrecheck p=case precheckOf p of PrecheckInvalid{}->True; _->False
      usePrecheckOrder=rcSelectorPriority cfg
      orderKey p
        | usePrecheckOrder = (layerOf p,if invalidByPrecheck p then 1 else 0,programCost p,show p)
        | rcRegionFirst cfg = (layerOf p,sizeClass (rpSelector p),programCost p,show p)
        | otherwise = (layerOf p,0,programCost p,show p)
      candsOf v l=sortOn orderKey [p | p<-universe, rpView p==v, layerOf p==l]
      validCount v l=length [() | p<-universe, rpView p==v, layerOf p==l, not (invalidByPrecheck p)]
      goals0=[GoalLedger (viewText v++"/L"++show l) v l (length cs) 0 0 0 0 0 "pending" 0 0 0 (if rcPrecheck cfg || usePrecheckOrder then Just (validCount v l) else Nothing)
             | v<-viewOrder, l<-[0,1,2], let cs=[p | p<-universe, rpView p==v, layerOf p==l], not (null cs)]
      -- goal service order inside a layer: view order (E3) or fewest valid candidates first (selector priority), stable
      goalsOfLayer l=let gs=[g | g<-goals0, glLayer g==l] in if usePrecheckOrder then map snd (sortOn (\(i,g)->(maybe 0 id (glValidCandidates g),i)) (zip [0::Int ..] gs)) else gs
      -- safe prune evidence per view (training targets are read here: fitting-time only)
      deps=[dependencyFor v ts | (v,_)<-legal, let ts=[(k,t) | (k,v',t)<-trees, v'==v]]
      dependencyFor v ts=
        let dimsOk=all (\(x,y)->dimensions x==dimensions y) pairs
            changed=[(k,v,[rnId n | n<-depth1 t, any (\p->cell x p/=cell y p) (S.toList (rnPixels n))]++[-1 | any (\p->cell x p/=cell y p) (S.toList (rootRest t))]) | (k,t)<-ts, let (x,y)=pairs!!k]
        in DependencyWitness "PreserveExcept(edit)[Region <- sel]: Local write = selected region, dims = input" "reads the selected region's objects; writes only the selected region; every other pixel is copied from the input"
             changed dimsOk [] 0 "a Local program cannot reproduce a target that differs from the input outside its write region or in its dimensions; CrossRegion/Selection programs are never pruned"
      depth1 t=[n | n<-M.elems (rtNodes t), rnDepth n==1, rnRole n==RoleContent]
      rootRest t=S.difference (rnPixels (rtNodes t M.! 0)) (S.unions (map rnPixels (depth1 t)))
      -- changed pixels per (case, view): read from the training target (fitting time only)
      diffPixels k=let (x,y)=pairs!!k in S.fromList [q | q<-coords (dimensions x), cell x q/=cell y q]
      prunable p=case (rcSafePrune cfg,rpAction p) of
        (True,PreserveExcept _)->
          let dw=head [d | d<-deps, case dwChangedRegions d of ((_,v,_):_)->v==rpView p; _->False]
          in if not (dwDimsPreserved dw) then Just ("dims differ in some case; a Local program keeps the input dims","target dims /= input dims")
             else let bad=[(k,S.size (S.difference (diffPixels k) (rnPixels sel))) | (k,_)<-zip [0::Int ..] pairs, Right sel<-[selectRegion (rpSelector p) (treeOf k (rpView p))], not (diffPixels k `S.isSubsetOf` rnPixels sel)]
                  in case bad of
                       []->Nothing
                       ((k,n):_)->Just ("target of case "++show k++" differs from the input on "++show n++" pixels outside the selected (write) region","changed pixels not inside the write region; a Local program copies every other pixel from the input")
        _->Nothing
      sharedRuleOK p=case (rcSafePrune cfg,rpSelector p,rpAction p) of
        (True,SelRoot,PreserveExcept (RecolorObjects c))->
          -- intersection of per-region fits: every depth-1 region's objects must be colour c in the target
          and [all (\o->all (\q->cell y q==Just c) (S.toList (poSupport o))) [o | o<-shObjects (rtScene t), any (\n->poSupport o `S.isSubsetOf` rnPixels n) (depth1 t)] | (k,v,t)<-trees, v==rpView p, let (_,y)=pairs!!k]
        _->True
      execute p=
        let outs=[(k,runRegionProgramOn (treeOf k (rpView p)) p) | (k,_)<-zip [0::Int ..] pairs]
            verdict=case [(k,e) | (k,Left e)<-outs] of
              ((k,e):_)->("execution_invalid","case "++show k++": "++e)
              []->case [k | (k,Right r)<-outs, reOutput r/=snd (pairs!!k)] of
                    []->("fit","train_exact")
                    (k:_)->("no_fit","case "++show k++": grid differs"++(if dimensions (reOutput (either undefined id (snd (outs!!k))))/=dimensions (snd (pairs!!k)) then " (dims)" else ""))
            area=case [r | (_,Right r)<-outs] of (r:_)->Just (reRegionArea r); []->Nothing
        in timedForce "candidate_execution" (\((oc,why),_)->length oc+length why) (verdict,area)
      bump g f st=st {ssGoals=[if glId gl==glId g then f gl else gl | gl<-ssGoals st]}
      step st (g,p)
        | ssCut st = st
        | ssEx st>=rcExecutionBudget cfg = st {ssCut=True}
        | otherwise =
            let cidx=ssConsidered st
                st1=st {ssConsidered=cidx+1}
                verdict=if rcPrecheck cfg then precheckOf p else PrecheckValid
            in case verdict of
              PrecheckInvalid{}->bump g (\gl->gl {glPrechecked=glPrechecked gl+1}) st1 {ssPc=ssPc st1+1,ssPcl=PrecheckedCandidate p cidx verdict:ssPcl st1}
              _->case timedForce "dependency_prune" (maybe 0 (length . fst)) (prunable p) of
                Just (why,ev)->bump g (\gl->gl {glPruned=glPruned gl+1}) st1 {ssPr=ssPr st1+1,ssPrl=PrunedCandidate p why ev:ssPrl st1}
                Nothing | not (sharedRuleOK p)->bump g (\gl->gl {glPruned=glPruned gl+1}) st1 {ssPr=ssPr st1+1,ssPrl=PrunedCandidate p "shared rule: the colour does not fit every depth-1 region (intersection of per-region fits)" "per-region fit sets":ssPrl st1}
                Nothing->
                  let ((oc,why),area)=execute p
                      idx=ssNExps st1
                      e=Exposure idx cidx (rpView p) (layerOf p) p oc why area
                      isFit=oc=="fit"
                      fv'=M.insertWith (\_ old->old) (viewText (rpView p)) idx (ssFv st1)
                      ff'=case ssFf st1 of Nothing | isFit->Just idx; x->x
                      ffc'=case ssFfCand st1 of Nothing | isFit->Just cidx; x->x
                      firstFitNow=isFit && ssFf st1==Nothing
                      st2=bump g (\gl->gl {glUsed=glUsed gl+1,glFits=glFits gl+(if isFit then 1 else 0)}) st1
                        {ssExps=e:ssExps st1,ssNExps=idx+1,ssFits=if isFit then ssFits st1++[p] else ssFits st1,ssEx=ssEx st1+1,ssFv=fv',ssFf=ff',ssFfCand=ffc'
                        ,ssPrBeforeFit=if firstFitNow then ssPr st1 else ssPrBeforeFit st1,ssPcBeforeFit=if firstFitNow then ssPc st1 else ssPcBeforeFit st1}
                  in (if isFit then traceEvent "latis-train-exact" else id) $ traceCand levelCandidates (stableHash (show p)) (\_->[("scope",jstr "RegionSearch"),("kind",jstr "evaluated"),("stage",jstr "region_search"),("entry",jstr "region_search"),("branch_id",jstr (glId g)),("parent_branch_id",jstr "region_search")
                       ,("candidate_ast",programJSON p),("candidate_type",jstr "RegionProgram"),("cost",show (programCost p)),("layer",show (layerOf p)),("exposure_index",show idx),("candidate_index",show cidx),("outcome",jstr oc),("reason_code",jstr why),("region_area",jmaybe show area)])
                     st2
      solved st=ssCut st || (rcFirstFitStop cfg && not (null (ssFits st)))
      -- breadth: layer by layer, deficit round-robin with quantum; non-breadth: view after view, exhaustive
      runBreadth st0=foldl' layerRun st0 [0,1,2]
      layerRun st l=
        let goalsL=goalsOfLayer l
            cursors0=M.fromList [(glId g,0) | g<-goalsL]
            loop st' cursors ledger
              | solved st' = (st',ledger)
              | all (\g->cursors M.! glId g>=glTotal g) goalsL = (st',ledger)
              | otherwise =
                  let (st'',cursors',ledger')=foldl' (\(s,cs,lg) g->
                        let c=cs M.! glId g
                            cs'=candsOf (glView g) l
                            quantum=rcQuantum cfg
                            chunk=take quantum (drop c cs')
                            resumed=c>0 && not (null chunk)
                            s'=foldl' (\acc p->if solved acc then acc else step acc (g,p)) s chunk
                            c'=c+length chunk
                            deferred=c'<glTotal g && not (solved s')
                            lg'=M.adjust (\x->x {glCursor=c',glAllocated=glAllocated x+quantum,glDeferred=glDeferred x+(if deferred then 1 else 0),glResumed=glResumed x+(if resumed then 1 else 0),glStatus=if c'>=glTotal g then "exhausted" else if solved s' then "stopped" else "deferred"}) (glId g) lg
                        in if solved s then (s,cs,lg) else (s',M.insert (glId g) c' cs,lg')) (st',cursors,ledger) goalsL
                  in loop st'' cursors' ledger'
            (stF,ledgerF)=loop st cursors0 (M.fromList [(glId g,g) | g<-goalsL])
            -- merge the per-layer ledger (cursor/allocated/deferred/resumed/status) with the per-step counters (used/fits/prechecked/pruned)
        in stF {ssGoals=[case M.lookup (glId g) ledgerF of
                           Just lg->g {glCursor=glCursor lg,glAllocated=glAllocated lg,glDeferred=glDeferred lg,glResumed=glResumed lg,glStatus=glStatus lg}
                           Nothing->g | g<-ssGoals stF]}
      runSequential st0=foldl' (\st g->if solved st then st else
          let cs=candsOf (glView g) (glLayer g)
              st'=foldl' (\acc p->if solved acc then acc else step acc (g,p)) st cs
              used=length [() | e'<-ssExps st', exView e'==glView g, exLayer e'==glLayer g]
          in st' {ssGoals=[if glId x==glId g then x {glCursor=used,glAllocated=glTotal g,glStatus=if used>=glTotal g then "exhausted" else "stopped"} else x | x<-ssGoals st']}) st0 (sortOn (\g->(show (glView g),glLayer g)) goals0)
      st0=SState goals0 [] 0 [] 0 0 [] 0 [] M.empty Nothing Nothing False 0 0 0
      stF=if rcBreadth cfg then runBreadth st0 else runSequential st0
      exps=reverse (ssExps stF)
      prl=ssPrl stF
      deps'=[d {dwPruned=[x | x<-reverse prl, rpView (pcProgram x)==v],dwKept=length [() | e<-exps, exView e==v, case rpAction (exProgram e) of PreserveExcept _->True; _->False]} | d<-deps, let v=case dwChangedRegions d of ((_,v',_):_)->v'; _->LegacyView]
      prechecked=reverse (ssPcl stF)
      lookups=sum [length (programSelectors (pkProgram x)) | x<-prechecked]+sum [length (programSelectors (exProgram e)) | e<-exps]+sum [length (programSelectors (pcProgram x)) | x<-prl]
      -- the complete input-side evidence table (every (view, selector) entry) is recorded when the
      -- precheck is on; the entries the search actually consulted are counted separately
      witness=if rcPrecheck cfg || usePrecheckOrder then ML.elems checks else []
      referenced=S.fromList ([(rpView (pkProgram x),s) | x<-prechecked, (_,s)<-programSelectors (pkProgram x)]++[(rpView (exProgram e),s) | e<-exps, (_,s)<-programSelectors (exProgram e)]++[(rpView (pcProgram x),s) | x<-prl, (_,s)<-programSelectors (pcProgram x)])
      referencedCount=if rcPrecheck cfg then S.size referenced else 0
      goalOrder=[glId g | l<-[0,1,2], g<-goalsOfLayer l]
      traceSummary x=traceAt levelBranches [("scope",jstr "RegionSearch"),("kind",jstr "grammar"),("stage",jstr "region_search"),("branch_id",jstr "region_search"),("parent_branch_id",jstr "task")
        ,("views",jarr [jstr (viewText v) | (v,_)<-legal]),("rejected_views",jarr [jobj [("view",jstr (viewText v)),("reason",jstr e)] | (v,e)<-rejected]),("universe",show (length universe)),("goals",show (length goals0))
        ,("breadth",jbool (rcBreadth cfg)),("region_first",jbool (rcRegionFirst cfg)),("safe_prune",jbool (rcSafePrune cfg)),("mdl",jbool (rcMDL cfg)),("quantum",show (rcQuantum cfg)),("execution_budget",show (rcExecutionBudget cfg))
        ,("precheck",jbool (rcPrecheck cfg)),("lazy_mdl",jbool (rcLazyMDL cfg)),("selector_priority",jbool usePrecheckOrder)] x
  in traceSummary (RegionSearch [(v,shEvidence (head ss)) | (v,ss)<-legal] rejected trees (ssGoals stF) exps (ssFits stF) (ssEx stF) (ssPr stF) (ssCut stF) deps' (ssFv stF) (ssFf stF) (length universe) [(v,sum (map (scTotal . shCost) ss)) | (v,ss)<-legal]
       (ssConsidered stF) prechecked witness (if rcPrecheck cfg then lookups else 0) referencedCount (ssFfCand stF) (ssPrBeforeFit stF) (ssPcBeforeFit stF)
       (if wantShapes && rcLazyMDL cfg then Just cache else Nothing) (length supports) shapeBasis goalOrder cfg)

regionMetricNames :: [String]
regionMetricNames=words "rg_triggered rg_views_legal rg_views_rejected rg_trees rg_splits_tried rg_splits_legal rg_universe rg_goals rg_executed rg_pruned rg_fits rg_budget_cut rg_deferred rg_resumed rg_first_fit_exposure rg_first_view_exposure_max rg_k2plus_splits rg_selected_cost rg_candidates_considered rg_prechecked rg_precheck_entries rg_precheck_entries_referenced rg_precheck_lookups rg_selector_evaluations rg_execution_invalid rg_no_fit rg_first_fit_candidate_index rg_pruned_before_first_fit rg_prechecked_before_first_fit rg_mdl_objects rg_mdl_distinct_masks rg_mdl_cache_hits_static rg_mdl_proven rg_mdl_bounded rg_mdl_not_computed rg_crect_computed"
regionMetrics :: RegionSearch -> [(String,Int)]
regionMetrics r=[("rg_triggered",1),("rg_views_legal",length (rsViews r)),("rg_views_rejected",length (rsRejectedViews r)),("rg_trees",length (rsTrees r))
  ,("rg_splits_tried",sum [rtSplitsTried t | (_,_,t)<-rsTrees r]),("rg_splits_legal",sum [rtSplitsLegal t | (_,_,t)<-rsTrees r]),("rg_universe",rsUniverse r),("rg_goals",length (rsGoals r))
  ,("rg_executed",rsExecuted r),("rg_pruned",rsPruned r),("rg_fits",length (rsFits r)),("rg_budget_cut",if rsBudgetCut r then 1 else 0)
  ,("rg_deferred",sum (map glDeferred (rsGoals r))),("rg_resumed",sum (map glResumed (rsGoals r))),("rg_first_fit_exposure",maybe (-1) id (rsFirstFitExposure r))
  ,("rg_first_view_exposure_max",maximum (0:M.elems (rsFirstViewExposure r))),("rg_k2plus_splits",sum [v | (_,_,t)<-rsTrees r, (k,v)<-M.toList (rtKHist t), k>=2])
  ,("rg_selected_cost",case rsFits r of (p:_)->programCost p; []->0)
  ,("rg_candidates_considered",rsConsidered r),("rg_prechecked",length (rsPrechecked r)),("rg_precheck_entries",length (rsPrecheckWitness r)),("rg_precheck_entries_referenced",rsPrecheckEntriesReferenced r),("rg_precheck_lookups",rsPrecheckLookups r)
  ,("rg_selector_evaluations",sum [length (scCases c) | c<-rsPrecheckWitness r])
  ,("rg_execution_invalid",length [() | e<-rsExposures r, exOutcome e=="execution_invalid"]),("rg_no_fit",length [() | e<-rsExposures r, exOutcome e=="no_fit"])
  ,("rg_first_fit_candidate_index",maybe (-1) id (rsFirstFitCandidate r)),("rg_pruned_before_first_fit",rsPrunedBeforeFit r),("rg_prechecked_before_first_fit",rsPrecheckedBeforeFit r)
  ,("rg_mdl_objects",rsMDLObjects r),("rg_mdl_distinct_masks",maybe 0 (\c->M.size (M.fromList (ML.toList (mcEntries c)))) (rsMDLCache r)),("rg_mdl_cache_hits_static",maybe 0 (\c->mcReferences c-ML.size (mcEntries c)) (rsMDLCache r))
  ,("rg_mdl_proven",length [() | Just s<-shapes, mrStatus s=="ProvenOptimalInUniverse"]),("rg_mdl_bounded",length [() | Just s<-shapes, mrStatus s=="BoundedBest"]),("rg_mdl_not_computed",length [() | Nothing<-shapes])
  ,("rg_crect_computed",length [() | Just s<-shapes, isJust (mrRectCover s)])]
  where shapes=[poShape o | (_,_,t)<-rsTrees r, o<-shObjects (rtScene t)]

selectorCheckJSON :: SelectorCheck -> String
selectorCheckJSON c=jobj [("view",jstr (viewText (scView c))),("selector",jstr (selectorText (scSelector c)))
  ,("verdict",jstr (if all (\(_,o)->outcomeKind o=="ValidSelected") (scCases c) then "ValidSelected" else "Invalid"))
  ,("cases",jarr [jobj [("case_index",show k),("kind",jstr (outcomeKind o)),("matched_ids",show (outcomeIds o)),("cardinality",show (length (outcomeIds o))),("reason",jstr (either id (const "selected") (outcomeText o))),("tree_hash",jstr (maybe "" id (lookup k (scTreeHashes c))))] | (k,o)<-scCases c])
  ,("input_only",jbool True),("key",jstr "(view, selector AST, tree identity per case)")]
precheckedJSON :: PrecheckedCandidate -> String
precheckedJSON x=jobj ([("program",jstr (programText (pkProgram x))),("candidate_index",show (pkCandidateIndex x)),("kind",jstr (verdictKind (pkVerdict x)))]++case pkVerdict x of
  PrecheckInvalid role s k _ ev->[("role",jstr role),("selector",jstr (selectorText s)),("case_index",show k),("evidence",jstr ev)]
  PrecheckUnknown why->[("why",jstr why)]
  PrecheckValid->[])

regionSearchJSON :: RegionSearch -> String
regionSearchJSON r=jobj
  [("views",jarr [jobj [("view",jstr (viewText v)),("evidence",jstr e),("scene_cost",jmaybe show (lookup v (rsSceneCost r))),("scene_cost_basis",jstr (rsShapeBasis r))] | (v,e)<-rsViews r])
  ,("rejected_views",jarr [jobj [("view",jstr (viewText v)),("reason",jstr e)] | (v,e)<-rsRejectedViews r])
  ,("trees",jarr [jobj [("case_index",show k),("view",jstr (viewText v)),("tree_hash",jstr (treeHashOf t)),("tree",treeJSON t)] | (k,v,t)<-rsTrees r])
  ,("goals",jarr [jobj [("goal_id",jstr (glId g)),("view",jstr (viewText (glView g))),("layer",show (glLayer g)),("total",show (glTotal g)),("cursor",show (glCursor g)),("used",show (glUsed g)),("allocated",show (glAllocated g)),("deferred",show (glDeferred g)),("resumed",show (glResumed g)),("status",jstr (glStatus g)),("fits",show (glFits g))
                       ,("prechecked",show (glPrechecked g)),("pruned",show (glPruned g)),("valid_candidates",jmaybe show (glValidCandidates g))] | g<-rsGoals r])
  ,("goal_order",jarr (map jstr (rsGoalOrder r)))
  ,("exposures",jarr [jobj [("index",show (exIndex e)),("candidate_index",show (exCandidateIndex e)),("view",jstr (viewText (exView e))),("layer",show (exLayer e)),("program",jstr (programText (exProgram e))),("cost",show (programCost (exProgram e))),("outcome",jstr (exOutcome e)),("reason",jstr (exReason e)),("region_area",jmaybe show (exRegionArea e))] | e<-rsExposures r])
  ,("fits",jarr (map programJSON (rsFits r))),("executed",show (rsExecuted r)),("pruned",show (rsPruned r)),("budget_cut",jbool (rsBudgetCut r)),("universe",show (rsUniverse r))
  ,("first_view_exposure",jobj [(v,show i) | (v,i)<-M.toList (rsFirstViewExposure r)]),("first_fit_exposure",jmaybe show (rsFirstFitExposure r)),("first_fit_candidate_index",jmaybe show (rsFirstFitCandidate r))
  ,("universe_accounting",jobj [("universe",show (rsUniverse r)),("considered",show (rsConsidered r)),("executed",show (rsExecuted r)),("prechecked_invalid",show (length (rsPrechecked r))),("dependency_pruned",show (rsPruned r))
      ,("remaining_not_reached",show (rsUniverse r-rsConsidered r)),("identity",jstr "considered = executed + prechecked_invalid + dependency_pruned; universe = considered + remaining_not_reached"),("consistent",jbool (rsConsidered r==rsExecuted r+length (rsPrechecked r)+rsPruned r))])
  ,("outcome_counts",jobj [("fit",show (length [() | e<-rsExposures r, exOutcome e=="fit"])),("no_fit",show (length [() | e<-rsExposures r, exOutcome e=="no_fit"])),("execution_invalid",show (length [() | e<-rsExposures r, exOutcome e=="execution_invalid"]))])
  ,("precheck",jobj [("enabled",jbool (rcPrecheck (rsConfig r))),("skipped",show (length (rsPrechecked r))),("entries",show (length (rsPrecheckWitness r))),("entries_referenced",show (rsPrecheckEntriesReferenced r)),("lookups",show (rsPrecheckLookups r))
      ,("selector_evaluations",show (sum [length (scCases c) | c<-rsPrecheckWitness r])),("kinds",jobj [(k,show n) | (k,n)<-M.toList (M.fromListWith (+) [(verdictKind (pkVerdict x),1::Int) | x<-rsPrechecked r])])
      ,("witnesses",jarr (map selectorCheckJSON (rsPrecheckWitness r))),("skipped_candidates",jarr (map precheckedJSON (rsPrechecked r)))
      ,("note",jstr "input-side only: selector outcomes on the training INPUT trees; a skipped candidate is still a member of the fixed universe and is never an accepted candidate; Unknown verdicts execute; `entries` is the complete evidence table recorded for replay (all (view, selector) pairs of the legal views), `entries_referenced` the pairs the considered candidates actually consulted; the selector_precheck timer includes forcing the whole table at record time")])
  ,("mdl_cache",jmaybe mdlCacheJSON (rsMDLCache r)),("shape_basis",jstr (rsShapeBasis r)),("mdl_objects",show (rsMDLObjects r))
  ,("scheduler",jobj [("breadth",jbool (rcBreadth (rsConfig r))),("region_first",jbool (rcRegionFirst (rsConfig r))),("selector_priority",jbool (rcSelectorPriority (rsConfig r))),("quantum",show (rcQuantum (rsConfig r))),("execution_budget",show (rcExecutionBudget (rsConfig r))),("quantum_unit",jstr "candidates taken from a goal list per round (skipped candidates included); the execution budget counts executions only")])
  ,("dependency_witnesses",jarr [jobj [("skeleton",jstr (dwSkeleton d)),("scope",jstr (dwScope d)),("dims_preserved",jbool (dwDimsPreserved d))
      ,("changed_regions",jarr [jobj [("case_index",show k),("view",jstr (viewText v)),("regions",show rs)] | (k,v,rs)<-dwChangedRegions d])
      ,("pruned",jarr [jobj [("program",jstr (programText (pcProgram x))),("reason",jstr (pcReason x)),("evidence",jstr (pcEvidence x))] | x<-dwPruned d]),("pruned_count",show (length (dwPruned d))),("kept_executed",show (dwKept d)),("note",jstr (dwNote d))] | d<-rsDependency r])
  ,("metrics",jobj [(k,show v) | (k,v)<-regionMetrics r])]
