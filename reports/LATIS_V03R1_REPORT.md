# LATIS v0.3R.1

固定 Base、獨立 `solve-v03r1` 路徑已實作，StructuralPriorCount=0。03560426 train/heldout exact；回歸 train=16/17、heldout=14/17。在線 invention 的後續搜索降低已有因果消融證據；尚未宣稱恢復全部回歸或普遍加速。

## 可重現協議

`python scripts/run_v03r1.py --tests --timeout 90`，然後 `python scripts/make_v03r1_report.py`。所有超參數均可由 CLI 修改，包括輸出目錄；原 v0.3R、v0.3 與 frozen data 不覆寫。每個 mode/task 使用隔離 solver 進程；256 個執行具 source/binary/input SHA256 和具體 command，報告生成時再次校驗現在的檔案。五套 test suites PASS；舊的 roundtrip/regression/hierarchical/induced tests 均保留。

設定：`{"groups": ["core", "regression", "stress", "diagnostic"], "modes": ["Full", "NoOnlineAbstraction", "PostHocOnly", "NoAntiUnification", "NoLambdaLifting", "NoNewWitnessCoverage", "LegacyFamilies"], "budget": 250000, "diagnostic_budget": 25000, "depth": 7, "frontier": 32, "branches": 32, "timeout": 90, "rounds": 2, "inventions": 6, "ast_size": 96, "parameters": 4, "skip_build": false, "tests": true, "force": false}`。

Core/regression/A–J 使用相同開發預算；diagnostics 使用單獨預算。Legacy 的 work units 是另一算法的計量單位，不能直接與新路徑的 states 相除。30 ARC 僅稱 **PreviouslyOpenedDiagnosticSet**，不是新的 unseen audit；不使用 test labels 調整合成。

來源：[protocol.json](../results/v03r1/protocol.json)、[metrics.csv](../results/v03r1/metrics.csv)、[tests.log](../results/v03r1/tests.log)。可用 `--out` 建立新輪次；參數、source 或 binary 改變時會失效 cache，`--force` 強制重新測量。

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

有限 bounds：rounds=2、inventions=6、definition AST≤96、parameters≤4；discovery 最多 160 unique subtrees、512 AU pairs。Macro 部分仍是有限條件化的 definition expansion，不是任意參數的完整逆推，也沒有高階 AU 或 cross-task library。

輸出保存 definition、template、typed parameters、MDL saving、use provenance 和完全 Base 化的 AST。數值 saving 指 portfolio 壓縮；單次命名 scan step 不被宣稱成單程序壓縮。

## Abstraction feedback stress

這是 **同一 task 的 41 個 demands**：先僅由核心 train IO 合成 prefix；從其 actual frontier 發現 inventions，再收到 40 個新的 step function graphs。每個 graph 有 6 個實例，位置與形狀尺寸分別變化，另有獨立未提供給 Learn 的 future input 驗證。baseline 也保留相同 VS memo 和 supported-Base activation；差異是 invention 是否可被調用。不是在兩個 ARC tasks 之間搬運 dictionary。

| Mode | Prefix search | Subsequent search | Discovery units | Total logical work | Hits | Seconds |
| --- | --- | --- | --- | --- | --- | --- |
| Full | 35723 | 280 | 35576 | 71579 | 40 | 27.811 |
| NoOnlineAbstraction | 35723 | 46320 | 0 | 82043 | 0 | 13.644 |
| PostHocOnly | 35723 | 46320 | 36705 | 118748 | 0 | 30.456 |
| NoAntiUnification | 35723 | 280 | 10552 | 46555 | 40 | 16.416 |
| NoLambdaLifting | 35723 | 280 | 2521 | 38524 | 40 | 12.287 |
| NoNewWitnessCoverage | 14391 | 280 | 35576 | 50247 | 40 | 22.02 |

Full 後續 search=280 < NoOnlineAbstraction=46320；包括 discovery logical units 的整個 session=71579 < 82043。實際 invention hits=40，不是把子題答案預填進 memo。**整段 wall time 仍是 Full 27.811s 對 baseline 13.644s；本次並未取得整體時間加速。** PostHocOnly 不安裝可用 macro，後續 search 應與 NoOnlineAbstraction 一致；NoAntiUnification / NoLambdaLifting 仍能學 exact closed Attach-like subtree，因此該 fixture 並不證明 AU/lifting 對這個 exact subtree 必要。

另有 parameterized AU 測試：相似而不相同的 affine AST frontier 產生 closed typed definition；前綴 specification 支持的候選可 generalized，Learn 在新的 coefficient 上 actual hit=1。這個 unit 使用人工提供、經 specification 驗證的 candidate frontier，與上表全程由 Learn 產生的 frontier stress 分開報告。NoAntiUnification / NoLambdaLifting 都不能在該參數化案例產生同一通用 definition。lambda lifting、MDL false abstraction、type mismatch、capture / over-generalization rejection 均測試。

discovery units 具體計 AST visits、AU pair attempts、lifting attempts、portfolio-program MDL evaluations；search units 計 Learn、propagation、witness/lookahead、expression row checks、macro expansion checks。它們不是 CPU instruction、完整求值步數或 elapsed seconds。Seconds 單列，不推論所有任務加速。開發中 20 demands 未能攤銷較完整的 discovery 計量，fixture 延長到 40；這裡的 whole-session 勝利只宣稱此長度與配置，短任務仍可能淨虧損。

原始證據：[abstraction_stress.json](../results/v03r1/abstraction_stress.json)。此 harness 只對上述 search/discovery/hit 計數做驗收；其他 inherited root-only counters 不用來估算成本。

## 全部消融與覆蓋率

每格為 train exact ; heldout exact。

