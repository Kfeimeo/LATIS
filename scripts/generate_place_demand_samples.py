"""Independent out-of-instance sample generator for the place-demand round.

The generator shares NO code with the solver: it renders scenes to grids with
its own raster code and re-decodes every grid with its own 4-connected
component extraction to check that the intended objects are recoverable.
Rules are stated as functions of the INPUT GRID ONLY, using raster order of
components (the only object order a solver can observe), never hidden ids.
Fixed seeds; the manifest (with SHA-256 of every task file) is frozen before
any solver tuning. Splits:
  dev             : same rules as original stress A/B/I, used during development
  audit-same-rule : same rules, new instances; scored only after freezing
  audit-unseen    : compositional rules absent from the original stress suite
"""
import hashlib, json, pathlib, random, sys
ROOT = pathlib.Path(__file__).resolve().parents[1]
OUT = ROOT / 'data/place-demand-generated'

SHAPES = {  # small 4-connected shapes as relative cells (x,y)
    'dot': [(0,0)], 'vbar2': [(0,0),(0,1)], 'vbar3': [(0,0),(0,1),(0,2)], 'hbar2': [(0,0),(1,0)], 'hbar3': [(0,0),(1,0),(2,0)],
    'L': [(0,0),(0,1),(1,1)], 'J': [(1,0),(1,1),(0,1)], 'T': [(0,0),(1,0),(2,0),(1,1)], 'sq': [(0,0),(1,0),(0,1),(1,1)], 'z': [(0,0),(1,0),(1,1),(2,1)],
}

def render(w, h, objects):
    g = [[0]*w for _ in range(h)]
    for (x, y), cells, color in objects:
        for dx, dy in cells:
            assert 0 <= x+dx < w and 0 <= y+dy < h, 'object outside canvas'
            assert g[y+dy][x+dx] == 0, 'object overlap'
            g[y+dy][x+dx] = color
    return g

def components(g):
    """Independent raster-order 4-connected same-color component extraction."""
    h, w = len(g), len(g[0]); seen = set(); out = []
    for y in range(h):
        for x in range(w):
            if g[y][x] and (x, y) not in seen:
                c = g[y][x]; stack = [(x, y)]; comp = set()
                while stack:
                    px, py = stack.pop()
                    if (px, py) in comp or not (0 <= px < w and 0 <= py < h) or g[py][px] != c: continue
                    comp.add((px, py)); stack += [(px+1, py), (px-1, py), (px, py+1), (px, py-1)]
                seen |= comp
                ox, oy = min(p[0] for p in comp), min(p[1] for p in comp)
                out.append(((ox, oy), tuple(sorted((px-ox, py-oy) for px, py in comp)), c))
    return out

def well_separated(objects):
    cells = []
    for (x, y), shape, _ in objects:
        cells.append({(x+dx, y+dy) for dx, dy in shape})
    for i in range(len(cells)):
        for j in range(i+1, len(cells)):
            for (ax, ay) in cells[i]:
                for (bx, by) in cells[j]:
                    if max(abs(ax-bx), abs(ay-by)) <= 1: return False
    return True

def valid_scene(w, h, objects):
    try:
        g = render(w, h, objects)
    except AssertionError:
        return None
    if not well_separated(objects): return None
    decoded = components(g)
    intended = sorted(((x, y), tuple(sorted(s)), c) for (x, y), s, c in objects)
    if sorted(decoded) != intended: return None
    return g

# ---- rules: functions of the raster-ordered object list of the INPUT --------
def tl(o): return o[0]
def vec(a, b): return (a[0]-b[0], a[1]-b[1])
def move(o, v): return ((o[0][0]+v[0], o[0][1]+v[1]), o[1], o[2])
def rule_relative(objs):      # original A/I: every object moved by TL(second)-TL(first)
    d = vec(tl(objs[1]), tl(objs[0])); return [move(o, d) for o in objs]
