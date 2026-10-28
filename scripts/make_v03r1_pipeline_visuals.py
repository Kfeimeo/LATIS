"""Render source-grounded, shareable LATIS v0.3R.1 diagrams (PNG + SVG)."""
from pathlib import Path
from html import escape
import json
import math
import zipfile
from PIL import Image, ImageDraw, ImageFont

ROOT = Path(__file__).resolve().parents[1]
OUT = ROOT / "docs/v03r1-pipeline"
OUT.mkdir(parents=True, exist_ok=True)
W, H, SCALE = 1920, 1080, 2
BG, INK, MUTED, LINE = "#F5F7FB", "#172B43", "#52677E", "#D7E0EC"
BLUE, TEAL, ORANGE = "#2563EB", "#087F8C", "#C46A13"
PALE, TP, OP = "#EAF1FF", "#E7F5F4", "#FFF2E2"
FONT = "C:/Windows/Fonts/msyh.ttc"
MONO = "C:/Windows/Fonts/consola.ttf"
STRESS = json.loads((ROOT / "results/v03r1/abstraction_stress.json").read_text())
CORE = json.loads((ROOT / "results/v03r1/core/03560426/Full/solution.json").read_text())
TSL = json.loads((ROOT / "results/v03r1/core/03560426/Full/induced_tsl.json").read_text())
assert CORE["train_exact"] and CORE["heldout_exact"]
assert CORE["statistics"]["structural_prior_count"] == 0
assert TSL["invented"][0]["name"] == "I0"


class Canvas:
    def __init__(self, name, page, title, subtitle, total=5):
        self.name = name
        self.im = Image.new("RGB", (W*SCALE, H*SCALE), BG)
        self.d = ImageDraw.Draw(self.im)
        self.svg = [f'<svg xmlns="http://www.w3.org/2000/svg" width="1920" height="1080" viewBox="0 0 1920 1080">',
                    f'<rect width="1920" height="1080" fill="{BG}"/>',
                    f'<title>{escape(title)}</title>']
        self.text(72, 37, "LATIS  /  v0.3R.1", 24, BLUE)
        self.text(72, 86, title, 48)
        self.text(74, 151, subtitle, 27, MUTED, limit=1760)
        self.text(1780, 42, f"{page:02d} / {total:02d}", 24, MUTED)

    def rect(self, x, y, w, h, fill="white", radius=18, stroke=None, width=2):
        xy = tuple(round(v*SCALE) for v in (x, y, x+w, y+h))
        self.d.rounded_rectangle(xy, radius=radius*SCALE, fill=fill, outline=stroke, width=width*SCALE)
        attr = f' stroke="{stroke}" stroke-width="{width}"' if stroke else ""
        self.svg.append(f'<rect x="{x}" y="{y}" width="{w}" height="{h}" rx="{radius}" fill="{fill}"{attr}/>')

    def text(self, x, y, s, size=28, color=INK, mono=False, limit=None):
        font = ImageFont.truetype(MONO if mono else FONT, size*SCALE)
        for i, row in enumerate(s.split("\n")):
            yy = y+i*size*1.48
            if limit is not None and self.d.textlength(row, font=font)/SCALE > limit:
                raise ValueError(f"Text overflows {self.name}: {row}")
            if yy+size*1.48 > 1080:
                raise ValueError(f"Text below page: {row}")
            self.d.text((x*SCALE, yy*SCALE), row, font=font, fill=color)
            family = "Consolas, monospace" if mono else "Microsoft YaHei, sans-serif"
            self.svg.append(f'<text x="{x}" y="{yy}" dominant-baseline="text-before-edge" font-family="{family}" font-size="{size}" fill="{color}">{escape(row)}</text>')

    def line(self, points, color=LINE, width=3, dash=False):
        ps = [(round(x*SCALE), round(y*SCALE)) for x,y in points]
        if dash:
            for a,b in zip(points, points[1:]):
                dx,dy=b[0]-a[0],b[1]-a[1]
                n=max(1,int(math.hypot(dx,dy)/12))
                for i in range(0,n,2):
                    p=(a[0]+dx*i/n,a[1]+dy*i/n)
                    q=(a[0]+dx*min(i+1,n)/n,a[1]+dy*min(i+1,n)/n)
                    self.d.line([(int(p[0]*SCALE),int(p[1]*SCALE)),(int(q[0]*SCALE),int(q[1]*SCALE))],fill=color,width=width*SCALE)
        else:
            self.d.line(ps, fill=color, width=width*SCALE)
        extra=' stroke-dasharray="10 8"' if dash else ""
        self.svg.append(f'<polyline points="{" ".join(f"{x},{y}" for x,y in points)}" fill="none" stroke="{color}" stroke-width="{width}"{extra}/>')

    def arrow(self, points, color=BLUE, width=4, dash=False):
        self.line(points,color,width,dash)
        (x0,y0),(x,y)=points[-2:]
        theta=math.atan2(y-y0,x-x0)
        ps=[(x,y),(x-14*math.cos(theta)+7*math.sin(theta),y-14*math.sin(theta)-7*math.cos(theta)),
            (x-14*math.cos(theta)-7*math.sin(theta),y-14*math.sin(theta)+7*math.cos(theta))]
        self.d.polygon([(int(a*SCALE),int(b*SCALE)) for a,b in ps],fill=color)
        self.svg.append(f'<polygon points="{" ".join(f"{a},{b}" for a,b in ps)}" fill="{color}"/>')

    def card(self,x,y,w,h,title,body,fill="white",accent=BLUE,body_size=27):
        self.rect(x,y,w,h,fill)
        self.rect(x,y,6,h,accent,3)
        self.text(x+24,y+20,title,32,INK,limit=w-45)
        self.text(x+24,y+78,body,body_size,MUTED,limit=w-45)

    def footer(self,s):
        self.line([(72,1017),(1848,1017)],LINE,2)
        self.text(74,1033,s,20,MUTED,limit=1770)

    def save(self):
        self.im.save(OUT / f"{self.name}.png", optimize=True)
        (OUT / f"{self.name}.svg").write_text("\n".join(self.svg+["</svg>"]),encoding="utf-8")


