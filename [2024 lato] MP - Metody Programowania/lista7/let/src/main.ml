open Ast

let parse (s : string) : expr =
  Parser.prog Lexer.read (Lexing.from_string s)

type value =
  | VInt of int
  | VBool of bool

let eval_op (op : bop) (v1 : value) (v2 : value) : value =
  match op, v1, v2 with
  | Add,  VInt i1, VInt i2 -> VInt ((i1 + i2))
  | Sub,  VInt i1, VInt i2 -> VInt ((i1 - i2))
  | Mult, VInt i1, VInt i2 -> VInt ((i1 * i2))
  | Div,  VInt i1, VInt i2 -> VInt ((i1 / i2))
  | Eq,   VInt i1, VInt i2 -> VBool (i1 = i2)
  | Lt,   VInt i1, VInt i2 -> VBool (i1 < i2)
  | Lteq,   VInt i1, VInt i2 -> VBool (i1 <= i2)
  | Gt,   VInt i1, VInt i2 -> VBool (i1 > i2)
  | Gteq,   VInt i1, VInt i2 -> VBool (i1 >= i2)
  | Neq,   VInt i1, VInt i2 -> VBool (i1 != i2)
  | _ -> failwith "type error"

(*
let rec subst (x : ident) (s : expr) (e: expr) =
  match e with
  | If (p,t,e) -> If (subst x s p, subst x s t, subst x s e)
  | Binop (op, e1, e2) -> Binop (op, subst x s e1, subst x s e2)
  | Var y -> if y=x then s else Var y
  | Let (y, e1, e2) -> if y=x
    then Let (y, subst x s e1, e2)
    else Let(y, subst x s e1, subst x s e2)
  | _ -> e

let expr_of_value (v:value) : expr =
  match v with
  | VInt n -> Int n
  | VBool b -> Bool b

let rec eval (e : expr) : value =
  match e with
  | Int n -> VInt n
  | Bool b -> VBool b
  | If (p, t, e) ->
      (match eval p with
      | VBool true -> eval t
      | VBool false -> eval e
      | _ -> failwith "type error")
  | Binop (And,e1, e2) -> if (eval e1)=VBool true then (eval e2) else VBool false
  | Binop (Or, e1, e2) -> if (eval e1)=VBool true then VBool true else (eval e2)
  | Binop (op, e1, e2) -> eval_op op (eval e1) (eval e2)
  | Var x -> failwith ("unbound value " ^ x)
  | Let (x, e1, e2) -> eval (subst x (expr_of_value(eval e1)) e2)
  (* | _ -> failwith "not implemented" *)

let interp (s : string) : value =
  eval (parse s)

*)

module M = Map.Make(String)

type env = value M.t

let rec eval_env (env : env) (e : expr) : value =
  match e with
  | Int n -> VInt n
  | Bool b -> VBool b
  | If (p, t, e) ->
      (match eval_env env p with
      | VBool true -> eval_env env t
      | VBool false -> eval_env env e
      | _ -> failwith "type error")
  | Binop (And,e1, e2) -> if (eval_env env e1)=VBool true then (eval_env env e2) else VBool false
  | Binop (Or, e1, e2) -> if (eval_env env e1)=VBool true then VBool true else (eval_env env e2)
  | Binop (op, e1, e2) -> eval_op op (eval_env env e1) (eval_env env e2)
  | Let (x, e1, e2) -> let res_e1 = eval_env env e1 in
                        let new_env = M.update x (fun _ -> Some res_e1) env in
                        eval_env new_env e2

  | Sum (x, e1, e2, e3) -> let res_e1 = eval_env env e1 and res_e2 = eval_env env e2 in
  (match res_e1, res_e2 with 
  | VInt n, VInt m -> 
    (let rec it (n:int) (acc:int) = 
      let new_env = M.update x (fun _ -> Some (VInt n) ) env in
      let res = eval_env new_env e3 in
      match res with
      | VInt x -> if n=m then acc+x else it (n+1) acc+x
      | _ -> failwith ("type error")
    in VInt (it n 0))
  | _ -> failwith ("type error"))

  | Var x -> (match M.find_opt x env with
  | Some v ->v
  | _ -> failwith ("unbound value " ^ x))
  (* | _ -> failwith "not implemented" *)

let interp (s : string) : value =
  eval_env (M.add "pi" (VInt 3) M.empty) (parse s)