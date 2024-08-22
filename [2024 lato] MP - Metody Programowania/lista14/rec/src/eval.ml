open Ast

exception Type_error
exception Unbound_var of ident

exception MyExn

module M = Map.Make(String)

type env = value option ref M.t

and value =
  | VUnit
  | VInt of int
  | VBool of bool
  | VClosure of ident * expr * env
  | VPair of value * value
  | VCtor of cname * value

let env_empty = M.empty
let env_add env x v = M.add x (ref (Some v)) env
let env_add_undef env x =
  let r = ref None in
  (M.add x r env, r)
let env_lookup env x =
  match M.find_opt x env with
  | None -> None
  | Some r ->
    match !r with
    | Some v -> Some v
    | None   -> failwith "Non-productive recursive definition"

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
  | _ -> raise Type_error

let rec match_pattern env v p =
  match v, p with
  | _,       PWildcard  -> Some env
  | VUnit,   PUnit      -> Some env
  | _,       PUnit      -> None
  | VInt n,  PInt m when n = m -> Some env
  | _,       PInt _     -> None
  | VBool x, PBool y when x = y -> Some env
  | _,       PBool _    -> None
  | _,       PVar  x    -> Some (env_add env x v)
  | VCtor(c1, v), PCtor(c2, p) when c1 = c2 ->
    match_pattern env v p
  | _, PCtor _ -> None
  | VPair(v1, v2), PPair(p1, p2) ->
    (match match_pattern env v1 p1 with
    | None -> None
    | Some env -> match_pattern env v2 p2)
  | _, PPair _ -> None

let rec eval_env (env : env) (e : expr) : value =
  match e with
  | Unit  -> VUnit
  | Int n -> VInt n
  | Bool b -> VBool b
  | Ctor(c, e) -> VCtor(c, eval_env env e)
  | If (p, t, e) ->
      (match eval_env env p with
      | VBool true -> eval_env env t
      | VBool false -> eval_env env e
      | _ -> raise Type_error)
  | Binop (And, e1, e2) ->
      (match eval_env env e1 with
      | VBool true -> eval_env env e2
      | VBool false -> VBool false
      | _ -> raise Type_error)
  | Binop (Or, e1, e2) ->
      (match eval_env env e1 with
      | VBool false -> eval_env env e2
      | VBool true -> VBool true
      | _ -> raise Type_error)
  | Binop (op, e1, e2) -> eval_op op (eval_env env e1) (eval_env env e2)
  | Let (x, e1, e2) ->
      let r = eval_env env e1 in
      let new_env = env_add env x r in
      eval_env new_env e2
  | LetRec (defs, e) ->
    let (env, defs) =
      List.fold_left_map
        (fun env (x, e) ->
          let (env, r) = env_add_undef env x in
          (env, (r, e)))
        env
        defs
    in
    List.iter (fun (r, e) -> r := Some (eval_env env e)) defs;
    eval_env env e
  | Var x ->
      (match env_lookup env x with
      | Some v -> v
      | None -> raise (Unbound_var x))
  | Fun (x, e) -> VClosure (x, e, env)
  | App (e1, e2) ->
      (match eval_env env e1, eval_env env e2 with
      | VClosure (x, body, clo_env), v -> eval_env (env_add clo_env x v) body
      | _, _ -> raise Type_error)
  | Pair(e1, e2) ->
      VPair(eval_env env e1, eval_env env e2)
  | Fst e ->
      (match eval_env env e with
      | VPair(v1, _) -> v1
      | _ -> raise Type_error)
  | Snd e ->
      (match eval_env env e with
      | VPair(_, v2) -> v2
      | _ -> raise Type_error)
  | Raise -> raise MyExn
  | Try(e1, e2) ->
      (try eval_env env e1 with
      | MyExn -> eval_env env e2)
  | Match(e, cs) ->
    match_clauses env (eval_env env e) cs

and match_clauses env v cs =
  match cs with
  | [] -> failwith "match failure"
  | (p, e) :: cs ->
    match match_pattern env v p with
    | Some env -> eval_env env e
    | None -> match_clauses env v cs

let eval_prog = eval_env env_empty

let rec string_of_value v =
  match v with
  | VUnit       -> "()"
  | VInt n      -> string_of_int n
  | VBool true  -> "true"
  | VBool false -> "false"
  | VClosure _  -> "<fun>"
  | VPair(v1, v2) ->
    "(" ^ string_of_value v1 ^ ", " ^ string_of_value v2 ^ ")"
  | VCtor(c, v) -> c ^ "(" ^ string_of_value v ^ ")"

let print_value v =
  print_endline (string_of_value v)
