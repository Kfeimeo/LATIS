| task | work | w1 median s | w2 median s | w4 median s | w4 -qg median s | w2 speedup | w4 speedup | w4 -qg speedup | w2 actual/discarded | w4 actual/discarded | w4 -qg actual/discarded |
|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| A-match-pruning | 61 | 0.0007 | 0.0009 | 0.0010 | 0.0010 | 0.84x | 0.72x | 0.75x | 8/0 (eval 0) | 8/0 (eval 0) | 8/0 (eval 0) |
| B-transform-reuse | 83 | 0.0008 | 0.0011 | 0.0011 | 0.0011 | 0.73x | 0.71x | 0.68x | 24/0 (eval 0) | 24/0 (eval 0) | 24/0 (eval 0) |
| C-depth-three | 3678 | 0.1308 | 0.1254 | 0.2143 | 0.1612 | 1.04x | 0.61x | 0.81x | 1736/0 (eval 0) | 1736/0 (eval 0) | 1736/0 (eval 0) |
| D-irrelevant-library | 61 | 0.0022 | 0.0012 | 0.0016 | 0.0017 | 1.78x | 1.37x | 1.32x | 8/0 (eval 0) | 8/0 (eval 0) | 8/0 (eval 0) |
| E-scene-construction | 1109 | 0.0000 | 0.0001 | 0.0002 | 0.0002 | 0.12x | 0.06x | 0.06x | 0/0 (eval 0) | 0/0 (eval 0) | 0/0 (eval 0) |
| F-intensional-ref | 9951 | 0.3559 | 0.4165 | 0.4839 | 0.4600 | 0.85x | 0.74x | 0.77x | 4680/0 (eval 0) | 4680/0 (eval 0) | 4680/0 (eval 0) |
| G-invalid-abstraction | 9890 | 0.0000 | 0.0001 | 0.0002 | 0.0002 | 0.08x | 0.05x | 0.04x | 0/0 (eval 0) | 0/0 (eval 0) | 0/0 (eval 0) |

| task | work | 9.10.3 w1 median s | 9.10.3 w4 median s | 9.10.3 w4 speedup | 9.10.3 w4 actual/discarded |
|---|---:|---:|---:|---:|---:|
| A-match-pruning | 61 | 0.0009 | 0.0012 | 0.76x | 8/0 (eval 0) |
| B-transform-reuse | 83 | 0.0009 | 0.0012 | 0.73x | 24/0 (eval 0) |
| C-depth-three | 3678 | 0.1151 | 0.1557 | 0.74x | 1736/0 (eval 0) |
| D-irrelevant-library | 61 | 0.0018 | 0.0019 | 0.93x | 8/0 (eval 0) |
| E-scene-construction | 1109 | 0.0000 | 0.0001 | 0.03x | 0/0 (eval 0) |
| F-intensional-ref | 9951 | 0.4548 | 0.5458 | 0.83x | 4680/0 (eval 0) |
| G-invalid-abstraction | 9890 | 0.0000 | 0.0001 | 0.06x | 0/0 (eval 0) |

