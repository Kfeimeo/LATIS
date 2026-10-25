"""Audit final Stage D evidence and generate Chinese design/experiment reports."""
import argparse
import csv
import json
import statistics
import shutil
import subprocess
import copy
import zipfile
import sys
from collections import defaultdict
from pathlib import Path

sys.path.insert(0, str(Path(__file__).resolve().parent))
import arc_stage_d as arc
import verify_stage_d_witness as transform_checker

ROOT = arc.ROOT


def read(path):
    return json.loads(path.read_text(encoding='utf-8-sig'))


def save(path, value):
    path.parent.mkdir(parents=True, exist_ok=True)
    path.write_text(json.dumps(value, ensure_ascii=False, indent=2), encoding='utf-8')


def location(file, symbol):
    lines = (ROOT / file).read_text(encoding='utf-8-sig').splitlines()
    line = next(i for i, text in enumerate(lines, 1) if symbol in text)
    return f'`{file}:{line}` (`{symbol}`)'


def mechanism_audit(out,control=None):
    matrix = [r for instance in read(out / 'mechanism/matrix.json') for r in instance]
    if control:
        overrides={(r['family'],r['seed'],r['config']):r for group in read(control/'mechanism/matrix.json') for r in group}
        assert len(overrides)==18 and all(k[2]=='ComposeOnly' for k in overrides)
        for family,seed,_ in overrides:
            assert read(control/'mechanism'/f'{family}-{seed}.data.json')==read(out/'mechanism'/f'{family}-{seed}.data.json')
        matrix=[overrides.get((r['family'],r['seed'],r['config']),r) for r in matrix]
    assert len(matrix) == 18 * 8
    records = {(r['family'], r['seed'], r['config']): r for r in matrix}
    verified, graph_count, verified_steps = 0, 0, 0
    for r in matrix:
        train=read(out / 'mechanism' / f"{r['family']}-{r['seed']}.data.json")['train']
        for w,pair in zip(r.get('witnesses') or [],train):
            arc.verify_witness(w)
            verified_steps += transform_checker.check(w,pair['input'])
            if r.get('train_exact'): assert w['grid'] == pair['output']
            verified += 1
        if r.get('train_exact'):
            label = f"{r['family']}-{r['seed']}-{r['config']}"
            save(out / 'mechanism_graphs' / (label + '.graph.json'),
                 {'family': r['family'], 'seed': r['seed'], 'config': r['config'],
                  'program': r['program'], 'derivation_graphs': r['witnesses'],
                  'parameter_goals': r.get('parameter_goals')})
            graph_count += 1
    families = sorted({r['family'] for r in matrix})
    summary = {}
    for family in families:
        summary[family] = {}
        for cfg in arc.CONFIGS:
            data = [records[family, seed, cfg] for seed in range(1, 4)]
            summary[family][cfg] = {'train_exact': sum(bool(r.get('train_exact')) for r in data),
                                    'heldout_exact': sum(bool(r.get('heldout_exact')) for r in data),
                                    'timeout': sum(r.get('status') == 'timeout' for r in data)}
    positive = [f for f in families if f != 'AmbiguousParamReferents']
    positive_failures = [(f, seed, cfg) for f in positive for seed in range(1, 4)
                         for cfg in ['FullD', 'TypedCompose', 'NoParamVSA']
                         if not records[f, seed, cfg].get('train_exact')]
    negative_failures = [(f, seed, cfg) for f in positive for seed in range(1, 4)
                         for cfg in ['BaselineA', 'BaselineB', 'BaselineC']
                         if records[f, seed, cfg].get('train_exact')]
    assert not positive_failures, positive_failures
    assert not negative_failures, negative_failures
    independent=None
    for r in matrix:
        if r['config']!='FullD': continue
        train=read(out/'mechanism'/f"{r['family']}-{r['seed']}.data.json")['train']
        for w,pair in zip(r.get('witnesses') or [],train):
            if not w.get('derivation_steps') or w['grid']==pair['input']: continue
            arc.verify_witness(w)
            assert w['render_witness_valid'] and w['grid']!=pair['input']
            bad=copy.deepcopy(w)
            bad['derivation_steps'][0]['bindings'][0][0]['value']+=1
            try: transform_checker.check(bad,pair['input'])
            except AssertionError: rejected=True
            else: rejected=False
            assert rejected
            independent={'valid_pixel_witness_with_mismatching_alternative_target':True,
                         'forged_parameter_binding_rejected':True,'family':r['family'],'seed':r['seed']}
            break
        if independent: break
    assert independent
    save(out/'validation/witness_independence.json',independent)
    ambiguous = []
    for seed in range(1, 4):
        row = records['AmbiguousParamReferents', seed, 'FullD']
        xs = [e for g in row['parameter_goals'] if g['role'] == 'x' for e in g['candidates']]
        assert any('CurrentX' in e and 'CurrentWidth' in e for e in xs)
        assert any('CurrentX' in e and 'VI 2' in e for e in xs)
        ambiguous.append({'seed': seed, 'two_representatives_present': True, 'heldout_exact': row['heldout_exact']})
    # With graph construction disabled, every node count must actually be 0.
    assert all(r['stage_d']['d_vsa_nodes'] == 0 for r in matrix if r['config'] == 'NoParamVSA' and r['status'] != 'timeout')
    checks = {'records': len(matrix), 'summary': summary, 'graphs': graph_count,
              'independent_pixel_checks': verified, 'independent_typed_step_checks': verified_steps, 'positive_failures': positive_failures,
              'baseline_negative_failures': negative_failures, 'ambiguous': ambiguous, 'witness_independence':independent,
              'timeout_note': 'timeouts are not proofs of DSL inexpressibility'}
    save(out / 'mechanism_audit.json', checks)
    return checks


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--out', type=Path, default=ROOT / 'results/stage_d/full_p0')
    parser.add_argument('--control-out', type=Path)
    args = parser.parse_args()
    out = args.out
    control=args.control_out
    if control is None and (out/'control_v2/arc/metrics.json').exists(): control=out/'control_v2'
    if control:
        unchanged=read(control/'validation/fullD_unchanged.json')
        assert unchanged['programs_equal'] and unchanged['deterministic_work_equal'] and unchanged['instances']==18
        assert 'All strict ComposeOnly control tests passed.' in (control/'validation/final-tests.txt').read_text(encoding='utf-8-sig')
    arc.report(argparse.Namespace(out=str(out/'arc'),configs=','.join(arc.CONFIGS),control_out=str(control/'arc') if control else None))
    mech = mechanism_audit(out,control)
    migration = read(out / 'validation/migration.json')
    differential = read(out / 'validation/differential.json')
    negative = read(out / 'validation/negative_controls.json')
    assert migration['passed'] and differential['candidate_sets_equal'] and differential['fit_sets_equal']
    assert all(r['rejected'] for r in negative)
    suites = {}
    for suite in ['StageD','StageDFull','StageC','StageB','StageA','CollectionV61','CollectionV6','Collection','Triggered','InducedR2','FeaturePipeline']:
        text = (out / 'validation' / f'{suite}-tests.txt').read_text(encoding='utf-8-sig', errors='replace')
        assert 'EXIT 0' in text and 'FAIL ' not in text, suite
        count = sum(line.startswith('PASS ') for line in text.splitlines())
        suites[suite] = {'exit_code': 0, 'assertions': count or None}
    strict_log=control/'validation/final-tests.txt' if control else out/'validation/StageDControl-tests.txt'
    if strict_log.exists():
        text=strict_log.read_text(encoding='utf-8-sig',errors='replace')
        assert 'EXIT 0' in text and 'FAIL ' not in text
        suites['StageDControl']={'exit_code':0,'assertions':sum(line.startswith('PASS ') for line in text.splitlines())}
    memory = {mode: [read(out / 'validation' / f'memory-{mode}-{i}.json') for i in range(1,4)]
              for mode in ['SharedParamVSA','NoParamVSA']}
    memory_summary = {mode: {'candidates': data[0]['candidates'], 'nodes': data[0]['nodes'],
                            'median_retained_delta_bytes': statistics.median(r['retained_delta_bytes'] for r in data),
                            'raw': data} for mode,data in memory.items()}
    save(out / 'dag_memory.json', memory_summary)
    metrics = read(out / 'arc/metrics.json')
    audit = read(out / 'arc/audit.json')
    code = read(out / 'arc/code_version.json')
    assert audit['record_count'] == audit['expected_records'] == 3200
    assert metrics['configs']['BaselineC']['train_exact'] == 17
    assert not metrics['configs']['FullD']['lost_old_solutions']
    frozen = out / 'arc/solver.exe'
    if not frozen.exists():
        assert code['binary_sha256'] == arc.base.sha256_file(ROOT / code['binary'])
        shutil.copyfile(ROOT / code['binary'], frozen)
    assert code['binary_sha256'] == arc.base.sha256_file(frozen)
    code['frozen_binary'] = 'solver.exe'
    save(out / 'arc/code_version.json',code)
    guard = subprocess.run([str(frozen.resolve()),'arc-train-only-stage','--stage','stage-d-FullD',
        '--task',str(ROOT/'data/arc1-training/007bbfb7.json'),'--out',str((out/'leakguard_final').resolve()),'--timeout-ms','50'],
        capture_output=True,text=True,encoding='utf-8',errors='replace')
    assert guard.returncode == 3
    save(out/'validation/leakguard_check.json',{'exit_code':guard.returncode,'nonempty_test_rejected':True,'binary_sha256':code['binary_sha256']})
    for task in (out / 'arc/train_only').glob('*.json'):
        assert read(task)['test'] == []
    metrics['mechanism'] = mech
    metrics['validation'] = {'suites': suites, 'migration': migration, 'differential': differential,
                             'negative_controls': negative, 'dag_memory': memory_summary}
    save(out / 'metrics.json', metrics)
    audit.update({'validation': metrics['validation'], 'mechanism': mech,
                  'source_and_binary':code,
                  'evaluation_tools_sha256':{name:arc.base.sha256_file(ROOT/'scripts'/name) for name in ['arc_stage_d.py','report_stage_d.py','verify_stage_d_witness.py']},
                  'p0_acceptance': 'bounded implementation and required experiment matrix audited',
                  'not_claimed': ['full-DSL completeness','global semantic equality','generic object VSA','ARC generalization','runtime DAG heap isolated for every ARC task']})
    if control:
        audit['strict_control_regression']=unchanged
        audit['strict_control_code_version']=read(control/'arc/code_version.json')
        final_tests=(control/'validation/final-tests.txt').read_text(encoding='utf-8-sig')
        assert 'valid overlapping emissions above new-program cap' in final_tests
        assert 'Merge rebuilds changed SizeSig' in final_tests
        assert 'EXIT 0' in final_tests
        audit['post_evaluation_compatibility_fix']={
            'scope':'MigratedBody alone is exempt from the new typed-program emission cap; legacy emitObjects search and all typed-program caps are unchanged',
            'large_legacy_emissions':960,'old_vs_migrated_render_equal':True,
            'changed_size_sig_merge_then_position':True,
            'tests':str(control/'validation/final-tests.txt')}
    snapshot=out/'final_implementation_source.zip'
    with zipfile.ZipFile(snapshot,'w',zipfile.ZIP_DEFLATED) as z:
        paths=[ROOT/'latis.cabal']
        for folder,pattern in [('src','*.hs'),('app','*.hs'),('test','*.hs'),('scripts','*.py'),('scripts','*.ps1')]:
            paths+=list((ROOT/folder).rglob(pattern))
        for path in sorted(paths):z.write(path,path.relative_to(ROOT))
    audit['final_implementation_source_sha256']=arc.base.sha256_file(snapshot)
    final_binary=ROOT/'build/latis-stage-d-final.exe'
    if final_binary.exists():
        target=out/'final_implementation.exe'
        if not target.exists():shutil.copyfile(final_binary,target)
        audit['final_implementation_binary_sha256']=arc.base.sha256_file(target)
    # Keep each new solution reviewable without re-running search.
    for entry in read(out/'arc/new_solutions.json').get('FullD',[]):
        raw=read(Path(entry['source_record']))
        folder=out/'new_solutions'/entry['task_id']
        save(folder/'solution.json',raw)
        save(folder/'derivation_graph.json',{'program':raw['program'],'parameter_goals':raw.get('parameter_goals'),
            'execution_witnesses':raw.get('execution_witnesses'),'selected_composed':entry['has_composition']})
        (folder/'trace.txt').write_text('原始结果派生的参数/执行轨迹（非伪造的实时事件流）\n'+
            json.dumps({'source_record':entry['source_record'],'run_id':entry['run_id'],
                        'stage_d':raw.get('stage_d'),'program':raw['program'],
                        'goals':raw.get('parameter_goals')},ensure_ascii=False,indent=2),encoding='utf-8')
    save(out / 'audit.json', audit)
    # Top-level files are derived pointers/copies; prior raw batches stay intact.
    for name in ['metrics.csv','per_task.csv','new_solutions.json']:
        (out / name).write_bytes((out / 'arc' / name).read_bytes())
    for name in ['metrics.json','audit.json','metrics.csv','per_task.csv','new_solutions.json']:
        (ROOT / 'results/stage_d' / name).write_bytes((out / name).read_bytes())

    interfaces = [
        ('A 表达式/类型', 'src/Synthesis/Collection/Typed.hs', 'data TExpr'),
        ('A hole 合成', 'src/Synthesis/Collection/Typed.hs', 'synthesizeTyped ::'),
        ('B Lambda/VSA', 'src/Synthesis/Collection/Referent.hs', 'data LTerm'),
        ('B witnessed relation', 'src/Synthesis/Collection/Referent.hs', 'relate ::'),
        ('旧 C AST', 'src/Synthesis/Collection/Relation.hs', 'data ObjectTransform'),
        ('旧 C 执行', 'src/Synthesis/Collection/Relation.hs', 'emitObjects ::'),
        ('旧 C 迁移', 'src/Synthesis/Collection/Relation.hs', 'migrateTransform ::'),
        ('运行/来源证据', 'src/Synthesis/Collection/Front.hs', 'runProgramObjects ::'),
        ('原位置体合成', 'src/Synthesis/Collection/Front.hs', 'fitBody ::'),
        ('尺寸规则', 'src/Synthesis/Collection/Size.hs', 'data SizeRule'),
        ('旧关系证据', 'src/Synthesis/Collection/Relation.hs', 'data RelationWitness'),
        ('配置', 'src/Synthesis/Collection/Front.hs', 'data Config'),
        ('触发链', 'src/Synthesis/Collection/Front.hs', 'unifiedPath ::'),
        ('参数适配', 'src/Synthesis/Collection/Parameter.hs', 'checkedParam ::'),
        ('TypedGoal/预算', 'src/Synthesis/Collection/Unified.hs', 'data StageD'),
        ('联合/逆向搜索', 'src/Synthesis/Collection/Unified.hs', 'searchUnified ::'),
        ('双层证据', 'src/Synthesis/Collection/Relation.hs', 'executePipeline ::'),
        ('像素独立核验', 'src/Synthesis/Collection/Relation.hs', 'verifyRenderWitness ::')]
    interface_table = '\n'.join(f'| {name} | {location(file,symbol)} |' for name,file,symbol in interfaces)
    design = '''# LATIS 阶段 D：统一类型化参数与有界对象组合

本版替代第一轮部分实现说明。原 Stage C 未提交代码与历史求解器保持原有搜索语义；新增能力由 Config.stageD 控制，默认 stageDOff。原始第一轮结果留在 results/stage_d/baseline_c_replay，完整批次在 results/stage_d/full_p0。

## 1. 接口与复用审计

| 构件 | 当前源码位置 |
|---|---|
INTERFACES

复用 A 的 TExpr、枚举器、hole 填充、binding 与 evaluator；B 的 LTerm、类型检查、hash-consing、精确因子化、DAG 求值和 relate；C 的选择、几何构造与真实渲染。没有第二套算术解释器，没有修改 ML 算子语义。原序列位置体的 OrderedView/Previous 规则不移植到副本列表。

## 2. 类型、来源与执行

Param 的构造子私有，访问函数不是可更新 record labels。checkedParam 递归检查算子签名与 arity；PositiveCount、ArcColor、Int、Bool 在使用处检查 refinement。Int/Bool 算术委托 Typed.evalT → applyOp → Language.ML.eval。Mod 除零显式失败。

ParamContext 分开携带输入尺寸、由输入 SizeRule 计算的输出尺寸、WholeInputSet、SelectedSet、CurrentObject。CurrentObject 在每一步重绑定，两个源集合固定。可用叶子包括位置、extent、输入/输出尺寸、对象/颜色计数、集合 min/max、合法的单色观察。WholeColors 是输入对象的前景颜色种数，不含 encoder 背景 0。没有目标输出对象 leaf，也没有 Previous 或无 witness 的集合索引。

Pipeline 限制 1..2 个步骤，选择不计深度：MapPosition(Int,Int) 为绝对位置；MapColor(Color)；Copies(PositiveCount,dx,dy) 包含 copy index=0 的原位副本；LegacyStep 复用 Hollow/FillBBox；另外保留 SetMerge/SetCrop 的可执行桥接。复制有显式 copy role，保留源 ID；一对多、多对一和删除都允许。源对象按稳定几何键决定新管线的渲染优先级，不将其伪装为 Previous/rank。形状构造新建 Object，extent/size signature 从新几何重建，不跨 sort 转换。

输入/中间对象检查非空、颜色范围与连通性；局部合法 DiagonalBar 可作为既有视图对象，交叉/分叉不隐式合并。输出尺寸 1..30；新 Pipeline 的复制/中间集合上限 900，超过为 budget 状态；旧 MigratedBody 豁免此新增预算以保持合法重叠发射语义。任一越界像素仍由 Render 整体拒绝，无隐式裁剪。后绘对象覆盖先绘对象。

runProgram → runProgramObjects 统一执行旧/新 AST。关系路径只接受旧 C 的占位 sequence body；其它 body 显式报错，改用 MapPosition，绝不静默忽略。原 sequence 路径仍通过旧 OrderedView 执行；来源 ID 从输入的 ID-free Placed 映射恢复，不使用 placedToObject 固定的 ID 0 作为所有来源。

## 3. 旧语法迁移与成本

migrateCount/Offset 将 KConst、KCountObjects、KCountColors、StepRight/Down/Left/Up/Diagonal 翻译为 A 表达式。KFitAcross/Down 使用带输入/输出尺寸来源的兼容 quotient leaf，除数检查非零。它们是旧 quotient 的明确兼容原语，新增参数搜索仍使用通用 A 算子，不将任意新表达式硬编码回 K*。

MigratedBody 保存旧语法的成本和原渲染顺序，并携带实际执行的新步骤；运行时核对注解与规范翻译一致，拒绝伪造低成本包装。普通 Pipeline 的成本为操作节点加 A tCost（AST 节点数 + 4×常数数）；存入 VSA 不改变 prior。调度优先级与最终 semantic prior 分开：已检查的 train-exact 程序最终按 transformCost 排序，预算以外的候选保持 deferred，不能声称全局最优。

## 4. 参数搜索与 B 快照

旧 A/B/C 路径先运行；只有旧关系候选无 fit 才打开 unifiedPath。搜索按 selector、有限 step skeleton 展开。能建立唯一源对象、形状/颜色对应及算术 copy role 的训练案例，产生有 witness 的逆向参数约束；输出角色的几何排序要验证唯一性与等差位置，不能直接索引无序集合。约束只用于训练，最后仍前向验证完整网格。

无法逆向约束时，执行无独立标量标签的有界联合枚举：A 模板、共享常数和复制 offset 的组合经过完整训练 Grid 验证。此 fallback 是有意限定的小宇宙，不覆盖任意多源/多步图算法。相同输入矛盾输出显式拒绝。

逆向值是可满足的候选赋值，不是宣称唯一真标签。单副本案例的 offset 不可识别时，0 是当前有限提案之一；其它规律可能因预算或提案范围未被搜索到。所有被返回的表达式仍须前向整格验证，不能把未覆盖解释为 DSL 不可表达。

位置参数使用移动前 CurrentObject；复制参数使用前序移动结果。每个参数 hole 建立 TypedGoal：refinement、可见 leaf、上下文 witness、深度与预算。A 候选转 LTerm 后按 AST identity 存储，B intern/factorClass 共享节点，evaluateDAG 的结果实际过滤搜索参数。If 的 Bool 子目标与父 Int 共享相同节点，费用只计一次。按角色和输入上下文缓存已验证的候选，避免反复构建大宇宙。

relate 的 Confirmed/Pending/Rejected 规则未改。案例相对 CaseAgree 不合并 intensionally 不同的项；边只调度，不证明全域相等。观察不到依赖变化的 constant-looking 表达式可以为 Pending，不会被永久删除。参数 representative 上限和模板 frontier 都有 deferred 记录，可用相同 TypedGoal 再展开。

NoParamVSA 真正不创建 DAG，使用同一参数候选的直接求值；NoReferentOrdering 保留图而关闭边排序。程序组合宇宙先截断、再按 B 边排序，因此固定宇宙差分可验证候选/fit 集一致；实际跑到 representative 或案例预算时的差异必须标为截断。

严格 ComposeOnly 不调用通用表达式枚举：count 等于默认 C 的 KConst 2/3/4、计数特征与 KFit 参数；copy 的 dx/dy 必须是同一个旧 OffsetExpr 的翻译，不能混配不同 gap。位置适配使用闭合常数/标量平移与 bbox 位移模板。无逆向标签的 fallback 也只允许这些闭合参数，不暗中打开 A 的新表达式空间。

本版没有 ShapeMask/Set[Object] 全类型 VSA，没有 Object e-graph；对象程序是有限 AST 与去重集合，只有参数级 Typed VSA。

## 5. Witness 与度量

StepWitness 保存输入/输出 EmittedObject、源 ID、步骤和参数值；verifyPipeline 从输入与程序重放。RenderWitness 保存按真实顺序的像素贡献，verifyRenderWitness 独立折叠像素逐格核验；Python 再从 JSON emission 重放。结构化 derivation_steps 还包含参数表达式 AST、refinement、逐对象 binding 与中间几何，可核验来源路径和 SizeSig。

额外的独立 Python 审计只读取结果，不参与搜索或选程序：核验输入像素覆盖、selector、表达式 binding、各个 typed step、copy role、SizeSig、保留对象与最终覆盖顺序。旧 scalar/C 指令保留其 Haskell 重放和迁移差分，并独立核验像素。pixel contribution 中 emission 是直接绘制者，source IDs 是该对象的变换祖先，不声称每个祖先都直接提供该像素。

分别报告 Object-Count-exact、Emitted-Object-exact、Render-exact、Train-exact、Transform/Render-Witness-valid。旧 RelationWitness 的对象匹配定义保留；同色渲染后连接时 emitted exact 可为假，而 render/witness valid 为真，不要求双射。

## 6. 预算、时间与资源口径

默认 D 预算：每目标 40000 A row/probe checks、全运行 180000；最多 20000 个模板/目标、32 个参数 representative；96 个 skeleton、2000 个参数组合、4000 个前向案例执行、16 个 train-exact 程序。A 原子模板可能一次检查多行，预留 9×案例数+2，确保新 D 参数总预算不会越界。B 边查询每目标最多 4096 次、保留 128 条 supported/pending 边，DAG 节点数由 32 个深度 2 表达式限制。旧 C 预算与触发行为保留。

状态区分 fit、no-fit、not-applicable、各层 truncated、外层 timeout。新 D Work = A row/probe checks + 前向案例调用 + 实际参数节点求值 + relate 调用 + witness 重放调用；这是确定性的混合工作计数，不是 CPU 指令数。直接求值在候选全部训练有定义时按完整 AST 节点计，DAG 按实际访问节点计；relate 状态被强制求值后计数。

通过 GHC 用户事件记录搜索起止与首次整格精确时刻，首解时间不以整个枚举时间代替。格式依据 [GHC eventlog 文档](https://downloads.haskell.org/ghc/9.14-latest/docs/users_guide/eventlog-formats.html)，解析器读取安装版本自身声明的事件大小。外层每题每配置 60 秒，RTS -M4g -T；超时未落盘的 counters 为 null/missing，不填 0。

ARC 每目标报告节点/类/边、序列化尺寸估计和进程 RTS peak live heap；估计值不叫实际 DAG heap。另以独立进程、相同 MEMORY_CANDIDATES 个候选（取前 512 个模板再按 AST 去重）、强制 GC 前后 live bytes，测量共享池的真实 retained heap 增量，重复三次，与不建图对照。P1 的通用 Shape 参数、对象级 VSA、任意深度均未实现。
'''.replace('INTERFACES', interface_table).replace('MEMORY_CANDIDATES', str(memory_summary['SharedParamVSA']['candidates']))
    (ROOT / 'docs/LATIS_STAGE_D.md').write_text(design, encoding='utf-8')

    table = '\n'.join(f"| {cfg} | {r['train_exact']}/400 | {r['statuses'].get('timeout',0)} | {len(r['new_vs_C'])} | {len(r['lost_old_solutions'])} | {r['search_work_completed']} | {r['run_id']} |"
                      for cfg,r in metrics['configs'].items())
    mechanism_table = '\n'.join('| '+family+' | '+' | '.join(f"{mech['summary'][family][cfg]['train_exact']}/{mech['summary'][family][cfg]['heldout_exact']}" for cfg in arc.CONFIGS)+' |' for family in mech['summary'])
    full = metrics['configs']['FullD']
    diff_summary = {k:v for k,v in differential.items() if k != 'universe'}
    resource_table='\n'.join(f"| {cfg} | {r['distributions']['first_train_exact_seconds']['median']} | {r['distributions']['total_to_budget_seconds']['sum']} | {r['peak_live_bytes_completed']} |" for cfg,r in metrics['configs'].items())
    b_common=metrics['parameter_universe_comparison']
    b_work_difference=full['search_work_completed']-metrics['configs']['NoParamVSA']['search_work_completed']
    version_note=(f"严格 ComposeOnly 使用追加批次 `{read(control/'arc/code_version.json')['run_id']}`，二进制 `{read(control/'arc/code_version.json')['binary_sha256']}`；其它七配置使用原批次。原 ComposeOnly 的宽常数域/联合 typed 回退已从最终对照剔除，原始结果仍完整保留。更正后计数和成对 offset 严格来自旧 C，位置由旧闭合位移/标量模板适配。FullD 的 18 个实例程序、确定性工作量和 heldout 分数逐项相同；更正未调 FullD 规则或预算。" if control else "全部配置使用同一个冻结二进制。")
    report = f'''# LATIS 阶段 D：P0 验收与实验报告

本报告替代第一轮部分实现报告。完整有界实现、测试及要求的八配置实验已运行并审计；不宣称全 DSL 完备性或真实 ARC 泛化准确率。原始结果在 `results/stage_d/full_p0/arc/tasks`，机制逐项 JSON/trace 在 `full_p0/mechanism`，推导图在 `full_p0/mechanism_graphs`。第一轮原始数据保留。

## 1. P0 A–F 完成情况

| 项 | 验收证据 |
|---|---|
| A | A 表达式/Typed Hole/Binding 实际嵌入 C；旧候选迁移 {migration['comparisons']} 次输出/错误类别比较与成本比较通过 |
| B | 同一程序实际执行 Select→MapPosition→Copies、MapColor/Shape→MapPosition；身份、作用域、SizeSig 与重放回归通过 |
| C | 参数级 Int/Bool DAG 存储、筛选、witness 边调度实际接入；NoParamVSA 不建图；固定宇宙候选/fit/ordering 差分通过 |
| D | Transform 重放、独立像素重放、同色连接/覆盖与伪造证据控制；ARC 独立核验 {metrics['witnesses_independently_verified']} 份案例证据 |
| E | 默认关闭、旧路径优先、分层预算、deferred、精确/无 fit/不适用/截断/超时；首解与总搜索 work/time 分开记录 |
| F | 六族×三种子×八配置共 {mech['records']} 项盲搜索，11 项显式负控制、历史回归与 ARC 400×8 完成 |

P1/P2 未做：完整 refinement GADT、shape thickness hole、通用对象 VSA、任意 SplitBy/任意深度、全类型 e-graph、Branch-and-Bound、神经模块。

## 2. 机制矩阵

每格为三个种子中 train-exact / heldout-exact 的数量。每种子 4 个训练对，heldout 仅评分；求解器接收的只有 train，没有目标 AST、任务 ID 或 heldout 标签。歧义族故意包含 literal/feature 真值相反的 heldout，不能要求 prior 总是正确。

| 家族 | {' | '.join(arc.CONFIGS)} |
|---|{'---|' * len(arc.CONFIGS)}
{mechanism_table}

五个正向族的 BaselineA/B/C 均无训练精确解；这只是相同预算与冻结语法的实测，不把超时或截断解释成全 DSL 不可表达。Color/ShapeThenMove 的旧程序只能做单种操作；Count 家族的训练计数非单一 K*；SelectMoveCopy 则需要两个非恒等步骤。TypedParamsOnly 与 ComposeOnly 的具体结果见表，不按配置名称推断成功。

歧义族三个实例都保留 X+2 与 X+Width 的不同代表；heldout 结果是 {mech['ambiguous']}。CaseAgree 不等于全域相等。

## 3. ARC train-only

run_id `{code['run_id']}`，二进制 SHA256 `{code['binary_sha256']}`，数据 SHA256 `{read(out / 'arc/data_manifest.json')['combined_sha256_of_task_hashes']}`。源码含未提交 Stage C/D 修改，完整 snapshot zip 与哈希在 code_version.json；没有只引用 Git HEAD 冒充源码版本。

每配置相同 60 秒墙钟、既有 A/B/C 工作预算；新增 D 子预算在设计文档和每题 config 中单列，不把额外预算冒充收益。求解并行度 {metrics['run']['workers']}，批次墙钟 {metrics['run'].get('wall_clock_seconds'):.2f} 秒。test=[] 逐文件校验，并有二进制非空 test 拒绝守卫；R2 没有执行，fallback 指仍需回退。

{version_note} 每行 run_id 和 binary_sha256 都保存于 per_task.csv；不得将两批墙钟混为同批提速比较。

| 配置 | train-exact | timeout | 新增 vs C | 未覆盖 C 解 | 完成题 SearchWork 总和 | 批次 |
|---|---|---|---|---|---|---|
{table}

BaselineA/B 未覆盖 C 新增的十题属于能力基线差异；FullD 的旧解回归单独以 C 的 17 题为准。追加更正批次的时间单独记录在 metrics.corrected_control_run，原八配置批次成本未隐藏。

| 配置 | 首次训练精确秒数中位（仅有首解） | 完成搜索阶段秒数之和（不含未完成超时） | RTS peak live bytes |
|---|---|---|---|
{resource_table}

FullD/NoParamVSA 共同完成 {b_common['common_completed']} 题，其中参数候选宇宙相同 {b_common['candidate_sets_equal']} 题，train-exact 状态相同 {b_common['train_exact_equal']} 题。两者本批解数相同，FullD 的完成题总 Work 差为 {b_work_difference}；参数 DAG 的局部重用不能被扩大为显著整体提速结论，单批几秒的墙钟差不构成稳定效率优势证据。

真实 ARC 的 B 参数图累计 {full['d_metric_sums_completed']['d_vsa_nodes']} 节点、{full['d_metric_sums_completed']['d_vsa_edges']} 条保留边，其中 Confirmed {full['d_metric_sums_completed']['d_vsa_confirmed']}、Pending {full['d_metric_sums_completed']['d_vsa_pending']}；实际 relate 查询 {full['d_metric_sums_completed']['d_vsa_edge_checks']} 次。DAG 求值 {full['d_metric_sums_completed']['d_dag_evaluations']} 次，对应直接参数 AST 求值 {full['d_metric_sums_completed']['d_reference_evaluations']} 次。Pending 没有被宣传为全域等价或确认证明。

FullD 新增 ID：{full['new_vs_C']}；丢失旧 17 解：{full['lost_old_solutions']}。实际选中程序是否含两个非恒等步骤，由每个训练 witness 的输入/输出比较得出，详见 `new_solutions.json` 和逐题 selected_composed；不拿“曾枚举过组合”代替选中程序的组合证据。TypedParamsOnly/ComposeOnly 的逐题状态一起保存，用于区分参数收益、组合收益与预算限制。

102 道 addition-like 与 36 道位置/形状失败诊断组的逐题迁移在 `arc/diagnostic_transitions.json`；它们保持 Stage C 的 encoder/失败阶段定义，不称为真实规则标签。跨批次工作量只比较共同完成任务；超时指标缺失，不按 0 汇总。

## 4. 五个源码验收问题

1. **参数实际执行 A 合成结果**：`frontSearch → relationPath(旧 C 无 fit) → unifiedPath → searchUnified → inverseRows/联合枚举 → goal → Typed.enumerateTemplates/synthesizeTyped → Candidate.cExpr → checkedParam → B fitPool → construct → Pipeline → runProgram → executePipeline → evalParam → evalT → Language.ML.eval`。TypedCountReplication 的 `If(IsOdd(InputWidth),WholeCount,WholeColors)` 在四个训练例得到 4、3、5、3；三个种子相同输入参数序列，heldout 计数 6，逐步 binding/像素证据可查。位置和颜色也由同一 A hole 接口合成，不翻回专用 K*。
2. **两步与来源**：MoveCopy 的位置在移动前求值，copy 参数绑定移动后的 CurrentObject；源集合保持固定，copy index 显式。Color/ShapeMove 也顺序执行两步。无合法适配的 sequence body 显式拒绝，Previous 不从副本列表顺序推导。新 geometry 产生新 extent；已有 Placed 的来源恢复已做多对象回归。
3. **B 参与及对照**：`fitPool SharedParamVSA` 的结果实际成为参数搜索 survivors，边只改变有界程序宇宙内的调度；无 B 使用相同参数的直接求值且节点数 0。固定宇宙差分为 {diff_summary}，完整宇宙存档见 validation/differential.json。这是有界候选一致性，不是完整 DSL 证明；真实 ARC 若 representative/case budget 截断，不能要求搜索到的前缀相同。
4. **双层 witness**：程序与输入独立重放 Transform；Render 按真实覆盖顺序折叠像素，Python 再核验。Object-Count/Emitted-Object/Render/Train/Witness 五类指标分别输出。同色发射物体在渲染后合并不会使像素证据失效；旧 emitted exact 定义未改，也没有强迫双射。
5. **真实解题与成本**：以本报告实测矩阵为准。FullD train-exact {full['train_exact']}/400，fallback-required {full['fallback_required']}/400。首解 work/time 与 total-to-budget work/time 在 per_task.csv，未找到首解为 null；只有共同完成题才比较确定性 work。仅在新增 ID 的 selected_composed 与消融证据支持时归因于组合，训练精确不等于真实规律或 test 泛化。

## 5. 验证、资源与限制

{len(suites)} 个套件退出码均为 0。Stage D 基础单元断言 {suites['StageD']['assertions']} 条，完整差分/负控制断言 {suites['StageDFull']['assertions']} 条，严格对照与兼容边界断言 {suites.get('StageDControl',{}).get('assertions')} 条；InducedR2 只打印套件成功，断言数为 null。迁移宇宙 {migration['candidates']} 个候选、{migration['inputs']} 组输入，共 {migration['comparisons']} 次比较，另有 960 个重叠发射对象的合法旧程序边界比较。非法除零、颜色、计数、SizeSig、越界、非唯一选择、Previous、矛盾训练和对角交叉明确拒绝。

固定 {memory_summary['SharedParamVSA']['candidates']} 个唯一候选的独立进程内存实验：共享池 {memory_summary['SharedParamVSA']['nodes']} 个节点，GC 后 retained delta 中位 {memory_summary['SharedParamVSA']['median_retained_delta_bytes']} bytes；不建图 {memory_summary['NoParamVSA']['nodes']} 节点、{memory_summary['NoParamVSA']['median_retained_delta_bytes']} bytes。该实验隔离的是整个参数池增量，不把序列化估计冒充每道 ARC 的 DAG heap。ARC 另报实际进程 peak live heap。

逆向约束当前主要覆盖唯一选中源对象和可解释的复制角色；更一般的情况走有限联合 fallback，可能截断或无 fit。程序深度≤2，参数/模板/代表上限会保留 deferred frontier，未声称最优。B 的确认只保留现有案例相对含义，没有宣称全域证明；只有参数 VSA，没有 Shape/Set 的通用图。

复现：`./scripts/run_stage_d.ps1`（构建→12 套件→内存→机制矩阵→ARC→逐题审计），随后 `python -I scripts/report_stage_d.py` 生成本报告与顶层汇总。已有 raw batch 时脚本拒绝覆盖；恢复用 `arc_stage_d.py run`，重汇总用 `report`。完整报告生成器执行的审计断言也属于验收。

评测之后还完成一个迁移接口边界修复：旧 C 的合法重叠发射可多于 900，MigratedBody 不应继承新 typed-program 的 900 发射预算。960 个发射对象的独立渲染比较及 Merge 后 Width 从 1 重建为 3、再供 A 位置表达式使用的测试通过。此修复不改 legacy emitObjects 求解路径或任何新 Pipeline 的预算；冻结评测二进制、最终兼容性实现二进制与源码快照分别保留并记录哈希，不将最后一版哈希冒充早期测评版本。
'''
    (ROOT / 'docs/LATIS_STAGE_D_REPORT.md').write_text(report, encoding='utf-8')
    print(json.dumps({'arc': {c:r['train_exact'] for c,r in metrics['configs'].items()},
                      'mechanism_records': len(mech['summary'])*3*8, 'validation_suites': len(suites)}, ensure_ascii=False))


if __name__ == '__main__':
    main()
