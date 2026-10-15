# LATIS 测试案例与程序可视化

`scripts/visualize_latis.py` 将已保存的 `solution.json` 与原任务合成单文件 HTML。Python 部分只使用标准库；生成后直接用浏览器打开 HTML，无需网络或服务器。

页面提供题目/模式搜索、失败筛选、train/heldout 输入与标准输出、程序预测、逐像素差异、颜色编号与缩放、格式化程序和可折叠 typed AST、task-local inventions、portfolio 正确候选数量，以及 counterfactual distinguishing input。

## 用户程序：积木工作台

刷新生成后的页面，在“已选程序”下方进入 **程序工作台 · 带类型的积木**。

1. 点击“导入已学程序”，在现有程序上修改；也可以从“新建恒等程序”开始。
2. 点击要替换的积木或空插槽，再点击工具箱中的符号。也支持把工具箱积木拖入目标插槽。
3. 数值常量用滑块或数字框调整；颜色为 0–9，D4 为 0–7，Anchor 用下拉选择。普通整数滑块提供 −30..30 快捷区间，数字框可填写更大的安全整数。
4. `lambda` 的参数类型和变量名可编辑；`let` 有 initializer/body 两个插槽。变量下拉框只列出当前作用域的绑定。修改绑定名后，旧引用会明确报“未绑定变量”，需改成新名字。
5. 页面显示每个节点的推断类型与插槽所需类型，并区分类型错误、空插槽、未确定类型、类型正确的片段以及完整 `Scene → Scene` 程序。

工具箱分为语言构造、常量、高阶/集合操作、观察/构造/运算、task-local inventions。符号范围可切换“全部固定 Base”与“当前任务支持的 TSL”。invention 是当前任务的闭合函数积木；可直接用于高阶函数插槽，或用 `application` 调用。导出时全部展开回 Base，无需添加专用 primitive。

工作台支持撤销/重做，并按任务执行结果分别保存浏览器本地草稿。可“下载草稿 JSON”保存未完成程序，再通过“导入草稿 JSON”恢复。浏览器存储被禁用时，应使用 JSON 保存。

“下载可重放程序”仅在类型完整且为 `Scene → Scene` 时启用。导出文件含 `program`、`typed_ast` 和原任务路径，可以用原脚本执行：

```powershell
python scripts/visualize_latis.py --solution path/to/03560426-user-program.json --out docs/user-program.html
```

用户程序的历史 train/heldout 标记为未知；生成页面后会逐样例显示本次重放是否匹配。编辑器自身仅作类型检查，不在页面内执行 Haskell，也不改写学习结果。类型正确不保证程序运行成功或解题正确：例如 `head` 的空列表、物体超出画布等仍可能执行失败。

浏览器类型检查器包含多态统一、变量作用域和 occurs check。测试涵盖 122 个原 Haskell 内核类型对照、28 个已学程序的 AST 往返、编辑器事件逻辑及用户导出程序的原内核执行：

```powershell
python scripts/check_latis_blocks_kernel.py --runghc E:/ghcup/ghc/9.14.1/bin/runghc.exe
```

编辑器事件测试使用内存 DOM 适配器，不等同于浏览器截图或真实拖放验证。

## 单题

在仓库根目录运行：

```powershell
python scripts/visualize_latis.py `
  --solution results/v03r2/core/03560426/Full `
  --out docs/03560426.html
```

省略所有输入参数时，默认展示 `03560426 / Full`。`--solution` 可以是结果目录或 `solution.json`，可重复指定。原任务从 solution、相邻 task.json 或 execution.json 的命令中自动定位；单题可用 `--task path/to/task.json` 覆盖。

## 批量

```powershell
python scripts/visualize_latis.py `
  --results results/v03r2 `
  --results results/v03r2-stress-matrix `
  --results results/v03r2-diagnostic-matrix `
  --solution results/v03r2/regression/grid-without-prev/NoGroundedLiteralPrior `
  --out docs/latis-explorer.html
