/*
 * mdriver.c - Autolab version of the CS:APP Malloc Lab Driver
 *
 * Uses a collection of trace files to tests a malloc/free
 * implementation in mm.c.
 *
 * Copyright (c) 2004, R. Bryant and D. O'Hallaron, All rights reserved.
 * May not be used, modified, or copied without permission.
 *
 * WARNING! This file has been heavily modified compared to the original.
 */
#include <assert.h>
#include <errno.h>
#include <float.h>
#include <setjmp.h>
#include <signal.h>
#include <stdarg.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>
#include <unistd.h>
#include <sys/time.h>

#include "memlib.h"
#include "mm.h"

/**********************
 * Constants and macros
 **********************/

/* Misc */
#define MAXLINE 1024 /* max string size */
/* cnvt trace request nums to linenums (origin 1) */
#define LINENUM(i) (i + 5)

/* Returns true if p is ALIGNMENT-byte aligned */
#define IS_ALIGNED(p) ((((unsigned long)(p)) % ALIGNMENT) == 0)

/* weights */
#define WNONE 0
#define WALL 1
#define WUTIL 2
#define WPERF 3

/******************************
 * The key compound data types
 *****************************/

/*
 * There are two different, easily-confusable concepts:
 * - opnum: which line in the file.
 * - index: the block number ; corresponds to something allocated.
 * Remember that index (-1) is the null pointer.
 */

/* Records the extent of each block's payload */
typedef struct range_t {
  char *lo;             /* low payload address */
  char *hi;             /* high payload address */
  struct range_t *next; /* next list element */
  int index;            /* same index as free; for debugging */
} range_t;

/* Characterizes a single trace operation (allocator request) */
typedef struct {
  enum { ALLOC, FREE, REALLOC } type; /* type of request */
  int index;                          /* index for free() to use later */
  size_t size;                        /* byte size of alloc/realloc request */
} traceop_t;

/* Holds the information for one trace file*/
typedef struct {
  char filename[MAXLINE];
  int ignore_ranges;    /* don't check ranges (i.e. this is too big) */
  int num_ids;          /* number of alloc/realloc ids */
  int num_ops;          /* number of distinct requests */
  int weight;           /* weight for this trace (unused) */
  traceop_t *ops;       /* array of requests */
  char **blocks;        /* array of ptrs returned by malloc/realloc... */
  size_t *block_sizes;  /* ... and a corresponding array of payload sizes */
  int *block_rand_base; /* index into random_data, if debug is on */
} trace_t;

/*
 * Holds the params to the xxx_speed functions, which are timed by fcyc.
 * This struct is necessary because fcyc accepts only a pointer array
 * as input.
 */
typedef struct {
  trace_t *trace;
  range_t *ranges;
} speed_t;

/* Summarizes the important stats for some malloc function on some trace */
typedef struct {
  /* set in read_trace */
  char filename[MAXLINE];
  int weight;
  double ops; /* number of ops (malloc/free/realloc) in the trace */

  /* run-time stats defined for both libc and student */
  int valid;   /* was the trace processed correctly by the allocator? */
  double secs; /* number of secs needed to run the trace */

  /* defined only for the student malloc package */
  double util; /* space utilization for this trace (always 0 for libc) */
  int used;    /* maximum bytes used by allocated blocks */
  int total;   /* total heap size */

  /* Note: secs and util are only defined if valid is true */
} stats_t;

/********************
 * For debugging.  If debug-mode is on, then we have each block start
 * at a "random" place (a hash of the index), and copy random data
 * into it.  With DBG_CHEAP, we check that the data survived when we
 * realloc and when we free.  With DBG_EXPENSIVE, we check every block
 * every operation.
 * randint_t should be a byte, in case students return unaligned memory.
 *******************/
#define RANDOM_DATA_LEN (1 << 16)
typedef unsigned char randint_t;
static const char randint_t_name[] = "byte";
static randint_t random_data[RANDOM_DATA_LEN];

/********************
 * Global variables
 *******************/

static enum { DBG_NONE, DBG_CHEAP, DBG_EXPENSIVE } debug_mode = DBG_CHEAP;

