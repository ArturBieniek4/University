PROGS = shell trace.so
EXTRA-CLEAN = sh-tests.*.log

include Makefile.include

CC += -fsanitize=address
CPPFLAGS += -DSTUDENT
LDLIBS += -lreadline

shell: shell.o command.o lexer.o jobs.o

test:
	for i in `seq 1 10`; do python3 sh-tests.py -v || exit 1; done

trace.so: trace.c

# vim: ts=8 sw=8 noet
