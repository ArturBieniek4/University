open InfLib

type value =
  | Undef
  | Num     of int
  | Addr    of int
  | RetAddr of Ast.name option * Ast.cmd list

let runtime_error ?msg () =
  begin match msg with
  | None     -> Printf.eprintf "Runtime error!\n"
  | Some msg -> Printf.eprintf "Runtime error: %s\n" msg
  end;
  raise Fatal_error

let vm_assert b =
  if b then ()
  else runtime_error ()

let wrap_bool b =
  Num (if b then 1 else 0)

(* ========================================================================= *)
(* VM *)

let rec run_loop fs curf (cmds : Ast.cmd list) stack acc =
  match cmds, stack, acc with
  | [], _, _ ->
    begin match curf with
    | None      -> ()
    | Some name ->
      runtime_error ~msg:("missing RET command in function " ^ name) ()
    end
  
  | TOP :: cmds, _, _ ->
    run_loop fs curf cmds stack (Addr (stack_top stack))

  | LEA n :: cmds, _, Addr a ->
    vm_assert (n >= 0 && n <= a);
    run_loop fs curf cmds stack (Addr (a - n))
  | LEA _ :: _, _, _ -> runtime_error ()

  | ENTER n :: cmds, _, _ ->
    vm_assert (n >= 0);
    run_loop fs curf cmds (stack_enter ~dflt:Undef n stack) acc

  | LEAVE n :: cmds, _, _ ->
    vm_assert (n >= 0 && n <= stack_size stack);
    run_loop fs curf cmds (stack_leave n stack) acc

  | PUSH :: cmds, _, _ ->
    run_loop fs curf cmds (acc :: stack) acc

  | LOAD n :: cmds, _, Addr a ->
    vm_assert (n >= 0 && n < a && a <= stack_size stack);
    run_loop fs curf cmds stack (stack_load (a - n) stack)
  | LOAD _ :: _, _, _ -> runtime_error ()

  | STORE n :: cmds, Addr a :: stack, _ ->
    vm_assert (n >= 0 && n < a && a <= stack_size stack);
    run_loop fs curf cmds (stack_store (a - n) acc stack) acc
  | STORE _ :: _, _, _ -> runtime_error ()

  | CONST n :: cmds, _, _ ->
    run_loop fs curf cmds stack (Num n)

  | PRIM Mul :: cmds, Num x :: stack, Num y ->
    run_loop fs curf cmds stack (Num (x * y))
  | PRIM Div :: cmds, Num x :: stack, Num y ->
    run_loop fs curf cmds stack (Num (x / y))
  | PRIM Add :: cmds, Num x :: stack, Num y ->
    run_loop fs curf cmds stack (Num (x + y))
  | PRIM Sub :: cmds, Num x :: stack, Num y ->
    run_loop fs curf cmds stack (Num (x - y))
  | PRIM (Mul|Div|Add|Sub) :: _, _, _ -> runtime_error ()

  | CMP Eq  :: cmds, Num x :: stack, Num y ->
    run_loop fs curf cmds stack (wrap_bool (x = y))
  | CMP Neq :: cmds, Num x :: stack, Num y ->
    run_loop fs curf cmds stack (wrap_bool (x <> y))
  | CMP Lt  :: cmds, Num x :: stack, Num y ->
    run_loop fs curf cmds stack (wrap_bool (x < y))
  | CMP Gt  :: cmds, Num x :: stack, Num y ->
    run_loop fs curf cmds stack (wrap_bool (x > y))
  | CMP Leq :: cmds, Num x :: stack, Num y ->
    run_loop fs curf cmds stack (wrap_bool (x <= y))
  | CMP Geq :: cmds, Num x :: stack, Num y ->
    run_loop fs curf cmds stack (wrap_bool (x >= y))
  | CMP (Eq|Neq|Lt|Gt|Leq|Geq) :: _, _, _ -> runtime_error ()

  | CALL f :: cmds, _, _ ->
    begin match List.assoc_opt f fs with
    | None      -> runtime_error ()
    | Some code ->
      run_loop fs (Some f) code (RetAddr(curf, cmds) :: stack) acc
    end
  | RET :: _, RetAddr(curf, cmds) :: stack, _ ->
    run_loop fs curf cmds stack acc
  | RET :: _, _, _ -> runtime_error ()

  | READ :: cmds, _, _ ->
    let x = read_line () |> int_of_string in
    run_loop fs curf cmds stack (Num x)

  | WRITE :: cmds, _, Num x ->
    print_endline (string_of_int x);
    run_loop fs curf cmds stack acc
  | WRITE :: _, _, _ -> runtime_error ()

  | BRANCH(_, cmds2) :: cmds, _, Num 0 ->
    run_loop fs curf (cmds2 @ cmds) stack acc
  | BRANCH(cmds1, _) :: cmds, _, Num _ ->
    run_loop fs curf (cmds1 @ cmds) stack acc
  | BRANCH _ :: _, _, _ -> runtime_error ()

  | WHILE(cmds1, cmds2) :: cmds, _, _ ->
    let cmds = cmds1 @ BRANCH(cmds2 @ [ WHILE(cmds1, cmds2) ], []) :: cmds in
    run_loop fs curf cmds stack acc

let run (cmds, fs) =
  run_loop fs None cmds [] Undef
