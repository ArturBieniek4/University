/*
Artur Bieniek
347165
mcs -t:library lista.cs
*/

using System;
public class Lista<T> where T: IComparable<T> {
    class Node {
        internal T val;
        internal Node next, prev;
        public Node(T val, Node next, Node prev)
        {
            this.val=val;
            this.next=next;
            this.prev=prev;
        }
    }
    Node head, tail;
    int sz;
    public Lista()
    {
        this.head=null;
        this.tail=null;
    }
    public int size()
    {
        return sz;
    }
    public bool is_empty()
    {
        return size()==0;
    }
    public void push_back(T val)
    {
        Node n = new Node(val , null, this.tail);
        if(this.tail!=null)
        {
            this.tail.next=n;
        }
        if(this.head==null) this.head=n;
        this.tail=n;
        sz++;
    }
    public void push_front(T val)
    {
        Node n = new Node(val , this.head, null);
        if(this.head!=null)
        {
            this.head.prev=n;
        }
        if(this.tail==null) this.tail=n;
        this.head=n;
        sz--;
    }
    public T pop_back()
    {
        if(this.tail==null) throw new IndexOutOfRangeException();
        T val = this.tail.val;
        if(this.tail.prev!=null) this.tail.prev.next=null;
        this.tail=this.tail.prev;
        sz--;
        return val;
    }
    public T pop_front()
    {
        if(this.head==null) throw new IndexOutOfRangeException();
        T val = this.head.val;
        if(this.head.next!=null) this.head.next.prev=null;
        this.head=this.head.next;
        sz--;
        return val;
    }
}