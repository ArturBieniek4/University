type ident = string

type qbf =
  | Top
  | Bot
  | Var of ident
  | Forall of ident * qbf
  | Exists of ident * qbf
  | Not of qbf
  | Conj of qbf * qbf
  | Disj of qbf * qbf

(* Zad 6. *)

let rec subst (x : ident) (s : qbf) (f : qbf) : qbf =
  match s with
  | Top -> Top
  | Bot -> Bot
  | Var i -> if i=x then f else Var i
  | Forall(i, expr) -> Forall(i, subst x expr f)
  | Exists(i, expr) -> Exists(i, subst x expr f)
  | Not expr -> Not (subst x expr f)
  | Conj(expr1, expr2) -> Conj(subst x expr1 f, subst x expr2 f)
  | Disj(expr1, expr2) -> Disj(subst x expr1 f, subst x expr2 f);;

subst "x" (Conj(Var "y", Not Top)) (Bot);;

let rec eval (f : qbf) : bool =
  match f with
  | Top -> true
  | Bot -> false
  | Var i -> failwith("Unbound value "^i)
  | Forall(i, expr) -> eval (subst i expr Top) && eval (subst i expr Bot)
  | Exists(i, expr) -> eval (subst i expr Top) || eval (subst i expr Bot)
  | Not expr -> if (eval expr)=true then false else true
  | Conj(expr1, expr2) -> eval expr1 && eval expr2
  | Disj(expr1, expr2) -> eval expr1 || eval expr2;;

eval (Forall("y", Disj(Var "y", Not (Var "y"))));;