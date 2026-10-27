module Main where
import Synthesis.Collection.Geometry.Cover
import Synthesis.Collection.Geometry.View
import Synthesis.Collection.Geometry.Features
import Synthesis.Collection.ContentFirst
import Synthesis.Collection.Front
import Synthesis.Collection.Relation (Pred(..), Selector(..), evalPred, EmittedObject(..))
import ARC.ContentFirstEvaluate
import ARC.GeometryMechanism
import ARC.StageAEvaluate (trainExactOf, heldExactOf, failureStage)
import ARC.Dataset (Task(..))
import Latent.Grid
import Latent.Encode (encode, defaultEncoder)
import qualified Latent.Object as O
import qualified Data.Set as S
import qualified Data.Map.Strict as M
import Data.List (sort, nub, isInfixOf, subsequences)
import Data.Either (isLeft, isRight)
import Data.Maybe (isJust)
import Control.Monad (unless, forM_, when)
import System.Directory (createDirectoryIfMissing)

assert :: String -> Bool -> IO ()
assert label ok=unless ok (error ("FAIL "++label)) >> putStrLn ("PASS "++label)
must :: Either String a -> a
must=either error id
px :: [(Int,Int)] -> PixelSet
px=pixelSetFromList . map (uncurry Coord)
gridOf :: Int -> Int -> Int -> [(Int,Int,Int)] -> Grid
gridOf w h bg cells=must (mkGrid [[maybe bg id (lookup (x,y) [((a,b),c) | (a,b,c)<-cells]) | x<-[0..w-1]] | y<-[0..h-1]])

-- Deterministic LCG for random pixel sets.
lcg :: Int -> [Int]
lcg seed=tail (iterate (\x->(x*1103515245+12345) `mod` 2147483648) seed)
randomSet :: Int -> Int -> Int -> PixelSet
randomSet seed w h=px [(x,y) | (x,y,r)<-zip3 (cycle [0..w-1]) (concatMap (replicate w) [0..h-1]) (take (w*h) (lcg seed)), r `mod` 3/=0]

-- Independent brute-force reference: every sub-rectangle of S (not only the
-- maximal ones), subsets by increasing size, first union == S is minimal.
bruteMinimal :: PixelSet -> Int
bruteMinimal s
  | S.null s = 0
  | otherwise = head [k | k<-[1..S.size s], any (\c->coverUnion c==s) (combos k)]
  where
    cells=S.toList s
    rects=[Rect x0 y0 x1 y1 | Coord x0 y0<-cells, Coord x1 y1<-cells, x1>=x0, y1>=y0, rectInside s (Rect x0 y0 x1 y1)]
    combos k=filter ((==k) . length) (subsequences rects)

