let parens_ok str =
  let rec it xs opened=
  match xs with
  | [] -> opened=0
  | '('::xs' -> it xs' (opened+1)
  | ')'::xs' -> if opened=0 then false else it xs' (opened-1)
  | x::xs -> false
in it (List.of_seq (String.to_seq str)) 0;;

parens_ok "(())()";;
parens_ok "()())";;
parens_ok "((())";;
parens_ok "(x)";;