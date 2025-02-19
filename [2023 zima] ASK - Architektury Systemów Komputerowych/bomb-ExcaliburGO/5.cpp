#include <bits/stdc++.h>

using namespace std;

bool phase_5(int32_t var_10, int32_t i_1)
{
    int32_t i = (i_1 & 0xf); // pierwsza cyfra 0-15 tylko ma znaczenie
    i_1 = i;
    if (i != 0xf) // 15 nie może być
    {
        int32_t rcx_1 = 0;
        int32_t rdx_1 = 0;
        do
        {
            rdx_1 = (rdx_1 + 1);
            i = *(&array.0 + (i << 2));
            rcx_1 = (rcx_1 + i);
        } while (i != 0xf);
        i_1 = 0xf;
        if ((rdx_1 == 0xf && var_10 == rcx_1))
        {
            return true;
        }
    }
    return false;
    /* no return */
}

int main()
{
    cout<<phase_5(5,7);
    return 0;
}