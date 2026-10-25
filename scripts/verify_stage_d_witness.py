"""Independent artifact checker only; never used to synthesize/select programs."""
import re


def signature(objects):
    return [(tuple(o['sources']), tuple(sorted(tuple(p) for p in o['pixels']))) for o in objects]


def bounds(objects):
    cells = [p for o in objects for p in o['pixels']]
    assert cells, 'empty bounds'
    return min(p[0] for p in cells), min(p[1] for p in cells), max(p[0] for p in cells), max(p[1] for p in cells)


def colour(obj):
    values = {p[2] for p in obj['pixels']}
    assert len(values) == 1, 'nonunique current colour'
    return next(iter(values))


def moved(obj, x, y):
    dx, dy = x-obj['position'][0], y-obj['position'][1]
    return dict(obj, position=[x,y], pixels=[[px+dx,py+dy,c] for px,py,c in obj['pixels']])


def check(w, input_grid):
    """Verify source coverage, typed expression bindings, steps and final order.

    Old sequence/C instructions retain their Haskell replay checks and the
    separate pixel checker. This checker additionally replays structured D ASTs.
    """
    whole = w['input_objects']
    source_ids = [src for obj in whole for src in obj['sources']]
    assert len(source_ids) == len(set(source_ids))
    original = {(x,y):c for y,row in enumerate(input_grid) for x,c in enumerate(row) if c != w['background']}
    supplied = {}
    for obj in whole:
        x0,y0,x1,y1 = bounds([obj])
        assert obj['position'] == [x0,y0] and obj['size_sig'] == [x1-x0+1,y1-y0+1]
        for x,y,c in obj['pixels']:
            assert (x,y) not in supplied
            supplied[x,y] = c
    assert supplied == original, 'input evidence is not the actual input grid'
    steps = w.get('derivation_steps') or []
    if not steps or not all(isinstance(s.get('instruction'),dict) for s in steps):
        return 0
    selector = w['selector']
    def predicate(text, obj):
        text = text.strip()
        if text.startswith('(') and text.endswith(')'):
            return predicate(text[1:-1],obj)
        if text.startswith('ColorIs '):
            return colour(obj) == int(text.split()[-1])
        if text in ['IsMaxArea','IsMinArea']:
            values = [len(o['pixels']) for o in whole]
            target = (max if text == 'IsMaxArea' else min)(values)
            assert values.count(target) == 1
            return len(obj['pixels']) == target
        raise AssertionError('unsupported typed selector '+text)
    ordered = sorted(whole,key=lambda o:(tuple(sorted(tuple(p) for p in o['pixels'])),o['sources'][0]))
    selected = ordered if selector == 'AllObjects' else [o for o in ordered if predicate(selector.removeprefix('FilterBy '),o)]
    selected_ids = {src for o in selected for src in o['sources']}
    rest = [o for o in ordered if not set(o['sources']) & selected_ids]
    current = selected
    assert signature(current) == signature(steps[0]['input'])

    def leaf(name,obj):
        x,y = obj['position']; width,height = obj['size_sig']
        direct = {'CurrentX':x,'CurrentY':y,'CurrentWidth':width,'CurrentHeight':height,
                  'InputWidth':len(input_grid[0]),'InputHeight':len(input_grid),
                  'OutputWidth':w['width'],'OutputHeight':w['height'],
                  'WholeCount':len(whole),'SelectedCount':len(selected),
                  'WholeColors':len({p[2] for o in whole for p in o['pixels']})}
        if name in direct: return direct[name]
        if name == 'CurrentColor': return colour(obj)
        if name == 'WholeObjectColors': return len({colour(o) for o in whole})
        if name.startswith('Whole') or name.startswith('Selected'):
            source = selected if name.startswith('Selected') else whole
            names = ['MinX','MinY','MaxX','MaxY']
            suffix = name.removeprefix('Selected').removeprefix('Whole')
            if suffix in names: return bounds(source)[names.index(suffix)]
        match = re.fullmatch(r'LegacyFit(Across|Down) \(?(-?\d+)\)?',name)
        if match:
            gap = int(match[2]); denominator = (width if match[1]=='Across' else height)+gap
            assert denominator != 0
            return ((w['width']-x) if match[1]=='Across' else (w['height']-y)) // denominator
        raise AssertionError('unknown leaf '+name)

    def expression(tree,obj):
        if 'leaf' in tree: return leaf(tree['leaf'],obj)
        if 'constant' in tree: return tree['constant']['value']
        assert 'unfilled_hole' not in tree
        args = [expression(t,obj) for t in tree['arguments']]
        op = tree['operator']
        signatures = {'Add':([int,int],int),'Sub':([int,int],int),'Mul':([int,int],int),
                      'Mod':([int,int],int),'IsOdd':([int],bool),'If':([bool,int,int],int),
                      'Lt':([int,int],bool),'Gt':([int,int],bool),'Eq':([int,int],bool),
                      'And':([bool,bool],bool),'Or':([bool,bool],bool),'Not':([bool],bool)}
        params,result_type = signatures[op]
        assert list(map(type,args)) == params
        if op == 'Add': value=args[0]+args[1]
        elif op == 'Sub': value=args[0]-args[1]
        elif op == 'Mul': value=args[0]*args[1]
        elif op == 'Mod':
            assert args[1] != 0
            value=args[0]%args[1]
        elif op == 'IsOdd': value=args[0]%2 != 0
        elif op == 'If': value=args[1] if args[0] else args[2]
        elif op == 'Lt': value=args[0]<args[1]
        elif op == 'Gt': value=args[0]>args[1]
        elif op == 'Eq': value=args[0]==args[1]
        elif op == 'And': value=args[0] and args[1]
        elif op == 'Or': value=args[0] or args[1]
        else: value=not args[0]
        assert type(value) is result_type
        return value

    for ordinal,step in enumerate(steps):
        assert step['ordinal'] == ordinal and signature(step['input']) == signature(current)
        instruction = step['instruction']; operation = instruction['operation']; output=[]
        for index,obj in enumerate(current):
            params=[]
            for param in instruction['parameters']:
                value=expression(param['expression'],obj); refinement=param['refinement']
                assert type(value) is int
                if refinement == 'PositiveCount': assert value >= 1
                if refinement == 'ArcColor': assert 0 <= value <= 9
                params.append(value)
            assert [v['value'] for v in step['bindings'][index]] == params
            if operation == 'MapPosition': output.append(moved(obj,*params))
            elif operation == 'MapColor': output.append(dict(obj,pixels=[[x,y,params[0]] for x,y,_ in obj['pixels']]))
            elif operation == 'Copies':
                n,dx,dy=params
                for k in range(n):
                    assert step['output'][len(output)]['role'].endswith(f'; copy={k}/{n}')
                    output.append(moved(obj,obj['position'][0]+k*dx,obj['position'][1]+k*dy))
            elif operation.startswith('LegacyStep (Hollow ') or operation == 'LegacyStep FillBBox':
                width,height=obj['size_sig']; x,y=obj['position']; c=colour(obj)
                t=int(re.search(r'Hollow (-?\d+)',operation)[1]) if 'Hollow' in operation else None
                if t is not None:
                    assert len(obj['pixels']) == width*height and t>=1 and 2*t<min(width,height)
                cells=[[x+a,y+b,c] for a in range(width) for b in range(height)
                       if t is None or a<t or b<t or a>=width-t or b>=height-t]
                output.append(dict(obj,pixels=cells))
            elif operation == 'LegacyStep Keep': output.append(obj)
            else: raise AssertionError('unsupported structured D instruction '+operation)
        assert signature(output) == signature(step['output']), 'transform witness output mismatch'
        for obj in step['output']:
            x0,y0,x1,y1=bounds([obj])
            assert obj['position']==[x0,y0] and obj['size_sig']==[x1-x0+1,y1-y0+1]
        current=step['output']
    expected=current+(rest if w['others']=='KeepOthers' else [])
    assert signature(expected)==signature(w['emissions']), 'render priority or preservation mismatch'
    return len(steps)
