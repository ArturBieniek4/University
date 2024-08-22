let is_sorted xs =
  let rec it last xs =
    if xs=[] then true
    else if last>(List.hd(xs)) then false
    else it (List.hd(xs)) (List.tl(xs))
  in it (List.hd(xs)) xs;;

let is_sorted xs =