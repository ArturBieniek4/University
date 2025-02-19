CC = gcc -g -no-pie
CFLAGS = -Og -Wall
LDFLAGS = 
ASFLAGS = -g

# Configurable parameters
PROCEDURE ?= mod17.s:mod17
ILIMIT ?= 50
MAXSIZE ?= 256
BADINSNS ?= '*mul*,*div*,*madd*,*msub*,*rem*,*call*'
MAXCPI ?= 18

MAXINSNS = $(ILIMIT)

CHECK = ./check-solution --procedure $(PROCEDURE) \
	                 --max-size $(MAXSIZE) --bad-insns $(BADINSNS) $(EXTRA)
RUN = ./run-solution --procedure $(PROCEDURE) \
                     --max-insns $(MAXINSNS) $(EXTRA) -- ./main

all: test-random

check: main
	$(CHECK)

main: main.o mod17.o
	$(CC) $(LDFLAGS) -o $@ $^

test-1: check
	$(RUN) 0xF0F0F0F0F0F0F0F0

test-2: check
	$(RUN) 0x0F0F0F0F0F0F0F0F

test-3: check
	$(RUN) 0x17979cfe372d6652

test-4: check
	$(RUN) 0x0

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
