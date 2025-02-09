(*[ a b ]*)
(*[ c d ]*)
(* (a;b;c;d) *)
let matrix_id=(1,0,0,1);;

let matrix_mult a b = 
  let (aa, ab, ac, ad) = a
  and (ba, bb, bc, bd) = b
in (aa*ba+ab*bc,aa*bb+ab*bd,ac*ba+ad*bc,ac*bb+ad*bd);;

matrix_mult (1,2,3,4) (5,6,7,8);;

let matrix_expt m k =
  let rec it n m acc =
    if n==0 then acc else it (n-1) m (matrix_mult acc m)
  in it (k-1) m m;;

let fib_matrix k =
  let (a,b,c,d) = matrix_expt (1,1,1,0) k
in b;;