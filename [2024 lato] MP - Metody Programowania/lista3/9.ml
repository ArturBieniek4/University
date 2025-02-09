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

let rec delete_gt x t = match t with
| Leaf -> failwith "To nie powinno sie zdarzyc"
| Node(Leaf,v,Leaf) -> 