#ifndef LICZBA_HPP
#define LICZBA_HPP
class Liczba
{
    const static int MAX_HISTORY = 3;
    double *stack;
    int top;
    int maxtop;
    public:
        Liczba(double val);
        Liczba();
        Liczba(const Liczba& l);
        Liczba(Liczba&& l);
        ~Liczba();
        const Liczba& operator=(const Liczba& l);
        const Liczba& operator=(Liczba&& l);
        double getValue();
        void nextValue(double val);
        void prevValue();
};
#endif