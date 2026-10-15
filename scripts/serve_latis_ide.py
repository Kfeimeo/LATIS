"""Serve the local explorer and execute typed Base programs with the original kernel."""
import argparse
import json
from http.server import HTTPServer, SimpleHTTPRequestHandler
from pathlib import Path
from visualize_latis import ROOT, find_runghc, run_replay, read_json


def server(port, runghc):
    evidence = read_json(ROOT/'docs/latis-explorer.replay.json')
    allowed = {str(Path(x['task_path']).resolve()) for x in evidence['items']}
    class Handler(SimpleHTTPRequestHandler):
        def __init__(self, *args, **kwargs):
            super().__init__(*args, directory=str(ROOT/'docs'), **kwargs)
        def do_POST(self):
            if self.path != '/api/run':
                self.send_error(404); return
            # Reject cross-origin/browser requests and arbitrary local paths.
            origin = self.headers.get('Origin')
            if self.headers.get('Host') not in {f'127.0.0.1:{port}', f'localhost:{port}'} or (origin and origin not in {f'http://127.0.0.1:{port}', f'http://localhost:{port}'}):
                self.send_error(403); return
            try:
                length = int(self.headers.get('Content-Length', '0'))
                if not 0 < length <= 2_000_000:
                    raise ValueError('Request size limit')
                value = json.loads(self.rfile.read(length))
                task = str(Path(value['task']).resolve())
                if task not in allowed:
                    raise ValueError('Task must be in the explorer dataset')
                ast = value['ast']
                def check(n, depth=0):
                    if depth > 100: raise ValueError('AST depth limit')
                    return 1 + sum(check(c, depth+1) for c in n.get('children', []))
                if check(ast) > 1500: raise ValueError('AST size limit')
                result = run_replay([{'task_path': task, 'solution': {'program': ast['expression'], 'typed_ast': ast}}], runghc, 30)['0']
                body = json.dumps(result).encode()
                self.send_response(200)
                self.send_header('Content-Type', 'application/json; charset=utf-8')
                self.send_header('Content-Length', str(len(body)))
                self.end_headers(); self.wfile.write(body)
            except (ValueError, KeyError, TypeError, RecursionError) as exc:
                self.send_error(400, str(exc))
    print(f'IDE: http://127.0.0.1:{port}/latis-explorer.html', flush=True)
    HTTPServer(('127.0.0.1', port), Handler).serve_forever()

if __name__ == '__main__':
    parser = argparse.ArgumentParser()
    parser.add_argument('--port', type=int, default=8766)
    parser.add_argument('--runghc')
    args = parser.parse_args()
    kernel = find_runghc(args.runghc)
    if not kernel: parser.error('runghc is required')
    server(args.port, kernel)
