exception Fatal_error

(* Operations on stack *)

let stack_top stack = List.length stack

let rec stack_enter ~dflt n stack =
  if n = 0 then stack
  else stack_enter ~dflt (n - 1) (dflt :: stack)

let rec stack_leave n stack =
  match n, stack with
  | 0, _          -> stack
  | _, _ :: stack -> stack_leave (n - 1) stack
  | _ -> failwith "stack_leave"

let stack_size stack = List.length stack

let stack_load n stack =
  List.nth stack (stack_size stack - n)

let rec set_nth xs n v =
  match xs, n with
  | [],      _ -> failwith "set_nth"
  | _ :: xs, 0 -> v :: xs
  | x :: xs, n -> x :: set_nth xs (n - 1) v

let stack_store n v stack =
  set_nth stack (stack_size stack - n) v

(* ========================================================================= *)

let parse_channel ?fname chan =
  let lexbuf = Lexing.from_channel chan in
  Option.iter (Lexing.set_filename lexbuf) fname;
  try InfParser.prog InfLexer.token lexbuf with
  | InfLexer.Invalid_char c ->
    let p = Lexing.lexeme_start_p lexbuf in
    Printf.eprintf "%s:%d:%d: Invalid character (%s)\n"
      p.pos_fname
      p.pos_lnum
      (p.pos_cnum - p.pos_bol + 1)
      (Char.escaped c);
    raise Fatal_error
  | InfParser.Error ->
    let p1 = Lexing.lexeme_start_p lexbuf in
    let p2 = Lexing.lexeme_end_p lexbuf in
    Printf.eprintf "%s:%d:%d-%d: Syntax error: unexpected token %s\n"
      p1.pos_fname
      p1.pos_lnum
      (p1.pos_cnum - p1.pos_bol + 1)
      (p2.pos_cnum - p2.pos_bol)
      (Lexing.lexeme lexbuf);
    raise Fatal_error

let parse_file fname = 
  try In_channel.with_open_text fname (parse_channel ~fname) with
  | Sys_error msg ->
    Printf.eprintf "error: %s\n" msg;
    raise Fatal_error
