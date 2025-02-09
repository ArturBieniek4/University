open Ast

module H = Map.Make(String)

type heap = int H.t
type comp =
  | Heap of heap
  | Exn

let ( let* ) m f =
  match m with
  | Exn -> Exn
  | Heap v -> f v

let lookup_var heap x =
  match H.find_opt x heap with
  | Some v -> v
  | None   -> failwith ("Unbound variable " ^ x)

let assign_var heap x v : comp =
  match H.find_opt x heap with
  | Some _ -> Heap (H.add x v heap)
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
  | Int n -> n
  | Var x -> lookup_var heap x
  | Binop(op, e1, e2) ->
    eval_binop op (eval_aexp heap e1) (eval_aexp heap e2)

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
  | Bool b -> b
  | Cmp(op, e1, e2) ->
    eval_cmpop op (eval_aexp heap e1) (eval_aexp heap e2)
  | And(e1, e2) ->
    eval_bexp heap e1 && eval_bexp heap e2
  | Or(e1, e2) ->
    eval_bexp heap e1 || eval_bexp heap e2
  | Not e -> not (eval_bexp heap e)

let rec eval_stmt (heap : comp) s =
  match s with
  | Block ss    -> List.fold_left (fun v stmt -> match v with
    | Exn -> Exn
    | Heap v -> eval_stmt (Heap v) stmt) heap ss
  | Assgn(x, e) -> let* heap = heap in assign_var heap x (eval_aexp heap e)
  | If(e, s1, s2) ->
    let* heap2 = heap in 
    if eval_bexp heap2 e then eval_stmt heap s1
    else eval_stmt heap s2
  | While(e, s) ->
    eval_while heap e s
  | Read x ->
    let* heap = heap in 
    read_line () |> int_of_string |> assign_var heap x
  | Write e ->
    let* heap2 = heap in 
    eval_aexp heap2 e |> string_of_int |> print_endline;
    heap
  | Try(e1, e2) -> (match eval_stmt heap e1 with
  | Exn -> eval_stmt heap e2
  | Heap h -> Heap h)
  | Raise -> Exn

and eval_while heap e s =
  let* heap2 = heap in 
  if eval_bexp heap2 e then
    eval_while (eval_stmt heap s) e s
  else
    heap

let run_prog (xs, stmt) =
  let heap = Heap (List.fold_left declare_var H.empty xs) in
  let _ : _ = eval_stmt heap stmt in
  ()
