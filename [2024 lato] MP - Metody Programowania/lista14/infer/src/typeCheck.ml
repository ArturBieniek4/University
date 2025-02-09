open Ast

module M = Map.Make(String)

type env = tp M.t
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

let rec occurs x (tp : tp) =
  match tp_view tp with
  | TUVar y -> uvar_equal x y
  | TInt | TBool | TUnit -> false
  | TArr(tp1, tp2) ->
    occurs x tp1 || occurs x tp2

let rec unify_type tp1 tp2 =
  match tp_view tp1, tp_view tp2 with
  | TRaise, _ -> ()
  | _, TRaise -> ()
  | TUVar x, TUVar y when uvar_equal x y -> ()
  | TUVar x, _ ->
    if occurs x tp2 then failwith "unification error"
    else set_uvar x tp2
  | _, TUVar x ->
    if occurs x tp1 then failwith "unification error"
    else set_uvar x tp1
  | TInt, TInt -> ()
  | TInt, _    -> failwith "unification error"
  | TBool, TBool -> ()
  | TBool, _    -> failwith "unification error"
  | TUnit, TUnit -> ()
  | TUnit, _    -> failwith "unification error"
  | TArr(ta1, tb1), TArr(ta2, tb2) ->
    unify_type ta1 ta2;
    unify_type tb1 tb2
  | TArr _, _    -> failwith "unification error"

let rec infer_type env (e : expr) =
  match e with
  | Unit   -> t_unit
  | Int  _ -> t_int
  | Bool _ -> t_bool
  | Raise -> t_raise
  | Var  x ->
    (match env_lookup env x with
    | Some tp -> tp
    | None    -> failwith ("Unbound variable " ^ x))
  | Let (x, e1, e2) ->
    let tp = infer_type env e1 in
    infer_type (env_add env x tp) e2
  | Fun (x, tp1, e) ->
    t_arr tp1 (infer_type (env_add env x tp1) e)
  | App (e1, e2) ->
    (match tp_view (infer_type env e1) with
    | TArr(tp', tp) ->
      check_type env e2 tp';
      tp
    | TUVar r ->
      let tp' = fresh_uvar () in
      let tp  = fresh_uvar () in
      set_uvar r (t_arr tp' tp);
      check_type env e2 tp';
      tp
    | _ -> failwith "type error")
  | Binop(Or, e1, e2) | Binop(And, e1, e2) -> (match (tp_view (infer_type env e1)),(tp_view (infer_type env e2)) with
    | TBool, TBool | TBool, TRaise | TRaise, TBool | TRaise, TRaise -> t_bool
    | _ -> failwith "type error")
  | If(p, t, e) -> (match (tp_view (infer_type env p), (infer_type env t), (infer_type env e)) with
    | TRaise, tp, e -> unify_type tp e; tp
    | TBool, tp, e -> (match (tp_view tp, tp_view e) with
    | (TRaise, TRaise) -> t_raise
    | (TRaise, _) -> e
    | (_, TRaise) -> tp
    | _ -> failwith "type error")
    | _ -> failwith "type error")
  | Pair(e1, e2) -> t_pair (infer_type env e1) (infer_type env e2)
  | Fst(p) -> (match p with
    | Pair(e1, _) -> infer_type env e1
    | _ -> failwith "type error")
  | Snd(p) -> (match p with
    | Pair(_, e2) -> infer_type env e2
    | _ -> failwith "type error")
  | Try(e1, e2) -> check_type env e1 (infer_type env e2); (infer_type env e2)
  | LetRec(defs, e) ->
    let env = List.fold_left (fun env (x, _) -> let (env, r) = env_add env x fresh_uvar() in env) env defs in
     (* Teraz sprawdzamy typy definicji w rozszerzonym środowisku *)
    let defs = List.map (fun (x, e) ->
      let tp = infer_type env e in
      let env = env_add env x tp in
      (x, tp)) defs in

    (* Weryfikujemy typy w rozszerzonym środowisku *)
    List.iter (fun (x, tp) -> unify_type (match env_lookup env x with
    | Some tp -> tp
    | None    -> failwith ("Unbound variable " ^ x)) tp) defs;

    (* W końcu sprawdzamy typ wyrażenia e w rozszerzonym środowisku *)
    infer_type env e
  | _ -> failwith "not implemented typecheck"

and check_type env e tp =
  let tp' = infer_type env e in
  unify_type tp tp'

let check_program p =
  let _ : tp = infer_type env_empty p in
  p
