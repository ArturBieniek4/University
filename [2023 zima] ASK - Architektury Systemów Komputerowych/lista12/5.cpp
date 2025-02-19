//kompilator - 17 instrukcji
long neigh(long a[], long n, long i, long j) {
    i--;
    long r8 = j-1;
    j++;
    i*=n;
    n+=n;
    n+=i;
    long r9=i+r8;
    i+=j;
    long rax = a[i];
    i=n;
    n-=j;
    rax+=a[r9];
    i-=r8;
    rax+=a[i];
    rax+=a[n];
    return rax;
}

// ja - 15 instrukcji
long neigh(long a[], long n, long i, long j) {
    long temp1 = (i-1)*n;
    long temp2 = (j-1);
    long temp3 = (j+1);
    long ul = a[temp1 + temp2];
    long ur = a[temp1 + temp3];
    long dl = a[temp1 - temp2];
    long dr = a[temp1 - temp3];
    return ul + ur + dl + dr;
}