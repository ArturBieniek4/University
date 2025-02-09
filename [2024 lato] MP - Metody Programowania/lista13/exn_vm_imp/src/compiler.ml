open Ast
open Vm

let rec find_index (x : 'a) (xs : 'a list) : int option =
  match xs with
  | [] -> None
  | y :: ys -> if x = y then Some 0
               else Option.map (fun x -> x + 1) (find_index x ys)

type idx_env = ident list

let rec compile (e : expr) (env : idx_env) : cmd list =
  match e with
  | Int n -> [PushInt n]
  | Bool b -> [PushBool b]
  | Binop (op, e1, e2) ->
     compile e1 env @ compile e2 env @ [Prim op]
  | If (p, t, e) -> compile p env @ [CondJmp (compile t env, compile e env)]
  | Let (x, e1, e2) -> compile e1 env @ [Grab] @ compile e2 (x :: env) @ [EndLet]
  | Var x -> (match find_index x env with
              | Some i -> [Access i]
              | None -> failwith ("unbound var " ^ x))
  | Fun (x, e) -> [PushClo (compile e (x :: env) @ [Return])]
  | App (e1, e2) -> compile e2 env @ compile e1 env @ [Call]
  | Raise -> [Raise]
  | Try(e1, e2) ->
    [BeginTry(compile e1 env @ [EndTry], compile e2 env)]

let compile_prog p =
  compile p []
