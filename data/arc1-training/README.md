# ARC-AGI-1 official `training` split (unmodified copy)

All 400 task JSON files of the public ARC-AGI-1 **training** split, copied
byte-for-byte from François Chollet's ARC-AGI repository.

- Upstream: https://github.com/fchollet/ARC-AGI, path `data/training/`
- Upstream commit: `399030444e0ab0cc8b4e199870fb20b863846f34` (same commit as the
  v0.3 frozen subset in `../arc1-frozen/`; the 30 frozen files are a subset of these)
- Downloaded: 2026-10-22 (Asia/Shanghai) via a sparse git checkout
- Per-file SHA256 and the combined hash: `results/arc_agi1_train_only_fallback/data_manifest.json`
- License: Apache-2.0 (Copyright 2019 Francois Chollet); full text in `../ARC-AGI-LICENSE`

Used by `scripts/arc_train_only.py` for the v0.6.1 train-only fallback
experiment. The solver never reads these files directly: `prepare` writes
train-only copies (`test: []`) and the binary refuses files with test pairs.
This is the public training split, not the private evaluation benchmark.
