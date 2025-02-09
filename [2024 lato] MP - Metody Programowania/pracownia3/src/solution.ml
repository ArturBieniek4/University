open Ast

module M = Map.Make(String)

let rec allocate_vars varmap varcnt vars =
  match vars with
  | [] -> varmap, varcnt
  | x::vars' -> allocate_vars (M.add x varcnt varmap) (varcnt+1) vars'

let rec push_args varmap offset acc args =
  match args with
  | [] -> acc
  | arg::args' -> push_args varmap offset (acc @ compile_aexp varmap offset arg @ [PUSH]) args' (* do poprawy bo kwadratowe *)

and compile_aexp varmap offset aexp =
  match aexp with
  | Int n -> [CONST n]
  | Var x -> [TOP; LOAD ((M.find x varmap)+offset)]
  | Binop(op, e1, e2) -> (compile_aexp varmap offset e1) @ [PUSH] @ (compile_aexp varmap (offset+1) e2) @ [PRIM op]
  | Call(x, args) -> (push_args varmap offset [] args) @ [CALL x; LEAVE (List.length args)]

let rec compile_bexp varmap offset bexp =
  match bexp with
  | Bool false -> [CONST 0]
  | Bool true -> [CONST 1]
  | Cmp(op, e1, e2) -> (compile_aexp varmap offset e1) @ [PUSH] @ (compile_aexp varmap (offset+1) e2) @ [CMP op]
  | And(e1, e2) -> (compile_bexp varmap offset e1)@[PUSH; CONST 1; CMP(Eq)] @ [BRANCH((compile_bexp varmap offset e2) , [CONST 0])]
  | Or(e1, e2) -> (compile_bexp varmap offset e1)@[PUSH; CONST 1; CMP(Eq)] @ [BRANCH([CONST 1] , (compile_bexp varmap offset e2))]
  | Not(e) -> (compile_bexp varmap offset e) @ [PUSH; CONST 0; CMP(Eq)]

let rec compile_helper varmap varcnt stmt =
  match stmt with
  | Block(stmts) -> (List.concat_map (fun stmt -> (compile_helper varmap varcnt stmt)) stmts)
  | Read(x) -> [TOP; PUSH; READ; STORE (M.find x varmap)]
  | Write(aexp) -> (compile_aexp varmap 0 aexp) @ [WRITE]
  | If(p, t, e) -> (compile_bexp varmap 0 p) @ [BRANCH((compile_helper varmap varcnt t),(compile_helper varmap varcnt e))]
  | While(p, e) -> [WHILE((compile_bexp varmap 0 p), (compile_helper varmap varcnt e))]
  | Assgn(x, aexp) -> [TOP; PUSH] @ (compile_aexp varmap 1 aexp) @ [STORE (M.find x varmap)]
  | Return(aexp) -> (compile_aexp varmap varcnt aexp) @ [RET]

let compile_fun varmap varcnt f : name * cmd list =
  match f with Func(name, args, lvars, _, body) ->
    let varmap, varcnt = allocate_vars varmap varcnt args in
    let varmap, new_varcnt = allocate_vars varmap varcnt lvars in
    name, (ENTER (new_varcnt - varcnt)) :: (compile_helper varmap varcnt body) @ [LEAVE (new_varcnt - varcnt)]

let rec compile_funcs varmap varcnt funcs acc =
  match funcs with
  | [] -> acc
  | f::funcs' -> compile_funcs varmap varcnt funcs' ((compile_fun varmap varcnt f)::acc)

let compile_prog (p : prog) : vm_prog =
  let (vars, funcs, stmt) = p in
  let varmap, varcnt = allocate_vars M.empty 0 vars in
  let funcs = compile_funcs varmap varcnt funcs [] in
  (ENTER varcnt::(compile_helper varmap varcnt stmt)), funcs