let rec insert n xs =
  match xs with
  | [] -> [n]
  | x :: xs' ->
    if n<x then
      n :: xs
    else
      x :: insert n xs'
;;

let rec insert_gen op n xs =
  match xs with
  | [] -> [n]
  | x :: xs' ->
    if op n x then
      n :: xs
    else
      x :: insert_gen op n xs'
;;

let rec insertion_sort xs =
  match xs with
  | [] -> []
  | x::xs' -> insert x (insertion_sort xs')

let rec insertion_sort_gen op xs =
  match xs with
  | [] -> []
  | x::xs' -> insert_gen op x (insertion_sort_gen op xs')
;;

insertion_sort_gen (>) [1;4;6;3;5;8;9;5;2];;
insertion_sort_gen (<) [(1,1);(2,1);5,3;1,2];;
(* lesykograficzne domyślnie *)

let pair_lex (a1, a2) (b1, b2) =
  if a1<b1 then true
  else if b1<a1 then false
  else a2<b2
;;

let add1 x = x+1

let rec add1_to_all = function
  | [] -> []
  | x::xs' -> add1 x::add1_to_all xs'
;;

let rec string_list_of_int_list = function
  | [] -> []
  | x::xs' -> string_of_int x::string_list_of_int_list xs';;

let rec map f = function
  | [] -> []
  | x::xs' -> f x::map f xs';;