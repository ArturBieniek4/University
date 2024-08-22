(* abstract syntax tree *)

type bop = Mult | Div | Add | Sub | Eq | Lt | Lteq | Gt | Gteq | Neq | And | Or

type ident = string

type expr =
  | Int of int
  | Bool of bool
  | Binop of bop * expr * expr
  | If of expr * expr * expr                             
  | Var of ident
  | Let of ident * expr * expr
  | Sum of ident * expr * expr * expr