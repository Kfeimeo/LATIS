"""Validate current binary/source/data provenance and report all R.1 runs."""
import argparse
import collections
import csv
import json
import pathlib
from run_v03r import ROOT, digest, validate_inputs
from run_v03r1 import MODES

def table(headers,rows):
    return '\n'.join(['| '+' | '.join(headers)+' |','| '+' | '.join(['---']*len(headers))+' |']+['| '+' | '.join(map(str,r))+' |' for r in rows])

def main():
    parser=argparse.ArgumentParser()
    parser.add_argument('--out',type=pathlib.Path,default=ROOT/'results/v03r1')
    parser.add_argument('--report',type=pathlib.Path,default=ROOT/'LATIS_V03R1_REPORT.md')
    a=parser.parse_args()
    out=a.out.resolve()
    manifest,_,_=validate_inputs()
    protocol=json.loads((out/'protocol.json').read_text())
    fp=protocol['fingerprint']
    for name,h in fp['source_sha256'].items(): assert digest(ROOT/name)==h, f'current source drift: {name}'
    previous=json.loads((ROOT/'results/v03r/protocol.json').read_text())
    unchanged=['src/Language/Induced/Base.hs','src/ARC/InducedEvaluate.hs']
    unchanged += [x for x in previous['fingerprint']['source_sha256'] if x.startswith('src/Synthesis/Induced/')]
    for name in unchanged: assert digest(ROOT/name)==previous['fingerprint']['source_sha256'][name],f'old R path changed: {name}'
    assert protocol['frozen_manifest_hash']==manifest['hash']
    for name,h in protocol['task_sha256'].items(): assert digest(ROOT/name)==h
    groups={g:json.loads((out/g/'comparison.json').read_text()) for g in ['core','regression','stress','diagnostic']}
    expected={'core':7,'regression':119,'stress':70,'diagnostic':60}
    forbidden={'ScanP','MapPose','ProgressionTask','Attach','WitnessAttach','Progression','Start','OrderedPoseSequence'}
    failures={'None','ProvenBaseMissing','BaseExpressibilityUnknown','WitnessMissing','SpecificationRepresentationMissing','SearchFailure','AbstractionMissing','ImplementationBug'}
    binaries=set()
    for g,rows in groups.items():
        assert len(rows)==expected[g]
        assert len({(r['task'],r['ablation']) for r in rows})==len(rows)
        for r in rows:
            directory=out/g/r['task']/r['ablation']
            execution=json.loads((directory/'execution.json').read_text())['protocol']
            assert execution['fingerprint']==fp
            assert execution['input_sha256']==r['input_sha256']
            command=execution['command']; binaries.add(command[0])
            assert digest(pathlib.Path(command[command.index('--task')+1]))==r['input_sha256']
            if g=='diagnostic': assert r['evaluation_set']=='PreviouslyOpenedDiagnosticSet'
            if r['ablation']!='LegacyFamilies':
                assert r['failure'] in failures and r['failure']!='ProvenBaseMissing', 'no impossibility certificate implemented'
                if not r.get('external_timeout'):
                    assert r['statistics']['structural_prior_count']==0
                    symbols={s['symbol'] for s in r['base_activated']}
                    assert not symbols & forbidden
                    assert len(r['task_invented'])<=protocol['configuration']['inventions']
    for binary in binaries: assert digest(pathlib.Path(binary))==fp['binary_sha256']
    # Windows GHC diagnostics use the host console encoding; PASS markers are
    # ASCII. Preserve raw log bytes and tolerate non-UTF8 diagnostic punctuation.
    log=(out/'tests.log').read_text(encoding='utf-8',errors='replace')
    for suite in ['latis-tests','joint-tests','latent-tests','induced-tests','induced-r1-tests']:
        assert f'Test suite {suite}: PASS' in log
    stress=json.loads((out/'abstraction_stress.json').read_text())
    assert stress['all_checks_passed'] and stress['parameterized_feedback_hits']>0
    assert stress['range_reachable_with_new_coverage'] and not stress['range_reachable_without_new_coverage']
    sm={r['mode']:r for r in stress['modes']}
    sf=sm['Full']['statistics']; sn=sm['NoOnlineAbstraction']['statistics']
    assert sf['invention_hits']>0 and sf['synthesis_work_after_discovery']<sn['synthesis_work_after_discovery']
    assert sf['total_expanded_work']<sn['total_expanded_work']
    assert len(stress['expressibility_certificates'])==2
    assert all(x['train_and_heldout_exact'] and not x['solver_access'] for x in stress['expressibility_certificates'])
    for path in (ROOT/'src/Synthesis/InducedR1').glob('*.hs'):
        assert 'import Synthesis.Skeleton' not in path.read_text() and 'import Synthesis.Hierarchical' not in path.read_text()

    def selected(g,m='Full'): return [r for r in groups[g] if r['ablation']==m]
    def train(rows): return sum(r['train_exact'] for r in rows)
    def held(rows): return sum(r['heldout_exact'] for r in rows)
    coverage=[]
    for m in MODES:
        row=[m]
        for g in ['core','regression','stress','diagnostic']:
            rs=selected(g,m)
            row.append(f'{train(rs)}/{len(rs)} ; {held(rs)}/{len(rs)}' if rs else 'n/a')
        coverage.append(row)
    core=selected('core')[0]
    assert core['train_exact'] and core['heldout_exact']
    assert any('scan'==s['symbol'] for s in core['base_activated'])
    assert core['task_invented']
    core_stats=core['statistics']
    feedback=table(['Mode','Prefix search','Subsequent search','Discovery units','Total logical work','Hits','Seconds'],
        [[r['mode'],r['statistics']['synthesis_work_before_discovery'],r['statistics']['synthesis_work_after_discovery'],
          r['statistics']['abstraction_discovery_work'],r['statistics']['total_expanded_work'],r['statistics']['invention_hits'],round(r['wall_clock_seconds'],3)] for r in stress['modes']])
    remaining=[]
    for r in selected('regression'):
        if r['train_exact'] and r['heldout_exact']: continue
        audit=out/'regression'/r['task']/'Full/portfolio_diagnostics.json'
        candidates=json.loads(audit.read_text())['candidates'] if audit.exists() else []
        remaining.append([r['task'],r['train_exact'],r['heldout_exact'],r['failure'],sum(p['heldout_exact'] for p in candidates),len(candidates)])
    taxonomy=[]
    for g in ['regression','stress','diagnostic']:
        taxonomy.append([g,dict(collections.Counter(r['failure'] for r in selected(g)))])
    metric_keys=sorted({k for rows in groups.values() for r in rows for k in r.get('statistics',{})})
    with (out/'metrics.csv').open('w',encoding='utf-8',newline='') as f:
        writer=csv.DictWriter(f,fieldnames=['group','task','mode','train_exact','heldout_exact','failure']+metric_keys)
        writer.writeheader()
        for g,rows in groups.items():
            for r in rows: writer.writerow(dict(group=g,task=r['task'],mode=r['ablation'],train_exact=r['train_exact'],heldout_exact=r['heldout_exact'],failure=r['failure'],**r.get('statistics',{})))
    summary={'configuration':protocol['configuration'],'coverage':coverage,'abstraction_stress':stress,'failure_taxonomy':taxonomy,'remaining_regression':remaining}
    (out/'summary.json').write_text(json.dumps(summary,indent=2)+'\n',encoding='utf-8')
    new_train=train(selected('regression')); new_held=held(selected('regression'))
    report=f'''# LATIS v0.3R.1

固定 Base、獨立 `solve-v03r1` 路徑已實作，StructuralPriorCount=0。03560426 train/heldout exact；回歸 train={new_train}/17、heldout={new_held}/17。在線 invention 的後續搜索降低已有因果消融證據；尚未宣稱恢復全部回歸或普遍加速。

## 可重現協議

`python scripts/run_v03r1.py --tests --timeout 90`，然後 `python scripts/make_v03r1_report.py`。所有超參數均可由 CLI 修改，包括輸出目錄；原 v0.3R、v0.3 與 frozen data 不覆寫。每個 mode/task 使用隔離 solver 進程；256 個執行具 source/binary/input SHA256 和具體 command，報告生成時再次校驗現在的檔案。五套 test suites PASS；舊的 roundtrip/regression/hierarchical/induced tests 均保留。

設定：`{json.dumps(protocol['configuration'],ensure_ascii=False)}`。

Core/regression/A–J 使用相同開發預算；diagnostics 使用單獨預算。Legacy 的 work units 是另一算法的計量單位，不能直接與新路徑的 states 相除。30 ARC 僅稱 **PreviouslyOpenedDiagnosticSet**，不是新的 unseen audit；不使用 test labels 調整合成。

來源：[protocol.json](results/v03r1/protocol.json)、[metrics.csv](results/v03r1/metrics.csv)、[tests.log](results/v03r1/tests.log)。可用 `--out` 建立新輪次；參數、source 或 binary 改變時會失效 cache，`--force` 強制重新測量。

## Expressible 與 Reachable

`Expressible(B)` 是存在一個 Base 程序；`Reachable(B,S,W,bounds)` 是目前 specification、witness、observation、TSL 與有限搜索能找到該程序。exact Base AST 是前者的構造性證據，搜索失敗不是反證。

新 taxonomy：ProvenBaseMissing / BaseExpressibilityUnknown / WitnessMissing / SpecificationRepresentationMissing / SearchFailure / AbstractionMissing / ImplementationBug。這次 **沒有 ProvenBaseMissing**：未實作全語言不可表達性證明器。geometry/correspondence 缺口只標 Unknown；budget/deadline 超限標 SearchFailure；canonical residual 缺口標 SpecificationRepresentationMissing。heldout 失敗標 AbstractionMissing，表示選擇的訓練抽象不足，不代表不存在泛化程序。

`grid-without-prev` 與 `scan-reverse` 的測試附有獨立 Base 表達式，train+heldout 均 exact，明確證明兩題 Expressible。它們只作隔離檢查，絕不提供給 Learn、observers、invention discovery 或 solver CLI。`fold-bbox` 的 intrinsic shape constructor/correspondence 路徑不足，但無法排除其他長 Base 程序，因此保持 Unknown。

## Deductive coverage

| Operator | 新 specification / witness | 有限域限制 |
| --- | --- | --- |
| filter | 保留順序與 multiplicity，重複元素的 predicate 標籤必須一致 | 無法對同值的兩次出現採取不同決定 |
| fold | 由 conditional Base transition observations 產生中間 trace，最後輸出 exact 後反推 step graph | 2 個直接 list domains；Int seed 5 個，其餘 2 個；closed parameter observers；不是完整 fold inverse |
| sortBy | FunctionOrder key inequalities，穩定排序的 tie 必須滿足原次序 | bounded key observations；不任意指定 exact rank |
| argminBy / argmaxBy | extremum 不等式與 first-tie 條件 | 需要觀察到非空來源 list |
| zipWith | Pair input → output graph，長度依 min(a,b) | 各 4 個直接 lists；相同 semantic lists 去除為冗餘 domain |
| range | 連續輸出推出 start / exclusive end | 空 range 保留未決，不猜 bounds |
| if | 真/假 branch 只收到它實際執行的 rows | 條件限定有限 Bool observations，兩側皆需實例 |
| let | typed initializer + lexical environment backpropagation | collection environment、最多 2 個 initializer，環境 binding 少於 3；有意限制 alias explosion |
| arithmetic / Coord / Vec | scalar inverse 支持 observed residual 或跨 rows 共同 residual；component projections；coordinate residual inverse | scalar abs≤4096；coordinate inverse 使用 16 個 right operands，優先保留已 grounded inverse domains |

sort/extremum 的 relational specifications 由普通 Base 函數求值檢查；let/lambda 使用 fresh binder，AU 和 template matching 禁止 binder capture。每個 operator 的 sound inverse decomposition 都有獨立輸入測試。range progression 測試：新 coverage 可達，NoNewWitnessCoverage 不可達；Base 中沒有 Progression。

仍是 sound bounded underapproximation：observer cap、兩個 semantic aliases、witness branch cap、depth/frontier、forward-terminal policy 均可能漏掉程序。沒有將「未被啟動」當成 Base 不可表達性證明。

## Typed abstraction 與在線 loop

第一輪在固定 Base 上 bootstrap 非空 VS support。後續輪只使用 task-supported Base symbols 與 accepted definitions；支持不夠是 task-local Reachable 的限制。不存在預先標記的 Attach/Progression family。所有 dictionaries 都屬於單次 Engine，離開該 task 即丟棄。

1. Extract exact-spec frontier；對 AST 子樹做 alpha-normalization。
2. typed anti-unification 保留共同 syntax，把同 type 的差異變參數；相同差異重用參數。依賴局部 binder 的 mismatch 拒絕，這是 first-order AU 的限制。
3. lambda lifting 將 template 的所有 FV 提升為明確 typed parameters。kernel 再檢查 closed definition。
4. MDL 使用非重疊 portfolio cover：definition = AST length + 2；reference = 2 + 各參數 AST length。包括 dictionary 成本，逐個接受僅當 J_after < J_before，不重複計 nested saving。
5. 加入 task TSL，清除舊 VS memo 的 root replay。後續 Learn 可以直接使用定義；以普通 Base lambda/application 展開，在原 specification 上檢查。參數取 typed finite observations，最多 64 個 invocation products。所有嘗試都計入搜索工作；不使用專用 invention witness。

有限 bounds：rounds={protocol['configuration']['rounds']}、inventions={protocol['configuration']['inventions']}、definition AST≤{protocol['configuration']['ast_size']}、parameters≤{protocol['configuration']['parameters']}；discovery 最多 160 unique subtrees、512 AU pairs。Macro 部分仍是有限條件化的 definition expansion，不是任意參數的完整逆推，也沒有高階 AU 或 cross-task library。

輸出保存 definition、template、typed parameters、MDL saving、use provenance 和完全 Base 化的 AST。數值 saving 指 portfolio 壓縮；單次命名 scan step 不被宣稱成單程序壓縮。

## Abstraction feedback stress

這是 **同一 task 的 41 個 demands**：先僅由核心 train IO 合成 prefix；從其 actual frontier 發現 inventions，再收到 40 個新的 step function graphs。每個 graph 有 6 個實例，位置與形狀尺寸分別變化，另有獨立未提供給 Learn 的 future input 驗證。baseline 也保留相同 VS memo 和 supported-Base activation；差異是 invention 是否可被調用。不是在兩個 ARC tasks 之間搬運 dictionary。

{feedback}

Full 後續 search={sf['synthesis_work_after_discovery']} < NoOnlineAbstraction={sn['synthesis_work_after_discovery']}；包括 discovery logical units 的整個 session={sf['total_expanded_work']} < {sn['total_expanded_work']}。實際 invention hits={sf['invention_hits']}，不是把子題答案預填進 memo。**整段 wall time 仍是 Full {sm['Full']['wall_clock_seconds']:.3f}s 對 baseline {sm['NoOnlineAbstraction']['wall_clock_seconds']:.3f}s；本次並未取得整體時間加速。** PostHocOnly 不安裝可用 macro，後續 search 應與 NoOnlineAbstraction 一致；NoAntiUnification / NoLambdaLifting 仍能學 exact closed Attach-like subtree，因此該 fixture 並不證明 AU/lifting 對這個 exact subtree 必要。

另有 parameterized AU 測試：相似而不相同的 affine AST frontier 產生 closed typed definition；前綴 specification 支持的候選可 generalized，Learn 在新的 coefficient 上 actual hit={stress['parameterized_feedback_hits']}。這個 unit 使用人工提供、經 specification 驗證的 candidate frontier，與上表全程由 Learn 產生的 frontier stress 分開報告。NoAntiUnification / NoLambdaLifting 都不能在該參數化案例產生同一通用 definition。lambda lifting、MDL false abstraction、type mismatch、capture / over-generalization rejection 均測試。

discovery units 具體計 AST visits、AU pair attempts、lifting attempts、portfolio-program MDL evaluations；search units 計 Learn、propagation、witness/lookahead、expression row checks、macro expansion checks。它們不是 CPU instruction、完整求值步數或 elapsed seconds。Seconds 單列，不推論所有任務加速。開發中 20 demands 未能攤銷較完整的 discovery 計量，fixture 延長到 40；這裡的 whole-session 勝利只宣稱此長度與配置，短任務仍可能淨虧損。

原始證據：[abstraction_stress.json](results/v03r1/abstraction_stress.json)。此 harness 只對上述 search/discovery/hit 計數做驗收；其他 inherited root-only counters 不用來估算成本。

## 全部消融與覆蓋率

每格為 train exact ; heldout exact。

{table(['Mode','03560426','17 regressions','A–J','30 previously-opened diagnostics'],coverage)}

NoOnlineAbstraction 不做 discovery/feedback；PostHocOnly discovery 後不啟用；NoAntiUnification 只 exact pattern + lifting；NoLambdaLifting 拒絕 open pattern；NoNewWitnessCoverage 使用原 R witnesses、同一新 Engine/observers/abstraction，因此它隔離 witness/spec backpropagation，未撤銷所有新 observer coverage。LegacyFamilies 呼叫原 solve-v03，單独列出，不將手寫 codec/family 算入新 solver。

失敗 taxonomy：

{table(['Set','Full failures'],taxonomy)}

## 剩餘回歸診斷

{table(['Task','Train','Heldout','Classification','Portfolio heldout exact','Portfolio size'],remaining)}

對 `grid-without-prev`，兩個 training examples 的 x 位移恰好都是 10，short constant alternative 能擬合；shared-output terminal policy 會關閉該 scalar subproblem。generic inclusive canvas coordinate 需要 width/height−1 的多層 composition，有限 inverse domain / depth 與 MDL/frontier 仍可能錯失該關係。輸出不是「Base 缺少 GridBR」；隔離 reference 使用普通 coord/subtract/width/height 即可。

對 `scan-reverse`，seed 與 tail 是 scan 的獨立 operands；訓練中 cardinality/y ordering 的 head 恰好重合目標，可能與真正 reverse-x tail 混搭。同一 semantic observation 只保留兩個 syntax aliases，較長的 reverse-x head 可能先被去掉；再加上 forward-terminal policy，head 的其他推導不會繼續探索。generic scan 語義並不要求 seed 來自同一排序 list，solver 不能偷加專用 sequence family。需要更好的 generic let/sharing、head/functional-argument witness、dependency specification 或 ranking/portfolio coverage，而不是聲稱 Base 無法表示。

`portfolio_diagnostics.json` 是 selection 之後才執行的 heldout audit，沒有回饋搜索；表中數字區分「泛化候選在 frontier 中但未選中」和「目前 frontier 也沒包含它」。depth/frontier/observers/witness 的有限限制仍可能造成搜索退化。fold-bbox 仍需 richer residual/constructor reachability 的分析，禁止把 canonical correspondence 的失败升級成全語言的 impossibility。

## 03560426

train=true、heldout=true，StructuralPriorCount=0。`scan` 仍由 generic step graph witness 激活。自动 I0 的 closed definition：

```text
{core['task_invented'][0]['originating_ast']['expression']}
```

其 Attach-like 含義只是人的事後解釋；名稱與構造未進入 solver 規則。core search before discovery={core_stats['synthesis_work_before_discovery']}、after discovery={core_stats['synthesis_work_after_discovery']}、discovery={core_stats['abstraction_discovery_work']}、actual hits={core_stats['invention_hits']}。重跑本身有成本，不能把後續降低當成單題總體加速。TSL 是非空 bounded root VS support 與 task definitions。

[Core trace](results/v03r1/core/03560426/Full/induced_tsl_trace.md)、[TSL](results/v03r1/core/03560426/Full/induced_tsl.json)、[VS](results/v03r1/core/03560426/Full/version_space.json)。

## 兩個最終問題

**更完整 witness/specification 是否恢復 generic Base 可達性？** 已恢復部分，range 的新/舊 coverage 消融提供直接證據；列出的 generic operators 有 sound partial inverse 與 relational support。回歸結果為 {new_train}/17 train、{new_held}/17 heldout，不能宣稱 17/17 已達成。剩餘退化已區分 Base expression 存在、spec/witness domain、有限搜索與 abstraction selection。

**task-local invention 是否第一次真正降低後續 synthesis search？** 是。Full 在 40-demand 同 task stress 的後續 work={sf['synthesis_work_after_discovery']}，NoOnlineAbstraction={sn['synthesis_work_after_discovery']}；含本次 logical discovery 計量的 session 也降低。這是有範圍的因果證據，不是跨 task transfer 或一般速度保證。

本階段沒有 neural network、cross-task library、split/union/occlusion 新 operator、task-specific primitive 或新 structural family。cross-task library learning 尚未實作。
'''
    try: prefix=out.relative_to(ROOT).as_posix()+'/'
    except ValueError: prefix=out.as_posix()+'/'
    report=report.replace('results/v03r1/',prefix)
    a.report.write_text(report,encoding='utf-8')
    print(f'Validated 256 runs, five suites, immutable Base/old R path; wrote {a.report}')

if __name__=='__main__': main()
