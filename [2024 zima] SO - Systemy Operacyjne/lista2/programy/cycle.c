#include "csapp.h"

static void signal_handler(int signum, siginfo_t *info, void *data) {
  if (signum == SIGINT) {
    safe_printf("(%d) Screw you guys... I'm going home!\n", getpid());
    _exit(0);
  }
}

static void play(pid_t next, const sigset_t *set) {
  for (;;) {
    printf("(%d) Waiting for a ball!\n", getpid());
    Sigsuspend(set);
    usleep((300 + random() % 400) * 1000);
    Kill(next, SIGUSR1);
    printf("(%d) Passing ball to (%d)!\n", getpid(), next);
  }
}

int main(int argc, char *argv[]) {
  if (argc != 2)
    app_error("Usage: %s [CHILDREN]", argv[0]);

  int children = atoi(argv[1]);

  if (children < 4 || children > 20)
    app_error("Give number of children in range from 4 to 20!");

  /* Register signal handler for SIGUSR1 */
  struct sigaction action = {.sa_sigaction = signal_handler};
  Sigaction(SIGINT, &action, NULL);
  Sigaction(SIGUSR1, &action, NULL);

  /* TODO: Start all processes and make them wait for the ball! */
  sigset_t set, oldset;
  sigemptyset(&set);
  sigaddset(&set, SIGUSR1);
  sigprocmask(SIG_BLOCK, &set, &oldset);
  int next = getpid();
  setpgid(0, getpid());
  for(int i=0;i<children;i++)
  {
    int pid=Fork();
      if(pid>0)
      {//parent
        next=pid;
      }
      else
      {//child
        play(next, &oldset);
      }
  }
  Kill(next, SIGUSR1);
  play(next, &oldset);
  for(int i=0;i<children;i++)
  {
    Waitpid(-1, NULL, 0);
  }

  return EXIT_SUCCESS;
}
