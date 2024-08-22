| Binop(_, e1, e2) -> bound, add_if_subtree (add_if_subtree ((it e1 bound) @ (it e2 bound)) e1) e2
      | Let(x, e1, e2) -> bound, add_if_subtree (add_if_subtree ((it e1 bound) @ (it e2 (x::bound))) e1) e2
      | If(cond, e1, e2) -> bound, add_if_subtree (add_if_subtree (add_if_subtree ((it e1 bound) @ (it e2 bound)) e1) e2) cond