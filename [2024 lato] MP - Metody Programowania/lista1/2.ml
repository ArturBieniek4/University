" foo " ^ 42 ;;
(* NIE, bo konkatenujemy stringa i inta *)

" foo " ^ string_of_int 42 ;;
(* TAK, string *)

1. = 2;;
(* NIE, porównujemy floata i inta *)

fun a -> a + 5;;
(* TAK, int->int *)

fun a -> if a > 5 then a else " foo ";;
(* NIE, funkcja zwraca inta albo stringa *)

fun a b -> if a > 5 then a else b;;
(* TAK, int->int->int *)

fun a b ->
let c = a = b in
if a > 3 && b = " foo "
then c
else false ;;
(* NIE, b jest jednocześnie intem i stringiem *)


fun a ->
let f a b = a * a + b * b in
f (f a a) a;;
(* TAK, int->int *)

let f a = a > 2 in
if 3 > 2 then true else f (f 2) ;;
(* NIE, bo wywołujemy f(bool) *)