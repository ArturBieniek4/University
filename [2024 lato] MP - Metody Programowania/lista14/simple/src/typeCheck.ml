open Ast

module M = Map.Make(String)

type env = tp M.t

let env_empty = M.empty
let env_add env x tp = M.add x tp env
let env_lookup env x = M.find_opt x env

let rec infer_type env (e : expr) =
  match e with
  | Unit   -> TUnit
  | Int  _ -> TInt
  | Bool _ -> TBool
  | Var  x ->
    (match env_lookup env x with
    | Some tp -> tp
    | None    -> failwith ("Unbound variable " ^ x))
  | Let (x, e1, e2) ->
    let tp = infer_type env e1 in
    infer_type (env_add env x tp) e2
  | Fun (x, tp1, e) ->
    TArr(tp1, infer_type (env_add env x tp1) e)
  | App (e1, e2) ->
    (match infer_type env e1 with
    | TArr(tp', tp) ->
      check_type env e2 tp';
      tp
    | _ -> failwith "type error")
  | Pair(e1, e2) -> TPair(infer_type env e1, infer_type env e2)
  | Fst(p) -> (match p with
    | Pair(e1, _) -> infer_type env e1
    | _ -> failwith "type error")
  | Snd(p) -> (match p with
    | Pair(_, e2) -> infer_type env e2
    | _ -> failwith "type error")

and check_type env e tp =
  let tp' = infer_type env e in
  if tp = tp' then ()
  else
    failwith "type error"

let check_program p =
  let _ : tp = infer_type env_empty p in
  p
