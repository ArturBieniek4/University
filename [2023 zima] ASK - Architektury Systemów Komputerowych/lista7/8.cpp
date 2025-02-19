struct Base {
    Base(int n) : data(n) {}
    int data;
    virtual int doit(int n) { return n - data; }
};

struct Derived : Base {
    Derived(int n) : Base(n + 1) {}
    int doit(int n) { return n * data; }
};

int doit(Base *bp) {
    return bp->doit(1);
}

int main(int argc, char *argv[]) {
    Base b = Base(10);
    Derived d = Derived(20);
    return doit(&b) + doit(&d);
}