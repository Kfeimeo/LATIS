'use strict';
// LATIS single-IO trace viewer. Pure helpers (LATIS) are shared with the Node
// tests; the UI part runs only in a browser. The embedded record is never
// mutated: every view derives new arrays from it.
var LATIS = (function () {
  var ARC = ['#000000', '#0074D9', '#FF4136', '#2ECC40', '#FFDC00', '#AAAAAA', '#F012BE', '#FF851B', '#7FDBFF', '#870C25'];
  function dims(g) { return (g && g.length && g[0] && g[0].length) ? [g[0].length, g.length] : null; }
  // Pixel diff of two grids. Different sizes are not comparable cell by cell.
  function gridDiff(a, b) {
    var da = dims(a), db = dims(b);
    if (!da || !db) return { comparable: false, dims_match: null, count: null, cells: [] };
    if (da[0] !== db[0] || da[1] !== db[1]) return { comparable: false, dims_match: false, count: null, cells: [] };
    var cells = [];
    for (var y = 0; y < da[1]; y++) for (var x = 0; x < da[0]; x++) if (a[y][x] !== b[y][x]) cells.push([x, y]);
    return { comparable: true, dims_match: true, count: cells.length, cells: cells };
  }
  function contains(hay, needle) { return String(hay == null ? '' : hay).toLowerCase().indexOf(String(needle).toLowerCase()) >= 0; }
  // Filters return a new array; the input list and its items are untouched.
  function filterCandidates(list, f) {
    f = f || {};
    return (list || []).filter(function (c) {
      if (f.scope && c.scope !== f.scope) return false;
      if (f.entry && c.entry !== f.entry) return false;
      if (f.status && c.status !== f.status) return false;
      if (f.reason && c.reason_code !== f.reason) return false;
      if (f.slots != null && f.slots !== '' && String(c.pipeline_slots) !== String(f.slots)) return false;
      if (f.depth != null && f.depth !== '' && String(c.max_param_depth) !== String(f.depth)) return false;
      if (f.branch && !(contains(c.candidate_id, f.branch) || contains(c.parent_branch_id, f.branch))) return false;
      if (f.text && !(contains(c.text, f.text) || contains(c.candidate_id, f.text))) return false;
      if (f.executedOnly && !c.executed) return false;
      return true;
    });
  }
  function filterEvents(list, f) {
    f = f || {};
    return (list || []).filter(function (e) {
      if (f.scope && e.scope !== f.scope) return false;
      if (f.source && e.event_source !== f.source) return false;
      if (f.kind && (e.kind || e.event) !== f.kind) return false;
      if (f.branch && !(contains(e.branch_id, f.branch) || contains(e.parent_branch_id, f.branch) || contains(e.parent_id, f.branch) || contains(e.candidate_id, f.branch))) return false;
      if (f.text && !contains(JSON.stringify(e), f.text)) return false;
      return true;
    });
  }
  function uniq(xs) { var s = {}, out = []; xs.forEach(function (x) { if (x != null && !s[x]) { s[x] = 1; out.push(x); } }); return out; }
  // Structural checks: missing parts become errors/unknown, never defaults.
  function validateBundle(d) {
    var errors = [], warnings = [];
    if (!d || typeof d !== 'object') return { errors: ['数据不是 JSON 对象'], warnings: [] };
    if (!d.trace || !d.trace.summary) errors.push('缺少 trace.summary');
    if (!d.trace || !Array.isArray(d.trace.funnel)) errors.push('缺少 trace.funnel');
    if (!d.candidates || !Array.isArray(d.candidates.candidates)) warnings.push('缺少 candidates.json：候选浏览器为 unknown');
    if (!d.grids || !Array.isArray(d.grids.pairs)) warnings.push('缺少 grids.json：网格检查器为 unknown');
    if (!Array.isArray(d.events)) warnings.push('缺少事件流');
    if (d.candidates && d.candidates.details_complete === false) warnings.push('候选详细记录只内嵌 ' + d.candidates.details_embedded + ' / ' + d.candidates.total + ' 个（确定性优先级：选中程序、fit、replay、焦点、再按搜索顺序的已执行候选）；其余候选只有摘要行，完整记录见 ' + d.candidates.details_file);
    if (d.events_total != null && d.events_embedded != null && d.events_total > d.events_embedded) warnings.push('只内嵌了前 ' + d.events_embedded + ' / ' + d.events_total + ' 个事件；完整事件在 search_events.jsonl.gz');
    var ids = {};
    ((d.candidates || {}).candidates || []).forEach(function (c) { ids[c.candidate_id] = 1; });
    var sel = d.trace && d.trace.summary && d.trace.summary.program_transform_id;
    ((d.trace || {}).replay_overview || []).forEach(function (r) {
      if (!ids[r.candidate_id] && r.candidate_id !== sel) warnings.push('replay 引用了不在候选表中的 ID ' + r.candidate_id);
    });
    var branches = {};
    ((d.trace || {}).branches || []).forEach(function (b) { branches[b.branch_id] = 1; });
    return { errors: errors, warnings: warnings, candidate_ids: ids, branch_ids: branches };
  }
  // Dead cross references: candidate -> parent branch, replay -> candidate.
  function deadLinks(d) {
    var v = validateBundle(d), dead = [];
    var roots = { task: 1, unified: 1, legacy: 1, 'unified.joint': 1, 'unified.extension': 1, alignment: 1, size: 1, shape: 1, content_first: 1, 'content_first.search': 1 };
    ((d.candidates || {}).candidates || []).forEach(function (c) {
      if (c.parent_branch_id && !v.branch_ids[c.parent_branch_id] && !roots[c.parent_branch_id]) dead.push({ from: c.candidate_id, to: c.parent_branch_id });
    });
    var sel = d.trace && d.trace.summary && d.trace.summary.program_transform_id;
    ((d.replays || {}).results || []).forEach(function (r) { if (!v.candidate_ids[r.candidate_id] && r.candidate_id !== sel) dead.push({ from: 'replay', to: r.candidate_id }); });
    return dead;
  }
  function statusChip(s) {
    if (s === 'fit' || s === 'train_exact' || s === 'pair_exact' || s === 'exact' || s === 'match' || s === 'entered' || s === 'passed') return 'ok';
    if (s === 'invalid' || s === 'no_fit' || s === 'render_mismatch' || s === 'mismatch' || s === 'execution_invalid' || s === 'render_invalid' || s === 'failed' || s === 'no_solution') return 'bad';
    if (s === 'truncated' || s === 'unknown' || s === 'unverifiable' || s === 'timeout' || s === 'killed' || s === 'partial_match') return 'warn';
    return '';
  }
  // Paint emitted objects in order on a background canvas (later wins), as
  // the renderer does; used only to display replayed intermediate sets.
  function paintObjects(objs, w, h, bg) {
    var g = [], over = 0, outside = 0;
    for (var y = 0; y < h; y++) { g.push([]); for (var x = 0; x < w; x++) g[y].push(bg); }
    var owner = {};
    (objs || []).forEach(function (o, i) {
      (o.object ? o.object.pixels : o.pixels).forEach(function (p) {
        if (p[0] < 0 || p[1] < 0 || p[0] >= w || p[1] >= h) { outside++; return; }
        var k = p[0] + ',' + p[1];
        if (owner[k] != null && owner[k] !== i) over++;
        owner[k] = i; g[p[1]][p[0]] = p[2];
      });
    });
    return { grid: g, overwritten: over, outside: outside };
  }
  // Rows + bounded details -> one candidate list and one event list. New
  // objects are created; the embedded record is not modified.
  function expandBundle(raw) {
    var out = {};
    Object.keys(raw || {}).forEach(function (k) { out[k] = raw[k]; });
    var c = raw && raw.candidates;
    if (c && Array.isArray(c.rows)) {
      var list = c.rows.map(function (r) {
        var o = {}; c.columns.forEach(function (k, i) { o[k] = r[i]; });
        var d = c.details && c.details[o.candidate_id];
        if (d) { var x = {}; Object.keys(d).forEach(function (k) { x[k] = d[k]; }); x.first_sequence = o.first_sequence; x.detail_embedded = true; return x; }
        o.detail_embedded = false; o.cases = []; o.ast = null; return o;
      });
      out.candidates = { candidates: list, parameter_goals: c.parameter_goals || [], total: c.total, details_embedded: c.details_embedded, details_complete: c.details_complete, details_file: c.details_file, note: c.note };
    }
    if (raw && Array.isArray(raw.event_rows)) {
      var ev = (raw.events || []).slice();
      raw.event_rows.forEach(function (r) { var o = { _row: true }; raw.event_columns.forEach(function (k, i) { if (r[i] != null) o[k] = r[i]; }); ev.push(o); });
      ev.sort(function (a, b) { return a.sequence - b.sequence; });
      out.events = ev;
    }
    return out;
  }
  // Content-first evidence (pure readers over the embedded record; nothing is inferred).
  function contentFirstInfo(record) {
    var cf = record && record.content_first;
    if (!cf || typeof cf !== 'object') return null;
    var runs = cf.runs || [];
    return { classification: cf.final_classification || null, selected_plan: cf.selected_plan || null, selected_plan_text: cf.selected_plan_text || null,
             metrics: cf.metrics || {}, runs: runs, witnesses: cf.witnesses || [], deferred: cf.deferred || [],
             entered: runs.length > 0, trigger: runs.length ? runs[0].trigger : null, size_first_status: runs.length ? runs[0].size_first_status : null };
  }
  function boundsRect(b) { return b ? [b.min_x, b.min_y, b.max_x - b.min_x + 1, b.max_y - b.min_y + 1] : null; }
  // Bounds of the selected program's OutputSpec on case k (null when not derived).
  function witnessBounds(record, k) {
    var info = contentFirstInfo(record); if (!info) return null;
    var w = info.witnesses[k]; if (!w || !w.derived) return null;
    return { rect: boundsRect(w.spec.witness.bounds), dims: w.spec.witness.dims, dims_source: w.spec.witness.dims_source, content_kind: w.spec.witness.content_kind,
             selection: w.spec.witness.selection, pixel_sources: w.spec.witness.pixel_sources, emitted: w.spec.emitted, grid: w.spec.grid, exact: w.exact };
  }
  // Bounds recorded for a content-first candidate on case k (from its evaluated case record).
  function candidateBounds(c, k) {
    if (!c || c.scope !== 'ContentFirst') return null;
    var x = (c.cases || []).filter(function (q) { return q.case_index === k; })[0];
    if (!x || !x.output_spec) return null;
    return { rect: boundsRect(x.output_spec.bounds), dims: x.output_spec.dims, dims_source: x.output_spec.dims_source, content_kind: x.output_spec.content_kind, selection: x.output_spec.selection, pixel_sources: x.output_spec.pixel_sources, outcome: x.outcome, reason: x.reason };
  }
  // Two-branch timeline (sequence axis): Size-first scopes vs the content-first scope.
  function branchTimeline(funnel) {
    var legacy = ['Size', 'Alignment', 'Scalar/Typed', 'Referent/VSA', 'Shape', 'Relation', 'Unified/Typed', 'Extension', 'JointForward', 'Execution', 'Render'];
    function span(names) {
      var f = (funnel || []).filter(function (x) { return names.indexOf(x.stage) >= 0 && x.first_sequence != null; });
      if (!f.length) return { entered: false, first: null, last: null, events: 0 };
      return { entered: true, first: Math.min.apply(null, f.map(function (x) { return x.first_sequence; })), last: Math.max.apply(null, f.map(function (x) { return x.last_sequence; })), events: f.reduce(function (a, x) { return a + x.events; }, 0) };
    }
    return { size_first: span(legacy), content_first: span(['ContentFirst']) };
  }
  // Stage E1: rectangle covers of the selected members on case k (absolute canvas coordinates, inclusive).
  function witnessCovers(record, k) {
    var info = contentFirstInfo(record); if (!info) return null;
    var w = info.witnesses[k]; if (!w || !w.derived) return null;
    var geos = w.spec.witness.geometry; if (!geos) return null;
    return geos.map(function (g) { return { status: g.status, lower: g.lower_bound, upper: g.upper_bound, alternatives: g.alternative_optimal_covers, replay: g.independent_replay,
      rects: (g.rectangles || []).map(function (r) { return [r.x_min, r.y_min, r.x_max - r.x_min + 1, r.y_max - r.y_min + 1]; }), pixels: g.pixel_count }; });
  }
  // Cells of the input that no selected member covers (the residual of the selection): marked, never relabelled as background.
  function residualCells(pair, record, k) {
    var info = contentFirstInfo(record); if (!info || !pair) return null;
    var w = info.witnesses[k]; if (!w || !w.derived) return null;
    var sel = {}; (w.spec.emitted || []).forEach(function (e) { if (w.spec.witness.pixel_sources.some(function (q) { return q.selected_member && q.source === e.sources[0]; })) e.pixels.forEach(function (p) { sel[(p[0] + w.spec.witness.bounds.min_x) + ',' + (p[1] + w.spec.witness.bounds.min_y)] = 1; }); });
    var cells = [];
    for (var y = 0; y < pair.input.length; y++) for (var x = 0; x < pair.input[0].length; x++) if (!sel[x + ',' + y]) cells.push([x, y]);
    return { cells: cells, count: cells.length, note: w.spec.witness.provenance ? w.spec.witness.provenance.residual_note : null };
  }
  var GEOMETRY_KINDS = ['geometry-view-created', 'geometry-view-not-applicable', 'cover-proven', 'cover-bounded', 'geometry-feature-evaluated', 'content-first-branch-executed'];
  function geometryTimeline(events) {
    var out = {}; GEOMETRY_KINDS.forEach(function (k) { out[k] = { count: 0, first: null, last: null }; });
    (events || []).forEach(function (e) { var k = e.kind; if (out[k]) { out[k].count++; if (out[k].first == null) out[k].first = e.sequence; out[k].last = e.sequence; } });
    return out;
  }
  return { ARC: ARC, expandBundle: expandBundle, dims: dims, gridDiff: gridDiff, filterCandidates: filterCandidates, filterEvents: filterEvents, uniq: uniq,
           validateBundle: validateBundle, deadLinks: deadLinks, statusChip: statusChip, paintObjects: paintObjects,
           contentFirstInfo: contentFirstInfo, boundsRect: boundsRect, witnessBounds: witnessBounds, candidateBounds: candidateBounds, branchTimeline: branchTimeline,
           witnessCovers: witnessCovers, residualCells: residualCells, geometryTimeline: geometryTimeline, GEOMETRY_KINDS: GEOMETRY_KINDS };
})();
if (typeof module !== 'undefined' && module.exports) module.exports = LATIS;

