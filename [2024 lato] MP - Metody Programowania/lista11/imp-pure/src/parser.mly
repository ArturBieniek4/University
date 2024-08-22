%token <int> INT
%token <string> IDENT
%token TIMES DIV PLUS MINUS
%token EQ NEQ LT GT LEQ GEQ
%token AND OR NOT
%token ASSGN LPAREN RPAREN
%token BEGIN TRY WITH RAISE END IF THEN ELSE WHILE DO READ WRITE VAR SKIP TRUE FALSE
%token EOF

%start <Ast.prog> prog

%{
open Ast
%}

%right OR
%right AND
%right NOT
%left PLUS MINUS
%left TIMES DIV

%%

aexp:
  | n=INT   { Int n }
  | x=IDENT { Var x }
  | LPAREN; e=aexp; RPAREN { e }
  | e1=aexp; PLUS;  e2=aexp { Binop(Add, e1, e2) }
  | e1=aexp; MINUS; e2=aexp { Binop(Sub, e1, e2) }
  | e1=aexp; TIMES; e2=aexp { Binop(Mul, e1, e2) }
  | e1=aexp; DIV;   e2=aexp { Binop(Div, e1, e2) }
  ;

cmpop:
  | EQ  { Eq  }
  | NEQ { Neq }
  | LT  { Lt  }
  | GT  { Gt  }
  | LEQ { Leq }
  | GEQ { Geq }
  ;

bexp:
  | TRUE  { Bool true  }
  | FALSE { Bool false }
  | LPAREN; e=bexp; RPAREN { e }
  | e1=aexp; op=cmpop; e2=aexp { Cmp(op, e1, e2) }
  | e1=bexp; AND; e2=bexp { And(e1, e2) }
  | e1=bexp; OR;  e2=bexp { Or(e1, e2)  }
  | NOT; e=bexp { Not e }
  ;

stmt:
  | SKIP { Block [] }
  | BEGIN s=list(stmt) END { Block s }
  | x=IDENT; ASSGN e=aexp { Assgn(x, e) }
  | IF; c=bexp; THEN; s1=stmt; ELSE; s2=stmt { If(c, s1, s2) }
  | WHILE; c=bexp; DO; s=stmt { While(c, s) }
  | READ; x=IDENT { Read x }
  | WRITE; e=aexp { Write e }
  | TRY; e1=stmt; WITH; e2=stmt { Try(e1, e2) }
  | RAISE; { Raise }
  ;

var_decl:
  | VAR; x=IDENT { x }
  ;

prog:
  | vs=list(var_decl); s=stmt; EOF { (vs, s) }
  ;
