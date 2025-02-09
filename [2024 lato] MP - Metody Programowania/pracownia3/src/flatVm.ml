module StrMap = Map.Make(String)

type cmd =
  | NOP
  | TOP
  | LEA   of int
  | ENTER of int
  | LEAVE of int
  | PUSH
  | LOAD  of int
  | STORE of int
  | CONST of int
  | PRIM  of Ast.primop
  | CMP   of Ast.cmpop
  | JMP   of int
  | JZ    of int
  | CALL  of int
  | RET
  | HALT
  | READ
  | WRITE

type prog = cmd array

let rec flatten_cmd env prog (cmd : AddrVm.cmd) =
  let emit c = prog.(cmd.cmd_addr) <- c in
  match cmd.cmd_data with
  | TOP     -> emit TOP
  | LEA   n -> emit (LEA   n)
  | ENTER n -> emit (ENTER n)
  | LEAVE n -> emit (LEAVE n)
  | PUSH    -> emit PUSH
  | LOAD  n -> emit (LOAD  n)
  | STORE n -> emit (STORE n)
  | CONST n -> emit (CONST n)
  | PRIM op -> emit (PRIM op)
  | CMP  op -> emit (CMP  op)
  | CALL fn ->
    begin match StrMap.find_opt fn env with
    | Some addr -> emit (CALL addr)
    | None ->
      Printf.printf "@%d: VM function %s is not defined\n" cmd.cmd_addr fn;
      raise InfLib.Fatal_error
    end
  | RET     -> emit RET
  | READ    -> emit READ
  | WRITE   -> emit WRITE
  | BRANCH(cmds1, else_addr, cmds2) ->
    emit (JZ (else_addr + 1));
    List.iter (flatten_cmd env prog) cmds1;
    prog.(else_addr) <- JMP (cmd.cmd_end);
    List.iter (flatten_cmd env prog) cmds2
  | WHILE(cmds1, do_addr, cmds2) ->
    List.iter (flatten_cmd env prog) cmds1;
    prog.(do_addr) <- JZ (cmd.cmd_end);
    List.iter (flatten_cmd env prog) cmds2;
    prog.(cmd.cmd_end - 1) <- JMP cmd.cmd_addr

let flatten_func env prog (_, _, cmds) =
  List.iter (flatten_cmd env prog) cmds

let build_env fs =
  let add env (name, addr, _) =
    if StrMap.mem name env then begin
      Printf.printf "@%d: VM function %s is defined more than once\n"
        addr
        name;
      raise InfLib.Fatal_error
    end;
    StrMap.add name addr env
  in
  List.fold_left add StrMap.empty fs

let flatten_prog (cmds, halt_addr, fs, size) =
  let prog = Array.make size NOP in
  let env = build_env fs in
  List.iter (flatten_cmd env prog) cmds;
  prog.(halt_addr) <- HALT;
  List.iter (flatten_func env prog) fs;
  prog
