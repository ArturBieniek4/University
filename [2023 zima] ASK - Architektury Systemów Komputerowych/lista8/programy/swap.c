extern int printf(const char *, ...);
extern long buf[];

long *bufp0 = &buf[0];
static double sum = 0.0;

static void incr() {
  static int count = 0;
  count++;
  sum += 3.14;
  printf("sum = %f\n", sum);
}

void swap(int i) {
  incr();
  long temp = *bufp0;
  *bufp0 = buf[i];
  buf[i] = temp;
}
