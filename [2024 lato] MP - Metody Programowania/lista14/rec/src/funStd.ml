(* The standard library of FUN *)

let stdlib =
  [ "abs", "fun x -> if x < 0 then 0 - x else x"
  ; "mod", "fun x -> fun y -> x - (x / y) * y"
  ; "fix", "fun f -> (fun x -> fun y -> f (x x) y) 
                     (fun x -> fun y -> f (x x) y)"
  ]

let parse_string str =
  Parser.prog Lexer.token (Lexing.from_string str)

let include_def (name, str) prog =
  Ast.Let(name, parse_string str, prog)

let include_stdlib prog =
  List.fold_right include_def stdlib prog
