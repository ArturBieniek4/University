(* abstract syntax tree *)

type bop =
  | Mult
  | Div
  | Add
  | Sub
  | Eq
  | Lt
  | Gt
  | Leq
  | Geq
  | Neq

type ident = string

type expr =
  | Int of int
  | Bool of bool
  | Binop of bop * expr * expr
  | If of expr * expr * expr
  | Var of ident
  | Let of ident * expr * expr

module M = Map.Make (String)

type env = string M.t

(* CSE *)

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

let find_free_vars (e : expr) =
  let rec it e env free =
    match e with
    | Int _ -> free
    | Bool _ -> free
    | Binop (_, e1, e2) ->
      let free_e1 = it e1 env free
      and free_e2 = it e2 env free in
      free_e1 @ free_e2
    | If (cond, e1, e2) ->
      let free_cond = it cond env free
      and free_e1 = it e1 env free
      and free_e2 = it e2 env free in
      free_cond @ free_e1 @ free_e2
    | Var x -> if List.mem x env then free else x :: free
    | Let (x, _, e2) -> it e2 (x :: env) free
  in
  it e [] [] |> List.sort_uniq String.compare (* unikalne zmienne *)

let find_first_alphaeq e =
  let find_all_subtrees e =
    let rec it e =
      let add_if_subtree xs e =
        match e with
        | Int _ | Bool _ | Var _ -> xs
        | _ -> e :: xs
      in
      match e with
      | Int _ | Bool _ | Var _ -> []
      | Binop (_, e1, e2) ->
        add_if_subtree (add_if_subtree (List.concat_map it [ e1; e2 ]) e1) e2
      | Let (_, e1, e2) ->
        add_if_subtree (add_if_subtree (List.concat_map it [ e1; e2 ]) e1) e2
      | If (cond, e1, e2) ->
        add_if_subtree
          (add_if_subtree (add_if_subtree (List.concat_map it [ e1; e2; cond ]) e1) e2)
          cond
    in
    e :: it e
  in
  let exprs = find_all_subtrees e in
  let rec it1 i (es1 : expr list) =
    match es1 with
    | [] -> None
    | e1 :: es1' ->
      let rec it2 i j (es1' : expr list) (es2 : expr list) =
        match es2 with
        | [] -> it1 (i + 1) es1'
        | e2 :: es2' ->
          if i <> j
             && alphaeq e1 e2 M.empty M.empty
             && find_free_vars e1 = find_free_vars e2
          then Some (e1, e2)
          else it2 i (j + 1) es1' es2'
      in
      it2 i 0 es1' exprs
  in
  it1 0 exprs

let cse (e : expr) : expr option =
  let rec subst (e : expr) (f : expr -> bool) (v : expr) =
    match e with
    | _ when f e -> v
    | Int _ | Bool _ | Var _ -> e
    | Binop (op, e1, e2) -> Binop (op, subst e1 f v, subst e2 f v)
    | If (cond, e1, e2) -> If (subst cond f v, subst e1 f v, subst e2 f v)
    | Let (x, e1, e2) -> Let (x, subst e1 f v, subst e2 f v)
  in
  match find_first_alphaeq e with
  | None -> None
  | Some (e1, e2) ->
    let var = String.concat "" ("v0" :: find_free_vars e) in
    Some (Let (var, e1, subst e (fun x -> x = e1 || x = e2) (Var var)))

(* Chciałem przestrzegać wszystkich zaleceń z ostatniego wykładu, natomiast po umieszczeniu wszystkich funkcji (wywoływanych tylko w jednym miejscu) w ciele funkcji cse, kod stał się zupełnie nieczytelny, mam nadzieję, że jest to zrozumiałe *)
