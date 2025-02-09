let x = z in let y = 3 in y;;
(* z wolna, x,y związana *)

let x = abs 2 in x + y;;
(* x związana, y wolna *)

let x = x + 1 in x;;
(* x wolna, potem związana *)

fun x -> let y = x + y in y;;
(* y wolna, potem związana, x związana *)

let foo = fun x -> x + 1 in foo 7;;
(* foo związane, x związane *)

(fun x -> x + 1) 7;;
(* x związane *)

let (+) a b = a * b in 10 + 10;;
(* + a b związane, a i b też *)

let rec fib n = if n <= 1 then n else fib (n - 1) + fib (n - 2);;
(* fib związane, n związane *)