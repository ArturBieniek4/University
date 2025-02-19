#include <errno.h>
#include <inttypes.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdnoreturn.h>
#include <string.h>
#include <sys/time.h>

#define __noinline __attribute__((noinline))

extern uint64_t addsb(uint64_t x, uint64_t y);

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
static __noinline uint64_t addsb_iter(uint64_t x, uint64_t y) {
  uint64_t r = 0;
  for (int i = 0; i < 64; i += 8) {
    int xb = (int8_t)(x >> i);
    int yb = (int8_t)(y >> i);
    int rb = xb + yb;
    if (rb > INT8_MAX)
      rb = INT8_MAX;
    if (rb < INT8_MIN)
      rb = INT8_MIN;
    r |= (uint64_t)(rb & 255) << i;
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

static void run(uint64_t x, uint64_t y) {
  uint64_t fast, slow;

  caller_regs_t before, after;
  save_caller_regs(&before);
  fast = addsb(x, y);
  save_caller_regs(&after);

  for (int i = 0; i < sizeof(caller_regs_t) / sizeof(uint64_t); i++) {
    if (before.reg[i] != after.reg[i]) {
      printf("addsb(...) does not adhere to ABI calling convention!\n");
      exit(EXIT_FAILURE);
    }
  }

  slow = addsb_iter(x, y);
  if (fast != slow) {
    printf("addsb(0x%016lx, 0x%016lx) = 0x%016lx (your answer: 0x%016lx)\n",
           x, y, slow, fast);
    exit(EXIT_FAILURE);
  }
}

int main(int argc, char *argv[]) {
  if (argc != 3)
    goto fail;

  if (strcmp("-r", argv[1])) {
    uint64_t x = strtoul(argv[1], NULL, 16);
    if (errno)
      goto fail;
    uint64_t y = strtoul(argv[2], NULL, 16);
    if (errno)
      goto fail;
    run(x, y);
    return EXIT_SUCCESS;
  } else {
    int times = strtol(argv[2], NULL, 10);
    if (times < 0)
      goto fail;

    struct timeval tv;
    gettimeofday(&tv, NULL);

    uint64_t seed = tv.tv_sec + tv.tv_usec * 1e6;

    for (int i = 0; i < times; i++)
      run(random_u64(&seed), random_u64(&seed));

    return EXIT_SUCCESS;
  }

fail:
  fprintf(stderr, "Usage: %s [-r TIMES] [NUMBER]\n", argv[0]);
  return EXIT_FAILURE;
}
