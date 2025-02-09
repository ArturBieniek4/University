#ifndef _SHELL_H_
#define _SHELL_H_

#include "csapp.h"

#define msg(...) dprintf(STDERR_FILENO, __VA_ARGS__)

#if DEBUG > 0
#define debug(...) dprintf(STDERR_FILENO, __VA_ARGS__)
#else
#define debug(...)
#endif

typedef char *token_t;

#define T_NULL ((token_t)0)
#define T_AND ((token_t)1)
#define T_OR ((token_t)2)
#define T_PIPE ((token_t)3)
#define T_BGJOB ((token_t)4)
#define T_COLON ((token_t)5)
#define T_OUTPUT ((token_t)6)
#define T_INPUT ((token_t)7)
#define T_APPEND ((token_t)8)
#define T_BANG ((token_t)9)
#define separator_p(t) ((t) <= T_COLON)
#define string_p(t) ((t) > T_BANG)

void strapp(char **dstp, const char *src);
token_t *tokenize(char *s, int *tokc_p);

/* Do not change those values or code will break! */
enum {
  FG = 0, /* foreground job */
  BG = 1, /* background job */
};

/* Do not change those values or code will break! */
enum {
  ALL = -1,     /* all jobs */
  FINISHED = 0, /* only jobs that have finished */
  RUNNING = 1,  /* only jobs that are still running */
  STOPPED = 2,  /* jobs that have been suspended by SIGTSTP / SIGSTOP */
};

void initjobs(void);
void shutdownjobs(void);

int addjob(pid_t pgid, int bg);
void addproc(int job, pid_t pid, char **argv);
bool killjob(int job);
void watchjobs(int state);
char *jobcmd(int job);
bool resumejob(int job, int bg, sigset_t *mask);
int monitorjob(sigset_t *mask);

void setfgpgrp(pid_t pgid);

int builtin_command(char **argv);
noreturn void external_command(char **argv);

/* Used by Sigprocmask to enter critical section protecting against SIGCHLD. */
extern sigset_t sigchld_mask;

#endif /* !_SHELL_H_ */
