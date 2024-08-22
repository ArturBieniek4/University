#ifndef CEZAR_HPP
#define CEZAR_HPP

#include <bits/stdc++.h>

using namespace std;

class Wyjscie
{
    ofstream file;
    int key;
    public:
        Wyjscie(string filename, int key = 0);
        ~Wyjscie();
        void pisz(string line);
};

class Wejscie
{
    ifstream file;
    int key;
    public:
        Wejscie(string filename, int key = 0);
        ~Wejscie();
        bool eof();
        string czytaj();
};
#endif