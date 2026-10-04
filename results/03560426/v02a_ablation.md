# Core ablations

| 模式 | Expanded | 首解 states | 完整程序/验证 | Partial | 首解 ms 中位数 | 总 ms 中位数 |
|---|---:|---:|---:|---:|---:|---:|
| JointConstraint | 314 | 266 | 1 | 3 | 19.064 | 30.181 |
| NoBidirectionalSkeleton | 502 | 431 | 1 | 4 | 18.268 | 34.251 |
| NoWitnessFirst | 1286 | 1238 | 1 | 3 | 8.607 | 16.492 |
| NoLazyContext | 304 | 304 | 1 | 1 | 11.884 | 11.919 |
| NoStructuralDominance | 314 | 266 | 1 | 3 | 13.926 | 24.303 |
| NoMemoization | 316 | 266 | 3 | 3 | 11.866 | 21.742 |
| Full | 1305 | 1251 | 1 | 7 | 2.545 | 2.753 |
