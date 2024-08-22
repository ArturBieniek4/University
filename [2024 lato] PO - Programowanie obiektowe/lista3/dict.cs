/*
Artur Bieniek
347165
mcs -r:lista.dll -out:dict.dll -t:library dict.cs
*/
using System;
public class Dictionary<K,V> where K: IComparable<K> where V: IComparable<V>{
    Lista<K> keys;
    Lista<V> values;
    public Dictionary ()
    {
        keys = new Lista<K>();
        values = new Lista<V>();
    }
    public void add(K key, V value)
    {
        keys.push_back(key);
        values.push_back(value);
    }
    public V find(K key)
    {
        int sz=keys.size();
        for(int i=0;i<sz;i++)
        {
            K actkey=keys.pop_front();
            V actval=values.pop_front();
            keys.push_back(actkey);
            values.push_back(actval);
            if(actkey.Equals(key)) return actval;
        }
        return default(V);
    }
    public void remove(K key)
    {
        int sz=keys.size();
        for(int i=0;i<sz;i++)
        {
            K actkey=keys.pop_front();
            V actval=values.pop_front();
            if(actkey.Equals(key)) return;
            keys.push_back(actkey);
            values.push_back(actval);
        }
    }
}