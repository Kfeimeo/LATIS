// Run: node scripts/test_latis_blocks.js [native-fixtures.json]
const assert=require('node:assert/strict'),fs=require('node:fs'),path=require('node:path');
const B=require('./latis_blocks.js');
const literal=(type,value)=>({kind:'literal',type,value});
const call=(name,...children)=>({kind:'call',name,children});
const variable=name=>({kind:'var',name});
const lambda=(name,paramType,body)=>({kind:'lambda',name,paramType,children:[body]});
const lett=(name,init,body)=>({kind:'let',name,children:[init,body]});
assert.equal(B.infer(B.identity()).sceneProgram,true);
assert.equal(B.infer(variable('missing')).valid,false);
assert.equal(B.infer(lambda('x','IntT',call('add',variable('x'),literal('IntT',1)))).complete,true);
assert.equal(B.infer(lambda('x','SceneT',call('add',variable('x'),literal('IntT',1)))).valid,false);
assert.equal(B.infer(lett('x',literal('IntT',1),lett('x',literal('ColorT',2),variable('x')))).type,'ColorT');
assert.equal(B.infer(lett('x',variable('x'),literal('IntT',0))).valid,false);
assert.equal(B.infer(call('if',literal('BoolT',true),literal('ColorT',2),literal('IntT',2))).valid,false);
assert.equal(B.infer(literal('ColorT',10)).valid,false);
assert.equal(B.infer(literal('IntT',1.2)).valid,false);
assert.equal(B.infer(lambda('x','IntT',{kind:'hole'})).complete,false);
assert.throws(()=>B.exportAST({kind:'hole'}));
const list=call('range',literal('IntT',0),literal('IntT',3));
const step=lambda('pair','PairT IntT IntT',call('add',call('fst',variable('pair')),call('snd',variable('pair'))));
assert.equal(B.infer(call('scan',step,literal('IntT',0),list)).type,'ListT IntT');
assert.equal(B.infer(call('scan',step,literal('ColorT',0),list)).valid,false);
assert.equal(B.infer(call('fold',step,literal('IntT',0),list)).type,'IntT');
assert.equal(B.infer(call('map',lambda('x','IntT',literal('ColorT',2)),list)).type,'ListT ColorT');
const defs={I0:B.exportAST(lambda('x','IntT',call('add',variable('x'),literal('IntT',1))))};
const invention=call('application',{kind:'invention',name:'I0'},literal('IntT',2));
assert.equal(B.infer(invention,defs).type,'IntT');
assert(!B.exportAST(invention,defs).expression.includes('I0'));
assert.equal(B.infer({kind:'invention',name:'absent'},defs).valid,false);
// Corpus round-trip covers actual let/scan, D4, ordering and task inventions.
const evidence=JSON.parse(fs.readFileSync(path.join(__dirname,'../docs/latis-explorer.replay.json'),'utf8'));
let imported=0;
for(const item of evidence.items){const ast=item.solution.typed_ast;if(!ast)continue;const model=B.fromAST(ast),result=B.infer(model);assert(result.sceneProgram,JSON.stringify(result.errors));assert.equal(B.exportAST(model).expression,ast.expression);imported++;}
// Differential fixtures: each declared primitive scheme and a malformed use.
const fixtures=[];
for(const [name,scheme] of Object.entries(B.schemes)){
 const types=scheme.map(t=>t.replace(/\ba\b/g,'PlacedT').replace(/\bb\b/g,'IntT').replace(/\bc\b/g,'ColorT'));
 const out=types.pop();
 for(const bad of [false,true]){
  const args=[...types];let output=out;
  if(bad){if(args.length)args[0]=args[0]==='BoolT'?'IntT':'BoolT';else output='IntT';}
  let body=call(name,...args.map((_,i)=>variable('arg'+i)));if(name==='none')body.elementType='PlacedT';
  for(let i=args.length-1;i>=0;i--)body=lambda('arg'+i,args[i],body);
  const report=B.infer(body),actual=report.info.get('root'+'.0'.repeat(args.length));
  const accepted=report.complete&&B.show(actual.type)===B.show(B.parseType(output));
  assert.equal(accepted,!bad,name+' '+bad);
  fixtures.push({name,args,out:output,accepted});
 }
}
if(process.argv[2])fs.writeFileSync(process.argv[2],JSON.stringify(fixtures));
console.log(`PASS: scope, holes, higher-order types, literals, invention expansion; ${imported} saved programs round-trip; ${fixtures.length} native differential fixtures.`);