w1         A-match-pruning          n=9 closure median 0.0007s [0.0007, 0.0010] front median 0.0012s eval-only 0.0000s (8 terms, 2.5% of closure) max_live 0.1 MB mutator 0 ms, gc 0 ms
w1         B-transform-reuse        n=9 closure median 0.0008s [0.0007, 0.0010] front median 0.0011s eval-only 0.0000s (24 terms, 4.1% of closure) max_live 0.1 MB mutator 0 ms, gc 0 ms
w1         C-depth-three            n=9 closure median 0.1308s [0.0878, 0.2527] front median 0.1342s eval-only 0.0076s (1736 terms, 5.8% of closure) max_live 3.4 MB mutator 94 ms, gc 16 ms
w1         D-irrelevant-library     n=9 closure median 0.0022s [0.0015, 0.0027] front median 0.0040s eval-only 0.0000s (8 terms, 2.0% of closure) max_live 3.4 MB mutator 0 ms, gc 0 ms
w1         E-scene-construction     n=9 closure median 0.0000s [0.0000, 0.0002] front median 0.0009s eval-only 0.0000s (0 terms, 12.4% of closure) max_live 3.4 MB mutator 0 ms, gc 0 ms
w1         F-intensional-ref        n=9 closure median 0.3559s [0.2772, 0.4306] front median 0.3622s eval-only 0.0152s (4680 terms, 4.3% of closure) max_live 9.5 MB mutator 281 ms, gc 62 ms
w1         G-invalid-abstraction    n=9 closure median 0.0000s [0.0000, 0.0000] front median 0.0191s eval-only 0.0000s (0 terms, 5.2% of closure) max_live 9.5 MB mutator 16 ms, gc 0 ms
w2         A-match-pruning          n=9 closure median 0.0009s [0.0008, 0.0010] front median 0.0013s eval-only 0.0000s (8 terms, 2.3% of closure) max_live 0.1 MB mutator 0 ms, gc 0 ms
w2         B-transform-reuse        n=9 closure median 0.0011s [0.0009, 0.0012] front median 0.0014s eval-only 0.0000s (24 terms, 3.4% of closure) max_live 0.1 MB mutator 0 ms, gc 0 ms
w2         C-depth-three            n=9 closure median 0.1254s [0.0944, 0.2391] front median 0.1280s eval-only 0.0072s (1736 terms, 5.7% of closure) max_live 3.6 MB mutator 125 ms, gc 0 ms
w2         D-irrelevant-library     n=9 closure median 0.0012s [0.0011, 0.0021] front median 0.0024s eval-only 0.0000s (8 terms, 2.1% of closure) max_live 3.6 MB mutator 0 ms, gc 0 ms
w2         E-scene-construction     n=9 closure median 0.0001s [0.0001, 0.0003] front median 0.0006s eval-only 0.0000s (0 terms, 0.8% of closure) max_live 3.6 MB mutator 0 ms, gc 0 ms
w2         F-intensional-ref        n=9 closure median 0.4165s [0.3822, 0.4946] front median 0.4222s eval-only 0.0177s (4680 terms, 4.2% of closure) max_live 10.1 MB mutator 359 ms, gc 31 ms
w2         G-invalid-abstraction    n=9 closure median 0.0001s [0.0001, 0.0001] front median 0.0240s eval-only 0.0000s (0 terms, 0.6% of closure) max_live 10.1 MB mutator 31 ms, gc 0 ms
w4         A-match-pruning          n=9 closure median 0.0010s [0.0009, 0.0011] front median 0.0015s eval-only 0.0000s (8 terms, 2.1% of closure) max_live 0.1 MB mutator 0 ms, gc 0 ms
w4         B-transform-reuse        n=9 closure median 0.0011s [0.0010, 0.0015] front median 0.0014s eval-only 0.0000s (24 terms, 3.0% of closure) max_live 0.1 MB mutator 0 ms, gc 0 ms
w4         C-depth-three            n=9 closure median 0.2143s [0.1032, 0.2722] front median 0.2178s eval-only 0.0063s (1736 terms, 2.9% of closure) max_live 3.6 MB mutator 156 ms, gc 16 ms
w4         D-irrelevant-library     n=9 closure median 0.0016s [0.0013, 0.0026] front median 0.0031s eval-only 0.0000s (8 terms, 2.2% of closure) max_live 3.6 MB mutator 0 ms, gc 0 ms
w4         E-scene-construction     n=9 closure median 0.0002s [0.0001, 0.0003] front median 0.0009s eval-only 0.0000s (0 terms, 0.9% of closure) max_live 3.6 MB mutator 0 ms, gc 0 ms
w4         F-intensional-ref        n=9 closure median 0.4839s [0.4155, 0.6243] front median 0.4883s eval-only 0.0168s (4680 terms, 3.5% of closure) max_live 10.1 MB mutator 500 ms, gc 16 ms
w4         G-invalid-abstraction    n=9 closure median 0.0002s [0.0001, 0.0002] front median 0.0233s eval-only 0.0000s (0 terms, 0.3% of closure) max_live 10.1 MB mutator 16 ms, gc 0 ms
w4 -qg     A-match-pruning          n=9 closure median 0.0010s [0.0009, 0.0015] front median 0.0016s eval-only 0.0000s (8 terms, 2.3% of closure) max_live 0.1 MB mutator 0 ms, gc 0 ms
w4 -qg     B-transform-reuse        n=9 closure median 0.0011s [0.0010, 0.0013] front median 0.0016s eval-only 0.0000s (24 terms, 3.7% of closure) max_live 0.1 MB mutator 0 ms, gc 0 ms
w4 -qg     C-depth-three            n=9 closure median 0.1612s [0.1437, 0.3524] front median 0.1642s eval-only 0.0067s (1736 terms, 4.2% of closure) max_live 3.6 MB mutator 203 ms, gc 16 ms
w4 -qg     D-irrelevant-library     n=9 closure median 0.0017s [0.0013, 0.0023] front median 0.0034s eval-only 0.0000s (8 terms, 2.6% of closure) max_live 3.6 MB mutator 0 ms, gc 0 ms
w4 -qg     E-scene-construction     n=9 closure median 0.0002s [0.0001, 0.0003] front median 0.0009s eval-only 0.0000s (0 terms, 0.5% of closure) max_live 3.6 MB mutator 0 ms, gc 0 ms
w4 -qg     F-intensional-ref        n=9 closure median 0.4600s [0.4275, 0.6707] front median 0.4664s eval-only 0.0171s (4680 terms, 3.7% of closure) max_live 10.1 MB mutator 562 ms, gc 0 ms
w4 -qg     G-invalid-abstraction    n=9 closure median 0.0002s [0.0002, 0.0002] front median 0.0231s eval-only 0.0000s (0 terms, 0.3% of closure) max_live 10.1 MB mutator 16 ms, gc 0 ms
w1 -qg     A-match-pruning          n=9 closure median 0.0010s [0.0007, 0.0020] front median 0.0014s  max_live 0.2 MB mutator 0 ms, gc 0 ms
w1 -qg     B-transform-reuse        n=9 closure median 0.0008s [0.0007, 0.0013] front median 0.0013s  max_live 1.3 MB mutator 0 ms, gc 0 ms
w1 -qg     C-depth-three            n=9 closure median 0.1113s [0.0874, 0.2618] front median 0.1133s  max_live 27.2 MB mutator 78 ms, gc 31 ms
w1 -qg     D-irrelevant-library     n=9 closure median 0.0022s [0.0016, 0.0053] front median 0.0048s  max_live 27.2 MB mutator 0 ms, gc 0 ms
w1 -qg     E-scene-construction     n=9 closure median 0.0000s [0.0000, 0.0000] front median 0.0009s  max_live 27.2 MB mutator 0 ms, gc 0 ms
w1 -qg     F-intensional-ref        n=9 closure median 0.4589s [0.3992, 0.5162] front median 0.4646s  max_live 95.1 MB mutator 266 ms, gc 156 ms
w1 -qg     G-invalid-abstraction    n=9 closure median 0.0000s [0.0000, 0.0000] front median 0.0195s  max_live 95.1 MB mutator 16 ms, gc 0 ms
9.10.3 w1  A-match-pruning          n=9 closure median 0.0009s [0.0007, 0.0026] front median 0.0012s  max_live 0.2 MB mutator 0 ms, gc 0 ms
9.10.3 w1  B-transform-reuse        n=9 closure median 0.0009s [0.0006, 0.0012] front median 0.0011s  max_live 1.3 MB mutator 0 ms, gc 0 ms
9.10.3 w1  C-depth-three            n=9 closure median 0.1151s [0.0890, 0.3019] front median 0.1208s  max_live 27.5 MB mutator 62 ms, gc 31 ms
9.10.3 w1  D-irrelevant-library     n=9 closure median 0.0018s [0.0010, 0.0020] front median 0.0034s  max_live 27.5 MB mutator 0 ms, gc 0 ms
9.10.3 w1  E-scene-construction     n=9 closure median 0.0000s [0.0000, 0.0000] front median 0.0005s  max_live 27.5 MB mutator 0 ms, gc 0 ms
9.10.3 w1  F-intensional-ref        n=9 closure median 0.4548s [0.3708, 0.5515] front median 0.4615s  max_live 96.0 MB mutator 266 ms, gc 156 ms
9.10.3 w1  G-invalid-abstraction    n=9 closure median 0.0000s [0.0000, 0.0000] front median 0.0273s  max_live 96.0 MB mutator 31 ms, gc 0 ms
9.10.3 w4  A-match-pruning          n=9 closure median 0.0012s [0.0008, 0.0020] front median 0.0016s  max_live 0.2 MB mutator 0 ms, gc 0 ms
9.10.3 w4  B-transform-reuse        n=9 closure median 0.0012s [0.0009, 0.0015] front median 0.0016s  max_live 1.3 MB mutator 0 ms, gc 0 ms
9.10.3 w4  C-depth-three            n=9 closure median 0.1557s [0.0952, 0.3605] front median 0.1580s  max_live 28.3 MB mutator 188 ms, gc 31 ms
9.10.3 w4  D-irrelevant-library     n=9 closure median 0.0019s [0.0012, 0.0024] front median 0.0034s  max_live 28.3 MB mutator 0 ms, gc 0 ms
9.10.3 w4  E-scene-construction     n=9 closure median 0.0001s [0.0001, 0.0002] front median 0.0009s  max_live 28.3 MB mutator 0 ms, gc 0 ms
9.10.3 w4  F-intensional-ref        n=9 closure median 0.5458s [0.4628, 0.5912] front median 0.5530s  max_live 99.0 MB mutator 484 ms, gc 156 ms
9.10.3 w4  G-invalid-abstraction    n=9 closure median 0.0001s [0.0001, 0.0002] front median 0.0319s  max_live 99.0 MB mutator 31 ms, gc 0 ms

stress-w1 vs stress-w4 logical differences: 0
