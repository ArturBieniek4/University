module type COLLECTION = sig
  type 'a coll
  val empty : 'a coll
  val peek : 'a coll -> 'a
  val push : 'a -> 'a coll -> 'a coll
  val pop : 'a coll -> 'a coll
end

module Queue : COLLECTION = struct
  type 'a coll = Queue of 'a list * 'a list

  let empty = Queue ([], [])

  let mk_queue = function
    | ([], ys) -> Queue (List.rev ys, [])
    | (xs, ys) -> Queue (xs, ys)

  let peek = function
    | Queue (x :: _, _) -> x
    | Queue ([], _) -> failwith "peek on empty queue"

  let push x (Queue (xs, ys)) = mk_queue (xs, x :: ys)

  let pop = function
    | Queue (_ :: xs, ys) -> mk_queue (xs, ys)
    | Queue ([], _) -> failwith "pop on empty queue"
end

module Stack : COLLECTION = struct
  type 'a coll = 'a list
  let empty = []
  let peek = function
    | [] -> failwith "peek on empty stack"
    | x :: _ -> x
  let pop = function
  | [] -> failwith "pop on empty stack"
  | _ :: xs -> xs
  let push x xs = x :: xs
end

type 'a tree = Leaf | Node of 'a tree * 'a * 'a tree

let ex_tree = Node (Node (Node (Leaf, 0, Leaf), 1, Node (Leaf, 2, Leaf)), 3, 
  Node (Leaf, 4, Node (Leaf, 5, Leaf)))

module Search = functor (M : COLLECTION) -> struct
  open M
  let search t =
    let rec it q xs =
      if q = empty
      then List.rev xs
      else match peek q with
      | Leaf -> it (pop q) xs
      | Node (l, v, r) -> it (q |> pop |> push l |> push r) (v :: xs)
    in it (push t empty) []
end

module Bfs = Search (Queue)
module Dfs = Search (Stack)

let bfs = Bfs.search
let dfs = Dfs.search

module type DICT = sig
  type ('a, 'b) dict
  val empty : ('a, 'b) dict
  val insert : 'a -> 'b -> ('a, 'b) dict -> ('a, 'b) dict
  val remove : 'a -> ('a, 'b) dict -> ('a, 'b) dict
  val find_opt : 'a -> ('a, 'b) dict -> 'b option
  val find : 'a -> ('a, 'b) dict -> 'b
  val to_list : ('a, 'b) dict -> ('a * 'b) list
end

module ListDict : DICT = struct
  type ('a, 'b) dict = ('a * 'b) list
  let empty = []
  let remove k d = List.filter (fun (k', _) -> k <> k') d
  let insert k v d = (k, v) :: remove k d
  let find_opt k d = List.find_opt (fun (k', _) -> k = k') d |> Option.map snd
  let find k d = List.find (fun (k', _) -> k = k') d |> snd
  let to_list d = d
end

module type PRIO_QUEUE = sig
  type ('a, 'b) pq
  
  val empty : ('a, 'b) pq
  val insert : 'a -> 'b -> ('a, 'b) pq -> ('a, 'b) pq
  val pop : ('a, 'b) pq -> ('a, 'b) pq
  val min_with_prio : ('a, 'b) pq -> 'a * 'b
end

module ListPrioQueue : PRIO_QUEUE = struct
  type ('a, 'b) pq = ('a * 'b) list

  let empty = []
  let rec insert a x q = match q with
  | [] -> [a, x]
  | (b, y) :: ys -> if a < b then (a, x) :: q else (b, y) :: insert a x ys
  let pop q = List.tl q
  let min_with_prio q = List.hd q
end

let id x = x

let find_else x a d =
  Option.value ~default:0 (ListDict.find_opt x d)

let freq_dict xs =
  let rec it xs d =
    match xs with
    | [] -> d
    | x :: xs' -> 
      it xs' (ListDict.insert x 
                (1 + find_else x 0 d) d)
  in it xs ListDict.empty

type 'a code_tree = CTNode of 'a code_tree * 'a code_tree | CTLeaf of 'a

let initial_pq xs =
  List.fold_left (fun q (x, n) -> ListPrioQueue.insert n (CTLeaf x) q)
    ListPrioQueue.empty xs

let rec algo q =
  let p1, t1 = ListPrioQueue.min_with_prio q
  and q1 = ListPrioQueue.pop q
  in if q1 = ListPrioQueue.empty then t1
  else let p2, t2 = ListPrioQueue.min_with_prio q1
  and q2 = ListPrioQueue.pop q1
  in algo (ListPrioQueue.insert (p1 + p2) (CTNode (t1, t2)) q2)

let make_code_tree d = 
  ListDict.to_list d |> initial_pq |> algo

let ex_string = "konstantynopolitańczykowianeczka"

let list_of_string s = String.to_seq s |> List.of_seq
let string_of_list s = List.to_seq s |> String.of_seq

let ex_freq_dict = freq_dict (list_of_string ex_string)

let ex_code_tree = make_code_tree ex_freq_dict

let dict_of_code_tree t =
  let rec aux t rcpref d =
    match t with
    | CTLeaf x -> ListDict.insert x (List.rev rcpref) d
    | CTNode (l, r) -> aux l (0 :: rcpref) (aux r (1 :: rcpref) d)
  in aux t [] ListDict.empty

let ex_code_dict = dict_of_code_tree ex_code_tree

let encode xs d =
  List.fold_right (@) (List.map (fun x -> ListDict.find x d) xs) []

let ex_encoded_string = encode (list_of_string ex_string) ex_code_dict

let decode bs t =
  let rec walk bs cur_t =
    match cur_t with
    | CTLeaf v -> v :: start bs
    | CTNode (l, r) ->
      match bs with
      | 0 :: bs' -> walk bs' l
      | 1 :: bs' -> walk bs' r
      | _ :: _ -> failwith "a value other than 0 or 1 encountered"
      | [] -> failwith "incomplete code"
  and start bs =
    if bs = [] then [] else walk bs t
  in start bs

let ex_decoded_list = decode ex_encoded_string ex_code_tree;;

