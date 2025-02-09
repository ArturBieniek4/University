#!/usr/bin/env python3

# You MUST NOT modify this file without author's consent.
# Doing so is considered cheating!

import os
import pexpect
import unittest
import subprocess
import random
import time
import sys
from tempfile import NamedTemporaryFile


LOGFILE = 'sh-tests.{}.log'.format(os.getpid())
LD_PRELOAD = './trace.so'
BADFNS = ['sleep', 'poll', 'select', 'alarm']


class ShellTesterSimple():
    def setUp(self):
        test_id = '.'.join(self.id().split('.')[-2:])
        self.child = pexpect.spawn('./shell')
        self.child.logfile = open(LOGFILE, 'ab')
        self.child.logfile.write(f'>>> Test: "{test_id}"\n'.encode('utf-8'))
        self.child.setecho(False)
        # self.child.interact()
        self.expect('#')

    def tearDown(self):
        self.sendline('exit\n')
        self.child.logfile.close()

    def lines_before(self):
        before = self.child.before.decode('utf-8').split('\r\n')
        return [line.strip() for line in before if len(line)]

    def send(self, s):
        self.child.send(s)

    def sendline(self, s):
        self.child.sendline(s)

    def sendintr(self):
        self.child.sendintr()

    def sendcontrol(self, ch):
        self.child.sendcontrol(ch)

    def expect(self, s, **kw):
        try:
            self.child.expect(s, **kw)
        except pexpect.exceptions.TIMEOUT:
            self.log(f'TEST: expected "{s}"')
            raise

    def expect_exact(self, s, **kw):
        try:
            self.child.expect_exact(s, **kw)
        except pexpect.exceptions.TIMEOUT:
            self.log(f'TEST: expected "{s}"')
            raise

    @property
    def pid(self):
        return self.child.pid

    def wait(self):
        self.child.wait()

    def execute(self, cmd):
        """ Captures an output from the command. """
        # There's bug (?) in pexpect that's somewhat difficult to reproduce.
        # After the command is issued we read from standard output till
        # prompt character. Unexpectedly sometimes the command string
        # is getting captured as the first line of output from the command.
        self.sendline(cmd)
        self.expect('#')
        before = self.lines_before()
        # XXX: Workaround for issue described above.
        if before and cmd in before[0]:
            before.pop(0)
        return before

    def log(self, msg):
        self.child.logfile.write(f'{msg}\n'.encode('utf-8'))


class ShellTester(ShellTesterSimple):
    def setUp(self):
        os.environ['LD_PRELOAD'] = LD_PRELOAD
        super().setUp()

    def tearDown(self):
        del os.environ['LD_PRELOAD']
        super().tearDown()

    def expect_syscall(self, name, caller=None):
        self.expect('\[(\d+):(\d+)\] %s\(([^)]*)\)([^\r]*)\r\n' % name)

        pid, pgrp, args, retval = self.child.match.groups()
        pid = int(pid)
        pgrp = int(pgrp)
        args = args.decode('utf-8')
        retval = retval.decode('utf-8')
        result = {'pid': pid, 'pgrp': pgrp, 'args': []}

        if args not in ['...', '']:
            for arg in args.split(', '):
                try:
                    result['args'].append(int(arg))
                except ValueError:
                    result['args'].append(arg)

        if caller is not None:
            self.assertEqual(caller, pid)
        if not retval:
            return result
        if retval.startswith(' = '):
            result['retval'] = int(retval[3:])
            return result
        if retval.startswith(' -> '):
            items = retval[5:-1].strip()
            if not items:
                return result
            for item in items.split(', '):
                k, v = item.split('=', 1)
                try:
                    result[k] = int(v)
                except ValueError:
                    result[k] = v
            return result
        raise RuntimeError

    def expect_fork(self, parent=None):
        return self.expect_syscall('fork', caller=parent)

    def expect_execve(self, child=None):
        return self.expect_syscall('execve', caller=child)

    def expect_kill(self, pid=None, signum=None):
        while True:
            res = self.expect_syscall('kill', caller=self.pid)
            if res['args'][0] == pid and res['args'][1] == signum:
                break

    def expect_waitpid(self, pid=None, status=None):
        while True:
            res = self.expect_syscall('waitpid')
            if res['pid'] == pid and res.get('status', None) == status:
                break
        self.assertEqual(status, res.get('status', -1))

    def expect_spawn(self):
        result = self.expect_fork(parent=self.pid)
        self.expect_execve(child=result['retval'])
        return result


