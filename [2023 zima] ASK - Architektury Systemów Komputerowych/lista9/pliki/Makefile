LD = ld
LDFLAGS = -static
CC = gcc -ggdb
CFLAGS = -Og -Wall
STRIP = strip

FILES = data.s even.s odd.s start.s start lazy ropex ropex.in

all: $(FILES)

%.o: %.c
	$(CC) $(CFLAGS) $(CFLAGS.$*) -c -o $@ $^

%.s: %.c
	$(CC) $(CFLAGS) $(CFLAGS.$*) -S -o $@ $^

CFLAGS.data := -g0 -fno-common
CFLAGS.even := -g0 -Os
CFLAGS.odd := -g0 -Os
CFLAGS.start := -g0 -Os

start: even.o odd.o start.o 
	$(LD) $(LDFLAGS) -T$@.lds -M=$@.map -o $@ $^
	$(STRIP) -s $@

ropex: CC += -static
ropex: CFLAGS += -fno-pie -fno-stack-protector -fno-asynchronous-unwind-tables 
ropex: ropex.o ropex.o gadget.o
	$(CC) $(CFLAGS) -Wl,-Map=$@.map -o $@ $^

ropex.in: ropex.in.txt
	# requires `xxd` package to be installed
	xxd -r $^ >$@

lazy: lazy.c
	gcc -Os -Wall -ggdb -o $@ $^

clean:
	rm -f *.o *.map *~
	rm -f $(FILES)

# vim: ts=8 sw=8 noet
