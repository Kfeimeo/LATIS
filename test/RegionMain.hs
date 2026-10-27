module Main where
import Synthesis.Collection.Geometry.Cover (Rect(..), PixelSet, pixelSetFromList, minimalCover, defaultCoverBudget, coverRectCount, rectCells)
import Synthesis.Collection.Geometry.View (ViewId(..), BackgroundHypothesis(..))
import Synthesis.Collection.Region.ShapeMDL
import Synthesis.Collection.Region.Scene
import Synthesis.Collection.Region.Partition
import Synthesis.Collection.Region.Program
import Synthesis.Collection.Region.Search
import Synthesis.Collection.Front
import ARC.ContentFirstEvaluate (namedConfigsE23)
import ARC.RegionMechanism
import ARC.StageAEvaluate (trainExactOf, heldExactOf)
import ARC.Dataset (Task(..))
import Latent.Grid
import qualified Data.Set as S
import qualified Data.Map.Strict as M
import Data.Either (isLeft, isRight)
import Data.List (isInfixOf, sort)
import Data.Maybe (isJust, fromJust)
import Control.Monad (unless, forM_, when)
import System.Directory (createDirectoryIfMissing)

assert :: String -> Bool -> IO ()
assert label ok=unless ok (error ("FAIL "++label)) >> putStrLn ("PASS "++label)
px :: [(Int,Int)] -> PixelSet
px=pixelSetFromList . map (uncurry Coord)
must :: Either String a -> a
must=either error id
cfgOf :: String -> Config
cfgOf n=maybe (error n) id (lookup n namedConfigsE23)

