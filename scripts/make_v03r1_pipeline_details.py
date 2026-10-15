"""Seven visual expansions of the existing LATIS pipeline; no solver changes."""
import json
import zipfile
from html import escape
from pathlib import Path
import make_v03r1_pipeline_visuals as art

ROOT = art.ROOT
OUT = ROOT / "docs/v03r1-pipeline/details"
OUT.mkdir(parents=True, exist_ok=True)
art.OUT = OUT
BLUE, TEAL, ORANGE = art.BLUE, art.TEAL, art.ORANGE
PALE, TP, OP = art.PALE, art.TP, art.OP
INK, MUTED, LINE = art.INK, art.MUTED, art.LINE
RED = "#BE4155"
TASK = json.loads((ROOT/"data/03560426.json").read_text())
SPACE = json.loads((ROOT/"results/v03r1/core/03560426/Full/version_space.json").read_text())
NODES = {n["id"]:n for n in SPACE["nodes"]}
assert SPACE["root"] == 70 and NODES[68]["children"] == [54,66,67]
assert art.CORE["portfolio_count"] == 32
AFFINE = art.STRESS["parameterized_anti_unification"][0]
assert AFFINE["mdl_saving"] == 3


class Diagram(art.Canvas):
    def __init__(self,name,page,title,subtitle):
        super().__init__(name,page,title,subtitle,total=7)

    def box(self,x,y,w,h,label,fill=PALE,color=INK,size=27):
        self.rect(x,y,w,h,fill,12)
        for i,row in enumerate(label.split("\n")):
            self.text(x+17,y+11+i*size*1.45,row,size,color,limit=w-34)

    def dot(self,x,y,r=6,color=TEAL):
        self.rect(x-r,y-r,2*r,2*r,color,r)

    def connect(self,a,b,color=BLUE,dash=False):
        self.line([a,b],color,3,dash)

    def mini_scene(self,x,y,objects,cell=13):
        g=[[0]*10 for _ in range(10)]
        for obj in objects:
            for xx,yy,col in obj["pixels"]:
                g[yy][xx]=col
        art.grid(self,x,y,g,cell)


def components(g):
    """Mirror defaultEncoder Four/background=0 for explanatory object glyphs."""
    left={(x,y):v for y,row in enumerate(g) for x,v in enumerate(row) if v!=0}
    result=[]
    while left:
        seed=min(left,key=lambda p:(p[1],p[0]))
        color=left[seed]
        todo=[seed]
        ps=set()
        while todo:
            p=todo.pop()
            if p in ps or left.get(p)!=color:
                continue
            ps.add(p)
            x,y=p
            todo.extend([(x+1,y),(x-1,y),(x,y+1),(x,y-1)])
        ox,oy=min(x for x,y in ps),min(y for x,y in ps)
        result.append({"id":len(result),"origin":(ox,oy),"color":color,
                       "pixels":[(x,y,color) for x,y in sorted(ps)]})
        for p in ps:
            left.pop(p)
    return result


def glyph(c,x,y,obj,cell=30):
    ox,oy=obj["origin"]
    for px,py,col in obj["pixels"]:
        c.rect(x+(px-ox)*cell,y+(py-oy)*cell,cell-2,cell-2,art.ARC_COLORS[col],2)