static int verbose = 1; /* global flag for verbose output */

/*********************
 * Function prototypes
 *********************/

/* these functions manipulate range lists */
static int add_range(range_t **ranges, char *lo, int size, const trace_t *trace,
                     int opnum, int index);
static void remove_range(range_t **ranges, char *lo);
static void clear_ranges(range_t **ranges);

/* These functions implement the debugging code */
static void init_random_data(void);
static void check_index(const trace_t *trace, int opnum, int index);
static void randomize_block(trace_t *trace, int index);

/* These functions read, allocate, and free storage for traces */
static trace_t *read_trace(stats_t *stats, const char *filename);
static void reinit_trace(trace_t *trace);
static void free_trace(trace_t *trace);

/* Routines for evaluating the correctness and speed of libc malloc */
static int eval_libc_valid(trace_t *trace);
static void eval_libc_speed(void *ptr);

/* Routines for evaluating correctnes, space utilization, and speed
   of the student's malloc package in mm.c */
static int eval_mm_valid(trace_t *trace, range_t **ranges);
static double eval_mm_util(trace_t *trace, int *used_p, int *total_p);
static void eval_mm_speed(void *ptr);

/* Various helper routines */
static void printresults(stats_t *stats);
static void usage(void);
static void malloc_error(const trace_t *trace, int opnum, const char *fmt, ...)
  __attribute__((format(printf, 3, 4)));
static void unix_error(const char *fmt, ...)
  __attribute__((format(printf, 1, 2), noreturn));
static void app_error(const char *fmt, ...)
  __attribute__((format(printf, 1, 2), noreturn));

/****************************
 * High-level timing wrappers
 ****************************/

typedef void (*fsecs_test_funct)(void *);

/*
 * fsecs - Return the running time of a function f (in seconds)
 */
static double fsecs(fsecs_test_funct f, void *argp) {
  struct timeval stv, etv;
  double diff;

  gettimeofday(&stv, NULL);
  f(argp);
  gettimeofday(&etv, NULL);
  diff = 1E3 * (etv.tv_sec - stv.tv_sec) + 1E-3 * (etv.tv_usec - stv.tv_usec);
  return (1E-3 * diff);
}

/* Run the tests; return the number of tests run (may be less than
   num_tracefiles, if there's a timeout) */
static void run_tests(char *tracefile, stats_t *mm_stats, range_t *ranges,
                      speed_t *speed_params) {
  /* initialize simulated memory system in memlib.c *
   * start each trace with a clean system */
  mem_init();

  trace_t *trace;
  trace = read_trace(mm_stats, tracefile);
  strcpy(mm_stats->filename, trace->filename);
  mm_stats->ops = trace->num_ops;
  if (verbose > 1)
    printf("Checking mm_malloc for correctness, ");
  mm_stats->valid = eval_mm_valid(trace, &ranges);

  if (mm_stats->valid) {
    if (verbose > 1)
      printf("efficiency, ");
    mm_stats->util = eval_mm_util(trace, &mm_stats->used, &mm_stats->total);
    speed_params->trace = trace;
    speed_params->ranges = ranges;
    if (verbose > 1)
      printf("and performance.\n");
    mm_stats->secs = fsecs(eval_mm_speed, speed_params);
  }

  free_trace(trace);

  /* clean up memory system */
  mem_deinit();
}

/**************
 * Main routine
 **************/
