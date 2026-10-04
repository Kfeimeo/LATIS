# Six stress-task ablations

### map-scan-ambiguity

| 模式 | Expanded | 首解 states | 完整程序/验证 | Partial | 首解 ms 中位数 | 总 ms 中位数 |
|---|---:|---:|---:|---:|---:|---:|
| JointConstraint | 1499 | 622 | 16 | 92 | 65.864 | 1640.706 |
| NoBidirectionalSkeleton | 2039 | 622 | 16 | 122 | 70.258 | 2683.373 |
| NoWitnessFirst | 1624 | 1333 | 12 | 57 | 36.080 | 449.557 |
| NoLazyContext | 1415 | 1316 | 16 | 39 | 71.845 | 266.237 |
| NoStructuralDominance | 1499 | 616 | 22 | 92 | 57.811 | 1394.643 |
| NoMemoization | 4989 | 874 | 482 | 1202 | 50.807 | 10140.043 |
| Full | 1820 | 1107 | 14 | 14 | 3.747 | 7.907 |

### true-scan-lazy-prev

| 模式 | Expanded | 首解 states | 完整程序/验证 | Partial | 首解 ms 中位数 | 总 ms 中位数 |
|---|---:|---:|---:|---:|---:|---:|
| JointConstraint | 301 | 253 | 1 | 3 | 16.940 | 26.585 |
| NoBidirectionalSkeleton | 489 | 418 | 1 | 4 | 20.986 | 39.077 |
| NoWitnessFirst | 1277 | 1229 | 1 | 3 | 10.734 | 16.426 |
| NoLazyContext | 291 | 291 | 1 | 1 | 10.771 | 10.785 |
| NoStructuralDominance | 301 | 253 | 1 | 3 | 15.044 | 27.960 |
| NoMemoization | 303 | 253 | 3 | 3 | 12.139 | 21.748 |
| Full | 1300 | 1246 | 1 | 7 | 3.834 | 4.202 |

### grid-without-prev

| 模式 | Expanded | 首解 states | 完整程序/验证 | Partial | 首解 ms 中位数 | 总 ms 中位数 |
|---|---:|---:|---:|---:|---:|---:|
| JointConstraint | 454 | 309 | 42 | 55 | 34.744 | 164.524 |
| NoBidirectionalSkeleton | 598 | 397 | 42 | 67 | 46.319 | 370.758 |
| NoWitnessFirst | 1198 | 1183 | 6 | 7 | 13.331 | 18.335 |
| NoLazyContext | 436 | 291 | 42 | 55 | 21.333 | 119.937 |
| NoStructuralDominance | 454 | 309 | 42 | 55 | 31.430 | 131.145 |
| NoMemoization | 916 | 771 | 42 | 55 | 25.563 | 107.993 |
| Full | 1359 | 1099 | 6 | 6 | 0.824 | 1.234 |

### constant-transform

| 模式 | Expanded | 首解 states | 完整程序/验证 | Partial | 首解 ms 中位数 | 总 ms 中位数 |
|---|---:|---:|---:|---:|---:|---:|
| JointConstraint | 544 | 393 | 36 | 55 | 13.277 | 75.735 |
| NoBidirectionalSkeleton | 544 | 393 | 36 | 55 | 14.417 | 82.400 |
| NoWitnessFirst | 166 | 151 | 6 | 7 | 5.997 | 10.557 |
| NoLazyContext | 544 | 393 | 36 | 55 | 17.892 | 79.238 |
| NoStructuralDominance | 532 | 387 | 42 | 55 | 13.898 | 88.080 |
| NoMemoization | 544 | 393 | 36 | 55 | 10.219 | 77.810 |
| Full | 93 | 18 | 6 | 6 | 0.591 | 1.113 |

### equivalent-expressions

| 模式 | Expanded | 首解 states | 完整程序/验证 | Partial | 首解 ms 中位数 | 总 ms 中位数 |
|---|---:|---:|---:|---:|---:|---:|
| JointConstraint | 473 | 270 | 42 | 67 | 19.436 | 203.891 |
| NoBidirectionalSkeleton | 635 | 270 | 42 | 91 | 19.968 | 539.582 |
| NoWitnessFirst | 1205 | 1150 | 6 | 13 | 8.548 | 40.689 |
| NoLazyContext | 437 | 292 | 42 | 55 | 19.997 | 89.005 |
| NoStructuralDominance | 473 | 270 | 42 | 67 | 14.998 | 174.422 |
| NoMemoization | 2746 | 501 | 546 | 715 | 14.252 | 1106.969 |
| Full | 1365 | 1100 | 6 | 6 | 0.644 | 0.977 |

### wrong-early-skeleton

| 模式 | Expanded | 首解 states | 完整程序/验证 | Partial | 首解 ms 中位数 | 总 ms 中位数 |
|---|---:|---:|---:|---:|---:|---:|
| JointConstraint | 301 | 253 | 1 | 3 | 11.609 | 20.028 |
| NoBidirectionalSkeleton | 489 | 418 | 1 | 4 | 21.945 | 39.501 |
| NoWitnessFirst | 1277 | 1229 | 1 | 3 | 8.297 | 19.494 |
| NoLazyContext | 291 | 291 | 1 | 1 | 12.579 | 12.601 |
| NoStructuralDominance | 301 | 253 | 1 | 3 | 17.872 | 27.579 |
| NoMemoization | 303 | 253 | 3 | 3 | 15.167 | 22.203 |
| Full | 1300 | 1246 | 1 | 7 | 2.978 | 3.131 |
