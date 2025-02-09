let rec alphaeq (e1 : expr) (e2 : expr) (env1 : env) (env2 : env) : bool =
  match e1, e2 with
  | Int a, Int b -> a = b
  | Bool a, Bool b -> a = b
  | Binop (bop1, e1, e2), Binop (bop2, e3, e4) ->
    bop1 = bop2 && alphaeq e1 e3 env1 env2 && alphaeq e2 e4 env1 env2
  | If (e_cond1, e1, e2), If (e_cond2, e3, e4) ->
    alphaeq e_cond1 e_cond2 env1 env2
    && alphaeq e1 e3 env1 env2
    && alphaeq e2 e4 env1 env2
  | Var a, Var b ->
    (match M.find_opt a env1, M.find_opt b env2 with
     | Some a2, Some b2 -> a2 = b && b2 = a
     | None, None -> a = b
     | _, _ -> false)
  | Let (id1, e1, e2), Let (id2, e3, e4) ->
    alphaeq e1 e3 env1 env2 && alphaeq e2 e4 (M.add id1 id2 env1) (M.add id2 id1 env2)
  | _, _ -> false