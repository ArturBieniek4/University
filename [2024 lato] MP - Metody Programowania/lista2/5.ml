let maximum xs =
  let rec it mx xs =
    if xs=[] then mx
    else it (max mx (List.hd(xs))) (List.tl(xs))
  in it neg_infinity xs
;;