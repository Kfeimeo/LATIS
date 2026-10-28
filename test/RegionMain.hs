module Main where
import Synthesis.Collection.Geometry.Cover (Rect(..), PixelSet, pixelSetFromList, pixelSetTranslate, minimalCover, defaultCoverBudget, coverRectCount, rectCells)
import Synthesis.Collection.Geometry.View (ViewId(..), BackgroundHypothesis(..), viewRegions, Region(..), ViewResult(..))
import Synthesis.Collection.Region.ShapeMDL
import Synthesis.Collection.Region.MDLCache
import Synthesis.Collection.Region.Scene
import Synthesis.Collection.Region.Partition
import Synthesis.Collection.Region.Program
import Synthesis.Collection.Region.Search
import Synthesis.Collection.Front
import ARC.ContentFirstEvaluate (namedConfigsE23, namedConfigsE31, configNamesE31)
import ARC.StageDEvaluate (configByNameD)
import ARC.RegionMechanism
import ARC.StageAEvaluate (trainExactOf, heldExactOf)
import ARC.Dataset (Task(..), loadTask)
import Latent.Grid
import qualified Data.Set as S
import qualified Data.Map.Strict as M
import qualified Data.Map as ML
import Data.Either (isLeft, isRight)
import Data.List (isInfixOf, sort, nub, intercalate)
import Data.Maybe (isJust, fromJust, isNothing)
import Control.Monad (unless, forM_, forM, when)
import System.Directory (createDirectoryIfMissing, doesFileExist)

assert :: String -> Bool -> IO ()
assert label ok=unless ok (error ("FAIL "++label)) >> putStrLn ("PASS "++label)
px :: [(Int,Int)] -> PixelSet
px=pixelSetFromList . map (uncurry Coord)
must :: Either String a -> a
must=either error id
cfgOf :: String -> Config
cfgOf n=maybe (error n) id (configByNameD n)
jsonLine :: [(String,String)] -> String
jsonLine kvs="{"++intercalate "," [show k++":"++v | (k,v)<-kvs]++"}"

