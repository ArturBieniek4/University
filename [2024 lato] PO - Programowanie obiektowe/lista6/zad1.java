// Artur Bieniek
// 347165
// javac zad1.java && java zad1 && rm *.class
import java.util.Arrays;
import java.io.*;

class OrderedList<T extends Comparable<T>> implements Serializable{
    static class Node<T extends Comparable<T>> implements Serializable
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

public class zad1
{
  public static void main(String[] args) throws IOException, ClassNotFoundException
  {
    OrderedList<Integer> l = new OrderedList<Integer>();
    l.add_element(Integer.valueOf(5));
    l.add_element(Integer.valueOf(2));
    l.add_element(Integer.valueOf(4));
    l.add_element(Integer.valueOf(3));
    l.add_element(Integer.valueOf(6));
    System.out.println(l.toString());
    FileOutputStream fstream;
    fstream=new FileOutputStream("zad1.txt");
    ObjectOutputStream objstream = new ObjectOutputStream(fstream);
    objstream.writeObject(l);
    objstream.flush();
    objstream.close();

    FileInputStream fin = new FileInputStream("zad1.txt");
    ObjectInputStream objin = new ObjectInputStream(fin);
    Object obj = objin.readObject();
    OrderedList<?> l2=(OrderedList<?>) obj;
    System.out.println(l2.toString());
    objin.close();
  }
}
