/* You MUST NOT modify this file without author's consent.
 * Doing so is considered cheating! */

#define _GNU_SOURCE
#include <assert.h>
#include <dlfcn.h>
#include <signal.h>
#include <stdarg.h>
#include <stdio.h>
#include <stdlib.h>
#include <termios.h>
#include <unistd.h>

static int (*execve_p)(const char *path, char *const argv[],
                       char *const envp[]) = NULL;
static int (*fork_p)(void) = NULL;
static pid_t (*waitpid_p)(pid_t pid, int *status, int options) = NULL;
static int (*dup2_p)(int oldfd, int newfd) = NULL;
static int (*open_p)(const char *pathname, int flags, mode_t mode) = NULL;
static int (*close_p)(int fd) = NULL;
static int (*setpgid_p)(pid_t pid, pid_t pgid) = NULL;
static int (*tcsetpgrp_p)(int fd, pid_t pgrp);
static int (*tcsetattr_p)(int fd, int action, const struct termios *t);
static int (*kill_p)(pid_t pid, int sig);

static void xdlsym(const char *symbol, void **fn_p) {
  if (*fn_p == NULL) {
    *fn_p = dlsym(RTLD_NEXT, symbol);
    char *error = dlerror();
    if (error) {
      fputs(error, stderr);
      exit(EXIT_FAILURE);
    }
  }
}

#define LINESZ 256

static __attribute__((format(printf, 1, 2))) void report(const char *fmt, ...) {
  char line[LINESZ];
  int n = 0;
  va_list args;
  va_start(args, fmt);
  n += snprintf(line + n, LINESZ - n, "[%d:%d] ", getpid(), getpgrp());
  n += vsnprintf(line + n, LINESZ - n, fmt, args);
  assert(n < LINESZ); /* Need one character to terminate string! */
  line[n++] = '\n';
  va_end(args);
  int m = write(STDERR_FILENO, line, n);
  assert(m == n); /* Fail if write was not atomic! */
}

int execve(const char *path, char *const argv[], char *const envp[]) {
  xdlsym("execve", (void **)&execve_p);
  report("execve(\"%s\", %p, %p)", path, argv, envp);
  return execve_p(path, argv, envp);
}

int fork(void) {
  xdlsym("fork", (void **)&fork_p);
  pid_t child = fork_p();
  if (child)
    report("fork() = %d", child);
  return child;
}

#define _SN(x) [x] = #x

static const char *signame[NSIG] = {
    _SN(SIGHUP),  _SN(SIGINT),  _SN(SIGQUIT), _SN(SIGILL),  _SN(SIGTRAP),
    _SN(SIGABRT), _SN(SIGFPE),  _SN(SIGKILL), _SN(SIGBUS),  _SN(SIGSYS),
    _SN(SIGSEGV), _SN(SIGPIPE), _SN(SIGALRM), _SN(SIGTERM), _SN(SIGURG),
    _SN(SIGSTOP), _SN(SIGTSTP), _SN(SIGCONT), _SN(SIGCHLD), _SN(SIGTTIN),
    _SN(SIGTTOU), _SN(SIGPOLL), _SN(SIGXCPU), _SN(SIGXFSZ), _SN(SIGVTALRM),
    _SN(SIGPROF), _SN(SIGUSR1), _SN(SIGUSR2), _SN(SIGWINCH)};

#undef _SN

pid_t waitpid(pid_t pid, int *statusp, int options) {
  int status;
  xdlsym("waitpid", (void **)&waitpid_p);
  pid = waitpid_p(pid, &status, options);
  if (pid <= 0) {
    report("waitpid(...) -> {}");
  } else if (WIFCONTINUED(status)) {
    report("waitpid(...) -> {pid=%d, status=SIGCONT}", pid);
  } else if (WIFSTOPPED(status)) {
    report("waitpid(...) -> {pid=%d, status=%s}", pid,
           signame[WSTOPSIG(status)]);
  } else if (WIFSIGNALED(status)) {
    report("waitpid(...) -> {pid=%d, status=%s}", pid,
           signame[WTERMSIG(status)]);
  } else if (WIFEXITED(status)) {
    report("waitpid(...) -> {pid=%d, status=%d}", pid, WEXITSTATUS(status));
  }
  if (statusp)
    *statusp = status;
  return pid;
}

int open(const char *pathname, int flags, mode_t mode) {
  xdlsym("open", (void **)&open_p);
  int res = open_p(pathname, flags, mode);
  report("open(\"%s\", %d, %d) = %d", pathname, flags, mode, res);
  return res;
}

int close(int fd) {
  xdlsym("close", (void **)&close_p);
  int res = close_p(fd);
  report("close(%d) = %d", fd, res);
  return res;
}

int dup2(int oldfd, int newfd) {
  xdlsym("dup2", (void **)&dup2_p);
  int res = dup2_p(oldfd, newfd);
  report("dup2(%d, %d) = %d", oldfd, newfd, res);
  return res;
}

int setpgid(pid_t pid, pid_t pgid) {
  xdlsym("setpgid", (void **)&setpgid_p);
  int res = setpgid_p(pid, pgid);
  report("setpgid(%d, %d) = %d", pid, pgid, res);
  return res;
}

int kill(pid_t pid, int sig) {
  xdlsym("kill", (void **)&kill_p);
  int res = kill_p(pid, sig);
  report("kill(%d, %s) = %d", pid, signame[sig], res);
  return res;
}

int tcsetpgrp(int fd, pid_t pgrp) {
  xdlsym("tcsetpgrp", (void **)&tcsetpgrp_p);
  int res = tcsetpgrp_p(fd, pgrp);
  report("tcsetpgrp(%d, %d) = %d", fd, pgrp, res);
  return res;
}

int tcsetattr(int fd, int action, const struct termios *t) {
  xdlsym("tcsetattr", (void **)&tcsetattr_p);
  int res = tcsetattr_p(fd, action, t);
  report("tcsetattr(%d, %d, %p) = %d", fd, action, t, res);
  return res;
}