// Ordered user abstractions: closed lambdas, dependencies, migration and Base expansion.
const ref=name=>({kind:'invention',name});
const userWork={definitions:[{name:'U1',root:B.identity()},{name:'U2',root:lambda('s','SceneT',call('application',ref('U1'),variable('s')))}],root:lambda('scene','SceneT',call('application',ref('U2'),variable('scene')))};
assert(B.checkWorkspace(userWork).valid);
assert(!B.exportAST(userWork.root,B.checkWorkspace(userWork).registry).expression.includes('U1'));
assert.deepEqual(B.workspace({builder_workspace:userWork}),userWork);
assert.equal(B.workspace({builder_root:B.identity()}).definitions.length,0);
for(const mutate of [w=>w.definitions[0].root=ref('U2'),w=>w.definitions[0].root=lambda('s','SceneT',ref('U1')),w=>w.definitions[0].root=lambda('s','SceneT',variable('free')),w=>w.definitions[1].name='U1',w=>w.definitions[0].name='map',w=>w.definitions[0].name='__proto__',w=>w.definitions[0].root=lambda('s','SceneT',ref('U2'))]){const w=JSON.parse(JSON.stringify(userWork));mutate(w);assert(!B.checkWorkspace(w).valid);}
const renamed=JSON.parse(JSON.stringify(userWork));B.renameDefinition(renamed,0,'UserIdentity');assert(B.checkWorkspace(renamed).valid);assert.equal(renamed.definitions[1].root.children[0].children[0].name,'UserIdentity');renamed.definitions.shift();assert(!B.checkWorkspace(renamed).valid);
console.log('PASS: user abstraction ordering, closed lambda enforcement, duplicate/reserved names, rename, deletion, migration, expansion.');

