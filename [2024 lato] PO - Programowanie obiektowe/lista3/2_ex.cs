/*
Artur Bieniek
347165
mcs -r:dict.dll 2_ex.cs && mono 2_ex.exe
*/
using System;
class MainClass {
    public static void Main (string[] args) {
        Console.WriteLine ("Hello World!");
        Dictionary<int,char> d = new Dictionary<int,char>();
        d.add(0, 'a');
        d.add(1, 'b');
        Console.WriteLine(d.find(0));
        Console.WriteLine(d.find(2));
        d.remove(1);
        Console.WriteLine(d.find(1));
    }
}