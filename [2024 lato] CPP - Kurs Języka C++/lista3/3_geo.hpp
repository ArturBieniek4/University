#ifndef LIB_GEO
    #define LIB_GEO

class Wektor
{
    public:
        double getX() const;
        double getY() const;
        Wektor(double X, double Y);
    private:
        double X, Y;
};

class Prosta
{
    public:
        double getA() const;
        double getB() const;
        double getC() const;
        Prosta(double A, double B, double C);
        Prosta(const Prosta &p);
    private:
        double A, B, C;
};

class Punkt
{
    public:
        double getX() const;
        double getY() const;
        void translate(const Wektor& w);
        void rotate(const Punkt& p, const double deg);
        void sym_srodkowa(const Punkt& p);
        void sym_osiowa(const Prosta& p);
        Punkt(double x, double y);
        Punkt(const Punkt &p);
    private:
        double x, y;
};

class Odcinek
{
    public:
        double getLength() const;
        Punkt getA() const;
        Punkt getB() const;
        void translate(const Wektor& w);
        void rotate(const Punkt& p, const double deg);
        bool isPointInside(const Punkt& p);
        void sym_srodkowa(const Punkt& p);
        void sym_osiowa(const Prosta& p);
        Odcinek(const Punkt& a, const Punkt& b);
        Odcinek(const Odcinek &p);
    private:
        Punkt a, b;
};
bool rownolegle(const Odcinek&a, const Odcinek&b);
bool prostopadle(const Odcinek&a, const Odcinek&b);

class Trojkat
{
    public:
        double getObwod() const;
        double getArea() const;
        bool isPointInside(const Punkt&p) const;
        bool intersects(const Trojkat&t2) const;
        void translate(const Wektor& w);
        void rotate(const Punkt& p, const double deg);
        void sym_srodkowa(const Punkt& p);
        void sym_osiowa(const Prosta& p);
        Punkt getA() const;
        Punkt getB() const;
        Punkt getC() const;
        Trojkat(const Punkt& a, const Punkt& b, const Punkt& c);
        Trojkat(const Trojkat &p);
    private:
        Punkt a, b, c;
};
#endif