def rule_progression(objs):   # original B: object i at start + 2*i*step
    s = tl(objs[0]); d = vec(tl(objs[1]), s)
    return [((s[0]+2*i*d[0], s[1]+2*i*d[1]), o[1], o[2]) for i, o in enumerate(objs)]
def rule_negated(objs):       # unseen: moved by TL(first)-TL(second)
    d = vec(tl(objs[0]), tl(objs[1])); return [move(o, d) for o in objs]
def rule_double(objs):        # unseen: moved by 2*(TL(second)-TL(first))
    d = vec(tl(objs[1]), tl(objs[0])); return [move(o, (2*d[0], 2*d[1])) for o in objs]
def rule_xalign(objs):        # unseen: x aligned to first object's x, y kept
    x0 = tl(objs[0])[0]; return [((x0, o[0][1]), o[1], o[2]) for o in objs]
def _chain(order, seed_shift):
    out = []; prev = None
    for o in order:
        if prev is None: pos = (o[0][0]+seed_shift[0], o[0][1]+seed_shift[1])
        else:
            (px, py), pshape, _ = prev; w = max(dx for dx, _ in pshape)+1; h = max(dy for _, dy in pshape)+1
            pos = (px+w-1+1, py+h-1+1)
        prev = (pos, o[1], o[2]); out.append(prev)
    return out
def rule_seedshift_x(objs):   # round-2 non-local: sort by TL x; first object moves by (2,1); each next sits at previous BR + (1,1)
    return _chain(sorted(objs, key=lambda o: (o[0][0], o[0][1])), (2, 1))
def rule_seedshift_y(objs):   # same with sort by TL y and seed shift (1,3)
    return _chain(sorted(objs, key=lambda o: (o[0][1], o[0][0])), (1, 3))
def rule_mirror_relative(objs):  # round-2 new structure: moved by (-dx, dy) where (dx,dy)=TL(second)-TL(first)
    d = vec(tl(objs[1]), tl(objs[0])); return [move(o, (-d[0], d[1])) for o in objs]
RULES = {'relative': rule_relative, 'progression': rule_progression, 'negated': rule_negated, 'double': rule_double, 'xalign': rule_xalign,
         'seedshift_x': rule_seedshift_x, 'seedshift_y': rule_seedshift_y, 'mirror_relative': rule_mirror_relative}

