#include <bits/stdc++.h>

using namespace std;

const std::vector<pair<int, std::string>> roman = {
    {1000, "M"},
    {900, "CM"}, {500, "D"}, {400, "CD"}, {100, "C"},
    {90, "XC"}, {50, "L"}, {40, "XL"}, {10, "X"},
    {9, "IX"}, {5, "V"}, {4, "IV"}, {1, "I"}
};

string toroman(int x)
{
    string res;
    for(int i=0;i<roman.size();i++)
    {
        int val=roman[i].first;
        while(val<=x)
        {
            string ch = roman[i].second;
            x-=val;
            res+=ch;
        }
    }
    return res;
}

int main(int argc, const char* argv[])
{
    for(int i=1; i<argc; i++)
    {
        int liczba;
        try
        {
            liczba = stoi(argv[i]);
            if(liczba<0 or liczba>3999)
            {
                throw invalid_argument("Liczba musi być w przedziale od 0 do 3999");
                continue;
            }
        }
        catch(invalid_argument)
        {
            clog<<"Błędny argument nr "<<i<<"\n";
            continue;
        }
        cout<<toroman(liczba)<<"\n";
    }
    return 0;
}