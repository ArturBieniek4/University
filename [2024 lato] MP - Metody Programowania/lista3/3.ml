let build_list n f =
  let rec it n xs =
  if n=(-1) then xs
  else it (n-1) ((f n)::xs)
  in it (n-1) [];;

  build_list 10 (square);;

let negatives n =
  build_list (n) (fun x -> -x-1);;

let reciprocals n =
  build_list n (fun x -> 1./.(float_of_int(x)+.1.)) ;;

let evens n =
  build_list n (fun x -> x*2);;

let identityM n =
  build_list n (fun x -> build_list n (fun y -> if x==y then 1 else 0));;