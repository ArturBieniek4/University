let rec loop () = loop ();;

let rec fact n =
  if n=0 then 1 else n*fact(n-1);;

let fact_iter n =
  let rec it n acc =
    if n=0 then acc else it (n-1) (acc*n)
  in it n 1;;

let t3=(42, "foo", false);;

let a, b, c = t3;;

let fst_of_3 (a,b,c) = a;;
let fst_of_3 (a,_,_) = a;;

let o = Some 3;;

let on = None;;
let test x = if x=0 then Some "xd" else None;;
Option.get(o);; (* zwraca wartość *)
Option.get(on);; (* błąd *)

Option.is_some(o);;
Option.is_none(on);;

let Some a = o;;
match o with Some a -> a | None -> 0;;

let val_of_option o b =
  match o with
    Some a->a |
    None ->b;;

(* Jeśli wiele wzorców by się dopasowało, dopasowuje się pierwszy *)

type vec2 = float * float;;

let mk_vec x y = ((x,y : vec2));;
(* let a,b = mk_vec 2. 3.;; *)

let vec_x (v : vec2) = fst v;;
let vec_y (v : vec2) = snd v;;

let is_vec_zero (v : vec2) = fst v = 0. && snd v = 0.;;
(* predykat - funkcja zwaracająca boole *)
let is_vec_zero2 ((x,y) : vec2) = x = 0. && y = 0.;;
(* to samo *)

let square x = x*.x;;

let vec_length v = sqrt(square(vec_x v) +. square(vec_y v));;

[1;2;3];;

(* ["x"; 1]
   źle *)

[Some 1; None];;
[(+);(-)];;
[fst;snd];;
(* wtedy muszą być tego samego typu oba elementy pary *)

[];;
List.cons(1) [];;
(* dodanie elementu z lewej strony *)

(* listy jednostronie łączone *)

1::2::[];;
(* krótsze *)

let rec linf = 1 :: linf;;
let l=[1;2;3;4];;
List.hd(l);;
List.tl(l);;
(* ogon to wszystko bez pierwszego elementu *)

let rec nth l n =
  if n=0
    then List.hd l
  else nth (List.tl l) (n-1)

let rec append l1 l2 =
  if l1 = [] then l2
  else List.hd l1 :: append(List.tl l1) l2
;;

let rec append xs ys =
  match xs with
  | [] -> ys
  | x :: xs' -> x :: append xs' ys
(* to samo tylko czytelniej *)
(* :: jest normalnym wzorcem *)

let reverse xs =
  let rec it xs ys =
    match xs with
    | [] -> ys
    | x::xs' -> it xs' (x::ys)
  in it xs []
;;
(* przykład funkcji rekurencyjnej strukturalnie *)

let rec rev2 xs =
  match xs with
  | [] -> []
  | x :: xs' -> append (rev2 xs') [x] 
;;
(* to jest źle, używa appenda dużo razy, n^2 *)

let rec mk_list n =
if n=0 then [] else n :: mk_list (n-1);;

let rec all_but_last xs =
  match xs with
  | [] -> failwith "empty list"
  | [x] -> []
  | x :: xs' -> x::all_but_last xs'
;;

(* ta niby jest, niby nie jest rekurencyjna strukturalnie *)

let rec last xs = 
  match xs with
  | [] -> failwith "empty list"
  | [x] -> x
  | x :: xs' -> last xs'


let rec rev3 xs =
  if xs == [] then [] else last xs::rev3 (all_but_last xs)

(* to nie jest rekurencyjne strukuralnie, bo wywołujemy rekursję na wyniku innej funkcji *)

let rec insert n xs =
  match xs with
  | [] -> [n]
  | x :: xs' ->
    if n<x then
      n :: xs
    else
      x :: insert n xs'
;;

let rec insertion_sort xs =
  match xs with
  | [] -> []
  | x::xs' -> insert x (insertion_sort xs')

let insertion_sort_iter xs =
  let rec it xs ys =
    match xs with
    | [] -> ys
    | x::xs' -> it xs' (insert x ys)
  in it xs [];;