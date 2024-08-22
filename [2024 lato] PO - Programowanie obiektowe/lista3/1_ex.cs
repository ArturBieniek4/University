/*
Artur Bieniek
347165
mcs -r:lista.dll 1_ex.cs && mono 1_ex.exe
*/
using System;
class MainClass {
    public static void Main (string[] args) {
        Console.WriteLine ("Hello World!");
        Lista<int> l1 = new Lista<int>();
        l1.push_back(2);
        l1.push_front(3);
        Console.WriteLine(l1.pop_back());
        Console.WriteLine(l1.pop_front());
    }
}