int main(int argc, char **argv) {
  char *tracefile = NULL; /* trace file names */
  range_t *ranges = NULL; /* keeps track of block extents for one trace */
  stats_t libc_stats;     /* libc stats for trace */
  stats_t mm_stats;       /* mm (i.e. student) stats for trace */
  speed_t speed_params;   /* input parameters to the xx_speed routines */
  int run_libc = 0;       /* If set, run libc malloc (set by -l) */

  setbuf(stdout, 0);
  setbuf(stderr, 0);

  /*
   * Read and interpret the command line arguments
   */
  char c;
  while ((c = getopt(argc, argv, "d:f:v:hVlD")) != EOF) {
    switch (c) {
      case 'f': /* Use one specific trace file only (relative to curr dir) */
        tracefile = strdup(optarg);
        break;

      case 'l': /* Run libc malloc */
        run_libc = 1;
        break;

      case 'V': /* Increase verbosity level */
        verbose += 1;
        break;

      case 'v': /* Set verbosity level */
        verbose = atoi(optarg);
        break;

      case 'd':
        debug_mode = atoi(optarg);
        break;

      case 'D':
        debug_mode = DBG_EXPENSIVE;
        break;

      case 'h': /* Print this message */
        usage();
        exit(EXIT_SUCCESS);

      default:
        usage();
        exit(EXIT_FAILURE);
    }
  }

  if (tracefile == NULL) {
    usage();
    exit(EXIT_FAILURE);
  }

  if (debug_mode != DBG_NONE)
    init_random_data();

  if (run_libc) {
    /*
     * Run and evaluate the libc malloc package
     */
    if (verbose > 1)
      printf("\nTesting libc malloc\n");

    /* Evaluate the libc malloc package using the K-best scheme */
    trace_t *trace = read_trace(&libc_stats, tracefile);

    libc_stats.valid = eval_libc_valid(trace);
    if (libc_stats.valid) {
      speed_params.trace = trace;
      libc_stats.secs = fsecs(eval_libc_speed, &speed_params);
    }
    free_trace(trace);

    /* Display the libc results in a compact table */
    if (verbose) {
      printf("\nResults for libc malloc:\n");
      printresults(&libc_stats);
    }

    return libc_stats.valid ? EXIT_SUCCESS : EXIT_FAILURE;
  }

  /*
   * Run and evaluate the student's mm package
   */
  if (verbose > 1)
    printf("\nTesting mm malloc\n");

  /* Allocate the mm stats array, with one stats_t struct per tracefile */
  run_tests(tracefile, &mm_stats, ranges, &speed_params);

  /* Display the mm results */
  if (verbose) {
    printf("\nResults for mm malloc:\n");
    printresults(&mm_stats);
  }

  return mm_stats.valid ? EXIT_SUCCESS : EXIT_FAILURE;
}

/*****************************************************************
 * The following routines manipulate the range list, which keeps
 * track of the extent of every allocated block payload. We use the
 * range list to detect any overlapping allocated blocks.
 ****************************************************************/

/*
 * add_range - As directed by request opnum in trace tracenum,
 *     we've just called the student's mm_malloc to allocate a block of
 *     size bytes at addr lo. After checking the block for correctness,
 *     we create a range struct for this block and add it to the range list.
 */
static int add_range(range_t **ranges, char *lo, int size, const trace_t *trace,
                     int opnum, int index) {
  char *hi = lo + size - 1;

  assert(size > 0);

  /* Payload addresses must be ALIGNMENT-byte aligned */
  if (!IS_ALIGNED(lo)) {
    malloc_error(trace, opnum, "Payload address (%p) not aligned to %d bytes",
                 lo, ALIGNMENT);
    return 0;
  }

  /* The payload must lie within the extent of the heap */
  if ((lo < (char *)mem_heap_lo()) || (lo > (char *)mem_heap_hi()) ||
      (hi < (char *)mem_heap_lo()) || (hi > (char *)mem_heap_hi())) {
    malloc_error(trace, opnum, "Payload (%p:%p) lies outside heap (%p:%p)", lo,
                 hi, mem_heap_lo(), mem_heap_hi());
    return 0;
  }

  /* If we can't afford the linear-time loop, we check less thoroughly and
     just assume the overlap will be caught by writing random bits. */
  if (trace->ignore_ranges || debug_mode == DBG_NONE)
    return 1;

  /* The payload must not overlap any other payloads */
  range_t *p;

  for (p = *ranges; p != NULL; p = p->next) {
    if ((lo >= p->lo && lo <= p->hi) || (hi >= p->lo && hi <= p->hi)) {
      malloc_error(trace, opnum,
                   "Payload (%p:%p) overlaps another payload (%p:%p)\n", lo, hi,
                   p->lo, p->hi);
      return 0;
    }
  }

  /*
   * Everything looks OK, so remember the extent of this block
   * by creating a range struct and adding it the range list.
   */
  if ((p = (range_t *)malloc(sizeof(range_t))) == NULL)
    unix_error("malloc error in add_range");
  p->next = *ranges;
  p->lo = lo;
  p->hi = hi;
  p->index = index;
  *ranges = p;

  return 1;
}

