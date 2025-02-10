#!/bin/bash

# file is a bash variable set to the first parameter
file=$1

# now start gnuplot and pass variables and commands to it in a "heredoc"
gnuplot <<EOF
set terminal png size 1200,800
set output "$file"
set title "Rozkład liczb w [A, B]"
set xlabel "wartość"
set grid
plot '3.txt' using 1:(0) with points
EOF
