{-# LANGUAGE GADTs #-}
module Latent.Program where
import Latent.Grid
import Latent.Object
import Latent.Local.Grammar
import Latent.Local.Decode
import Latent.Global.Grammar
import Latent.Global.Encode
import Latent.Fusion.Context
import Synthesis.Skeleton (Order,orderObjects)
import Synthesis.Hole (Anchor(..),observe)
import qualified Data.Set as S

-- The two evaluators use the same typed arithmetic. The grounded expansion
-- exposes all observation work instead of giving Z0 free latent observers.
data Expr a where
  CurrentPosition :: Expr Coord
  FirstPosition :: Expr Coord
  BBoxCorner :: Anchor -> Expr Coord
  PairStep :: Expr Vec
  SequenceStep :: Expr Vec
  LocalDelta :: Expr Vec
  GlobalStep :: Expr Vec
  AxisDisplacement :: AxisType -> Expr Vec
  Plus :: Expr Coord -> Expr Vec -> Expr Coord
  Minus :: Expr Coord -> Expr Coord -> Expr Vec
  Times :: Int -> Expr Vec -> Expr Vec
  RankTimes :: Expr Vec -> Expr Vec
  Swap :: Expr Vec -> Expr Vec
instance Show (Expr a) where show = exprText
newtype LatentProgram = PlaceEach (Expr Coord)
instance Show LatentProgram where show (PlaceEach p) = "MapPose(current, " ++ exprText p ++ ")"

exprText :: Expr a -> String
exprText CurrentPosition = "TL(current_object)"
exprText FirstPosition = "local.first_position"
exprText (BBoxCorner a) = "global_bbox." ++ show a
exprText PairStep = "pairwise.first_delta"
exprText SequenceStep = "sequence_step"
exprText LocalDelta = "local_delta"
exprText GlobalStep = "global.sequence_step"
exprText (AxisDisplacement a) = "Displacement(global_axis." ++ show a ++ ", current_object)"
exprText (Plus a b) = "Add(" ++ exprText a ++ "," ++ exprText b ++ ")"
exprText (Minus a b) = "Subtract(" ++ exprText a ++ "," ++ exprText b ++ ")"
exprText (Times n a) = "Scale(" ++ show n ++ "," ++ exprText a ++ ")"
exprText (RankTimes a) = "Scale(local.rank," ++ exprText a ++ ")"
exprText (Swap a) = "SwapXY(" ++ exprText a ++ ")"
exprLength :: Expr a -> Int
exprLength (Plus a b) = 1+exprLength a+exprLength b
exprLength (Minus a b) = 1+exprLength a+exprLength b
exprLength (Times _ a) = 2+exprLength a
exprLength (RankTimes a) = 2+exprLength a
exprLength (Swap a) = 1+exprLength a
exprLength _ = 1
exprSymbols :: Expr a -> S.Set String
exprSymbols (Plus a b) = S.insert "Add" (exprSymbols a `S.union` exprSymbols b)
exprSymbols (Minus a b) = S.insert "Subtract" (exprSymbols a `S.union` exprSymbols b)
exprSymbols (Times _ a) = S.insert "Scale" (exprSymbols a)
exprSymbols (RankTimes a) = S.insert "Rank" (S.insert "Scale" (exprSymbols a))
exprSymbols (Swap a) = S.insert "SwapXY" (exprSymbols a)
exprSymbols CurrentPosition = S.singleton "TL"
exprSymbols FirstPosition = S.singleton "LocalFirst"
exprSymbols (BBoxCorner _) = S.singleton "GlobalBBox"
exprSymbols PairStep = S.singleton "PairDelta"
exprSymbols SequenceStep = S.singleton "SequenceDelta"
exprSymbols LocalDelta = S.singleton "LocalDelta"
exprSymbols GlobalStep = S.singleton "GlobalStep"
exprSymbols (AxisDisplacement a) = S.fromList ["AxisMove",show a]
exprNeeds :: Expr a -> S.Set String
exprNeeds CurrentPosition = S.empty
exprNeeds FirstPosition = S.singleton "local"
exprNeeds (BBoxCorner _) = S.singleton "bbox"
exprNeeds PairStep = S.singleton "pair"
exprNeeds SequenceStep = S.singleton "progression"
exprNeeds LocalDelta = S.singleton "relative"
exprNeeds GlobalStep = S.singleton "global_progression"
exprNeeds (AxisDisplacement a) = S.singleton ("axis:"++show a)
exprNeeds (Plus a b) = exprNeeds a `S.union` exprNeeds b
exprNeeds (Minus a b) = exprNeeds a `S.union` exprNeeds b
exprNeeds (Times _ a) = exprNeeds a
exprNeeds (RankTimes a) = S.insert "local" (exprNeeds a)
exprNeeds (Swap a) = exprNeeds a
capabilities :: LatentSpec -> S.Set String
capabilities (Local a) = S.fromList ("local":"pair":case a of
  RelativePose _ -> ["relative"]; Progression _ -> ["progression","relative"]
  Pairwise _ _ _ -> []; SharedClass _ -> [])
capabilities (Global a) = S.fromList (case a of
  SceneBBox -> ["bbox"]; Axis b -> ["axis:"++show b]
  Symmetry b -> ["axis:"++show b]; Repetition _ -> ["global_progression"]
  _ -> [])
capabilities (Fused a b) = capabilities (Local a) `S.union` capabilities (Global b)
allowed :: LatentSpec -> LatentProgram -> Bool
allowed spec (PlaceEach p) = exprNeeds p `S.isSubsetOf` capabilities spec

data EvalContext = EvalContext FusionContext Object Int [Object]
evalExpr :: EvalContext -> Expr a -> Either String a
evalExpr (EvalContext _ o _ _) CurrentPosition = Right (position o)
evalExpr (EvalContext c _ _ _) FirstPosition = needLocal c >>= localObjects >>= \os -> position <$> at "seed" os 0
evalExpr (EvalContext c _ _ _) (BBoxCorner a) = do
  g <- maybe (Left "Inactive global latent") Right (global c)
  box <- case globalFact g of BoundingBox b -> Right b; _ -> Left "Active hypothesis does not bind bbox"
  pure (boxAnchor a box)
evalExpr (EvalContext c _ _ _) PairStep = do
  z <- needLocal c
  case poseCode z of
    PairwiseCode _ _ _ (d:_) -> Right d
    _ -> do os <- localObjects z; a <- at "pair seed" os 0; b <- at "pair next" os 1
            pure (difference (position b) (position a))
evalExpr (EvalContext c _ _ _) SequenceStep = do
  z <- needLocal c
  case poseCode z of ProgressionCode _ d _ -> Right d; _ -> Left "Missing witnessed progression"
evalExpr (EvalContext c _ i _) LocalDelta = do
  z <- needLocal c
  case poseCode z of
    RelativeCode _ ds -> at "delta" (Vec 0 0:ds) i
    ProgressionCode _ d _ -> Right (if i==0 then Vec 0 0 else d)
    _ -> Left "Missing active relative coordinates"
evalExpr (EvalContext c _ _ _) GlobalStep = do
  g <- maybe (Left "Inactive global latent") Right (global c)
  case globalFact g of Repeated _ d _ -> Right d; _ -> Left "Missing global repetition"
evalExpr (EvalContext c o _ _) (AxisDisplacement axis) = do
  g <- maybe (Left "Inactive axis") Right (global c)
  k <- case globalFact g of
    AxisAt a n | a==axis -> Right n
    Symmetric a n | a==axis -> Right n
    _ -> Left "Axis type does not match active hypothesis"
  pure (axisMove axis k o)
evalExpr c (Plus a b) = add <$> evalExpr c a <*> evalExpr c b
evalExpr c (Minus a b) = difference <$> evalExpr c a <*> evalExpr c b
evalExpr c (Times n a) = scale n <$> evalExpr c a
evalExpr c@(EvalContext _ _ i _) (RankTimes a) = scale i <$> evalExpr c a
evalExpr c (Swap a) = (\(Vec x y) -> Vec y x) <$> evalExpr c a
needLocal :: FusionContext -> Either String LocalLatent
needLocal = maybe (Left "Inactive local latent") Right . local
boxAnchor :: Anchor -> BBox -> Coord
boxAnchor TL = topLeft
boxAnchor BR = bottomRight
boxAnchor TR = \(BBox a b) -> Coord (cx b) (cy a)
boxAnchor BL = \(BBox a b) -> Coord (cx a) (cy b)
boxAnchor Center = \(BBox a b) -> Coord ((cx a+cx b) `div` 2) ((cy a+cy b) `div` 2)
axisMove :: AxisType -> Int -> Object -> Vec
axisMove Vertical k o = Vec (k-cx (tl o)-cx (br o)) 0
axisMove Horizontal k o = Vec 0 (k-cy (tl o)-cy (br o))
axisMove Diagonal k o = difference (reflectPixel Diagonal k (position o)) (position o)
axisMove AntiDiagonal k o = difference (reflectPixel AntiDiagonal k (position o)) (position o)

runLatent :: LatentSpec -> LatentProgram -> Scene -> Either String Scene
runLatent spec p scene
  | not (allowed spec p) = Left "Expression references symbols outside active latent hypothesis"
  | otherwise = encodeFusion spec scene >>= transformFusion spec p >>= decodeFusion

-- P1: ZF -> ZF. D is invoked only after the secondary state has been updated.
transformFusion :: LatentSpec -> LatentProgram -> FusionContext -> Either String FusionContext
transformFusion spec p@(PlaceEach expression) context
  | not (allowed spec p) = Left "Inactive secondary symbols"
  | otherwise = do
      let scene=canonical context
      os <- maybe (Right (objects scene)) localObjects (local context)
      ps <- sequence [evalExpr (EvalContext context o i os) expression | (i,o) <- zip [0..] os]
      case local context of
        Just l -> do updated<-setLocalPoses ps l; pure context {local=Just updated}
        Nothing -> case global context of
          Just g -> let updated=(groundedResidual g) {objects=zipWith (\o q -> translate o (difference q (position o))) os ps}
                    in Right context {global=Just g {groundedResidual=updated}}
          Nothing -> Left "No active secondary representation"

-- A real executable Z0 reference AST. There are no local/global latent leaves
-- in this language. Repeated source observations are charged as AST nodes.
data GroundExpr a where
  GObjects :: GroundExpr [Object]
  GSort :: Order -> GroundExpr [Object] -> GroundExpr [Object]
  GAt :: Int -> GroundExpr [Object] -> GroundExpr Object
  GCurrent :: GroundExpr Object
  GObserve :: Anchor -> GroundExpr Object -> GroundExpr Coord
  GMin :: Bool -> GroundExpr [Object] -> GroundExpr Int
  GMax :: Bool -> GroundExpr [Object] -> GroundExpr Int
  GCoord :: GroundExpr Int -> GroundExpr Int -> GroundExpr Coord
  GPlus :: GroundExpr Coord -> GroundExpr Vec -> GroundExpr Coord
  GMinus :: GroundExpr Coord -> GroundExpr Coord -> GroundExpr Vec
  GTimes :: Int -> GroundExpr Vec -> GroundExpr Vec
  GRankTimes :: Order -> GroundExpr Vec -> GroundExpr Vec
  GSwap :: GroundExpr Vec -> GroundExpr Vec
  GAxisMove :: AxisType -> GroundExpr Int -> GroundExpr Object -> GroundExpr Vec
  GIntAdd :: GroundExpr Int -> GroundExpr Int -> GroundExpr Int
  GIntSub :: GroundExpr Int -> GroundExpr Int -> GroundExpr Int
  GHalf :: GroundExpr Int -> GroundExpr Int
  GLocalDelta :: Order -> GroundExpr Vec

groundOrder :: LatentSpec -> Order
groundOrder (Local a) = encodingOrder a
groundOrder (Fused a _) = encodingOrder a
groundOrder (Global (Repetition o)) = o
groundOrder _ = read "ExtractionOrder"
expand :: LatentSpec -> Expr a -> GroundExpr a
expand spec expr = case expr of
  CurrentPosition -> GObserve TL GCurrent
  FirstPosition -> pos 0 TL
  PairStep -> case spec of
    Local (Pairwise _ a b) -> GMinus (pos 1 a) (pos 0 b)
    Fused (Pairwise _ a b) _ -> GMinus (pos 1 a) (pos 0 b)
    _ -> GMinus (pos 1 TL) (pos 0 TL)
  SequenceStep -> GMinus (pos 1 TL) (pos 0 TL)
  GlobalStep -> GMinus (pos 1 TL) (pos 0 TL)
  LocalDelta -> GLocalDelta order
  BBoxCorner a -> case a of
    TL -> GCoord minX minY; TR -> GCoord maxX minY
    BL -> GCoord minX maxY; BR -> GCoord maxX maxY
    Center -> GCoord (GHalf (GIntAdd minX maxX)) (GHalf (GIntAdd minY maxY))
  AxisDisplacement a -> GAxisMove a (case a of
    Vertical -> GIntAdd minX maxX; Horizontal -> GIntAdd minY maxY
    Diagonal -> GIntSub minY minX; AntiDiagonal -> GIntAdd minX maxY) GCurrent
  Plus a b -> GPlus (expand spec a) (expand spec b)
  Minus a b -> GMinus (expand spec a) (expand spec b)
  Times n a -> GTimes n (expand spec a)
  RankTimes a -> GRankTimes order (expand spec a)
  Swap a -> GSwap (expand spec a)
  where order=groundOrder spec
        pos i a=GObserve a (GAt i (GSort order GObjects))
        minX=GMin True GObjects; minY=GMin False GObjects
        maxX=GMax True GObjects; maxY=GMax False GObjects

evalGround :: Scene -> Object -> GroundExpr a -> Either String a
evalGround scene o e = case e of
  GObjects -> Right (objects scene)
  GSort order x -> orderObjects order <$> go x
  GAt i x -> go x >>= \os -> at "grounded index" os i
  GCurrent -> Right o
  GObserve a x -> observe a <$> go x
  GMin isX x -> go x >>= nonempty >>= \os -> Right (minimum (map ((if isX then cx else cy) . tl) os))
  GMax isX x -> go x >>= nonempty >>= \os -> Right (maximum (map ((if isX then cx else cy) . br) os))
  GCoord x y -> Coord <$> go x <*> go y
  GPlus a b -> add <$> go a <*> go b
  GMinus a b -> difference <$> go a <*> go b
  GTimes n x -> scale n <$> go x
  GRankTimes order x -> do
    i <- rank order
    scale i <$> go x
  GSwap x -> (\(Vec a b) -> Vec b a) <$> go x
  GAxisMove a x obj -> axisMove a <$> go x <*> go obj
  GIntAdd a b -> (+) <$> go a <*> go b
  GIntSub a b -> (-) <$> go a <*> go b
  GHalf x -> (`div` 2) <$> go x
  GLocalDelta order -> do
    i <- rank order
    let os=orderObjects order (objects scene)
    if i==0 then Right (Vec 0 0) else difference <$> (position <$> at "delta current" os i) <*> (position <$> at "delta previous" os (i-1))
  where go :: GroundExpr b -> Either String b
        go=evalGround scene o
        nonempty []=Left "Empty grounded aggregate"
        nonempty xs=Right xs
        rank order=case [i | (i,a)<-zip [0..] (orderObjects order (objects scene)),objectId a==objectId o] of
          [i]->Right i; _->Left "Invalid canonical rank"
runGround :: GroundExpr Coord -> Scene -> Either String Scene
runGround p scene = do
  ps <- traverse (\o -> evalGround scene o p) (objects scene)
  pure scene {objects=zipWith (\o q -> translate o (difference q (position o))) (objects scene) ps}

groundText :: GroundExpr a -> String
groundText e = case e of
  GObjects -> "Objects"; GCurrent -> "current"
  GSort o x -> "Sort("++show o++","++go x++")"
  GAt i x -> "At("++show i++","++go x++")"
  GObserve a x -> show a++"("++go x++")"
  GMin x os -> "Min(Map("++(if x then "X.TL" else "Y.TL")++","++go os++"))"
  GMax x os -> "Max(Map("++(if x then "X.BR" else "Y.BR")++","++go os++"))"
  GCoord a b -> "Coord("++go a++","++go b++")"
  GPlus a b -> "Add("++go a++","++go b++")"
  GMinus a b -> "Subtract("++go a++","++go b++")"
  GTimes n a -> "Scale("++show n++","++go a++")"
  GRankTimes o a -> "Scale(Rank("++show o++",Objects,current),"++go a++")"
  GSwap a -> "SwapXY("++go a++")"
  GAxisMove a k o -> "AxisMove("++show a++","++go k++","++go o++")"
  GIntAdd a b -> "AddInt("++go a++","++go b++")"
  GIntSub a b -> "SubInt("++go a++","++go b++")"
  GHalf a -> "Half("++go a++")"
  GLocalDelta o -> "Subtract(TL(At(Rank-1,Sort("++show o++",Objects))),TL(current)) [current minus previous; zero seed]"
  where go :: GroundExpr b -> String
        go=groundText
groundLength :: GroundExpr a -> Int
groundLength e = case e of
  GObjects -> 1; GCurrent -> 1
  GSort _ x -> 2+go x; GAt _ x -> 2+go x; GObserve _ x -> 1+go x
  GMin _ x -> 4+go x; GMax _ x -> 4+go x
  GCoord a b -> 1+go a+go b; GPlus a b -> 1+go a+go b; GMinus a b -> 1+go a+go b
  GTimes _ a -> 2+go a; GRankTimes _ a -> 5+go a
  GSwap a -> 1+go a; GAxisMove _ a b -> 2+go a+go b
  GIntAdd a b -> 1+go a+go b; GIntSub a b -> 1+go a+go b; GHalf a -> 1+go a
  GLocalDelta _ -> 19
  where go :: GroundExpr b -> Int
        go=groundLength
groundSymbols :: GroundExpr a -> S.Set String
groundSymbols e = case e of
  GObjects -> one "Objects"; GCurrent -> one "current"
  GSort o x -> S.fromList ["Sort",show o] `S.union` go x
  GAt _ x -> one "At" `S.union` go x
  GObserve a x -> one (show a) `S.union` go x
  GMin _ x -> S.fromList ["Min","Map","TL","CoordProjection"] `S.union` go x
  GMax _ x -> S.fromList ["Max","Map","BR","CoordProjection"] `S.union` go x
  GCoord a b -> two "Coord" a b
  GPlus a b -> two "Add" a b; GMinus a b -> two "Subtract" a b
  GTimes _ a -> one "Scale" `S.union` go a
  GRankTimes o a -> S.fromList ["Scale","Rank",show o,"Objects","current"] `S.union` go a
  GSwap a -> one "SwapXY" `S.union` go a
  GAxisMove a k o -> S.fromList ["AxisMove",show a] `S.union` go k `S.union` go o
  GIntAdd a b -> two "AddInt" a b; GIntSub a b -> two "SubInt" a b
  GHalf a -> one "Half" `S.union` go a
  GLocalDelta o -> S.fromList ["Subtract","TL","At","Rank","Sort",show o,"Objects","current","if","zero"]
  where one=S.singleton
        go :: GroundExpr b -> S.Set String
        go=groundSymbols
        two :: String -> GroundExpr b -> GroundExpr c -> S.Set String
        two name a b=one name `S.union` go a `S.union` go b
