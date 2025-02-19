// Zmienne i, k spełniają warunek 0 ≤ i, k ≤ 31. Napisz ciąg instrukcji w języku C, który skopiuje
// i-ty bit zmiennej x na pozycję k-tą. Najpierw pokaż rozwiązanie pośrednie używające instrukcji warunkowej.
// Uwaga! Musisz rozpatrzyć trzy przypadki: i < k, i > k oraz i = k.
#include <stdint.h>

uint32_t skopiuj(uint32_t x, uint32_t i, uint32_t k)
{
    uint32_t bit = x&(1<<i); // weź i-ty bit
    x=x&(~(1<<k)); // zgaś k-ty bit x
    if(i==k)
    {
        // nie rób nic
        // ten case jest useless, bo jak się ten bit przesunie o 0 to nic się nie stanie
    }
    else if(i<k)
    {
        bit=bit<<(k-i); // przesuń go na pozycję k
    }
    else
    {
        bit=bit>>(i-k); // przesuń go na pozycję k
        
    }
    x=x|bit; //skopiuj bit
}

uint32_t skopiuj2(uint32_t x, uint32_t i, uint32_t k)
{
    uint32_t bit = x>>i&1; // weź i-ty bit przesunięty na początek (0 lub 1)
    bit=bit<<k; // przesuń go na pozycję k
    x=x&(~(1<<k)); // zgaś k-ty bit x
    x=x|bit; // skopiuj bit
}