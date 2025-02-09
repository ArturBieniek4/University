/*
Artur Bieniek
347165
mcs -out:/tmp/cppprog 2.cs && time mono /tmp/cppprog
*/

using System;

namespace Project_1 {
    class Node {

    }

    class Array {
        class Node {
            internal int val;
            internal Node next, prev;
            public Node(int val, Node next, Node prev)
            {
                this.val=val;
                this.next=next;
                this.prev=prev;
            }
        }
        Node head, tail, lastnode;
        int l, r, lastpos;
        public Array(int l, int r)
        {
            if(l>r) throw new IndexOutOfRangeException();
            this.head=null;
            this.tail=null;
            this.l=l;
            this.r=r;
            for(int i=l;i<=r;i++)
            {
                this.push_back(0);
            }
            this.lastnode=this.tail;
            this.lastpos=r;
        }
        public int size()
        {
            return r-l+1;
        }
        public void push_back(int val)
        {
            Node n = new Node(val , null, this.tail);
            if(this.tail!=null)
            {
                this.tail.next=n;
            }
            if(this.head==null) this.head=n;
            this.tail=n;
            r++;
        }
        public void push_front(int val)
        {
            Node n = new Node(val , this.head, null);
            if(this.head!=null)
            {
                this.head.prev=n;
            }
            if(this.tail==null) this.tail=n;
            this.head=n;
            l--;
        }
        public int get(int pos)
        {
            if(pos==r)
            {
                return this.tail.val;
            }
            if(pos==l)
            {
                return this.head.val;
            }
            if(pos<l || pos>r)
            {
                throw new IndexOutOfRangeException();
            }
            int dist_from_lastpos=Math.Abs(this.lastpos-pos);
            int dist_from_l=pos-l;
            int dist_from_r=r-pos;
            Node act=this.lastnode;
            int actpos=this.lastpos;
            if(dist_from_l<dist_from_lastpos && dist_from_l < dist_from_r)
            {
                act=this.head;
                actpos=this.l;
            }
            else if(dist_from_r<dist_from_lastpos)
            {
                act=this.tail;
                actpos=this.r;
            }
            while(actpos<pos)
            {
                act=act.next;
                actpos++;
            }
            while(actpos>pos)
            {
                act=act.prev;
                actpos--;
            }
            this.lastpos=actpos; // te dwie można zakomentować żeby sprawdzić różnicę czasu
            this.lastnode=act;
            return act.val;
        }
        public void set(int pos, int val)
        {
            if(pos<l || pos>r)
            {
                throw new IndexOutOfRangeException();
            }
            Node act=this.head;
            int actpos=l;
            while(actpos!=pos)
            {
                act=act.next;
                actpos++;
            }
            act.val=val;
        }
    }
    class MainClass {
        public static void Main (string[] args) {
            Console.WriteLine ("Hello World!");
            Array a1 = new Array(0,10000);
            Array a2 = new Array(0,10000);
            Array a3 = new Array(0,10000);
            for (int i = 0; i < 10000; i++)
                a3.set(i, a1.get(i)+a2.get(i));
            int wyk=2;
            for(int i=0;i<29;i++)
            {
                wyk*=2;
                a1.set(i, wyk);
            }
            for(int i=0;i<29;i++)
            {
                Console.WriteLine(a1.get(i));
            }
            // Console.ReadKey ();
        }
    }
}