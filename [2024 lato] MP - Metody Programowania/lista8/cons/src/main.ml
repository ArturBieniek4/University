open Ast

let parse (s : string) : expr =
  Parser.prog Lexer.read (Lexing.from_string s)

module M = Map.Make(String)

type env = value M.t

and value =
  | VInt of int
  | VBool of bool
  | VClosure of (value -> value)
  | VPair of value * value

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
  | _ -> failwith "type error"

let rec eval_env (env : env) (e : expr) : value =
  match e with
  | Int n -> VInt n
  | Bool b -> VBool b
  | If (p, t, e) ->
      (match eval_env env p with
      | VBool true -> eval_env env t
      | VBool false -> eval_env env e
      | _ -> failwith "type error")
  | Binop (And, e1, e2) ->
      (match eval_env env e1 with
      | VBool true -> eval_env env e2
      | VBool false -> VBool false
      | _ -> failwith "type error")
  | Binop (Or, e1, e2) ->
      (match eval_env env e1 with
      | VBool false -> eval_env env e2
      | VBool true -> VBool true
      | _ -> failwith "type error")
  | Binop (op, e1, e2) -> eval_op op (eval_env env e1) (eval_env env e2)
  | Let (x, e1, e2) ->
      let r = eval_env env e1 in
      let new_env = M.add x r env in
      eval_env new_env e2
  | Var x ->
      (match M.find_opt x env with
      | Some v -> v
      | None -> failwith ("unbound value " ^ x))
  | Fun (x, e) -> VClosure (fun v -> eval_env (M.add x v env) e)
  | App (e1, e2) ->
      (match eval_env env e1, eval_env env e2 with
      | VClosure f, v -> f v
      | _, _ -> failwith "type error")

(* std lib *)

let _cons v1 = VClosure (fun v2 -> VPair (v1, v2))

let _fst v = match v with
  | VPair (v, _) -> v
  | _ -> failwith "type error" 

let _snd v = match v with
  | VPair (_, v) -> v
  | _ -> failwith "type error"

let _is_pair v = match v with
  | VPair _ -> VBool true 
  | _ -> VBool false

let initial_env = M.empty
  |> M.add "abs" (parse "fun x -> if x < 0 then 0 - x else x" |> eval_env M.empty)
  |> M.add "mod" (parse "fun x -> fun y -> x - (x / y) * y" |> eval_env M.empty)
  |> M.add "fix" (parse "fun f -> (fun x -> fun y -> f (x x) y) (fun x -> fun y -> f (x x) y)" |> eval_env M.empty)
  |> M.add "cons" (VClosure _cons)
  |> M.add "fst" (VClosure _fst)
  |> M.add "snd" (VClosure _snd)
  |> M.add "ispair" (VClosure _is_pair)

(* e.g.

interp {|
let insert = fix (fun insert -> fun x -> fun xs -> if ispair xs then if x > fst xs then cons (fst xs) (insert x (snd xs)) else cons x xs else cons x false) in
let sort = fix (fun sort -> fun xs -> if ispair xs then insert (fst xs) (sort (snd xs)) else false) in
sort (cons 4 (cons 2 (cons 5 (cons 1 false))))
|};;

*)

let eval : expr -> value = eval_env initial_env 

let interp (s : string) : value =
  eval (parse s)
