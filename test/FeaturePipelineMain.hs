module Main where

import Synthesis.FeaturePipeline
import Language.Induced.Base hiding (Construct)
import Latent.Grid
import Latent.Encode (encode)
import qualified Data.Map.Strict as M
import Control.Monad (unless)

assert :: String -> Bool -> IO ()
assert name ok=unless ok (error name) >> putStrLn ("PASS "++name)

grid :: Int -> Int -> [(Int,Int,Int)] -> Grid
grid w h pixels=either error id (gridFromCells (Dimensions w h) 0 [(Coord x y,c) | (x,y,c)<-pixels])

blank :: Int -> Int -> Grid
blank w h=grid w h []

predicts :: Result -> Grid -> Grid -> Bool
predicts r x y=maybe False (\p->runProgram p x==Right y) (program r)

plusOne :: Expr
plusOne=lambda "feature" IntT (either error id (call "add" IntT [variable "feature" IntT,literal (IntV 1)]))

main :: IO ()
main=do
  let identity=synthesize defaultConfig defaultLibrary [(blank 3 4,blank 3 4),(blank 6 5,blank 6 5)]
  assert "1A exact identities across cases" (predicts identity (blank 7 9) (blank 7 9) && transformWork identity==0)
  let swap=synthesize defaultConfig [] [(blank 3 4,blank 4 3),(blank 5 6,blank 6 5)]
  assert "2A cross-feature width/height" (predicts swap (blank 7 9) (blank 9 7)
    && M.lookup CanvasWidth (resolved swap)==Just (Transport CrossIdentity CanvasHeight Nothing))
  let same=synthesize defaultConfig [plusOne] [(blank 3 5,blank 4 6),(blank 7 9,blank 8 10)]
  assert "1B typed program learned and reused" (predicts same (blank 10 12) (blank 11 13) && reusedPrograms same==1)
  let input w h ow=grid w h [(x,0,2) | x<-[0..ow-1]]
      output w h ow=grid w h [(x,0,2) | x<-[0..ow-1]]
      cross=synthesize defaultConfig [plusOne]
        [(input 8 6 2,output 9 3 2),(input 10 9 3,output 11 4 3)]
  assert "2B reuses 1B program on semantic object feature" (predicts cross (input 12 11 4) (output 13 5 4)
    && reusedPrograms cross>=1 && case M.lookup CanvasHeight (resolved cross) of Just (Transport CrossProgram _ _)->True; _->False)
  let corner w h=grid w h [(w-1,h-1,2)]
      built=synthesize defaultConfig defaultLibrary [(blank 4 5,corner 4 5),(blank 7 8,corner 7 8)]
  assert "stage 3 output-wise corner witness generalizes dimensions" (predicts built (blank 9 11) (corner 9 11))
  assert "constructor retained matched dimensions" (M.lookup CanvasWidth (resolved built)==Just (Transport SameIdentity CanvasWidth Nothing))
  let middle w h=grid w h [((w-1) `div` 2,(h-1) `div` 2,3)]
      centered=synthesize defaultConfig [] [(blank 5 7,middle 5 7),(blank 9 11,middle 9 11)]
  assert "case-wise center including even heldout size" (predicts centered (blank 8 10) (middle 8 10))
  let stripe w h=grid w h [(x,h-1,4) | x<-[0..w-1]]
      striped=synthesize defaultConfig [] [(blank 4 5,stripe 4 5),(blank 7 8,stripe 7 8)]
  assert "output-sized rectangle construction" (predicts striped (blank 9 11) (stripe 9 11))
  let contradicted=synthesize defaultConfig [] [(blank 4 5,corner 4 5),(blank 7 8,grid 7 8 [(1,2,2)])]
  assert "witness must fit every output, no single-example coordinates" (program contradicted==Nothing)
  let constant=synthesize defaultConfig [] [(blank 3 4,blank 5 6),(blank 7 8,blank 5 6)]
  assert "shared scalar constants allowed" (predicts constant (blank 9 10) (blank 5 6))
  let capped=synthesize (defaultConfig {transformBudget=3,constructionBudget=3}) defaultLibrary
        [(blank 4 5,corner 4 5),(blank 7 8,corner 7 8)]
  assert "hard search budgets do not overshoot batch" (transformWork capped<=3 && constructionWork capped<=3 && program capped==Nothing)
  let zero=synthesize (defaultConfig {transformBudget=0,constructionBudget=0}) defaultLibrary [(blank 4 5,corner 4 5)]
  assert "zero budget preserves equality but forbids construction" (program zero==Nothing && M.member CanvasWidth (resolved zero))
  let scene=encode (encoder defaultConfig) (grid 5 5 [(0,0,2),(0,3,2)])
  assert "ties are not broken by object index" (case select (Extreme (Just 2) Horizontal False) scene of Left _->True; _->False)
  assert "missing referent rejected" (case select (Unique (Just 9)) scene of Left _->True; _->False)
  let raw=lambda "feature" CoordT (literal (CoordV (Coord 3 4)))
  assert "raw coordinate literals prohibited in transports" (not (validTransport CoordT raw))
  let disguised=lambda "feature" CoordT (either error id (call "coord" CoordT [literal (IntV 3),literal (IntV 4)]))
  assert "constant coordinate construction also prohibited" (not (validTransport CoordT disguised))
  let table=lambda "feature" (ListT PlacedT) (literal (ListV PlacedT []))
  assert "case object literal prohibited" (not (validTransport (ListT PlacedT) table))
  let mismatch=synthesize defaultConfig [plusOne] [(blank 4 5,blank 5 5),(blank 7 8,blank 9 8)]
  assert "a program fitting one case is not accepted" (program mismatch==Nothing)
  assert "empty training specification rejected" (program (synthesize defaultConfig [] [])==Nothing)
  let partial=Program (encoder defaultConfig) (M.singleton Objects (Construct (Rectangles [])))
  assert "prediction cannot access unknown output features" (case runProgram partial (blank 3 4) of Left _->True; _->False)
  let twoCorners w h=grid w h [(0,0,2),(w-1,h-1,3)]
      multi=synthesize defaultConfig [] [(blank 5 7,twoCorners 5 7),(blank 9 11,twoCorners 9 11)]
  assert "all-output witness covers multiple semantic roles" (predicts multi (blank 8 10) (twoCorners 8 10))
  assert "missing input referent fails prediction explicitly" (case program cross of
    Just p->case runProgram p (blank 12 11) of Left _->True; _->False
    _->False)
