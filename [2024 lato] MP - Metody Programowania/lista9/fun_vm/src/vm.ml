open Ast

type cmd =
  | PushInt of int
  | PushBool of bool
  | Prim of bop
  | Jmp of string
  | CondJmp of cmd list * cmd list
  | Grab           (* wstaw wartosc ze stosu do srodowisko *)
  | Access of int  (* wstaw wartosc ze srodowiska na stos *)
  | EndLet
  | PushClo of cmd list
  | Call
  | Lbl of string
  | Return
            
type vm_value =
  | VMInt of int
  | VMBool of bool
  | VMClosure of cmd list * vm_value list
  | VMRetAddr of cmd list * vm_value list

let flatten (s : cmd list) : cmd list =
  let rec it (e : cmd list) (actbranch : string) (f : ident list) =
    match e with
    | CondJmp (t, e) :: p' -> CondJmp([Jmp (actbranch^"L")], [Jmp (actbranch^"R")]) :: Lbl (actbranch^"L") :: it t (actbranch^"L") f @ Lbl (actbranch^"R") :: it e (actbranch^"R") f @ it p' actbranch f
    | PushClo cmds :: p' -> it p' actbranch ((actbranch^"F")::f) @ Lbl (actbranch^"F") :: it cmds (actbranch^"F") ((actbranch^"F")::f)
    | Return :: p' -> Jmp(List.hd f) :: it p' (actbranch^"0") (List.tl f)
    | Call :: p' -> it p' (actbranch^"0") f
    | p :: p' -> p :: it p' (actbranch^"0") f
    | [] -> []
  in it s "Label_" []

let eval_vm_op (op : bop) (v1 : vm_value) (v2 : vm_value) : vm_value =
  match op, v1, v2 with
  | Add,  VMInt i1, VMInt i2 -> VMInt (i1 + i2)
  | Sub,  VMInt i1, VMInt i2 -> VMInt (i1 - i2)
  | Mult, VMInt i1, VMInt i2 -> VMInt (i1 * i2)
  | Div,  VMInt i1, VMInt i2 -> VMInt (i1 / i2)
  | Eq,   VMInt i1, VMInt i2 -> VMBool (i1 = i2)
  | Lt,   VMInt i1, VMInt i2 -> VMBool (i1 < i2)
  | Gt,   VMInt i1, VMInt i2 -> VMBool (i1 > i2)
  | Leq,  VMInt i1, VMInt i2 -> VMBool (i1 <= i2)
  | Geq,  VMInt i1, VMInt i2 -> VMBool (i1 >= i2)
  | Neq,  VMInt i1, VMInt i2 -> VMBool (i1 <> i2)
  | _ -> failwith "type error"
 
module M = Map.Make(String)

type mem = cmd list M.t 
let rec findlabel l p =
  match p with
  | Lbl l' :: p' -> if l=l' then Some p' else findlabel l p'
  | _ :: p' -> findlabel l p'
  | [] -> None
let rec exec (p : cmd list) (s : vm_value list) (env : vm_value list) (mem : mem) : vm_value =
  match p, s with
  | [], [v] -> v
  | PushInt n :: p', _ -> exec p' (VMInt n :: s) env mem
  | PushBool b :: p', _ -> exec p' (VMBool b :: s) env mem
  | Prim op :: p', (v1 :: v2 :: s) -> exec p' (eval_vm_op op v2 v1 :: s) env mem
  | CondJmp (t, e) :: p', VMBool v :: s' -> if v then exec (t @ p') s' env mem
                                            else exec (e @ p') s' env mem
  | Grab :: p', v :: s' -> exec p' s' (v :: env) mem
  | Access n :: p', _ -> exec p' (List.nth env n :: s) env mem
  | EndLet :: p', _ -> exec p' s (List.tl env) mem
  | PushClo q :: p', _ -> exec p' (VMClosure (q, env) :: s) env mem
  | Call :: p', VMClosure (q, env') :: v :: s' ->
     exec q (VMRetAddr (p', env) :: s') (v :: env') mem
  | Return :: _, v :: VMRetAddr (p, env') :: s' -> exec p (v :: s') env' mem
  | Lbl l :: p', s -> exec p' s env (M.add l p' mem)
  | Jmp l :: p', s -> (match (findlabel l p') with
                    | Some p -> exec (p) s env mem
                    | None -> match (M.find_opt l mem) with
                      | Some p -> exec (p) s env mem
                      | None -> failwith ("unknown label "^l))
  | [], s::_ -> s
  | _, [] -> failwith "Empty stack and an operator"
  | _, _ -> failwith "error"
       
let exe p = exec p [] [] M.empty


