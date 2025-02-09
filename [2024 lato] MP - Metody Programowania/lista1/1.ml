10 ;;
(*int=10*)

2 * 3 + 4;;
(* int=10 *)

2 * (3 + 4) ;;
(* int=14 *)

let a = 3;;
(* val a: int = 3 *)

let b = a + 1;;
(* val b: int = 4 *)

if b > a && b < a * b then b else a;;
(* int = 4 *)
(* bo wypisuje b *)

2 + ( if b > a then b else a);;
(* int = 6 *)
(* bo 2+b *)

let a = if b * b > b then b else -1 in a * b;;
(* int = 16 *)
(* bo b*b (a*b ale in a=b) *)