let twice f x = f (f x)
let compose f g x = f (g x)

Tw. dla każdego h : 'a -> 'a, x : 'a, twice h x == compose h h x

twice h x
== (def. twice)
h (h x)
== (def. compose)
compose h h x

let ( << ) = compose

Tw. dla każdego f, g, h, x zachodzi ((f << g) << h) x == (f << (g << h)) x

((f << g) << h) x
== (def. compose)
(f << g) (h x)
== (def. compose)
f (g (h x))
== (def. compose)
f ((g << h) x)
== (def. compose)
(f << (g << h)) x

Zasada indukcji dla liczb naturalnych:
dla każdej własności P,
jeśli P(0)
oraz dla każdego k naturalnego P(k) implikuje P(k+1)
to dla każdego n naturalnego zachodzi P(n)

let rec sumto n =
  if n = 0 then 0 else n + sumto (n - 1)

Tw. dla każdego n naturalnego zachodzi sumto n == n * (n + 1) / 2

1. Pokażę, że zachodzi sumto 0 == 0 * (0 + 1) / 2

sumto 0
== (def. sumto)
0
== (z zasad arytmetyki)
0 * (0 + 1) / 2

2. Załóżmy, że dla pewnego k naturalnego zachodzi sumto k == k * (k + 1) / 2.
   Pokażę, że sumto (k + 1) == (k + 1) * ((k + 1) + 1) / 2

sumto (k + 1)
== (def. sumto)
(k + 1) + sumto (k + 1 - 1)
== (z zasad arytmetyki)
(k + 1) + sumto k
== (z założenia indukcyjnego)
(k + 1) + k * (k + 1) / 2
== (z zasad arytmetyki)
2 * (k + 1) / 2 + k * (k + 1) / 2
== (z zasad arytmetyki)
(k + 2) * (k + 1) / 2
== (k + 1) * ((k + 1) + 1) / 2

let sumto_closed n = n * (n + 1) / 2

Wniosek: dla każdego n naturalnego, sumto n == sumto_closed n

let rec fact n =
  if n = 0 then 1 else n * fact (n - 1)

let rec fact_it acc n =
  if n = 0 then acc else fact_it (n * acc) (n - 1)

let iter_fact n = fact_it 1 n

Tw. dla każdego n naturalnego zachodzi fact n == iter_fact n

Krok: dla każdego k naturalnego, jeśli fact k == iter_fact k,
      to fact (k + 1) == iter_fact (k + 1)

iter_fact (k + 1)
== (def. iter_fact)
fact_it 1 (k + 1)
== (def. fact_it, arytmetyka)
fact_it ((k + 1) * 1) k

Próba nieudana! Druga próba:

Lemat: dla każdego n, acc, fact_it acc n == acc * fact n

Indukcja względem liczby n.

1. Pokażę, że zachodzi fact_it acc 0 == acc * fact 0
   Weźmy dowolny acc.

fact_it acc 0
== (def. fact_it)
acc
== (arytmetyka)
acc * 1
== (def. fact)
acc * fact 0

2. Dla pewnego k, jeśli dla każdego acc zachodzi fact_it acc k == acc * fact k,
   to dla każdego acc zachodzi fact_it acc (k + 1) == acc * fact (k + 1)
   Weźmy dowolny acc.

fact_it acc (k + 1)
== (def. fact_it, arytmetyka)
fact_it (acc * (k + 1)) k
== (założenie indukcyjne)
(acc * (k + 1)) * fact k
== (łączność mnożenia)
acc * ((k + 1) * fact k)
== (def. fact)
acc * fact (k + 1)

Dowód tw. dla każdego n naturalnego zachodzi fact n == iter_fact n

iter_fact n
== (def. iter_fact)
fact_it 1 n
== (lemat)
1 * fact n
== (arytmetyka)
fact n

type nat = Z | S of nat

let rec plus a b =
  match a with
  | Z -> b
  | S k -> S (plus k b)

Tw. dla każdego k : nat, plus Z k == k

plus Z k 
== (def. plus)
k

Tw. dla każdego k : nat, plus k Z == k

Zasada indukcji dla liczb naturalnych typu nat:
dla każdej własności P,
jeśli P(Z)
oraz dla każdego k naturalnego P(k) implikuje P(S(k))
to dla każdego n naturalnego zachodzi P(n)

