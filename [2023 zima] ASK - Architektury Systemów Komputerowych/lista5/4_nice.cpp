#include<bits/stdc++.h>

long puzzle2(char *s, char *d)
{
    char *ch_s = s;
    //L3
    do
    {
        char znak_s=*ch_s;
        char *nextch_s=ch_s+1;//wskaźnik na next
        char *ch_d=d;
        //L2
        char znak;
        do
        {
            znak=*ch_d;
            ch_d++;
            if(znak==0)//znak =0 czyli koniec stringa d
            {
                return ch_s-s;//L4, zwracamy długość s
            }
        }
        while(znak!=znak_s);
        //
        ch_s=nextch_s;
    }
    while (true);
}