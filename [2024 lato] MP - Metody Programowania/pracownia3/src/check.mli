(** Check if given program is valid in EXPR sublanguage *)
val expr : Ast.prog -> unit

(** Check if given program is valid in STMT sublanguage *)
val stmt : Ast.prog -> unit

(** Check if given program is valid in FUNC sublanguage *)
val func : Ast.prog -> unit

(** Check if given program is valid in NESTED sublanguage *)
val nested : Ast.prog -> unit

(** Check if given program is valid in FULL sublanguage *)
val full : Ast.prog -> unit