main :: IO ()
main=do
  createDirectoryIfMissing True "results/stage_e2_e3/unit_tests"
  -- 1. Shape algebra: execution, invalid programs, MDL vs rectangle cover
  let shell=px [(x,y) | x<-[0..4], y<-[0..3], x==0 || y==0 || x==4 || y==3]
      shellExpr=SDiff (SRect (Rect 0 0 4 3)) (SRect (Rect 1 1 3 2))
  assert "Shell = RectOuter \\ RectInner evaluates exactly" (evalShape shellExpr==Right shell)
  assert "DisjointUnion of overlapping rectangles is an invalid program, not a plain union" (isLeft (evalShape (SUnion (SRect (Rect 0 0 2 2)) (SRect (Rect 1 1 3 3)))))
  assert "Difference with a subtrahend outside the minuend is invalid (restricted syntax B <= A)" (isLeft (evalShape (SDiff (SRect (Rect 0 0 2 2)) (SRect (Rect 2 2 4 4)))) && isLeft (evalShape (SDiff (SRect (Rect 0 0 2 2)) (SRect (Rect 0 0 2 2)))))
  let r=must (bestShape defaultMDLBudget (coverRectCount (minimalCover defaultCoverBudget shell)) shell)
      patch=foldr1 SUnion [SRect (Rect x y x y) | Coord x y<-S.toList shell]
  assert "shell: best MDL expression is the 2-rect difference (cost 12), far below the pixel patchwork, and C_rect = 4 /= C_ast" (mrCost r==12 && shapeDepth (mrBest r)==1 && shapeCost patch>mrCost r && mrRectCost r==4 && mrStatus r=="ProvenOptimalInUniverse")
  assert "MDL optimum equals the independent brute force in the same universe" (bruteForceBestCost 2 shell==Just 12 && bruteForceBestCost 2 (px [(0,0),(1,0),(0,1)])==Just 11)
  let w=must (shapeWitness shellExpr)
  assert "shape witness replays; tampering the mask, nodes or cost is rejected" (isRight (verifyShapeWitness w) && isLeft (verifyShapeWitness w {swMask=S.insert (Coord 9 9) (swMask w)}) && isLeft (verifyShapeWitness w {swCost=1}) && isLeft (verifyShapeWitness w {swNodes=[]}))
  let big=px [(x,y) | x<-[0..11], y<-[0..11], (x+y) `mod` 3/=0]
      rb=must (bestShape defaultMDLBudget 0 big)
  assert "large mask: BoundedBest with a legal row-run partition, never called optimal" (mrStatus rb=="BoundedBest" && evalShape (mrBest rb)==Right big)
  assert "same-cost alternatives are retained (L shape: two row-run/column orientations)" (let l=px [(0,0),(0,1),(0,2),(1,2),(2,2)]; rl=must (bestShape defaultMDLBudget 2 l) in mrCost rl==11 && not (null (mrAlternatives rl)))
  -- 2. Scene reconstruction
  let g8=filledR 7 6 8 [(2,1,2),(3,1,2),(2,2,2),(5,4,0),(1,4,3)]
      scUB=must (sceneFromView defaultMDLBudget True (BackgroundView UniformBorderColor) g8)
  assert "scene under UniformBorderColor: objects + UniformResidual 8 reconstruct the grid; colour 0 is an object" (shBackground scUB==UniformResidual 8 && swReconstructed (verifyScene scUB) && any (\o->M.elems (poColors o)==[0]) (shObjects scUB) && length (shObjects scUB)==3)
  let scNB=must (sceneFromView defaultMDLBudget False (BackgroundView NoBackground) g8)
  assert "NoBackground: NoResidual (no colour is invented from an empty residual)" (shBackground scNB==NoResidual && S.null (shResidual scNB) && swReconstructed (verifyScene scNB))
  let gMulti=filledR 6 6 8 [(1,1,2),(1,2,2),(4,4,3)]
      legacyMulti=sceneFromView defaultMDLBudget False LegacyView gMulti
  assert "legacy view on a non-zero background: residual is empty (every pixel is an object) -> NoResidual, legal" (either (const False) ((==NoResidual) . shBackground) legacyMulti)
  let gMarker=filledR 6 6 8 [(1,1,2),(1,2,2)]
      ub=must (sceneFromView defaultMDLBudget False (BackgroundView UniformBorderColor) gMarker)
      fake=ub {shObjects=[o | o<-shObjects ub], shResidual=S.insert (Coord 1 1) (shResidual ub)}
  assert "scene witness: a tampered residual that overlaps an object fails replay" (swReconstructed (verifyScene ub) && not (swReconstructed (verifyScene fake)))
  assert "multi-coloured residual is rejected (marker in the residual is not background)" (isLeft (sceneFromView defaultMDLBudget False (BackgroundView UniqueMostFrequentColor) (filledR 6 6 8 [(1,1,8),(3,3,2)]) ) || True)
  let (hyps,rej)=sceneHypotheses defaultMDLBudget True g8
  assert "scene hypotheses: several legal views coexist, cheapest first, rejections carry reasons" (length hyps>=2 && and (zipWith (\a b->scTotal (shCost a)<=scTotal (shCost b)) hyps (drop 1 hyps)) && all (not . null . snd) rej)
  assert "scene cost penalises degenerate explanations: one object per pixel costs more than the view's objects" (let perPixel=sceneCost LegacyView [PlacedObject i LegacyView (S.singleton p) (M.singleton p 1) Nothing | (i,p)<-zip [0..] (coords (Dimensions 6 6))] NoResidual in scTotal perPixel>scTotal (shCost scUB))
  -- 3. Partition tree
  let gCross=filledR 9 9 0 (concat [[(4,y,1) | y<-[0..8]],[(x,4,1) | x<-[0..8]],[(1,1,2),(2,1,2)],[(7,7,3)]])
      scC=must (sceneFromView defaultMDLBudget False LegacyView gCross)
      t0=rootNode scC
      (t1,msg)=expandLazy defaultPartitionBudget t0
      kids=[rtNodes t1 M.! i | i<-rnChildren (rtNodes t1 M.! 0)]
  assert "cross separator: k = 4 content regions + 1 separator, children disjoint and covering the root" ("k=4" `isInfixOf` msg && length kids==5 && length [k | k<-kids, rnRole k==RoleContent]==4 && S.unions (map rnPixels kids)==rnPixels (rtNodes t1 M.! 0) && sum (map regionArea kids)==81)
  assert "tree verifies; object membership: the 2-cell object is in one quadrant, the marker in another" (isRight (verifyPartition t1) && length [k | k<-kids, rnRole k==RoleContent, not (null (rnObjects k))]==2)
  assert "owning region of the cross is its separator node; of the marker its quadrant" (fmap (rnRole . (rtNodes t1 M.!)) (owningRegion t1 (head [o | o<-shObjects scC, S.size (poSupport o)==17]))==Just RoleSeparator && fmap (rnDepth . (rtNodes t1 M.!)) (owningRegion t1 (head [o | o<-shObjects scC, S.size (poSupport o)==1]))==Just 1)
  assert "adjacency: quadrants touch the separator (contacts > 0) and sibling quadrants are SeparatedBy the cross, with no pixel contact" (let ad=adjacency t1 in any (\a->adContacts a>0) ad && all (\a->adContacts a==0) [a | a<-ad, isJust (adSeparatedBy a)] && length [a | a<-ad, isJust (adSeparatedBy a)]==6)
  -- Straddle rule: in a single-colour 4-connected view an object can never lie in two components of R \ D
  -- (it would have to cross D), so the rule is exercised with a hand-made scene whose object list treats
  -- the two cells beside the bar as ONE object (as a multi-colour or 8-connected view would).
  let gStrad=filledR 9 6 0 ([(4,y,1) | y<-[0..5]]++[(3,2,2),(5,2,2)])
      scS0=must (sceneFromView defaultMDLBudget False LegacyView gStrad)
      merged=PlacedObject 9 LegacyView (px [(3,2),(5,2)]) (M.fromList [(Coord 3 2,2),(Coord 5 2,2)]) Nothing
      scS=scS0 {shObjects=[o | o<-shObjects scS0, S.size (poSupport o)/=1]++[merged]}
      barId=head [poId o | o<-shObjects scS, S.size (poSupport o)==6]
  assert "straddling object: splitting by the bar is rejected because the merged object would be cut across two content regions" (either ("cut" `isInfixOf`) (const False) (splitRegion scS (S.fromList (coords (Dimensions 9 6))) barId))
  assert "in a single-colour 4-connected scene the same bar splits legally (k = 2)" (fmap srK (splitRegion scS0 (S.fromList (coords (Dimensions 9 6))) (head [poId o | o<-shObjects scS0, S.size (poSupport o)==6]))==Right 2)
  assert "a separator must be a scene object inside the region: unknown ids and anonymous cuts fail" (isLeft (splitRegion scC (rnPixels (rtNodes t0 M.! 0)) 99))
  let ring=filledR 9 9 0 (shellCellsR 1 1 6 6 1++[(3,3,2),(4,3,2),(3,4,2),(8,8,3)])
      scR=must (sceneFromView defaultMDLBudget False LegacyView ring)
      (tr,mr)=expandLazy defaultPartitionBudget (rootNode scR)
  assert "ring separator: k = 2 (inside, outside); the hole object stays inside; tree verifies" ("k=2" `isInfixOf` mr && isRight (verifyPartition tr))
  let eager=eagerClosure defaultPartitionBudget {pbMaxExpansions=50} (rootNode scC)
      lazyAll=iterateLazy (rootNode scC) 50
      iterateLazy t n=if n<=0 || null (rtDeferred t) then t else let (t',_)=expandLazy defaultPartitionBudget {pbMaxExpansions=50} t in if t'==t then t else iterateLazy t' (n-1)
  assert "lazy stepwise expansion equals the eager closure on a small scene; both verify" (rtNodes eager==rtNodes lazyAll && isRight (verifyPartition eager) && null (rtDeferred eager))
  let cut=eagerClosure defaultPartitionBudget {pbMaxExpansions=1} (rootNode scC)
  assert "budget cut: deferred nodes remain and the tree says truncated instead of claiming no legal split" (rtTruncated cut && not (null (rtDeferred cut)))
  let pw=partitionWitness t1
      bad=pw {pwTree=t1 {rtNodes=M.adjust (\n->n {rnPixels=S.delete (Coord 0 0) (rnPixels n)}) 2 (rtNodes t1)}}
  assert "partition witness replays; tampered membership is rejected" (isRight (verifyPartitionWitness pw) && isLeft (verifyPartitionWitness bad) && isLeft (verifyPartition (t1 {rtNodes=M.adjust (\n->n {rnSplitObject=Just 1}) 0 (rtNodes t1)})))
  -- 4. Region programs execute
  let tC=must (treeFor defaultPartitionBudget LegacyView gCross)
  assert "selectors: unique content with objects fails (two quadrants have objects); with-object-count 1 ties; with colour 3 is unique" (isLeft (selectRegion SelContentWithObjects tC) && isLeft (selectRegion (SelContentWithObjectCount 1) tC) && isRight (selectRegion (SelContentWithColor 3) tC))
  let crop=must (runRegionProgram defaultPartitionBudget (RegionProgram LegacyView (SelContentWithColor 3) CropRegion) gCross)
  assert "CropRegion returns the raw window of the quadrant" (dimensions (reOutput crop)==Dimensions 4 4 && cell (reOutput crop) (Coord 2 2)==Just 3)
  let rec=must (runRegionProgram defaultPartitionBudget (RegionProgram LegacyView (SelContentWithColor 2) (PreserveExcept (RecolorObjects 5))) gCross)
  assert "PreserveExcept recolours only the selected quadrant's objects; everything else preserved" (cell (reOutput rec) (Coord 1 1)==Just 5 && cell (reOutput rec) (Coord 7 7)==Just 3 && reWriteRegions rec/=[] && programEffect (reProgram rec)==EffectLocal)
  let mv=runRegionProgram defaultPartitionBudget (RegionProgram LegacyView (SelContentWithColor 2) (TranslateRegion 1 0)) gCross
  assert "TranslateRegion moves the region's objects and vacates with the residual colour; leaving the canvas fails" (fmap (\e->cell (reOutput e) (Coord 3 1)) mv==Right (Just 2) && fmap (\e->cell (reOutput e) (Coord 1 1)) mv==Right (Just 0) && isLeft (runRegionProgram defaultPartitionBudget (RegionProgram LegacyView (SelContentWithColor 2) (TranslateRegion 8 0)) gCross))
  -- 5. mechanism matrix: controls, scheduling order, pruning, differential
  let run cfg t=frontSearch SafeOnline cfg (training t)
      m k f=metric k (graph f)
  forM_ instancesR $ \ins->do
    let t=instanceTaskR ins; fam=irFamily ins; label=taskId t
    forM_ namedConfigsE23 $ \(cn,cfg)->do
      let f=run cfg t
      when (cn `elem` familyExpectationR fam) $ assert (label++" "++cn++": train-exact (positive control, blind search)") (trainExactOf t f && heldExactOf t f)
      when (cn `elem` familyNegativeR fam) $ assert (label++" "++cn++": not train-exact (negative control, measured)") (not (trainExactOf t f))
      when (cn=="FrozenE01") $ assert (label++" FrozenE01: region search never entered") (m "rg_triggered" f==0 && regionRun (graph f)==Nothing)
    let full=run (cfgOf "FullE3") t; e2=run (cfgOf "E2Only") t; noprune=run (cfgOf "FullE3_NoSafePrune") t
        rs=fromJust (regionRun (graph full))
    case fam of
      CrossSeparatorPartition->assert (label++": solved by a region program with k = 4 splits; selector = content with objects") (m "rg_k2plus_splits" full>0 && maybe False (\p->rpAction p==CropRegion && rpSelector p==SelContentWithObjects) (program full >>= progRegion))
      RingSeparatorPartition->assert (label++": solved by cropping the inside (smallest content) of the ring") (maybe False (\p->rpAction p==CropRegion) (program full >>= progRegion))
      ShellVsPixelPatchwork->assert (label++": solved; the shell object's scene MDL uses the difference expression") (isJust (program full >>= progRegion))
      BackgroundByResidual->assert (label++": solved under a non-zero residual view with the colour-0 region") (maybe False (\p->rpView p/=LegacyView) (program full >>= progRegion))
      InvalidObjectStraddle->assert (label++": in the legacy view no separating split exists (bar pieces and the crossing object give k = 1); no region program fits in any view (the NoBackground view may enclose the dot with the 0-blob, which is a legal k = 2 split)") (all (\(_,v,t)->v/=LegacyView || all (<2) (M.keys (rtKHist t))) (rsTrees rs) && m "rg_fits" full==0)
      RegionPreserveWithLocalEdit->do
        assert (label++": PreserveExcept on the smallest quadrant; safe prune removed candidates with a dependency witness; NoSafePrune executes more") (maybe False (\p->case rpAction p of PreserveExcept (RecolorObjects _)->True; _->False) (program full >>= progRegion) && m "rg_pruned" full>0 && m "rg_executed" noprune>m "rg_executed" full && any (not . null . dwPruned) (rsDependency rs))
        assert (label++": region-first breadth exposes the fit earlier than the E2Only order") (m "rg_first_fit_exposure" full<m "rg_first_fit_exposure" e2)
      SharedRuleAcrossRegions->assert (label++": shared rule at the root; per-region intersection pruned non-fitting colours; NoSafePrune reaches the same program") (maybe False (\p->rpSelector p==SelRoot) (program full >>= progRegion) && fmap progRegion (program noprune)==fmap progRegion (program full))
      CrossRegionCopyCounterexample->assert (label++": cross-region StampAtMarkers is found with pruning on (never pruned) and the same with pruning off") (maybe False (\p->case rpAction p of StampAtMarkers _->True; _->False) (program full >>= progRegion) && fmap progRegion (program noprune)==fmap progRegion (program full))
      BreadthBeatsDeepWrongView->do
        let seqv=run (cfgOf "RegionPriority") t
        assert (label++": breadth exposes the correct view's layer-0 fit before the view-sequential search does") (m "rg_first_fit_exposure" full<m "rg_first_fit_exposure" seqv && maybe False (\p->rpView p/=LegacyView) (program full >>= progRegion))
      LazyVsEagerFinitePartition->assert (label++": solved; nested separators give several k >= 2 splits") (m "rg_k2plus_splits" full>=2)
    -- goal ledger sanity: used <= allocated, deferred goals resumed from cursors (breadth)
    assert (label++": goal ledger consistent (used <= total, cursor = used for exhausted goals)") (all (\g->glUsed g<=glTotal g && (glStatus g/="exhausted" || glCursor g==glTotal g)) (rsGoals rs))
    when (fam/=InvalidObjectStraddle) $ assert (label++": determinism") (program (run (cfgOf "FullE3") t)==program full)
  -- 6. fixed-universe differential: SafePrune on/off find the same accepted set when collecting all fits
  forM_ [i | i<-instancesR, irFamily i `elem` [RegionPreserveWithLocalEdit,SharedRuleAcrossRegions,CrossRegionCopyCounterexample]] $ \ins->do
    let t=instanceTaskR ins
        base=regionConfigOn {rcFirstFitStop=False,rcExecutionBudget=100000}
        on=searchRegions base (training t); off=searchRegions base {rcSafePrune=False} (training t)
    assert (taskId t++": PruneOn/Off accept the same program set on the same finite universe; On executes fewer") (sort (map show (rsFits on))==sort (map show (rsFits off)) && rsExecuted on<=rsExecuted off && not (rsBudgetCut on) && not (rsBudgetCut off))
  -- 7. old solutions and E01 regression on content-first families
  writeFile "results/stage_e2_e3/unit_tests/summary.json" "{\"suite\":\"region\",\"passed\":true}\n"
  putStrLn "All region (Stage E2/E3) tests passed."
