%{
open Ast

let rec make_funs xs e =
  match xs with
  | x :: ys -> Fun(x, make_funs ys e)
  | [] -> e
%}

%token <int> INT
%token <string> IDENT
%token TIMES DIV PLUS MINUS
%token LPAREN RPAREN
%token FUN ARR
%token AND OR EQ LT GT LEQ GEQ NEQ
%token TRUE FALSE IF THEN ELSE LET IN
%token TRY WITH RAISE
%token EOF

%start <Ast.expr> prog

%nonassoc AND OR
%nonassoc EQ NEQ LT GT LEQ GEQ
%left PLUS MINUS
%left TIMES DIV

%%

prog:
  | e = mixfix; EOF { e }
  ;
  
idents:
  | x = IDENT; xs = idents { x :: xs }
  | x = IDENT { [x] }
  ;

mixfix:
  | IF; e1 = mixfix; THEN; e2 = mixfix; ELSE; e3 = mixfix { If(e1, e2, e3) }
  | LET; x = IDENT; EQ; e1 = mixfix; IN; e2 = mixfix { Let(x, e1, e2) }
  | FUN; xs = idents; ARR; e = mixfix { make_funs xs e }
  | TRY; e1 = mixfix; WITH; e2 = mixfix { Try(e1, e2) }
  | e = expr { e }
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
  | e = app { e }
  ;

app:
  | e1 = app; e2 = base { App(e1, e2) } 
  | RAISE { Raise }
  | e = base { e }
  ;

base:
  | i = INT { Int i }
  | x = IDENT { Var x }
  | LPAREN; e = mixfix; RPAREN { e }
  | TRUE { Bool true }
  | FALSE { Bool false }
  ;
