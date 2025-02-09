#include "csapp.h"

static pid_t spawn(void (*fn)(void)) {
  pid_t pid = Fork();
  if (pid == 0) {
    fn();
    printf("(%d) I'm done!\n", getpid());
    exit(EXIT_SUCCESS);
  }
  return pid;
}

static void sigint_handler(int sig) {}

static void grandchild(void) {
  printf("(%d) Waiting for signal!\n", getpid());
  signal(SIGINT, sigint_handler);
  pause();
  printf("(%d) Got the signal!\n", getpid());
}

static void child(void) {
  pid_t pid;
  setpgid(0, getpid());
  pid = spawn(grandchild);
  printf("(%d) Grandchild (%d) spawned!\n", getpid(), pid);
}

/* Runs command "ps -o pid,ppid,pgrp,stat,cmd" using execve(2). */
static void ps(void) {
  char *argv[] = {"/usr/bin/ps", "-o", "pid,ppid,pgrp,stat,cmd", NULL};
  execve("/usr/bin/ps", argv, environ);
  perror("execve error\n");
}

int main(void) {
  Prctl(PR_SET_CHILD_SUBREAPER, 1);
  printf("(%d) I'm a reaper now!\n", getpid());

  pid_t pid, pgrp;
  int status;

  pgrp=spawn(child);
  Waitpid(pgrp, NULL, 0);

  pid=spawn(ps);
  Waitpid(pid, NULL, 0);

  printf("(%d) SIGINT to pgrp (%d)!\n", getpid(), pgrp);
  Kill(-pgrp, SIGINT);
  
  waitpid(-1, &status, 0);
  printf("(%d) Child exit status is (%d)!\n", getpid(), status);
  return EXIT_SUCCESS;
}
