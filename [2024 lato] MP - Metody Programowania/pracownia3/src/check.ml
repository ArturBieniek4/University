open Ast

module StrSet = Set.Make(String)
module StrMap = Map.Make(String)

let collect_var vs x =
  if StrSet.mem x vs then begin
    Printf.eprintf "Variable %s is defined more than once\n" x;
    raise InfLib.Fatal_error
  end else StrSet.add x vs

let collect_vars vars =
  List.fold_left collect_var StrSet.empty vars

let collect_fun fs (Func(name, args, _, _, _)) =
  if StrMap.mem name fs then begin
    Printf.eprintf "Function %s is defined more than once\n" name;
    raise InfLib.Fatal_error
  end else StrMap.add name (List.length args) fs

let collect_funs funs =
  List.fold_left collect_fun StrMap.empty funs

let union_func_env =
  StrMap.union (fun _ _ n -> Some n)

let check_var vs x =
  if StrSet.mem x vs then ()
  else begin
    Printf.eprintf "Unbound variable %s\n" x;
    raise InfLib.Fatal_error
  end

let check_func fs name arity =
  match fs with
  | None ->
    Printf.eprintf "Functions are not allowed in this sublanguage\n";
    raise InfLib.Fatal_error
  | Some fs ->
    match StrMap.find_opt name fs with
    | Some n when n = arity -> ()
    | Some n ->
      Printf.eprintf 
        ("Arity mismatch at call of function %s\n"
          ^^ "Provided: %d parameter(s)\n"
          ^^ "Expected: %d parameter(s)\n")
        name
        arity
        n;
      raise InfLib.Fatal_error
    | None ->
      Printf.eprintf "Unbound function %s\n" name;
      raise InfLib.Fatal_error

let rec check_aexp vs fs e =
  match e with
  | Int _ -> ()
  | Var x -> check_var vs x
  | Binop(_, e1, e2) ->
    check_aexp vs fs e1;
    check_aexp vs fs e2
  | Call(name, args) ->
    check_func fs name (List.length args);
    List.iter (check_aexp vs fs) args

let rec check_bexp vs fs e =
  match e with
  | Bool _ -> ()
  | Cmp(_, e1, e2) ->
    check_aexp vs fs e1;
    check_aexp vs fs e2
  | And(e1, e2) | Or(e1, e2) ->
    check_bexp vs fs e1;
    check_bexp vs fs e2
  | Not e ->
    check_bexp vs fs e

let rec check_fun_stmt vs fs stmt =
  match stmt with
  | Block ss ->
    List.fold_left (fun ret s -> check_fun_stmt vs fs s || ret) false ss
  | Assgn(x, e) ->
    check_var  vs x;
    check_aexp vs fs e;
    false
  | If(e, s1, s2) ->
    check_bexp vs fs e;
    check_fun_stmt vs fs s1 && check_fun_stmt vs fs s2
  | While(e, s) ->
    check_bexp vs fs e;
    let _ : bool = check_fun_stmt vs fs s in
    e = Bool true
  | Read x ->
    check_var vs x;
    false
  | Write e ->
    check_aexp vs fs e;
    false
  | Return e ->
    check_aexp vs fs e;
    true

let rec check_stmt vs fs stmt =
  match stmt with
  | Block ss ->
    List.iter (check_stmt vs fs) ss
  | Assgn(x, e) ->
    check_var  vs x;
    check_aexp vs fs e
  | If(e, s1, s2) ->
    check_bexp vs fs e;
    check_stmt vs fs s1;
    check_stmt vs fs s2
  | While(e, s) ->
    check_bexp vs fs e;
    check_stmt vs fs s
  | Read x ->
    check_var vs x
  | Write e ->
    check_aexp vs fs e
  | Return _ ->
    Printf.eprintf "Return statement in the program body\n";
    raise InfLib.Fatal_error

let rec check_expr_stmt vs vars ss =
  match vars, ss with
  | x :: vars, Read y :: ss when x = y ->
    check_expr_stmt vs vars ss
  | [], [ Write e ] ->
    check_aexp vs None e
  | _ ->
    Printf.eprintf "Provided program doesn't belong to EXPR sublanguage\n";
    raise InfLib.Fatal_error

let check_func_body name vs fs body =
  if not (check_fun_stmt vs (Some fs) body) then
    Printf.eprintf
      ("warning: end of %s function might be reached "
      ^^ "without returning a value\n")
      name

let check_func_func fs (Func(name, args, vars, funs, body)) =
  let vs = collect_vars (args @ vars) in
  if not (List.is_empty funs) then begin
    Printf.eprintf "Nested functions are not allowed in this sublanguage\n";
    raise InfLib.Fatal_error
  end;
  check_func_body name vs fs body

let rec check_func_nested fs (Func(name, args, vars, funs, body)) =
  let vs = collect_vars (args @ vars) in
  let fs = union_func_env fs (collect_funs funs) in
  List.iter (check_func_nested fs) funs;
  check_func_body name vs fs body

let rec check_func_full vs fs (Func(name, args, vars, funs, body)) =
  let vs = StrSet.union vs (collect_vars (args @ vars)) in
  let fs = union_func_env fs (collect_funs funs) in
  List.iter (check_func_full vs fs) funs;
  check_func_body name vs fs body

let expr (vars, funs, body) =
  let vs = collect_vars vars in
  match funs, body with
  | _ :: _, _ ->
    Printf.eprintf "Functions are not allowed in this sublanguage\n";
    raise InfLib.Fatal_error
  | [], Block ss ->
    check_expr_stmt vs vars ss
  | [], _ ->
    Printf.eprintf "Provided program doesn't belong to EXPR sublanguage\n";
    raise InfLib.Fatal_error

let stmt (vars, funs, body) =
  let vs = collect_vars vars in
  if not (List.is_empty funs) then begin
    Printf.eprintf "Functions are not allowed in this sublanguage\n";
    raise InfLib.Fatal_error
  end;
  check_stmt vs None body

let func (vars, funs, body) =
  let vs = collect_vars vars in
  let fs = collect_funs funs in
  List.iter (check_func_func fs) funs;
  check_stmt vs (Some fs) body

let nested (vars, funs, body) =
  let vs = collect_vars vars in
  let fs = collect_funs funs in
  List.iter (check_func_nested fs) funs;
  check_stmt vs (Some fs) body

let full (vars, funs, body) =
  let vs = collect_vars vars in
  let fs = collect_funs funs in
  List.iter (check_func_full vs fs) funs;
  check_stmt vs (Some fs) body