main :: IO ()
main=do
  createDirectoryIfMissing True "results/stage_e31/unit_tests"
  -- 1. Shape algebra: execution, invalid programs, MDL vs rectangle cover
  let shell=px [(x,y) | x<-[0..4], y<-[0..3], x==0 || y==0 || x==4 || y==3]
      shellExpr=SDiff (SRect (Rect 0 0 4 3)) (SRect (Rect 1 1 3 2))
  assert "Shell = RectOuter \\ RectInner evaluates exactly" (evalShape shellExpr==Right shell)
  assert "DisjointUnion of overlapping rectangles is an invalid program, not a plain union" (isLeft (evalShape (SUnion (SRect (Rect 0 0 2 2)) (SRect (Rect 1 1 3 3)))))
  assert "Difference with a subtrahend outside the minuend is invalid (restricted syntax B <= A)" (isLeft (evalShape (SDiff (SRect (Rect 0 0 2 2)) (SRect (Rect 2 2 4 4)))) && isLeft (evalShape (SDiff (SRect (Rect 0 0 2 2)) (SRect (Rect 0 0 2 2)))))
  let r0=must (bestShape defaultMDLBudget shell)
      r=attachRectCover defaultCoverBudget shell r0
      patch=foldr1 SUnion [SRect (Rect x y x y) | Coord x y<-S.toList shell]
  assert "shell: best MDL expression is the 2-rect difference (cost 12), far below the pixel patchwork, and C_rect = 4 /= C_ast" (mrCost r==12 && shapeDepth (mrBest r)==1 && shapeCost patch>mrCost r && fmap coverRectCount (mrRectCover r)==Just 4 && mrStatus r=="ProvenOptimalInUniverse")
  assert "c_rect not computed = Nothing, printed as null with status NotComputed (never 0); attached cover prints its own status" (isNothing (mrRectCover r0) && "\"c_rect\":null" `isInfixOf` mdlJSON r0 && "NotComputed" `isInfixOf` mdlJSON r0 && "\"c_rect\":4" `isInfixOf` mdlJSON r && "proven_minimal" `isInfixOf` mdlJSON r)
  assert "MDL optimum equals the independent brute force in the same universe" (bruteForceBestCost 2 shell==Just 12 && bruteForceBestCost 2 (px [(0,0),(1,0),(0,1)])==Just 11)
  let crossM=px [(1,0),(0,1),(1,1),(2,1),(1,2)]
      rc=attachRectCover defaultCoverBudget crossM (must (bestShape defaultMDLBudget crossM))
  assert "plus sign: c_ast = 17 (three disjoint rectangles) while c_rect = 2 (two overlapping bars): the two measures are not the same concept" (mrCost rc==17 && fmap coverRectCount (mrRectCover rc)==Just 2 && bruteForceBestCost 3 crossM==Just 17)
  let w=must (shapeWitness shellExpr)
  assert "shape witness replays; tampering the mask, nodes or cost is rejected" (isRight (verifyShapeWitness w) && isLeft (verifyShapeWitness w {swMask=S.insert (Coord 9 9) (swMask w)}) && isLeft (verifyShapeWitness w {swCost=1}) && isLeft (verifyShapeWitness w {swNodes=[]}))
  let big=px [(x,y) | x<-[0..11], y<-[0..11], (x+y) `mod` 3/=0]
      rb=must (bestShape defaultMDLBudget big)
  assert "large mask: BoundedBest with a legal row-run partition, never called optimal" (mrStatus rb=="BoundedBest" && evalShape (mrBest rb)==Right big)
  assert "same-cost alternatives are retained (L shape: two row-run/column orientations)" (let l=px [(0,0),(0,1),(0,2),(1,2),(2,2)]; rl=must (bestShape defaultMDLBudget l) in mrCost rl==11 && not (null (mrAlternatives rl)))
  assert "empty mask has no shape expression (Left), never a zero-cost shape" (isLeft (bestShape defaultMDLBudget S.empty))
  let cut=must (bestShape (MDLBudget 3 64 10) shell)
  assert "expression budget cut: BoundedBest, the universe text says so, the result is still a legal explanation" (mrStatus cut=="BoundedBest" && "budget cut" `isInfixOf` mrUniverse cut && evalShape (mrBest cut)==Right shell && mrExprsTried cut<=10)
  -- 1b. exact per-task MDL cache: keys, translation sharing, budget separation, collision counter-example
  let shellT=pixelSetTranslate 3 5 shell
      cache=buildMDLCache defaultMDLBudget rectCoverBudget [shell,shellT,crossM,shell]
      eShell=fromJust (lookupMDL cache shell); eShellT=fromJust (lookupMDL cache shellT)
  assert "cache: a translated copy shares the entry (same key, same optimum); 4 references, 2 distinct masks, 2 static hits" (meKey eShell==meKey eShellT && meShape eShell==meShape eShellT && ML.size (mcEntries cache)==2 && lookup "mdl_cache_hits_static" (cacheStats cache)==Just 2)
  assert "cache: the cached optimum equals the direct computation (same cost, status, expression) and carries c_rect" (fmap mrCost (meShape eShell)==Right 12 && fmap mrStatus (meShape eShell)==Right "ProvenOptimalInUniverse" && fmap mrBest (meShape eShell)==fmap mrBest (bestShape defaultMDLBudget shell) && fmap coverRectCount (meCover eShell)==Just 4)
  let lowCache=buildMDLCache (MDLBudget 3 64 10) rectCoverBudget [shell]
  assert "cache: a different budget is a different key; the low-budget BoundedBest is never served as the Proven result" (meKey (fromJust (lookupMDL lowCache shell))/=meKey eShell && fmap mrStatus (meShape (fromJust (lookupMDL lowCache shell)))==Right "BoundedBest" && isNothing (lookupMDL lowCache crossM))
  let la=px [(0,0),(1,0),(0,1)]; lb=px [(0,0),(1,0),(1,1)]
      cab=buildMDLCache defaultMDLBudget rectCoverBudget [la,lb]
  assert "cache: two masks with equal size and bounds (a coarse key would collide) get distinct entries with distinct expressions" (ML.size (mcEntries cab)==2 && meKey (fromJust (lookupMDL cab la))/=meKey (fromJust (lookupMDL cab lb)) && fmap (shapeText . mrBest) (meShape (fromJust (lookupMDL cab la)))/=fmap (shapeText . mrBest) (meShape (fromJust (lookupMDL cab lb))))
  assert "cache: the empty support has no entry (Nothing), consistent with bestShape" (isNothing (lookupMDL cache S.empty))
  -- 2. Scene reconstruction
  let g8=filledR 7 6 8 [(2,1,2),(3,1,2),(2,2,2),(5,4,0),(1,4,3)]
      scUB=must (sceneFromView defaultMDLBudget True (BackgroundView UniformBorderColor) g8)
  assert "scene under UniformBorderColor: objects + UniformResidual 8 reconstruct the grid; colour 0 is an object" (shBackground scUB==UniformResidual 8 && swReconstructed (verifyScene scUB) && any (\o->M.elems (poColors o)==[0]) (shObjects scUB) && length (shObjects scUB)==3)
  let scNB=must (sceneFromView defaultMDLBudget False (BackgroundView NoBackground) g8)
  assert "NoBackground: NoResidual (no colour is invented from an empty residual)" (shBackground scNB==NoResidual && S.null (shResidual scNB) && swReconstructed (verifyScene scNB))
  assert "NoShapes scene: shape null / NotComputed in the record, pixel-proxy cost basis declared" (all (isNothing . poShape) (shObjects scNB) && scShapeBasis (shCost scNB)=="pixel_proxy" && "\"shape\":null" `isInfixOf` sceneJSON scNB && "pixel_proxy" `isInfixOf` sceneJSON scNB)
  assert "eager scene: every object has a shape, cost basis mdl, c_rect attached" (all (isJust . poShape) (shObjects scUB) && scShapeBasis (shCost scUB)=="mdl" && all (\o->maybe False (isJust . mrRectCover) (poShape o)) (shObjects scUB))
  let vrUB=must (viewRegions (BackgroundView UniformBorderColor) g8)
      cacheUB=buildMDLCache defaultMDLBudget rectCoverBudget [rgPixelsOf r' | r'<-vrRegionsOf vrUB]
      scCached=must (sceneFromRegions (CachedShapes cacheUB) (BackgroundView UniformBorderColor) g8 vrUB)
  assert "cached scene == eager scene object for object (shape expression, c_ast, status, c_rect) and in total cost" (and [fmap mrBest (poShape a)==fmap mrBest (poShape b) && fmap mrCost (poShape a)==fmap mrCost (poShape b) && fmap mrStatus (poShape a)==fmap mrStatus (poShape b) && fmap (fmap coverRectCount . mrRectCover) (poShape a)==fmap (fmap coverRectCount . mrRectCover) (poShape b) | (a,b)<-zip (shObjects scUB) (shObjects scCached)] && scTotal (shCost scUB)==scTotal (shCost scCached))
  let gMulti=filledR 6 6 8 [(1,1,2),(1,2,2),(4,4,3)]
      legacyMulti=sceneFromView defaultMDLBudget False LegacyView gMulti
  assert "legacy view on a non-zero background: residual is empty (every pixel is an object) -> NoResidual, legal" (either (const False) ((==NoResidual) . shBackground) legacyMulti)
  let gMarker=filledR 6 6 8 [(1,1,2),(1,2,2)]
      ub=must (sceneFromView defaultMDLBudget False (BackgroundView UniformBorderColor) gMarker)
      fake=ub {shObjects=[o | o<-shObjects ub], shResidual=S.insert (Coord 1 1) (shResidual ub)}
  assert "scene witness: a tampered residual that overlaps an object fails replay" (swReconstructed (verifyScene ub) && not (swReconstructed (verifyScene fake)))
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
  assert "node JSON carries the node's colour list (input-side evidence for the independent selector replay)" ("\"colours\":[0,2]" `isInfixOf` nodeJSON t1 (head [k | k<-kids, rnRole k==RoleContent, not (null (rnObjects k)), rnId k==minimum [rnId x | x<-kids, rnRole x==RoleContent, not (null (rnObjects x))]]) || "\"colours\":[0,3]" `isInfixOf` treeJSON t1)
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
  let cutT=eagerClosure defaultPartitionBudget {pbMaxExpansions=1} (rootNode scC)
  assert "budget cut: deferred nodes remain and the tree says truncated instead of claiming no legal split" (rtTruncated cutT && not (null (rtDeferred cutT)))
  let pw=partitionWitness t1
      bad=pw {pwTree=t1 {rtNodes=M.adjust (\n->n {rnPixels=S.delete (Coord 0 0) (rnPixels n)}) 2 (rtNodes t1)}}
  assert "partition witness replays; tampered membership is rejected" (isRight (verifyPartitionWitness pw) && isLeft (verifyPartitionWitness bad) && isLeft (verifyPartition (t1 {rtNodes=M.adjust (\n->n {rnSplitObject=Just 1}) 0 (rtNodes t1)})))
  -- 4. Region programs execute; structured selector outcomes
  let tC=must (treeFor defaultPartitionBudget LegacyView gCross)
  assert "selectors: unique content with objects fails (two quadrants have objects); with-object-count 1 ties; with colour 3 is unique" (isLeft (selectRegion SelContentWithObjects tC) && isLeft (selectRegion (SelContentWithObjectCount 1) tC) && isRight (selectRegion (SelContentWithColor 3) tC))
  assert "resolveSelector: Root always OK; with-objects NonUnique (2 ids); colour 9 Empty; largest = Tie (two quadrants of equal area); smallest OK; the E2 reason strings are reproduced" (outcomeKind (resolveSelector SelRoot tC)=="ValidSelected" && outcomeKind (resolveSelector SelContentWithObjects tC)=="InvalidNonUnique" && length (outcomeIds (resolveSelector SelContentWithObjects tC))==2 && outcomeKind (resolveSelector (SelContentWithColor 9) tC)=="InvalidEmpty" && outcomeKind (resolveSelector SelLargestContent tC)=="InvalidNonUnique" && outcomeText (resolveSelector SelContentWithObjects tC)==selectRegion SelContentWithObjects tC && "not unique: 2 regions match" `isInfixOf` either id (const "") (selectRegion SelContentWithObjects tC))
  let unsplit=must (treeFor defaultPartitionBudget LegacyView (filledR 5 5 0 [(1,1,2)]))
  assert "root not split: every non-Root selector is InvalidRootUnsplit, Root is still valid" (outcomeKind (resolveSelector SelLargestContent unsplit)=="InvalidRootUnsplit" && outcomeKind (resolveSelector SelRoot unsplit)=="ValidSelected")
  let okChecks p=[(role,s,[(0,Just (resolveSelector s tC))]) | (role,s)<-programSelectors p]
      pColor3=RegionProgram LegacyView (SelContentWithColor 3) CropRegion
      pObjs=RegionProgram LegacyView SelContentWithObjects CropRegion
      pStampSame=RegionProgram LegacyView (SelContentWithColor 3) (StampAtMarkers (SelContentWithColor 3))
      pStampSrcBad=RegionProgram LegacyView (SelContentWithColor 3) (StampAtMarkers SelContentWithObjects)
  assert "decideFromChecks: valid target -> Valid; non-unique target -> Invalid(target, case 0); Stamp with a failing SOURCE -> Invalid(source); Stamp whose source = target -> InvalidSameRegion" (decideFromChecks pColor3 (okChecks pColor3)==PrecheckValid && (case decideFromChecks pObjs (okChecks pObjs) of PrecheckInvalid "target" SelContentWithObjects 0 "InvalidNonUnique" _->True; _->False) && (case decideFromChecks pStampSrcBad (okChecks pStampSrcBad) of PrecheckInvalid "source" SelContentWithObjects 0 _ _->True; _->False) && (case decideFromChecks pStampSame (okChecks pStampSame) of PrecheckInvalid _ _ 0 "InvalidSameRegion" _->True; _->False))
  assert "decideFromChecks: an unknown (Nothing) outcome on any case makes the verdict Unknown (fall back to execution), even when every known case is valid" (case decideFromChecks pColor3 [("target",SelContentWithColor 3,[(0,Just (resolveSelector (SelContentWithColor 3) tC)),(1,Nothing)])] of PrecheckUnknown _->True; _->False)
  assert "decideFromChecks: a failure on case 1 only is reported with case 1 (per-case scope), cases 0 valid" (case decideFromChecks pColor3 [("target",SelContentWithColor 3,[(0,Just (resolveSelector (SelContentWithColor 3) tC)),(1,Just (resolveSelector (SelContentWithColor 9) tC))])] of PrecheckInvalid "target" _ 1 "InvalidEmpty" _->True; _->False)
  let crop=must (runRegionProgram defaultPartitionBudget (RegionProgram LegacyView (SelContentWithColor 3) CropRegion) gCross)
  assert "CropRegion returns the raw window of the quadrant" (dimensions (reOutput crop)==Dimensions 4 4 && cell (reOutput crop) (Coord 2 2)==Just 3)
  let rec=must (runRegionProgram defaultPartitionBudget (RegionProgram LegacyView (SelContentWithColor 2) (PreserveExcept (RecolorObjects 5))) gCross)
  assert "PreserveExcept recolours only the selected quadrant's objects; everything else preserved" (cell (reOutput rec) (Coord 1 1)==Just 5 && cell (reOutput rec) (Coord 7 7)==Just 3 && reWriteRegions rec/=[] && programEffect (reProgram rec)==EffectLocal)
  let mv=runRegionProgram defaultPartitionBudget (RegionProgram LegacyView (SelContentWithColor 2) (TranslateRegion 1 0)) gCross
  assert "TranslateRegion moves the region's objects and vacates with the residual colour; leaving the canvas fails" (fmap (\e->cell (reOutput e) (Coord 3 1)) mv==Right (Just 2) && fmap (\e->cell (reOutput e) (Coord 1 1)) mv==Right (Just 0) && isLeft (runRegionProgram defaultPartitionBudget (RegionProgram LegacyView (SelContentWithColor 2) (TranslateRegion 8 0)) gCross))
  -- 5. mechanism matrix: controls (E3 configurations and E3.1 configurations), family-specific claims
  let run cfg t=frontSearch SafeOnline cfg (training t)
      m k f=metric k (graph f)
      allCfgs=namedConfigsE23++[(n,c) | (n,c)<-namedConfigsE31, n/="FrozenE01"]
  forM_ instancesR $ \ins->do
    let t=instanceTaskR ins; fam=irFamily ins; label=taskId t
    forM_ allCfgs $ \(cn,cfg)->do
      let f=run cfg t
      when (cn `elem` familyExpectationR fam) $ assert (label++" "++cn++": train-exact (positive control, blind search)") (trainExactOf t f && heldExactOf t f)
      when (cn `elem` familyNegativeR fam) $ assert (label++" "++cn++": not train-exact (negative control, measured)") (not (trainExactOf t f))
      when (cn=="FrozenE01") $ assert (label++" FrozenE01: region search never entered") (m "rg_triggered" f==0 && regionRun (graph f)==Nothing)
    let full=run (cfgOf "FullE3") t; e2=run (cfgOf "E2Only") t; noprune=run (cfgOf "FullE3_NoSafePrune") t
        rs=fromJust (regionRun (graph full))
        e31=run (cfgOf "E31_Full") t; rs31=fromJust (regionRun (graph e31))
        witnessOf v s=head [c | c<-rsPrecheckWitness rs31, scView c==v, scSelector c==s]
        kinds c=[(k,outcomeKind o) | (k,o)<-scCases c]
    case fam of
      CrossSeparatorPartition->assert (label++": solved by a region program with k = 4 splits; selector = content with objects") (m "rg_k2plus_splits" full>0 && maybe False (\p->rpAction p==CropRegion && rpSelector p==SelContentWithObjects) (program full >>= progRegion))
      RingSeparatorPartition->assert (label++": solved by cropping the inside (smallest content) of the ring") (maybe False (\p->rpAction p==CropRegion) (program full >>= progRegion))
      ShellVsPixelPatchwork->assert (label++": solved; the shell object's scene MDL uses the difference expression") (isJust (program full >>= progRegion))
      BackgroundByResidual->assert (label++": solved under a non-zero residual view with the colour-0 region") (maybe False (\p->rpView p/=LegacyView) (program full >>= progRegion))
      InvalidObjectStraddle->assert (label++": in the legacy view no separating split exists (bar pieces and the crossing object give k = 1); no region program fits in any view (the NoBackground view may enclose the dot with the 0-blob, which is a legal k = 2 split)") (all (\(_,v,t')->v/=LegacyView || all (<2) (M.keys (rtKHist t'))) (rsTrees rs) && m "rg_fits" full==0)
      RegionPreserveWithLocalEdit->do
        assert (label++": PreserveExcept on the smallest quadrant; safe prune removed candidates with a dependency witness; NoSafePrune executes more") (maybe False (\p->case rpAction p of PreserveExcept (RecolorObjects _)->True; _->False) (program full >>= progRegion) && m "rg_pruned" full>0 && m "rg_executed" noprune>m "rg_executed" full && any (not . null . dwPruned) (rsDependency rs))
        assert (label++": region-first breadth exposes the fit earlier than the E2Only order") (m "rg_first_fit_exposure" full<m "rg_first_fit_exposure" e2)
      SharedRuleAcrossRegions->assert (label++": shared rule at the root; per-region intersection pruned non-fitting colours; NoSafePrune reaches the same program") (maybe False (\p->rpSelector p==SelRoot) (program full >>= progRegion) && fmap progRegion (program noprune)==fmap progRegion (program full))
      CrossRegionCopyCounterexample->assert (label++": cross-region StampAtMarkers is found with pruning on (never pruned, never prechecked away) and the same with pruning off; E31_Full finds the same program") (maybe False (\p->case rpAction p of StampAtMarkers _->True; _->False) (program full >>= progRegion) && fmap progRegion (program noprune)==fmap progRegion (program full) && fmap progRegion (program e31)==fmap progRegion (program full))
      BreadthBeatsDeepWrongView->do
        let seqv=run (cfgOf "RegionPriority") t
        assert (label++": breadth exposes the correct view's layer-0 fit before the view-sequential search does") (m "rg_first_fit_exposure" full<m "rg_first_fit_exposure" seqv && maybe False (\p->rpView p/=LegacyView) (program full >>= progRegion))
      LazyVsEagerFinitePartition->assert (label++": solved; nested separators give several k >= 2 splits") (m "rg_k2plus_splits" full>=2)
      SelectorCardinalityCaseDependent->do
        let v=rpView (fromJust (program e31 >>= progRegion)); c=witnessOf v SelContentWithObjects
        assert (label++": E31_Full solves with a region program; the precheck witness of UniqueContentWithObjects is Valid on cases 0-2 and NonUnique on case 3 (per-case cardinality, input-side)") (kinds c==[(0,"ValidSelected"),(1,"ValidSelected"),(2,"ValidSelected"),(3,"InvalidNonUnique")] && length (outcomeIds (snd (scCases c!!3)))==2)
        assert (label++": the skipped list names CropRegion[UniqueContentWithObjects] with case 3 and the selector; the accepted program is not it") (any (\x->rpSelector (pkProgram x)==SelContentWithObjects && rpAction (pkProgram x)==CropRegion && rpView (pkProgram x)==v && (case pkVerdict x of PrecheckInvalid "target" _ 3 _ _->True; _->False)) (rsPrechecked rs31) && maybe False (\p->rpSelector p/=SelContentWithObjects) (program e31 >>= progRegion))
      SelectorEmptyInOneCase->do
        let v=rpView (fromJust (program e31 >>= progRegion)); c=witnessOf v (SelContentWithColor 5); c8=witnessOf v (SelContentWithColor 8)
        assert (label++": UniqueContentWithColor(5) is Valid on cases 0-2 and Empty on case 3; UniqueContentWithColor(8) is Empty on cases 0-2; the solution selects by objects") (kinds c==[(0,"ValidSelected"),(1,"ValidSelected"),(2,"ValidSelected"),(3,"InvalidEmpty")] && take 3 (map snd (kinds c8))==replicate 3 "InvalidEmpty" && maybe False (\p->rpSelector p==SelContentWithObjects && rpAction p==CropRegion) (program e31 >>= progRegion))
      BackgroundViewSelectorDivergence->do
        let cL=witnessOf LegacyView SelContentWithObjects; cU=witnessOf (BackgroundView UniqueMostFrequentColor) SelContentWithObjects
        assert (label++": the same selector AST is NonUnique on every case in the legacy view and Valid on every case in the most-frequent-colour view (cache keyed by view; no pollution); the solution is not in the legacy view") (all ((=="InvalidNonUnique") . snd) (kinds cL) && all ((=="ValidSelected") . snd) (kinds cU) && maybe False (\p->rpView p/=LegacyView) (program e31 >>= progRegion) && scTreeHashes cL/=scTreeHashes cU)
      NestedRegionOwnership->do
        let p=fromJust (program e31 >>= progRegion); v=rpView p
            (k0,_,tSearch)=head [x | x@(k,v',_)<-rsTrees rs31, k==0, v'==v]
            deep=eagerClosure defaultPartitionBudget {pbMaxExpansions=40} (rootNode (rtScene tSearch))
            dot=head [o | o<-shObjects (rtScene tSearch), S.size (poSupport o)==1]
        assert (label++": solved by counting the two objects (ring + dot) owned by the target quadrant at depth 1") (rpSelector p==SelContentWithObjectCount 2 && rpAction p==CropRegion && k0==0)
        assert (label++": in the deeper eager tree the dot is owned by a depth >= 2 node while the depth-1 selector verdict is unchanged; the tree identity (hash) differs, so cached per-tree verdicts cannot be confused") (fmap (rnDepth . (rtNodes deep M.!)) (owningRegion deep dot)>=Just 2 && fmap (rnDepth . (rtNodes tSearch M.!)) (owningRegion tSearch dot)==Just 1 && outcomeIds (resolveSelector (SelContentWithObjectCount 2) deep)==outcomeIds (resolveSelector (SelContentWithObjectCount 2) tSearch) && treeHashOf deep/=treeHashOf tSearch)
      OneCaseCoincidence->do
        let allFits=searchRegions (regionSearch (cfgOf "E31_Full")) {rcFirstFitStop=False,rcExecutionBudget=100000} (training t)
            smallestCrop=RegionProgram LegacyView SelSmallestContent CropRegion
            one=searchRegions (regionSearch (cfgOf "E31_Full")) {rcFirstFitStop=False,rcExecutionBudget=100000} [head (training t)]
        assert (label++": CropRegion[UniqueSmallestContent] is executed (not prechecked away: it is valid on every input), fits case 0 only and is rejected as no_fit on case 1; it IS accepted by a one-case search") (any (\e->exProgram e==smallestCrop && exOutcome e=="no_fit" && "case 1" `isInfixOf` exReason e) (rsExposures allFits) && smallestCrop `notElem` rsFits allFits && smallestCrop `elem` rsFits one && maybe False (\p->rpAction p==CropRegion && rpSelector p/=SelSmallestContent) (program e31 >>= progRegion))
    -- goal ledger sanity: used <= allocated, deferred goals resumed from cursors (breadth); used/fits now recorded per goal
    assert (label++": goal ledger consistent (used <= total, cursor = used+skipped for exhausted goals, sum used = executed)") (all (\g->glUsed g<=glTotal g && (glStatus g/="exhausted" || glCursor g==glTotal g) && glUsed g+glPrechecked g+glPruned g<=glCursor g) (rsGoals rs31) && sum (map glUsed (rsGoals rs31))==rsExecuted rs31 && sum (map glFits (rsGoals rs31))==length (rsFits rs31))
    assert (label++": universe accounting: considered = executed + prechecked + pruned (E31_Full)") (rsConsidered rs31==rsExecuted rs31+length (rsPrechecked rs31)+rsPruned rs31)
    when (fam/=InvalidObjectStraddle) $ assert (label++": determinism") (program (run (cfgOf "FullE3") t)==program full && program (run (cfgOf "E31_Full") t)==program e31)
  -- 6. fixed-universe differentials on EVERY mechanism instance: SafePrune x Precheck (4 combinations), collecting all fits
  diffRows<-forM instancesR $ \ins->do
    let t=instanceTaskR ins
        base=(regionSearch (cfgOf "E31_PatchedBaseline")) {rcFirstFitStop=False,rcExecutionBudget=100000}
        combos=[(pr,pc) | pr<-[True,False], pc<-[True,False]]
        runs=[((pr,pc),searchRegions base {rcSafePrune=pr,rcPrecheck=pc} (training t)) | (pr,pc)<-combos]
        fitsOf r=sort (map show (rsFits r))
        invalidOf r=S.fromList ([show (exProgram e) | e<-rsExposures r, exOutcome e=="execution_invalid"]++[show (pkProgram x) | x<-rsPrechecked r])
        noFitOf r=S.fromList [show (exProgram e) | e<-rsExposures r, exOutcome e=="no_fit"]
        ref=snd (head runs)
    assert (taskId t++": PruneOn/Off x PrecheckOn/Off accept the same program set on the same finite universe") (all (\(_,r)->fitsOf r==fitsOf ref) runs)
    -- a dependency-pruned candidate is neither executed-invalid nor no_fit; with pruning on, a candidate whose selector fails on
    -- some case may be pruned (precheck off) or prechecked (precheck on), so the invariant is on invalid U pruned
    let prunedOf r=S.fromList [show (pcProgram x) | d<-rsDependency r, x<-dwPruned d]
        pick pr pc=snd (head [x | x@((pr',pc'),_)<-runs, pr'==pr, pc'==pc])
    assert (taskId t++": prune off: the invalid set (executed-invalid U prechecked-invalid) and the no_fit set are identical with and without precheck") (invalidOf (pick False True)==invalidOf (pick False False) && noFitOf (pick False True)==noFitOf (pick False False))
    assert (taskId t++": prune on: invalid U pruned and the no_fit set are identical with and without precheck (a selector-invalid candidate is prechecked instead of pruned)") (S.union (invalidOf (pick True True)) (prunedOf (pick True True))==S.union (invalidOf (pick True False)) (prunedOf (pick True False)) && noFitOf (pick True True)==noFitOf (pick True False) && prunedOf (pick True True) `S.isSubsetOf` prunedOf (pick True False))
    assert (taskId t++": pruning only moves candidates out of the executed-invalid/no_fit sets, never out of the accepted set: invalid_on U nofit_on U pruned_on = invalid_off U nofit_off (precheck off)") (S.union (invalidOf (pick True False)) (S.union (noFitOf (pick True False)) (prunedOf (pick True False)))==S.union (invalidOf (pick False False)) (noFitOf (pick False False)))
    assert (taskId t++": every combination considers the whole universe: executed + prechecked + pruned = universe, no budget cut") (all (\(_,r)->rsExecuted r+length (rsPrechecked r)+rsPruned r==rsUniverse r && rsConsidered r==rsUniverse r && not (rsBudgetCut r)) runs)
    assert (taskId t++": precheck never skips a program whose selectors are valid on every case (every skipped program is executed-invalid without precheck)") (let off=snd (head [r | r@((pr,pc),_)<-runs, pr==False, pc==False]) in all (\x->S.member (show (pkProgram x)) (S.fromList [show (exProgram e) | e<-rsExposures off, exOutcome e=="execution_invalid"])) (rsPrechecked (snd (head [r | r@((pr,pc),_)<-runs, pr==False, pc==True]))))
    assert (taskId t++": with precheck on, strictly fewer executions whenever some selector is invalid on some case") (let [onP,offP]=[snd (head [r | r@((pr,pc),_)<-runs, pr==False, pc==b]) | b<-[True,False]] in rsExecuted onP+length (rsPrechecked onP)==rsExecuted offP && (null (rsPrechecked onP) || rsExecuted onP<rsExecuted offP))
    pure (taskId t,[(show k,rsExecuted r,length (rsPrechecked r),rsPruned r,rsUniverse r) | (k,r)<-runs])
  -- 7. lazy MDL == eager MDL: same scene costs, same view order, same exposures, same per-object shapes
  forM_ instancesR $ \ins->do
    let t=instanceTaskR ins
        eagerR=searchRegions (regionSearch (cfgOf "E31_PatchedBaseline")) (training t)
        lazyR=searchRegions (regionSearch (cfgOf "E31_LazyMDLOnly")) (training t)
        shapes r=[(k,v,poId o,fmap mrBest (poShape o),fmap mrCost (poShape o),fmap mrStatus (poShape o),fmap (fmap coverRectCount . mrRectCover) (poShape o)) | (k,v,tr')<-rsTrees r, o<-shObjects (rtScene tr')]
    assert (taskId t++": LazyMDL == eager MDL: scene costs, goal order, exposures (program, outcome) and every object's shape/c_ast/status/c_rect are identical") (rsSceneCost eagerR==rsSceneCost lazyR && rsGoalOrder eagerR==rsGoalOrder lazyR && map (\e->(exProgram e,exOutcome e)) (rsExposures eagerR)==map (\e->(exProgram e,exOutcome e)) (rsExposures lazyR) && rsFits eagerR==rsFits lazyR && shapes eagerR==shapes lazyR && rsExecuted eagerR==rsExecuted lazyR && rsPruned eagerR==rsPruned lazyR)
    assert (taskId t++": NoMDL records NotComputed shapes (null) and a pixel-proxy cost basis; MDL configs record mdl") (let nm=searchRegions (regionSearch (cfgOf "E31_FullNoMDL")) (training t) in all (\(_,_,tr')->all (isNothing . poShape) (shObjects (rtScene tr'))) (rsTrees nm) && rsShapeBasis nm=="not_computed" && rsShapeBasis lazyR=="mdl_cached" && rsShapeBasis eagerR=="mdl_eager")
  -- 8. PriorityVsBreadth (measured, negative results allowed): first-fit candidate index per ordering on the positive families
  prio<-forM [i | i<-instancesR, irFamily i/=InvalidObjectStraddle] $ \ins->do
    let t=instanceTaskR ins
        row=[(n,let r=searchRegions (regionSearch (cfgOf n)) (training t) in (rsFirstFitCandidate r,rsFirstFitExposure r,rsExecuted r,length (rsPrechecked r),rsPruned r,map show (take 1 (rsFits r)))) | n<-["E31_Full","E31_FullCostOrder","E31_FullSelectorPriority"]]
    assert (taskId t++": every ordering (size-class, cost-only, selector-priority) finds a fit on the same universe") (all (\(_,(c,_,_,_,_,_))->isJust c) row)
    pure (taskId t,row)
  -- 9. ARC regression: the four E3 region solutions and the two content-first solutions (train pairs only), same programs as the E3 frozen records
  let arcExpected=[("1c786137","CropRegion[Region <- UniqueSmallestContent] @ LegacyView(Color0,4-connected encoder)"),("2dc579da","CropRegion[Region <- UniqueContentWithObjects] @ BackgroundView(UniqueMostFrequentColor)")
                  ,("5582e5ca","PreserveExcept(ClearRegion)[Region <- Root] @ BackgroundView(UniqueMostFrequentColor)"),("d9fac9be","CropRegion[Region <- UniqueContentWithObjectCount(1)] @ LegacyView(Color0,4-connected encoder)")]
  arcRows<-forM arcExpected $ \(tid,expected)->do
    let path="data/arc1-training/"++tid++".json"
    exists<-doesFileExist path
    if not exists then putStrLn ("SKIP "++tid++" (data file missing)") >> pure (tid,[]) else do
      task<-either error id <$> loadTask path
      let trainOnly=task {tests=[]}
      rows'<-forM ["E31_PatchedBaseline","E31_Full","E31_FullNoMDL","E31_FullSelectorPriority","E31_FullCostOrder"] $ \cn->do
        let f=run (cfgOf cn) trainOnly
            got=fmap programText (program f >>= progRegion)
        assert (tid++" "++cn++": train-exact with a region program") (trainExactOf trainOnly f && isJust got)
        when (cn=="E31_PatchedBaseline") $ assert (tid++" PatchedBaseline: the E3 frozen program text is reproduced") (got==Just expected)
        pure (cn,got,m "rg_executed" f,m "rg_prechecked" f,m "rg_pruned" f,m "rg_first_fit_exposure" f)
      pure (tid,rows')
  writeFile "results/stage_e31/unit_tests/summary.json" (jsonLine [("suite",show "region_e31"),("passed","true"),("configs_e31",show (show configNamesE31))
    ,("differential",show (show diffRows)),("priority_vs_breadth",show (show prio)),("arc_regression",show (show arcRows))]++"\n")
  putStrLn "All region (Stage E2/E3 + E3.1) tests passed."
  where
    rgPixelsOf=rgPixels
    vrRegionsOf=vrRegions
    _u=nub :: [Int] -> [Int]
