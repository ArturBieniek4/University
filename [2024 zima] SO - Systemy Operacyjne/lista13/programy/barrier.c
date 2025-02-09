#include "csapp.h"

static __unused void outc(char c) {
  Write(STDOUT_FILENO, &c, 1);
}

typedef struct {
  /* TODO: Use this structure to store barrier internal state. */
  sem_t cnt_mutex;
  int cnt;
  sem_t gate;
  int N;
} barrier_t;

static barrier_t *barrier_init(int n) {
  if (n < 1)
    app_error("barrier_init requires n > 0");

  barrier_t *b = Mmap(NULL, sizeof(barrier_t), PROT_READ|PROT_WRITE,
                      MAP_ANON|MAP_SHARED, -1, 0);

  /* TODO: Initialize barrier internal state. */
  b->cnt=n;
  b->N=n;
  Sem_init(&b->cnt_mutex, 1, 1);
  Sem_init(&b->gate, 1, 0);
  return b;
}

static void barrier_wait(barrier_t *b) {
  printf("[%d]Ship entering the barrier!\n", getpid());
  bool last = false;
  Sem_wait(&b->cnt_mutex);
  assert(b->cnt>=1);
  b->cnt--;
  if(b->cnt==0) {
    last = true;
    // puszczanie statków przez 2 barierę
    for(int i=0; i<b->N-1; i++) {
	Sem_post(&b->gate);
    }
    b->cnt=b->N;
  }
  Sem_post(&b->cnt_mutex);
  printf("[%d]Ship waiting at the second barrier!\n", getpid());
  if(!last) Sem_wait(&b->gate);
  printf("[%d]Ship leaving the barrier!\n", getpid());
  /* TODO: Provide wait procedure implementation here. */
}

static void barrier_destroy(barrier_t *b) {
  /* TODO: Provide destroy procedure implementation here. */
  Sem_destroy(&b->cnt_mutex);
  Sem_destroy(&b->gate);
  Munmap(b, sizeof(barrier_t));
}

#define K 10
#define N 5
#define P 5

static noreturn void horse(barrier_t *b) {
  int n = rand() % K + K;

  outc('+');

  for (int i = 0; i < n; i++) {
    barrier_wait(b);
    usleep(rand() % 2000 + 1000);
  }

  outc('-');

  exit(EXIT_SUCCESS);
}

/* Do not bother cleaning up after this process. Let's assume that controlling
 * terminal sends SIGINT to the process group on CTRL+C. */
int main(void) {
  barrier_t *b = barrier_init(N);

  int horses = 0;

  for (;;) {
    do {
      if (Fork() == 0) {
        srand(getpid());
        horse(b);
      }
      horses++;
    } while (horses < P);

    Wait(NULL);
    horses--;
  }

  barrier_destroy(b);

  return EXIT_SUCCESS;
}
