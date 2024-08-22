let fold_left f a xs =
  let rec it xs acc =
    match xs with
    | [] -> acc
    | x :: xs' -> it xs' (f acc x)
  in it xs a
;;

let prod xs =
  fold_left ( * ) 1 xs;;

prod [1;2;3;4];;
