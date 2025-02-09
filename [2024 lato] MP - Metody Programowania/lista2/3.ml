let matrix_mult a b = 
  let (aa, ab, ac, ad) = a
  and (ba, bb, bc, bd) = b
in (aa*ba+ab*bc,aa*bb+ab*bd,ac*ba+ad*bc,ac*bb+ad*bd);;

let matrix_expt_fast m k =
  let rec it n wyn wyk =
    if n==0 then wyn else
      it (n/2)
      (if (n mod 2)=1 then matrix_mult wyn wyk else wyn)
      (matrix_mult wyk wyk)
  in it (k-1) m m;;

let fib_matrix_fast k =
  matrix_expt_fast (1,1,1,0) k;;

(* fib_matrix 999999999;; *)
(* mieli *)
fib_matrix_fast 999999999;;
(* wynik od razu *)