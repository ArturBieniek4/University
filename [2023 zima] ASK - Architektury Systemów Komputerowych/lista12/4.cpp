void compute2(long *a, long *b, long k) {
    long n = 1 << k;
    for (long i = 0; i < n; i++)
        a[i * n] = a[i] = 0;
        //pierwszy wiersz i pierwsza kolumna wypełniane zerami
    for (long i = 1; i < n; i++)
        for (long j = 1; j < n; j++)
            a[j * n + i] = i * j;
            // pozostała część tablicy wypełniana iloczynami indeksów
    // tu można zrobić teoretycznie merge tych dwóch pętli, ale jest to nieopłacalne
    // zmienna indukcyjna j*n oraz i*j
    // zamiana tych pętli przyniesie korzyść dla cache
    for (long i = 1; i < n; i++)
        for (long j = 1; j < n; j++)
            b[i * n + j] = a[i * n + j] + a[(i - 1) * n + (j - 1)];
            // daje wszędzie sumę poprzednich z całej przekątnej
            // ty chyba warto zrobić rematerializację
}