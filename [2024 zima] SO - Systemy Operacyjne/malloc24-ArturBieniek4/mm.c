/*
Artur Bieniek 347165, jestem jedynym autorem kodu źródłowego
 * Boundary tags
 * Stopka tylko w wolnych blokach
 * First fit
 * O(1) Coalescing
 */
#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>
#include <stdint.h>
#include <stddef.h>
#include <unistd.h>

#include "mm.h"
#include "memlib.h"

/* If you want debugging output, use the following macro.  When you hand
 * in, remove the #define DEBUG line. */
// #define DEBUG
#ifdef DEBUG
#define debug(...) printf(__VA_ARGS__)
#else
#define debug(...)
#endif

/* do not change the following! */
#ifdef DRIVER
/* create aliases for driver tests */
#define malloc mm_malloc
#define free mm_free
#define realloc mm_realloc
#define calloc mm_calloc
#endif /* def DRIVER */

typedef struct {
  uint32_t header;
  /*
   * We don't know what the size of the payload will be, so we will
   * declare it as a zero-length array.  This allow us to obtain a
   * pointer to the start of the payload.
   */
  uint8_t payload[];
} block_t;

static block_t *heap_start = NULL;
static block_t *heap_end;

static inline size_t round_up(size_t size) {
  return (size + ALIGNMENT - 1) & -ALIGNMENT;
}

static inline size_t get_size(uint32_t header) {
  return header & ~0b1111;
}

static inline uint32_t *get_footer(block_t *block, size_t size) {
  debug("FOOTER(%p, %ld)=%p\n", block, size,
        (uint32_t *)((uint8_t *)block + size - sizeof(uint32_t)));
  return (uint32_t *)((uint8_t *)block + size - sizeof(uint32_t));
}

static inline void set_footer(block_t *block, size_t size, bool is_allocated) {
  uint32_t *footer = get_footer(block, size);
  assert(footer >= (uint32_t *)heap_start);
  assert(footer <= (uint32_t *)heap_end);
  *footer = size | is_allocated;
}

static inline block_t *next_block(block_t *block) {
  return (block_t *)((uint8_t *)block + get_size(block->header));
}

static inline block_t *prev_block(block_t *block) {
  uint32_t *footer = get_footer(block, 0);
  size_t size = get_size(*footer);
  return (block_t *)((uint8_t *)block - size);
}

static inline bool is_allocated(block_t *block) {
  if ((block < heap_start))
    return true; // TODO: jeśli to występuje to raczej świadczy o jakimś bugu
  if (block >= heap_end)
    return true;
  return block->header & 0b1;
}

static inline bool previous_allocated(block_t *block) {
  return (block->header & 0b10) >> 1;
}

static inline void set_header(block_t *block, size_t size, bool alloc,
                              bool prev_allocated) {
  assert(block >= heap_start);
  assert((size & 0b1111) == 0);
  block->header = size | alloc | (prev_allocated << 1);
}

static inline void coalesce(block_t *block) {
  size_t size = get_size(block->header);
  debug("COALESCE(%p), size=%ld\n", block, size);
  block_t *prev = prev_block(block);
  block_t *next = next_block(block);
  debug("Prev=%p, heap_end=%p\n", prev, heap_end);
  bool prev_allocated =
    (block == heap_start) || previous_allocated(block) || is_allocated(prev);
  bool next_allocated = next >= heap_end || is_allocated(next);

  if (!prev_allocated) {
    block = prev;
    debug("Prev size=%ld\n", get_size(block->header));
    size += get_size(block->header);
  }

  if (!next_allocated) {
    debug("Next size=%ld\n", get_size(next->header));
    size += get_size(next->header);
  }
  set_header(block, size, false, previous_allocated(block));
  set_footer(block, size, false);
}

static inline block_t *find_fit(size_t size, bool *last_allocated) {
  debug("FIND FIT: %ld\n", size);
  block_t *current = heap_start;
  while (current < heap_end) {
    *last_allocated = is_allocated(current);
    if (!is_allocated(current) && get_size(current->header) >= size) {
      return current;
    }
    current = next_block(current);
  }
  return NULL;
}

/*
 * mm_init - Called when a new trace starts.
 */
int mm_init(void) {
  /* Pad heap start so first payload is at ALIGNMENT. */
  if ((long)(mem_sbrk(ALIGNMENT - offsetof(block_t, payload))) < 0) {
    return -1;
  }
  heap_start = mem_sbrk(0);
  heap_end = heap_start;
  debug("MM_INIT. Heap start: %p\n", heap_start);

  return 0;
}

/*
 * malloc - Allocate a block by incrementing the brk pointer.
 *      Always allocate a block whose size is a multiple of the alignment.
 */
