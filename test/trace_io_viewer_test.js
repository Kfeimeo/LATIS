// Node unit tests of the pure viewer helpers (no DOM, no network).
'use strict';
const assert = require('assert');
const path = require('path');
const L = require(path.join(__dirname, '..', 'scripts', 'trace_io_viewer.js'));
let n = 0;
function t(name, f) { f(); n++; console.log('ok', name); }
function deepFreeze(o) { if (o && typeof o === 'object') { Object.freeze(o); Object.values(o).forEach(deepFreeze); } return o; }

t('gridDiff counts and coordinates', () => {
  const a = [[0, 1, 2], [3, 4, 5]], b = [[0, 1, 9], [3, 0, 5]];
  const d = L.gridDiff(a, b);
  assert.strictEqual(d.comparable, true); assert.strictEqual(d.count, 2);
  assert.deepStrictEqual(d.cells, [[2, 0], [1, 1]]);
  assert.strictEqual(L.gridDiff(a, a).count, 0);
});
t('gridDiff refuses different sizes and missing grids', () => {
  assert.strictEqual(L.gridDiff([[1, 2]], [[1], [2]]).comparable, false);
  assert.strictEqual(L.gridDiff([[1, 2]], [[1], [2]]).dims_match, false);
  assert.strictEqual(L.gridDiff(null, [[1]]).comparable, false);
  assert.strictEqual(L.gridDiff(null, [[1]]).count, null);
});
t('filters never mutate the record', () => {
  const list = deepFreeze([{ candidate_id: 'a', status: 'fit', scope: 'Execution', text: 'Pipeline x', executed: true, pipeline_slots: 2 },
    { candidate_id: 'b', status: 'no_fit', scope: 'LegacyRelation', text: 'keep each', executed: true, pipeline_slots: null },
    { candidate_id: 'c', status: 'truncated', scope: 'Execution', text: null, executed: false, pipeline_slots: 1 }]);
  const before = JSON.stringify(list);
  assert.deepStrictEqual(L.filterCandidates(list, { status: 'fit' }).map(c => c.candidate_id), ['a']);
  assert.deepStrictEqual(L.filterCandidates(list, { executedOnly: true }).map(c => c.candidate_id), ['a', 'b']);
  assert.deepStrictEqual(L.filterCandidates(list, { text: 'KEEP' }).map(c => c.candidate_id), ['b']);
  assert.deepStrictEqual(L.filterCandidates(list, { slots: 1 }).map(c => c.candidate_id), ['c']);
  assert.strictEqual(JSON.stringify(list), before);
  const ev = deepFreeze([{ sequence: 0, scope: 'Run', event_source: 'driver' }, { sequence: 1, scope: 'Execution', event_source: 'trace', candidate_id: 'a', kind: 'case' }]);
  assert.strictEqual(L.filterEvents(ev, { source: 'trace' }).length, 1);
  assert.strictEqual(L.filterEvents(ev, { branch: 'a' }).length, 1);
});
t('expandBundle builds new objects from rows', () => {
  const raw = deepFreeze({ trace: { summary: {}, funnel: [] }, candidates: { columns: ['candidate_id', 'status', 'first_sequence'], rows: [['x', 'fit', 3], ['y', 'truncated', 4]], details: { x: { candidate_id: 'x', status: 'fit', cases: [{ case_index: 0 }] } }, total: 2, details_embedded: 1, details_complete: false },
    events: [{ sequence: 2, scope: 'Run' }], event_columns: ['sequence', 'scope', 'candidate_id'], event_rows: [[1, 'Execution', 'x']] });
  const before = JSON.stringify(raw);
  const d = L.expandBundle(raw);
  assert.strictEqual(d.candidates.candidates.length, 2);
  assert.strictEqual(d.candidates.candidates[0].detail_embedded, true);
  assert.strictEqual(d.candidates.candidates[1].detail_embedded, false);
  assert.deepStrictEqual(d.events.map(e => e.sequence), [1, 2]);
  assert.strictEqual(JSON.stringify(raw), before);
  const v = L.validateBundle(d);
  assert.ok(v.warnings.some(w => w.indexOf('只内嵌 1 / 2') >= 0));
});
t('corrupt or partial bundles are errors/unknown, never defaults', () => {
  assert.ok(L.validateBundle(null).errors.length > 0);
  assert.ok(L.validateBundle({}).errors.indexOf('缺少 trace.summary') >= 0);
  const v = L.validateBundle({ trace: { summary: {}, funnel: [] } });
  assert.strictEqual(v.errors.length, 0);
  assert.ok(v.warnings.some(w => w.indexOf('candidates.json') >= 0));
  assert.ok(v.warnings.some(w => w.indexOf('grids.json') >= 0));
});
t('dead links are reported', () => {
  const d = { trace: { summary: {}, funnel: [], branches: [{ branch_id: 'p1' }] }, candidates: { candidates: [{ candidate_id: 'a', parent_branch_id: 'p1' }, { candidate_id: 'b', parent_branch_id: 'missing' }] }, replays: { results: [{ candidate_id: 'zz' }] } };
  const dead = L.deadLinks(d);
  assert.deepStrictEqual(dead, [{ from: 'b', to: 'missing' }, { from: 'replay', to: 'zz' }]);
});
t('paintObjects: later emissions win, outside pixels are counted', () => {
  const p = L.paintObjects([{ pixels: [[0, 0, 1], [1, 0, 1]] }, { pixels: [[1, 0, 2], [5, 5, 3]] }], 2, 1, 0);
  assert.deepStrictEqual(p.grid, [[1, 2]]);
  assert.strictEqual(p.overwritten, 1); assert.strictEqual(p.outside, 1);
});
t('ARC palette has 10 colours', () => { assert.strictEqual(L.ARC.length, 10); });
console.log(JSON.stringify({ suite: 'trace_io_viewer', tests: n, passed: true }));