def overall():
    c=Canvas("01-overall-pipeline",1,"从训练示例到可执行程序","输入是 ARC 训练 IO；搜索得到普通 Base 程序，并在当前 task 内学习可复用的函数。")
    xs=[72,432,792,1152,1512]
    cards=[("01  训练 IO","输入 / 输出 grids\nEncode → latent Scene\n保留原 grid 做最终验证"),
           ("02  类型化约束","Scene → Scene 函数图\n每个示例是一条约束\n只有训练 labels 进入搜索"),
           ("03  Learn","类型 + 有限观测表达式\ngeneric Base witnesses\n递归求解子约束"),
           ("04  Version space","Leaf：已匹配表达式\nUnion：候选方案\nJoin：组合子程序"),
           ("05  Frontier","提取有限完整 AST\n过滤 exact-spec 程序\n作为 discovery 的证据")]
    for x,(title,body) in zip(xs,cards):
        c.card(x,245,336,235,title,body,body_size=25)
    for x in xs[:-1]: c.arrow([(x+336,361),(x+358,361)])
    c.card(1110,570,738,218,"06  自动 abstraction","Typed anti-unification → lambda lifting\n检查 closed / typed / Base-expandable\n只有 portfolio MDL 净节省 > 0 才接受",TP,TEAL,28)
    c.arrow([(1680,480),(1680,557)],TEAL)
    c.card(650,570,410,218,"07  更新 task-local TSL","已获支持的 Base symbols\n+ 接受的 inventions\n当前 task 结束后丢弃",PALE,BLUE,27)
    c.arrow([(1110,680),(1070,680)],TEAL)
    c.arrow([(650,680),(605,680),(605,525),(960,525),(960,491)],TEAL)
    c.text(80,570,"真正反馈给 Learn",34,TEAL)
    c.text(80,630,"安装函数 → 清除旧 memo\n重学根问题 / 求解后续需求\n调用时展开定义并检查约束",28,MUTED,limit=540)
    c.card(72,846,1180,120,"08  选择与执行","最终 frontier → 原 grid exact verification → rank → 选程序 → heldout 预测",body_size=26)
    c.arrow([(1848,430),(1874,430),(1874,831),(1215,831),(1215,842)],TEAL)
    c.text(1298,799,"停止循环：取最终 frontier",22,TEAL)
    c.text(1300,850,"有限循环",31)
    c.text(1300,898,"最多 2 rounds / 6 inventions\nAST ≤ 96 / 参数 ≤ 4",26,MUTED)
    c.footer("固定 Base · StructuralPriorCount = 0 · 不跨 task 传递 dictionary · heldout 仅在程序选定后评估")
    c.save()


