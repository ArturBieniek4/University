%{
open Ast

let rec make_funs xs e =
  match xs with
  | (x, tp) :: ys -> Fun(x, tp, make_funs ys e)
  | [] -> e

let type_of_ident x =
  match x with
  | "int"  -> t_int
  | "bool" -> t_bool
  | "unit" -> t_unit
  | _      -> failwith ("Undefined type " ^ x)
%}

%token <int> INT
%token <string> IDENT
%token TIMES DIV PLUS MINUS
%token LPAREN RPAREN
%token FUN ARR COLON
%token AND OR EQ LT GT LEQ GEQ NEQ COMMA
%token KW_AND TRUE FALSE IF THEN ELSE LET REC IN
%token TRY WITH RAISE
%token FST SND
%token EOF

%start <Ast.expr> prog

%right ARR
%left COMMA
%nonassoc AND OR
%nonassoc EQ NEQ LT GT LEQ GEQ
%left PLUS MINUS
%left TIMES DIV

%%

prog:
  | e = mixfix; EOF { e }
  ;
  
type_expr:
  | x = IDENT { type_of_ident x }
  | tp1 = type_expr; ARR; tp2 = type_expr { t_arr tp1 tp2 }
  | LPAREN; tp=type_expr; RPAREN { tp }
  ;

farg:
  | LPAREN; x = IDENT; COLON; tp = type_expr; RPAREN { (x, tp) }
  | x = IDENT { (x, fresh_uvar ()) }
  ;

mixfix:
  | IF; e1 = mixfix; THEN; e2 = mixfix; ELSE; e3 = mixfix { If(e1, e2, e3) }
  | LET; x = IDENT; EQ; e1 = mixfix; IN; e2 = mixfix { Let(x, e1, e2) }
  | LET; REC; defs = rec_defs; IN; e2 = mixfix { LetRec(defs, e2) }
  | FUN; xs = list(farg); ARR; e = mixfix { make_funs xs e }
  | TRY; e1 = mixfix; WITH; e2 = mixfix { Try(e1, e2) }
  | e = expr { e }
  ;

rec_defs:
  | def = rec_def; KW_AND; defs = rec_defs { def :: defs }
  | def = rec_def { [ def ] }
  ;

rec_def:
  | x = IDENT; EQ; e = mixfix { (x, e) }
  ;

expr:
  | e1 = expr; PLUS; e2 = expr { Binop(Add, e1, e2) }
  | e1 = expr; MINUS; e2 = expr { Binop(Sub, e1, e2) }
  | e1 = expr; DIV; e2 = expr { Binop(Div, e1, e2) }
  | e1 = expr; TIMES; e2 = expr { Binop(Mult, e1, e2) }
  | e1 = expr; EQ; e2 = expr { Binop(Eq, e1, e2) }
  | e1 = expr; LT; e2 = expr { Binop(Lt, e1, e2) }
  | e1 = expr; GT; e2 = expr { Binop(Gt, e1, e2) }
  | e1 = expr; LEQ; e2 = expr { Binop(Leq, e1, e2) }
  | e1 = expr; GEQ; e2 = expr { Binop(Geq, e1, e2) }
  | e1 = expr; NEQ; e2 = expr { Binop(Neq, e1, e2) }
  | e1 = expr; AND; e2 = expr { Binop(And, e1, e2) }
  | e1 = expr; OR; e2 = expr { Binop(Or, e1, e2) }
  | e1 = expr; COMMA; e2 = expr { Pair(e1, e2) }
  | e = app { e }
  ;

app:
  | e1 = app; e2 = base { App(e1, e2) } 
  | FST; e = base { Fst e }
  | SND; e = base { Snd e }
  | RAISE { Raise }
  | e = base { e }
  ;

base:
  | i = INT { Int i }
  | x = IDENT { Var x }
  | LPAREN; RPAREN { Unit }
  | LPAREN; e = mixfix; RPAREN { e }
  | TRUE { Bool true }
  | FALSE { Bool false }
  ;
