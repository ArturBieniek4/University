#include <stdio.h>

char *somestr(void);

int main(void) {
  char *s = somestr();
  s[5] = '\0';
  puts(s);
  return 0;
}
