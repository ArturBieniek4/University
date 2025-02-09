let is_closed (e : expr) : bool =
  let rec it (env : env) (e : expr)=
  match e with
  | Int _ -> true
  | Bool _ -> true
  | If (p, t, e) -> (it env p && it env t && it env e)
  | Binop (_, e1, e2) -> it env e1 && it env e2
  | Let (x, e1, e2) -> let res_e1 = eval_env env e1 in
                        let new_env = M.update x (fun _ -> Some res_e1) env in
                        it new_env e2
  | Var x -> (match M.find_opt x env with
  | Some _ -> true
  | _ -> false)
  in it M.empty e