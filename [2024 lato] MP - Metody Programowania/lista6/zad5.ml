let parens_ok str =
  let rec it xs stack=
  match xs with
  | [] -> stack=[]
  | '('::xs' -> it xs' ('('::stack)
  | '['::xs' -> it xs' ('['::stack)
  | '{'::xs' -> it xs' ('{'::stack)
  | ')'::xs' -> if stack=[] then false else List.hd stack = '(' && it xs' (List.tl stack)
  | ']'::xs' -> if stack=[] then false else List.hd stack = '[' && it xs' (List.tl stack)
  | '}'::xs' -> if stack=[] then false else List.hd stack = '{' && it xs' (List.tl stack)
  | x::xs -> false
in it (List.of_seq (String.to_seq str)) [];;

parens_ok "()[]";;
parens_ok "[()[{}]]";;
parens_ok "{(]}";;
parens_ok "({)";;