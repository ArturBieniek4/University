#include "csapp.h"

static unsigned int seed = 0xdeadc0de;

pid_t Fork(void) {
  pid_t pid;
  if ((pid = fork()) < 0)
    unix_error("Fork error");
  /*
   * Scheduler is not good enough at radomizing time of return from fork().
   * Let's help it by adding some extra random delay in one of parent or child.
   */
  seed += getpid();
  if (seed & 1)
    usleep(rand_r(&seed) % 10000);
  return pid;
}