def witness():
    c=Canvas("02-deductive-search",2,"Witness：把输出约束反推为子问题","每个 witness 只解释一个 generic Base operator；不预设 Attach / Progression 等任务结构。")
    c.card(72,236,510,186,"父 specification Q","目标类型 + 环境 + IO points\n函数图 / key ordering constraints",PALE,BLUE,27)
    c.card(675,236,565,186,"条件化 witness","先选有限 observed operands\n按 operator 语义产生相关分解",TP,TEAL,27)
    c.card(1335,236,513,186,"递归 Learn 子问题","每个 child 都有非空 VS 才组合\n任何 child 为空则丢弃该分解",PALE,BLUE,27)
    c.arrow([(582,330),(660,330)])
    c.arrow([(1240,330),(1320,330)])
    c.card(72,484,847,366,"示例 A  /  filter 的 multiplicity","observed xs = [1, 1, 2]\n目标输出 = [1, 1]\n反推 predicate：p(1)=true，p(2)=false\n再 Learn p；并检查构造出的 filter(p,xs)\n\n固定 xs=[1,1] 时不能仅保留一个 1。",body_size=28)
    c.card(959,484,889,366,"示例 B  /  generic scan 的 step graph","输出序列：[y0, y1, y2, …]\n反推 seed = y0（结果包含 seed）\nstep((y0,x1)) = y1\nstep((y1,x2)) = y2\n再 Learn step、seed、tail；由 Base scan 组合。",TP,TEAL,28)
    c.text(83,906,"VS 保留候选与组合",30)
    c.text(83,953,"Union 合并可选分解；Join 只组合同一分解的 children，避免破坏相关约束。",25,MUTED,limit=1760)
    c.footer("Sound partial witnesses · 有限 observations / aliases / depth / branches · 未找到 ≠ Base 无法表达；VS Union 不是新增 Base operator")
    c.save()


def abstraction():
    c=Canvas("03-typed-abstraction",3,"从相似 AST 到闭合、可调用的 invention","下面的 affine 例子来自参数化单元测试；候选 frontier 在该测试中人工提供并经 specification 检查。")
    c.card(72,230,545,252,"01  收集相似 typed AST","λx:Int. add(multiply(x,3),7)\nλx:Int. add(multiply(x,3),8)\nλx:Int. add(multiply(x,3),9)\nλx:Int. add(multiply(x,3),10)",body_size=25)
    c.card(680,230,551,252,"02  Typed anti-unification","λx:Int. add(multiply(x,3),β)\n\n共同 syntax 保留；差异 → β:Int\nx 是绑定变量，不被提升。",PALE,BLUE,27)
    c.card(1294,230,554,252,"03  Lambda lifting","Iβ = λβ:Int. λx:Int.\n       add(multiply(x,3),β)\n\nFV(Iβ) = ∅；kernel typecheck",TP,TEAL,27)
    c.arrow([(617,354),(665,354)])
    c.arrow([(1231,354),(1279,354)])
    c.card(72,551,805,266,"04  MDL 接受条件","J_before = Σ L(P)\nJ_after = L(dictionary) + Σ L(P | dictionary)\n只接受 J_after < J_before\n显式计入参数成本；AST cover 不重叠。",OP,ORANGE,28)
    c.card(959,551,889,266,"05  定义反馈给后续 Learn","TSL_task += accepted invention\n例如 Iβ(7) 展开为 λx. add(multiply(x,3),7)\n展开后的普通 Base AST 满足 specification 才命中\n不用手写 invention-specific witness。",TP,TEAL,27)
    c.arrow([(877,685),(944,685)],TEAL)
    c.text(84,873,"保护条件",31)
    c.text(84,928,"类型一致 · 禁止 binder capture · 正 MDL saving · closed definition · 完全展开回 Base",28,MUTED,limit=1760)
    c.footer("当前为 first-order typed AU；依赖局部 binder 的 mismatch 被拒绝 · 此页是参数化机制示例，不是全程 Learn 发现的实证")
    c.save()


ARC_COLORS=["#101820","#0074D9","#FF4136","#2ECC40","#FFDC00","#AAAAAA","#F012BE","#FF851B","#7FDBFF","#870C25"]


def grid(c,x,y,g,cell=36):
    for row,values in enumerate(g):
        for col,value in enumerate(values):
            c.rect(x+col*cell,y+row*cell,cell-1,cell-1,ARC_COLORS[value],0)


def core_example():
    c=Canvas("04-core-invention",4,"03560426：自动发现的 Attach-like 函数","实际训练示例与实际导出的 I0；“Attach-like”是事后解释，不是 Base primitive 或搜索规则。")
    task=json.loads((ROOT / "data/03560426.json").read_text())
    c.text(88,227,"训练输入",31)
    c.text(611,227,"训练输出",31)
    grid(c,88,286,task["train"][0]["input"])
    grid(c,611,286,task["train"][0]["output"])
    c.arrow([(473,466),(576,466)])
    c.text(88,674,"原始 ARC grid；这里展示第 1 个训练 pair。",25,MUTED)
    c.card(1070,228,778,179,"I0 : Pair(Placed, Placed) → Placed","pair=(a,b) → 移动 b\n让 TL(b) 与 BR(a) 对齐",TP,TEAL,28)
    c.rect(1100,445,200,90,PALE)
    c.rect(1312,547,160,94,TP)
    c.text(1118,464,"a（前一个）",25)
    c.text(1327,568,"b（当前）",25)
    c.arrow([(1312,547),(1300,535)],TEAL)
    c.text(1249,501,"BR",22,TEAL)
    c.text(1268,554,"TL",22,TEAL)
    c.text(1510,458,"位移向量",27,TEAL)
    c.text(1510,513,"BR(a) − TL(b)\n改变位置，保留形状",26,MUTED,limit=322)
    c.text(1100,674,"坐标关系示意；左侧是真实 IO。",25,MUTED)
    c.rect(72,755,1776,217,"white")
    c.text(99,776,"完全由既有 Base 表达的定义",30)
    c.text(99,831,"I0(pair) = Translate(snd(pair),",29,mono=True)
    c.text(99,876,"    coordDelta(Anchor(fst(pair),BR), Anchor(snd(pair),TL)))",29,mono=True)
    c.text(1280,811,"generic scan 使用该 step",27,TEAL)
    c.text(1280,865,"排序 → seed → scan → mkScene\ntrain / heldout 均 exact",26,MUTED,limit=510)
    c.footer("I0 自动从 frontier AST 发现，closed / typed / Base-expandable · 核心 task 实际命中 4 次 · StructuralPriorCount = 0")
    c.save()