Dowód tw. dla każdego k : nat, plus k Z == k
`
1. Pokażę, że plus Z Z == Z

plus Z Z
== (def. plus)
Z

2. Weźmy dowolne k : nat, pokażę, że jeśli plus k Z == k, to plus (S k) Z == S k

plus (S k) Z
== (def. plus)
S (plus k Z)
== (z zał. ind.)
S k

type 'a list = [] | (::) of 'a * 'a list

Zasada indukcji dla list typu 'a list:
dla każdej własności P,
jeśli P([])
oraz dla każdego a : 'a, as : 'a list, P(as) implikuje P(a :: as)
to dla każdej listy as zachodzi P(as)

Tw. append [] as == as

append [] as
== (def. append)
as

Tw. append as [] == as

1. Pokażę, że append [] [] == [] 

append [] []
== (def. append)
[]

2. Weźmy dowolne as. Załóżmy, że append as [] == as, pokażę, że
   dla każdego a zachodzi append (a :: as) [] == a :: as

append (a :: as) []
== (def. append)
a :: append as []
== (z zał. ind.)
a :: as

let ( @ ) = append

Tw. Dla każdego xs, ys, zs zachodzi (xs @ ys) @ zs == xs @ (ys @ zs)

Indukcja względem xs.

1. Pokażę, że dla każdego ys, zs zachodzi ([] @ ys) @ zs == [] @ (ys @ zs)

([] @ ys) @ zs
== (def. append)
ys @ zs
== (def. append)
[] @ (ys @ zs)

2. Weźmy dowolne xs. Załóżmy, że dla każdego ys, zs 
   zachodzi (xs @ ys) @ zs == xs @ (ys @ zs),
   pokażę, że dla każdego x, ys, zs
   zachodzi ((x :: xs) @ ys) @ zs == (x :: xs) @ (ys @ zs)

((x :: xs) @ ys) @ zs
== (z def. append)
(x :: (xs @ ys)) @ zs
== (z def. append)
x :: ((xs @ ys) @ zs)
== (z zał. ind.)
x :: (xs @ (ys @ zs))
== z def. append
(x :: xs) @ (ys @ zs)

let rec rev1 xs = match xs with
  | [] -> []
  | x :: xs' -> rev1 xs' @ [x]

let rec revapp xs ys = match xs with
  | [] -> ys
  | x :: xs' -> revapp xs' (x :: ys)

let rev2 xs = revapp xs []

Tw. dla każdego xs, rev1 xs == rev2 xs

Próba:

rev2 (x :: xs)
== (def. rev2)
revapp (x :: xs) []
== (def. revapp)
revapp xs (x :: [])

Próba nieudana!

Lemat (próba): rev1 xs == revapp xs []

1. rev1 [] == revapp [] []

rev1 []
== (def. rev1)
[]
== (def. revapp)
revapp [] []

2. Załóżmy, że rev1 xs == revapp xs []. Pokażę, że dla każdego x zachodzi
   rev1 (x :: xs) == revapp (x :: xs) []

revapp (x :: xs) []
== (def. revapp)
revapp xs (x :: [])

Próba nieudana!

Lemat: dla każdego ys, rev1 xs @ ys == revapp xs ys

1. Pokażę, że dla każdego ys zachodzi rev1 [] @ ys == revapp [] ys

rev1 [] @ ys
== (def. rev1)
[] @ ys
== (def. append)
ys
== (def. revapp)
revapp [] ys

2. Weźmy dowolny xs. Pokażę, że jeśli dla każdego ys
   zachodzi rev1 xs @ ys = revapp xs ys,
   to dla każdego x, ys zachodzi rev1 (x :: xs) @ ys == revapp (x :: xs) ys

rev1 (x :: xs) @ ys
== (def. rev1)
(rev1 xs @ [x]) @ ys
== (łączność @)
rev1 xs @ ([x] @ ys)
== (z zał. ind.)
revapp xs ([x] @ ys)
== (z def. append)
revapp xs (x :: ([] @ ys))
== (z def. append)
revapp xs (x :: ys)
== (z def. revapp)
revapp (x :: xs) ys

Tw. dla każdego xs, rev1 xs == rev2 xs

rev2 xs
== (def. rev2)
revapp xs []
== (lemat)
rev1 xs @ []
== (lewostronny element neutralny @)
rev1 xs

type 'a tree = Leaf | Node of 'a tree * 'a * 'a tree

Zasada indukcji dla drzew typu 'a tree:
dla każdej własności P,
jeśli P(Leaf)
oraz dla każdego a : 'a, l, r : 'a tree, P(l) i P(r) implikuje P(Node (l, a, r))
to dla każdego drzewa t zachodzi P(t)

let rec reflect = function
  | Leaf -> Leaf
  | Node (l, v, r) -> Node (reflect r, v, reflect l)

Tw. reflect (reflect t) = t

1. Pokażę, że reflect (reflect Leaf) = Leaf

reflect (reflect Leaf)
== (z def. reflect)
reflect Leaf
== (z def. reflect)
Leaf

2. Weźmy dowolne l, v, r. Załóżmy, że reflect (reflect l)) == l
   oraz reflect (reflect r)) == r. Pokażę, że
   reflect (reflect (Node (l, v, r))) == Node (l, v, r)

reflect (reflect (Node (l, v, r)))
== (z def. reflect)
reflect (Node (reflect r, v, reflect l))
== (z def. reflect)
Node (reflect (reflect l), v, reflect (reflect r))
== (z zał. ind. dla l)
Node (l, v, reflect (reflect r))
== (z zał. ind. dla r)
Node (l, v, r)

module type DICT = sig
  type ('a, 'b) dict 
  val empty : ('a, 'b) dict
  val insert : 'a -> 'b -> ('a, 'b) dict -> ('a, 'b) dict
  val lookup_opt : 'a -> ('a, 'b) dict -> 'b option
  val remove : 'a -> ('a, 'b) dict -> ('a, 'b) dict
end

lookup_opt k empty == None
lookup_opt k (insert k v d) == Some v
lookup_opt k (remove k d) == None




