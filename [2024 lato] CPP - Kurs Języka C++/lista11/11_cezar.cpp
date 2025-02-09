#include "11_cezar.hpp"
#include <bits/stdc++.h>

using namespace std;

Wyjscie::Wyjscie(string filename, int key)
{
    this->key = key%26;
    file = ofstream(filename, ofstream::out);
    if (!file.is_open()) {
        throw std::ios_base::failure("Błąd otwarcia pliku");
    }
    file.exceptions(std::ofstream::badbit | std::ofstream::failbit);
}

Wyjscie::~Wyjscie()
{
    file.close();
}

Wejscie::Wejscie(string filename, int key)
{
    this->key = key%26;
    file = ifstream(filename, ifstream::in);
    if (!file.is_open()) {
        throw std::ios_base::failure("Błąd otwarcia pliku");
    }
    file.exceptions(std::ifstream::badbit);
}

Wejscie::~Wejscie()
{
    file.close();
}

void Wyjscie::pisz(string line)
{
    for(int i=0;i<line.length();+i++)
    {
        line[i]=line[i]+key;
    }
    file<<line<<"\n";
}

string Wejscie::czytaj()
{
    string line;
        getline(file, line);
        for(int i=0;i<line.length();+i++)
        {
            line[i]=line[i]-key;
        }
    return line;
}

bool Wejscie::eof()
{
    return file.eof();
}