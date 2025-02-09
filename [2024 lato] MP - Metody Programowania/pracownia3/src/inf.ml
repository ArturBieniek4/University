let eval_spec    (vm, _)  = EvalSpec.run vm
let eval_precise (_, fvm) = EvalPrecise.run fvm
let eval_fast    (_, fvm) = EvalFast.run fvm

let dump = ref false
let sublang = ref Check.full
let eval = ref eval_spec
let fname = ref None

let sublang_of_string str =
  match str with
  | "expr"     -> Check.expr
  | "stmt"     -> Check.stmt
  | "func"     -> Check.func
  | "nested"   -> Check.nested
  | "full"     -> Check.full
  | "no-check" -> ignore
  | _          -> assert false

let eval_of_string str =
  match str with
  | "spec"    -> eval_spec
  | "precise" -> eval_precise
  | "fast"    -> eval_fast
  | "no"      -> ignore
  | _         -> assert false

let set_symbol sym_ref sym_of_string str =
  sym_ref := sym_of_string str

let cmd_args_options = Arg.align
  [ "-dump", Arg.Set dump,
    " Dump compilation result to stdout"
  ; "-sublang", Arg.Symbol(
      [ "expr"; "stmt"; "func"; "nested"; "full"; "no-check" ],
      (set_symbol sublang sublang_of_string)),
    "LANG Check if given source is written in sublanguage LANG"
  ; "-vm", Arg.Symbol(
      [ "spec"; "precise"; "fast"; "no" ],
      (set_symbol eval eval_of_string)),
    "VM Select the virtual machine (`no' means: do not evaluate)"
  ]

let usage_string =
  Printf.sprintf
    "Usage: %s [OPTION]... FILE\nAvailable OPTIONs are:"
    Sys.argv.(0)

let proc_fname arg =
  match !fname with
  | None   -> fname := Some arg
  | Some _ -> raise (Arg.Bad "Please provide a single file name")

let check_program p =
  !sublang p;
  p

let compute_addr p =
  (p, AddrVm.tr_vm_prog p)

let dump_prog p =
  if !dump then AddrVm.dump_prog (snd p);
  p

let flatten_prog (vm, avm) =
  (vm, FlatVm.flatten_prog avm)

let eval_prog p =
  !eval p

let _ =
  Arg.parse cmd_args_options proc_fname usage_string;
  match !fname with
  | None -> Arg.usage cmd_args_options usage_string
  | Some fname ->
    try
      fname
      |> InfLib.parse_file
      |> check_program
      |> Solution.compile_prog
      |> compute_addr
      |> dump_prog
      |> flatten_prog
      |> eval_prog
    with
    | InfLib.Fatal_error ->
      exit 1
