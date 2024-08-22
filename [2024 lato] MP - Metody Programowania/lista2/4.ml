let rec mem x xs =
  if xs=[] then false else
  if List.hd(xs)=x then true
  else mem x (List.tl(xs))
;;

mem 2 [1;2;3];;
mem 4 [1;2;3];;