void *malloc(size_t size) {
  debug("MALLOC(%ld", size);
  size = round_up(sizeof(block_t) + size);
  debug("|%ld)\n", size);
  bool last_allocated = true;
  block_t *block = find_fit(size, &last_allocated);
  if (block) {
    size_t block_size = get_size(block->header);
    debug("MALLOC FOUND BLOCK %p, size=%ld, payload size=%ld\n", block,
          block_size, size);
    if (block_size - size >= sizeof(block_t) + sizeof(uint32_t)) {
      debug("%ld|%ld\n", size, block_size);
      set_header(block, size, true, previous_allocated(block));
      block_t *next = next_block(block);
      set_header(next, block_size - size, false, true);
      set_footer(next, block_size - size, false);

      // Zapisujemy w kolejnym że jest wolny blok przed nim!
      next = next_block(next);
      if (next < heap_end)
        set_header(next, get_size(next->header), is_allocated(next), false);

    } else {
      set_header(block, block_size, true, previous_allocated(block));
      // Zapisujemy w kolejnym że już nie jest wolny blok przed nim!
      block_t *next = next_block(block);
      if (next < heap_end)
        set_header(next, get_size(next->header), is_allocated(next), true);
    }
  } else {
    block = mem_sbrk(size);
    heap_end = (block_t *)((uint8_t *)heap_end + size);
    debug("SBRK(%ld): %p, stack end is now: %p\n", size, block, heap_end);
    if ((long)block < 0)
      return NULL;

    set_header(block, size, true, last_allocated);
    debug("Block size is %ld\n", get_size(block->header));
  }
  return block->payload;
}

/*
 * free
 *
 */
void free(void *ptr) {
  if (!ptr)
    return;

  block_t *block = (block_t *)((uint8_t *)ptr - sizeof(block_t));
  size_t size = get_size(block->header);
  debug("FREE %p %ld\n", block, size);
  set_header(block, size, false, previous_allocated(block));
  set_footer(block, size, false);
  block_t *next = next_block(block);
  if (next < heap_end) {
    set_header(next, get_size(next->header), is_allocated(next), false);
  }
  coalesce(block);
}

/*
 * realloc - Change the size of the block by mallocing a new block,
 *      copying its data, and freeing the old block.
 **/
void *realloc(void *old_ptr, size_t size) {
  /* If size == 0 then this is just free, and we return NULL. */
  if (size == 0) {
    free(old_ptr);
    return NULL;
  }

  /* If old_ptr is NULL, then this is just malloc. */
  if (!old_ptr)
    return malloc(size);

  block_t *block = (block_t *)((uint8_t *)old_ptr - offsetof(block_t, payload));
  size_t old_size = get_size(block->header);

  if (round_up(size + sizeof(uint32_t)) <= old_size)
    return old_ptr;
  debug("REALLOC(%p, %ld), old=%ld\n", old_ptr, size, old_size);

  size_t block_size = round_up(size + sizeof(uint32_t));
  block_t *next = next_block(block);
  if (next < heap_end && !is_allocated(next)) {
    size_t total_space = get_size(block->header) + get_size(next->header);
    if (total_space >= block_size) {
      set_header(block, total_space, true,
                 previous_allocated(block)); // TODO: size czy blocksize?

      block_t *next = next_block(block);
      if (next < heap_end)
        set_header(next, get_size(next->header), is_allocated(next), true);
      if (total_space > block_size) {
        block_t *new_block = (block_t *)((uint8_t *)block + size);
        set_header(new_block, total_space - block_size, false, true);
      }

      return old_ptr;
    }
  }
  if (next == heap_end) {
    size_t space_needed = block_size - old_size;
    mem_sbrk(space_needed);
    heap_end = (block_t *)((uint8_t *)heap_end + space_needed);
    set_header(block, block_size, true, previous_allocated(block));
    return old_ptr;
  }

  void *new_ptr = malloc(size);
  /* If malloc() fails, the original block is left untouched. */
  if (!new_ptr)
    return NULL;
  memcpy(new_ptr, old_ptr, old_size);
  free(old_ptr);
  return new_ptr;
}

/*
 * mm_checkheap -
 */
void mm_checkheap(int verbose) {
  if (verbose) {
    debug("----- BLOCKS DUMP -----\n");
    block_t *current = heap_start;
    while (current < heap_end) {
      size_t size = get_size(current->header);
      if (size % ALIGNMENT != 0) {
        debug("Block size not aligned!\n");
      }
      debug("%d %d Block %p, payload at %p size=%ld\n", is_allocated(current),
            previous_allocated(current), current, current->payload, size);
      block_t *next = next_block(current);
      if (next < heap_end) {
#ifndef DEBUG
        assert(previous_allocated(next) == is_allocated(current));
#endif
        if (previous_allocated(next) != is_allocated(current)) {
          debug("MEMCHECK ERROR! Allocation status not consistent!\n");
        }
      }
      current = next;
    }
    debug("----- END OF DUMP -----\n");
  }
}
