void merge1(long src1[], long src2[], long dest[], long n) {
    long i1 = 0, i2 = 0;
    while (i1 < n && i2 < n)
    {
        long t = src1[i1];
        long e = src2[i2];
        bool p = src1[i1] < src2[i2];
        bool not_p = !p;
        i1+=p;
        i2+=not_p;
        *dest++ = p * t | not_p * e;
    }
}