def bar(c,x,y,w,value,maxv,color,label,number):
    c.text(x,y,label,27)
    c.rect(x,y+47,w,37,"#E6ECF4",3)
    c.rect(x,y+47,max(5,w*value/maxv),37,color,3)
    c.text(x+w+22,y+43,number,29)


def evidence():
    c=Canvas("05-feedback-evidence",5,"反馈已经发生，但时间收益仍需改善","专门 stress：同一 task 内，先由 Learn 合成 prefix，再求解 40 个新 step demands。")
    rows={r["mode"]:r for r in STRESS["modes"]}
    f,n=rows["Full"],rows["NoOnlineAbstraction"]
    fw,nw=f["statistics"],n["statistics"]
    c.text(76,231,"后续 synthesis 的逻辑搜索计数",32)
    bar(c,80,300,620,nw["synthesis_work_after_discovery"],nw["synthesis_work_after_discovery"],"#8CA0B7","NoOnlineAbstraction",f'{nw["synthesis_work_after_discovery"]:,}')
    bar(c,80,438,620,fw["synthesis_work_after_discovery"],nw["synthesis_work_after_discovery"],TEAL,"Full",f'{fw["synthesis_work_after_discovery"]:,}')
    c.text(80,569,"实际 invention hits = 40",29,TEAL)
    c.text(80,620,"所有 41 个 demands 与独立 future inputs 均 exact。",25,MUTED,limit=810)
    c.text(1040,231,"包含 discovery 的整个 session",32)
    c.card(1040,300,380,150,"总逻辑工作 / Full",f'{fw["total_expanded_work"]:,}',TP,TEAL,38)
    c.card(1460,300,388,150,"总逻辑工作 / Baseline",f'{nw["total_expanded_work"]:,}',body_size=38)
    c.card(1040,482,808,172,"总耗时仍较慢",f'Full  {f["wall_clock_seconds"]:.1f}s    vs    Baseline  {n["wall_clock_seconds"]:.1f}s\n逻辑计数不是 CPU 步数，也不是时间。',OP,ORANGE,29)
    c.line([(72,701),(1848,701)],LINE,2)
    c.text(79,733,"当前能得出的结论",32)
    c.text(79,792,"已证明：自动发现的函数确实被后续 Learn 调用，并降低本 fixture 的搜索计数。",28,limit=1750)
    c.text(79,839,"证据边界：40-demand 配置下可摊销 discovery；该 fixture 不证明 AU / lifting 必要。",27,MUTED,limit=1750)
    c.text(79,906,"回归 train 16/17 · heldout 14/17；固定 Base 的可达性尚未完全恢复。",28,MUTED,limit=1750)
    c.footer("真实数据：results/v03r1/abstraction_stress.json · 同一 task-local session，不是跨任务学习 · 参数化单元测试另行报告")
    c.save()


notes="""# LATIS v0.3R.1 pipeline 展示图

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
- reports/LATIS_V03R1_REPORT.md

重建：使用安装了 Pillow 的 Python 运行 scripts/make_v03r1_pipeline_visuals.py。
图像生成不会更改 solver、Base、旧结果或实验协议。
"""
if __name__ == "__main__":
    for render in [overall,witness,abstraction,core_example,evidence]:
        render()
    (OUT/"README.md").write_text(notes,encoding="utf-8")
    with zipfile.ZipFile(OUT/"latis-v03r1-pipeline-images.zip","w",zipfile.ZIP_DEFLATED) as z:
        for path in sorted(OUT.iterdir()):
            if path.suffix in {".png",".svg",".md"}:
                z.write(path,path.name)
    print(f"Rendered five PNG/SVG diagrams and ZIP to {OUT}")
