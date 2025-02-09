/*
Artur Bieniek
347165
mcs -out:/tmp/cppprog 2.cs && time mono /tmp/cppprog
*/

using System;
using System.IO;
using System.Text;

namespace Project_1 {
    class IntStream {
        protected uint val;
        public IntStream()
        {
            val=0;
        }
        public uint next()
        {
            if(eos()) throw new EndOfStreamException();
            return val++;
        }
        public bool eos()
        {
            return val==UInt32.MaxValue;
        }
        public void reset()
        {
            val=0;
        }
    }
    
    class FibStream : IntStream
    {
        uint val2;
        public FibStream()
        {
            val2=1;
        }
        new public uint next()
        {
            if(eos()) throw new EndOfStreamException();
            uint rval=val+val2;
            val=val2;
            val2=rval;
            return rval;
        }
        new public bool eos()
        {
            return (UInt32.MaxValue-val)<val2;
        }
        new public void reset()
        {
            val=0;
            val2=1;
        }
    }

    class RandomStream : IntStream
    {
        Random rnd;
        public RandomStream()
        {
            rnd=new Random();
        }
        new public int next()
        {
            if(eos()) throw new EndOfStreamException();
            return rnd.Next(0,Int32.MaxValue);
        }
        new public bool eos()
        {
            return false;
        }
        new public void reset()
        {
            rnd=new Random();
        }
    }
    // rozumiem że tu chodziło o kolejne liczby Fibbonacciego a nie pierwsze, skoro 1 jest 2 razy
    class RandomWordStream : IntStream
    {
        Random rnd;
        FibStream fib;
        public RandomWordStream()
        {
            rnd=new Random();
            fib=new FibStream();
        }
        new public string next()
        {
            if(eos()) throw new EndOfStreamException();
            uint cnt=fib.next();
            StringBuilder sb = new StringBuilder("", (int)cnt);
            for(int i=0;i<cnt;i++)
            {

                sb.Append((char)rnd.Next(32,126));
            }
            return sb.ToString();
        }
        new public bool eos()
        {
            return fib.eos();
        }
        new public void reset()
        {
            rnd=new Random();
            fib.reset();
        }
    }
    class MainClass {
        public static void Main (string[] args) {
            Console.WriteLine ("Hello World!");
            IntStream s = new IntStream();
            Console.WriteLine (s.next());
            Console.WriteLine (s.next());
            Console.WriteLine (s.next());
            Console.WriteLine (s.eos());
            s.reset();
            Console.WriteLine (s.next());
            // while(!s.eos()) s.next();
            FibStream s2 = new FibStream();
            while(!s2.eos())
                Console.WriteLine (s2.next());
            RandomStream s3 = new RandomStream();
            for(int i=0;i<10;i++)
            {
                Console.WriteLine (s3.next());
            }

            RandomWordStream s4 = new RandomWordStream();
            for(int i=0;i<10;i++)
            {
                Console.WriteLine (s4.next());
            }

            // Console.ReadKey ();
        }
    }
}