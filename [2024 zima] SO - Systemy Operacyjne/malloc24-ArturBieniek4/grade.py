#!/usr/bin/env python3

import math
import signal
import subprocess
import sys


STUDENT_DEFINED = ['mm_calloc', 'mm_checkheap', 'mm_free', 'mm_init',
                   'mm_malloc', 'mm_realloc']


MINUTIL = 60
TIMEOUT = 30
TRACEFILES = [
        "traces/amptjp-bal.rep",
        "traces/amptjp.rep",
        "traces/bash.rep",
        "traces/binary.rep",
        "traces/binary-bal.rep",
        "traces/binary2.rep",
        "traces/binary2-bal.rep",
        "traces/cccp.rep",
        "traces/cccp-bal.rep",
        "traces/chrome.rep",
        "traces/coalescing.rep",
        "traces/coalescing-bal.rep",
        "traces/coalesce-big.rep",
        "traces/corners.rep",
        "traces/cp-decl.rep",
        "traces/cp-decl-bal.rep",
        "traces/expr.rep",
        "traces/expr-bal.rep",
        "traces/firefox.rep",
        "traces/fs.rep",
        "traces/hostname.rep",
        "traces/login.rep",
        "traces/lrucd.rep",
        "traces/ls.rep",
        "traces/ls.1.rep",
        "traces/malloc.rep",
        "traces/malloc-free.rep",
        "traces/nlydf.rep",
        "traces/perl.rep",
        "traces/perl.1.rep",
        "traces/perl.2.rep",
        "traces/perl.3.rep",
        "traces/pulseaudio.rep",
        "traces/qyqyc.rep",
        "traces/random.rep",
        "traces/random-bal.rep",
        "traces/random2.rep",
        "traces/random2-bal.rep",
        "traces/realloc2.rep",
        "traces/realloc2-bal.rep",
        "traces/rm.rep",
        "traces/rm.1.rep",
        "traces/rulsr.rep",
        "traces/short1.rep",
        "traces/short1-bal.rep",
        "traces/short2.rep",
        "traces/short2-bal.rep",
        "traces/stty.rep",
        "traces/tty.rep",
        "traces/xterm.rep"]

TRACEFILES_EXTRA = [
        "traces-private/alaska.rep",
        "traces-private/firefox-reddit2.rep",
        "traces-private/firefox-reddit.rep",
        "traces-private/freeciv.rep",
        "traces-private/merry-go-round.rep",
        "traces-private/realloc-bal.rep",
        "traces-private/realloc.rep",
        "traces-private/seglist.rep"]


def runtrace(trace):
    mdriver = subprocess.run([
        "valgrind",
        "--tool=callgrind",
        "--callgrind-out-file=callgrind.out",
        "--toggle-collect=mm_malloc",
        "--toggle-collect=mm_free",
        "--toggle-collect=mm_realloc",
        "--toggle-collect=mm_calloc",
        "--", "./mdriver", "-f", trace],
        capture_output=True, timeout=TIMEOUT)

    output = mdriver.stdout.decode()
    print(output)

    if any(line.startswith('ERROR') for line in output.splitlines()):
        raise SystemExit("Your solution is incorrect - check messages above!")

    if mdriver.returncode < 0:
        signame = signal.Signals(-mdriver.returncode).name
        raise SystemExit(f"Your solution has been terminated by {signame}!")

    if mdriver.returncode > 0:
        raise SystemExit(f"Your solution has exited abnormally "
                         f"with status {mdriver.returncode}!")

    # Process statistics from mdriver
    stats = mdriver.stdout.decode().splitlines()[3][4:].split()
    try:
        util = float(stats[1][:-1])
        used = int(stats[2])
        total = int(stats[3])
    except ValueError:
        print(stats)
        raise SystemExit("Reading statistics from 'mdriver' has failed :( "
                         "This is a bug - please report it!")

    annotate = subprocess.run([
        "callgrind_annotate", "--tree=calling", "callgrind.out"],
        capture_output=True)

    # Process output from callgrind_annotate
    insn = 0
    show = 10000
    for i, line in enumerate(annotate.stdout.decode().splitlines()):
        if i >= show and line:
            print(line)
        if 'PROGRAM TOTALS' in line:
            insn = int(line.strip().split()[0].replace(',', ''))
        if 'file:function' in line:
            show = i + 3

    sys.stdout.flush()

    return util, insn, used, total


def check_symbols():
    nm = subprocess.run(['nm', '-g', '--defined-only', 'mm.o'],
                        stdout=subprocess.PIPE)
    for line in nm.stdout.decode().splitlines():
        symbol = line.split()[-1]
        if symbol not in STUDENT_DEFINED:
            print(f'Symbol "{symbol}" in "mm.o" cannot be visible externally!')
            raise SystemExit("Your solution was disqualified! :(")


def check_sections():
    objdump = subprocess.run(['objdump', '-h', 'mm.o'],
                             stdout=subprocess.PIPE)

    data_size = 0
    for line in objdump.stdout.decode().splitlines()[5::2]:
        fs = line.split()
        if fs[1] in ['.data', '.bss']:
          data_size += int(fs[2], 16)

    threshold = 128
    if data_size >= threshold:
        print(f"Your solution stores too much data ({data_size} bytes) "
              f"in '.data' and '.bss' sections.")
        print(f"Please move top level data definitions into heap header!")
        raise SystemExit("Your solution was disqualified! :(")


if __name__ == '__main__':
    check_symbols()
    check_sections()

    all_ops = []
    all_insn = []
    all_util = []
    all_used = []
    all_total = []

    for trace in TRACEFILES:
        print("\nRunning mdriver for '%s'..." % trace)

        with open(trace, "r") as f:
            _ = int(f.readline())
            _ = int(f.readline())
            ops = int(f.readline())

        util = 0.0              # default utilization penalty for timeout
        insn = 50000.0 * ops    # default throughput penalty for timeout
        heapsz = math.inf

        try:
            util, insn, used, total = runtrace(trace)
        except subprocess.TimeoutExpired:
            print("Penalty accrued for timeout of %ds." % TIMEOUT)

        all_insn.append(insn)
        all_util.append(util)
        all_ops.append(ops)
        all_used.append(used)
        all_total.append(total)

    # Grade solution
    weighted_util = 0
    for util, ops in zip(all_util, all_ops):
        weighted_util += util * (ops / sum(all_ops))

    total_util = sum(all_used) / sum(all_total)

    print("\nWeighted memory utilization: %.1f%%" % weighted_util)
    print("Total memory utilization: %.2f%%" % (100.0 * total_util))
    print("Instructions per operation: %d" % (sum(all_insn) / sum(all_ops)))

    if weighted_util < MINUTIL:
        print("Minimum threshold for memory utilization "
              "of %d%% has not been met!" % MINUTIL)
        print("Your solution was disqualified! :(")
        sys.exit(1)
