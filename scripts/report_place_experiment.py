"""Summarize completed runs without treating missing runs as failures."""
import collections, csv, hashlib, json, pathlib
ROOT=pathlib.Path(__file__).resolve().parents[1]
OUT=ROOT/'results/place-only'
rows=[]
binary_hashes={}
for root in [OUT,ROOT/'results/place-only-ablations']:
    for p in sorted(root.rglob('execution.json')):
        result=p.parent/'solution.json'
        if not result.exists(): continue
        execution=json.loads(p.read_text()); x=json.loads(result.read_text())
        mode=p.parent.name; task=p.parent.parent.name; group=p.parent.parent.parent.name
        baseline_root={'diagnostic':'v03r2-diagnostic-matrix','stress':'v03r2-stress-matrix'}.get(group,'v03r2')
        baseline=ROOT/'results'/baseline_root/group/task/mode/'solution.json'
        old=json.loads(baseline.read_text()) if baseline.exists() else {}
        program=x.get('program') or ''
        assert 'Translate(' not in program, p
        protocol=execution['protocol']
        binary=protocol['command'][0]
        if binary not in binary_hashes:
            binary_hashes[binary]=hashlib.sha256(pathlib.Path(binary).read_bytes()).hexdigest()
        assert binary_hashes[binary]==protocol['fingerprint']['binary_sha256']
        rows.append(dict(group=group,task=task,mode=mode,train=bool(x.get('train_exact')),heldout=bool(x.get('heldout_exact')),
                         baseline_train=old.get('train_exact'),baseline_heldout=old.get('heldout_exact'),
                         failure=x.get('failure'),seconds=execution['elapsed_seconds'],portfolio=x.get('portfolio_count'),
                         inventions=len(x.get('task_invented',[])),program=program,
                         timeout=x.get('external_timeout',False),path=str(result.relative_to(ROOT))))
OUT.mkdir(parents=True,exist_ok=True)
(OUT/'comparison_all.json').write_text(json.dumps(rows,indent=2)+'\n')
if rows:
    with (OUT/'metrics.csv').open('w',newline='',encoding='utf-8-sig') as f:
        w=csv.DictWriter(f,fieldnames=list(rows[0])); w.writeheader(); w.writerows(rows)
full_rows=[r for r in rows if r['mode']=='Full']
lines=['# 绝对位置 place 临时实验','',f'已完成 {len(rows)}/226 个配置。', '',
       f'Full 留出正确：新版 {sum(r["heldout"] for r in full_rows)}/{len(full_rows)}，原版同批 {sum(r["baseline_heldout"] is True for r in full_rows)}/{len(full_rows)}。回归保持，压力测试总体退化；未自然恢复通用 Translate 抽象。下文区分表达能力和有限搜索能力。', '',
       '语言：`place : ObjectT × CoordT → PlacedT`；基础注册、类型签名和解释器均删除 `Translate`，不预置平移抽象。对象保留实际局部像素几何，旋转不做等价归并。`poseOf` 不再暴露。', '',
       '搜索：只新增 place 自身的单算子逆语义（目标局部几何、目标绝对原点）；没有注入 Translate 的组合模板。沿用任务内抽象发现。fold 位置分析相应允许 place 生成新位置。', '',
       '预算沿用 R2：主测试 250000、diagnostic 25000、cost 96、saturation 25000、单次外部超时 300 秒。Full 与消融最多合计五个进程；耗时受并行争用影响，不作速度结论。数据及原版本源码不变，结果保存输入、源码及二进制哈希。', '',
       '语义检查：基础 Translate 不可构造；非对称旋转对象不等价；81 种位移均能由 place/Anchor/coordAdd 组合精确表达并通过类型检查。旧版依赖 Translate 的兼容测试不适用于本实验，未宣称其通过。', '',
       '| 测试组 | 模式 | 完成 | 原版训练正确（同批） | 新版训练正确 | 原版留出正确（同批） | 新版留出正确 | 超时 |',
       '|---|---|---:|---:|---:|---:|---:|---:|']
