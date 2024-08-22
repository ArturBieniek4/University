type 'a tree = Leaf | Node of 'a tree * 'a * 'a tree

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

let rec fold_tree f a t =
  match t with
  | Leaf -> a
  | Node (l, v, r) -> f (fold_tree f a l) v (fold_tree f a r)
  
let flatten t = fold_tree (fun l v r -> l @ [v] @ r) [] t
let left_tree_of_list xs =
  List . fold_left ( fun t x -> Node (t , x , Leaf )) Leaf xs
let build_list n f =
  let rec it n xs =
  if n=(-1) then xs
  else it (n-1) ((f n)::xs)
  in it (n-1) [];;
let test_tree = left_tree_of_list ( build_list 20000 Fun . id )
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

let flatten t =
  let rec it t acc = match t with
  | Leaf -> acc
  | Node (l,v,r) -> it l (v::(it r acc))
  in it t []