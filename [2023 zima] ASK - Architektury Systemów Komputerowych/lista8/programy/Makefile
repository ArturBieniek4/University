CC = gcc
LD = ld
LDFLAGS = -static
CFLAGS = -fno-pie -fno-asynchronous-unwind-tables -Og -Wall -Wno-main
STRIP = strip -g

FILES = swap.o mismatch str main relo3.o

all: $(FILES) merge-1.map merge-2.map

%.o: %.c
	$(CC) $(CFLAGS) $(CFLAGS.$*) -c -o $@ $^
	$(STRIP) $@

%.s: %.c
	$(CC) $(CFLAGS) $(CFLAGS.$*) -S -o $@ $^

merge-1.map: foo.o bar.o
	$(LD) -M=$@ -r -o merge-1.o $^

merge-2.map: bar.o foo.o 
	$(LD) -M=$@ -r -o merge-2.o $^

# Niech asembler nie próbuje usuwać symboli .LCx
CFLAGS.swap := -Wa,--keep-locals -fpie

# W nowszych dystrybucjach -fno-common jest domyślnie włączony
CFLAGS.mismatch-a := -fcommon
CFLAGS.mismatch-b := -fcommon

# Chcemy wyłącznie relokacji absolutnych: R_X86_64_32*, R_X86_64_64*
CFLAGS.relo3 := -fno-pic

mismatch: mismatch-a.o mismatch-b.o
	$(CC) -static $(LDFLAGS) -o $@ $^

main: even.o odd.o start.o 
	$(LD) $(LDFLAGS) -Tmain.lds -M=$@.map -o $@ $^
	$(STRIP) -s $@

str: str-a.o str-b.o
	$(CC) $(LDFLAGS) -o $@ $^

clean:
	rm -f *.o *.s *.map *~
	rm -f $(FILES)

# vim: ts=8 sw=8 noet
