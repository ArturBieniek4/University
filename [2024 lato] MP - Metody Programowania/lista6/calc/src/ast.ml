(* abstract syntax tree *)

type bop = Mult | Div | Add | Sub | Eq | Lt | Lteq | Gt | Gteq | Neq

type expr =
  | Int of int
  | Bool of bool
  | Binop of bop * expr * expr
  | If of expr * expr * expr
  | And of expr * expr
  | Or of expr * expr
                               
