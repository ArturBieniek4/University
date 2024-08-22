open Ast

let parse (s : string) : expr =
  Parser.prog Lexer.read (Lexing.from_string s)

module M = Map.Make(String)

type env = string M.t

type value =
  | VInt of int
  | VBool of bool


  let rec alphaeq (e1 : expr) (e2 : expr) (env1 : env) (env2 : env) : bool=
  match e1, e2 with
  | Int a, Int b -> a=b
  | Bool a, Bool b -> a=b
  | Binop(bop1, e1, e2), Binop(bop2, e3, e4) -> bop1=bop2 && (alphaeq e1 e3 env1 env2) && (alphaeq e2 e4 env1 env2)
  | If(e_cond1, e1, e2), If(e_cond2, e3, e4) -> (alphaeq e_cond1 e_cond2 env1 env2) && (alphaeq e1 e3 env1 env2) && (alphaeq e2 e4 env1 env2)
  | Var a, Var b -> (
    match M.find_opt a env1, M.find_opt b env2 with
    | Some a2, Some b2 -> a2 = b && b2 = a
    | None, None -> a = b
    | _, _ -> false)
  | Let(id1,e1,e2), Let(id2,e3,e4) -> (alphaeq e1 e3 env1 env2) && (alphaeq e2 e4 (M.add id1 id2 env1) (M.add id2 id1 env2))
  | _, _ -> false

let find_free_vars (e: expr) =
  let rec it e env free = 
    match e with
    | Int _ -> free
    | Bool _ -> free
    | Binop(_, e1, e2) ->
        let free_e1 = it e1 env free
        and free_e2 = it e2 env free
        in free_e1 @ free_e2
    | If(cond, e1, e2) -> 
        let free_cond = it cond env free
        and free_e1 = it e1 env free
        and free_e2 = it e2 env free
        in free_cond @ free_e1 @ free_e2
    | Var x -> if List.mem x env then free else x::free
    | Let(x, _, e2) -> it e2 (x::env) free
  in it e [] [] |> List.sort_uniq String.compare (* unikalne zmienne *)


let find_all_subtrees e = 
  let rec it e (bound : ident list) : (ident list * expr) list =
    let add_if_subtree (xs : (ident list * expr) list) e bound = match e with
      | Int _| Bool _| Var _ -> xs
      | _ -> (bound,e)::xs
    in match e with
    | Int _| Bool _| Var _ -> []
    | Binop(_, e1, e2) -> add_if_subtree (add_if_subtree ((it e1 bound) @ (it e2 bound)) e1 bound) e2 bound
    | Let(x, e1, e2) -> add_if_subtree (add_if_subtree ((it e1 bound) @ (it e2 (x::bound))) e1 bound) e2 (x::bound)
    | If(cond, e1, e2) -> add_if_subtree (add_if_subtree (add_if_subtree ((it e1 bound) @ (it e2 bound)) e1 bound) e2 bound) cond bound
  in ([], e)::(it e []) 

let find_first_alphaeq e =
  let exprs = find_all_subtrees e in
  let rec it1 i (es1 : (ident list * expr) list) =
    match es1 with
    | [] -> None
    | e1 :: es1' ->
      let rec it2 i j (es1' : (ident list * expr) list) (es2 : (ident list * expr) list) =
        match es2 with
        | [] -> it1 (i+1) es1'
        | e2 :: es2' ->
          let bound1, e1 = e1
          and bound2, e2 = e2
          in if i <> j && alphaeq e1 e2 M.empty M.empty && find_free_vars e1 = find_free_vars e2
            && bound1 = bound2
          then Some (e1, e2)
          else it2 i (j+1) es1' es2'
      in it2 i 0 es1' exprs
  in it1 0 exprs

let cse (e : expr) : expr option=
  let rec subst (e : expr) (f : expr->bool) (v: expr) = 
    match e with
    | _ when f e -> v
    | Int _ | Bool _ | Var _ -> e
    | Binop(op, e1, e2) -> Binop(op, subst e1 f v, subst e2 f v)
    | If(cond, e1, e2) -> If(subst cond f v, subst e1 f v, subst e2 f v)
    | Let(x, e1, e2) -> Let(x, subst e1 f v, subst e2 f v)
  in match find_first_alphaeq e with
  | None -> None
  | Some (e1, e2) -> 
    let var = String.concat "" ("v0"::find_free_vars e)
    in Some(Let(var, e1, subst e (fun x -> x=e1 || x=e2) (Var var)))
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

type env2 = value M.t

let rec eval_env (env : env2) (e : expr) : value =
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
  | Var x -> (match M.find_opt x env with
  | Some v ->v
  | _ -> failwith ("unbound value " ^ x))
  (* | _ -> failwith "not implemented" *)

let interp (s : string) : value =
  eval_env (M.add "pi" (VInt 3) M.empty) (parse s)