```

`--results` 默认只收集 `Full`；用 `--mode all` 展示所有消融，或指定一个模式名。生成的 `docs/latis-explorer.html` 包含本轮 58 个 Full 执行结果以及 1 个 NoGroundedLiteralPrior 对照。

## 预测来源与依赖

脚本从保存的 typed AST 重建表达式，通过 **原 Haskell Base 内核**进行类型检查和执行，再用原 encoder/render 生成预测。每个 AST 节点的类型和原始表达式都必须 round-trip 一致。不会重新执行 synthesis 或修改原实验结果。当前支持本仓库 R/R.1/R.2 的 typed AST 格式和常用标量、坐标、向量、尺寸、空集合 literals；尚不支持的 literal 会明确报告，不能冒充成功预测。

重放需要 GHC 的 `runghc`。脚本先检查 PATH，再检查常见 Windows ghcup 安装位置；也可以显式指定：

```powershell
python scripts/visualize_latis.py --runghc E:/ghcup/ghc/9.14.1/bin/runghc.exe
```

若系统 `python` 环境不可用，本机可使用：

```powershell
& 'C:/Users/gznan/.cache/codex-runtimes/codex-primary-runtime/dependencies/python/python.exe' scripts/visualize_latis.py
```

`--no-predict` 可在没有 GHC 时只展示保存的案例和程序，预测标记为未计算。`--timeout 180` 是整个重放批次的秒数上限。重放失败仍生成页面，并以非零退出码和页面错误说明提醒；没有已选程序的未解题是正常展示状态。

重放使用**当前** Base、默认同色四连通编码器和 renderer，HTML 中明确区别保存的 exact 标记与本次重放。旁边的 `.replay.json` 保存输入/solution/kernel hashes 与每个预测或执行错误。源码或输入变化后，重放结果可能与历史实验不同。

标准输出缺失时显示“未知”；执行失败显示原因；没有程序时不伪造预测。尺寸不同时差异图用紫色表示缺失区域。portfolio 数量是原结果的后置审计，不等同于整个符号 VSA。Heldout 与 counterfactual 信息均不回馈合成或答案选择。

## 核对生成结果

```powershell
python scripts/check_latis_visualization.py docs/latis-explorer.html
```

检查 HTML 嵌入数据与 `.replay.json` 一致、每行预测有效，以及重放结果是否与原保存的 train/heldout exact 标记一致。若刻意更换了内核或任务，标记不一致会导致此检查失败，页面仍可用于调查差异。


## 用户抽象槽

工作台按顺序显示多个抽象槽，最后一个固定为最终程序槽。点击“添加抽象槽”会插入一个命名为 U1、U2 等的恒等 lambda；点击对应“编辑抽象”即可用原有积木修改参数类型和 body。抽象名可修改，已有引用同步更新。

每个抽象必须闭合且类型完整；有参数时用 lambda，零参数时为闭合表达式。可以引用前面的抽象及原任务 invention。不能引用自身或后面的槽。前置抽象出现在工具箱“用户抽象（前置槽）”中；把它放进 application 的 function 插槽，再填写 argument，即可调用。高阶操作（如 map）的 function 插槽也可直接放入类型匹配的抽象。

例如：U1 定义为 `lambda x:IntT. add(x, IntV 1)`；后续抽象可通过 `application(U1, ...)` 复用它。最终槽必须为 `SceneT → SceneT`。所有抽象槽通过检查后才能导出可重放程序；删除被引用的抽象会报告缺失引用，可撤销恢复。

草稿 v2 保存全部抽象槽和最终槽，并兼容旧版单程序草稿。可重放导出既保存编辑信息，又将用户抽象完全展开为 Base typed AST，无需修改求解器或增加 primitive。最多 32 个抽象槽，每个定义及最终展开程序限制为 1500 节点、100 层。


槽内预览和编辑已合并，点击槽标题前的箭头展开或收起；同时编辑一个槽。展开后，“参数与类型”支持增删参数、修改参数名和参数类型，并可填写返回类型声明（留空则自动推断）。参数类型与返回类型共同确定完整抽象类型。多个参数对应嵌套 lambda，调用时逐次 application。

“当前槽参数”提供可无限复制的参数积木：先选择目标插槽，再点击参数，或将参数拖入目标插槽。参数名修改会同步更新其作用域内引用，遇到变量捕获风险则提示名称冲突。删除参数不会猜测如何重写程序，残留引用会显示未绑定错误；可撤销恢复。类型或参数数量修改后，所有后续抽象及最终程序重新检查。


## 文本 IDE 与解释执行

点击“文本 IDE”切换到手写模式，右侧实时显示函数推断类型、声明不匹配或语法错误。输入符号前缀可点击补全候选，也可 Ctrl+Space 提示；符号提示附带 Base 参数类型。文本草稿独立按任务保存在浏览器。“同步到积木槽”会用成功检查的文本程序替换当前积木工作台。

```haskell
shift :: Placed -> Placed
shift obj = Translate obj (vec 1 0)

main :: Scene -> Scene
main scene = mkScene (canvasSize scene) (background scene) (map shift (objects scene))
```

这是 Haskell 风格的 LATIS 语法子集，并非任意 Haskell：每个定义需显式类型声明，参数类型由声明取得；以空格调用函数，嵌套调用用括号。支持有类型的多参数函数、零参数定义、`let x = e in body`、`if ... then ... else ...`、整数、布尔值、`color 3`、`d4 0`、锚点及 `+ - * < <= ==`。多行函数体需要缩进，注释用 `--`。不支持递归、模式匹配、隐式多态或 Base 函数的部分应用；可用命名函数封装高阶参数。定义按顺序可见，最终定义名为 `main`，类型必须为 `Scene -> Scene`。

实时执行通过本地服务调用原 Haskell Base 内核，页面显示当前任务 train/test 的预测网格或执行错误，不重新运行 synthesis。启动：

```powershell
python scripts/serve_latis_ide.py --port 8766 --runghc E:/ghcup/ghc/9.14.1/bin/runghc.exe
```

打开 `http://127.0.0.1:8766/latis-explorer.html`。静态 HTML 仍可编辑、检查和同步积木，但执行需要此服务。服务只监听 localhost，接受当前 explorer 数据集内的任务及有大小限制的 typed AST；执行限时 30 秒。