main :: IO ()
main=do
  createDirectoryIfMissing True "results/stage_e01/unit_tests"
  -- 1. E1 cover: semantics, minimality against brute force, canonical ties, budgets
  let shapes=[("empty",px []),("pixel",px [(3,3)]),("rect",px [(x,y) | x<-[1..4], y<-[2..3]]),("L",px [(0,0),(0,1),(0,2),(1,2),(2,2)]),("T",px [(0,0),(1,0),(2,0),(1,1),(1,2)])
             ,("U",px [(0,0),(0,1),(0,2),(1,2),(2,2),(2,1),(2,0)]),("plus",px [(1,0),(0,1),(1,1),(2,1),(1,2)]),("hole",px [(x,y) | x<-[0..2], y<-[0..2], (x,y)/=(1,1)])
             ,("diag",px [(i,i) | i<-[0..3]]),("checker",px [(x,y) | x<-[0..3], y<-[0..3], even (x+y)]),("disconnected",px [(0,0),(0,1),(3,3),(4,3)]),("full",px [(x,y) | x<-[0..4], y<-[0..4]])]
  forM_ shapes $ \(name,s)->do
    let r=minimalCover defaultCoverBudget s
        rs=coverRectangles r
    assert (name++": cover is legal (every rectangle inside S, union == S)") (isRight (verifyCover s rs))
    assert (name++": empty set gives EmptyCover and EmptyBounds; non-empty gives PixelBounds") (if S.null s then r==EmptyCover && boundsOfPixels s==EmptyBounds else isJust (boundsRect (boundsOfPixels s)))
    when (S.size s<=9) $ assert (name++": proven minimal count equals the brute-force reference") (coverProven r && coverRectCount r==bruteMinimal s)
    assert (name++": lower bound <= k <= upper bound") (case r of ProvenMinimal{}->crLowerBound r<=length (crCanonical r); ValidBounded{}->crLower r<=crUpper r && crUpper r==length (crBest r); EmptyCover->True)
  let thick=px [(0,0),(0,1),(1,1),(1,2),(2,2)]
      plus=minimalCover defaultCoverBudget thick
      plusSimple=minimalCover defaultCoverBudget (px [(1,0),(0,1),(1,1),(2,1),(1,2)])
  assert "staircase: proven minimum 3 with two optimal maximal-rectangle covers; canonical = key-lexicographic minimum, the alternative retained, enumeration complete" (coverProven plus && coverRectCount plus==3 && length (crAlternatives plus)==1 && crCanonical plus<head (crAlternatives plus) && crAlternativesComplete plus && all (\c->isRight (verifyCover thick c)) (crCanonical plus:crAlternatives plus))
  assert "plus sign: exactly one optimal 2-cover among maximal rectangles (no alternative claimed)" (coverProven plusSimple && coverRectCount plusSimple==2 && null (crAlternatives plusSimple))
  assert "canonical cover is stable under pixel order and translation" (let s2=pixelSetTranslate 5 7 thick in map (\r->(rx0 r-5,ry0 r-7,rx1 r-5,ry1 r-7)) (coverRectangles (minimalCover defaultCoverBudget s2))==map (\r->(rx0 r,ry0 r,rx1 r,ry1 r)) (coverRectangles plus))
  assert "cover never covers a hole" (all (\r->not (rectContains r (Coord 1 1))) (coverRectangles (minimalCover defaultCoverBudget (px [(x,y) | x<-[0..2], y<-[0..2], (x,y)/=(1,1)]))))
  forM_ [1..40] $ \seed->do
    let s=randomSet seed (3+seed `mod` 5) (3+seed `mod` 4)
        r=minimalCover defaultCoverBudget s
    assert ("random set "++show seed++": legal cover, bounds consistent, greedy legal too") (isRight (verifyCover s (coverRectangles r)) && isRight (verifyCover s (greedyCover s (maximalRectangles s))) && (S.null s || lowerBoundRects s<=coverRectCount r))
    when (S.size s<=8 && not (S.null s)) $ assert ("random set "++show seed++": proven minimum equals brute force") (coverProven r && coverRectCount r==bruteMinimal s)
  let big=px [(x,y) | x<-[0..29], y<-[0..29], (x*7+y*3) `mod` 5/=0]
      tight=minimalCover (CoverBudget 50 900 2) big
      area=minimalCover (CoverBudget 50 100 2) big
  assert "truncated optimisation returns a legal Bounded cover with honest bounds, never a proof" (not (coverProven tight) && isRight (verifyCover big (coverRectangles tight)) && case tight of ValidBounded{}->crLower tight<=crUpper tight && "node budget" `isInfixOf` crTruncation tight; _->False)
  assert "area budget: greedy legal cover with the area truncation reason" (case area of ValidBounded{}->"area" `isInfixOf` crTruncation area && isRight (verifyCover big (crBest area)); _->False)
  -- 2. coordinate frames and derived corners
  let ar=AbsRect (Rect 4 5 7 9)
  assert "relative and normalized frames are distinct types with explicit conversion" (toRelative (Coord 4 5) ar==RelRect (Rect 0 0 3 4) && normalizeRect ar==NormRect (Rect 0 0 3 4) && toRelative (Coord 6 6) ar==RelRect (Rect (-2) (-1) 1 3))
  assert "corners derive from the four extremes; width/height are +1" (corners (Rect 4 5 7 9)==Corners (Coord 4 5) (Coord 7 5) (Coord 4 9) (Coord 7 9) && rectWidth (Rect 4 5 7 9)==4 && rectHeight (Rect 4 5 7 9)==5)
  assert "mkRect rejects inverted rectangles" (isLeft (mkRect 3 3 2 4))
  -- 3. E0 views
  let g8=gridOf 7 6 8 (concat [[(2,1,2),(3,1,2),(2,2,2)],[(5,4,0)],[(1,4,3)]])        -- background 8, one colour-0 foreground pixel
  let Right ub=viewRegions (BackgroundView UniformBorderColor) g8
      Right mf=viewRegions (BackgroundView UniqueMostFrequentColor) g8
      Right nb=viewRegions (BackgroundView NoBackground) g8
      Right lg=viewRegions LegacyView g8
  assert "UniformBorderColor and UniqueMostFrequentColor find background 8; colour 0 is a foreground region" (vrBackground ub==Just 8 && vrBackground mf==Just 8 && length (vrRegions ub)==3 && any (\r->M.elems (rgColors r)==[0]) (vrRegions ub))
  assert "NoBackground: every pixel is in a region, colour 0 is ordinary" (vrBackground nb==Nothing && sum (map (S.size . rgPixels) (vrRegions nb))==42)
  assert "LegacyView is pixel-for-pixel and id-for-id the Stage C encoder" (and [rgPixels r==pixelSetFromList (map fst (O.absolutePixels o)) && rgId r==O.objectId o | (r,o)<-zip (vrRegions lg) (O.objects (encode defaultEncoder g8))] && length (vrRegions lg)==length (O.objects (encode defaultEncoder g8)))
  let tie=gridOf 4 2 0 [(0,0,1),(1,0,1),(2,0,2),(3,0,2),(0,1,1),(1,1,1),(2,1,2),(3,1,2)]
      mixedBorder=gridOf 4 3 8 [(0,0,1)]
  assert "ties and non-uniform borders are explicit non-applicability, never a pick" (isLeft (resolveBackground UniqueMostFrequentColor tie) && isLeft (resolveBackground UniformBorderColor mixedBorder))
  let checker=gridOf 4 4 0 [(x,y,1) | x<-[0..3], y<-[0..3], odd (x+y)]
  assert "checkerboard: most-frequent tie rejected, border not uniform, NoBackground has 16 single-pixel regions" (isLeft (resolveBackground UniqueMostFrequentColor checker) && isLeft (resolveBackground UniformBorderColor checker) && length (vrRegions (must (viewRegions (BackgroundView NoBackground) checker)))==16)
  let res=residualOf g8 [r | r<-vrRegions ub, M.elems (rgColors r)==[2,2,2]]
  assert "residual of a selection keeps the marker and colour-0 cells: it is not background" (resCells res==42-3 && any (\(c,_)->c==0) (resColors res) && any (\(c,_)->c==3) (resColors res) && "never interpreted as background" `isInfixOf` resNote res)
  -- colour permutation: geometry invariant, background decision reported per definition
  let swap c=if c==0 then 8 else if c==8 then 0 else c
      g8s=must (mkGrid (map (map swap) (rows g8)))
      geo v g=sort [(S.toList (rgPixels r),coverRectCount (minimalCover defaultCoverBudget (rgPixels r))) | r<-vrRegions (must (viewRegions v g))]
  assert "0<->8 colour swap leaves the NoBackground geometry (pixel sets and covers) unchanged" (geo (BackgroundView NoBackground) g8==geo (BackgroundView NoBackground) g8s)
  assert "the swap changes the UniformBorderColor background decision by definition (reported, not hidden)" (vrBackground (must (viewRegions (BackgroundView UniformBorderColor) g8s))==Just 0 && geo (BackgroundView UniformBorderColor) g8==geo (BackgroundView UniformBorderColor) g8s)
  -- 4. GeoRectCount predicate: proven only
  let objs=O.objects (encode defaultEncoder (gridOf 10 8 0 ([(x,y,1) | x<-[1..3], y<-[1..2]]++[(5,1,2),(5,2,2),(5,3,2),(6,3,2),(7,3,2)])))
  assert "GeoRectCount: rectangle = 1, L = 2, never both" (map (\o->evalPred objs (GeoRectCount 1) o) objs==[Right True,Right False] && map (\o->evalPred objs (GeoRectCount 2) o) objs==[Right False,Right True])
  let huge=O.Object 0 (Coord 0 0) (M.fromList [(Coord x y,1) | x<-[0..29], y<-[0..29], (x*7+y*3) `mod` 5/=0]) 0
  assert "GeoRectCount on an unproven (area-truncated) cover is an explicit failure, not the bound" (isLeft (evalPred [huge] (GeoRectCount 3) huge))
  -- 5. witnesses: independent replay and tamper detection
  let s=px [(1,0),(0,1),(1,1),(2,1),(1,2)]
      w=geometryWitness "t" 0 LegacyView defaultCoverBudget s
  assert "geometry witness replays" (isRight (verifyGeometryWitness w) && gwStatus w=="proven_minimal")
  assert "tamper: pixel added / removed / bounds / rectangle / status / frame are all rejected"
    (isLeft (verifyGeometryWitness w {gwPixels=S.insert (Coord 5 5) s}) && isLeft (verifyGeometryWitness w {gwPixels=S.delete (Coord 1 2) s})
     && isLeft (verifyGeometryWitness w {gwBounds=PixelBounds (Rect 0 0 3 3)}) && isLeft (verifyGeometryWitness w {gwRects=[Rect 0 0 2 2]})
     && isLeft (verifyGeometryWitness w {gwStatus="bounded",gwLower=1,gwUpper=3}) && isLeft (verifyGeometryWitness w {gwFrame="relative"})
     && isLeft (verifyGeometryWitness w {gwRects=take 1 (gwRects w)}) && isLeft (verifyGeometryWitness w {gwHash="deadbeef"}))
  let a=px [(0,0),(1,0)]; b=px [(5,5),(6,5)]; c=px [(0,0),(1,0),(2,0)]
  assert "relations: translation, containment, disjoint/overlap, CropSource; each independently verifiable" (SameUpToTranslation 5 5 `elem` relate a b && Disjoint `elem` relate a b && BoundingContainment `elem` relate a c && any (\r->case r of Overlap 2->True; _->False) (relate a c)
     && isRight (verifyRelation a b (SameUpToTranslation 5 5)) && isLeft (verifyRelation a b (SameUpToTranslation 1 1)) && isRight (verifyRelation a (px [(0,0),(1,0)]) (CropSource (Rect 0 0 1 0))) && isLeft (verifyRelation a b (CropSource (Rect 0 0 1 0))))
  -- 6. plan universe with views/geometry; FrozenCF universe unchanged
  let u0=enumeratePlans [2] True False False False; u1=enumeratePlans [2] True False True True
  assert "with both flags off the universe is the legacy-view content-first universe; flags add views and GeoRectCount plans" (all ((==LegacyView) . cfpView) u0 && not (any planUsesGeometry u0) && length u1>length u0 && any planUsesGeometry u1 && any ((/=LegacyView) . cfpView) u1 && take (length u0) (filter ((==LegacyView) . cfpView) (filter (not . planUsesGeometry) u1))==u0)
  -- 7. mechanism matrix: measured controls, views and geometry really executed
  let run cfg t=frontSearch SafeOnline cfg (training t)
      m k f=metric k (graph f)
      core p=(progExec p,progDefs p,progTransform p,fmap srWidth (progSize p),fmap srHeight (progSize p),progContentFirst p)
  forM_ instancesG $ \ins->do
    let t=instanceTaskG ins; fam=igFamily ins; label=taskId t
    forM_ namedConfigsE01 $ \(cn,cfg)->do
      let f=run cfg t
      assert (label++" "++cn++": invariants") (m "ConcreteCrossItemEdgeCount_high_level" f==0 && m "UntriggeredExpansionCount" f==0)
      when (cn `elem` familyExpectationG fam) $ assert (label++" "++cn++": train-exact (positive control)") (trainExactOf t f)
      when (cn `elem` familyNegativeG fam) $ assert (label++" "++cn++": not train-exact (negative control, measured)") (not (trainExactOf t f))
      when (cn `elem` familyExpectationG fam) $ assert (label++" "++cn++": heldout exact (scoring only)") (heldExactOf t f)
      when (cn=="FrozenCF") $ assert (label++" FrozenCF: no view created, no geometry evaluated") (m "geo_views_created" f==0 && m "geo_feature_evaluations" f==0 && all ((==LegacyView) . cfpView . ccPlan) [c | r<-contentFirstRuns (graph f), c<-crCandidates (cfrResult r)])
    let full=run (maybe (error "FullE01") id (lookup "FullE01" namedConfigsE01)) t
        plan=program full >>= progContentFirst
    case fam of
      NonZeroBackgroundCrop->assert (label++": the solution uses a background view with a non-zero background, created and traced") (maybe False ((/=LegacyView) . cfpView) plan && m "geo_views_created" full>0 && maybe False (\p->all (\(r,_)->either (const False) ((/=Just 0) . rpBackground . oswProvenance . osWitness) r) (programSpecsCF (training t) p)) (program full))
      ZeroIsForeground->assert (label++": a colour-0 foreground pixel is inside the selected window under the view") (maybe False ((/=LegacyView) . cfpView) plan && maybe False (\p->all (\(r,_)->either (const False) (\s->any (\e->0 `elem` M.elems (O.geometry (eoObject e))) (specEmitted s)) r) (programSpecsCF (training t) p)) (program full))
      MultiRectCoverAmbiguity->do
        assert (label++": selected by the proven GeoRectCount predicate; feature evaluations counted") (maybe False planUsesGeometry plan && m "geo_feature_evaluations" full>0 && m "geo_cover_proven" full>0)
        assert (label++": the selected staircase has two optimal covers recorded (canonical + alternative), never a unique semantics") (maybe False (\p->all (\(r,_)->either (const False) (\s->maybe False (any (\g->gwAlternatives g>=1 && gwStatus g=="proven_minimal")) (oswGeometry (osWitness s))) r) (programSpecsCF (training t) p)) (program full))
      GeometryDeterminedSize->do
        let fits=[ccPlan c | r<-contentFirstRuns (graph full), c<-crFits (cfrResult r)]
        assert (label++": dims (3x3) come from the bounds of the proven cover-3 object; both constructions fit on an empty window and are retained as representatives") (maybe False planUsesGeometry plan && maybe False (\p->all (\(r,_)->either (const False) (\s->osDims s==Dimensions 3 3) r) (programSpecsCF (training t) p)) (program full)
          && any ((==EmitSelectedWithOwnCanvas) . cfpConstruction) fits && any ((==CropInputWindow) . cfpConstruction) fits)
      ResidualMarkerNegative->do
        let allFg=[c | r<-contentFirstRuns (graph full), c<-crCandidates (cfrResult r), cfpSelection (ccPlan c)==SelectionPlan SelectNonEmpty AllObjects, cfpView (ccPlan c)/=LegacyView]
        assert (label++": every all-foreground plan under a view fails (the marker is residual, not background)") (not (null allFg) && all ((/="fit") . ccStatus) allFg)
        assert (label++": the selected program excludes the marker and its provenance records a residual with the marker colour") (maybe False (\p->all (\(r,_)->either (const False) (\s->rpResidualCells (oswProvenance (osWitness s))>0) r) (programSpecsCF (training t) p)) (program full))
    -- determinism & permutation
    let perm=frontSearch SafeOnline (maybe (error "FullE01") id (lookup "FullE01" namedConfigsE01)) {enumerationSeed=Just (igSeed ins+5)} (training t)
    assert (label++": determinism and input permutation invariance (program core)") (fmap core (program perm)==fmap core (program full) && program (run (maybe (error "FullE01") id (lookup "FullE01" namedConfigsE01)) t)==program full)
    -- cross-case witness: observed agreement on the view and dims-or-varies, target used only for the exact flag
    case program full >>= crossCaseOf (training t) of
      Nothing->pure ()
      Just ccw->assert (label++": cross-case witness records bindings per case and an agreement verdict per field") (length (ccwBindings ccw)==4 && isJust (lookup "view" (ccwAgreement ccw)) && all (\b->cbTargetExact b==Just True) (ccwBindings ccw))
  -- 8. regression: FrozenCF == ContentFirstOnly programs/work on the content-first families
  forM_ (take 6 instancesG) $ \ins->do
    let t=instanceTaskG ins
        a=run (maybe (error "cfo") id (lookup "FrozenCF" namedConfigsE01)) t; b=run contentFirstOnly t
    assert (taskId t++": FrozenCF equals ContentFirstOnly (program, failure, work)") (program a==program b && failure a==failure b && m "search_work" a==m "search_work" b)
  writeFile "results/stage_e01/unit_tests/summary.json" "{\"suite\":\"geometry\",\"passed\":true}\n"
  putStrLn "All geometry (Stage E0/E1) tests passed."
