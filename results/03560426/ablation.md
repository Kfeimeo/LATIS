# Ablation results

Same encoder, operators, coordinate-relation grammar, state budget and exact verifier in all modes. Input encoding is cached once. Direct and NoWitness enumerate bounded numeric constants; witnesses derive constants from specifications. The selected 03560426 solution uses no numeric vector constants. Times are monotonic wall-clock medians of 5 runs.

| Mode | Solved | Expanded | Complete | Partial | First states | First seconds (median) | Total seconds (median) | L | K | Witness holes | Enumerated holes |
|---|---|---:|---:|---:|---:|---:|---:|---:|---:|---:|---:|
| Full | True | 1305 | 1 | 7 | 1251 | 3.4935e-3 | 3.8129e-3 | 23 | 14 | 10 | 0 |
| NoEffect | True | 1367 | 1 | 7 | 1265 | 2.2759e-3 | 2.3588e-3 | 23 | 14 | 10 | 0 |
| NoDependency | True | 2210 | 267 | 92 | 513 | 1.9791e-3 | 4.7845e-3 | 23 | 14 | 20 | 0 |
| NoWitness | True | 11649 | 10519 | 7 | 6935 | 1.68459e-2 | 2.88518e-2 | 23 | 14 | 0 | 2 |
| Direct | True | 88883 | 88837 | 46 | 7315 | 1.81981e-2 | 0.3103412 | 23 | 14 | 0 | 100 |
