type cmd =
  { cmd_addr : int
  ; cmd_end  : int
  ; cmd_data : cmd_data
  }

and cmd_data =
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
  | CALL  of string
  | RET
  | READ
  | WRITE
  | BRANCH of cmd list * int * cmd list
  | WHILE  of cmd list * int * cmd list

type prog = cmd list * int * (string * int * cmd list) list * int

let rec tr_cmd addr (cmd : Ast.cmd) =
  let make_complex end_addr data =
    let cmd =
      { cmd_addr = addr
      ; cmd_end  = end_addr
      ; cmd_data = data
      }
    in
    (end_addr, cmd) in
  let make size data = make_complex (addr + size) data in
  match cmd with
  | TOP     -> make 1 TOP
  | LEA   n -> make 1 (LEA   n)
  | ENTER n -> make 1 (ENTER n)
  | LEAVE n -> make 1 (LEAVE n)
  | PUSH    -> make 1 PUSH
  | LOAD  n -> make 1 (LOAD  n)
  | STORE n -> make 1 (STORE n)
  | CONST n -> make 1 (CONST n)
  | PRIM op -> make 1 (PRIM op)
  | CMP  op -> make 1 (CMP  op)
  | CALL  f -> make 1 (CALL  f)
  | RET     -> make 1 RET
  | READ    -> make 1 READ
  | WRITE   -> make 1 WRITE
  | BRANCH(cmds1, cmds2) ->
    let (addr, cmds1) = tr_cmds (addr + 1) cmds1 in
    let else_addr = addr in
    let (addr, cmds2) = tr_cmds (addr + 1) cmds2 in
    make_complex addr (BRANCH(cmds1, else_addr, cmds2))
  | WHILE(cmds1, cmds2) ->
    let (addr, cmds1) = tr_cmds addr cmds1 in
    let do_addr = addr in
    let (addr, cmds2) = tr_cmds (addr + 1) cmds2 in
    make_complex (addr + 1) (WHILE(cmds1, do_addr, cmds2))

and tr_cmds addr cmds =
  List.fold_left_map tr_cmd addr cmds

let tr_func addr (name, cmds) =
  let f_addr = addr in
  let (addr, cmds) = tr_cmds addr cmds in
  (addr, (name, f_addr, cmds))

let tr_funcs addr fs =
  List.fold_left_map tr_func addr fs

let tr_vm_prog ((body, fs) : Ast.vm_prog) : prog =
  let (addr, body) = tr_cmds 0 body in
  let halt_addr = addr in
  let (size, fs) = tr_funcs (addr + 1) fs in
  (body, halt_addr, fs, size)

let dump_addr addr indent =
  Printf.printf "%6d: %s" addr indent

let rec dump_cmd indent cmd =
  dump_addr cmd.cmd_addr indent;
  match cmd.cmd_data with
  | TOP      -> Printf.printf "TOP\n"
  | LEA   n  -> Printf.printf "LEA   %d\n" n
  | ENTER n  -> Printf.printf "ENTER %d\n" n
  | LEAVE n  -> Printf.printf "LEAVE %d\n" n
  | PUSH     -> Printf.printf "PUSH\n"
  | LOAD  n  -> Printf.printf "LOAD  %d\n" n
  | STORE n  -> Printf.printf "STORE %d\n" n
  | CONST n  -> Printf.printf "CONST %d\n" n
  | PRIM Mul -> Printf.printf "PRIM  MUL\n"
  | PRIM Add -> Printf.printf "PRIM  ADD\n"
  | PRIM Div -> Printf.printf "PRIM  DIV\n"
  | PRIM Sub -> Printf.printf "PRIM  Sub\n"
  | CMP  Eq  -> Printf.printf "CMP   EQ\n"
  | CMP  Neq -> Printf.printf "CMP   NEQ\n"
  | CMP  Lt  -> Printf.printf "CMP   LT\n"
  | CMP  Gt  -> Printf.printf "CMP   GT\n"
  | CMP  Leq -> Printf.printf "CMP   LEQ\n"
  | CMP  Geq -> Printf.printf "CMP   GEQ\n"
  | CALL n   -> Printf.printf "CALL  %s\n" n
  | RET      -> Printf.printf "RET\n"
  | READ     -> Printf.printf "READ\n"
  | WRITE    -> Printf.printf "WRITE\n"
  | BRANCH(cmds1, _, cmds2) ->
    Printf.printf "BRANCH\n";
    List.iter (dump_cmd (indent ^ "  ")) cmds1;
    Printf.printf "        %sELSE\n" indent;
    List.iter (dump_cmd (indent ^ "  ")) cmds2;
    Printf.printf "        %sEND\n" indent
  | WHILE(cmds1, _, cmds2) ->
    Printf.printf "WHILE\n";
    List.iter (dump_cmd (indent ^ "  ")) cmds1;
    Printf.printf "        %sDO\n" indent;
    List.iter (dump_cmd (indent ^ "  ")) cmds2;
    Printf.printf "        %sDONE\n" indent

let dump_func (name, _, body) =
  Printf.printf "      %s:\n" name;
  List.iter (dump_cmd "") body

let dump_prog (body, _, fs, _) =
  List.iter (dump_cmd "") body;
  List.iter dump_func fs
