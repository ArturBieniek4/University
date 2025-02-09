/* DO NOT MODIFY THIS FILE! */

#include <unistd.h>

/*
 * Alignment requirement in bytes (either 8 or 16)
 */
#define ALIGNMENT 16

/*
 * Maximum heap size in bytes
 */
#define MAX_HEAP (100 * (1 << 20)) /* 100 MB */

void mem_init(void);
void mem_deinit(void);
void *mem_sbrk(long incr);
void mem_reset_brk(void);
void *mem_heap_lo(void);
void *mem_heap_hi(void);
size_t mem_heapsize(void);
size_t mem_pagesize(void);