class TestShellSimple(ShellTesterSimple, unittest.TestCase):
    def test_redir_1(self):
        nlines = 582
        inf_name = 'include/queue.h'

        # 'wc -l include/queue.h > out'
        with NamedTemporaryFile(mode='r') as outf:
            self.execute('wc -l ' + inf_name + ' >' + outf.name)
            self.assertEqual(int(outf.read().split()[0]), nlines)

        # 'wc -l < include/queue.h'
        lines = self.execute('wc -l < ' + inf_name)
        self.assertEqual(lines[0], str(nlines))

        # 'wc -l < include/queue.h > out'
        with NamedTemporaryFile(mode='r') as outf:
            self.execute('wc -l < ' + inf_name + ' >' + outf.name)
            self.assertEqual(int(outf.read().split()[0]), nlines)

    def test_redir_2(self):
        with NamedTemporaryFile(mode='w') as inf:
            with NamedTemporaryFile(mode='r') as outf:
                n = random.randrange(100, 200)

                for i in range(n):
                    inf.write('a\n')
                inf.flush()

                # 'wc -l < random-text > out'
                self.execute('wc -l ' + inf.name + ' >' + outf.name)
                self.assertEqual(outf.read().split()[0], str(n))

    def test_pipeline_1(self):
        lines = self.execute('grep LIST include/queue.h | wc -l')
        self.assertEqual(lines[0], '46')

    def test_pipeline_2(self):
        lines = self.execute(
                'cat include/queue.h | cat | grep LIST | cat | wc -l')
        self.assertEqual(lines[0], '46')

    def test_pipeline_3(self):
        with NamedTemporaryFile(mode='r') as outf:
            self.execute(
                    'cat < include/queue.h | grep LIST | wc -l > ' + outf.name)
            self.assertEqual(int(outf.read().split()[0]), 46)

    def test_fd_leaks(self):
        # 'ls -l /proc/self/fd'
        lines = self.execute('ls -l /proc/self/fd')
        self.assertEqual(len(lines), 5)
        for i in range(3):
            self.assertIn('%d -> /dev/pts/' % i, lines[i + 1])
        self.assertIn('3 -> /proc/', lines[4])

        # 'ls -l /proc/self/fd | cat'
        lines = self.execute('ls -l /proc/self/fd | cat')
        self.assertEqual(len(lines), 5)
        self.assertIn('pipe:', lines[2])

        # 'true | ls -l /proc/self/fd'
        lines = self.execute('true | ls -l /proc/self/fd')
        self.assertEqual(len(lines), 5)
        self.assertIn('pipe:', lines[1])

        # 'true | ls -l /proc/self/fd | cat'
        lines = self.execute('true | ls -l /proc/self/fd | cat')
        self.assertEqual(len(lines), 5)
        self.assertIn('pipe:', lines[1])
        self.assertIn('pipe:', lines[2])

        # check shell 'ls -l /proc/$pid/fd'
        lines = self.execute('ls -l /proc/%d/fd' % self.pid)
        self.assertEqual(len(lines), 5)
        for i in range(4):
            self.assertIn('%d -> /dev/pts/' % i, lines[i + 1])

    def test_exitcode_1(self):
        # 'true &'
        self.sendline('true &')
        self.expect_exact("running 'true'")
        self.sendline('jobs')
        self.expect_exact("exited 'true', status=0")

        # 'false &'
        self.sendline('false &')
        self.expect_exact("running 'false'")
        self.sendline('jobs')
        self.expect_exact("exited 'false', status=1")

        if False:
            # 'exit 42 &'
            self.sendline('exit 42 &')
            self.expect_exact("running 'exit 42'")
            self.sendline('jobs')
            self.expect_exact("exited 'exit 42', status=42")

    def test_kill_suspended(self):
        self.sendline('cat &')
        self.expect_exact("running 'cat'")
        self.sendline('jobs')
        self.expect_exact("suspended 'cat'")
        self.sendline('pkill -9 cat')
        self.expect_exact("killed 'cat' by signal 9")

    def test_resume_suspended(self):
        prog = 'cat'
        self.sendline(f'{prog} &')
        self.expect_exact(f"running '{prog}'")
        self.expect('#')
        self.sendline('jobs')
        self.expect_exact(f"suspended '{prog}'")
        self.sendline('fg')
        self.expect_exact(f"continue '{prog}'")
        self.sendintr()
        self.sendline('jobs')
        self.expect('#', searchwindowsize=2)

    def test_kill_jobs(self):
        self.sendline('sleep 1000 &')
        self.expect_exact("[1] running 'sleep 1000'")
        self.sendline('sleep 2000 &')
        self.expect_exact("[2] running 'sleep 2000'")
        self.sendline('jobs')
        self.expect_exact("[1] running 'sleep 1000'")
        self.expect_exact("[2] running 'sleep 2000'")
        self.sendline('kill %2')
        self.sendline('jobs')
        self.expect_exact("[1] running 'sleep 1000'")
        self.expect_exact("[2] killed 'sleep 2000' by signal 15")
        self.sendline('kill %1')
        self.sendline('jobs')
        self.expect_exact("[1] killed 'sleep 1000' by signal 15")

    def test_kill_at_quit(self):
        self.sendline('sleep 1000 &')
        self.expect_exact("[1] running 'sleep 1000'")
        self.sendline('sleep 2000 &')
        self.expect_exact("[2] running 'sleep 2000'")
        self.sendline('jobs')
        self.expect_exact("[1] running 'sleep 1000'")
        self.expect_exact("[2] running 'sleep 2000'")
        self.sendcontrol('d')
        self.expect_exact("[1] killed 'sleep 1000' by signal 15")
        self.expect_exact("[2] killed 'sleep 2000' by signal 15")


