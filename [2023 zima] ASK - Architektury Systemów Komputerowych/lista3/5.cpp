#include <bits/stdc++.h>

using namespace std;

int main()
{
    // int32_t x=1;
    // int32_t y=0;
    // int32_t z=0;
    // double dx=x;
    // double dy=y;
    // double dz=z;
    
    // (float)x==(float)dx zawsze TRUE, bo double reprezentuje int32 dokładnie, oba będą zrzutowane na float z utratą precyzji ale będą takie same
    // w cpp niezależnie jak się zrzutuje, zawsze zachodzi konwersja, jedynym rozwiązaniem bez konwersji jest memcpy
    // 2. tak samo
    // 3. tak samo
    // 4. TRUE, liczby do 2^53 są reprezentowane dokładnie, rezultat mnożenia będzie jakoś zaokrąglony ale wszystko działa i nie ma overflow
    //5. 0/0=NaN, 1/1=0
    int32_t x=0;
    int32_t z=1;
    double dx=x;
    double dz=z;
    double dxdx=dx/dx;
    double dzdz=dz/dz;
    cout<<dxdx<<" "<<dzdz<<" "<<(dxdx==dzdz)<<"\n";
    return 0;
}