/*
 * remove_range - Free the range record of block whose payload starts at lo
 */
static void remove_range(range_t **ranges, char *lo) {
  range_t **prevpp = ranges;

  for (range_t *p = *ranges; p != NULL; p = p->next) {
    if (p->lo == lo) {
      *prevpp = p->next;
      free(p);
      break;
    }
    prevpp = &(p->next);
  }
}

/*
 * clear_ranges - free all of the range records for a trace
 */
static void clear_ranges(range_t **ranges) {
  range_t *pnext;

  for (range_t *p = *ranges; p != NULL; p = pnext) {
    pnext = p->next;
    free(p);
  }
  *ranges = NULL;
}

/**********************************************
 * The following routines handle the random data used for
 * checking memory access.
 *********************************************/

static void init_random_data(void) {
  if (debug_mode == DBG_NONE)
    return;

  for (int len = 0; len < RANDOM_DATA_LEN; ++len)
    random_data[len] = random();
}

static void randomize_block(trace_t *traces, int index) {
  if (debug_mode == DBG_NONE)
    return;

  traces->block_rand_base[index] = random();

  randint_t *block = (randint_t *)traces->blocks[index];
  size_t size = traces->block_sizes[index] / sizeof(*block);
  int base = traces->block_rand_base[index];

  for (size_t i = 0; i < size; i++)
    block[i] = random_data[(base + i) % RANDOM_DATA_LEN];
}

static void check_index(const trace_t *trace, int opnum, int index) {
  if (index < 0)
    return; /* we're doing free(NULL) */
  if (debug_mode == DBG_NONE)
    return;

  randint_t *block = (randint_t *)trace->blocks[index];
  size_t size = trace->block_sizes[index] / sizeof(*block);
  int base = trace->block_rand_base[index];
  int ngarbled = 0;
  int firstgarbled = -1;

  for (size_t i = 0; i < size; i++) {
    if (block[i] != random_data[(base + i) % RANDOM_DATA_LEN]) {
      if (firstgarbled == -1)
        firstgarbled = i;
      ngarbled++;
    }
  }
  if (ngarbled != 0) {
    malloc_error(trace, opnum,
                 "block %d (%p) has %d garbled %s%s, "
                 "starting at byte %zu",
                 index, block, ngarbled, randint_t_name,
                 ngarbled > 1 ? "s" : "", sizeof(randint_t) * firstgarbled);
  }
}

/**********************************************
 * The following routines manipulate tracefiles
 *********************************************/

/*
 * read_trace - read a trace file and store it in memory
 */
