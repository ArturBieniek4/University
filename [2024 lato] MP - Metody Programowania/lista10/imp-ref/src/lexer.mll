{
open Parser

let tokenize_ident str =
  match str with
  | "begin" -> BEGIN
  | "end"   -> END
  | "if"    -> IF
  | "then"  -> THEN
  | "else"  -> ELSE
  | "while" -> WHILE
  | "do"    -> DO
  | "read"  -> READ
  | "write" -> WRITE
  | "var"   -> VAR
  | "skip"  -> SKIP
  | "true"  -> TRUE
  | "false" -> FALSE
  | "and"   -> AND
  | "or"    -> OR
  | "not"   -> NOT
  | _       -> IDENT str
}

let white = [' ' '\t']
let digit = ['0'-'9']
let letter = ['a'-'z' 'A'-'Z' '_']
let number = '-'? digit+
let ident = letter (letter | digit)*

rule token =
  parse
  | white+ { token lexbuf }
  | '\n' { Lexing.new_line lexbuf; token lexbuf }
  | "="  { EQ }
  | "<>" { NEQ }
  | "<=" { LEQ }
  | ">=" { GEQ }
  | "<"  { LT }
  | ">"  { GT }
  | "*"  { TIMES }
  | "+"  { PLUS }
  | "-"  { MINUS }
  | "/"  { DIV }
  | "("  { LPAREN }
  | ")"  { RPAREN }
  | ":=" { ASSGN }
  | number { INT (int_of_string (Lexing.lexeme lexbuf)) } 
  | ident { tokenize_ident (Lexing.lexeme lexbuf) }
  | eof { EOF }
