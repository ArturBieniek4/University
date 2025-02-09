let split xs =
  let rec it n xl xr =
    if n=0
      then (xl,xr)
    else
      it (n-1) (List.hd(xr)::xl) (List.tl(xr))
  in it (List.length(xs)/2) [] xs
;;
split [8; 2; 4; 7; 4; 2; 1];;

let merge xl xr =
  List.rev(let rec it xs xl xr =
    match xl, xr with
    | [], [] -> xs
    | [], xr' -> it ((List.hd(xr))::xs) xl (List.tl(xr))
    | xl', [] -> it ((List.hd(xl))::xs) (List.tl(xl)) xr
    | xl', xr' -> if List.hd(xr)<List.hd(xl) then
      it ((List.hd(xr))::xs) xl (List.tl(xr))
      else it ((List.hd(xl))::xs) (List.tl(xl)) xr 
  in it [] xl xr);;

merge [1; 4; 4; 8] [2; 2; 7];;

let rec merge_sort xs = 
  match xs with
  | [] -> xs
  | a' :: [] -> xs
  | xs' -> let xl, xr = (split xs) in merge (merge_sort xl) (merge_sort xr)
;;
(* Według wykładu Nie jest rekurencyjna strukturalnie, bo wywołujemy rekursję na wyniku innej funkcji *)
(* IMO jest, bo za każdym razem dzieli problem na mniejsze podproblemy *)

merge_sort [1; 5; 0; 7; 1; 4; 1; 0];;