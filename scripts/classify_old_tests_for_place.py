"""Classify the old test suites for applicability to the place language.
Old suites were written for the Translate-bearing Base. A suite that references
Translate/poseOf is NOT claimed to pass here; this script only records the
classification so the report cannot make a blanket 'all old tests pass' claim."""
import json, pathlib, re
ROOT = pathlib.Path(__file__).resolve().parents[1]
rows = []
for p in sorted((ROOT / 'test').glob('*.hs')):
    text = p.read_text(encoding='utf-8')
    uses = sorted({m for m in re.findall(r'\b(Translate|poseOf|PoseT|PoseV)\b', text)})
    imports_induced = bool(re.search(r'Synthesis\.Induced(R1|R2)?\.|Language\.Induced', text))
    if not imports_induced:
        cls = 'not-applicable (legacy v0.1/v0.2/v0.3 search, not the induced Base language)'
    elif uses:
        cls = 'needs-rewrite (references removed Translate/poseOf symbols; not run for place)'
    else:
        cls = 'applicable-in-principle (induced Base without Translate references; not part of this round)'
    rows.append({'suite': p.name, 'removed_symbols_referenced': uses, 'classification': cls})
rows.append({'suite': 'experiments/place-only/CheckPlace.hs', 'removed_symbols_referenced': [], 'classification': 'applicable (place registry/semantics check; run and passing for place-demand Base, which is unchanged)'})
rows.append({'suite': 'experiments/place-demand/test/PlaceDemandMain.hs', 'removed_symbols_referenced': [], 'classification': 'new (phase A/B semantic tests; run and passing)'})
out = ROOT / 'results/place-demand/old_test_classification.json'
out.parent.mkdir(parents=True, exist_ok=True)
out.write_text(json.dumps(rows, indent=2, ensure_ascii=False) + '\n', encoding='utf-8')
for r in rows: print(r['suite'], '|', r['removed_symbols_referenced'], '|', r['classification'])
