let rec choose m n =
  if m > n then [] else m :: choose (m +1) n;;

let ( let* ) xs ys = List . concat_map ys xs;;

let two_num_product n m =
  let* a = choose 1 n in
  let* b = choose a n in
  if a * b = m then [a , b] else []