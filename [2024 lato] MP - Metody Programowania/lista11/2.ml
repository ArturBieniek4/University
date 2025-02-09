let find (type t) p (xs : t list) =
  let exception Found of t in
  try
    List.fold_left (fun _ x -> if p x then raise (Found x) else ()) () xs; raise Not_found
  with 
  | Found x -> x
