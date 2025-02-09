{
open Parser
}

let white = [' ' '\t']+
let digit = ['0'-'9']
let letter  = ['a'-'z' 'A'-'Z' '_']
let number = '-'? digit+
let ident = letter (letter | digit)*

rule read =
  parse
  | white { read lexbuf }
  | "=" { EQ }
  | "<" { LT }
  | "<=" { LTEQ }
  | ">" { GT }
  | ">=" { GTEQ }
  | "<>" { NEQ }
  | "&&" { AND }
  | "||" { OR }
  | "let" { LET }
  | "sum" { SUM }
  | "in" { IN }
  | "to" { TO }
  | "true" { TRUE }
  | "false" { FALSE }
  | "if" { IF }
  | "then" { THEN }
  | "else" { ELSE }
  | "*" { TIMES }
  | "+" { PLUS }
  | "-" { MINUS }
  | "/" { DIV }
  | "(" { LPAREN }
  | ")" { RPAREN }
  | number { INT (int_of_string (Lexing.lexeme lexbuf)) } 
  | ident { IDENT (Lexing.lexeme lexbuf) }
  | eof { EOF }
