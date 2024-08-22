open Ast

module M = Map.Make(String)

exception Unbound_var of ident

type env = value M.t

and value =
  | VInt of int
  | VBool of bool
  | VClosure of ident * expr * env
  | VPair of value * value

type comp =
  | Value of value
  | Exn of value

exception MyExn of value

let ( let* ) m f =
  match m with
  | Exn err -> Exn err
  | Value v -> f v

let return x = Value x

let rec translate_prog (e : expr) (cnt : int) (ids: int M.t) : (expr * int M.t) =
  match e with
  | Int n -> (Int n, ids)
  | Bool b -> Bool b, ids
  | If (p, t, e) ->
        let p, ids = translate_prog p (cnt*10+1) ids
        in let t, ids = translate_prog t (cnt*10+2) ids
        in let e, ids = translate_prog e (cnt*10+3) ids in
      If(p, t, e), ids
  | Binop (And, e1, e2) ->
        let e1, ids = translate_prog e1 (cnt*10+1) ids
        in let e2, ids = translate_prog e2 (cnt*10+2) ids in
      Binop(And, e1, e2), ids
  | Binop (Or, e1, e2) ->
    let e1, ids = translate_prog e1 (cnt*10+1) ids
in let e2, ids = translate_prog e2 (cnt*10+2) ids in
Binop(Or, e1, e2), ids
  | Binop (op, e1, e2) ->
    let e1, ids = translate_prog e1 (cnt*10+1) ids
in let e2, ids = translate_prog e2 (cnt*10+2) ids in
Binop(op, e1, e2), ids
  | Let (x, e1, e2) ->
    let e1, ids = translate_prog e1 (cnt*10+1) ids
in let e2, ids = translate_prog e2 (cnt*10+2) ids in
Let(x, e1, e2), ids
  | Var x -> Var x, ids
  | Fun (x, e) -> let e, ids = translate_prog e (cnt*10+1) ids in
    Fun(x, e), ids
  | App (e1, e2) ->
    let e1, ids = translate_prog e1 (cnt*10+1) ids
in let e2, ids = translate_prog e2 (cnt*10+2) ids in
App(e1, e2), ids
  | Pair(e1, e2) ->
    let e1, ids = translate_prog e1 (cnt*10+1) ids
in let e2, ids = translate_prog e2 (cnt*10+2) ids in
Pair(e1, e2), ids
  | Fst e ->
    let e, ids = translate_prog e (cnt*10+1) ids in
Fst(e), ids
  | Snd e ->
    let e, ids = translate_prog e (cnt*10+1) ids in
    Snd(e), ids
  | Raise _ -> failwith "Raise in translation"
  | RaiseLegacy id -> (match M.find_opt id ids with
    | Some v -> Raise (Int v), ids
    | None -> Raise (Int cnt), ids)
    (* Legacy: try raise A with B -> C (A, B, C) *)
    (* Zad5: try raise 1 with B -> C *)
    (* Jeżeli rzuci, to evalujemy e2 z 1 wstawioną za err *)
  | Try(e1, err, e2) ->
        let new_ids = M.add err (cnt*10+1) ids in
        let e1, _ = translate_prog e1 (cnt*10+1) new_ids in
        let e2, ids2 = translate_prog e2 (cnt*10+1) new_ids in
        Try(e1, "error_code", (If(
          Binop(Eq, Var "error_code",
          Int (cnt*10+1)),
        e2, Raise (Var "error_code")))),
      ids2

let eval_op (op : bop) (v1 : value) (v2 : value) : comp =
  match op, v1, v2 with
  | Add,  VInt i1, VInt i2 -> return (VInt (i1 + i2))
  | Sub,  VInt i1, VInt i2 -> return (VInt (i1 - i2))
  | Mult, VInt i1, VInt i2 -> return (VInt (i1 * i2))
  | Div,  VInt i1, VInt i2 -> return (VInt (i1 / i2))
  | Eq,   VInt i1, VInt i2 -> return (VBool (i1 = i2))
  | Lt,   VInt i1, VInt i2 -> return (VBool (i1 < i2))
  | Gt,   VInt i1, VInt i2 -> return (VBool (i1 > i2))
  | Leq,  VInt i1, VInt i2 -> return (VBool (i1 <= i2))
  | Geq,  VInt i1, VInt i2 -> return (VBool (i1 >= i2))
  | Neq,  VInt i1, VInt i2 -> return (VBool (i1 <> i2))
  | _ -> Exn (VInt (-1))

let rec eval_env (env : env) (e : expr) : comp =
  match e with
  | Int n -> return (VInt n)
  | Bool b -> return (VBool b)
  | If (p, t, e) ->
      let* c = eval_env env p in
      (match c with
      | VBool true -> eval_env env t
      | VBool false -> eval_env env e
      | _ -> Exn (VInt (-1)))
  | Binop (And, e1, e2) ->
      let* c = eval_env env e1 in
      (match c with
      | VBool true -> eval_env env e2
      | VBool false -> return (VBool false)
      | _ -> Exn (VInt (-1)))
  | Binop (Or, e1, e2) ->
      let* c = eval_env env e1 in
      (match c with
      | VBool false -> eval_env env e2
      | VBool true -> return (VBool true)
      | _ -> Exn (VInt (-1)))
  | Binop (op, e1, e2) ->
      let* v1 = eval_env env e1 in
      let* v2 = eval_env env e2 in
      eval_op op v1 v2
  | Let (x, e1, e2) ->
      let* r = eval_env env e1 in
      let new_env = M.add x r env in
      eval_env new_env e2
  | Var x ->
      return
        (match M.find_opt x env with
        | Some v -> v
        | None -> raise (Unbound_var x))
  | Fun (x, e) -> return (VClosure (x, e, env))
  | App (e1, e2) ->
      (* ( let* ) (eval_env env e1) (fun v1 -> ... ) *)
      let* v1 = eval_env env e1 in
      let* v2 = eval_env env e2 in
      (match v1 with
      | VClosure (x, body, clo_env) ->
        eval_env (M.add x v2 clo_env) body
      | _ -> Exn (VInt (-1)))
  | Pair(e1, e2) ->
      let* v1 = eval_env env e1 in
      let* v2 = eval_env env e2 in
      return (VPair(v1, v2))
  | Fst e ->
      let* v = eval_env env e in
      (match v with
      | VPair(v1, _) -> return v1
      | _ -> Exn (VInt (-1)))
  | Snd e ->
      let* v = eval_env env e in
      (match v with
      | VPair(_, v2) -> return v2
      | _ -> Exn (VInt (-1)))
  | Raise err -> let* e = (eval_env env err) in Exn e
  | RaiseLegacy _ -> failwith "Untranslated RaiseLegacy!"
  | Try(e1, err, e2) ->
      (match eval_env env e1 with
      | Exn err2 -> eval_env (M.add err err2 env) e2
      | Value v -> return v)

let eval_prog p =
  match eval_env M.empty p with
  | Exn err -> raise (MyExn err)
  | Value v -> v

let rec string_of_value v =
  match v with
  | VInt n      -> string_of_int n
  | VBool true  -> "true"
  | VBool false -> "false"
  | VClosure _  -> "<fun>"
  | VPair(v1, v2) ->
    "(" ^ string_of_value v1 ^ ", " ^ string_of_value v2 ^ ")"

let print_value v =
  print_endline (string_of_value v)
