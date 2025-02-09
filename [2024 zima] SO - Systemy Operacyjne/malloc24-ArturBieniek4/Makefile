CC = gcc -g
CFLAGS = -O3 -Wall -Werror -DDRIVER

OBJS = mdriver.o mm.o memlib.o

all: mdriver

mdriver: $(OBJS)
	$(CC) $(CFLAGS) -o mdriver $(OBJS)

mdriver.o: mdriver.c memlib.h mm.h
memlib.o: memlib.c memlib.h
mm.o: mm.c mm.h memlib.h

grade: mdriver
	./grade.py

format:
	clang-format --style=file -i *.c *.h

clean:
	rm -f *~ *.o mdriver

.PHONY: all format grade clean
