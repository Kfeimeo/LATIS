const assert=require('node:assert/strict'),fs=require('node:fs'),I=require('./latis_ide');
const source=`offset :: Int -> Int
 offsetIgnored -- not used
`;
const valid=`step :: Int -> Int
step n = n + 1
keep :: Scene -> Int -> Scene
keep scene n = if n <= 2 then scene else scene
main :: Scene -> Scene
main scene = let n = step 1 in keep scene n`;
const r=I.compile(valid);assert(r.checked.valid);assert(!r.ast.expression.includes('keep'));assert(r.ast.expression.includes('lessEqual'));
assert(I.compile('main :: Scene -> Scene\nmain s =\n  mkScene (canvasSize s) (color 0) (objects s)').checked.valid);
assert(I.compile('main :: Scene -> Scene\nmain s = s -- identity').checked.valid);
for(const text of ['main s = s','main :: Scene -> Scene\nmain s = missing s','main :: Scene -> Scene\nmain s = main s','main :: Scene -> Scene\nmain s = s\nother :: Int\nother = 0','main :: Scene -> Scene\nmain s = @','main :: Int -> Int\nmain n = color 3'])assert.throws(()=>I.compile(text));
assert(!I.compile('f :: Int -> Color\nf n = n\nmain :: Scene -> Scene\nmain s = s').checked.valid);
assert(!I.compile('main :: Scene -> Scene\nmain s = mkScene (canvasSize s) (color 10) (objects s)').checked.valid);
assert.equal(I.type('[Placed]'),'ListT (PlacedT)');
if(process.argv[2])fs.writeFileSync(process.argv[2],JSON.stringify(r.ast));
console.log('PASS: IDE declarations, typed multi-argument functions, application, let, if, arithmetic, comments, multiline bodies, errors and Base expansion.');
