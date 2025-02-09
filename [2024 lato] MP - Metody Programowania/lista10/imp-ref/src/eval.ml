open Ast

module H = Map.Make(String)

type env = int ref H.t

let lookup_var env x =
  match H.find_opt x env with
  | Some l -> !l
  | None   -> failwith ("Unbound variable " ^ x)

let assign_var env x v =
  match H.find_opt x env with
  | Some l -> l := v
  | None   -> failwith ("Unbound variable " ^ x)

let declare_var env x =
  H.add x (ref 0) env

let eval_binop op =
  match op with
  | Mul -> ( * )
  | Div -> ( / )
  | Add -> ( + )
  | Sub -> ( - )

let rec eval_aexp env e =
  match e with
  | Int n -> n
  | Var x -> lookup_var env x
  | Binop(op, e1, e2) ->
    eval_binop op (eval_aexp env e1) (eval_aexp env e2)

let eval_cmpop op =
  match op with
  | Eq  -> ( = )
  | Neq -> ( <> )
  | Lt  -> ( < )
  | Gt  -> ( > )
  | Leq -> ( <= )
  | Geq -> ( >= )

let rec eval_bexp env e =
  match e with
  | Bool b -> b
  | Cmp(op, e1, e2) ->
    eval_cmpop op (eval_aexp env e1) (eval_aexp env e2)
  | And(e1, e2) ->
    eval_bexp env e1 && eval_bexp env e2
  | Or(e1, e2) ->
    eval_bexp env e1 || eval_bexp env e2
  | Not e -> not (eval_bexp env e)

let rec eval_stmt env s =
  match s with
  | Block (vs, ss)    -> List.iter (eval_stmt (List.fold_left declare_var env vs)) ss
  | Assgn(x, e) -> assign_var env x (eval_aexp env e)
  | If(e, s1, s2) ->
    if eval_bexp env e then eval_stmt env s1
    else eval_stmt env s2
  | While(e, s) ->
    while eval_bexp env e do
      eval_stmt env s
    done
  | Read x ->
    read_line () |> int_of_string |> assign_var env x
  | Write e ->
    eval_aexp env e |> string_of_int |> print_endline

let run_prog (xs, stmt) =
  let env = List.fold_left declare_var H.empty xs in
  eval_stmt env stmt