static trace_t *read_trace(stats_t *stats, const char *filename) {
  FILE *tracefile;
  trace_t *trace;

  if (verbose > 1)
    printf("Reading tracefile: %s\n", filename);

  /* Allocate the trace record */
  if (!(trace = (trace_t *)malloc(sizeof(trace_t))))
    unix_error("malloc 1 failed in read_trace");

  /* Read the trace file header */
  strcpy(trace->filename, filename);
  if (!(tracefile = fopen(trace->filename, "r")))
    unix_error("Could not open %s in read_trace", trace->filename);

  int ignore = 0;
  ignore += fscanf(tracefile, "%d", &trace->weight);
  ignore += fscanf(tracefile, "%d", &trace->num_ids);
  ignore += fscanf(tracefile, "%d", &trace->num_ops);
  ignore += fscanf(tracefile, "%d", &trace->ignore_ranges);

  if (trace->weight < 0 || trace->weight > 3)
    app_error("%s: weight can only be in {0, 1, 2, 3}", trace->filename);
  if (trace->ignore_ranges != 0 && trace->ignore_ranges != 1)
    app_error("%s: ignore-ranges can only be zero or one", trace->filename);

  /* We'll store each request line in the trace in this array */
  if (!(trace->ops = (traceop_t *)malloc(trace->num_ops * sizeof(traceop_t))))
    unix_error("malloc 2 failed in read_trace");

  /* We'll keep an array of pointers to the allocated blocks here... */
  if (!(trace->blocks = (char **)calloc(trace->num_ids, sizeof(char *))))
    unix_error("malloc 3 failed in read_trace");

  /* ... along with the corresponding byte sizes of each block */
  if (!(trace->block_sizes = (size_t *)calloc(trace->num_ids, sizeof(size_t))))
    unix_error("malloc 4 failed in read_trace");

  /* and, if we're debugging, the offset into the random data */
  if (!(trace->block_rand_base =
          calloc(trace->num_ids, sizeof(*trace->block_rand_base))))
    unix_error("malloc 5 failed in read_trace");

  /* read every request line in the trace file */
  int index = 0;
  int op_index = 0;
  int max_index = 0;
  char type[MAXLINE];
  int size;

  while (fscanf(tracefile, "%s", type) != EOF) {
    switch (type[0]) {
      case 'a':
        ignore += fscanf(tracefile, "%u %u", &index, &size);
        trace->ops[op_index].type = ALLOC;
        trace->ops[op_index].index = index;
        trace->ops[op_index].size = size;
        max_index = (index > max_index) ? index : max_index;
        break;

      case 'r':
        ignore += fscanf(tracefile, "%u %u", &index, &size);
        trace->ops[op_index].type = REALLOC;
        trace->ops[op_index].index = index;
        trace->ops[op_index].size = size;
        max_index = (index > max_index) ? index : max_index;
        break;

      case 'f':
        ignore += fscanf(tracefile, "%ud", &index);
        trace->ops[op_index].type = FREE;
        trace->ops[op_index].index = index;
        break;

      default:
        app_error("Bogus type character (%c) in tracefile %s\n", type[0],
                  trace->filename);
    }
    op_index++;
    if (op_index == trace->num_ops)
      break;
  }

  fclose(tracefile);
  assert(max_index == trace->num_ids - 1);
  assert(trace->num_ops == op_index);

  /* fill in the stats */
  strcpy(stats->filename, trace->filename);
  stats->weight = trace->weight;
  stats->ops = trace->num_ops;

  return trace;
}

/*
 * reinit_trace - get the trace ready for another run.
 */
static void reinit_trace(trace_t *trace) {
  memset(trace->blocks, 0, trace->num_ids * sizeof(*trace->blocks));
  memset(trace->block_sizes, 0, trace->num_ids * sizeof(*trace->block_sizes));
  /* block_rand_base is unused if size is zero */
}

/*
 * free_trace - Free the trace record and the four arrays it points
 *              to, all of which were allocated in read_trace().
 */
static void free_trace(trace_t *trace) {
  free(trace->ops); /* free the three arrays... */
  free(trace->blocks);
  free(trace->block_sizes);
  free(trace->block_rand_base);
  free(trace); /* and the trace record itself... */
}

/**********************************************************************
 * The following functions evaluate the correctness, space utilization,
 * and throughput of the libc and mm malloc packages.
 **********************************************************************/

/*
 * eval_mm_valid - Check the mm malloc package for correctness
 */
