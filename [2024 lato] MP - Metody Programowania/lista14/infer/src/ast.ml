(* abstract syntax tree *)

module Type : sig
  type tp
  type uvar
  type tp_view =
    | TUnit
    | TInt
    | TBool
    | TPair of tp * tp
    | TArr of tp * tp
    | TUVar of uvar
    | TRaise

  val tp_view : tp -> tp_view

  val fresh_uvar : unit -> tp
  val t_unit : tp
  val t_int  : tp
  val t_bool : tp
  val t_pair : tp -> tp -> tp
  val t_arr  : tp -> tp -> tp
  val t_raise : tp

  val set_uvar : uvar -> tp -> unit
end = struct
  type tp = tp_view
  and uvar = tp option ref
  and tp_view =
    | TUnit
    | TInt
    | TBool
    | TPair of tp * tp
    | TArr of tp * tp
    | TUVar of uvar
    | TRaise

  let rec tp_view tp =
    match tp with
    | TUVar r ->
      (match !r with
      | None -> tp
      | Some tp -> tp_view tp)
    | _ -> tp

  let fresh_uvar () = TUVar (ref None)
  let t_int = TInt
  let t_bool = TBool
  let t_unit = TUnit
  let t_pair tp1 tp2 = TPair(tp1, tp2)
  let t_arr tp1 tp2 = TArr(tp1, tp2)
  let t_raise = TRaise

  let set_uvar x tp =
    assert (!x = None);
    x := Some tp
end
include Type

let uvar_equal x y = x == y

type bop = Mult | Div | Add | Sub | Eq | Lt | Gt | Leq | Geq | Neq | And | Or

type ident = string

type expr =
  | Unit
  | Int of int
  | Bool of bool
  | Var of ident
  | Binop of bop * expr * expr
  | If of expr * expr * expr
  | Let of ident * expr * expr
  | LetRec of (ident * expr) list * expr
  | Fun of ident * tp * expr
  | App of expr * expr
  | Pair of expr * expr
  | Fst  of expr
  | Snd  of expr
  | Raise
  | Try of expr * expr
