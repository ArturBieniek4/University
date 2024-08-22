(** Variable name *)
type var = string

(** Function name *)
type name = string

(** Primitive operations *)
type primop = Mul | Div | Add | Sub

(** Comparison operators *)
type cmpop = Eq | Neq | Lt | Gt | Leq | Geq

(** Arithmetic expressions *)
type aexp =
  | Int   of int
  | Var   of var
  | Binop of primop * aexp * aexp
  | Call  of name * aexp list

(** Boolean expressions *)
type bexp =
  | Bool of bool
  | Cmp  of cmpop * aexp * aexp
  | And  of bexp * bexp
  | Or   of bexp * bexp
  | Not  of bexp

(** Statements *)
type stmt =
  | Block  of stmt list
  | Assgn  of var * aexp
  | If     of bexp * stmt * stmt
  | While  of bexp * stmt
  | Read   of var
  | Write  of aexp
  | Return of aexp

(** Function definition.
  In [Func(name, args, local_vars, local_funs, body)] the meaning of
  parameters is the following.
  - [name] -- function name 
  - [args] -- list of formal parameters
  - [local_vars] -- list of local variables available in this function
  - [local_funs] -- list of local functions available in this function
  - [body] -- single statement with the function body (it can be a block) *)
type func =
  | Func of name * var list * var list * func list * stmt

(** Programs, built from local variables, functions, and single statement *)
type prog = var list * func list * stmt

(** Commands of VM *)
type cmd =
  | TOP
    (** Load address of top of the stack to ACC *)
  | LEA    of int
    (** Increase the address in ACC by N *)
  | ENTER  of int
    (** Push N values on the stack *)
  | LEAVE  of int
    (** Pop N values from the stack. Do not change the value in ACC *)
  | PUSH
    (** Push ACC on the stack *)
  | LOAD   of int
    (** Load to ACC a value at address given in ACC increased by N *)
  | STORE  of int
    (** Store ACC to an address stored at top of the stack increased by N.
      The address is popped from the stack *)
  | CONST  of int
    (** Load N to ACC *)
  | PRIM   of primop
    (** Load to ACC the result of given arithmetic operation on top of the
      stack and ACC. The operand is popped from the stack *)
  | CMP    of cmpop
    (** Similar to PRIM, but uses comparison operation. Result of comparison
      is stored in ACC. Value 1 means true, 0 means false. *)
  | CALL   of name
    (** Push return address on the stack and call given function. ACC is not
      modified *)
  | RET
    (** Jump to return address popped from the stack. ACC is not modified. *)
  | READ
    (** Read integer from input and store it in ACC *)
  | WRITE
    (** Output the integer stored in ACC *)
  | BRANCH of cmd list * cmd list
    (** First the second list of commands if value in ACC is 0, or the first
      list otherwise. After executing given list, proceed to the next
      instruction *)
  | WHILE  of cmd list * cmd list
    (** Execute the first list of commands, and if the value in ACC is
      non-zero, execute the second list and the whole WHILE command again.
      Then, proceed to the next instruction *)

(** Compiled programs: the first command list is the main body of the program,
  the second list is a list of pairs: function name and function code *)
type vm_prog = cmd list * (name * cmd list) list
