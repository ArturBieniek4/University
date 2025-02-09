#!/usr/bin/env python3

import hashlib
import io

STUDENT_CODE = ['shell.c', 'command.c', 'jobs.c']

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
    for line in open('files.md5').readlines():
        md5_orig, path = line.split()
        if path in STUDENT_CODE:
            contents = remove_solution(path)
        else:
            contents = open(path, 'rb').read()
        md5_new = hashlib.md5(contents).hexdigest()
        if md5_orig != md5_new:
            raise SystemExit(
                    f'Unauthorized modification of {path} file!\n'
                    f'MD5 sum: {md5_new} vs {md5_orig} (original)')

    print('No unauthorized changes to source files.')
