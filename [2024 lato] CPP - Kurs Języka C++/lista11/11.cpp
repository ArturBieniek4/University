#include <bits/stdc++.h>
#include "11_cezar.hpp"

using namespace std;

int main(int argc, char* argv[])
{
    if(argc==4)
    {
        string infile = argv[1];
        string outfile = argv[2];
        int key = stoi(argv[3]);
        int inkey = 0;
        int outkey = 0;
        if(key<0) inkey = -key;
        if(key>0) outkey = key;
        Wejscie in = Wejscie(infile, inkey);
        Wyjscie out = Wyjscie(outfile, outkey);
        while(!in.eof()) out.pisz(in.czytaj());
    }
    else
    {
        cerr<<"[PLIK WEJSCIE] [PLIK WYJSCIE] [KLUCZ]\n";
    }
    return 0;
}