class TestShellWithSyscalls(ShellTester, unittest.TestCase):
    def stty(self):
        with NamedTemporaryFile(mode='r') as sttyf:
            self.execute('stty -a')
            return sttyf.read()

    def test_quit(self):
        self.sendline('quit')
        self.wait()

    def test_sigint(self):
        self.sendline('cat')
        child = self.expect_spawn()['retval']
        self.sendintr()
        self.expect_waitpid(pid=child, status='SIGINT')
        self.expect('#')

    def test_sigtstp(self):
        self.sendline('cat')
        child = self.expect_spawn()['retval']
        self.sendcontrol('z')
        self.expect_waitpid(pid=child, status='SIGTSTP')
        self.sendline('fg 1')
        self.expect_waitpid(pid=child, status='SIGCONT')
        self.sendcontrol('d')
        self.expect('#')

    def test_terminate_tstped(self):
        self.sendline('cat')
        child = self.expect_spawn()['retval']
        self.sendcontrol('z')
        self.expect_waitpid(pid=child, status='SIGTSTP')
        self.sendline('kill %1')
        self.expect_kill(pid=-child, signum='SIGCONT')
        self.expect_waitpid(pid=child, status='SIGTERM')
        self.sendline('jobs')
        self.expect_exact("[1] killed 'cat' by signal 15")

    def test_terminate_ttined(self):
        self.sendline('cat &')
        child = self.expect_spawn()['retval']
        self.expect_waitpid(pid=child, status='SIGTTIN')
        self.sendline('kill %1')
        self.expect_kill(pid=-child, signum='SIGCONT')
        self.expect_waitpid(pid=child, status='SIGTERM')
        self.sendline('jobs')
        self.expect_exact("[1] killed 'cat' by signal 15")

    def test_termattr_1(self):
        stty_before = self.stty()
        self.sendline('more shell.c')
        child = self.expect_spawn()['retval']
        self.send('q')
        self.expect_waitpid(pid=child, status=0)
        self.expect('#')
        stty_after = self.stty()
        self.assertEqual(stty_before, stty_after)

    def test_termattr_2(self):
        prog = 'more shell.c'
        stty_before = self.stty()
        self.sendline(prog)
        child = self.expect_spawn()['retval']
        self.expect('--More--')
        self.sendcontrol('z')
        self.expect_waitpid(pid=child, status='SIGSTOP')
        self.sendline('kill %1')
        self.expect_waitpid(pid=child, status='SIGTERM')
        self.sendline('jobs')
        self.expect_exact(f"[1] killed '{prog}' by signal 15")
        stty_after = self.stty()
        self.assertEqual(stty_before, stty_after)


if __name__ == '__main__':
    os.environ['PATH'] = '/usr/bin:/bin'
    os.environ['LC_ALL'] = 'C'

    ldd = subprocess.run(['ldd', 'shell'], stdout=subprocess.PIPE)
    for line in ldd.stdout.decode('utf-8').splitlines():
        if 'libasan' in line:
            LD_PRELOAD = line.split()[2] + ':' + LD_PRELOAD

    # Fail loudly if a call to function that can provide sleep functionality
    # is used.  We don't want it to be used for synchronization purposes.
    nm = subprocess.run(['nm', '-u', 'shell.o', 'jobs.o', 'command.o'],
                        stdout=subprocess.PIPE)
    for line in nm.stdout.decode('utf-8').splitlines():
        fields = [fs.strip() for fs in line.split()]
        if len(fields) != 2:
            continue
        if fields[0] == 'U' and any(fn in fields[1] for fn in BADFNS):
            raise SystemExit(f'Solution rejected: a call to "{fields[1]}" '
                             f'is not permitted!')

    with open(LOGFILE, 'wb') as f:
        f.truncate()

    try:
        unittest.main()
    finally:
        print(f'\nTest results were saved to "{LOGFILE}".')
