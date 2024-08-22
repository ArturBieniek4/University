open Ast

exception Type_error
exception Unbound_var of ident

exception MyExn

module M = Map.Make(String)

type env = bool M.t

and value =
  | VUnit
  | VInt of int
  | VBool of bool
  | VClosure of ident * expr * env
  | VPair of value * value
  | VCtor of cname * value

let rec eval_env (env: env) (isfunc : bool) (e : expr) : bool =
  match e with
  | Unit  -> true
  | Int n -> true
  | Bool b -> true
  | Ctor(c, e) -> eval_env env isfunc e
  | If (p, t, e) ->
    (eval_env env isfunc p) && (eval_env env isfunc t) && (eval_env env isfunc e)
  | Binop (_, e1, e2) ->
    (eval_env env isfunc e1) && (eval_env env isfunc e2)
  | Let (x, e1, e2) ->
    (eval_env env isfunc e1) && (eval_env env isfunc e2)
  | LetRec (defs, e) ->
    let env = List.fold_left (fun env (x, e) -> M.add x true env) M.empty defs
    in List.fold_left (fun acc (x,e) -> eval_env env false e) true defs
  | Var x ->
      (match M.find_opt x env with
      | Some v -> isfunc
      | None -> true)
  | Fun (x, e) -> eval_env env true e
  | App (e1, e2) ->
      eval_env env isfunc e2
  | Pair(e1, e2) ->
      (eval_env env isfunc e1) && (eval_env env isfunc e2)
  | Fst e ->
      eval_env env isfunc e
  | Snd e ->
      eval_env env isfunc e
  | Raise -> true (* ? *)
  | Try(e1, e2) ->
      eval_env env isfunc e1 && eval_env env isfunc e2
  | Match(e, cs) ->
    List.fold_left (fun acc (p,e) -> eval_env env false e) true cs

let eval_prog = eval_env M.empty false

let rec string_of_value v =
  match v with
  | true  -> "true"
  | false -> "false"

let print_value v =
  print_endline (string_of_value v)
