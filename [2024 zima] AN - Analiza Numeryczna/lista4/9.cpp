#include <bits/stdc++.h>
using namespace std;

// f1(x) = (x-5)^3 * (x-4)
double f1(double x) {
  return pow(x - 5, 3) * (x - 4);
}

// f1'(x) = 3 * (x-5)^2 * (x-4) + (x-5)^3
double f1_pochodna(double x) {
  return pow(x - 5, 3) + 3 * pow(x - 5, 2) * (x - 4);
}

// f2(x) = sin(x) * (x-100)^4
double f2(double x) {
  return sin(x) * pow(x - 100, 4);
}

// f2'(x) = cos(x) * (x-100)^4 + 4 * sin(x) * (x - 100)^3
double f2_pochodna(double x) {
  return cos(x) * pow(x - 100, 4) + 4 * sin(x) * pow(x - 100, 3);
}

double pierwiastek(function<double(double)> f, function<double(double)> f_pochodna, double r, double x, int n) {
  double x_prev;
  double e = 1e-15;
  double f_x, f_poch;

  for (int i = 0; i < n; i++) {
    f_x = f(x);
    f_poch = f_pochodna(x);

    if (abs(f_poch) < e) return x;

    x_prev = x;
    x = x - r * f_x / f_poch;
  }
  return x;
}

int main() {
  cout << "Expected result: 5\n";
  double r = 3, x, n = 10;
  cout << setprecision(20) << fixed;

  x = 220;
  for (int i = 1; i <= n; i++) cout << pierwiastek(f1, f1_pochodna, r, x, i) << endl;
  cout << endl;

  x = 50000000;
  for (int i = 1; i <= 15; i++) cout << pierwiastek(f1, f1_pochodna, r, x, i) << endl;
  cout << endl;

  x = 7;
  for (int i = 1; i <= n; i++) cout << pierwiastek(f1, f1_pochodna, r, x, i) << endl;

  cout << "\nExpected result: 100\n";
  r = 4;
  x = 140;
  for (int i = 1; i <= n; i++) cout << pierwiastek(f2, f2_pochodna, r, x, i) << endl;
  cout << endl;

  x = 93;
  for (int i = 1; i <= n; i++) cout << pierwiastek(f2, f2_pochodna, r, x, i) << endl;
  cout << endl;

  x = 107;
  for (int i = 1; i <= n; i++) cout << pierwiastek(f2, f2_pochodna, r, x, i) << endl;

  return 0;
}








// działa dla x0 większych od pierwiastka
// (nie zawsze, dla f1 tak, dla f2 jedynie dla bliskich wynikowi)
// dla mniejszych różnie (np dla 4 cały czas 4; dla 0.002 ujemne i dodatnie)