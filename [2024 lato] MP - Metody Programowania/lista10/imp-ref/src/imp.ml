let cmd_args_options = []

let usage_string =
  Printf.sprintf "Usage: %s [FILE]" Sys.argv.(0)

let run_prog fname =
  In_channel.with_open_text fname
    (fun chan ->
      Lexing.from_channel chan
      |> Parser.prog Lexer.token
      |> Eval.run_prog)

let _ =
  Arg.parse cmd_args_options run_prog usage_string