groups=collections.defaultdict(list)
for r in rows: groups[r['group'],r['mode']].append(r)
for (group,mode),rs in sorted(groups.items()):
    lines.append(f"| {group} | {mode} | {len(rs)} | {sum(r['baseline_train'] is True for r in rs)} | {sum(r['train'] for r in rs)} | {sum(r['baseline_heldout'] is True for r in rs)} | {sum(r['heldout'] for r in rs)} | {sum(r['timeout'] for r in rs)} |")
lines+=['','## Full 留出结果变化','']
for r in rows:
    if r['mode']=='Full' and r['baseline_heldout'] is not None and r['baseline_heldout'] != r['heldout']:
        lines.append(f"- `{r['group']}/{r['task']}`：{r['baseline_heldout']} → {r['heldout']}，{r['failure']}。")
lines+=['','## 核心程序','']
for r in rows:
    if r['group']=='core' and r['mode']=='Full': lines+=['```text',r['program'],'```','']
full_inventions=[]
for r in rows:
    if r['mode']=='Full':
        full_inventions+=json.loads((ROOT/r['path']).read_text()).get('task_invented',[])
vec_inventions=sum(any(p.get('type')=='VecT' for p in i.get('parameters',[])) for i in full_inventions)
add_inventions=sum('coordAdd(' in str(i.get('template',{}).get('expression','')) for i in full_inventions)
lines+=['## 抽象发现审计','',f'Full 已完成运行共发现 {len(full_inventions)} 个任务内抽象；含 VecT 参数者 {vec_inventions} 个，定义中含 coordAdd 者 {add_inventions} 个。没有观察到通用 Translate 的恢复。计数为跨任务总数，各任务的 I0 等名称是局部的。','']
lines+=['## 解释范围','',
        '删除基础 Translate 并不保证自动发现通用 Translate。抽象采用实际发现的定义（I0 等）；绝对放置/对齐抽象和任意位移函数须区别。搜索仍受有限 witness、观察表达式、递归深度和预算限制；当前结果不能证明表达能力不够。30 个 ARC diagnostic 是之前已打开的数据，不是新的未见评测。', '',
        '本轮同时改变位置表示与基础词汇，因此总体差异属于组合设置的比较，不能单独归因为旋转语义。原 Base 本来就按实际局部像素几何区分旋转，本轮将位置适配器明确简化为 Object × Coord。']
cert=OUT/'base_certificates.json'
if cert.exists():
    certificates=json.loads(cert.read_text())['certificates']
    assert all(c['type_checked'] and c['train_exact'] and c['heldout_exact'] and 'Translate(' not in c['program'] for c in certificates)
    lines+=['','## 独立表达能力核验','',
            f'对 {len(certificates)} 个压力任务另写了纯 place/坐标代数参考程序，均通过类型、训练和留出验证。这些程序只用于搜索后的审计，从未导入搜索器或作为抽象种子。见 base_certificates.json。', '',
            '包括 A、B、I 的构造都采用 `place(objectOf(obj), coordAdd(Anchor(obj,TL), coordDelta(...)))`。因此这些任务失败不代表 Base 不可表达。', '',
            '当前搜索的具体限制：R2 Observers 没有从普通场景/物体环境生成 coordDelta 等 VecT 观察项；coordAdd 的 coordinateJoin/coordinateResidual witness 需要条件化一个已观察的右操作数 VecT。在这类环境中，没有该右操作数就不能自然展开 coordAdd。旧版 Translate 则直接给出 VecT 目标规格，随后 coordDelta 可以条件化已有 CoordT。这是本轮表示变化暴露的 witness/观察域缺口，尚不能把退化完全归因于抽象发现算法。']
(OUT/'REPORT.md').write_text('\n'.join(lines)+'\n',encoding='utf-8')
print(f'completed={len(rows)}/226 Full={sum(r["mode"]=="Full" for r in rows)}/58')
for (g,m),rs in sorted(groups.items()):
    if m=='Full': print(g,len(rs),'train',sum(r['train'] for r in rs),'heldout',sum(r['heldout'] for r in rs),'old heldout',sum(r['baseline_heldout'] is True for r in rs))
