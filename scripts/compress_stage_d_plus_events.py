"""Lossless bounded-memory gzip export; validate digest and every byte before cleanup."""
import argparse
import gzip
import hashlib
import json
import sys
from pathlib import Path
sys.path.insert(0,str(Path(__file__).resolve().parent))
from run_stage_d_plus import ROOT,write,sha

def compress(out):
    out=out.resolve();assert out.is_relative_to((ROOT/'results/stage_d_plus').resolve())
    plain=out/'search_events.jsonl';packed=out/'search_events.jsonl.gz'
    source_hash=hashlib.sha256();source_lines=0;source_bytes=0
    if plain.exists():
        assert not packed.exists(),'Do not replace a previous event export'
        with plain.open('rb') as src,packed.open('wb') as dst,gzip.GzipFile(filename='',mode='wb',fileobj=dst,compresslevel=1,mtime=0) as gz:
            while block:=src.read(8*1024*1024):
                source_hash.update(block);source_lines+=block.count(b'\n');source_bytes+=len(block);gz.write(block)
        expected=source_hash.hexdigest()
    else: expected=None
    digest=hashlib.sha256();lines=0;size=0;forbidden=0;carry=b''
    with gzip.open(packed,'rb') as stream:
        while block:=stream.read(8*1024*1024):
            digest.update(block);lines+=block.count(b'\n');size+=len(block)
            data=carry+block;pattern=b'"exhaustiveness":"ProvenExhausted"'
            forbidden+=data.count(pattern);carry=data[-(len(pattern)-1):]
    if expected is not None: assert digest.hexdigest()==expected and lines==source_lines and size==source_bytes
    manifest={'gzip_file':packed.name,'gzip_sha256':sha(packed),'uncompressed_sha256':digest.hexdigest(),'uncompressed_bytes':size,'jsonl_records':lines,'forbidden_exhaustiveness_events':forbidden,'lossless_source_comparison':expected is not None,'gzip_bytes':packed.stat().st_size}
    write(out/'event_stream_manifest.json',manifest)
    if plain.exists():
        target=plain.resolve();assert target.parent==out and target.name=='search_events.jsonl' and target.is_relative_to(ROOT.resolve())
        target.unlink() # Only this newly generated, verified, reproducible aggregate; raw task files stay intact.
    print(json.dumps(manifest))
    return manifest
if __name__=='__main__':
    p=argparse.ArgumentParser();p.add_argument('--out',required=True);args=p.parse_args();compress(Path(args.out))
