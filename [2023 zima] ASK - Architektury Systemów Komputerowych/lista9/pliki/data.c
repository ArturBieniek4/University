short foo = 314;

extern int weird(float);

static const char abc[] = "abc";

struct {
  int (*c)(float);
  int b;
  const char *a;
  short *d; 
  char e[];
} some = {
  .c = weird,
  .a = abc,
  .b = -3,
  .d = &foo,
  .e = "efghi",
};

struct {
  float re;
  float im;
} bar;

long array[100];