static int eval_mm_valid(trace_t *trace, range_t **ranges) {
  /* Reset the heap and free any records in the range list */
  mem_reset_brk();
  clear_ranges(ranges);
  reinit_trace(trace);

  /* Call the mm package's init function */
  if (mm_init() < 0) {
    malloc_error(trace, 0, "mm_init failed.");
    return 0;
  }

  /* Interpret each operation in the trace in order */
  for (int i = 0; i < trace->num_ops; i++) {
    int index = trace->ops[i].index;
    size_t size = trace->ops[i].size;
    char *newp;
    char *oldp;
    char *p;

    if (debug_mode == DBG_EXPENSIVE) {
      /* Let the students check their own heap */
      mm_checkheap(verbose);

      /* Now check that all our allocated blocks have the right data */
      range_t *r = *ranges;
      while (r) {
        check_index(trace, i, r->index);
        r = r->next;
      }
    }

    switch (trace->ops[i].type) {
      case ALLOC: /* mm_malloc */
        /* Call the student's malloc */
        if ((p = mm_malloc(size)) == NULL) {
          malloc_error(trace, i, "mm_malloc failed.");
          return 0;
        }

        /*
         * Test the range of the new block for correctness and add it
         * to the range list if OK. The block must be  be aligned properly,
         * and must not overlap any currently allocated block.
         */
        if (add_range(ranges, p, size, trace, i, index) == 0)
          return 0;

        /* Remember region */
        trace->blocks[index] = p;
        trace->block_sizes[index] = size;

        /* Set to random data, for debugging. */
        randomize_block(trace, index);
        break;

      case REALLOC: /* mm_realloc */
        check_index(trace, i, index);

        /* Call the student's realloc */
        oldp = trace->blocks[index];
        newp = mm_realloc(oldp, size);
        if ((newp == NULL) && (size != 0)) {
          malloc_error(trace, i, "mm_realloc failed.");
          return 0;
        }
        if ((newp != NULL) && (size == 0)) {
          malloc_error(trace, i, "mm_realloc with size 0 returned non-NULL.");
          return 0;
        }

        /* Remove the old region from the range list */
        remove_range(ranges, oldp);

        /* Check new block for correctness and add it to range list */
        if (size > 0 && add_range(ranges, newp, size, trace, i, index) == 0)
          return 0;

        /* Move the region from where it was.
         * Check up to min(size, oldsize) for correct copying. */
        trace->blocks[index] = newp;
        if (size < trace->block_sizes[index])
          trace->block_sizes[index] = size;
        check_index(trace, i, index);
        trace->block_sizes[index] = size;

        /* Set to random data, for debugging. */
        randomize_block(trace, index);
        break;

      case FREE: /* mm_free */
        check_index(trace, i, index);

        /* Remove region from list and call student's free function */
        if (index == -1) {
          p = 0;
        } else {
          p = trace->blocks[index];
          remove_range(ranges, p);
        }
        mm_free(p);
        break;

      default:
        app_error("Nonexistent request type in eval_mm_valid");
    }
  }

  /* As far as we know, this is a valid malloc package */
  return 1;
}

/*
 * eval_mm_util - Evaluate the space utilization of the student's package
 *   The idea is to remember the high water mark "hwm" of the heap for
 *   an optimal allocator, i.e., no gaps and no internal fragmentation.
 *   Utilization is the ratio hwm/heapsize, where heapsize is the
 *   size of the heap in bytes after running the student's malloc
 *   package on the trace. Note that our implementation of mem_sbrk()
 *   doesn't allow the students to decrement the brk pointer, so brk
 *   is always the high water mark of the heap.
 *
 *   A higher number is better: 1 is optimal.
 */
static double eval_mm_util(trace_t *trace, int *used_p, int *total_p) {
  int max_total_size = 0;
  int total_size = 0;

  reinit_trace(trace);

  /* initialize the heap and the mm malloc package */
  mem_reset_brk();
  if (mm_init() < 0)
    app_error("trace: mm_init failed in eval_mm_util");

  for (int i = 0; i < trace->num_ops; i++) {
    int index, size, newsize, oldsize;
    char *p, *newp, *oldp;

    switch (trace->ops[i].type) {
      case ALLOC: /* mm_alloc */
        index = trace->ops[i].index;
        size = trace->ops[i].size;

        if ((p = mm_malloc(size)) == NULL)
          app_error("trace: mm_malloc failed in eval_mm_util");

        /* Remember region and size */
        trace->blocks[index] = p;
        trace->block_sizes[index] = size;

        total_size += size;
        break;

      case REALLOC: /* mm_realloc */
        index = trace->ops[i].index;
        newsize = trace->ops[i].size;
        oldsize = trace->block_sizes[index];

        oldp = trace->blocks[index];
        if ((newp = mm_realloc(oldp, newsize)) == NULL && newsize != 0)
          app_error("trace: mm_realloc failed in eval_mm_util");

        /* Remember region and size */
        trace->blocks[index] = newp;
        trace->block_sizes[index] = newsize;

        total_size += (newsize - oldsize);
        break;

      case FREE: /* mm_free */
        index = trace->ops[i].index;
        if (index < 0) {
          size = 0;
          p = 0;
        } else {
          size = trace->block_sizes[index];
          p = trace->blocks[index];
        }

        mm_free(p);

        total_size -= size;
        break;

      default:
        app_error("trace: Nonexistent request type in eval_mm_util");
    }

    /* update the high-water mark */
    max_total_size =
      (total_size > max_total_size) ? total_size : max_total_size;
  }

  *used_p = max_total_size;
  *total_p = mem_heapsize();

  return ((double)max_total_size / (double)mem_heapsize());
}

