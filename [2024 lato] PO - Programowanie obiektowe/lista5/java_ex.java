import java.util.Arrays;

class Figura implements Comparable<Figura>
{
  public int compareTo(Figura arg)
  {
    if (arg instanceof Punkt || arg instanceof Kwadrat)
        return 1;
    return 0;
  }
}

class Punkt extends Figura
{
  public int compareTo(Figura arg)
  {
    if (arg instanceof Kwadrat)
        return 1;
    if (arg instanceof Figura)
        return -1;
    return 0;
  }
}


class Kwadrat extends Figura
{
  public int compareTo(Figura arg)
  {
    if (!(arg instanceof Kwadrat))
        return -1;
    return 0;
  }
}

public class java_ex
{
  public static void main(String[] args)
  {
    Figura[] obrazek = new Figura[5];
    obrazek[0] = new Punkt();
    obrazek[1] = new Kwadrat();
    obrazek[2] = new Figura();
    obrazek[3] = new Kwadrat();
    obrazek[4] = new Punkt();

    Figura f1 = new Kwadrat();
    Figura f2 = new Punkt();
    
    System.out.println("");

    System.out.println("Nieposortowane");
    for (Figura f: obrazek)
      System.out.println(f);

    System.out.println("\nPosortowane");
    
    Arrays.sort(obrazek);
    
    for (Figura f: obrazek)
      System.out.println(f);
  }
}
