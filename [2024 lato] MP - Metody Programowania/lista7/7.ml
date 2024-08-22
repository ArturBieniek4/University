type ident = string

type qbf =
  | Top
  | Bot
  | Var of ident
  | Forall of ident * qbf
  | Exists of ident * qbf
  | Not of qbf
  | Conj of qbf * qbf
  | Disj of qbf * qbf

(* Zad 6. *)

module M = Map . Make ( String )
type env = bool M.t
let rec eval_env ( env : env ) (f : qbf ) : bool =
  match f with
  | Top -> true
  | Bot -> false
  | Var x -> (match M.find_opt x env with
  | Some v -> v
  | _ -> failwith ("unbound value " ^ x))
  | Forall(x, expr) -> eval_env (M.add x true env) expr && eval_env (M.add x false env) expr
  | Exists(x, expr) -> eval_env (M.add x true env) expr || eval_env (M.add x false env) expr
  | Not expr -> if (eval_env env expr)=true then false else true
  | Conj(expr1, expr2) -> eval_env env expr1 && eval_env env expr2
  | Disj(expr1, expr2) -> eval_env env expr1 || eval_env env expr2;;
eval_env M.empty (Forall("y", Disj(Var "y", Not (Var "y"))));;