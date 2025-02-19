CC = gcc -g -no-pie
CFLAGS = -Og -Wall
LDFLAGS = 
ASFLAGS = -g

# Configurable parameters
PROCEDURE ?= addsb.s:addsb
ILIMIT ?= 48
MAXSIZE ?= 256
BADINSNS ?= 'cmov*,set*,j*,call*'
MAXCPI ?= 16

MAXINSNS = $(ILIMIT)

CHECK = ./check-solution --procedure $(PROCEDURE) \
	                 --max-size $(MAXSIZE) --bad-insns $(BADINSNS) $(EXTRA)
RUN = ./run-solution --procedure $(PROCEDURE) \
                     --max-insns $(MAXINSNS) $(EXTRA) -- ./main

all: test-random

check: main
	$(CHECK)

main: main.o addsb.o
	$(CC) $(LDFLAGS) -o $@ $^

test-1: check
	$(RUN) 0x207F01807F7F7F7F 0x01FFFFFFFCFDFEFF

test-2: check
	$(RUN) 0x1EE71C55807F807F 0x628262627F807F80

test-3: check
	$(RUN) 0xDEADC0DE00000000 0xBEEF133712345678

test-4: check
	$(RUN) 0x80808080F00DCAFE 0x1234567890909090

test-random: MAXINSNS=$(shell echo $$(($(ILIMIT)*1000))) 
test-random: check
	$(RUN) -r 1000

test-all: test-1 test-2 test-3 test-4 test-random

test-bonus: CHECK += --max-cpi $(MAXCPI)
test-bonus: check

clean:
	rm -f main *.o *.out *~

.PHONY: check clean test-1 test-2 test-3 test-4 test-random test-all

# vim: ts=8 sw=8 noet
