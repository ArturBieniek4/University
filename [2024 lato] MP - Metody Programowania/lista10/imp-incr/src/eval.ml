open Ast

module H = Map.Make(String)

type heap = int H.t

let lookup_var heap x =
  match H.find_opt x heap with
  | Some v -> v
  | None   -> failwith ("Unbound variable " ^ x)

let assign_var heap x v =
  match H.find_opt x heap with
  | Some _ -> H.add x v heap
  | None   -> failwith ("Unbound variable " ^ x)

let declare_var heap x : heap =
  H.add x 0 heap

let eval_binop op =
  match op with
  | Mul -> ( * )
  | Div -> ( / )
  | Add -> ( + )
  | Sub -> ( - )

let rec eval_aexp heap e =
  match e with
  | Int  n -> (n, heap)
  | Var  x -> (lookup_var heap x, heap)
  | Incr x ->
    let v = lookup_var heap x in
    let heap = assign_var heap x (v+1) in
    (v, heap)
  | PreIncr x ->
    let v = lookup_var heap x + 1 in
    let heap = assign_var heap x v in
    (v, heap)
  | Binop(op, e1, e2) ->
    let (v1, heap) = eval_aexp heap e1 in
    let (v2, heap) = eval_aexp heap e2 in
    (eval_binop op v1 v2, heap)

let eval_cmpop op =
  match op with
  | Eq  -> ( = )
  | Neq -> ( <> )
  | Lt  -> ( < )
  | Gt  -> ( > )
  | Leq -> ( <= )
  | Geq -> ( >= )

let rec eval_bexp heap e =
  match e with
  | Bool b -> (b, heap)
  | Cmp(op, e1, e2) ->
    let (v1, heap) = eval_aexp heap e1 in
    let (v2, heap) = eval_aexp heap e2 in
    (eval_cmpop op v1 v2, heap)
  | And(e1, e2) ->
    let (v1, heap) = eval_bexp heap e1 in
    if v1 then eval_bexp heap e2
    else (false, heap)
  | Or(e1, e2) ->
    let (v1, heap) = eval_bexp heap e1 in
    if v1 then (true, heap)
    else eval_bexp heap e2
  | Not e ->
    let (v, heap) = eval_bexp heap e in
    (not v, heap)

let rec eval_stmt heap s =
  match s with
  | Block ss    -> List.fold_left eval_stmt heap ss
  | Assgn(x, e) ->
    let (v, heap) = eval_aexp heap e in
    assign_var heap x v
  | If(e, s1, s2) ->
    let (v, heap) = eval_bexp heap e in
    if v then eval_stmt heap s1
    else eval_stmt heap s2
  | While(e, s) ->
    eval_while heap e s
  | Read x ->
    read_line () |> int_of_string |> assign_var heap x
  | Write e ->
    let (v, heap) = eval_aexp heap e in
    v |> string_of_int |> print_endline;
    heap

and eval_while heap e s =
  let (v, heap) = eval_bexp heap e in
  if v then
    eval_while (eval_stmt heap s) e s
  else
    heap

let run_prog (xs, stmt) =
  let heap = List.fold_left declare_var H.empty xs in
  let _ : heap = eval_stmt heap stmt in
  ()