/*
 * eval_mm_speed - This is the function that is used by fcyc()
 *    to measure the running time of the mm malloc package.
 */
static void eval_mm_speed(void *ptr) {
  trace_t *trace = ((speed_t *)ptr)->trace;
  reinit_trace(trace);

  /* Reset the heap and initialize the mm package */
  mem_reset_brk();
  if (mm_init() < 0)
    app_error("mm_init failed in eval_mm_speed");

  /* Interpret each trace request */
  for (int i = 0; i < trace->num_ops; i++) {
    int index, size, newsize;
    char *p, *newp, *oldp, *block;

    switch (trace->ops[i].type) {
      case ALLOC: /* mm_malloc */
        index = trace->ops[i].index;
        size = trace->ops[i].size;
        if ((p = mm_malloc(size)) == NULL)
          app_error("mm_malloc error in eval_mm_speed");
        trace->blocks[index] = p;
        break;

      case REALLOC: /* mm_realloc */
        index = trace->ops[i].index;
        newsize = trace->ops[i].size;
        oldp = trace->blocks[index];
        if ((newp = mm_realloc(oldp, newsize)) == NULL && newsize != 0)
          app_error("mm_realloc error in eval_mm_speed");
        trace->blocks[index] = newp;
        break;

      case FREE: /* mm_free */
        index = trace->ops[i].index;
        if (index < 0) {
          block = 0;
        } else {
          block = trace->blocks[index];
        }
        mm_free(block);
        break;

      default:
        app_error("Nonexistent request type in eval_mm_speed");
    }
  }
}

/*
 * eval_libc_valid - We run this function to make sure that the
 *    libc malloc can run to completion on the set of traces.
 *    We'll be conservative and terminate if any libc malloc call fails.
 *
 */
static int eval_libc_valid(trace_t *trace) {
  reinit_trace(trace);

  for (int i = 0; i < trace->num_ops; i++) {
    char *p, *newp, *oldp;
    int newsize;

    switch (trace->ops[i].type) {
      case ALLOC: /* malloc */
        if ((p = malloc(trace->ops[i].size)) == NULL) {
          malloc_error(trace, i, "libc malloc failed");
          unix_error("System message");
        }
        trace->blocks[trace->ops[i].index] = p;
        break;

      case REALLOC: /* realloc */
        newsize = trace->ops[i].size;
        oldp = trace->blocks[trace->ops[i].index];
        if ((newp = realloc(oldp, newsize)) == NULL && newsize != 0) {
          malloc_error(trace, i, "libc realloc failed");
          unix_error("System message");
        }
        trace->blocks[trace->ops[i].index] = newp;
        break;

      case FREE: /* free */
        if (trace->ops[i].index >= 0) {
          free(trace->blocks[trace->ops[i].index]);
        } else {
          free(0);
        }
        break;

      default:
        app_error("invalid operation type  in eval_libc_valid");
    }
  }

  return 1;
}

/*
 * eval_libc_speed - This is the function that is used by fcyc() to
 *    measure the running time of the libc malloc package on the set
 *    of traces.
 */
static void eval_libc_speed(void *ptr) {
  trace_t *trace = ((speed_t *)ptr)->trace;

  reinit_trace(trace);

  for (int i = 0; i < trace->num_ops; i++) {
    char *p, *newp, *oldp, *block;
    int index, size, newsize;

    switch (trace->ops[i].type) {
      case ALLOC: /* malloc */
        index = trace->ops[i].index;
        size = trace->ops[i].size;
        if ((p = malloc(size)) == NULL)
          unix_error("malloc failed in eval_libc_speed");
        trace->blocks[index] = p;
        break;

      case REALLOC: /* realloc */
        index = trace->ops[i].index;
        newsize = trace->ops[i].size;
        oldp = trace->blocks[index];
        if ((newp = realloc(oldp, newsize)) == NULL && newsize != 0)
          unix_error("realloc failed in eval_libc_speed\n");

        trace->blocks[index] = newp;
        break;

      case FREE: /* free */
        index = trace->ops[i].index;
        if (index >= 0) {
          block = trace->blocks[index];
          free(block);
        } else {
          free(0);
        }
        break;
    }
  }
}

