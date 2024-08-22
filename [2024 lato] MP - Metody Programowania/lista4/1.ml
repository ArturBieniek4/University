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

module type HUFFMAN = functor(D:DICT)(Q:PRIO_QUEUE) -> sig
  type 'a code_tree
  type 'a code_dict
  val code_tree : 'a list -> 'a code_tree
  val dict_of_code_tree : 'a code_tree -> 'a code_dict
  val encode : 'a list -> 'a code_dict -> int list
  val decode : int list -> 'a code_tree -> 'a list
  end

module Huffman : HUFFMAN= functor(D:DICT)(Q:PRIO_QUEUE) -> struct
  type 'a code_tree = CTNode of 'a code_tree * 'a code_tree | CTLeaf of 'a
  type 'a code_dict = ('a, int list) D.dict
  let find_else x a d =
    Option.value ~default:0 (D.find_opt x d)

  let list_of_string s = String.to_seq s |> List.of_seq
  let string_of_list s = List.to_seq s |> String.of_seq
  
  let freq_dict xs =
    let rec it xs d =
      match xs with
      | [] -> d
      | x :: xs' -> 
        it xs' (D.insert x 
                  (1 + find_else x 0 d) d)
    in it xs D.empty

  let initial_pq xs =
    List.fold_left (fun q (x, n) -> Q.insert n (CTLeaf x) q)
      Q.empty xs

  let rec algo q =
    let p1, t1 = Q.min_with_prio q
    and q1 = Q.pop q
    in if q1 = Q.empty then t1
    else let p2, t2 = Q.min_with_prio q1
    and q2 = Q.pop q1
    in algo (Q.insert (p1 + p2) (CTNode (t1, t2)) q2)

  let code_tree xs = 
    freq_dict xs |> D.to_list |> initial_pq |> algo

  let dict_of_code_tree t =
    let rec aux t rcpref d =
      match t with
      | CTLeaf x -> D.insert x (List.rev rcpref) d
      | CTNode (l, r) -> aux l (0 :: rcpref) (aux r (1 :: rcpref) d)
    in aux t [] D.empty

  let encode xs d =
    List.fold_right (@) (List.map (fun x -> D.find x d) xs) []

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
end

module Mhuffman = Huffman(ListDict)(ListPrioQueue);;
let list_of_string s = String.to_seq s |> List.of_seq
let s = list_of_string "konstantynopolitańczykowianeczka";;
let codetree = Mhuffman.code_tree (s);;
Mhuffman.decode (Mhuffman.encode (s) (Mhuffman.dict_of_code_tree (codetree))) codetree;;