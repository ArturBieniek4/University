let cmd_args_options = []

let usage_string =
  Printf.sprintf "Usage: %s [FILE]" Sys.argv.(0)

exception Parse_error of Lexing.position * string

let run_parser fname (lexbuf : Lexing.lexbuf) =
  Lexing.set_filename lexbuf fname;
  try Parser.prog Lexer.token lexbuf with
  | Parser.Error ->
    raise (Parse_error(Lexing.lexeme_start_p lexbuf, Lexing.lexeme lexbuf))

let run_prog fname =
  try
    In_channel.with_open_text fname
      (fun chan ->
        Lexing.from_channel chan
        |> run_parser fname
        |> Eval.run_prog)
  with
  (* | Eval.Unbound_var x ->
    Printf.eprintf "unbound variable: %s\n" x;
    exit 1 *)
  | Parse_error(pos, tok) ->
    Printf.eprintf "%s:%d:%d: Syntax error, unexpected token %s\n"
      pos.pos_fname
      pos.pos_lnum
      (pos.pos_cnum - pos.pos_bol + 1)
      tok;
    exit 1

let _ =
  Arg.parse cmd_args_options run_prog usage_string
