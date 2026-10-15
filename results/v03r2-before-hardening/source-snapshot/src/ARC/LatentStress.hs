module ARC.LatentStress where
import ARC.Dataset
import Latent.Grid
import Latent.Object
import Latent.Render
import qualified Data.Map.Strict as M

-- Independent fixture equations, not the latent interpreter. Each task has
-- two examples plus a third with changed coordinates/colors/count held out.
latentStressTasks :: [Task]
latentStressTasks =
  [ make "A-absolute-relative" irregular (\os -> let a=os!!0; b=os!!1
        in map (\o -> o {position=Coord (cx (position o)+cx (position b)-cx (position a))
                                      (cy (position o)+cy (position b)-cy (position a))}) os)
  , make "B-repeated-progression" progressions (\os -> let start=position (os!!0); step=difference (position (os!!1)) start
        in [o {position=add start (mul (2*i) step)} | (i,o)<-zip [0..] os])
  , make "C-scene-axis" axisScenes reflectX
  , make "D-object-sufficient" irregular id
  , make "E-local-better" irregular (\os -> let a=os!!0; b=os!!1; dx=cx (position b)-cx (position a); dy=cy (position b)-cy (position a)
        in map (\o -> o {position=Coord (cx (position o)+dy) (cy (position o)+dx)}) os)
  , make "F-global-better" axisScenes reflectY
  , make "G-fusion" fusionScenes (\os -> let start=Coord (minimum (map (cx . tl) os)) (minimum (map (cy . tl) os))
                                             d=difference (position (os!!1)) (position (os!!0))
                                         in [o {position=add start (mul i d)} | (i,o)<-zip [0..] os])
  , make "H-overfitting-trap" trapScenes (\os -> let dx=if cx (position (os!!0))==2 then 3 else 7
                                               in map (\o -> o {position=Coord (cx (position o)+dx) (cy (position o))}) os)
  , make "I-equivalent-representations" progressions (\os -> let d=difference (position (os!!1)) (position (os!!0))
                                                           in map (\o -> o {position=add (position o) d}) os)
  , make "J-no-useful-abstraction" irregular (map (\o -> o {position=Coord (cx (position o)+1) (cy (position o))}))]
  where
    point i c x y=Object i (Coord x y) (M.fromList [(Coord 0 a,c) | a<-[0..i]]) 0
    block i c x y w h=Object i (Coord x y) (M.fromList [(Coord a b,c) | a<-[0..w-1],b<-[0..h-1]]) 0
    irregular=[[point 0 1 x y,point 1 3 (x+dx) (y+dy),point 2 6 (x+9) (y+5)]
      | (x,y,dx,dy)<-[(2,3,2,1),(4,2,3,2),(3,4,4,1)]]
    progressions=[[point i (i+1) (x+i*dx) (y+i*dy) | i<-[0..n-1]]
      | (x,y,dx,dy,n)<-[(2,3,2,2,3),(4,2,3,1,3),(1,4,2,1,4)]]
    axisScenes=[[block 0 1 x y 2 1,block 1 3 (x+5) (y+4) 1 2,block 2 6 (x+10) (y+1) 3 1]
      | (x,y)<-[(2,3),(4,5),(1,7)]]
    fusionScenes=[[point 0 1 x y,point 1 3 (x+dx) (y+dy),point 2 6 (x-5) (y+8)]
      | (x,y,dx,dy)<-[(8,6,2,2),(10,4,3,1),(7,8,4,2)]]
    trapScenes=[[point 0 1 x 3,point 1 3 (x+d) 3,point 2 6 (x+10) 7]
      | (x,d)<-[(2,3),(3,5),(4,4)]]
    reflectX os=let k=minimum (map (cx . tl) os)+maximum (map (cx . br) os)
                in [o {position=Coord (k-cx (br o)) (cy (tl o))} | o<-os]
    reflectY os=let k=minimum (map (cy . tl) os)+maximum (map (cy . br) os)
                in [o {position=Coord (cx (tl o)) (k-cy (br o))} | o<-os]
    mul n (Vec a b)=Vec (n*a) (n*b)
    make name inputs transform=let pairs=[(grid os,grid (transform os)) | os<-inputs]
                              in Task name (take 2 pairs) [TestPair x (Just y) | (x,y)<-drop 2 pairs]
    grid os=either error id (render (Scene (Dimensions 30 30) 0 os))
