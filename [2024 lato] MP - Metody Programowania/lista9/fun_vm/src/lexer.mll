{
open Parser
}

let white = [' ' '\t' '\n']+
let digit = ['0'-'9']
let letter = ['a'-'z' 'A'-'Z' '_']
let number = '-'? digit+
let ident = letter (letter | digit)*

rule read =
  parse
  | white { read lexbuf }
  | "->" { ARR }
  | "&&" { AND }
  | "||" { OR }
  | "=" { EQ }
  | "<>" { NEQ }
  | "<=" { LEQ }
  | ">=" { GEQ }
  | "<" { LT }
  | ">" { GT }
  | "*" { TIMES }
  | "+" { PLUS }
  | "-" { MINUS }
  | "/" { DIV }
  | "(" { LPAREN }
  | ")" { RPAREN }
  | "fun" { FUN }
  | "let" { LET }
  | "in" { IN }
  | "true" { TRUE }
  | "false" { FALSE }
  | "if" { IF }
  | "then" { THEN }
  | "else" { ELSE }
  | number { INT (int_of_string (Lexing.lexeme lexbuf)) } 
  | ident { IDENT (Lexing.lexeme lexbuf) }
  | eof { EOF }
