let stack_size = 65536

let cmp op x y =
  if op x y then 1 else 0

let run (prog : FlatVm.prog) =
  let stack = Array.make stack_size 0 in
  let rec loop pc sp acc =
    let cmd = prog.(pc) in
    let pc  = pc + 1 in
    match cmd with
    | NOP      -> loop pc sp acc
    | TOP      -> loop pc sp sp
    | LEA    n -> loop pc sp (acc + n)
    | ENTER  n -> loop pc (sp - n) acc
    | LEAVE  n -> loop pc (sp + n) acc
    | PUSH     -> 
      let sp = sp - 1 in
      stack.(sp) <- acc;
      loop pc sp acc
    | LOAD   n -> loop pc sp stack.(acc + n)
    | STORE  n ->
      let addr = stack.(sp) in
      let sp = sp + 1 in
      stack.(addr + n) <- acc;
      loop pc sp acc
    | CONST  n -> loop pc sp n
    | PRIM Mul -> loop pc (sp + 1) (stack.(sp) * acc)
    | PRIM Div -> loop pc (sp + 1) (stack.(sp) / acc)
    | PRIM Add -> loop pc (sp + 1) (stack.(sp) + acc)
    | PRIM Sub -> loop pc (sp + 1) (stack.(sp) - acc)
    | CMP  Eq  -> loop pc (sp + 1) (cmp (=)  stack.(sp) acc)
    | CMP  Neq -> loop pc (sp + 1) (cmp (<>) stack.(sp) acc)
    | CMP  Lt  -> loop pc (sp + 1) (cmp (<)  stack.(sp) acc)
    | CMP  Gt  -> loop pc (sp + 1) (cmp (>)  stack.(sp) acc)
    | CMP  Leq -> loop pc (sp + 1) (cmp (<=) stack.(sp) acc)
    | CMP  Geq -> loop pc (sp + 1) (cmp (>=) stack.(sp) acc)
    | JMP    n -> loop n sp acc
    | JZ     n -> loop (if acc = 0 then n else pc) sp acc
    | CALL   n ->
      let sp = sp - 1 in
      stack.(sp) <- pc;
      loop n sp acc
    | RET      ->
      let pc = stack.(sp) in
      loop pc (sp + 1) acc
    | HALT     -> ()
    | READ     ->
      let acc = read_line () |> int_of_string in
      loop pc sp acc
    | WRITE    ->
      print_endline (string_of_int acc);
      loop pc sp acc
  in
  loop 0 stack_size 0
