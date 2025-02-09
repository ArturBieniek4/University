let rec fib n =
  match n with
  | 0 -> 0
  | 1 -> 1
  | a -> fib (a-1) + fib (a-2)
;;

let rec fib_iter n =
  let rec it n acc acc2 =
    if n=0 then acc
    else it (n-1) (acc+acc2) acc
  in it n 0 1;;

