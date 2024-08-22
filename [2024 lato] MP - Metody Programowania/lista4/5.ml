module type HEAP = sig
    type ('a, 'b) heap =
        HLeaf
      | HNode of int * ('a, 'b) heap * 'a * 'b * ('a, 'b) heap
    val rank : ('a, 'b) heap -> int
    val heap_ordered : 'a -> ('a, 'b) heap -> bool
    val is_valid : ('a, 'b) heap -> bool
    val make_node :
      'a -> 'b -> ('a, 'b) heap -> ('a, 'b) heap -> ('a, 'b) heap
    val heap_merge : ('a, 'b) heap -> ('a, 'b) heap -> ('a, 'b) heap
end

module LeftistHeap:HEAP = struct
  type ('a , 'b) heap =
  | HLeaf
  | HNode of int * ('a , 'b) heap * 'a * 'b * ('a , 'b) heap
  let rank = function HLeaf -> 0 | HNode (n , _ , _ , _ , _) -> n
  let heap_ordered p = function
  | HLeaf -> true
  | HNode (_ , _ , p', _ , _) -> p <= p'
  let rec is_valid = function
  | HLeaf -> true
  | HNode (n , l , p , v , r) ->
  rank r <= rank l
  && rank r + 1 = n
  && heap_ordered p l
  && heap_ordered p r
  && is_valid l
  && is_valid r
  let make_node p v l r = let rl = rank l and rr = rank r in
    if rl >= rr then HNode (rr+1 , l , p , v , r)
    else HNode (rl+1 , r , p , v , l)
  let rec heap_merge a b = match (a,b) with
  | (HLeaf, b) -> b
  | (a, HLeaf) -> a
  | (HNode (an , al , ap , av , ar), HNode (bn , bl , bp , bv , br)) ->
    let e=if ap<bp then av else bv
    and p=min ap bp
    and hl = if ap<bp then al else bl
    and hr = if ap<bp then ar else br
    and h = if ap>=bp then a else b
  in make_node p e (heap_merge hr h) hl
end
let heap = LeftistHeap.make_node 5 'a' HLeaf HLeaf;;
let heap2 = LeftistHeap.make_node 3 'b' HLeaf HLeaf;;
let heap = LeftistHeap.heap_merge heap heap2;;
