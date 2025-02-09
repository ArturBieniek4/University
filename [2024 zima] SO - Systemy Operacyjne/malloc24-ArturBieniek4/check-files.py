#!/usr/bin/env python3

import hashlib
import io
import subprocess


def remove_solution(path):
    drop = False
    lines = []

    for line in open(path).readlines():
        if line.startswith('#endif /* !STUDENT */'):
            drop = False
        if not drop:
            lines.append(line)
        if line.startswith('#ifdef STUDENT'):
            drop = True

    return ''.join(lines).encode('utf-8')


if __name__ == '__main__':
    for line in open('files.sha256').readlines():
        sha_orig, path = line.split()
        if path == 'mm.c':
            contents = remove_solution(path)
        else:
            contents = open(path, 'rb').read()
        sha_new = hashlib.sha256(contents).hexdigest()
        if sha_orig != sha_new:
            raise SystemExit(
                    f'Unauthorized modification of {path} file!\n'
                    f'MD5 sum: {sha_new} vs {sha_orig} (original)')

    print('No unauthorized changes to source files.')
