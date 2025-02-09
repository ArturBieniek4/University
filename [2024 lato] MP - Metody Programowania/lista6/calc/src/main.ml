open Ast

let parse (s : string) : expr =
  Parser.prog Lexer.read (Lexing.from_string s)

type value =
  | VInt of int
  | VBool of bool

let eval_op (op : bop) (v1 : value) (v2 : value) : value =
  match op, v1, v2 with
  | Add,  VInt i1, VInt i2 -> VInt ((i1 + i2) mod 5)
  | Sub,  VInt i1, VInt i2 -> VInt ((i1 - i2) mod 5)
  | Mult, VInt i1, VInt i2 -> VInt ((i1 * i2) mod 5)
  | Div,  VInt i1, VInt i2 -> VInt ((i1 / i2) mod 5)
  | Eq,   VInt i1, VInt i2 -> VBool (i1 mod 5 = i2 mod 5)
  | Lt,   VInt i1, VInt i2 -> VBool (i1 mod 5 < i2 mod 5)
  | Lteq,   VInt i1, VInt i2 -> VBool (i1 mod 5 <= i2 mod 5)
  | Gt,   VInt i1, VInt i2 -> VBool (i1 mod 5 > i2 mod 5)
  | Gteq,   VInt i1, VInt i2 -> VBool (i1 mod 5 >= i2 mod 5)
  | Neq,   VInt i1, VInt i2 -> VBool (i1 mod 5 != i2 mod 5)
  | _ -> failwith "type error"

let rec eval (e : expr) : value =
  match e with
  | Int n -> VInt n
  | Bool b -> VBool b
  | If (p, t, e) ->
      (match eval p with
      | VBool true -> eval t
      | VBool false -> eval e
      | _ -> failwith "type error")
  | Binop (op, e1, e2) -> eval_op op (eval e1) (eval e2)
  | And (e1, e2) -> if (eval e1)=VBool true then (eval e2) else VBool false
  | Or (e1, e2) -> if (eval e1)=VBool true then VBool true else (eval e2)

let interp (s : string) : value =
  eval (parse s)

