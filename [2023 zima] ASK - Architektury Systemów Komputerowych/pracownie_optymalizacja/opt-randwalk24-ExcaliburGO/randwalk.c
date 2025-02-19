/*
 * Random walk optimized to make branch predictor less miserable.
 *
 * Intel® Core™ i5-6600 CPU @ 3.30GHz
 *
 * $ ./randwalk -S 0xea3495cc76b34acc -n 7 -s 16 -t 14 -v 0
 * Time elapsed: 6.635666 seconds.
 * $ ./randwalk -S 0xea3495cc76b34acc -n 7 -s 16 -t 14 -v 1
 * Time elapsed: 3.260372 seconds.
 */

#include "randwalk.h"

int randwalk0(uint8_t *arr, int n, int len) {
  int sum = 0;
  int i, j, k = 0;
  uint64_t dir = 0;

  /* Start in the center of 2D array */
  i = n / 2, j = n / 2;

  do {
    k -= 2;
    if (k < 0) {
      k = 62;
      dir = fast_random();
    }

    int d = (dir >> k) & 3;

    sum += arr[i * n + j];

    /* 
     * We must avoid unpredictable branches in tight loops!
     *
     * GCC is not smart enough to translate following code using SETcc/CMOVcc
     * instructions. If that's not done, then branch predictor will suffer. 
     */
    if (d == 0) {
      if (i > 0)
        i--;
    } else if (d == 1) {
      if (i < n - 1)
        i++;
    } else if (d == 2) {
      if (j > 0)
        j--;
    } else {
      if (j < n - 1)
        j++;
    }
  } while (--len);

  return sum;
}

int randwalk1(uint8_t *arr, int n, int len) {
  int sum = 0;
  int i, j, k = 0;
  uint64_t dir = 0;

  /* Start in the center of 2D array */
  i = n / 2, j = n / 2;

  do {
    k -= 2;
    if (k < 0) {
      k = 62;
      dir = fast_random();
    }

    int d = (dir >> k) & 3;
    sum += arr[i * n + j];
    
    bool iminus = (d==0) & (i>0);
    i -= iminus;
    bool iplus = (d==1) & (i<n-1);
    i += iplus;
    bool jminus = (d==2) & (j>0);
    j -= jminus;
    bool jplus = (d>2) && (j<n-1);
    j += jplus;
  } while (--len);

  return sum;
}
