// Artur Bieniek
// 347165
// javac zad1.java && java zad1 && rm *.class
import java.util.Arrays;

class OrderedList<T extends Comparable<T>> {
    static class Node<T extends Comparable<T>>
    {
        T val;
        Node<T> next;
    }
    private Node<T> head;
    public OrderedList()
    {
        this.head=null;
    }
    public void add_element(T newVal)
    {
        Node<T> newNode = new Node<T>();
        newNode.val=newVal;
        newNode.next=null;
        Node<T> prev=null;
        Node<T> act_elem = this.head;
        if(act_elem==null || newVal.compareTo(act_elem.val)<0)
        {
            newNode.next=this.head;
            this.head=newNode;
            // System.out.println("added element on head");
            return;
        }
        while(act_elem!=null && newVal.compareTo(act_elem.val)>=0)
        {
            // System.out.println("skipping element");
            prev=act_elem;
            act_elem=act_elem.next;
        }
        // System.out.println("added element");
        prev.next=newNode;
        newNode.next=act_elem;
    }
    public T get_first()
    {
        return this.head.val;
    }
    public String toString()
    {
        String res="";
        Node<T> act_elem = this.head;
        while(act_elem!=null)
        {
            res+=act_elem.val.toString()+' ';
            act_elem=act_elem.next;
        }
        return res;
    }
}

class Stopien implements Comparable<Stopien>
{
    public int compareTo(Stopien s)
    {
        return 0;
    }
}
class HetmanWielki extends Stopien
{
    public int compareTo(Stopien s)
    {
        return s.compareTo(this);
    }
}
class HetmanPolny extends Stopien
{
    public int compareTo(Stopien s)
    {
        if(s instanceof HetmanWielki) return -1;
        else return s.compareTo(this);
    }
}
class GeneralArtylerii extends Stopien
{
    public int compareTo(Stopien s)
    {
        if(s instanceof HetmanWielki) return -1;
        if(s instanceof HetmanPolny) return -1;
        else return s.compareTo(this);
    }
}
class GeneralMajor extends Stopien
{
    public int compareTo(Stopien s)
    {
        if(s instanceof HetmanWielki) return -1;
        if(s instanceof HetmanPolny) return -1;
        if(s instanceof GeneralArtylerii) return -1;
        else return s.compareTo(this);
    }
}
class GeneralLejtant extends Stopien
{//przykład otwarte-zamknięte, dodajemy klasę pomiędzy 2 stopniami
    public int compareTo(Stopien s)
    {
        if(s instanceof HetmanWielki) return -1;
        if(s instanceof HetmanPolny) return -1;
        if(s instanceof GeneralArtylerii) return -1;
        if(s instanceof GeneralMajor) return 1;
        else return s.compareTo(this);
    }
}

public class zad1
{
  public static void main(String[] args)
  {
    OrderedList<Integer> l = new OrderedList<Integer>();
    l.add_element(Integer.valueOf(5));
    l.add_element(Integer.valueOf(2));
    l.add_element(Integer.valueOf(4));
    l.add_element(Integer.valueOf(3));
    l.add_element(Integer.valueOf(6));
    System.out.println(l.toString());
    OrderedList<Stopien> l2 = new OrderedList<Stopien>();
    l2.add_element(new HetmanWielki());
    l2.add_element(new HetmanPolny());
    l2.add_element(new GeneralArtylerii());
    l2.add_element(new GeneralMajor());
    l2.add_element(new GeneralLejtant());
    System.out.println(l2.toString());
  }
}
