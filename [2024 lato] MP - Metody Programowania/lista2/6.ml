let rec suffixes xs =
    if xs=[] then [[]]
    else xs::(suffixes (List.tl(xs)))
;;