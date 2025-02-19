/*
 * Binary search with linearly placed tree levels.
 *
 * Intel® Core™ i5-6600 CPU @ 3.30GHz
 *
 * $ ./binsearch -S 0x5bab3de5da7882ff -n 23 -t 24 -v 0
 * Time elapsed: 7.616777 seconds.
 * $ ./binsearch -S 0x5bab3de5da7882ff -n 23 -t 24 -v 1
 * Time elapsed: 2.884369 seconds.
 */
#include "binsearch.h"

bool binsearch0(T *arr, long size, T x) {
  do {
    size >>= 1;
    T y = arr[size];
    if (y == x)
      return true;
    if (y < x)
      arr += size + 1;
  } while (size > 0);
  return false;
}

void linearize(T *dst, T *src, long size) {
  long tsize = size+1;
  long verts = 1;
  long tabpos = 0;
  long offset = size/2;
  while(tabpos<size)
  {
    for(long i=0; i<verts; i++, tabpos++)
    {
      dst[tabpos] = src[offset + tsize*i];
    }
    verts*=2;
    tsize/=2;
    offset/=2;
  }
}

bool binsearch1(T *arr, long size, T x) {
  for(long i=0; i<size; i=i*2+1+(arr[i]<x))
  {
    if(arr[i]==x) return true;
  }
  return false;
}
