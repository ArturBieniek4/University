x;;
(* WOLNE *)


let x = 3 in x + y;;
(* x związane, y wolne *)

let x = 1
(* wiążące x *)
and y = x + 2
(* x jest tutaj wolne *)
in x + y;;
(* tu już x, y związane *)


let x = 1 in
(* wiążące x *)
let y = x + 2 in
(* x związane, wiążące y *)
x + y;;
(* x,y związane *)


let f x y = x * y * z;;
(* f,x,y związane, z wolne *)

let f x =
(* wiążące f,x *)
let g y z = x * y * z in
(* wiążące g, wiążące i potem związane y,z; x jest związane linijkę wyżej*)
g (h x) z;;
(* h wolne, z wolne, x związane w pierwszej linijce *)