type 'a tree = Leaf | Node of 'a tree * 'a * 'a tree
let example_tree = Node (Node (Leaf, 1, Leaf), 2, Node(Leaf, 3, Leaf))
let t =
  Node (
    Node (Leaf ,2, Leaf),
    5,
    (Node (
      Node (Leaf ,6, Leaf),
      8,
      (Node (Leaf ,9, Leaf))
      )
    )
  )

let rec insert_bst2 x t =
  match t with
  | Leaf -> Node(Leaf,x,Leaf)
  | Node (l, v, r) -> 
      if x = v then Node(l, v, insert_bst2 x r)
      else if x < v then Node(insert_bst2 x l, v, r)
      else Node(l, v, insert_bst2 x r)

let flatten t =
  let rec it t acc = match t with
  | Leaf -> acc
  | Node (l,v,r) -> it l (v::(it r acc))
  in it t []

let sort_tree xs =
  flatten(let rec it acc xs =
    match xs with
    | [] -> acc
    | x::xs' -> it (insert_bst2 x acc) xs'
  in it Leaf xs);;

sort_tree [6;3;4;2;6;2;1]
(*
         5
   x2x        8
          x6x   x9x 

         5
   x2x        8
          x6    x9x 
           x7x


*)