// Event-handler unit tests with an in-memory element adapter, not browser automation.
class Element {
 constructor(tag){this.tag=tag;this.children=[];this.attributes={};this._text='';this.className='';}
 set textContent(v){this._text=String(v);this.children=[];}
 get textContent(){return this._text+this.children.map(n=>n.textContent).join('');}
 append(...nodes){this.children.push(...nodes);}
 replaceChildren(...nodes){this._text='';this.children=nodes;}
 setAttribute(k,v){this.attributes[k]=v;}
 querySelector(tag){return all(this).find(n=>n!==this&&n.tag===tag);}
 click(){if(this.tag==='a')downloaded=this;else if(!this.disabled)this.onclick?.();}
}
function all(root){return [root,...root.children.flatMap(all)];}
let downloaded;
const memory=new Map(),blobs=new Map();
global.document={createElement:tag=>new Element(tag)};
global.localStorage={getItem:k=>memory.get(k),setItem:(k,v)=>memory.set(k,v)};
URL.createObjectURL=blob=>{const id='test-blob:'+blobs.size;blobs.set(id,blob);return id;};URL.revokeObjectURL=()=>{};
async function uiTests(){
 const host=new Element('section'),item=evidence.items.find(x=>x.name==='03560426'&&x.mode==='Full');
 const button=label=>{const result=all(host).filter(n=>n.tag==='button'&&n.textContent===label);assert.equal(result.length,1,label);return result[0];};
 const status=()=>all(host).find(n=>n.attributes.role==='status').textContent;
 B.mount(host,item);assert(status().includes('类型正确'));
 button('导入已学程序').click();assert(status().includes('类型正确'));
 button('ColorT 常量').click();button('literal:IntT').click();assert(status().includes('类型错误'));assert(button('下载可重放程序').disabled);
 button('撤销').click();assert(status().includes('类型正确'));
 button('重做').click();assert(status().includes('类型错误'));
 button('撤销').click();button('ColorT 常量').click();
 let selected=all(host).find(n=>n.className.split(' ').includes('selected'));
 const number=all(selected).find(n=>n.tag==='input'&&n.type==='number');number.value='10';number.onchange();assert(status().includes('Color 必须为 0..9'));
 button('撤销').click();button('ColorT 常量').click();selected=all(host).find(n=>n.className.split(' ').includes('selected'));
 const slider=all(selected).find(n=>n.tag==='input'&&n.type==='range');slider.value='2';slider.oninput();slider.onchange();assert(status().includes('类型正确'));
 button('下载可重放程序').click();const exported=JSON.parse(await blobs.get(downloaded.href).text());assert(exported.program.includes('ColorV 2'));assert.equal(exported.typed_ast.type,'ArrowT SceneT SceneT');assert.equal(exported.train_exact,null);
 if(process.argv[3])fs.writeFileSync(process.argv[3],JSON.stringify(exported));
 // Drop on a child slot, then undo; this verifies target scope and event handling.
 button('ColorT 常量').click();selected=all(host).find(n=>n.className.split(' ').includes('selected'));
 selected.ondrop({dataTransfer:{getData:()=> 'literal:IntT'},preventDefault(){},stopPropagation(){}});assert(status().includes('类型错误'));button('撤销').click();assert(status().includes('类型正确'));
 button('清空选中插槽').click();assert(status().includes('未完成'));assert(button('下载可重放程序').disabled);button('撤销').click();
 const scope=all(host).find(n=>n.tag==='label'&&n._text==='符号范围').querySelector('select');scope.value='tsl';scope.onchange();
 const permitted=new Set(item.tsl_symbols||[]);for(const b of all(host).filter(n=>n.className==='palette-block')){const name=b.textContent;assert(name==='var'||name.startsWith('invention:')||permitted.has(name.startsWith('literal:')?'literal':name),name);}
 assert(memory.size>0);const other=new Element('section');B.mount(other,item);assert(other.textContent.includes('ColorV 2'));
 button('添加抽象槽').click();assert(host.textContent.includes('参数与类型'));assert(!button('下载可重放程序').disabled);
 button('编辑最终程序').click();button('添加抽象槽').click();assert(host.textContent.includes('invention:U1'));assert(!host.textContent.includes('invention:U2'));
 button('删除抽象 1').click();button('撤销').click();assert(host.textContent.includes('编辑抽象 2'));
 const importFile=all(host).find(n=>n.tag==='input'&&n.type==='file');importFile.files=[{text:async()=>JSON.stringify({builder_workspace:userWork})}];await importFile.onchange();assert(!button('下载可重放程序').disabled);
 button('下载草稿 JSON').click();const draft=JSON.parse(await blobs.get(downloaded.href).text());assert.deepEqual(draft.builder_workspace,userWork);
 button('下载可重放程序').click();const abstractExport=JSON.parse(await blobs.get(downloaded.href).text());assert.deepEqual(abstractExport.builder_workspace,userWork);assert(!abstractExport.program.includes('U2'));if(process.argv[3])fs.writeFileSync(process.argv[3],JSON.stringify(abstractExport));
 button('删除抽象 1').click();assert(button('下载可重放程序').disabled);button('撤销').click();assert(!button('下载可重放程序').disabled);
 button('编辑抽象 1').click();let toggle=button('编辑抽象 1');assert.equal(toggle.attributes['aria-expanded'],'true');toggle.click();assert.equal(button('编辑抽象 1').attributes['aria-expanded'],'false');assert(all(host).find(n=>n.className==='block-layout').hidden);button('编辑抽象 1').click();
 const change=(label,value)=>{const input=all(host).find(n=>n.tag==='label'&&n._text===label).querySelector('input');input.value=value;input.onchange();};
 change('参数 1 名称','source');assert(host.textContent.includes('变量 source'));assert(host.textContent.includes('参数积木 source'));
 button('添加参数').click();assert(host.textContent.includes('参数 2 类型'));assert(button('下载可重放程序').disabled);button('删除参数 2').click();assert(!button('下载可重放程序').disabled);
 change('返回类型（留空自动推断）','IntT');assert(button('下载可重放程序').disabled);change('返回类型（留空自动推断）','SceneT');assert(!button('下载可重放程序').disabled);
 button('变量 source').click();button('参数积木 source').click();button('参数积木 source').click();assert(!button('下载可重放程序').disabled);
 button('删除参数 1').click();assert(button('下载可重放程序').disabled);button('撤销').click();assert(!button('下载可重放程序').disabled);
 const curried={definitions:[{name:'Keep',resultType:'SceneT',root:lambda('s','SceneT',lambda('n','IntT',variable('s')))}],root:lambda('scene','SceneT',call('application',call('application',ref('Keep'),variable('scene')),{kind:'literal',type:'IntT',value:1}))};const cr=B.checkWorkspace(curried);assert(cr.valid);const curriedAST=B.exportAST(curried.root,cr.registry);if(process.argv[3])fs.writeFileSync(process.argv[3],JSON.stringify({...abstractExport,builder_workspace:curried,builder_root:curried.root,typed_ast:curriedAST,program:curriedAST.expression}));
 const constant={definitions:[{name:'One',resultType:'IntT',root:{kind:'literal',type:'IntT',value:1}}],root:B.identity()};assert(B.checkWorkspace(constant).valid);
 const shadow=lambda('x','IntT',lambda('x','IntT',variable('x')));B.renameParameter(shadow,shadow,'outer');assert.equal(shadow.children[0].children[0].name,'x');assert.throws(()=>B.renameParameter(lambda('x','IntT',variable('y')),lambda('x','IntT',variable('y')),'y'));
 console.log('PASS: integrated collapsible slots, parameter add/remove/rename, reusable parameter blocks and return type checks.');
 console.log('PASS: multiple slot UI, ordered palette, delete/undo, workspace import/export and expanded executable export.');
 console.log('PASS: editor event handlers — import, slot replacement, type errors, undo/redo, numeric bounds, slider, typed export, drop, holes, TSL filter, task draft retention.');
}
uiTests().catch(e=>{console.error(e);process.exitCode=1;});
