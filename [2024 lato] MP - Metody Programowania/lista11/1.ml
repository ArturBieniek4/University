let exists f xs = List.fold_left ( fun b x -> b || f x) false xs
exception Exists
let exists f xs = 
  try
  List.fold_left 
  (fun b x -> if f x then raise Exists else false) false xs
  with Exists -> true
