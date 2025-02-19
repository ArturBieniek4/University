#include <errno.h>
#include <inttypes.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdnoreturn.h>
#include <string.h>
#include <sys/time.h>

extern uint64_t bitrev(uint64_t);

/* https://en.wikipedia.org/wiki/Xorshift#xorshift* */
static uint64_t random_u64(uint64_t *seed) {
  uint64_t x = *seed;
  x ^= x >> 12;
  x ^= x << 25;
  x ^= x >> 27;
  *seed = x;
  return x * 0x2545F4914F6CDD1DUL;
}

/* Only for testing. Such solution would get 0 points. */
static uint64_t bitrev_iter(uint64_t x) {
  uint64_t b, r = 0;
  for (int i = 0; i < 64; i++) {
    b = (x >> i) & 1;
    r |= b << (63 - i);
  }
  return r;
}

typedef union caller_regs {
  struct {
    uint64_t rbx;
    uint64_t r12;
    uint64_t r13;
    uint64_t r14;
    uint64_t r15;
    uint64_t rbp;
  };
  uint64_t reg[6];
} caller_regs_t;

#define save_caller_regs(regs)                                                 \
  asm volatile("mov %%rbx,  0(%0);"                                            \
               "mov %%r12,  8(%0);"                                            \
               "mov %%r13, 16(%0);"                                            \
               "mov %%r14, 24(%0);"                                            \
               "mov %%r15, 32(%0);"                                            \
               "mov %%rbp, 40(%0);"                                            \
               : /* no outputs */                                              \
               : "r" (regs)                                                    \
               : "memory", "rbx", "r12", "r13", "r14", "r15", "rbp")

static void run(uint64_t arg) {
  uint64_t fast, slow;

  caller_regs_t before, after;
  save_caller_regs(&before);
  fast = bitrev(arg);
  save_caller_regs(&after);

  for (int i = 0; i < sizeof(caller_regs_t) / sizeof(uint64_t); i++) {
    if (before.reg[i] != after.reg[i]) {
      printf("bitrev(...) does not adhere to ABI calling convention!\n");
      exit(EXIT_FAILURE);
    }
  }

  slow = bitrev_iter(arg);
  if (fast != slow) {
    printf("bitrev(0x%016lx) = 0x%016lx (your answer: 0x%016lx)\n",
           arg, slow, fast);
    exit(EXIT_FAILURE);
  }
}

int main(int argc, char *argv[]) {
  if (argc == 2) {
    uint64_t arg = strtoul(argv[1], NULL, 16);
    if (errno)
      goto fail;
    run(arg);
    return EXIT_SUCCESS;
  }

  if (argc == 3) {
    if (strcmp("-r", argv[1]))
      goto fail;

    int times = strtol(argv[2], NULL, 10);
    if (times < 0)
      goto fail;

    struct timeval tv;
    gettimeofday(&tv, NULL);

    uint64_t seed = tv.tv_sec + tv.tv_usec * 1e6;

    for (int i = 0; i < times; i++)
      run(random_u64(&seed));

    return EXIT_SUCCESS;
  }

fail:
  fprintf(stderr, "Usage: %s [-r TIMES] [NUMBER]\n", argv[0]);
  return EXIT_FAILURE;
}
