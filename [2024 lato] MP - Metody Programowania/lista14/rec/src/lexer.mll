{
open Parser
}

let white = [' ' '\t']+
let digit = ['0'-'9']
let letter = ['a'-'z' 'A'-'Z' '_']
let number = '-'? digit+
let ident = ['a'-'z' '_'] (letter | digit)*
let cname = ['A'-'Z'] (letter | digit)*

rule token =
  parse
  | '\n'  { Lexing.new_line lexbuf; token lexbuf }
  | white { token lexbuf }
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
  | "," { COMMA }
  | "|" { BAR }
  | "(" { LPAREN }
  | ")" { RPAREN }
  | "and" { KW_AND }
  | "fun" { FUN }
  | "let" { LET }
  | "rec" { REC }
  | "in" { IN }
  | "true" { TRUE }
  | "false" { FALSE }
  | "if" { IF }
  | "then" { THEN }
  | "else" { ELSE }
  | "raise" { RAISE }
  | "try" { TRY }
  | "match" { MATCH }
  | "with" { WITH }
  | "end" { END }
  | "fst" { FST }
  | "snd" { SND }
  | "_"   { UNDERSCORE }
  | number { INT (int_of_string (Lexing.lexeme lexbuf)) } 
  | ident { IDENT (Lexing.lexeme lexbuf) }
  | cname { CNAME (Lexing.lexeme lexbuf) }
  | eof { EOF }
