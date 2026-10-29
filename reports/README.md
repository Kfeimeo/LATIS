# LATIS 实测报告索引（按阶段）

每个阶段一个目录；设计/审计文档在 `../docs/`，原始结果在 `../results/`，任务提示词在 `../prompts/`。

| 目录 | 报告 | 对应设计 / 审计 |
|---|---|---|
| `v01/` | [LATIS_V01_REPORT.md](v01/LATIS_V01_REPORT.md) | `../ARCHITECTURE.md` |
| `v02a/` | [LATIS_V02A_REPORT.md](v02a/LATIS_V02A_REPORT.md) | — |
| `v03/` | [LATIS_V03_REPORT.md](v03/LATIS_V03_REPORT.md)、[LATIS_V03R_REPORT.md](v03/LATIS_V03R_REPORT.md)、[LATIS_V03R1_REPORT.md](v03/LATIS_V03R1_REPORT.md)、[LATIS_V03R2_REPORT.md](v03/LATIS_V03R2_REPORT.md) | `../docs/v03r1-pipeline/` |
| `v04/` | [LATIS_V04_REPORT.md](v04/LATIS_V04_REPORT.md)、[LATIS_V04_PARALLEL_REPORT.md](v04/LATIS_V04_PARALLEL_REPORT.md) | `../docs/LATIS_V04.md` |
| `v05_collection/` | [LATIS_COLLECTION_REPORT.md](v05_collection/LATIS_COLLECTION_REPORT.md) | `../docs/LATIS_V5(COLLECTION).md` |
| `v06/` | [LATIS_V06_REPORT.md](v06/LATIS_V06_REPORT.md) | `../docs/LATIS_V06.md` |
| `v061/` | [LATIS_V061_REPORT.md](v061/LATIS_V061_REPORT.md)、[LATIS_V061_ARC_TRAIN_ONLY_REPORT.md](v061/LATIS_V061_ARC_TRAIN_ONLY_REPORT.md) | `../docs/LATIS_V061.md`、`../docs/LATIS_V061_ARC_TRAIN_ONLY.md` |
| `stage_a/` | [LATIS_STAGE_A_REPORT.md](stage_a/LATIS_STAGE_A_REPORT.md) | `../docs/LATIS_STAGE_A.md` |
| `stage_b/` | [LATIS_STAGE_B_REPORT.md](stage_b/LATIS_STAGE_B_REPORT.md) | `../docs/LATIS_STAGE_B.md` |
| `stage_c/` | [LATIS_STAGE_C_REPORT.md](stage_c/LATIS_STAGE_C_REPORT.md)、[LATIS_STAGE_C_AUDIT_REPORT.md](stage_c/LATIS_STAGE_C_AUDIT_REPORT.md) | `../docs/LATIS_STAGE_C.md` |
| `stage_d/` | [LATIS_STAGE_D_REPORT.md](stage_d/LATIS_STAGE_D_REPORT.md) | `../docs/LATIS_STAGE_D.md` |
| `stage_d_plus/` | [LATIS_STAGE_D_PLUS_REPORT.md](stage_d_plus/LATIS_STAGE_D_PLUS_REPORT.md) | `../docs/LATIS_STAGE_D_PLUS.md`、`../docs/LATIS_STAGE_D_PLUS_AUDIT.md` |
| `content_first/` | [LATIS_CONTENT_FIRST_REPORT.md](content_first/LATIS_CONTENT_FIRST_REPORT.md) | `../docs/LATIS_CONTENT_FIRST_OUTPUTSPEC.md` |
| `single_io_debugger/` | [LATIS_SINGLE_IO_DEBUGGER_REPORT.md](single_io_debugger/LATIS_SINGLE_IO_DEBUGGER_REPORT.md) | `../docs/LATIS_SINGLE_IO_DEBUGGER.md`、`../docs/LATIS_SINGLE_IO_DEBUGGER_AUDIT.md` |
| `stage_e0_e1/` | [LATIS_STAGE_E0_E1_REPORT.md](stage_e0_e1/LATIS_STAGE_E0_E1_REPORT.md) | `../docs/LATIS_STAGE_E0_E1.md`、`../docs/LATIS_STAGE_E0_E1_AUDIT.md` |
| `stage_e2_e3/` | [LATIS_STAGE_E2_E3_REPORT.md](stage_e2_e3/LATIS_STAGE_E2_E3_REPORT.md) | `../docs/LATIS_STAGE_E2_E3.md`、`../docs/LATIS_STAGE_E2_E3_AUDIT.md` |
| `stage_e31/` | [LATIS_STAGE_E31_REPORT.md](stage_e31/LATIS_STAGE_E31_REPORT.md) | `../docs/LATIS_STAGE_E31.md`、`../docs/LATIS_STAGE_E31_AUDIT.md` |
| `stage_e4/` | [LATIS_STAGE_E4_REPORT.md](stage_e4/LATIS_STAGE_E4_REPORT.md) | `../docs/LATIS_STAGE_E4.md`、`../docs/LATIS_STAGE_E4_AUDIT.md` |

生成报告表格的脚本（`scripts/report_*.py`、`scripts/make_*_report.py`）输出到对应目录。