/*************************************
 * Some miscellaneous helper routines
 ************************************/

/*
 * printresults - prints a performance summary for some malloc package
 */
static void printresults(stats_t *stats) {
  /* Print the individual results for each trace */
  printf("  %2s%6s%8s%8s %5s%8s%10s  %s\n", "valid", "util", "used", "total",
         "ops", "secs", "Kops", "trace");
  if (!stats->valid) {
    printf("%2s%4s %6s%8s%10s%7s %s\n", stats->weight != 0 ? "*" : "", "no",
           "-", "-", "-", "-", stats->filename);
    return;
  }

  char wstr;
  switch (stats->weight) {
    case WNONE:
      wstr = ' ';
      break;
    case WALL:
      wstr = '*';
      break;
    case WUTIL:
      wstr = 'u';
      break;
    case WPERF:
      wstr = 'p';
      break;
    default:
      app_error("wrong value for weight found!");
  }

  /* prints done in a somewhat silly way to avoid hassle
   * if future columns need to be added/modified like this time */
  printf("%2c", wstr);
  printf("%4s", "yes");

  /* print '--' if util isn't weighted */
  if (stats->weight == WNONE || stats->weight == WALL || stats->weight == WUTIL)
    printf(" %5.1f%% %8d %8d", stats->util * 100.0, stats->used, stats->total);
  else
    printf(" %6s %8s %8s", "--", "--", "--");

  /* print '--' if perf isn't weighted */
  if (stats->weight == WNONE || stats->weight == WALL || stats->weight == WPERF)
    printf("%8.0f%10.6f%7.0f", stats->ops, stats->secs,
           (stats->ops / 1e3) / stats->secs);
  else
    printf("%8s%10s%7s", "--", "--", "--");

  printf(" %s\n", stats->filename);
}

/*
 * app_error - Report an arbitrary application error
 */
static void app_error(const char *fmt, ...) {
  va_list ap;
  va_start(ap, fmt);
  vprintf(fmt, ap);
  va_end(ap);
  exit(EXIT_FAILURE);
}

/*
 * unix_error - Report the error and its errno.
 */
static void unix_error(const char *fmt, ...) {
  va_list ap;
  va_start(ap, fmt);
  vprintf(fmt, ap);
  printf(": %s\n", strerror(errno));
  va_end(ap);
  exit(EXIT_FAILURE);
}

/*
 * malloc_error - Report an error returned by the mm_malloc package
 */
static void malloc_error(const trace_t *trace, int opnum, const char *fmt,
                         ...) {
  va_list ap;
  va_start(ap, fmt);
  printf("ERROR [trace %s, line %d]: ", trace->filename, LINENUM(opnum));
  vprintf(fmt, ap);
  putchar('\n');
  va_end(ap);
}

/*
 * usage - Explain the command line arguments
 */
static void usage(void) {
  fprintf(stderr, "Usage: mdriver [-hlVD] [-d <i>] [-v <i>] [-f <file>]\n");
  fprintf(stderr, "Options\n");
  fprintf(stderr, "\t-d <i>     Debug: 0 off; 1 default; 2 lots.\n");
  fprintf(stderr, "\t-D         Equivalent to -d2.\n");
  fprintf(stderr, "\t-h         Print this message.\n");
  fprintf(stderr, "\t-l         Run libc malloc instead mm.\n");
  fprintf(stderr, "\t-V         Print diagnostics as each trace is run.\n");
  fprintf(stderr, "\t-v <i>     Set Verbosity Level to <i>\n");
  fprintf(stderr, "\t-f <file>  Use <file> as the trace file.\n");
}
