#include "csapp.h"

static void noise(void) {
#ifdef NOISE
  static __thread unsigned seed = 0;

  if (!seed)
    seed = rdtsc();

  switch (rand_r(&seed) & 31) {
    case 0:
      usleep(rand_r(&seed) % 1000 + 1000);
      break;
    case 1:
      sched_yield();
    default:
      break;
  }
#endif
}

void Sem_init(sem_t *sem, int pshared, unsigned value) {
  if (sem_init(sem, pshared, value))
    unix_error("sem_init");
}

void Sem_destroy(sem_t *sem) {
  if (sem_destroy(sem))
    unix_error("sem_destroy");
}

void Sem_wait(sem_t *sem) {
  noise();
  if (sem_wait(sem))
    unix_error("sem_wait");
  noise();
}

void Sem_getvalue(sem_t *sem, int *sval) {
  noise();
  if (sem_getvalue(sem, sval))
    unix_error("sem_getvalue");
  noise();
}

void Sem_post(sem_t *sem) {
  noise();
  if (sem_post(sem))
    unix_error("sem_post");
  noise();
}
