"""Create an isolated absolute-place language experiment from current sources."""
import pathlib, shutil

ROOT = pathlib.Path(__file__).resolve().parents[1]
DEST = ROOT / 'experiments/place-only'
DEST.mkdir(parents=True, exist_ok=True)
for name in ['src', 'app']:
    shutil.copytree(ROOT/name, DEST/name, dirs_exist_ok=True)
for name in ['latis.cabal', 'cabal.project']:
    shutil.copy2(ROOT/name, DEST/name)

def edit(name, old, new):
    p = DEST/name
    s = p.read_text(encoding='utf-8')
    assert old in s, (name, old)
    p.write_text(s.replace(old, new), encoding='utf-8')

b = 'src/Language/Induced/Base.hs'
edit(b, 'objectOf poseOf place BBox', 'objectOf BBox')
edit(b, ',("Translate",PositionEffect,"translation-residual","PlacedObject x Vec -> PlacedObject")', ',("place",PositionEffect,"absolute-placement","Object x Coord -> PlacedObject; rotation-distinct geometry")')
edit(b, ',("objectOf",[PlacedT],ObjectT),("poseOf",[PlacedT],PoseT)', ',("objectOf",[PlacedT],ObjectT)')
edit(b, '("place",[ObjectT,PoseT],PlacedT)', '("place",[ObjectT,CoordT],PlacedT)')
edit(b, ',("Translate",[PlacedT,VecT],PlacedT)', '')
edit(b, '  ("poseOf",[PlacedV o])->Right (PoseV (O.position o) (O.orientation o))\n', '')
edit(b, '("place",[ObjectV o,PoseV p r])->Right (PlacedV (o {O.position=p,O.orientation=r}))', '("place",[ObjectV o,CoordV p])->Right (PlacedV (o {O.position=p,O.orientation=0}))')
edit(b, '  ("Translate",[PlacedV o,VecV v])->Right (PlacedV (O.translate o v))\n', '')
edit(b, '-- PlacedT is the grounded Object x Pose adapter. Canonical Scene/Object stay\n-- unchanged: conversion simply moves position/orientation between the factors.', '-- Experimental PlacedT = rotation-distinct local Object x absolute Coord.\n-- Geometry retains its actual orientation; only translation is factored out.')
w = 'src/Synthesis/InducedR2/Witness.hs'
edit(w, '"Translate"->translateWitness', '"place"->placeWitness')
p=DEST/w
s=p.read_text(); start=s.index('    translateWitness='); end=s.index('    orientationWitness=',start)
s=s[:start]+'''    placeWitness=case traverse unplace ys of
      Just pairs->[decomp [child ObjectT (map fst pairs),child CoordT (map snd pairs)]
        "place inverse: output local geometry and absolute origin; no translation template"]
      _->[]
    unplace (PlacedV o)=Just (ObjectV (o {O.position=Coord 0 0,O.orientation=0}),CoordV (O.position o))
    unplace _=Nothing
'''+s[end:]; p.write_text(s)
edit('src/Synthesis/InducedR2/Observers.hs', '[("objectOf",ObjectT),("poseOf",PoseT)]', '[("objectOf",ObjectT)]')
e='src/Synthesis/InducedR2/EffectDomain.hs'
edit(e, 'S.member "Translate" (symbols f)', 'S.member "place" (symbols f)')
p=DEST/e; s=p.read_text(); s=s[s.index('module '):]; p.write_text('-- Absolute place may construct new positions from coordinate algebra.\n'+s)
print(DEST)
