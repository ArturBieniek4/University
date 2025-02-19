/*
 * Matrix multiplication with and without blocking.
 *
 * Intel® Core™ i5-6600 CPU @ 3.30GHz
 *
 * $ ./matmult -n 1024 -v 0
 * Time elapsed: 3.052755 seconds.
 * $ ./matmult -n 1024 -v 1
 * Time elapsed: 0.746337 seconds.
 * $ ./matmult -n 1024 -v 2
 * Time elapsed: 9.882309 seconds.
 * $ ./matmult -n 1024 -v 3
 * Time elapsed: 0.698795 seconds.
 */
#include "matmult.h"

/* Useful macro for accessing row-major 2D arrays of size n×n. */
#define M(a, i, j) a[(i) * n + (j)]

/* ijk (& jik) */
void matmult0(int n, T_p a, T_p b, T_p c) {
  for (int i = 0; i < n; i++)
    for (int j = 0; j < n; j++)
      for (int k = 0; k < n; k++)
        c[i*n + j] += a[i*n + k] * b[k*n + j];
}

/* kij (& ikj) */
void matmult1(int n, T_p a, T_p b, T_p c) {
  for (int k = 0; k < n; k++)
    for (int i = 0; i < n; i++)
      for (int j = 0; j < n; j++)
        c[i*n + j] += a[i*n + k] * b[k*n + j];
}

/* jki (& kji) */
void matmult2(int n, T_p a, T_p b, T_p c) {
  for (int j = 0; j < n; j++)
    for (int k = 0; k < n; k++)
      for (int i = 0; i < n; i++)
        c[i*n + j] += a[i*n + k] * b[k*n + j];
}

/* BLOCK*BLOCK tiled version */
void matmult3(int n, T_p a, T_p b, T_p c) {
  const int B = BLOCK;
  for (int i = 0; i < n; i+=B)
    for (int j = 0; j < n; j+=B)
      for (int k = 0; k < n; k+=B)
      /* B x B mini matrix multiplications */
      for (int i1 = i; i1 < i+B; i1++)
        for (int j1 = j; j1 < j+B; j1++)
          for (int k1 = k; k1 < k+B; k1++)
            c[i1*n+j1] += a[i1*n + k1]*b[k1*n + j1];
}
