open Ast

let parse (s : string) : expr =
  Parser.prog Lexer.read (Lexing.from_string s)

module M = Map.Make(String)

type env = value M.t

and value =
  | VInt of int
  | VBool of bool
  | VRef of int
  | VClosure of ident * expr * env

type heap = value list

let eval_op (op : bop) (v1 : value) (v2 : value) : value =
  match op, v1, v2 with
  | Add,  VInt i1, VInt i2 -> VInt (i1 + i2)
  | Sub,  VInt i1, VInt i2 -> VInt (i1 - i2)
  | Mult, VInt i1, VInt i2 -> VInt (i1 * i2)
  | Div,  VInt i1, VInt i2 -> VInt (i1 / i2)
  | Eq,   VInt i1, VInt i2 -> VBool (i1 = i2)
  | Lt,   VInt i1, VInt i2 -> VBool (i1 < i2)
  | Gt,   VInt i1, VInt i2 -> VBool (i1 > i2)
  | Leq,  VInt i1, VInt i2 -> VBool (i1 <= i2)
  | Geq,  VInt i1, VInt i2 -> VBool (i1 >= i2)
  | Neq,  VInt i1, VInt i2 -> VBool (i1 <> i2)
  | _ -> failwith "type error: eval_op"

let rec eval_env (env : env) (heap : heap) (e : expr) : (heap * value) =
  match e with
  | Int n -> heap, VInt n
  | Bool b -> heap, VBool b
  | If (p, t, e) ->
      (match eval_env env heap p with
      | heap, VBool true -> eval_env env heap t
      | heap, VBool false -> eval_env env heap e
      | _ -> failwith "type error")
  | Binop (And, e1, e2) ->
      (match eval_env env heap e1 with
      | heap, VBool true -> eval_env env heap e2
      | heap, VBool false -> heap, VBool false
      | _ -> failwith "type error")
  | Binop (Or, e1, e2) ->
      (match eval_env env heap e1 with
      | heap, VBool false -> eval_env env heap e2
      | heap, VBool true -> heap, VBool true
      | _ -> failwith "type error")
  | Binop (op, e1, e2) -> 
    let heap, v1 = eval_env env heap e1 in
    let heap, v2 = eval_env env heap e2 in
    heap, eval_op op v1 v2
  | Assgn (e1, e2, e3) -> (* e1 : e2; e3 *)
    (match (eval_env env heap e1) with
    | heap, VRef r -> 
      let heap,v2 = (eval_env env heap e2) in
      let heap = (List.mapi (fun i x -> if i=r then v2 else x) heap) in
      eval_env env heap e3
    | _ -> failwith "Type error: not a ref"
    )
  | Deref e ->
    (match (eval_env env heap e) with
    | heap, VRef r -> heap, (List.nth heap r)
    | _ -> failwith "Type error: not a ref"
    )
  | Let (x, e1, e2) ->
      let heap, r = eval_env env heap e1 in
      let new_env = M.add x r env in
      eval_env new_env heap e2
  | Var x ->
      (match M.find_opt x env with
      | Some v -> heap, v
      | None -> failwith ("unbound value " ^ x))
  | Fun (x, e) -> heap, VClosure (x, e, env)
  | App (e1, e2) ->
      let heap, v1 = eval_env env heap e1 in
      let heap, v2 = eval_env env heap e2 in
      (match v1, v2 with
      | VClosure (x, body, clo_env), v -> eval_env (M.add x v clo_env) heap body
      | _, _ -> failwith "type error")
  | Ref e -> heap @ [snd (eval_env env heap e)], VRef (List.length heap)

let initial_env = M.empty
  |> M.add "abs" (parse "fun x -> if x < 0 then 0 - x else x" |> eval_env M.empty [])
  |> M.add "mod" (parse "fun x -> fun y -> x - (x / y) * y" |> eval_env M.empty [])
  |> M.add "fix" (parse "fun f -> (fun x -> fun y -> f (x x) y) (fun x -> fun y -> f (x x) y)" |> eval_env M.empty [])

let eval e = let _,v = (eval_env M.empty [] e) in v

let interp (s : string) : value =
  eval (parse s)
