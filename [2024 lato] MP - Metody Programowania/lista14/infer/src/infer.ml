exception Parse_error of Lexing.position * string

let cmd_args_options = []

let usage_string =
  Printf.sprintf "Usage: %s [FILE]" Sys.argv.(0)

let fname = ref None

let set_fname arg =
  match !fname with
  | None   -> fname := Some arg
  | Some _ ->
    Arg.usage cmd_args_options usage_string;
    exit 2
    
let run_parser fname (lexbuf : Lexing.lexbuf) =
  Lexing.set_filename lexbuf fname;
  try Parser.prog Lexer.token lexbuf with
  | Parser.Error ->
    raise (Parse_error(Lexing.lexeme_start_p lexbuf, Lexing.lexeme lexbuf))

let _ =
  Arg.parse cmd_args_options set_fname usage_string;
  try
    match !fname with
    | None ->
      Arg.usage cmd_args_options usage_string;
      exit 2
    | Some fname ->
      In_channel.with_open_text fname
        (fun chan ->
          Lexing.from_channel chan
          |> run_parser fname
          |> TypeCheck.check_program
          |> Eval.eval_prog
          |> Eval.print_value)
  with
  | Eval.MyExn ->
    Printf.eprintf "Unhandled exception!\n";
    exit 1
  | Eval.Type_error ->
    Printf.eprintf "type error!\n";
    exit 1
  | Eval.Unbound_var x ->
    Printf.eprintf "unbound variable: %s\n" x;
    exit 1
  | Parse_error(pos, tok) ->
    Printf.eprintf "%s:%d:%d: Syntax error, unexpected token %s\n"
      pos.pos_fname
      pos.pos_lnum
      (pos.pos_cnum - pos.pos_bol + 1)
      tok;
    exit 1
