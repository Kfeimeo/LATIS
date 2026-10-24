-- LATIS v0.6.1: seeded generators for the mechanism families of A-F and
-- 03560426 (metamorphic / robustness battery). Every instance records its
-- seed, the generator's known rule, and the reason for any rejection. The
-- known rule is used only offline (oracle/recall statistics and regenerating
-- outputs of translated variants); the solver never sees it.
module ARC.CollectionV61Generate
  ( Family(..), Rule(..), Instance(..), familyName, generateFamily, generateValid, instanceTask, translatedInstance
  , ruleOutput, instanceJSON, knownFirstItemHypotheses, familyExpectsTies, scanOrder
  ) where

import ARC.CollectionV6Evaluate (Ob(..), rectOb, hookOb, placeOb)
import ARC.Dataset
import ARC.Evaluate (jsonString)
import ARC.InducedR1Evaluate (objectJSON,arrayJSON,boolJSON)
import Latent.Grid
import Data.List (sortOn, nub, intercalate)

data Family = SeedKey | CompositeKey | RuntimeTrap | SizeIndex | FirstItem | RepeatedPattern | OverlapChain
  deriving (Eq,Ord,Show,Read,Enum,Bounded)
data Rule = MoveRight Int | StackByHeight | ShiftByShapes | ChainX | ChainY | OverlapChainX deriving (Eq,Show,Read)
data Instance = Instance { insFamily :: Family, insSeed :: Int, insCanvas :: Int, insRule :: Rule, insTrain :: [[Ob]], insHeld :: [Ob], insNotes :: [String] }
familyName :: Family -> String
familyName=show

-- A tiny deterministic generator (LCG); no global state, replayable by seed.
newtype Rand a = Rand { runRand :: Int -> (a,Int) }
instance Functor Rand where fmap f (Rand g)=Rand (\s->let (a,s')=g s in (f a,s'))
instance Applicative Rand where
  pure a=Rand (\s->(a,s))
  Rand f <*> Rand g=Rand (\s->let (h,s1)=f s; (a,s2)=g s1 in (h a,s2))