def stage01():
    c=Diagram("01-training-io-and-encode",1,"01  训练 IO：像素变成有位置的对象","同一 Encode 分别处理 input 与 output；下面使用 03560426 的第一个真实 training input。")
    objs=components(TASK["train"][0]["input"])
    assert len(objs)==4
    c.text(90,226,"Grid：10 × 10",30)
    art.grid(c,90,288,TASK["train"][0]["input"],33)
    c.text(90,652,"背景 0；相同颜色的 4 连通分量",25,MUTED)
    c.arrow([(454,450),(570,450)])
    c.text(522,367,"Encode",27,BLUE)
    c.text(655,226,"Objects：拆开显示形状与全局原点",30)
    for i,obj in enumerate(objs):
        x,y=665+(i%2)*335,295+(i//2)*185
        glyph(c,x,y,obj,30)
        c.text(x+89,y+2,f'o{obj["id"]}',27)
        c.text(x+89,y+53,f'origin={obj["origin"]}',24,MUTED)
        c.text(x+89,y+98,f'{len(obj["pixels"])} pixels',24,MUTED)
    c.arrow([(1270,450),(1354,450)])
    c.box(1380,281,454,80,"Scene",TP,size=36)
    c.box(1380,396,454,61,"canvas : Size = (10,10)",TP,size=27)
    c.box(1380,478,454,61,"background : Color = 0",TP,size=27)
    c.box(1380,560,454,61,"objects : List Placed",TP,size=27)
    c.line([(1607,361),(1607,391)],TEAL,3)
    c.text(89,749,"放大一个对象：位置与局部 geometry 分开保存",30)
    blue=next(o for o in objs if o["color"]==1)
    glyph(c,116,819,blue,45)
    c.arrow([(236,882),(355,882)])
    c.box(384,818,420,116,"position = (0,7)\nlocal origin = (0,0)",PALE,size=28)
    c.box(846,818,635,116,"geometry = 稀疏的局部彩色像素\n(0,0), (1,0), …, (1,2)",PALE,size=27)
    c.text(1542,822,"Render 回原 grid",27,TEAL)
    c.text(1542,877,"原始训练 grids 保留",25,MUTED)
    c.footer("交给 02：Scene(input) / Scene(output) · 默认 Four connectivity + background 0 · 不在 Encode 阶段判断任务 family")
    c.save()


def stage02():
    c=Diagram("02-typed-specification",2,"02  类型化约束：所有示例约束同一个未知程序","Q0 是 Scene → Scene 的函数图；它记录“必须做到什么”，而不是预先指定程序结构。")
    for i,pair in enumerate(TASK["train"]):
        y=247+i*221
        c.text(82,y+32,f"#{i+1}",26,MUTED)
        art.grid(c,152,y,pair["input"],15)
        art.grid(c,412,y,pair["output"],15)
        c.arrow([(321,y+75),(389,y+75)])
        c.arrow([(575,y+75),(712,458+i*72)])
    c.text(153,923,"三对实际训练 IO",26,MUTED)
    c.box(748,305,645,81,"Q0 : Scene → Scene",PALE,size=35)
    for i in range(3):
        c.box(770,430+i*72,601,56,f"P(Scene x{i+1}) = Scene y{i+1}",TP,size=27)
    c.box(768,698,600,65,"Γ = {}     （根程序必须闭合）",PALE,size=28)
    c.arrow([(1393,505),(1472,505)])
    c.box(1500,419,341,76,"未知程序 P",TP,size=34)
    c.text(1517,543,"同一个 P 满足全部行",26,TEAL)
    c.text(1506,647,"类型约束",27)
    for j,(lab,fill) in enumerate([("输入 Scene",PALE),("输出 Scene",TP),("禁止类型混接",OP)]):
        c.box(1501,699+j*70,336,53,lab,fill,size=25)
    c.box(731,825,655,132,"lambda witness 打开函数体\nλs:Scene. [body]  →  Γ={s:Scene}",PALE,size=28)
    c.footer("交给 03：LearningTask(type, specification, Γ) · 子问题还可携带 Point / FunctionPoint / FunctionOrder · heldout labels 不进入 Q0")
    c.save()


def stage03():
    c=Diagram("03-learn-and-witness",3,"03  Learn：用 operator 语义把大目标拆小","这里放大 generic Translate 的一个反推；(0,−7) 是第一个训练输入中蓝色对象移到 (0,0) 的实际位移。")
    c.text(80,226,"有限 observed operands",28)
    blue=next(o for o in components(TASK["train"][0]["input"]) if o["color"]==1)
    glyph(c,105,309,blue,34)
    c.text(206,311,"source",28)
    c.text(206,361,"TL=(0,7)",26,MUTED)
    glyph(c,105,504,blue,34)
    c.text(206,502,"目标 output",28)
    c.text(206,552,"TL=(0,0)",26,MUTED)
    c.arrow([(399,440),(540,440)])
    c.box(565,379,433,117,"Q : Placed\n返回类型筛选",PALE,size=29)
    c.box(575,580,411,73,"Translate(source, v)",TP,size=29)
    c.arrow([(779,496),(779,566)],TEAL)
    c.connect((650,653),(580,718),TEAL)
    c.connect((915,653),(1144,718),TEAL)
    c.box(382,729,395,110,"Q_source : Placed\nsource 保留形状与颜色",PALE,size=27)
    c.box(969,729,397,110,"Q_v : Vec\nv = (0,−7)",TP,size=28)
    c.arrow([(1168,839),(1168,890)],TEAL)
    c.box(859,903,656,64,"coordDelta((0,0), Anchor(source,TL))",TP,size=25)
    c.text(94,751,"叶子已匹配",27,TEAL)
    c.dot(137,825,22,TEAL)
    c.text(170,811,"Leaf(source)",26)
    c.arrow([(382,775),(303,775),(303,798)],TEAL)
    c.text(1477,236,"先看返回类型",28)
    c.box(1476,310,365,62,"Translate → Placed",TP,size=27)
    c.box(1476,398,365,62,"mkScene → Scene",OP,size=27)
    c.text(1779,414,"×",29,RED)
    c.box(1476,486,365,62,"range → List Int",OP,size=27)
    c.text(1779,502,"×",29,RED)
    c.text(1454,650,"递归控制",29)
    c.text(1454,708,"MRV：先解候选域更小的 child\n同一 Q 可查询 memo\n所有 children 非空才 Join",25,MUTED,limit=385)
    c.footer("交给 04：Leaf / Union / Join 节点 · witness 是有限、条件化的逆语义 · depth=7 / budget=250000 · 找到 forward Leaf 后会提前结束该子问题")
    c.save()


def stage04():
    c=Diagram("04-version-space",4,"04  Version space：保存候选 DAG，而不是立刻展开全部程序","左侧来自 03560426 的实际导出节点；# 编号可在 version_space.json 中核对。")
    # Actual reduced node graph. Internal expressions are abbreviated labels.
    positions={70:(561,230,365,61,"#70  Join λs",PALE),69:(561,357,365,61,"#69  Join mkScene",TP),
               3:(83,493,340,65,"#3  Union canvasSize",PALE),4:(504,493,288,65,"#4  Leaf Color 0",PALE),
               68:(938,493,310,65,"#68  Join scan",TP),54:(715,648,338,80,"#54  Leaf step\n闭合函数 I0",PALE),
               66:(1068,648,324,80,"#66 Join Translate\nseed 子程序",TP),
               67:(1407,648,351,80,"#67  Leaf tail\n排序后余下的对象",PALE),
               57:(936,838,315,67,"#57 Union source",PALE),65:(1289,838,292,67,"#65 Union Vec",PALE)}
    for a,b in [(70,69),(69,3),(69,4),(69,68),(68,54),(68,66),(68,67),(66,57),(66,65)]:
        x,y,w,h,*_=positions[a];xx,yy,ww,hh,*_=positions[b]
        if (a,b)==(68,67):
            c.line([(x+w,y+h/2),(1813,y+h/2),(1813,632),(1690,632),(1690,yy)],TEAL,3)
        else:
            c.connect((x+w/2,y+h),(xx+ww/2,yy),TEAL if NODES[a]["kind"]=="Join" else BLUE)
    for _,(x,y,w,h,lab,fill) in positions.items():
        c.box(x,y,w,h,lab,fill,size=24)
    c.text(106,646,"Leaf",30,BLUE)
    c.text(106,696,"一个已匹配表达式",26,MUTED)
    c.text(106,762,"Union  =  A 或 B",30,BLUE)
    c.text(106,812,"保留可选解，提取时合并",26,MUTED)
    c.text(106,878,"Join  =  op(A,B,…)",30,TEAL)
    c.text(106,928,"组合同一分解中的 child 解",26,MUTED)
    assert 31 in NODES[35]["children"] and 31 in NODES[64]["children"]
    c.text(1305,241,"实际共享：Int 0 节点",30)
    c.box(1310,317,230,56,"#35 subtract",PALE,size=25)
    c.box(1600,317,230,56,"#64 vec",PALE,size=25)
    c.connect((1425,373),(1580,432),TEAL)
    c.connect((1715,373),(1580,432),TEAL)
    c.box(1430,432,300,60,"#31 Leaf Int 0",TP,size=26)
    c.text(1308,531,"同一 NodeId 被多个 Join 引用",25,MUTED)
    c.text(1308,577,"memo 复用搜索；保留支持理由",25,MUTED)
    c.text(945,938,"55 / 56 两个 source 方案",24,MUTED)
    c.footer("交给 05：root NodeId + Space DAG · Union 不等于 Base union operator · 这张图省略部分 descendants，不是完整 70-node 图")
    c.save()


def program_tree(c,x,y,index,highlight=True):
    """Abbreviated teaching tree, not a serialized export of candidate P_i."""
    c.text(x,y,f"候选 P{index}（局部示意）",27)
    c.box(x+77,y+61,230,52,"λs : Scene",PALE,size=24)
    c.box(x+77,y+145,230,52,"mkScene",PALE,size=24)
    c.connect((x+192,y+113),(x+192,y+145))
    c.box(x+77,y+230,230,52,"scan",TP,size=24)
    c.connect((x+192,y+197),(x+192,y+230))
    c.connect((x+192,y+282),(x+192,y+316),TEAL)
    c.rect(x+5,y+316,377,250,TP,16)
    c.box(x+104,y+334,182,50,"Translate",TP,size=24)
    c.box(x+15,y+416,151,49,"snd(pair)",PALE,size=23)
    c.box(x+188,y+416,181,49,"coordDelta",PALE,size=23)
    c.connect((x+171,y+384),(x+90,y+416),TEAL)
    c.connect((x+221,y+384),(x+276,y+416),TEAL)
    c.text(x+35,y+501,"Anchor BR      Anchor TL",24,TEAL)
    c.connect((x+250,y+465),(x+118,y+494),TEAL)
    c.connect((x+292,y+465),(x+287,y+494),TEAL)


def stage05():
    c=Diagram("05-frontier-extraction",5,"05  Frontier：从候选 DAG 提取有限完整 AST","实际 core 最终 portfolio = 32；下面用三棵简化树展示提取与重复子树，不代表全部候选的逐字 AST。")
    for i,x in enumerate([72,497,922],1):
        program_tree(c,x,246,i)
    c.box(1372,236,468,118,"Materialize(root VS)\n去重 → Base rank → 截断",PALE,size=27)
    c.box(1372,421,468,141,"matches(Q0,P)\n逐行检查 Scene 函数图\n只留 exact-spec 候选",TP,size=27)
    c.arrow([(1605,354),(1605,407)],TEAL)
    c.box(1372,634,468,156,"Extract 子树\n归一化 binder 名称\n相同 / 相似 AST → 06",TP,size=29)
    c.arrow([(1605,562),(1605,620)],TEAL)
    c.text(82,888,"浅色绿色框：重复的通用 step 子树",30,TEAL)
    c.text(82,945,"提取并不保证覆盖全部程序；原始 grid exact verification 在最终选择前另做。",27,MUTED,limit=1750)
    c.footer("交给 06：exact-spec frontier ASTs · frontier 默认最多 32 · Join 提取最多 k² 组 child products · Base rank 与 invention MDL 是两个不同环节")
    c.save()


def affine_tree(c,x,y,offset,label):
    c.text(x,y,label,26)
    c.box(x+89,y+47,210,52,"λx : Int",PALE,size=25)
    c.box(x+112,y+132,164,50,"add",PALE,size=25)
    c.connect((x+194,y+99),(x+194,y+132))
    c.box(x+10,y+228,228,52,"multiply",PALE,size=25)
    c.box(x+267,y+228,130,52,str(offset),OP,size=25)
    c.connect((x+166,y+182),(x+124,y+228))
    c.connect((x+223,y+182),(x+332,y+228),ORANGE)
    c.box(x+14,y+327,88,48,"x",PALE,size=24)
    c.box(x+147,y+327,88,48,"3",PALE,size=24)
    c.connect((x+100,y+280),(x+58,y+327))
    c.connect((x+150,y+280),(x+191,y+327))


def stage06():
    c=Diagram("06-anti-unification-lifting-mdl",6,"06  自动 abstraction：找共同结构，再把洞变成参数","affine 树来自参数化单元测试的表达式形式；该测试的候选 frontier 人工提供并通过 specification 检查。")
    affine_tree(c,73,222,7,"λx. 3x+7")
    affine_tree(c,505,222,8,"λx. 3x+8")
    c.arrow([(904,420),(976,420)],ORANGE)
    affine_tree(c,978,222,"β:Int","Anti-unify：差异位置 → β")
    c.box(1463,269,376,72,"λβ : Int",TP,size=30)
    c.box(1487,387,328,72,"λx : Int",TP,size=30)
    c.box(1487,505,328,72,"add(3x,β)",TP,size=29)
    c.connect((1651,341),(1651,387),TEAL)
    c.connect((1651,459),(1651,505),TEAL)
    c.arrow([(1396,477),(1449,477)],TEAL)
    c.text(1468,620,"Lift 后：所有变量均已绑定",26,TEAL)
    c.line([(73,693),(1838,693)],LINE,2)
    c.text(84,727,"MDL：重复四次是否值得存一个函数？",30)
    for i,x in enumerate([88,248,408,568]):
        c.box(x,806,133,65,"AST 6",PALE,size=24)
    c.text(87,910,"before = 4 × 6 = 24",29)
    c.arrow([(744,851),(873,851)],TEAL)
    c.box(905,794,343,88,"definition 7 + 2\n= 9",TP,size=26)
    c.text(1275,825,"+",34,TEAL)
    for x in [1334,1462,1590,1718]:
        c.box(x,807,112,65,"ref 3",TP,size=24)
    c.text(925,910,"after = 9 + 4 × 3 = 21  →  接受：saving = 3",28,TEAL,limit=900)
    c.footer("交给 07：closed typed definition + parameters + saving · reference = 2 + 参数 AST cost · 非重叠 cover · type mismatch / binder capture / 非正 saving 均拒绝")
    c.save()


def stage07():
    c=Diagram("07-tsl-and-search-feedback",7,"07  Task-local TSL：新函数真的进入下一次 Learn","I0 是实际自动发现的 Pair(Placed,Placed) → Placed 函数；它通过普通 Base definition expansion 使用。")
    c.rect(73,229,1505,535,"white",20,LINE)
    c.text(93,244,"同一个 Engine / 同一个 task",28,BLUE)
    c.box(101,324,335,166,"第一次 Learn\n固定 Base bootstrap\n得到受支持的符号",PALE,size=27)
    c.box(494,324,429,166,"接受 I0 / I1 / …\nTSL = supported Base\n         + inventions",TP,size=27)
    c.arrow([(436,410),(479,410)],TEAL)
    c.box(994,318,545,88,"后来收到的新 subproblem Q",PALE,size=29)
    c.arrow([(923,410),(978,410)],TEAL)
    c.box(994,456,545,97,"试用 I0 / 实例化参数\n展开 Base AST；检查 Q 全部行",TP,size=27)
    c.arrow([(1266,406),(1266,442)],TEAL)
    c.box(821,619,310,73,"命中 → Leaf(Base AST)",TP,size=23)
    c.box(1192,619,342,73,"未命中 → generic Learn",PALE,size=23)
    c.arrow([(1120,553),(976,606)],TEAL)
    c.arrow([(1390,553),(1363,606)])
    c.arrow([(620,490),(620,577),(269,577),(269,503)],TEAL)
    c.text(105,630,"在线 root replay：安装函数后清除旧 memo",25,MUTED)
    c.text(105,686,"继续 Learn → frontier → discovery（最多 2 rounds）",24,MUTED)
    c.box(1633,324,214,100,"另一个 task\n新 Engine",OP,size=26)
    c.box(1633,508,214,109,"从 Base 开始\n无前一 task\n的 inventions",OP,size=23)
    c.line([(1578,390),(1622,390)],ORANGE,3,True)
    c.text(1588,355,"×",29,RED)
    c.text(86,817,"真实 40-demand stress：后续逻辑搜索工作",30)
    c.text(85,880,"NoOnline",26)
    c.rect(266,881,633,30,"#91A3B7",3)
    c.text(918,873,"46,320",30)
    c.text(85,943,"Full",26,TEAL)
    c.rect(266,947,633,30,"#E0E7EF",3)
    c.rect(266,947,633*280/46320,30,TEAL,2)
    c.text(918,936,"280",30,TEAL)
    for j in range(40):
        c.dot(1232+(j%10)*47,876+(j//10)*26,7,TEAL)
    c.text(1215,813,"40 个 actual invention hits",27,TEAL)
    c.text(1215,982,"Full 27.8s > Baseline 13.6s",23,MUTED)
    c.footer("终止：accepted 为空 / rounds 上限 / work budget · 参数域每 type 最多 6、每 invention 最多 64 组 · 命中会关闭该 subproblem · 无跨 task library")
    c.save()


def main():
    for fn in [stage01,stage02,stage03,stage04,stage05,stage06,stage07]:
        fn()
    guide=ROOT/"docs/v03r1-pipeline/details/GUIDE.md"
    if not guide.exists():
        raise FileNotFoundError("Detailed companion GUIDE.md must exist before packaging")
    with zipfile.ZipFile(OUT/"latis-v03r1-pipeline-details.zip","w",zipfile.ZIP_DEFLATED) as z:
        for path in sorted(OUT.iterdir()):
            if path.suffix in {".png",".svg",".md"}:
                z.write(path,path.name)
    print(f"Rendered seven PNG/SVG diagrams to {OUT}")


if __name__=="__main__":
    main()