| Mode | 03560426 | 17 regressions | A–J | 30 previously-opened diagnostics |
| --- | --- | --- | --- | --- |
| Full | 1/1 ; 1/1 | 16/17 ; 14/17 | 9/10 ; 5/10 | 2/30 ; 1/30 |
| NoOnlineAbstraction | 1/1 ; 1/1 | 16/17 ; 14/17 | 9/10 ; 5/10 | n/a |
| PostHocOnly | 1/1 ; 1/1 | 16/17 ; 14/17 | 9/10 ; 5/10 | n/a |
| NoAntiUnification | 1/1 ; 1/1 | 16/17 ; 14/17 | 9/10 ; 5/10 | n/a |
| NoLambdaLifting | 1/1 ; 1/1 | 16/17 ; 14/17 | 9/10 ; 5/10 | n/a |
| NoNewWitnessCoverage | 1/1 ; 1/1 | 16/17 ; 14/17 | 9/10 ; 5/10 | n/a |
| LegacyFamilies | 1/1 ; 1/1 | 17/17 ; 17/17 | 9/10 ; 9/10 | 0/30 ; 0/30 |

NoOnlineAbstraction 不做 discovery/feedback；PostHocOnly discovery 後不啟用；NoAntiUnification 只 exact pattern + lifting；NoLambdaLifting 拒絕 open pattern；NoNewWitnessCoverage 使用原 R witnesses、同一新 Engine/observers/abstraction，因此它隔離 witness/spec backpropagation，未撤銷所有新 observer coverage。LegacyFamilies 呼叫原 solve-v03，單独列出，不將手寫 codec/family 算入新 solver。

失敗 taxonomy：

| Set | Full failures |
| --- | --- |
| regression | {'None': 14, 'BaseExpressibilityUnknown': 1, 'AbstractionMissing': 2} |
| stress | {'None': 5, 'AbstractionMissing': 4, 'WitnessMissing': 1} |
| diagnostic | {'BaseExpressibilityUnknown': 17, 'WitnessMissing': 2, 'SpecificationRepresentationMissing': 2, 'SearchFailure': 7, 'None': 1, 'AbstractionMissing': 1} |

## 剩餘回歸診斷

| Task | Train | Heldout | Classification | Portfolio heldout exact | Portfolio size |
| --- | --- | --- | --- | --- | --- |
| fold-bbox | False | False | BaseExpressibilityUnknown | 0 | 0 |
| grid-without-prev | True | False | AbstractionMissing | 0 | 2 |
| scan-reverse | True | False | AbstractionMissing | 0 | 32 |

對 `grid-without-prev`，兩個 training examples 的 x 位移恰好都是 10，short constant alternative 能擬合；shared-output terminal policy 會關閉該 scalar subproblem。generic inclusive canvas coordinate 需要 width/height−1 的多層 composition，有限 inverse domain / depth 與 MDL/frontier 仍可能錯失該關係。輸出不是「Base 缺少 GridBR」；隔離 reference 使用普通 coord/subtract/width/height 即可。

對 `scan-reverse`，seed 與 tail 是 scan 的獨立 operands；訓練中 cardinality/y ordering 的 head 恰好重合目標，可能與真正 reverse-x tail 混搭。同一 semantic observation 只保留兩個 syntax aliases，較長的 reverse-x head 可能先被去掉；再加上 forward-terminal policy，head 的其他推導不會繼續探索。generic scan 語義並不要求 seed 來自同一排序 list，solver 不能偷加專用 sequence family。需要更好的 generic let/sharing、head/functional-argument witness、dependency specification 或 ranking/portfolio coverage，而不是聲稱 Base 無法表示。

`portfolio_diagnostics.json` 是 selection 之後才執行的 heldout audit，沒有回饋搜索；表中數字區分「泛化候選在 frontier 中但未選中」和「目前 frontier 也沒包含它」。depth/frontier/observers/witness 的有限限制仍可能造成搜索退化。fold-bbox 仍需 richer residual/constructor reachability 的分析，禁止把 canonical correspondence 的失败升級成全語言的 impossibility。

## 03560426

train=true、heldout=true，StructuralPriorCount=0。`scan` 仍由 generic step graph witness 激活。自动 I0 的 closed definition：

```text
(lambda __r1b0:PairT PlacedT PlacedT. Translate(snd(__r1b0),coordDelta(Anchor(fst(__r1b0),BR),Anchor(snd(__r1b0),TL))))
```

其 Attach-like 含義只是人的事後解釋；名稱與構造未進入 solver 規則。core search before discovery=35723、after discovery=1770、discovery=38149、actual hits=4。重跑本身有成本，不能把後續降低當成單題總體加速。TSL 是非空 bounded root VS support 與 task definitions。

[Core trace](../results/v03r1/core/03560426/Full/induced_tsl_trace.md)、[TSL](../results/v03r1/core/03560426/Full/induced_tsl.json)、[VS](../results/v03r1/core/03560426/Full/version_space.json)。

## 兩個最終問題

**更完整 witness/specification 是否恢復 generic Base 可達性？** 已恢復部分，range 的新/舊 coverage 消融提供直接證據；列出的 generic operators 有 sound partial inverse 與 relational support。回歸結果為 16/17 train、14/17 heldout，不能宣稱 17/17 已達成。剩餘退化已區分 Base expression 存在、spec/witness domain、有限搜索與 abstraction selection。

**task-local invention 是否第一次真正降低後續 synthesis search？** 是。Full 在 40-demand 同 task stress 的後續 work=280，NoOnlineAbstraction=46320；含本次 logical discovery 計量的 session 也降低。這是有範圍的因果證據，不是跨 task transfer 或一般速度保證。

本階段沒有 neural network、cross-task library、split/union/occlusion 新 operator、task-specific primitive 或新 structural family。cross-task library learning 尚未實作。
