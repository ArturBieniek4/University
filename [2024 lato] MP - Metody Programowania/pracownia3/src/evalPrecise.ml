open InfLib

type value =
  | Undef
  | Num     of int
  | Addr    of int
  | RetAddr of int

let get_command prog pc =
  if pc >= Array.length prog then begin
    Printf.eprintf "@%d: invalid program counter\n" pc;
    raise Fatal_error
  end;
  prog.(pc)

let string_of_value v =
  match v with
  | Undef     -> "<undefined>"
  | Num     n -> string_of_int n
  | Addr    n -> Printf.sprintf "<addr: %d>" n
  | RetAddr n -> Printf.sprintf "<retAddr: %d>" n

let rec dump_stack n addr stack =
  match n, stack with
  | _, [] -> ()
  | 0, _  -> Printf.eprintf "      ...\n"
  | _, v :: stack ->
    dump_stack (n - 1) (addr - 1) stack;
    Printf.eprintf "%4d: %s\n" addr (string_of_value v)

let vm_error ?msg pc stack acc =
  Printf.eprintf "STACK:\n";
  dump_stack 16 (stack_size stack) stack;
  Printf.eprintf "PC  = %d\nACC = %s\n" pc (string_of_value acc);
  Printf.eprintf "@%d: %s\n" pc
    (match msg with
    | None     -> "Runtime error"
    | Some msg -> msg);
  raise Fatal_error

let _ = Random.self_init ()

let run (prog : FlatVm.prog) =
  let rec loop pc stack acc =
    let vm_error ?msg () = vm_error ?msg pc stack acc in
    let vm_assert b = if not b then vm_error () in
    let cmd = get_command prog pc in
    let pc = pc + 1 in
    match cmd with
    | NOP ->
      loop pc stack acc

    | TOP ->
      loop pc stack (Addr (stack_top stack))

    | LEA n ->
      begin match acc with
      | Addr a ->
        vm_assert (n >= 0 && n <= a);
        loop pc stack (Addr (a - n))
      | _ -> vm_error ~msg:"Value in accumulator is not an address" ()
      end

    | ENTER n ->
      vm_assert (n >= 0);
      loop pc (stack_enter ~dflt:Undef n stack) acc

    | LEAVE n ->
      vm_assert (n >= 0 && n <= stack_size stack);
      loop pc (stack_leave n stack) acc

    | PUSH ->
      loop pc (acc :: stack) acc

    | LOAD n ->
      begin match acc with
      | Addr a ->
        vm_assert (n >= 0 && n < a && a <= stack_size stack);
        loop pc stack (stack_load (a - n) stack)
      | _ -> vm_error ~msg:"Value in accumulator is not an address" ()
      end

    | STORE n ->
      vm_assert (n >= 0);
      begin match stack with
      | Addr a :: stack -> 
        vm_assert (n < a && a <= stack_size stack);
        loop pc (stack_store (a - n) acc stack) acc
      | _ :: _ ->
        vm_error ~msg:"Value on top of the stack is not an address" ()
      | [] -> vm_error ~msg:"The stack is emtpy" ()
      end

    | CONST n ->
      loop pc stack (Num n)

    | PRIM op ->
      let stack, n =
        match op, stack, acc with
        | Mul, Num x :: stack, Num y -> stack, (x * y)
        | Div, Num x :: stack, Num y -> stack, (x / y)
        | Add, Num x :: stack, Num y -> stack, (x + y)
        | Sub, Num x :: stack, Num y -> stack, (x - y)
        | (Mul|Div|Add|Sub), Num _ :: _, _ ->
          vm_error ~msg:"Value in accumulator is not a number" ()
        | (Mul|Div|Add|Sub), _ :: _, _ ->
          vm_error ~msg:"Value on top of the stack is not a number" ()
        | (Mul|Div|Add|Sub), [], _ ->
          vm_error ~msg:"The stack is emtpy" ()
      in
      loop pc stack (Num n)

    | CMP op ->
      let stack, b =
        match op, stack, acc with
        | Eq,  Num x :: stack, Num y -> stack, (x = y)
        | Neq, Num x :: stack, Num y -> stack, (x <> y)
        | Lt,  Num x :: stack, Num y -> stack, (x < y)
        | Gt,  Num x :: stack, Num y -> stack, (x > y)
        | Leq, Num x :: stack, Num y -> stack, (x <= y)
        | Geq, Num x :: stack, Num y -> stack, (x >= y)
        | (Eq|Neq|Lt|Gt|Leq|Geq), Num _ :: _, _ ->
          vm_error ~msg:"Value in accumulator is not a number" ()
        | (Eq|Neq|Lt|Gt|Leq|Geq), _ :: _, _ ->
          vm_error ~msg:"Value on top of the stack is not a number" ()
        | (Eq|Neq|Lt|Gt|Leq|Geq), [], _ ->
          vm_error ~msg:"The stack is emtpy" ()
      in
      loop pc stack (Num (if b then 1 else 0))

    | JMP pc ->
      loop pc stack acc

    | JZ addr ->
      begin match acc with
      | Num 0 -> loop addr stack acc
      | Num _ -> loop pc   stack acc
      | _ -> vm_error ~msg:"Value in accumulator is not a number" ()
      end

    | CALL addr ->
      loop addr (RetAddr pc :: stack) acc

    | RET ->
      begin match stack with
      | RetAddr pc :: stack -> loop pc stack acc
      | _ :: _ ->
        vm_error ~msg:"Value on top of the stack is not a return address" ()
      | [] -> vm_error ~msg:"The stack is emtpy" ()
      end

    | HALT -> ()

    | READ ->
      let n = read_line () |> int_of_string in
      loop pc stack (Num n)

    | WRITE ->
      begin match acc with
      | Num n ->
        print_endline (string_of_int n);
        loop pc stack acc
      | _ -> vm_error ~msg:"Value in accumulator is not a number" ()
      end
  in
  loop 0 [] Undef
