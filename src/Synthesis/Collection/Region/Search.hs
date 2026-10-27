-- LATIS Stage E3: Region-first, breadth-first, goal-fair search over scene
-- views and region programs, with one provable safe prune.
--
-- Goals: one RegionRuleGoal per (view, layer). A goal owns an ordered
-- candidate list and a cursor; the scheduler gives every goal of the current
-- layer a bounded quantum of executions per round (deficit round-robin), so
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
module Synthesis.Collection.Region.Search
  ( RegionConfig(..), regionConfigOff, regionConfigOn, RegionSearch(..), GoalLedger(..), Exposure(..), DependencyWitness(..), PrunedCandidate(..)
  , searchRegions, regionSearchJSON, regionMetricNames, regionMetrics
  ) where

import Latent.Grid
import Synthesis.Collection.Region.Scene
import Synthesis.Collection.Region.Partition
import Synthesis.Collection.Region.Program
import Synthesis.Collection.Region.ShapeMDL (defaultMDLBudget)
import Synthesis.Collection.Geometry.View (ViewId(..), viewText, allBackgroundViews)
import Synthesis.Collection.Diagnostics (jstr, jobj, jarr, jbool, jmaybe, stableHash, traceAt, traceCand, levelBranches, levelCandidates)
import qualified Data.Set as S
import qualified Data.Map.Strict as M
import Data.List (sortOn, nub, sort, foldl')
import Debug.Trace (traceEvent)

data RegionConfig = RegionConfig
  { rcEnabled :: Bool, rcRegionFirst :: Bool, rcBreadth :: Bool, rcSafePrune :: Bool, rcMDL :: Bool
  , rcQuantum :: Int            -- executions per goal per round (breadth)
  , rcExecutionBudget :: Int    -- total program executions (a program execution = all its cases)
  , rcFirstFitStop :: Bool      -- stop at the first train-exact program (False: collect every fit, for differentials)
  , rcPartition :: PartitionBudget } deriving (Eq,Show)
regionConfigOff, regionConfigOn :: RegionConfig
regionConfigOff=RegionConfig False False False False False 0 0 True defaultPartitionBudget
regionConfigOn=RegionConfig True True True True True 6 2400 True defaultPartitionBudget

data Exposure = Exposure { exIndex :: Int, exView :: ViewId, exLayer :: Int, exProgram :: RegionProgram, exOutcome :: String, exReason :: String, exRegionArea :: Maybe Int } deriving (Eq,Show)
data GoalLedger = GoalLedger { glId :: String, glView :: ViewId, glLayer :: Int, glTotal :: Int, glCursor :: Int, glUsed :: Int, glAllocated :: Int, glDeferred :: Int, glResumed :: Int, glStatus :: String, glFits :: Int } deriving (Eq,Show)
data PrunedCandidate = PrunedCandidate { pcProgram :: RegionProgram, pcReason :: String, pcEvidence :: String } deriving (Eq,Show)
data DependencyWitness = DependencyWitness
  { dwSkeleton :: String, dwScope :: String, dwChangedRegions :: [(Int,ViewId,[Int])]   -- (case, view, depth-1 regions where target /= input)
  , dwDimsPreserved :: Bool, dwPruned :: [PrunedCandidate], dwKept :: Int, dwNote :: String } deriving (Eq,Show)
data RegionSearch = RegionSearch
  { rsViews :: [(ViewId,String)]                 -- legal views (scene legal on every case) with evidence
  , rsRejectedViews :: [(ViewId,String)]
  , rsTrees :: [(Int,ViewId,RegionTree)]
  , rsGoals :: [GoalLedger], rsExposures :: [Exposure], rsFits :: [RegionProgram]
  , rsExecuted :: Int, rsPruned :: Int, rsBudgetCut :: Bool, rsDependency :: [DependencyWitness]
  , rsFirstViewExposure :: M.Map String Int      -- view -> exposure index of its first executed candidate
  , rsFirstFitExposure :: Maybe Int, rsUniverse :: Int, rsSceneCost :: [(ViewId,Int)] } deriving (Eq,Show)

layerOf :: RegionProgram -> Int
layerOf p=case rpAction p of
  StampAtMarkers _->2
  CropRegion->if rpSelector p `elem` [SelRoot,SelLargestContent,SelContentWithObjects,SelContentWithoutObjects] then 0 else 1
  PreserveExcept ClearRegion->if rpSelector p `elem` [SelRoot,SelLargestContent] then 0 else 1
  _->1
sizeClass :: RegionSelector -> Int
sizeClass s=case s of SelRoot->0; SelLargestContent->1; SelSmallestContent->3; _->2

searchRegions :: RegionConfig -> [(Grid,Grid)] -> RegionSearch
searchRegions cfg pairs=
  let views0=LegacyView:allBackgroundViews
      scenes=[(v,[sceneFromView defaultMDLBudget (rcMDL cfg) v x | (x,_)<-pairs]) | v<-views0]
      legal=[(v,ss) | (v,rs)<-scenes, Right ss<-[sequence rs]]
      rejected=[(v,e) | (v,rs)<-scenes, Left e<-[sequence rs]]
      trees=[(k,v,fst (expandLazy (rcPartition cfg) (rootNode s))) | (v,ss)<-legal, (k,s)<-zip [0..] ss]
      -- shared colour constants of actions come from the training scenes (inputs and targets), as in the Stage C grammar
      colours=sort (nub [c | (x,y)<-pairs, c<-concat (rows x)++concat (rows y)])
      sels=enumerateSelectors colours
      acts=enumerateActions colours sels
      -- view order: cheapest scene (MDL) first when MDL is on, else fixed view order
      viewOrder=if rcMDL cfg then map fst (sortOn (\(v,ss)->(sum (map (scTotal . shCost) ss),show v)) legal) else map fst legal
      universe=[RegionProgram v s a | v<-viewOrder, s<-sels, a<-acts]
      orderKey p=if rcRegionFirst cfg then (layerOf p,sizeClass (rpSelector p),programCost p,show p) else (layerOf p,0,programCost p,show p)
      goals0=[GoalLedger (viewText v++"/L"++show l) v l (length cs) 0 0 0 0 0 "pending" 0 | v<-viewOrder, l<-[0,1,2], let cs=[p | p<-universe, rpView p==v, layerOf p==l], not (null cs)]
      candsOf v l=sortOn orderKey [p | p<-universe, rpView p==v, layerOf p==l]
      -- safe prune evidence per view (training targets are read here: fitting-time only)
      deps=[dependencyFor v ts | (v,_)<-legal, let ts=[(k,t) | (k,v',t)<-trees, v'==v]]
      dependencyFor v ts=
        let dimsOk=all (\(x,y)->dimensions x==dimensions y) pairs
            changed=[(k,v,[rnId n | n<-depth1 t, any (\p->cell x p/=cell y p) (S.toList (rnPixels n))]++[-1 | any (\p->cell x p/=cell y p) (S.toList (rootRest t))]) | (k,t)<-ts, let (x,y)=pairs!!k]
        in DependencyWitness "PreserveExcept(edit)[Region <- sel]: Local write = selected region, dims = input" "reads the selected region's objects; writes only the selected region; every other pixel is copied from the input"
             changed dimsOk [] 0 "a Local program cannot reproduce a target that differs from the input outside its write region or in its dimensions; CrossRegion/Selection programs are never pruned"
      depth1 t=[n | n<-M.elems (rtNodes t), rnDepth n==1, rnRole n==RoleContent]
      rootRest t=S.difference (rnPixels (rtNodes t M.! 0)) (S.unions (map rnPixels (depth1 t)))
      treeOf k v=head [t | (k',v',t)<-trees, k'==k, v'==v]
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
        in (verdict,area)
      -- scheduler state: (goals, exposures, fits, executed, pruned, prunedList, firstView, firstFit, cut)
      step (gs,exps,fits,ex,pr,prl,fv,ff,cut) (g,p)
        | cut = (gs,exps,fits,ex,pr,prl,fv,ff,cut)
        | ex>=rcExecutionBudget cfg = (gs,exps,fits,ex,pr,prl,fv,ff,True)
        | otherwise =
            case prunable p of
              Just (why,ev)->(gs,exps,fits,ex,pr+1,PrunedCandidate p why ev:prl,fv,ff,cut)
              Nothing | not (sharedRuleOK p)->(gs,exps,fits,ex,pr+1,PrunedCandidate p "shared rule: the colour does not fit every depth-1 region (intersection of per-region fits)" "per-region fit sets":prl,fv,ff,cut)
              Nothing->
                let ((oc,why),area)=execute p
                    idx=length exps
                    e=Exposure idx (rpView p) (layerOf p) p oc why area
                    fits'=if oc=="fit" then fits++[p] else fits
                    fv'=M.insertWith (\_ old->old) (viewText (rpView p)) idx fv
                    ff'=case ff of Nothing | oc=="fit"->Just idx; x->x
                    gs'=[if glId gl==glId g then gl {glUsed=glUsed gl+1,glFits=glFits gl+(if oc=="fit" then 1 else 0)} else gl | gl<-gs]
                in (if oc=="fit" then traceEvent "latis-train-exact" else id) $ traceCand levelCandidates (stableHash (show p)) (\_->[("scope",jstr "RegionSearch"),("kind",jstr "evaluated"),("stage",jstr "region_search"),("entry",jstr "region_search"),("branch_id",jstr (glId g)),("parent_branch_id",jstr "region_search")
                     ,("candidate_ast",programJSON p),("candidate_type",jstr "RegionProgram"),("cost",show (programCost p)),("layer",show (layerOf p)),("exposure_index",show idx),("outcome",jstr oc),("reason_code",jstr why),("region_area",jmaybe show area)])
                   (gs',exps++[e],fits',ex+1,pr,prl,fv',ff',cut)
      solved (_,_,fits,_,_,_,_,_,cut)=cut || (rcFirstFitStop cfg && not (null fits))
      -- breadth: layer by layer, deficit round-robin with quantum; non-breadth: view after view, exhaustive
      runBreadth st0=foldl' layerRun st0 [0,1,2]
      layerRun st l=
        let goalsL=[g | g<-goals0, glLayer g==l]
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
            (gs,a,b,c,d,e,f,h,i)=stF
        in (map (\g->M.findWithDefault g (glId g) ledgerF) gs,a,b,c,d,e,f,h,i)
      runSequential st0=foldl' (\st g->if solved st then st else
          let cs=candsOf (glView g) (glLayer g)
              st'=foldl' (\acc p->if solved acc then acc else step acc (g,p)) st cs
              (gs,a,b,c,d,e,f,h,i)=st'
              used=length [() | e'<-a, exView e'==glView g, exLayer e'==glLayer g]
          in ([if glId x==glId g then x {glCursor=used,glAllocated=glTotal g,glStatus=if used>=glTotal g then "exhausted" else "stopped"} else x | x<-gs],a,b,c,d,e,f,h,i)) st0 (sortOn (\g->(show (glView g),glLayer g)) goals0)
      st0=(goals0,[],[],0,0,[],M.empty,Nothing,False)
      (gsF,exps,fits,ex,pr,prl,fv,ff,cut)=if rcBreadth cfg then runBreadth st0 else runSequential st0
      deps'=[d {dwPruned=[x | x<-reverse prl, rpView (pcProgram x)==v],dwKept=length [() | e<-exps, exView e==v, case rpAction (exProgram e) of PreserveExcept _->True; _->False]} | d<-deps, let v=case dwChangedRegions d of ((_,v',_):_)->v'; _->LegacyView]
      traceSummary x=traceAt levelBranches [("scope",jstr "RegionSearch"),("kind",jstr "grammar"),("stage",jstr "region_search"),("branch_id",jstr "region_search"),("parent_branch_id",jstr "task")
        ,("views",jarr [jstr (viewText v) | (v,_)<-legal]),("rejected_views",jarr [jobj [("view",jstr (viewText v)),("reason",jstr e)] | (v,e)<-rejected]),("universe",show (length universe)),("goals",show (length goals0))
        ,("breadth",jbool (rcBreadth cfg)),("region_first",jbool (rcRegionFirst cfg)),("safe_prune",jbool (rcSafePrune cfg)),("mdl",jbool (rcMDL cfg)),("quantum",show (rcQuantum cfg)),("execution_budget",show (rcExecutionBudget cfg))] x
  in traceSummary (RegionSearch [(v,shEvidence (head ss)) | (v,ss)<-legal] rejected trees gsF exps fits ex pr cut deps' fv ff (length universe) [(v,sum (map (scTotal . shCost) ss)) | (v,ss)<-legal])

regionMetricNames :: [String]
regionMetricNames=words "rg_triggered rg_views_legal rg_views_rejected rg_trees rg_splits_tried rg_splits_legal rg_universe rg_goals rg_executed rg_pruned rg_fits rg_budget_cut rg_deferred rg_resumed rg_first_fit_exposure rg_first_view_exposure_max rg_k2plus_splits rg_selected_cost"
regionMetrics :: RegionSearch -> [(String,Int)]
regionMetrics r=[("rg_triggered",1),("rg_views_legal",length (rsViews r)),("rg_views_rejected",length (rsRejectedViews r)),("rg_trees",length (rsTrees r))
  ,("rg_splits_tried",sum [rtSplitsTried t | (_,_,t)<-rsTrees r]),("rg_splits_legal",sum [rtSplitsLegal t | (_,_,t)<-rsTrees r]),("rg_universe",rsUniverse r),("rg_goals",length (rsGoals r))
  ,("rg_executed",rsExecuted r),("rg_pruned",rsPruned r),("rg_fits",length (rsFits r)),("rg_budget_cut",if rsBudgetCut r then 1 else 0)
  ,("rg_deferred",sum (map glDeferred (rsGoals r))),("rg_resumed",sum (map glResumed (rsGoals r))),("rg_first_fit_exposure",maybe (-1) id (rsFirstFitExposure r))
  ,("rg_first_view_exposure_max",maximum (0:M.elems (rsFirstViewExposure r))),("rg_k2plus_splits",sum [v | (_,_,t)<-rsTrees r, (k,v)<-M.toList (rtKHist t), k>=2])
  ,("rg_selected_cost",case rsFits r of (p:_)->programCost p; []->0)]

regionSearchJSON :: RegionSearch -> String
regionSearchJSON r=jobj
  [("views",jarr [jobj [("view",jstr (viewText v)),("evidence",jstr e),("scene_cost",jmaybe show (lookup v (rsSceneCost r)))] | (v,e)<-rsViews r])
  ,("rejected_views",jarr [jobj [("view",jstr (viewText v)),("reason",jstr e)] | (v,e)<-rsRejectedViews r])
  ,("trees",jarr [jobj [("case_index",show k),("view",jstr (viewText v)),("tree",treeJSON t)] | (k,v,t)<-rsTrees r])
  ,("goals",jarr [jobj [("goal_id",jstr (glId g)),("view",jstr (viewText (glView g))),("layer",show (glLayer g)),("total",show (glTotal g)),("cursor",show (glCursor g)),("used",show (glUsed g)),("allocated",show (glAllocated g)),("deferred",show (glDeferred g)),("resumed",show (glResumed g)),("status",jstr (glStatus g)),("fits",show (glFits g))] | g<-rsGoals r])
  ,("exposures",jarr [jobj [("index",show (exIndex e)),("view",jstr (viewText (exView e))),("layer",show (exLayer e)),("program",jstr (programText (exProgram e))),("cost",show (programCost (exProgram e))),("outcome",jstr (exOutcome e)),("reason",jstr (exReason e)),("region_area",jmaybe show (exRegionArea e))] | e<-rsExposures r])
  ,("fits",jarr (map programJSON (rsFits r))),("executed",show (rsExecuted r)),("pruned",show (rsPruned r)),("budget_cut",jbool (rsBudgetCut r)),("universe",show (rsUniverse r))
  ,("first_view_exposure",jobj [(v,show i) | (v,i)<-M.toList (rsFirstViewExposure r)]),("first_fit_exposure",jmaybe show (rsFirstFitExposure r))
  ,("dependency_witnesses",jarr [jobj [("skeleton",jstr (dwSkeleton d)),("scope",jstr (dwScope d)),("dims_preserved",jbool (dwDimsPreserved d))
      ,("changed_regions",jarr [jobj [("case_index",show k),("view",jstr (viewText v)),("regions",show rs)] | (k,v,rs)<-dwChangedRegions d])
      ,("pruned",jarr [jobj [("program",jstr (programText (pcProgram x))),("reason",jstr (pcReason x)),("evidence",jstr (pcEvidence x))] | x<-dwPruned d]),("pruned_count",show (length (dwPruned d))),("kept_executed",show (dwKept d)),("note",jstr (dwNote d))] | d<-rsDependency r])
  ,("metrics",jobj [(k,show v) | (k,v)<-regionMetrics r])]