def sample_scene(rng, rule, w, h, n, confusable=False):
    """Random input scene satisfying the rule's preconditions; returns (input objects, output objects)."""
    for _ in range(4000):
        colors = rng.sample(range(1, 10), n)
        objs = []
        if rule == 'progression':
            # precondition of the progression rule (as in original stress B): the
            # INPUT objects already form an arithmetic progression start + i*step
            sx, sy = rng.randrange(0, w//3), rng.randrange(0, h//3)
            dx, dy = rng.randrange(-4, 5), rng.randrange(-4, 5)
            if (dx, dy) == (0, 0) or (dx < 0 and sx < 4) or (dy < 0 and sy < 4): continue
            for i in range(n):
                shape = SHAPES[rng.choice(list(SHAPES))]
                objs.append(((sx+i*dx, sy+i*dy), tuple(shape), colors[i]))
        else:
            for i in range(n):
                shape = SHAPES[rng.choice(list(SHAPES))]
                x, y = rng.randrange(0, w-3), rng.randrange(0, h-3)
                objs.append(((x, y), tuple(shape), colors[i]))
        if confusable and rule == 'relative':
            # TL(second)-TL(first) == TL(first): absolute coordinate of the first object equals the displacement
            (ax, ay), s0, c0 = objs[0]
            ax, ay = rng.randrange(1, max(2, w//4)), rng.randrange(1, max(2, h//4))
            objs[0] = ((ax, ay), s0, c0); objs[1] = ((2*ax, 2*ay), objs[1][1], objs[1][2])
        gin = valid_scene(w, h, objs)
        if gin is None: continue
        inp = components(gin)                      # raster order, as a solver would observe it
        out = RULES[rule](inp)
        gout = valid_scene(w, h, out)
        if gout is None: continue
        if gin == gout: continue                   # identity examples carry no information
        if rule in ('relative', 'mirror_relative') and (vec(tl(inp[1]), tl(inp[0])) == (0, 0) or (rule == 'mirror_relative' and vec(tl(inp[1]), tl(inp[0]))[0] == 0)): continue
        if rule in ('seedshift_x', 'seedshift_y'):
            key = (lambda o: (o[0][0], o[0][1])) if rule == 'seedshift_x' else (lambda o: (o[0][1], o[0][0]))
            ks = [key(o) for o in inp]
            if len(set(k[0] for k in ks)) != len(ks): continue   # sort key must be strict so the order is unambiguous
        if rule == 'progression':
            step = vec(tl(inp[1]), tl(inp[0]))
            if step == (0, 0) or any(vec(tl(inp[i]), tl(inp[0])) != (i*step[0], i*step[1]) for i in range(n)): continue
        return gin, gout, inp
    raise RuntimeError(f'could not sample a valid scene for {rule} {w}x{h} n={n}')

def make_task(rng, rule, sizes, counts, confusable_train=False):
    pairs = []
    for k, ((w, h), n) in enumerate(zip(sizes, counts)):
        conf = confusable_train and k < len(sizes)-1
        gin, gout, inp = sample_scene(rng, rule, w, h, n, confusable=conf)
        if confusable_train and k == len(sizes)-1:
            # the heldout example must break the training coincidence
            while vec(tl(inp[1]), tl(inp[0])) == tl(inp[0]):
                gin, gout, inp = sample_scene(rng, rule, w, h, n)
        pairs.append({'input': gin, 'output': gout})
    return {'train': pairs[:-1], 'test': [pairs[-1]]}

def main():
    OUT.mkdir(parents=True, exist_ok=True)
    if '--round2' in sys.argv: return main_round2()
    rng = random.Random(20261017)
    specs = []  # (name, rule, sizes, counts, confusable)
    specs += [(f'dev-relative-{i}', 'relative', [(16+2*i, 14+3*i), (20, 18), (24+i, 22)], [3, 4, 3], False) for i in range(2)]
    specs += [(f'dev-progression-{i}', 'progression', [(22+i, 20), (26, 24), (30, 30)], [3, 3, 4], False) for i in range(2)]
    specs += [(f'audit-same-relative-{i}', 'relative', [(14+i, 12+i), (18, 17), (26, 21)], [3, 4, 5], i == 2) for i in range(3)]
    specs += [(f'audit-same-progression-{i}', 'progression', [(24, 20+i), (28, 26), (30, 28)], [3, 4, 3], False) for i in range(3)]
    specs += [(f'audit-unseen-negated-{i}', 'negated', [(16, 16), (20+i, 18), (24, 24)], [3, 3, 4], False) for i in range(2)]
    specs += [(f'audit-unseen-double-{i}', 'double', [(20, 20), (26, 22+i), (30, 30)], [3, 4, 3], False) for i in range(2)]
    specs += [(f'audit-unseen-xalign-{i}', 'xalign', [(16, 18), (20, 24+i), (22, 28)], [3, 3, 4], False) for i in range(2)]
    manifest = {'generator': 'scripts/generate_place_demand_samples.py', 'seed': 20261017, 'object_order': 'raster order of 4-connected same-color components of the INPUT grid',
                'splits': {'dev': 'same rules as stress A/B/I; development evidence', 'audit-same-rule': 'same rules, new instances; scored only after program selection is frozen', 'audit-unseen': 'compositional rules absent from the original stress suite (negated/double displacement, x-alignment)'},
                'tasks': []}
    for name, rule, sizes, counts, conf in specs:
        task = make_task(rng, rule, sizes, counts, confusable_train=conf)
        d = OUT / name; d.mkdir(exist_ok=True)
        p = d / 'task.json'; p.write_text(json.dumps(task, separators=(',', ':')) + '\n', encoding='utf-8')
        split = 'dev' if name.startswith('dev-') else ('audit-same-rule' if name.startswith('audit-same') else 'audit-unseen')
        manifest['tasks'].append({'name': name, 'rule': rule, 'split': split, 'canvas_sizes': sizes, 'object_counts': counts, 'confusable_training': conf,
                                  'path': str(p.relative_to(ROOT)), 'sha256': hashlib.sha256(p.read_bytes()).hexdigest()})
    body = json.dumps(manifest, sort_keys=True, separators=(',', ':')).encode()
    manifest['manifest_hash'] = hashlib.sha256(body).hexdigest()
    (OUT / 'manifest.json').write_text(json.dumps(manifest, indent=2) + '\n', encoding='utf-8')
    print(f'wrote {len(specs)} tasks; manifest hash {manifest["manifest_hash"]}')

# ------------------------------------------------------------------ round 2
# Frozen BEFORE any round-2 solver run. Three audit families:
#   audit2-same     : same rules as before, fresh instances (new seed)
#   audit2-nonlocal : scan-seed rules whose seed REQUIRES a non-Scene-local base
#                     point plus a constant displacement (seedshift_x/y)
#   audit2-newstruct: mirror_relative, a composition absent from every earlier set
def main_round2():
    out = ROOT / 'data/place-demand-generated-round2'; out.mkdir(parents=True, exist_ok=True)
    rng = random.Random(20261018)
    specs = [(f'audit2-same-{r}-0', r, [(18, 16), (22, 20), (26, 24)], [3, 4, 3], False) for r in ['relative', 'progression', 'negated', 'double', 'xalign']]
    specs += [(f'audit2-nonlocal-seedshift-x-{i}', 'seedshift_x', [(20+i, 18), (24, 22), (28, 26)], [3, 3, 4], False) for i in range(2)]
    specs += [('audit2-nonlocal-seedshift-y-0', 'seedshift_y', [(20, 20), (24, 24), (28, 28)], [3, 4, 3], False)]
    specs += [(f'audit2-newstruct-mirror-{i}', 'mirror_relative', [(20, 18+i), (24, 22), (28, 26)], [3, 4, 3], False) for i in range(2)]
    manifest = {'generator': 'scripts/generate_place_demand_samples.py --round2', 'seed': 20261018, 'object_order': 'raster order of 4-connected same-color components of the INPUT grid',
                'splits': {'audit2-same': 'same rules, fresh instances', 'audit2-nonlocal': 'scan-seed shift: the seed needs a non-local base point + constant displacement', 'audit2-newstruct': 'mirror_relative: new composition'}, 'tasks': []}
    for name, rule, sizes, counts, conf in specs:
        task = make_task(rng, rule, sizes, counts, confusable_train=conf)
        d = out / name; d.mkdir(exist_ok=True)
        p = d / 'task.json'; p.write_text(json.dumps(task, separators=(',', ':')) + '\n', encoding='utf-8')
        split = 'audit2-nonlocal' if 'nonlocal' in name else ('audit2-newstruct' if 'newstruct' in name else 'audit2-same')
        manifest['tasks'].append({'name': name, 'rule': rule, 'split': split, 'canvas_sizes': sizes, 'object_counts': counts, 'confusable_training': conf,
                                  'path': str(p.relative_to(ROOT)), 'sha256': hashlib.sha256(p.read_bytes()).hexdigest()})
    body = json.dumps(manifest, sort_keys=True, separators=(',', ':')).encode()
    manifest['manifest_hash'] = hashlib.sha256(body).hexdigest()
    (out / 'manifest.json').write_text(json.dumps(manifest, indent=2) + '\n', encoding='utf-8')
    print(f'wrote {len(specs)} round-2 tasks; manifest hash {manifest["manifest_hash"]}')

if __name__ == '__main__': main()
