let select xs =
  let rec it selected xs xs2 =
    if xs=[] then selected, xs2
    else
      if List.hd(xs)<selected then
        it (List.hd(xs)) (List.tl(xs))
        (if selected==max_int then xs2 else (selected::xs2))
      else
        it selected (List.tl(xs)) (List.hd(xs)::xs2)
  in let sel, xs = it max_int xs [] in sel, List.rev(xs)
  ;;

let select_sort xs =
  List.rev(let rec it posortowana xs =
    if xs=[] then posortowana
    else let mini,xs2 = select xs in it (mini::posortowana) xs2
  in it [] xs)
;;

select_sort [1; 5; 0; 7; 1; 4; 1; 0];;