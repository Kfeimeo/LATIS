"""Post-search certificates; never imported by the solver."""
from pathlib import Path
root=Path(__file__).resolve().parents[1]
s=(root/'scripts/v03r2_base_certificates.hs').read_text()
s=s.replace('move o v=p "Translate" PlacedT [o,v]', 'move o v=p "place" PlacedT [p "objectOf" ObjectT [o],p "coordAdd" CoordT [anchor 0 o,v]]')
s=s.replace('results/v03r2/base_certificates.json','results/place-only/base_certificates.json')
s=s.replace('references=[("C-scene-axis",reflection "x")','references=[("A-absolute-relative",relative),("B-repeated-progression",progression),("I-equivalent-representations",relative),("C-scene-axis",reflection "x")')
idx=s.index('predict program input=')
s=s[:idx]+'''relative=finish (p "map" (ListT PlacedT) [lambda "obj" PlacedT (move obj (delta (anchor 4 second) (anchor 2 first))),xs])
progression=finish (p "map" (ListT PlacedT) [lambda "obj" PlacedT (move obj (delta (anchor 0 obj) (anchor 2 first))),xs])

'''+s[idx:]
(root/'experiments/place-only/ExpressibilityAudit.hs').write_text(s)
