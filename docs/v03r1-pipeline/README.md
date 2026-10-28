# LATIS v0.3R.1 pipeline 展示图

五张 16:9 图片，PNG 为 3840×2160，SVG 为可编辑矢量原稿。

1. 01-overall-pipeline：训练 IO、typed specification、deductive Learn、VS、frontier、在线 abstraction 与 exact verification。
2. 02-deductive-search：generic filter / scan 的逆语义和 VS 的相关子问题组合；示例值用于教学。
3. 03-typed-abstraction：使用实际参数化测试中的 affine AST 解释 AU、lambda lifting 和 MDL；该单元测试的候选 frontier 人工提供且经过 specification 验证。
4. 04-core-invention：03560426 第一个真实 training pair，以及实际自动发现的 I0。右侧坐标图仅为示意。
5. 05-feedback-evidence：真实的同一 task 40-demand 反馈实验；明确区分逻辑工作降低与总耗时增加。

口头讲解顺序：由 IO 建立函数约束 → 用 operator witness 拆解 → 保存可组合的候选程序 → 从候选 AST 学习闭合函数 → 安装到本 task 的 TSL → 后续 Learn 展开并使用 → 检查原始 grid → 最后才评估 heldout。

第一轮搜索使用固定 Base bootstrap；后续轮使用 supported Base symbols + accepted inventions。最终程序选取使用原 Base rank；invention acceptance 的 portfolio MDL 与最终排序应分开理解。

来源：
- src/Synthesis/InducedR1/Learn.hs
- src/Synthesis/InducedR1/Witness.hs
- src/Synthesis/InducedR1/Abstraction.hs
- src/ARC/InducedR1Evaluate.hs
- test/InducedR1Main.hs
- data/03560426.json
- results/v03r1/core/03560426/Full/induced_tsl.json
- results/v03r1/abstraction_stress.json
- ../../reports/LATIS_V03R1_REPORT.md

重建：使用安装了 Pillow 的 Python 运行 scripts/make_v03r1_pipeline_visuals.py。
图像生成不会更改 solver、Base、旧结果或实验协议。
