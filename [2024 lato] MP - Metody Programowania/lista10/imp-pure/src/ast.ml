type binop = Mul | Div | Add | Sub
type cmpop = Eq | Neq | Lt | Gt | Leq | Geq

type var = string

type aexp =
  | Int   of int
  | Var   of var
  | Binop of binop * aexp * aexp

type bexp =
  | Bool of bool
  | Cmp  of cmpop * aexp * aexp
  | And  of bexp * bexp
  | Or   of bexp * bexp
  | Not  of bexp

type stmt =
  | Block of var list * stmt list
  | Assgn of var * aexp
  | If    of bexp * stmt * stmt
  | While of bexp * stmt
  | Read  of var
  | Write of aexp

type prog = var list * stmt
