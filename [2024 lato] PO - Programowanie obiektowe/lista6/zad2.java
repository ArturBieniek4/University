// Artur Bieniek
// 347165
// javac zad1.java && java zad1 && rm *.class
import java.util.*;
import java.io.*;

class OrderedList<T extends Comparable<T>> implements Collection<T>{
    static class Node<T extends Comparable<T>>
    {
        T val;
        Node<T> next;
    }
    private Node<T> head;
    private int sz;
    static class OrderedListIterator<E extends Comparable<E>> implements Iterator<E>
    {
        private Node<E> act_elem;
        public OrderedListIterator(OrderedList<E> list)
        {
            this.act_elem=list.head;
        }
        public boolean hasNext()
        {
            return act_elem!=null;
        }
        public E next()
        {
            if(!hasNext())
            {
                throw new NoSuchElementException();
            }
            E val = act_elem.val;
            act_elem=act_elem.next;
            return val;
        }
    }
    public OrderedList()
    {
        this.head=null;
        this.sz=0;
    }
    public void add_element(T newVal)
    {
        Node<T> newNode = new Node<T>();
        newNode.val=newVal;
        newNode.next=null;
        Node<T> prev=null;
        Node<T> act_elem = this.head;
        if(sz!=Integer.MAX_VALUE)
            sz++;
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
        OrderedListIterator<T> it = iterator();
        while(it.hasNext())
        {
            res+=it.next().toString()+' ';
        }
        return res;
    }
    public int size()
    {
        return sz;
    }
    public boolean isEmpty()
    {
        return sz==0;
    }
    public boolean contains(Object o)
    {
        OrderedListIterator<T> it = iterator();
        while(it.hasNext())
        {
            T val = it.next();
            if(o==null && val==null || o.equals(val))
            {
                return true;
            }
        }
        return false;
    }
    public OrderedListIterator<T> iterator()
    {
        OrderedListIterator<T> it = new OrderedListIterator<T>(this);
        return it;
    }
    public void clear()
    {
        head=null;
        sz=0;
    }
    public boolean retainAll(Collection<?> c)
    {
        OrderedList<T> nowa = new OrderedList<T>();
        boolean changed=false;
        OrderedListIterator<T> it = iterator();
        while(it.hasNext())
        {
            T val = it.next();
            if(c.contains(val))
            {
                nowa.add_element(val);
            }
            else changed=true;
        }
        this.head=nowa.head;
        this.sz=nowa.sz;
        return changed;
    }
    public boolean removeAll(Collection<?> c)
    {
        OrderedList<T> nowa = new OrderedList<T>();
        boolean changed=false;
        OrderedListIterator<T> it = iterator();
        while(it.hasNext())
        {
            T val = it.next();
            if(c.contains(val)) changed=true;
            else
            {
                nowa.add_element(val);
            }
        }
        this.head=nowa.head;
        this.sz=nowa.sz;
        return changed;
    }
    public boolean addAll(Collection<? extends T> c)
    {
        boolean changed=false;
        Iterator<?> it = c.iterator();
        while(it.hasNext())
        {
            @SuppressWarnings("unchecked") // można tak bo ? extends T
            T val = (T)it.next();
            if(!contains(val))
            {
                changed=true;
                add_element(val);
            }
        }
        return changed;
    }
    public boolean containsAll(Collection<?> c)
    {
        boolean res=true;
        OrderedListIterator<T> it = iterator();
        while(it.hasNext())
        {
            T val = it.next();
            if(!c.contains(val))
            {
                res=false;
                break;
            }
        }
        return res;
    }
    public boolean remove(Object o)
    {
        OrderedList<T> nowa = new OrderedList<T>();
        boolean changed=false;
        OrderedListIterator<T> it = iterator();
        while(it.hasNext())
        {
            T val = it.next();
            if(o==null && val==null || o.equals(val)) changed=true;
            else
            {
                nowa.add_element(val);
            }
        }
        this.head=nowa.head;
        this.sz=nowa.sz;
        return changed;
    }
    public boolean add(T val)
    {
        boolean res=contains(val);
        add_element(val);
        return res;
    }
    public <E> E[] toArray(E[] arr)
    {
        int cnt=0;
        OrderedListIterator<T> it = iterator();
        while(it.hasNext())
        {
            T val = it.next();
            @SuppressWarnings("unchecked")
            E val2=(E) val;
            arr[cnt]=val2;
        }
        return arr;
    }
    public Object[] toArray()
    {
        Object[] arr = new Object[size()];
        int cnt=0;
        OrderedListIterator<T> it = iterator();
        while(it.hasNext())
        {
            T val = it.next();
            arr[cnt]=val;
        }
        return arr;
    }
}

public class zad2
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
    System.out.println(l.contains(3));
    System.out.println(l.isEmpty());
    for(Integer x : l) // pętla foreach za darmo w Collection
    {
        System.out.println(x);
    }
    System.out.println(l.stream().mapToInt(w -> w).sum()); // strumień za darmo w Collection
    OrderedList<Integer> l2 = new OrderedList<Integer> ();
    l2.addAll(l);
    l.clear();
    System.out.println(l.isEmpty());
    l.add(3);
    l.add(5);
    l2.removeAll(l); // usuwamy 3 i 5
    System.out.println(l2);
  }
}