if (typeof document !== 'undefined') (function () {
  var D, V, state = { tab: 'overview', pair: 0, candidate: null, predSource: 'program', encoding: 'search', hiObject: null, page: 0, evPage: 0, cf: {}, ef: {} };
  function h(tag, attrs) {
    var el = document.createElement(tag);
    if (attrs) Object.keys(attrs).forEach(function (k) {
      var v = attrs[k];
      if (v == null || v === false) return;
      if (k === 'class') el.className = v; else if (k === 'text') el.textContent = v;
      else if (k.slice(0, 2) === 'on') el.addEventListener(k.slice(2), v); else if (k === 'style') el.style.cssText = v; else el.setAttribute(k, v);
    });
    for (var i = 2; i < arguments.length; i++) add(el, arguments[i]);
    return el;
  }
  function add(el, c) {
    if (c == null || c === false) return;
    if (Array.isArray(c)) { c.forEach(function (x) { add(el, x); }); return; }
    el.appendChild(typeof c === 'object' ? c : document.createTextNode(String(c)));
  }
  function chip(text, cls) { return h('span', { class: 'chip ' + (cls == null ? LATIS.statusChip(text) : cls), text: text == null ? 'unknown' : String(text) }); }
  function val(v) { return v == null ? 'unknown' : (typeof v === 'object' ? JSON.stringify(v) : String(v)); }
  function kv(pairs) { var d = h('div', { class: 'kv' }); pairs.forEach(function (p) { add(d, h('div', { text: p[0] })); add(d, h('div', null, p[1] instanceof Node ? p[1] : val(p[1]))); }); return d; }
  function card(title) { var c = h('div', { class: 'card' }, title ? h('h2', { text: title }) : null); for (var i = 1; i < arguments.length; i++) add(c, arguments[i]); return c; }
  function table(headers, rows, onclick, selectedIdx) {
    var t = h('table', null, h('tr', null, headers.map(function (x) { return h('th', { text: x }); })));
    rows.forEach(function (r, i) { var tr = h('tr', { class: (onclick ? 'click' : '') + (selectedIdx === i ? ' selected' : ''), onclick: onclick ? function () { onclick(i); } : null }, r.map(function (c) { return h('td', null, c instanceof Node ? c : val(c)); })); add(t, tr); });
    return t;
  }
  function pre(o) { return h('pre', { text: typeof o === 'string' ? o : JSON.stringify(o, null, 1) }); }

  // ---- grid drawing
  function drawGrid(g, opts) {
    opts = opts || {};
    if (!g) return h('div', { class: 'na', text: opts.na || 'not_available' });
    var d = LATIS.dims(g), w = d[0], hh = d[1], size = Math.max(7, Math.min(22, Math.floor(300 / Math.max(w, hh))));
    var el = h('div', { class: 'grid', style: 'grid-template-columns:14px repeat(' + w + ',' + size + 'px);grid-auto-rows:' + size + 'px' });
    var diff = {}; (opts.diff || []).forEach(function (c) { diff[c[0] + ',' + c[1]] = 1; });
    var res = {}; (opts.residual || []).forEach(function (c) { res[c[0] + ',' + c[1]] = 1; });
    var rects = opts.rects || [];
    var hi = opts.highlight;
    add(el, h('div', { class: 'h' }));
    for (var x = 0; x < w; x++) add(el, h('div', { class: 'h', text: x % 5 === 0 ? String(x) : '' }));
    for (var y = 0; y < hh; y++) {
      add(el, h('div', { class: 'h', text: y % 5 === 0 ? String(y) : '' }));
      for (x = 0; x < w; x++) {
        var inHi = hi && x >= hi[0] && x < hi[0] + hi[2] && y >= hi[1] && y < hi[1] + hi[3];
        var v = g[y][x];
        var rectIdx = -1; rects.forEach(function (r, i) { if (x >= r[0] && x < r[0] + r[2] && y >= r[1] && y < r[1] + r[3]) rectIdx = i; });
        var regionLabel = opts.regionOf ? opts.regionOf(x, y) : '';
        var cls = 'c' + (diff[x + ',' + y] ? ' diff' : '') + (inHi ? ' hi' : '') + (rectIdx >= 0 ? ' rect rect' + (rectIdx % 6) : '') + (res[x + ',' + y] ? ' residual' : '') + (regionLabel ? (regionLabel === 'S' ? ' region-sep' : ' region-content') : '');
        add(el, h('div', { class: cls, title: '(' + x + ',' + y + ') = ' + v + (rectIdx >= 0 ? ' · rect #' + rectIdx : '') + (res[x + ',' + y] ? ' · residual' : '') + (regionLabel ? ' · region ' + regionLabel : ''), style: 'background:' + (LATIS.ARC[v] || '#fff') }, regionLabel ? h('span', { class: 'rl', text: regionLabel }) : null));
      }
    }
    return el;
  }
  function gpanel(title, g, opts, note) { return h('div', { class: 'gpanel' }, h('div', { class: 't', text: title }), drawGrid(g, opts), note ? h('div', { class: 'muted', style: 'font-size:12px;max-width:320px' }, note) : null); }

  // ---- data access
  function cands() { return ((D.candidates || {}).candidates) || []; }
  function goals() { return ((D.candidates || {}).parameter_goals) || []; }
  function pairs() { return ((D.grids || {}).pairs) || []; }
  function replayOf(cid) { return (((D.replays || {}).results) || []).filter(function (r) { return r.candidate_id === cid; })[0]; }
  function candById(cid) { return cands().filter(function (c) { return c.candidate_id === cid; })[0]; }
  function summary() { return D.trace.summary; }

  var TABS = [['overview', '概览'], ['grid', '网格/对象'], ['pipeline', '搜索流程'], ['candidates', '候选浏览'], ['params', '参数目标'], ['derivation', '推导/Witness'], ['region', 'Scene/Region'], ['events', '原始事件']];
  function render() {
    var nav = document.getElementById('tabs'); nav.innerHTML = '';
    TABS.forEach(function (t) { add(nav, h('button', { class: state.tab === t[0] ? 'on' : '', text: t[1], onclick: function () { state.tab = t[0]; render(); } })); });
    var main = document.getElementById('main'); main.innerHTML = '';
    V.errors.forEach(function (e) { add(main, h('div', { class: 'banner bad', text: '数据错误：' + e })); });
    V.warnings.forEach(function (e) { add(main, h('div', { class: 'banner warn', text: e })); });
    if (V.errors.length) return;
    var fn = { overview: viewOverview, grid: viewGrid, pipeline: viewPipeline, candidates: viewCandidates, params: viewParams, derivation: viewDerivation, region: viewRegion, events: viewEvents }[state.tab];
    add(main, fn());
  }

  // ---- overview
  function viewOverview() {
    var s = summary(), t = D.trace, out = [];
    var label = s.status === 'pair_exact' ? 'pair_exact：只对所选单个训练对整格精确；不是原任务 train_exact，更不是 ARC solved'
      : s.status === 'train_exact' ? 'train_exact：所有训练对整格精确（仍不等于 test 泛化/ARC solved）' : '未得到精确程序';
    out.push(card('运行结果', kv([['任务', s.task_id], ['模式', s.mode], ['pair-index', s.pair_index], ['参与搜索的训练对', JSON.stringify(s.pairs_used_in_search) + ' / 共 ' + s.train_pairs_in_task],
      ['配置', s.config + (D.record.diagnostics_forced_on ? '（D+ 诊断强制开启，搜索语义同 D0）' : '')], ['状态', chip(s.status)], ['含义', label], ['detail', s.detail],
      ['程序类型', s.program_kind], ['程序结构 ID', s.program_transform_id], ['search_work', s.search_work], ['first_solution_work', s.first_solution_work],
      ['墙钟秒数（含诊断）', s.wall_clock_seconds], ['首次 train-exact 秒（eventlog 标记）', s.first_train_exact_seconds],
      ['D+ 诊断区间秒（上界）', s.diagnostic_overhead && s.diagnostic_overhead.serialization_and_emit_seconds], ['trace sink 写出秒', s.trace_sink && s.trace_sink.sink_seconds],
      ['事件数', s.events_parsed], ['结构候选数', s.candidates], ['结构 trace hash', h('span', { class: 'mono', text: s.structural_trace_hash })], ['binary sha256', h('span', { class: 'mono', text: s.binary_sha256 })]])));
    var comp = s.trace_incomplete ? h('div', { class: 'banner warn' }, 'trace_incomplete=true：', s.trace_incomplete_reasons.join('；')) : h('div', { class: 'banner ok', text: '记录完整：无丢弃、无采样、无损坏行，进程正常结束。' });
    out.push(card('记录完整性', comp, kv([['终止事件', s.terminal_event ? JSON.stringify(s.terminal_event) : (s.terminal_note || 'unknown')], ['全任务穷尽性', s.whole_task_exhaustiveness + '：' + s.exhaustiveness_note]])));
    if (s.posthoc_validation) {
      var ph = s.posthoc_validation;
      out.push(card('事后只读验证（未参与合成/排序/选择）', ph.performed ? kv([['其它训练对', ph.other_pairs], ['匹配', ph.matching_other_pairs], ['全部匹配', String(ph.all_other_pairs_match)], ['说明', ph.note]]) : h('div', { text: ph.reason }),
        ph.pairs ? table(['pair', '结果', 'diff_cells', 'reason'], ph.pairs.map(function (p) { return [p.pair_index, chip(p.outcome === 'match' ? 'match' : p.outcome === 'mismatch' ? 'mismatch' : p.outcome), p.diff_cells, p.reason]; })) : null));
    }
    var b = t.blockers;
    out.push(card('阻断证据', kv([['first_rejection', b.first_rejection ? evLink(b.first_rejection) : '无'], ['terminal_blocker', b.terminal_blocker ? evLink(b.terminal_blocker) : (s.status.indexOf('exact') >= 0 ? '已求得精确程序' : '无')], ['说明', b.terminal_blocker_note]]),
      h('h3', { text: 'all_blockers（按首次出现排序，不被后续失败覆盖）' }),
      h('div', { class: 'scroll' }, table(['阶段', '类别', '原因', '次数', '首个序号', '分支'], b.all_blockers.map(function (g) { return [g.stage, chip(g.kind, 'warn'), g.reason, g.count, g.first_sequence, g.branches.join(' ')]; })))));
    if (t.dplus_view) out.push(card('D+ 兼容标签（run_stage_d_plus.failure_evidence）', kv([['labels', t.dplus_view.labels.join(', ')], ['primary', t.dplus_view.primary_label], ['参数 fit 但无完整解', String(t.dplus_view.parameters_fit_without_solution)], ['组合执行但像素不符', String(t.dplus_view.composition_executes_but_pixels_fail)], ['说明', t.dplus_view.note]])));
    out.push(card('独立复核', h('h3', { text: 'Replay（只执行保存的 AST，不重跑搜索）' }),
      table(['候选', '选择原因', '核对'], (t.replay_overview || []).map(function (r) { return [candLink(r.candidate_id), r.reason, chip(r.verdict)]; })),
      h('h3', { text: '选中程序 witness 的独立 Python 检查' }),
      t.witness_checks.length ? table(['pair', '结果', 'error'], t.witness_checks.map(function (w) { return [w.pair_index, chip(w.independent_checks), w.error || '']; })) : h('div', { class: 'muted', text: '无（没有精确程序时不存在 witness）' })));
    var cfi = LATIS.contentFirstInfo(D.record);
    if (cfi) {
      var diag = null;
      if (cfi.classification && cfi.classification.indexOf('content_first_unavailable_due_to_representation') === 0)
        diag = h('div', { class: 'banner warn', text: '诊断：Content-first 已打开，但没有任何输入侧 selector 在每个训练 case 上给出合法的唯一/非空选择（例如多色 Region、分隔区域、含有条件的选择都不在当前 selector 语言内）。这是表示不足（selection / region unavailable），不是尺寸入口阻塞。' });
      else if (cfi.classification && cfi.classification.indexOf('content_first_no_train_exact') === 0)
        diag = h('div', { class: 'banner warn', text: '诊断：Content-first 已打开并派生了 OutputSpec，但没有任何候选整格匹配训练目标' + (cfi.classification.indexOf('budget') >= 0 ? '（预算截断，未穷尽该有限 plan 宇宙）' : '（该任务的有限 plan 宇宙已访问完）') + '。' });
      else if (cfi.classification === 'content_first_deferred_legacy_first_solution')
        diag = h('div', { class: 'banner ok', text: 'Size-first 先得到首解；Content-first 的 plan 宇宙被记录为 deferred，未展开（ExploreAlternatives 关闭）。' });
      else if (cfi.classification === 'content_first_not_entered')
        diag = h('div', { class: 'muted', text: 'Content-first 未进入（配置关闭，或 Size-first 已解且未配置 deferred 记录）。' });
      out.push(card('Content-first OutputSpec（Input → Selection → Bounds → Dimensions → Render）', diag,
        kv([['size_first_status', cfi.size_first_status || (D.record.size_rule && D.record.size_rule.exact ? 'fit' : 'unknown')], ['content_first_trigger', cfi.trigger || 'none'], ['最终分类', cfi.classification], ['选中 plan', cfi.selected_plan_text || '无'],
            ['plan 宇宙 / 已访问', val(cfi.metrics.cf_plan_universe) + ' / ' + val(cfi.metrics.cf_plans_tried)], ['每 case 均合法的 selection plan 数', cfi.metrics.cf_selection_legal_plans], ['OutputSpec 派生 / 渲染 / train-exact（case 单位/plan 单位）', val(cfi.metrics.cf_specs_derived) + ' / ' + val(cfi.metrics.cf_rendered) + ' / ' + val(cfi.metrics.cf_fits)],
            ['预算截断', cfi.metrics.cf_truncated], ['deferred plans（未展开）', cfi.metrics.cf_deferred_plans], ['alternative fits（explore）', cfi.metrics.cf_alternative_fits]]),
        cfi.runs.length ? h('div', { class: 'scroll' }, table(['trigger', 'size-first', 'role', '分类', '宇宙', '已访问', '合法 selection', 'specs', '渲染', 'fits', '截断'], cfi.runs.map(function (r) { return [r.trigger, r.size_first_status, r.role, r.classification, r.plan_universe, r.plans_tried, r.selection_legal_plans, r.specs_derived, r.rendered, r.fits, String(r.truncated) + (r.truncation_reason ? '：' + r.truncation_reason : '')]; }))) : null));
    }
    out.push(card('尚未插桩的内部子项（not_instrumented）', table(['scope', '内容', '源码位置'], t.not_instrumented.map(function (n) { return [n.scope, n.detail, h('span', { class: 'mono', text: n.source })]; }))));
    return out;
  }
  function evLink(e) { return h('a', { href: '#', onclick: function (ev) { ev.preventDefault(); state.tab = 'events'; state.ef = { text: '"sequence": ' + e.sequence }; state.ef = { seq: e.sequence }; state.evPage = 0; render(); } , text: '#' + e.sequence + ' ' + [e.scope, e.kind || e.event, e.stop_reason || e.outcome, e.reason_code || e.reason || ''].filter(Boolean).join(' · ') }); }
  function candLink(cid) { return h('a', { href: '#', class: 'mono', onclick: function (ev) { ev.preventDefault(); state.tab = 'candidates'; state.candidate = cid; render(); }, text: cid }); }

  // ---- grid inspector
  function viewGrid() {
    var ps = pairs(); if (!ps.length) return card('网格', h('div', { class: 'na', text: 'grids.json 缺失：unknown' }));
    var p = ps[state.pair] || ps[0], out = [];
    var sel = h('div', { class: 'filters' }, '训练对：', ps.map(function (q, i) {
      return h('button', { class: 'chip ' + (i === state.pair ? 'ok' : ''), onclick: function () { state.pair = i; state.hiObject = null; render(); }, text: 'pair ' + q.pair_index + (q.used_in_search ? ' (case ' + q.case_index + ')' : ' (未参与搜索)') });
    }));
    var c = state.candidate ? candById(state.candidate) : null;
    var srcSel = h('select', { onchange: function (e) { state.predSource = e.target.value; render(); } },
      h('option', { value: 'program', text: '选中程序（runProgramEvidence）', selected: state.predSource === 'program' ? 'selected' : null }),
      h('option', { value: 'search', text: '当前候选：搜索时渲染值', selected: state.predSource === 'search' ? 'selected' : null }),
      h('option', { value: 'replay', text: '当前候选：独立 replay', selected: state.predSource === 'replay' ? 'selected' : null }));
    add(sel, ['  Predicted 来源：', srcSel, c ? h('span', { class: 'mono', text: ' 当前候选 ' + c.candidate_id }) : h('span', { class: 'muted', text: ' （未选候选：在“候选浏览”中点击一行）' })]);
    out.push(sel);
    var pred = null, predNote = '', emitted = null, reenc = null;
    if (state.predSource === 'program') {
      if (p.predicted && p.predicted.available) { pred = p.predicted.grid; predNote = p.predicted.source; emitted = p.predicted.emitted_objects; reenc = p.predicted.reencoded_objects; }
      else predNote = (p.predicted && p.predicted.reason) || 'not_available';
    } else if (c && state.predSource === 'search') {
      var sc = (c.cases || []).filter(function (x) { return x.case_index === p.case_index; })[0];
      if (sc && sc.predicted) { pred = sc.predicted; predNote = '搜索时该候选在 case ' + p.case_index + ' 上真实渲染的网格（trace level full）'; }
      else predNote = sc ? ('搜索时 outcome=' + sc.outcome + '；' + (sc.grid_hash ? '只记录了 grid hash ' + sc.grid_hash + '（level < full）' : '没有渲染网格')) : '该候选在搜索中没有执行这个 case（提前退出/预算/未参与搜索）';
    } else if (c && state.predSource === 'replay') {
      var r = replayOf(c.candidate_id), rc = r && (r.replay.cases || []).filter(function (x) { return x.pair_index === p.pair_index; })[0];
      if (rc && rc.grid) { pred = rc.grid; predNote = '独立 replay（executor only），核对：' + r.verdict; emitted = rc.emitted_objects; reenc = rc.reencoded_objects; }
      else predNote = rc ? ('replay outcome=' + rc.outcome + '：' + rc.reason) : '该候选没有 replay 记录（可用 trace_io.py replay --candidate 生成）';
    } else predNote = '未选择候选';
    var diff = LATIS.gridDiff(pred, p.output);
    var objs = state.encoding === 'search' ? p.encoding.search_objects : p.encoding.connectivity_objects;
    var hiObj = objs.filter(function (o) { return o.id === state.hiObject; })[0];
    // Content-first overlay: the selection bounds = crop window / own canvas of the selected program (or of the current ContentFirst candidate).
    var cfw = (c && c.scope === 'ContentFirst' && state.predSource !== 'program') ? LATIS.candidateBounds(c, p.case_index) : LATIS.witnessBounds(D.record, p.case_index);
    var overlayRect = state.cfOverlay === false ? null : (cfw ? cfw.rect : null);
    out.push(card('Input / Target / Predicted / Diff',
      gpanel('Input pair ' + p.pair_index + ' ' + p.input_dims.join('×'), p.input, { highlight: overlayRect || (hiObj ? hiObj.bbox : null) }, overlayRect ? ('覆盖层：选中 bbox / 裁剪窗口 (x,y,w,h)=' + overlayRect.join(',') + ' → ' + cfw.dims_source) : null),
      gpanel('Target ' + p.output_dims.join('×') + '（训练目标）', p.output),
      gpanel('Predicted', pred, { na: 'not_available' }, predNote),
      gpanel('Diff', pred ? p.output : null, { diff: diff.cells, na: 'not_available' }, pred ? (diff.comparable ? diff.count + ' 个像素不同' + (diff.count ? '：' + diff.cells.slice(0, 40).map(function (q) { return '(' + q[0] + ',' + q[1] + ')'; }).join(' ') + (diff.count > 40 ? ' …' : '') : '') : '尺寸不同，不能逐格比较（' + (LATIS.dims(pred) || []).join('×') + ' vs ' + p.output_dims.join('×') + '）') : null)));
    if (cfw) {
      out.push(card('Content-first OutputSpec 覆盖层与像素来源（case ' + p.case_index + '）',
        h('div', { class: 'filters' }, h('label', null, h('input', { type: 'checkbox', checked: state.cfOverlay === false ? null : 'checked', onchange: function (e) { state.cfOverlay = e.target.checked; render(); } }), ' 在 Input 上显示选中 bbox / 裁剪窗口')),
        kv([['Size 依赖来源', cfw.dims_source], ['Dimensions', (cfw.dims || []).join('×')], ['内容构造', cfw.content_kind], ['selection', cfw.selection ? cfw.selection.text + ' · matched ' + JSON.stringify(cfw.selection.matched_ids) + ' · ' + cfw.selection.evidence : 'unknown'],
            ['case 结果', cfw.outcome ? cfw.outcome + (cfw.reason ? '：' + cfw.reason : '') : (cfw.exact == null ? 'unknown' : (cfw.exact ? 'exact' : 'mismatch'))]]),
        cfw.pixel_sources ? table(['输入对象 id', '像素数', '是否选中成员（crop 窗口中的非选中像素来自输入 grid 本身）'], cfw.pixel_sources.map(function (q) { return [q.source, q.pixels, q.selected_member ? '选中' : '非选中（窗口内其它颜色）']; })) : null,
        cfw.grid ? h('div', { class: 'row' }, gpanel('OutputSpec 渲染（' + cfw.content_kind.split(':')[0] + '）', cfw.grid), gpanel('Target', p.output), gpanel('Diff', p.output, { diff: LATIS.gridDiff(cfw.grid, p.output).cells })) : null));
    }
    var covers = LATIS.witnessCovers(D.record, p.case_index), residual = LATIS.residualCells(p, D.record, p.case_index);
    if (covers || residual || (p.views && p.views.length)) {
      var coverRects = [];
      if (covers) { var sel = state.coverAlt || {}; covers.forEach(function (g, i) { coverRects = coverRects.concat(g.rects); }); }
      out.push(card('几何叠加：PixelSet / RectCover / Bounds / Residual（E0–E1）',
        h('div', { class: 'row' },
          gpanel('Input + RectCover（每个矩形不同描边；inclusive 坐标）', p.input, { rects: coverRects, highlight: overlayRect }),
          gpanel('Input + Residual（未被选中成员覆盖的格；不是背景）', p.input, { residual: residual ? residual.cells : [] })),
        covers ? table(['成员', '像素', '矩形数', '状态', '下界', '上界', '备选最优', '独立重放'], covers.map(function (g, i) { return [i, g.pixels, g.rects.length, chip(g.status === 'proven_minimal' ? 'proven_minimal' : g.status, g.status === 'proven_minimal' ? 'ok' : 'warn'), g.lower, g.upper, g.alternatives, chip(g.replay)]; })) : h('div', { class: 'muted', text: '没有几何 witness（配置未开启几何或程序不是 content-first）。' }),
        covers && covers.some(function (g) { return g.status !== 'proven_minimal' && g.status !== 'empty'; }) ? h('div', { class: 'banner warn', text: '至少一个成员的覆盖只是 Bounded（预算截断）：上界不是 k*。' }) : null,
        residual ? h('div', { class: 'muted', text: 'Residual = ' + residual.count + ' 格；' + (residual.note || '') }) : null,
        (p.views && p.views.length) ? h('div', null, h('h3', { text: 'RawGrid 与各视图并排（颜色 0 在几何层没有特殊语义）' }), h('div', { class: 'scroll' }, table(['视图', '可用', '背景', '证据/原因', 'Region 数'], p.views.map(function (v) { var r = v.result || {}; return [v.applicable ? r.view : v.view, chip(v.applicable ? 'entered' : 'failed'), v.applicable ? (r.background == null ? '无（NoBackground）' : r.background) : '—', v.applicable ? r.evidence : v.reason, v.applicable ? r.regions : '—']; })))) : null));
    }
    var encSel = h('select', { onchange: function (e) { state.encoding = e.target.value; render(); } },
      h('option', { value: 'search', text: '搜索实际使用的对象（含对角视图/置换）', selected: state.encoding === 'search' ? 'selected' : null }),
      h('option', { value: 'connectivity', text: '纯 4 连通编码', selected: state.encoding === 'connectivity' ? 'selected' : null }));
    var plain = {}, viewIds = {};
    p.encoding.connectivity_objects.forEach(function (o) { plain[o.id + ':' + o.mask_hash + ':' + o.bbox] = 1; });
    var changed = p.encoding.search_objects.filter(function (o) { return !plain[o.id + ':' + o.mask_hash + ':' + o.bbox]; });
    out.push(card('输入对象（' + p.encoding.encoder + '，背景 ' + p.encoding.background + '）', h('div', { class: 'filters' }, '编码：', encSel,
      h('span', { class: 'muted', text: ' 对角视图：' + (p.encoding.diagonal_view_enabled ? '启用；与 4 连通不同的对象 ' + changed.length + ' 个；接受链 ' + p.encoding.diagonal_chains.length + '，拒绝 ' + p.encoding.diagonal_rejections.length : '未启用') })),
      h('div', { class: 'scroll' }, table(['id', '颜色', 'bbox (x,y,w,h)', 'SizeSig', '像素', 'ShapeMask(局部)', 'mask hash'], objs.map(function (o) {
        return [o.id, o.color == null ? JSON.stringify(o.colors) : chip(String(o.color), ''), o.bbox.join(','), o.size_sig.join('×'), o.pixel_count, maskPic(o), h('span', { class: 'mono', text: o.mask_hash })];
      }), function (i) { state.hiObject = objs[i].id; render(); }, objs.indexOf(hiObj))),
      p.encoding.diagonal_rejections.length ? h('details', null, h('summary', { text: '对角链拒绝原因' }), table(['颜色', '原因'], p.encoding.diagonal_rejections.map(function (r) { return [r.color, r.reason]; }))) : null));
    out.push(card('目标对象（训练目标编码，仅用于训练匹配，绝不作为程序输入）', h('div', { class: 'scroll' }, table(['id', '颜色', 'bbox', 'SizeSig', '像素'], p.output_encoding.search_objects.map(function (o) { return [o.id, o.color, o.bbox.join(','), o.size_sig.join('×'), o.pixel_count]; })))));
    if (emitted) out.push(card('渲染前 EmittedObject 与重新编码后的 Object', h('div', { class: 'row' },
      h('div', { style: 'flex:1;min-width:300px' }, h('h3', { text: 'EmittedObject（按绘制顺序，后绘覆盖先绘）' }), table(['#', 'sources', 'origin', 'bbox', '颜色'], emitted.map(function (e, i) { return [i, JSON.stringify(e.sources), e.origin, e.object.bbox.join(','), e.object.color]; }))),
      h('div', { style: 'flex:1;min-width:300px' }, h('h3', { text: '对渲染结果重新 4 连通编码' }), table(['id', 'bbox', '颜色', '像素'], (reenc || []).map(function (o) { return [o.id, o.bbox.join(','), o.color, o.pixel_count]; }))))));
    return out;
  }
  function maskPic(o) {
    var w = o.size_sig[0], hh = o.size_sig[1]; if (w * hh > 400) return w + '×' + hh;
    var g = []; for (var y = 0; y < hh; y++) { g.push([]); for (var x = 0; x < w; x++) g[y].push(0); }
    o.mask.forEach(function (m) { if (g[m[1]]) g[m[1]][m[0]] = o.color == null ? 5 : o.color; });
    var el = h('div', { class: 'grid', style: 'grid-template-columns:repeat(' + w + ',6px);grid-auto-rows:6px' });
    g.forEach(function (r) { r.forEach(function (v) { add(el, h('div', { style: 'background:' + LATIS.ARC[v] })); }); });
    return el;
  }

  // ---- pipeline funnel
  function viewPipeline() {
    var t = D.trace, s = summary(), maxSeq = Math.max.apply(null, [1].concat((D.events || []).map(function (e) { return e.sequence; })));
    var firstFit = (D.events || []).filter(function (e) { return e.event_source === 'trace' && (e.kind === 'completed' || e.kind === 'evaluated') && e.outcome === 'fit'; })[0];
    var out = [card('时间口径', kv([['首个 fit 事件序号', firstFit ? '#' + firstFit.sequence : '无'], ['首次 train-exact 秒', s.first_train_exact_seconds == null ? '无可靠时间点' : s.first_train_exact_seconds],
      ['搜索结束秒', s.total_to_budget_seconds == null ? '无可靠时间点' : s.total_to_budget_seconds], ['最后检查点', s.terminal_event ? '#' + s.terminal_event.sequence + ' terminal' : '#' + maxSeq + '（无终止事件：之后状态 unknown）'],
      ['说明', '下方条带按事件序号排布（不是时间轴）；不同计数单位不相加。']]))];
    var rows = t.funnel.map(function (f) {
      var bar = h('div', { class: 'bar' });
      if (f.first_sequence != null) add(bar, h('span', { style: 'left:' + (100 * f.first_sequence / maxSeq) + '%;width:' + Math.max(0.4, 100 * (f.last_sequence - f.first_sequence) / maxSeq) + '%' }));
      if (firstFit) add(bar, h('i', { style: 'left:' + (100 * firstFit.sequence / maxSeq) + '%', title: 'first fit' }));
      var det = h('details', null, h('summary', null, chip(f.state), ' ', h('b', { text: f.stage }), ' ', h('span', { class: 'muted', text: f.label + ' · 事件 ' + f.events })), bar,
        kv(Object.keys(f.counts).map(function (k) { return [k, f.counts[k].value + '  [' + f.counts[k].unit + ']']; }).concat([['预算命中', f.budget_hit_count], ['首个阻断', f.first_blocker ? evLink(f.first_blocker) : '无']])),
        f.budget_hits.length ? h('div', { class: 'scroll' }, table(['序号', '分支', '预算'], f.budget_hits.map(function (b) { return [b.sequence, b.branch_id, JSON.stringify(b.budget || b.budgets || { kind: b.budget_kind, limit: b.limit, used: b.used })]; }))) : null,
        h('button', { class: 'chip', text: '查看该阶段事件', onclick: function () { state.tab = 'events'; state.ef = { scopes: f.scopes }; state.evPage = 0; render(); } }));
      return det;
    });
    var bt = LATIS.branchTimeline(t.funnel);
    out.push(card('分支时间线：Legacy Size-first 与 Content-first（事件序号轴）', table(['分支', '进入', '首序号', '末序号', '事件数'], [
      ['Size-first（SizeRule → Alignment/Relation/Unified/Joint → Execution/Render）', chip(bt.size_first.entered ? 'entered' : 'not_entered'), bt.size_first.first, bt.size_first.last, bt.size_first.events],
      ['Content-first（Selection → Bounds → Dimensions → Render）', chip(bt.content_first.entered ? 'entered' : 'not_entered'), bt.content_first.first, bt.content_first.last, bt.content_first.events]]),
      h('div', { class: 'muted', text: 'Content-first 只在 Size-first 失败（size_failed / downstream_failed）或 ExploreAlternatives 触发后出现；触发前候选数为 0。' })));
    var gt = LATIS.geometryTimeline(D.events);
    out.push(card('几何事件（Search Timeline 序号）', table(['事件', '次数', '首序号', '末序号'], LATIS.GEOMETRY_KINDS.map(function (k) { return [k, gt[k].count, gt[k].first == null ? '—' : gt[k].first, gt[k].last == null ? '—' : gt[k].last]; })),
      h('div', { class: 'muted', text: 'geometry-view-created / cover-proven / cover-bounded / geometry-feature-evaluated / content-first-branch-executed 来自真实搜索事件；为 0 表示该运行没有执行该步骤。' })));
    out.push(card('Grounding → Size → Alignment → Scalar/Typed → Referent/VSA → Relation → Unified/Joint → ContentFirst → Render → Verify', rows,
      h('p', { class: 'muted', text: 'not_entered：运行正常结束而该阶段没有任何检查点；unknown：进程未正常结束，无法区分。not_entered 不是 failed。' })));
    return out;
  }

  // ---- candidate explorer
  function viewCandidates() {
    var all = cands(), f = state.cf, out = [];
    function sel(key, values, label) {
      return h('select', { onchange: function (e) { f[key] = e.target.value || null; state.page = 0; render(); } }, h('option', { value: '', text: label + '：全部' }), values.map(function (v) { return h('option', { value: v, text: String(v), selected: String(f[key]) === String(v) ? 'selected' : null }); }));
    }
    var bar = h('div', { class: 'filters' }, sel('scope', LATIS.uniq(all.map(function (c) { return c.scope; })), '层'), sel('entry', LATIS.uniq(all.map(function (c) { return c.entry; })), '入口'),
      sel('status', LATIS.uniq(all.map(function (c) { return c.status; })), '状态'), sel('reason', LATIS.uniq(all.map(function (c) { return c.reason_code; })), '原因'),
      sel('slots', LATIS.uniq(all.map(function (c) { return c.pipeline_slots; })).sort(), '槽数'), sel('depth', LATIS.uniq(all.map(function (c) { return c.max_param_depth; })).sort(), '参数深度'),
      h('input', { placeholder: 'Branch/候选 ID', value: f.branch || '', onchange: function (e) { f.branch = e.target.value; state.page = 0; render(); } }),
      h('input', { placeholder: '搜索 AST 文本', value: f.text || '', onchange: function (e) { f.text = e.target.value; state.page = 0; render(); } }),
      h('label', null, h('input', { type: 'checkbox', checked: f.executedOnly ? 'checked' : null, onchange: function (e) { f.executedOnly = e.target.checked; state.page = 0; render(); } }), ' 只看实际执行'));
    var list = LATIS.filterCandidates(all, f), per = 100, pages = Math.max(1, Math.ceil(list.length / per));
    state.page = Math.min(state.page, pages - 1);
    var slice = list.slice(state.page * per, state.page * per + per);
    var pager = h('div', { class: 'filters' }, list.length + ' / ' + all.length + ' 个结构候选', h('button', { class: 'chip', text: '‹', onclick: function () { state.page = Math.max(0, state.page - 1); render(); } }), ' 第 ' + (state.page + 1) + '/' + pages + ' 页 ', h('button', { class: 'chip', text: '›', onclick: function () { state.page = Math.min(pages - 1, state.page + 1); render(); } }));
    out.push(card('Candidate Explorer', bar, pager, h('div', { class: 'scroll' }, table(['ID', '层/入口', '状态', '原因', '槽', '参数深度', 'cost', '执行', '渲染', '文本'], slice.map(function (c) {
      return [h('span', { class: 'mono', text: c.candidate_id }), c.entry, chip(c.status), c.reason_code, c.pipeline_slots == null ? (c.scope === 'LegacyRelation' ? 'n/a（旧 C）' : '—') : c.pipeline_slots, c.max_param_depth == null ? '—' : c.max_param_depth, c.cost, c.executed ? '是' : '否', c.rendered ? '是' : '否', (c.text || '（AST 未记录：level < full 的截断提案）').slice(0, 140)];
    }), function (i) { state.candidate = slice[i].candidate_id; render(); }, slice.map(function (c) { return c.candidate_id; }).indexOf(state.candidate)))));
    var c = state.candidate ? candById(state.candidate) : null;
    if (state.candidate && !c && state.candidate === summary().program_transform_id) c = { candidate_id: state.candidate, ast: D.record.program_transform_ast, status: 'selected', cases: [], entry: 'selected program' };
    if (c) out.push(candidateDetail(c));
    return out;
  }
  function astTree(ast) {
    if (!ast) return h('div', { class: 'muted', text: 'AST 未记录' });
    if (ast.kind === 'RegionProgram') {
      return h('div', { class: 'ast' }, h('ul', null,
        h('li', null, h('b', { text: 'RegionProgram' }), ' ' + (ast.text || '')),
        h('li', null, h('b', { text: 'View: ' + (ast.view && ast.view.view) })),
        h('li', null, h('b', { text: 'Region <- ' + ast.selector }), h('span', { class: 'muted', text: '  输入侧唯一选择（平局/空失败）' })),
        h('li', null, h('b', { text: 'Action: ' + ast.action }), h('span', { class: 'muted', text: '  effect ' + ast.effect }))),
        h('div', { class: 'muted', text: 'cost ' + ast.cost + ' · program id ' + ast.program_id }));
    }
    if (ast.kind === 'ContentFirst') {
      var sel = ast.selection || {};
      return h('div', { class: 'ast' }, h('ul', null,
        h('li', null, h('b', { text: 'OutputSpec' }), ' ' + (ast.text || '')),
        h('li', null, h('b', { text: 'Dimensions ← Bounds(' + (sel.mode || '') + '(' + JSON.stringify(sel.selector) + '))' }), h('span', { class: 'muted', text: '  输入侧选择决定输出尺寸（inclusive bbox，+1/轴）' })),
        h('li', null, h('b', { text: 'Content: ' + ast.construction }), h('span', { class: 'muted', text: ast.construction === 'CropInputWindow' ? '  从输入 grid 的窗口裁剪全部像素' : '  只绘制选中成员，平移到局部原点' }))),
        h('div', { class: 'muted', text: 'cost ' + ast.cost + ' · plan id ' + ast.plan_id }));
    }
    function expr(e) {
      if (e.leaf) return h('li', null, h('b', { text: e.leaf }), e.gap != null ? '(gap ' + e.gap + ')' : '', h('span', { class: 'muted', text: '  Feature 叶子' }));
      if (e.const != null) return h('li', null, String(e.const), h('span', { class: 'muted', text: '  常数 ' + e.type }));
      if (e.hole != null) return h('li', { text: '?c' + e.hole });
      return h('li', null, h('b', { text: e.op }), h('ul', null, (e.args || []).map(expr)));
    }
    function param(p) { return h('li', null, h('span', { class: 'mono', text: p.text }), h('span', { class: 'muted', text: '  ' + p.refinement + ' · depth ' + p.depth + ' · nodes ' + p.ast_nodes + ' · cost ' + p.cost }), h('ul', null, expr(p.expr))); }
    function body(b) {
      if (b.kind === 'Pipeline' || b.kind === 'MigratedBody') return h('li', null, h('b', { text: b.kind }), b.legacy ? h('ul', null, h('li', null, 'legacy: ', body(b.legacy))) : null,
        h('ul', null, b.steps.map(function (s, i) { return h('li', null, h('b', { text: 'step ' + i + ': ' + s.op }), s.per_object ? ' ' + JSON.stringify(s.per_object) : '', s.mode ? ' ' + s.mode : '', s.params ? h('ul', null, s.params.map(param)) : null); })));
      return h('li', null, h('b', { text: b.kind }), ' ', b.per_object ? JSON.stringify(b.per_object) : (b.mode || ''));
    }
    return h('div', { class: 'ast' }, h('ul', null, h('li', null, h('b', { text: 'Select ' }), JSON.stringify(ast.selector), ' · others ', ast.others), body(ast.body)),
      h('div', { class: 'muted', text: 'cost ' + ast.cost + ' · pipeline slots ' + ast.pipeline_slots + ' · max param depth ' + ast.max_param_depth }));
  }
  function stepGrid(objs, dimsWH, bg) { var p = LATIS.paintObjects(objs, dimsWH[0], dimsWH[1], bg || 0); return h('div', null, drawGrid(p.grid), h('div', { class: 'muted', style: 'font-size:11px', text: objs.length + ' 个对象' + (p.overwritten ? '，覆盖像素 ' + p.overwritten : '') + (p.outside ? '，越界像素 ' + p.outside : '') })); }
  function candidateDetail(c) {
    var r = replayOf(c.candidate_id), g = goals().filter(function (x) { return x.plan_id === c.parent_branch_id; });
    var sib = cands().filter(function (x) { return x.parent_branch_id === c.parent_branch_id; });
    var stat = {}; sib.forEach(function (x) { stat[x.status] = (stat[x.status] || 0) + 1; });
    var parts = [kv([['候选结构 ID', h('span', { class: 'mono', text: c.candidate_id })], ['入口', c.entry], ['父分支', c.parent_branch_id], ['状态', chip(c.status)], ['原因', c.reason_code],
      ['首个失败 case', c.first_failing_case == null ? '无' : c.first_failing_case + '：' + (c.first_failure_reason || '')], ['截断预算', c.truncation ? JSON.stringify(c.truncation) : '无'],
      ['重复提出次数', c.duplicates], ['实际执行', c.executed ? '是' : '否（只被提出或被截断）'], ['真正 Render', c.rendered ? '是' : '否'], ['事件序号', (c.sequences || []).slice(0, 30).join(' ')]]),
      h('h3', { text: '结构化 AST' }), astTree(c.ast),
      h('h3', { text: '搜索时逐 case 结果（真实执行值）' }),
      !c.detail_embedded && c.detail_embedded !== undefined ? h('div', { class: 'banner warn', text: '此候选的详细记录（AST、逐 case 结果）未内嵌；见 candidates.json 中 candidate_id=' + c.candidate_id + '。摘要：首个失败 case ' + val(c.first_failing_case) }) :
      (c.cases || []).length ? table(['case', 'outcome', 'reason', 'emitted', 'grid hash', 'diff cells', '网格'], c.cases.map(function (x) { return [x.case_index, chip(x.outcome), x.reason, x.emitted_objects, h('span', { class: 'mono', text: x.grid_hash || '' }), x.diff_cells, x.predicted ? drawGrid(x.predicted) : (x.grid_hash ? 'level < full：只记 hash' : '—')]; })) : h('div', { class: 'muted', text: '搜索中没有执行任何 case（被截断/重复，或 trace level 低于 candidates）' })];
    if (g.length) parts.push(h('h3', { text: '同一逆向计划的参数目标（为何参数 fit 却未构成完整程序？）' }), table(['角色', '代表数', '匹配全部标签', 'deferred', '状态'], g.map(function (x) { return [x.role, x.representatives.length, x.representatives.filter(function (q) { return q.matches_all_labels; }).length, x.deferred.length, x.status]; })),
      h('div', { class: 'muted', text: '同计划候选结果统计：' + JSON.stringify(stat) }));
    parts.push(h('h3', { text: '独立 replay（executor only）' }));
    if (!r) parts.push(h('div', { class: 'muted', text: '未 replay。运行：python -I scripts/trace_io.py replay --record <trace.json> --candidate ' + c.candidate_id }));
    else {
      parts.push(kv([['核对结论', chip(r.verdict)], ['选择原因', r.reason], ['解码 ID 等于候选 ID', String(r.decoded_id_equals_candidate_id)]]),
        table(['pair', 'case', '核对', '说明'], r.checks.map(function (k) { return [k.pair_index, k.case_index, chip(k.verdict), k.note]; })));
      (r.replay.cases || []).forEach(function (rc) {
        var pr = pairs().filter(function (q) { return q.pair_index === rc.pair_index; })[0];
        var det = h('details', null, h('summary', null, 'pair ' + rc.pair_index + ' replay：', chip(rc.outcome), ' ', rc.reason || ''));
        if (rc.steps) rc.steps.forEach(function (s) {
          add(det, h('div', { class: 'card' }, h('b', { text: 'step ' + s.ordinal }), ' bindings ' + JSON.stringify(s.bindings).slice(0, 300),
            h('div', { class: 'row' }, h('div', null, h('div', { class: 't', text: '输入对象集' }), stepGrid(s.input, rc.output_dims, 0)), h('div', null, h('div', { class: 't', text: '输出对象集' }), stepGrid(s.output, rc.output_dims, 0)))));
        });
        if (rc.grid && pr) { var d = LATIS.gridDiff(rc.grid, pr.output); add(det, h('div', { class: 'row' }, gpanel('Replay 最终网格', rc.grid), gpanel('Target', pr.output), gpanel('Diff', pr.output, { diff: d.cells }, d.comparable ? d.count + ' 个像素不同' : '尺寸不同'))); }
        if (rc.emitted_objects) add(det, h('div', { class: 'row' }, h('div', null, h('h3', { text: 'EmittedObject（渲染前）' }), table(['#', 'sources', 'origin', 'bbox'], rc.emitted_objects.map(function (e, i) { return [i, JSON.stringify(e.sources), e.origin, e.object.bbox.join(',')]; }))),
          h('div', null, h('h3', { text: '重新编码 Object（渲染后）' }), table(['id', 'bbox', '颜色'], (rc.reencoded_objects || []).map(function (o) { return [o.id, o.bbox.join(','), o.color]; })))));
        parts.push(det);
      });
    }
    parts.push(h('button', { class: 'chip', text: '在原始事件中查看此候选', onclick: function () { state.tab = 'events'; state.ef = { branch: c.candidate_id }; state.evPage = 0; render(); } }),
      h('button', { class: 'chip', text: '在网格检查器中查看', onclick: function () { state.tab = 'grid'; state.predSource = r ? 'replay' : 'search'; render(); } }));
    return card('候选详情', parts);
  }

  // ---- parameter goals
  function viewParams() {
    var gs = goals(); if (!gs.length) return card('参数目标', h('div', { class: 'muted', text: '没有 D 逆向 TypedGoal 代表记录（未进入该入口，或 trace level < branches）。' }));
    return gs.map(function (g) {
      return card('目标 ' + g.role + ' · ' + g.refinement + ' · 计划 ' + g.plan_id, kv([['goal id', g.goal_id], ['状态', g.status], ['可见叶子', (g.visible_leaves || []).join(', ')], ['逆向标签', (g.labels || []).map(function (l) { return 'case' + l.case_index + '=' + l.value + '(obj ' + l.current_object + ')'; }).join('  ')],
        ['标签来源', g.label_source], ['模板', JSON.stringify(g.templates)], ['预算', JSON.stringify(g.budget)], ['VSA', JSON.stringify(g.vsa)]]),
        h('h3', { text: 'Feature/Const → Typed AST → Param Fit（代表 ' + g.representatives.length + '，deferred ' + g.deferred.length + '）' }),
        h('div', { class: 'scroll' }, table(['param id', 'AST', 'depth', 'cost', 'bindings', 'case 值', '匹配标签', 'case-relative 类', 'VSA root'], g.representatives.map(function (r) {
          return [h('span', { class: 'mono', text: r.param_id }), h('span', { class: 'mono', text: r.param.text }), r.param.depth, r.param.cost, r.bindings.join('; '), r.case_values.join(','), chip(r.matches_all_labels ? 'fit' : 'no_fit'), h('span', { class: 'mono', text: r.case_relative_class }), r.vsa_root];
        }))),
        h('h3', { text: '训练等价但 AST 不同的组（只是 case-relative，不是全域等价）' }),
        table(['类', '不同 AST 数', 'param ids'], g.case_relative_classes.filter(function (k) { return k.distinct_ast_count > 1; }).map(function (k) { return [h('span', { class: 'mono', text: k.class }), k.distinct_ast_count, k.param_ids.join(' ')]; })),
        h('h3', { text: 'B 泛化边（实线 Confirmed，虚线 Pending：Pending 不是证明）' }),
        g.edges.length ? h('div', null, g.edges.slice(0, 200).map(function (e) { return h('div', { class: e.status === 'Confirmed' ? 'edge-confirmed' : e.status === 'Pending' ? 'edge-pending' : 'edge-other', text: '[' + e.status + '] ' + e.text }); })) : h('div', { class: 'muted', text: '无保留边' }),
        g.deferred.length ? h('details', null, h('summary', { text: 'deferred 代表（未被消费）' }), table(['param id', 'AST'], g.deferred.map(function (x) { return [x.param_id, x.text]; }))) : null);
    });
  }

  // ---- derivation / witness graph
  // ---- Stage E2/E3: scene hypotheses, partition trees, goal ledger, exposures, dependency witnesses
  function regionInfo() { var r = D.record && D.record.region_search; return (r && typeof r === 'object' && r.run) ? r : null; }
  function viewRegion() {
    var r = regionInfo(), out = [];
    if (!r) return [card('Scene / Region', h('div', { class: 'muted', text: 'Region 搜索未进入（配置关闭，或 Size-first / Content-first 已解）。' }))];
    var run = r.run;
    var acc = run.universe_accounting || {}, pre = run.precheck || {}, sched = run.scheduler || {};
    out.push(card('Region 搜索摘要', kv([['合法 Scene 视图', run.views.map(function (v) { return v.view + (v.scene_cost != null ? '（scene cost ' + v.scene_cost + (v.scene_cost_basis ? '，' + v.scene_cost_basis : '') + '）' : ''); }).join('；') || '无'],
      ['被拒绝的视图', run.rejected_views.map(function (v) { return v.view + '：' + v.reason; }).join('；') || '无'],
      ['程序宇宙 / 已执行 / 已剪枝 / fit', run.universe + ' / ' + run.executed + ' / ' + run.pruned + ' / ' + (run.fits || []).length], ['预算截断', String(run.budget_cut)],
      ['固定宇宙记账', acc.identity ? ('considered ' + acc.considered + ' = executed ' + acc.executed + ' + prechecked_invalid ' + acc.prechecked_invalid + ' + dependency_pruned ' + acc.dependency_pruned + '；remaining ' + acc.remaining_not_reached + '；consistent ' + acc.consistent) : '（旧记录，无记账字段）'],
      ['结果计数', run.outcome_counts ? JSON.stringify(run.outcome_counts) : '—'],
      ['调度', sched.quantum != null ? ('breadth ' + sched.breadth + '，region_first ' + sched.region_first + '，selector_priority ' + sched.selector_priority + '，quantum ' + sched.quantum + '（' + sched.quantum_unit + '），execution budget ' + sched.execution_budget) : '—'],
      ['首个 fit 的曝光序号 / 候选位置', (run.first_fit_exposure == null ? '无' : run.first_fit_exposure) + ' / ' + (run.first_fit_candidate_index == null ? '无' : run.first_fit_candidate_index)], ['各视图首次曝光序号', JSON.stringify(run.first_view_exposure)],
      ['选中程序', r.selected_program ? r.selected_program.text + '（effect ' + r.selected_program.effect + '）' : '无']])));
    // Stage E3.1: input-side selector precheck (per (view, selector): per-case verdict and matched ids), skipped candidates
    if (pre.enabled != null) {
      var witRows = (pre.witnesses || []).map(function (w) { return [w.view, w.selector, chip(w.verdict, w.verdict === 'ValidSelected' ? 'ok' : 'warn'), (w.cases || []).map(function (c) { return 'case ' + c.case_index + '：' + c.kind + ' ' + JSON.stringify(c.matched_ids) + (c.kind === 'ValidSelected' ? '' : '（' + c.reason + '）'); }).join('；'), (w.cases || []).map(function (c) { return c.tree_hash; }).join(' ')]; });
      var skRows = (pre.skipped_candidates || []).slice(0, 300).map(function (x) { return [x.candidate_index, x.program, chip(x.kind, 'warn'), x.role || '', x.selector || '', x.case_index == null ? '—' : x.case_index, x.evidence || x.why || '']; });
      out.push(card('Selector 预检查（输入侧；跳过的候选仍属于固定宇宙，不计为 accepted）', kv([['启用', String(pre.enabled)], ['跳过候选 / 条目 / 查找 / 逐 case 求值', pre.skipped + ' / ' + pre.entries + ' / ' + pre.lookups + ' / ' + pre.selector_evaluations], ['跳过原因', JSON.stringify(pre.kinds || {})], ['说明', pre.note || '']]),
        h('h3', { text: '证据：每个 (视图, Selector) 在每个训练 case 输入树上的判定' }), h('div', { class: 'scroll', id: 'precheck-witnesses' }, table(['视图', 'selector', '判定', '逐 case（kind，匹配 region id）', 'tree hash'], witRows)),
        h('h3', { text: '被跳过的候选（前 300 条）' }), h('div', { class: 'scroll', id: 'precheck-skipped' }, table(['候选位置', 'program', 'kind', 'role', 'selector', 'case', '证据'], skRows))));
    }
    // Stage E3.1: Shape MDL cache / proof status
    var shapeStatus = {}; (run.trees || []).forEach(function (t) { ((t.tree.scene || {}).object_list || []).forEach(function (o) { var k = o.shape_status || (o.shape ? o.shape.status : 'NotComputed'); shapeStatus[k] = (shapeStatus[k] || 0) + 1; }); });
    var mc = run.mdl_cache;
    out.push(card('Shape MDL：缓存与证明状态', kv([['shape basis', run.shape_basis || '—'], ['对象（引用）数', run.mdl_objects == null ? '—' : run.mdl_objects],
      ['缓存', mc ? ('distinct masks ' + mc.mdl_distinct_masks + '，references ' + mc.mdl_object_references + '，static hits ' + mc.mdl_cache_hits_static + '；key = ' + mc.key + '；lifetime = ' + mc.lifetime) : (run.shape_basis === 'mdl_eager' ? '关闭（逐对象 eager 计算）' : '不适用（未计算 Shape）')],
      ['证明状态计数（ProvenOptimalInUniverse / BoundedBest / NotComputed）', JSON.stringify(shapeStatus)], ['平移共享', mc ? (mc.translation_sharing + '：' + mc.translation_sharing_note) : '—']])));
    // Stage E3.1: goal recovery progress
    out.push(card('Goal 恢复进度（cursor / total；used + prechecked + pruned；deferred → resumed）', h('div', { id: 'goal-progress' }, (run.goals || []).map(function (g) {
      var pct = g.total ? Math.round(100 * g.cursor / g.total) : 0;
      return h('div', { class: 'goal-progress-row', style: 'display:flex;gap:8px;align-items:center;margin:2px 0' }, h('span', { class: 'mono', style: 'min-width:320px', text: g.goal_id }),
        h('span', { style: 'display:inline-block;width:160px;height:10px;background:var(--chip);border-radius:5px;overflow:hidden' }, h('span', { style: 'display:block;height:10px;width:' + pct + '%;background:var(--ok)' })),
        h('span', { class: 'mono', text: g.cursor + '/' + g.total + '  used ' + g.used + ' + prechecked ' + (g.prechecked == null ? '—' : g.prechecked) + ' + pruned ' + (g.pruned == null ? '—' : g.pruned) + (g.valid_candidates != null ? '  valid ' + g.valid_candidates : '') + '  deferred ' + g.deferred + ' → resumed ' + g.resumed }), chip(g.status));
    }))));
    (run.trees || []).forEach(function (t, i) {
      var tr = t.tree, sc = tr.scene;
      var nodes = tr.nodes.slice().sort(function (a, b) { return a.region_id - b.region_id; });
      var pair = pairs().filter(function (q) { return q.case_index === t.case_index; })[0];
      var gridEl = null;
      if (pair) {
        var cellsRegion = {};
        nodes.forEach(function (n) { if (n.depth === 1 && !n.pixels_truncated) n.pixels.forEach(function (p) { cellsRegion[p[0] + ',' + p[1]] = n; }); });
        gridEl = h('div', { class: 'row' }, gpanel('Input（深度 1 分区：S = Separator，C<id> = Content）', pair.input, { regionOf: function (x, y) { var n = cellsRegion[x + ',' + y]; return n ? (n.role === 'RoleSeparator' ? 'S' : 'C' + n.region_id) : ''; } }));
      }
      out.push(card('Scene / Region Tree · case ' + t.case_index + ' · ' + t.view, h('details', { open: i === 0 ? 'open' : null }, h('summary', null, 'Scene：' + sc.objects + ' objects，residual ' + sc.residual_cells + ' cells，background ' + JSON.stringify(sc.background) + '，reconstructed ' + sc.reconstructed + '，cost ' + sc.cost.total + '；tree expansions ' + tr.expansions + '，splits tried/legal ' + tr.splits_tried + '/' + tr.splits_legal + '，k histogram ' + JSON.stringify(tr.k_histogram) + '，deferred ' + JSON.stringify(tr.deferred) + '，truncated ' + tr.truncated + '，verified ' + tr.verified),
        gridEl,
        h('div', { class: 'scroll' }, table(['region', 'parent', 'depth', 'role', 'area', 'bounds', 'split object', 'children', 'leaf', 'objects'], nodes.map(function (n) { return [n.region_id, n.parent_id == null ? '—' : n.parent_id, n.depth, n.role, n.area, n.bounds ? [n.bounds.x_min, n.bounds.y_min, n.bounds.x_max, n.bounds.y_max].join(',') : 'EmptyBounds', n.split_object_id == null ? '—' : n.split_object_id, JSON.stringify(n.children), n.leaf || '', JSON.stringify(n.objects)]; }))),
        h('h3', { text: '邻接（像素接触）与 SeparatedBy' }), table(['a', 'b', 'contacts', 'separated by'], (tr.adjacency || []).map(function (a) { return [a.a, a.b, a.contacts, a.separated_by == null ? '—' : a.separated_by]; })),
        h('h3', { text: 'Scene 对象（Shape MDL：c_ast 与 c_rect 分别列出；null = NotComputed）' }), h('div', { class: 'scroll' }, table(['id', 'pixels', 'bounds', 'colours', 'shape expr', 'c_ast', 'status', 'c_rect', 'c_rect status'], (sc.object_list || []).map(function (o) { return [o.id, o.pixels, o.bounds ? [o.bounds.x_min, o.bounds.y_min, o.bounds.x_max, o.bounds.y_max].join(',') : '', o.colours, o.shape ? o.shape.text : '—', o.shape ? o.shape.c_ast : 'null', o.shape ? o.shape.status : (o.shape_status || 'NotComputed'), o.shape && o.shape.c_rect != null ? o.shape.c_rect : 'null', o.shape ? (o.shape.c_rect_status || '—') : 'NotComputed']; }))))));
    });
    out.push(card('Goal 账本（分层公平调度：allocated / used / cursor / deferred / resumed）', h('div', { class: 'scroll' }, table(['goal', 'view', 'layer', 'total', 'cursor', 'used', 'prechecked', 'pruned', 'valid', 'allocated', 'deferred', 'resumed', 'status', 'fits'], (run.goals || []).map(function (g) { return [g.goal_id, g.view, g.layer, g.total, g.cursor, g.used, g.prechecked == null ? '—' : g.prechecked, g.pruned == null ? '—' : g.pruned, g.valid_candidates == null ? '—' : g.valid_candidates, g.allocated, g.deferred, g.resumed, chip(g.status), g.fits]; })))));
    out.push(card('曝光序列（执行顺序；候选位置 = 固定宇宙中含被跳过者的位置）', h('div', { class: 'scroll' }, table(['#', '候选位置', 'view', 'layer', 'cost', 'program', 'outcome', 'reason', 'region area'], (run.exposures || []).slice(0, 600).map(function (e) { return [e.index, e.candidate_index == null ? '—' : e.candidate_index, e.view, e.layer, e.cost, e.program, chip(e.outcome, e.outcome === 'fit' ? 'ok' : ''), e.reason, e.region_area == null ? '—' : e.region_area]; }))), run.exposures && run.exposures.length > 600 ? h('div', { class: 'muted', text: '仅显示前 600 条；完整列表见 solver_record.json' }) : null));
    out.push(card('DependencyWitness（安全剪枝证明）', (run.dependency_witnesses || []).map(function (d) {
      return h('details', null, h('summary', null, d.skeleton + ' · dims preserved ' + d.dims_preserved + ' · pruned ' + d.pruned_count + ' · executed ' + d.kept_executed),
        h('div', { class: 'muted', text: d.scope + '；' + d.note }),
        table(['case', 'view', '变化的深度 1 区域（-1 = 根的其余像素）'], (d.changed_regions || []).map(function (c) { return [c.case_index, c.view, JSON.stringify(c.regions)]; })),
        h('div', { class: 'scroll' }, table(['pruned program', 'reason', 'evidence'], (d.pruned || []).slice(0, 200).map(function (x) { return [x.program, x.reason, x.evidence]; }))));
    })));
    return out;
  }
  function viewDerivation() {
    var w = (D.witnesses || {}).execution_witnesses, out = [];
    out.push(card('选中程序', kv([['程序结构 ID', summary().program_transform_id], ['类型', summary().program_kind]]), D.record.program_transform_ast ? astTree(D.record.program_transform_ast) : h('pre', { text: (D.record.program || '无程序').slice(0, 3000) })));
    var cfi2 = LATIS.contentFirstInfo(D.record);
    if (cfi2 && cfi2.selected_plan) {
      out.push(card('Content-first 推导：Input → Selection → Bounds → Dimensions → Content → Render', h('div', { class: 'ast' }, h('ul', null, cfi2.witnesses.map(function (x, i) {
        if (!x.derived) return h('li', { text: 'pair ' + i + '：未能派生 OutputSpec：' + x.error });
        var wt = x.spec.witness;
        return h('li', null, h('b', { text: 'pair ' + i + ' ' }), chip(x.exact ? 'exact' : 'mismatch'), h('ul', null,
          h('li', { text: 'Selection: ' + wt.selection.text + ' → matched ' + JSON.stringify(wt.selection.matched_ids) + '（' + wt.selection.evidence + '）' }),
          h('li', { text: 'Bounds (inclusive): x ' + wt.bounds.min_x + '..' + wt.bounds.max_x + ', y ' + wt.bounds.min_y + '..' + wt.bounds.max_y }),
          h('li', { text: wt.dims_source }),
          h('li', { text: 'Content: ' + wt.content_kind + '；选中像素 ' + wt.selected_pixels + '，非选中对象像素 ' + wt.other_object_pixels + '，背景格 ' + wt.background_cells }),
          h('li', { text: wt.input_only_dependency })));
      })))));
    }
    var ccw = D.record.content_first && D.record.content_first.cross_case_witness;
    if (ccw) out.push(card('CrossCaseWitness：同一输入侧程序在各 case 的可观测绑定（target 只用于 exact 标记）',
      table(['case', '视图', '背景', '选中 region', 'bounds', 'dims', '矩形数', '状态', 'target exact'], (ccw.bindings || []).map(function (b) { return [b.case_index, b.view, b.background == null ? '无' : b.background, JSON.stringify(b.selected_region_ids), typeof b.bounds === 'string' ? b.bounds : (b.bounds.x_min + '..' + b.bounds.x_max + ' × ' + b.bounds.y_min + '..' + b.bounds.y_max), (b.dims || []).join('×'), b.rect_count == null ? '—' : b.rect_count, b.rect_count_status, chip(b.target_exact ? 'exact' : 'mismatch')]; })),
      kv(Object.keys(ccw.agreement || {}).map(function (k) { return [k, chip(ccw.agreement[k], ccw.agreement[k] === 'ObservedCaseAgreement' ? 'ok' : ccw.agreement[k] === 'Pending' ? 'warn' : '')]; })),
      h('div', { class: 'muted', text: ccw.note + '；' + ccw.target_use })));
    if (!Array.isArray(w) || !w.length) { out.push(card('Witness', h('div', { class: 'muted', text: '没有精确程序，因此没有 Transform/Render witness；失败分支见“候选浏览”和“搜索流程”。' }))); }
    else w.forEach(function (x, i) {
      var used = summary().pairs_used_in_search[i], dimsWH = [x.width, x.height];
      var tree = h('details', { open: i === 0 ? 'open' : null }, h('summary', null, 'pair ' + used + '：', chip(x.train_exact ? 'exact' : 'mismatch'), ' transform witness ', chip(String(x.transform_witness_valid), x.transform_witness_valid ? 'ok' : 'bad'), ' render witness ', chip(String(x.render_witness_valid), x.render_witness_valid ? 'ok' : 'bad')),
        h('div', { class: 'ast' }, h('ul', null,
          h('li', null, h('b', { text: '输入对象' }), ' ids ' + x.source_ids + '，背景 ' + x.background),
          h('li', null, h('b', { text: 'Select' }), ' ' + x.selector + ' · others ' + x.others),
          h('li', null, h('b', { text: 'Transform 步骤' }), h('ul', null, (x.derivation_steps || []).map(function (s) {
            return h('li', null, h('details', null, h('summary', null, 'step ' + s.ordinal + '：' + (typeof s.instruction === 'string' ? s.instruction : s.instruction.operation + ' ' + (s.instruction.parameters || []).map(function (p) { return JSON.stringify(p.expression); }).join(' | ').slice(0, 200))),
              h('div', null, 'bindings: ' + JSON.stringify(s.bindings)), h('div', { class: 'row' }, h('div', null, h('div', { class: 't', text: '输入' }), stepGrid(s.input.map(function (e) { return { pixels: e.pixels }; }), dimsWH, x.background)), h('div', null, h('div', { class: 't', text: '输出' }), stepGrid(s.output.map(function (e) { return { pixels: e.pixels }; }), dimsWH, x.background)))));
          }))),
          h('li', null, h('b', { text: 'EmittedObjects（绘制顺序）' }), h('ul', null, x.emissions.map(function (e) { return h('li', { text: '#' + e.ordinal + ' sources ' + e.sources + ' · ' + e.role + ' · ' + e.pixels.length + ' px' }); }))),
          h('li', null, h('b', { text: 'RenderedPixels' }), ' ', renderNote(x)))),
        h('div', { class: 'row' }, gpanel('渲染结果', Array.isArray(x.grid) ? x.grid : JSON.parse(String(x.grid))), gpanel('由 emissions 重绘', LATIS.paintObjects(x.emissions.map(function (e) { return { pixels: e.pixels }; }), x.width, x.height, x.background).grid)));
      out.push(card(null, tree));
    });
    var gs = goals().filter(function (g) { return g.representatives.some(function (r) { return r.matches_all_labels; }); });
    if (gs.length) out.push(card('参数推导：Feature/Const → Typed AST → Param Fit → Pipeline', gs.slice(0, 30).map(function (g) {
      return h('details', null, h('summary', { text: g.role + ' @ 计划 ' + g.plan_id + '：' + g.representatives.filter(function (r) { return r.matches_all_labels; }).length + ' 个代表匹配全部逆向标签' }),
        h('div', { class: 'ast' }, h('ul', null, g.representatives.filter(function (r) { return r.matches_all_labels; }).slice(0, 40).map(function (r) {
          var leaves = []; (function walk(e) { if (e.leaf) leaves.push(e.leaf); else if (e.const != null) leaves.push('const ' + e.const); else (e.args || []).forEach(walk); })(r.param.expr);
          return h('li', null, h('span', { class: 'muted', text: leaves.join(' + ') + ' → ' }), h('span', { class: 'mono', text: r.param.text }), ' → fit ' + r.case_values.join(','));
        }))), g.edges.slice(0, 20).map(function (e) { return h('div', { class: e.status === 'Confirmed' ? 'edge-confirmed' : 'edge-pending', text: '[' + e.status + '] ' + e.text }); }));
    })));
    return out;
  }
  function renderNote(x) {
    var p = LATIS.paintObjects(x.emissions.map(function (e) { return { pixels: e.pixels }; }), x.width, x.height, x.background);
    var colours = {}; x.emissions.forEach(function (e) { var c = e.pixels.length ? e.pixels[0][2] : null; colours[c] = (colours[c] || 0) + 1; });
    var same = Object.keys(colours).filter(function (k) { return colours[k] > 1; });
    return '覆盖像素 ' + p.overwritten + '；同色发射物体组 ' + (same.length ? same.join(',') + '（渲染后可能同色相连，重新编码对象数可少于发射数）' : '无') + '；越界 ' + p.outside;
  }

  // ---- events
  function viewEvents() {
    var f = state.ef, all = D.events || [];
    var list = all;
    if (f.seq != null) list = all.filter(function (e) { return e.sequence === f.seq; });
    else if (f.scopes) list = all.filter(function (e) { var st = e.scope === 'TypedParameter' ? ((e.parent_id || e.parent_branch_id) === 'alignment' ? 'TypedParameter@alignment' : 'TypedParameter@unified') : e.scope === 'Run' ? 'Run@' + e.kind : e.scope; return f.scopes.indexOf(st) >= 0; });
    else list = LATIS.filterEvents(all, f);
    var per = 200, pages = Math.max(1, Math.ceil(list.length / per)); state.evPage = Math.min(state.evPage, pages - 1);
    var slice = list.slice(state.evPage * per, state.evPage * per + per), open = state.openEvent;
    var bar = h('div', { class: 'filters' },
      h('select', { onchange: function (e) { state.ef = { scope: e.target.value || null, source: f.source, text: f.text }; state.evPage = 0; render(); } }, h('option', { value: '', text: 'scope：全部' }), LATIS.uniq(all.map(function (e) { return e.scope; })).map(function (s) { return h('option', { value: s, text: s, selected: f.scope === s ? 'selected' : null }); })),
      h('select', { onchange: function (e) { state.ef = { scope: f.scope, source: e.target.value || null, text: f.text }; state.evPage = 0; render(); } }, h('option', { value: '', text: '来源：全部' }), ['dplus', 'trace', 'driver'].map(function (s) { return h('option', { value: s, text: s, selected: f.source === s ? 'selected' : null }); })),
      h('input', { placeholder: '全文/分支', value: f.text || f.branch || '', onchange: function (e) { state.ef = { scope: f.scope, source: f.source, text: e.target.value }; state.evPage = 0; render(); } }),
      h('button', { class: 'chip', text: '清除筛选', onclick: function () { state.ef = {}; state.evPage = 0; render(); } }),
      list.length + ' 个事件（内嵌 ' + D.events_embedded + ' / 共 ' + D.events_total + '）',
      h('button', { class: 'chip', text: '‹', onclick: function () { state.evPage = Math.max(0, state.evPage - 1); render(); } }), ' ' + (state.evPage + 1) + '/' + pages + ' ', h('button', { class: 'chip', text: '›', onclick: function () { state.evPage = Math.min(pages - 1, state.evPage + 1); render(); } }));
    return card('原始事件（按 sequence；dplus=原 D+ 事件，trace=本轮插桩，driver=trace-io 驱动）', bar, h('div', { class: 'scroll', style: 'max-height:700px' }, table(['#', '来源', 'scope', 'kind/event', 'branch', 'parent', 'stop/outcome', 'reason'], slice.map(function (e) {
      return [e.sequence, e.event_source, e.scope, e.kind || e.event, h('span', { class: 'mono', text: e.branch_id || '' }), h('span', { class: 'mono', text: e.parent_branch_id || e.parent_id || '' }), chip(e.stop_reason || e.outcome || '', LATIS.statusChip(e.outcome)), (e.reason_code || e.reason || '').slice(0, 120)];
    }), function (i) { state.openEvent = slice[i].sequence; render(); })), open != null ? (function () {
      var e = all.filter(function (x) { return x.sequence === open; })[0] || {};
      var note = e._row ? '候选级事件只内嵌摘要列；完整内容（AST、逐 case 网格）见候选详情、candidates.json 或 search_events.jsonl.gz 第 ' + (open + 1) + ' 行。' : e._moved_fields ? '大字段 ' + e._moved_fields.join(', ') + ' 已移至候选/参数视图；完整事件见 search_events.jsonl.gz 第 ' + (open + 1) + ' 行。' : null;
      return h('div', { class: 'card' }, h('h3', { text: '事件 #' + open }), note ? h('div', { class: 'muted', text: note }) : null, pre(e));
    })() : null);
  }

  function init() {
    try { D = LATIS.expandBundle(JSON.parse(document.getElementById('trace-data').textContent)); }
    catch (e) { document.getElementById('main').textContent = '内嵌数据无法解析：' + e.message; return; }
    V = LATIS.validateBundle(D);
    if (!V.errors.length) {
      var s = D.trace.summary;
      document.getElementById('title').textContent = 'LATIS 单 IO 诊断 · ' + s.task_id + ' · ' + s.mode + ' · pair ' + s.pair_index;
      document.getElementById('subtitle').textContent = s.config + ' · ' + s.status + ' · schema ' + D.trace.trace_schema_version + ' · 离线页面（无网络依赖）';
      var p = pairs().map(function (q) { return q.pair_index; }).indexOf(s.pair_index); state.pair = p < 0 ? 0 : p;
      if (D.focus && D.focus.candidate) { state.candidate = D.focus.candidate; state.tab = 'candidates'; }
      if (D.focus && D.focus.branch) { state.cf.branch = D.focus.branch; state.tab = 'candidates'; }
      // Deep links: #tab=grid&candidate=<id>&source=replay (view state only).
      location.hash.replace(/^#/, '').split('&').forEach(function (kvp) {
        var q = kvp.split('='), k = q[0], v = decodeURIComponent(q[1] || '');
        if (k === 'tab') state.tab = v; else if (k === 'candidate') state.candidate = v; else if (k === 'source') state.predSource = v; else if (k === 'pair') state.pair = +v;
      });
    }
    render();
    if (location.hash.indexOf('#selftest') === 0) selftest();
  }
  // Drives every view in this browser and writes a JSON report into the DOM
  // (used by the headless UI test; never changes the embedded record).
  function selftest() {
    var report = { tabs: {}, errors: [], validation: { errors: V.errors, warnings: V.warnings }, dead_links: LATIS.deadLinks(D) };
    var before = document.getElementById('trace-data').textContent.length;
    function run(name, fn) { try { fn(); render(); report.tabs[name] = document.getElementById('main').getElementsByTagName('*').length; } catch (e) { report.errors.push(name + ': ' + e.message); } }
    TABS.forEach(function (t) { run(t[0], function () { state.tab = t[0]; }); });
    var cs = cands(), fit = cs.filter(function (c) { return c.status === 'fit'; })[0], bad = cs.filter(function (c) { return c.executed && c.status !== 'fit'; })[0];
    [fit, bad].forEach(function (c, i) { if (c) { run('candidate_' + i, function () { state.tab = 'candidates'; state.candidate = c.candidate_id; });
      ['program', 'search', 'replay'].forEach(function (src) { run('grid_' + i + '_' + src, function () { state.tab = 'grid'; state.predSource = src; }); }); } });
    run('filter', function () { state.tab = 'candidates'; state.cf = { status: 'fit' }; });
    report.filter_rows = LATIS.filterCandidates(cs, { status: 'fit' }).length;
    run('event_detail', function () { state.tab = 'events'; state.ef = {}; state.openEvent = (D.events[0] || {}).sequence; });
    for (var p = 0; p < pairs().length; p++) run('pair_' + p, function () { state.tab = 'grid'; state.pair = p; state.predSource = 'program'; });
    report.predicted_panels_na = document.querySelectorAll('.na').length;
    // Grid accuracy: drawn cells and diff markers against the pure diff.
    report.grid_checks = [];
    var withReplay = cs.filter(function (c) { var r = replayOf(c.candidate_id); return r && (r.replay.cases || []).some(function (x) { return x.grid; }); });
    if (!V.errors.length) withReplay.slice(0, 6).forEach(function (c) { try {
      var r = replayOf(c.candidate_id), rc = r.replay.cases.filter(function (x) { return x.grid; })[0];
      var pi = pairs().map(function (q) { return q.pair_index; }).indexOf(rc.pair_index); if (pi < 0) return;
      state.tab = 'grid'; state.pair = pi; state.candidate = c.candidate_id; state.predSource = 'replay'; render();
      var panels = document.querySelectorAll('.gpanel'), p = pairs()[pi];
      var expected = LATIS.gridDiff(rc.grid, p.output);
      report.grid_checks.push({ candidate: c.candidate_id, pair: rc.pair_index,
        input_cells_drawn: panels[0].querySelectorAll('.c').length, input_cells_expected: p.input.length * p.input[0].length,
        diff_marked: panels[3].querySelectorAll('.c.diff').length, diff_expected: expected.comparable ? expected.count : 0,
        predicted_cells_drawn: panels[2].querySelectorAll('.c').length, predicted_cells_expected: rc.grid.length * rc.grid[0].length });
    } catch (e) { report.errors.push('grid_check: ' + e.message); } });
    // Stage E3.1 region cards: count rendered rows (never grep strings that also live in this script)
    run('region_e31', function () { state.tab = 'region'; });
    report.region_cards = { precheck_witness_rows: Math.max(0, document.querySelectorAll('#precheck-witnesses tr').length - 1), precheck_skipped_rows: Math.max(0, document.querySelectorAll('#precheck-skipped tr').length - 1), goal_progress_rows: document.querySelectorAll('#goal-progress .goal-progress-row').length };
    report.embedded_unchanged = document.getElementById('trace-data').textContent.length === before;
    report.candidates = cs.length; report.events = (D.events || []).length;
    var pre = document.createElement('pre'); pre.id = 'selftest-result'; pre.textContent = JSON.stringify(report); document.body.appendChild(pre);
  }
  document.addEventListener('DOMContentLoaded', init);
})();
