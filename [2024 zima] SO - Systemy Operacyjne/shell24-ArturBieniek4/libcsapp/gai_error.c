#include "csapp.h"
#include <stdarg.h>

noreturn void gai_error(int code, const char *fmt, ...) {
  va_list ap;
  va_start(ap, fmt);
  vfprintf(stderr, fmt, ap);
  fprintf(stderr, ": %s\n", gai_strerror(code));
  va_end(ap);
  exit(EXIT_FAILURE);
}