instance Monad Rand where Rand g >>= k=Rand (\s->let (a,s1)=g s in runRand (k a) s1)
next :: Rand Int
next=Rand (\s->let s'=(s*1103515245+12345) `mod` 2147483648 in (s' `div` 65536,s'))
range :: Int -> Int -> Rand Int
range lo hi | hi<lo = pure lo
            | otherwise = (\r->lo+r `mod` (hi-lo+1)) <$> next
choose :: [a] -> Rand a
choose xs=(xs !!) <$> range 0 (length xs-1)
shuffle :: [a] -> Rand [a]
shuffle xs=do ks<-mapM (const next) xs; pure (map snd (sortOn fst (zip ks xs)))
distinctColors :: Int -> Rand [Int]
distinctColors n=take n <$> shuffle [1..9]

-- Geometry helpers on the generator's own object representation.
cellsOf :: Ob -> [(Int,Int)]
cellsOf o=[(obX o+i,obY o+j) | (i,j)<-obCells o]
separated :: Ob -> Ob -> Bool
separated a b=and [abs (x1-x2)>1 || abs (y1-y2)>1 | (x1,y1)<-cellsOf a, (x2,y2)<-cellsOf b]
inside :: Int -> Ob -> Bool
inside canvas o=all (\(x,y)->x>=0 && y>=0 && x<canvas && y<canvas) (cellsOf o)
area :: Ob -> Int
area=length . obCells
-- Encoder enumeration order: first scanned cell (row-major).
scanOrder :: [Ob] -> [Ob]
scanOrder=sortOn (\o->minimum [(y,x) | (x,y)<-cellsOf o])
heightOrder :: [Ob] -> [Ob]
heightOrder=sortOn obH
sameOrder :: [Ob] -> [Ob] -> Bool
sameOrder a b=map (\o->(obX o,obY o)) a==map (\o->(obX o,obY o)) b
strict :: Ord k => (Ob -> k) -> [Ob] -> Bool
strict f obs=length (nub (map f obs))==length obs
-- A seed key "fails" on a case if it ties or orders differently from the target.
seedKeyFails :: [Ob] -> Bool
seedKeyFails obs=and [not (strict f obs) || not (sameOrder (sortOn f obs) (heightOrder obs)) | f<-seedKeyFns]
  where seedKeyFns=[\o->[obX o],\o->[obY o],\o->[area o],\o->[obColor o],\o->[obX o,obY o],\o->[obY o,obX o]]
seedKeysAllFail :: [[Ob]] -> Bool
seedKeysAllFail cases=all (\f->any (\obs->not (strict f obs) || not (sameOrder (sortOn f obs) (heightOrder obs))) cases) fns
  where fns=[\o->[obX o],\o->[obY o],\o->[area o],\o->[obColor o],\o->[obX o,obY o],\o->[obY o,obX o]]

placeRandom :: Int -> [Ob] -> [Ob] -> Int -> Rand (Maybe [Ob])
placeRandom _ placed [] _=pure (Just placed)
placeRandom canvas placed (o:os) tries=do
  x<-range 0 (canvas-obW o)
  y<-range 0 (canvas-obH o)
  let o'=o {obX=x, obY=y}
  if inside canvas o' && all (separated o') placed then placeRandom canvas (placed++[o']) os tries
    else if tries<=0 then pure Nothing else placeRandom canvas placed (o:os) (tries-1)

-- Rule semantics (known to the generator only).
gridN :: Int -> [(Int,Int,Int)] -> Either String Grid
gridN canvas cells
  | any (\(x,y,_)->x<0 || y<0 || x>=canvas || y>=canvas) cells = Left "output outside canvas"
  | otherwise = gridFromCells (Dimensions canvas canvas) 0 [(Coord x y,c) | (x,y,c)<-cells]
ruleOutput :: Int -> Rule -> [Ob] -> Either String Grid
ruleOutput canvas rule obs=gridN canvas (concat (placements rule))
  where
    placements (MoveRight k)=[placeOb (obX o+k,obY o) o | o<-obs]
    placements StackByHeight=go 0 (sortOn obH obs) where go _ []=[]; go y (o:os)=placeOb (0,y) o:go (y+obH o+1) os
    placements ShiftByShapes=let k=length (nub [(obW o,obH o) | o<-obs]) in [placeOb (obX o+k,obY o) o | o<-obs]
    placements ChainX=chain 1 (sortOn obX obs)
    placements ChainY=chain 1 (sortOn obY obs)
    placements OverlapChainX=chain 0 (sortOn obX obs)
    chain gap=go (0,0) where go _ []=[]; go (x,y) (o:os)=placeOb (x,y) o:go (x+obW o-1+gap,y+obH o-1+gap) os
inputOf :: Int -> [Ob] -> Grid
inputOf canvas obs=either error id (gridN canvas (concat [placeOb (obX o,obY o) o | o<-obs]))
instanceTask :: Instance -> Task
instanceTask ins=Task (familyName (insFamily ins)++"-"++show (insSeed ins))
  [(inputOf c obs,out) | obs<-insTrain ins, Right out<-[ruleOutput c (insRule ins) obs]]
  [TestPair (inputOf c (insHeld ins)) (either (const Nothing) Just (ruleOutput c (insRule ins) (insHeld ins)))]
  where c=insCanvas ins
-- Whole-scene translation of the INPUTS; outputs are regenerated by the rule.
translatedInstance :: (Int,Int) -> Instance -> Either String Instance
translatedInstance (dx,dy) ins
  | not (all (all (inside c)) shifted) || not (all (inside c) heldShifted) = Left "translation leaves the canvas"
  | any (\obs->either (const True) (const False) (ruleOutput c (insRule ins) obs)) (shifted++[heldShifted]) = Left "translated output leaves the canvas"
  | otherwise = Right ins {insTrain=shifted, insHeld=heldShifted, insNotes=insNotes ins++["translated by "++show (dx,dy)]}
  where c=insCanvas ins
        sh o=o {obX=obX o+dx, obY=obY o+dy}
        shifted=map (map sh) (insTrain ins)
        heldShifted=map sh (insHeld ins)

-- Families. Each generator returns Left with the rejection reason when the
-- sampled instance does not satisfy the family's mechanism conditions.
generateFamily :: Family -> Int -> Either String Instance
generateFamily fam seed=fst (runRand (gen fam) (seed*7919+17))
  where
    finish rule canvas train held notes
      | any (\obs->either (const True) (const False) (ruleOutput canvas rule obs)) (train++[held]) = Left "output outside canvas"
      | otherwise = Right (Instance fam seed canvas rule train held notes)
    gen SeedKey=do
      canvas<-range 16 30; k<-range 1 3; nc<-range 2 3
      ns<-mapM (const (range 2 4)) [1..nc]
      let seedCase n=do
            cols<-distinctColors n
            sz<-mapM (const ((,) <$> range 1 2 <*> range 1 2)) [1..n]
            placeRandom canvas [] [rectOb (0,0) w h c | ((w,h),c)<-zip sz cols] 60
      cases<-mapM seedCase ns
      hn<-range (maximum ns+1) 5
      hcols<-distinctColors hn; hsz<-mapM (const ((,) <$> range 1 2 <*> range 1 2)) [1..hn]
      held<-placeRandom canvas [] [rectOb (0,0) w h c | ((w,h),c)<-zip hsz hcols] 60
      case (sequence cases,held) of
        (Just tr,Just h) | all (strict obX) (tr++[h]) -> pure (finish (MoveRight k) canvas tr h ["distinct colors","X strict","heldout cardinality unseen"])
        (Nothing,_) -> pure (Left "placement failed")
        (_,Nothing) -> pure (Left "heldout placement failed")
        _ -> pure (Left "X not strict")
    gen CompositeKey=do
      canvas<-range 22 30; nc<-range 2 3
      let lattice n=do
            c1<-range 1 4; gap<-range 7 9; r1<-range 1 3; rgap<-range 8 10
            pts<-shuffle [(c1,r1),(c1+gap,r1),(c1,r1+rgap),(c1+gap,r1+rgap),(c1+2*gap,r1)]
            hs<-shuffle [1..5]
            ws<-mapM (const (range 1 3)) [1..n]
            pure [rectOb p w h 5 | (p,h,w)<-zip3 (take n pts) (take n hs) ws]
      ns<-mapM (const (range 3 4)) [1..nc]
      cases<-mapM lattice ns
      held<-lattice 5
      let okCase obs=all (inside canvas) obs && and [separated a b | (i,a)<-zip [0::Int ..] obs, (j,b)<-zip [0..] obs, i<j]
      if not (all okCase (cases++[held])) then pure (Left "lattice objects overlap or leave the canvas")
        else if not (seedKeysAllFail cases) then pure (Left "a seed key explains the training pairing")
        else if not (all (strict obH) (cases++[held])) then pure (Left "heights not strict")
        else if not (any (\obs->not (strict area obs)) cases) then pure (Left "no Area tie")
        else pure (finish StackByHeight canvas cases held ["same color","X/Y ties on the lattice","Area tie","seed keys fail","Height strict"])
    gen RuntimeTrap=do
      canvas<-range 22 30; nc<-pure 2
      let trapCase=do
            n<-range 3 4
            hA<-range 1 2; hB<-range (hA+2) (hA+3)
            let rest=[hB+1..hB+n-2]
            xb<-range 0 2; f<-range 4 6; y0<-range 0 2
            let xa=xb+1
                a=rectOb (xa,y0) 1 hA 5
                b=hookOb (xb,y0) hB f 5
            others<-mapM (\(i,h)->do x<-range 0 (canvas-2); pure (rectOb (x,y0+hB+2+i*2+sum (take i rest)) 1 h 5)) (zip [0..] rest)
            pure (a:b:others)
      cases<-mapM (const trapCase) [1..nc]
      heldN<-range 4 5
      hs<-shuffle [1..6]
      held<-placeRandom canvas [] [rectOb (0,0) 1 h 5 | h<-take heldN hs] 80
      let okCase obs=all (inside canvas) obs && and [separated a b | (i,a)<-zip [0::Int ..] obs, (j,b)<-zip [0..] obs, i<j]
          scanIsHeight obs=sameOrder (scanOrder obs) (heightOrder obs)
      case held of
        Nothing->pure (Left "heldout placement failed")
        Just h
          | not (all okCase cases) -> pure (Left "trap objects overlap or leave the canvas")
          | not (all scanIsHeight cases) -> pure (Left "enumeration order is not the height order")
          | not (seedKeysAllFail cases) -> pure (Left "a seed key explains the training pairing")
          | sameOrder (scanOrder h) (heightOrder h) -> pure (Left "heldout enumeration order equals height order")
          | otherwise -> pure (finish StackByHeight canvas cases h ["enumeration order = height order on training","hook shapes break Lex(Y,X)","heldout breaks enumeration order"])
    gen SizeIndex=do
      canvas<-range 22 30
      let pool=[(2,1),(1,2),(3,1),(1,3),(2,2)]
          -- distinct columns by construction (X must be strict for the X key)
          mkCase n forced=do
            extra<-mapM (const (choose pool)) [1..n-length forced]
            let shapes=forced++extra
            cols<-shuffle [0,4..canvas-8]
            ys<-mapM (const (range 0 (canvas-4))) shapes
            pure (Just [rectOb (x,y) w h 5 | ((w,h),x,y)<-zip3 shapes (take n cols) ys])
      n1<-range 3 4; n2<-range 3 4; nh<-range 4 6
      c1<-mkCase n1 [(2,1),(1,2)]
      -- a duplicated shape in case 2 separates CountShapes from CountObjects
      c2<-mkCase (max n2 4) [(3,1),(1,3),(3,1)]
      h<-mkCase nh [(2,1),(1,2),(2,1)]
      let erased obs=length (nub [obW o*obH o | o<-obs]) -- equal payload <=> equal area for monochrome rectangles
          true obs=length (nub [(obW o,obH o) | o<-obs])
      case (c1,c2,h) of
        (Just a,Just b,Just hh)
          | not (all (strict obX) [a,b,hh]) -> pure (Left "X not strict")
          | not (all (\obs->and [separated p q | (i,p)<-zip [0::Int ..] obs, (j,q)<-zip [0..] obs, i<j]) [a,b,hh]) -> pure (Left "objects touch")
          | not (any (\obs->erased obs/=true obs) [a,b]) -> pure (Left "no accidental payload equality in training")
          | erased hh==true hh -> pure (Left "heldout does not expose the erased count")
          | otherwise -> pure (finish ShiftByShapes canvas [a,b] hh ["same color","payload-equal pairs across size indices","heldout exposes erased count"])
        _ -> pure (Left "placement failed")
    gen FirstItem=do
      canvas<-range 20 30; nc<-range 2 3
      ns<-mapM (const (range 2 4)) [1..nc]
      cases<-mapM (\n->chainCase canvas n True) ns
      hn<-range 3 5
      held<-chainCase canvas hn False
      case (sequence cases,held) of
        (Just tr,Just h) -> pure (finish ChainX canvas tr h ["first item at x=0 in training","heldout first item x>0","distinct colors"])
        _ -> pure (Left "placement failed")
    gen RepeatedPattern=do
      canvas<-range 20 30; nc<-range 2 3
      ns<-mapM (const (range 3 4)) [1..nc]
      cases<-mapM (\n->chainCaseY canvas n) ns
      hn<-range 4 5
      held<-chainCaseY canvas hn
      case (sequence cases,held) of
        (Just tr,Just h) | all (strict obY) (tr++[h]) -> pure (finish ChainY canvas tr h ["chain order is the input Y order","distinct colors"])
        (Just _,Just _) -> pure (Left "Y not strict")
        _ -> pure (Left "placement failed")
    gen OverlapChain=do
      canvas<-range 20 30; nc<-range 2 3
      ns<-mapM (const (range 2 4)) [1..nc]
      let mk n=do
            cols<-distinctColors n
            sz<-mapM (const ((,) <$> range 2 3 <*> range 2 3)) [1..n]
            placeRandom canvas [] [rectOb (0,0) w h c | ((w,h),c)<-zip sz cols] 80
      cases<-mapM mk ns
      hn<-range 3 4
      held<-mk hn
      case (sequence cases,held) of
        (Just tr,Just h) | all (strict obX) (tr++[h]) -> pure (finish OverlapChainX canvas tr h ["overlapping chain: later item overwrites the previous bottom-right cell","distinct colors","NeedConstruct expected"])
        (Just _,Just _) -> pure (Left "X not strict")
        _ -> pure (Left "placement failed")
    chainCase canvas n firstAtZero=do
      cols<-distinctColors n; sz<-mapM (const ((,) <$> range 1 3 <*> range 1 3)) [1..n]
      placed<-placeRandom canvas [] [rectOb (0,0) w h c | ((w,h),c)<-zip sz cols] 80
      case placed of
        Nothing->pure Nothing
        Just obs | not (strict obX obs) -> pure Nothing
                 | otherwise -> do
                     let (firstO:others)=sortOn obX obs
                     fx<-if firstAtZero then pure 0 else range 1 4
                     let moved=firstO {obX=fx}
                     pure (if all (separated moved) others && inside canvas moved && strict obX (moved:others) then Just (moved:others) else Nothing)
    chainCaseY canvas n=do
      cols<-distinctColors n; sz<-mapM (const ((,) <$> range 1 3 <*> range 1 3)) [1..n]
      placed<-placeRandom canvas [] [rectOb (0,0) w h c | ((w,h),c)<-zip sz cols] 80
      pure (case placed of Just obs | obX (head (sortOn obY obs))>0 -> Just obs; _ -> Nothing)

-- Generate the first `want` valid instances from a seed range, keeping the
-- rejection log (seed, reason) for the report.
generateValid :: Family -> Int -> Int -> Int -> ([Instance],[(Int,String)])
generateValid fam base want maxTries=go base 0 [] []
  where go s tries acc rejected
          | length acc>=want || tries>=maxTries = (reverse acc,reverse rejected)
          | otherwise = case generateFamily fam s of
              Right ins->go (s+1) (tries+1) (ins:acc) rejected
              Left why->go (s+1) (tries+1) acc ((s,why):rejected)
familyExpectsTies :: Family -> Bool
familyExpectsTies f=f `elem` [CompositeKey,RuntimeTrap,SizeIndex]
knownFirstItemHypotheses :: Family -> [(String,String)]
knownFirstItemHypotheses FirstItem=[("GridLeft","Atom (SceneLow (Ax AX))"),("CurrentX","Atom (Pos Current (Ax AX))"),("SetMinX","Atom (SetMin (Ax AX))"),("Literal0","Lit 0")]
knownFirstItemHypotheses _=[]
obJSON :: Ob -> String
obJSON o=objectJSON [("x",show (obX o)),("y",show (obY o)),("w",show (obW o)),("h",show (obH o)),("color",show (obColor o))
  ,("cells",arrayJSON [arrayJSON [show i,show j] | (i,j)<-obCells o])]
instanceJSON :: Instance -> String
instanceJSON ins=objectJSON [("family",jsonString (familyName (insFamily ins))),("seed",show (insSeed ins)),("canvas",show (insCanvas ins))
  ,("rule",jsonString (show (insRule ins))),("train",arrayJSON [arrayJSON (map obJSON obs) | obs<-insTrain ins]),("heldout",arrayJSON (map obJSON (insHeld ins)))
  ,("notes",arrayJSON (map jsonString (insNotes ins))),("valid",boolJSON True),("replay",jsonString ("generateFamily "++show (insFamily ins)++" "++show (insSeed ins)++" ; outputs by "++intercalate " " (words (show (insRule ins)))))]
