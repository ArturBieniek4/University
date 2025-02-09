(* The standard library of FUN *)

let stdlib =
  [ "abs", "fun x -> if x < 0 then 0 - x else x"
  ; "mod", "fun x -> fun y -> x - (x / y) * y"
  ; "fix", "fun f -> (fun x -> fun y -> f (x x) y) 
                     (fun x -> fun y -> f (x x) y)"
  ; "map", "fun f -> fun xs ->
  let loop = fix (fun loop -> fun xs acc f ->
      match xs with
      | Nil() -> acc
      | Cons(x, xs2) -> Cons((f x), loop xs2 acc f)
      end
      )
  in
  loop xs (Nil()) f"
  ; "append", "fix (fun loop -> fun left right ->
    match left with
    | Nil() -> right
    | Cons(x, left2) -> Cons(x, loop left2 right)
    end
    )"
  ]

let parse_string str =
  Parser.prog Lexer.token (Lexing.from_string str)

let include_def (name, str) prog =
  Ast.Let(PVar name, parse_string str, prog)

let include_stdlib prog =
  List.fold_right include_def stdlib prog
