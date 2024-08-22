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
  if rl > rr then HNode (rr+1 , l , p , v , r)
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

module type PRIO_QUEUE = sig
  type ('a, 'b) pq
  
  val empty : ('a, 'b) pq
  val insert : 'a -> 'b -> ('a, 'b) pq -> ('a, 'b) pq
  val pop : ('a, 'b) pq -> ('a, 'b) pq
  val min_with_prio : ('a, 'b) pq -> 'a * 'b
end

module HeapPrioQueue(H:HEAP) : PRIO_QUEUE = struct
  type ('a, 'b) pq = ('a, 'b) H.heap
  let empty = H.HLeaf
  let rec insert a x q = H.heap_merge (q) (H.make_node a x HLeaf HLeaf)
  let pop q = match q with
  | H.HLeaf -> failwith "pop on empty queue"
  | H.HNode(n , l , p , v , r) -> H.heap_merge l r
  let min_with_prio q = match q with
  | H.HLeaf -> failwith "peek on empty queue"
  | H.HNode(n , l , p , v , r) -> (p,v)
end

module PrioQueue = HeapPrioQueue(LeftistHeap)
let pq = PrioQueue.empty
let pq = PrioQueue.insert 'a' 5 pq;;
PrioQueue.min_with_prio pq;;
let pq = PrioQueue.pop pq;;

module Pqsort(Q:PRIO_QUEUE) = struct
  let queue_of_list xs =
    let rec it xs pq = match xs with
    | [] -> pq
    | x::xs' -> it xs' (Q.insert x x pq)
    in it xs Q.empty
  
  let list_of_queue pq =
    let rec it pq xs = if pq=Q.empty then xs 
    else it (Q.pop pq) ((snd (Q.min_with_prio pq))::xs)
  in it pq []
  
  let pqsort xs = list_of_queue (queue_of_list xs)
end

module ListPriorityQueue : PRIO_QUEUE = struct
  type ('a, 'b) pq = ('a * 'b) list
  let empty = []
  let rec insert a x q = match q with
  | [] -> [a,x]
  | (b,y)::ys -> if a<b then (a,x)::q else (b,y)::insert a x ys
  let pop xs = List.tl xs
  let min_with_prio q = List.hd q
end

module Pqsort_heap = Pqsort(PrioQueue);;
module Pqsort_list = Pqsort(ListPriorityQueue);;