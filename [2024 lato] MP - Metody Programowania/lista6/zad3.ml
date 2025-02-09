(* ---------- Zad 3 ---------- *)
open List

type 'a symbol =
  | T of string
  | N of 'a

type 'a grammar = ('a * ('a symbol list) list) list

let rec nth xs n = 
match xs with
| x::xs' -> if n==0 then x else nth xs' (n-1)
| [] -> failwith "List is shorter than n."
let rec generate (g : 'a grammar) (s : 'a) : string = 
  let options = List.assoc s g in
  let nopt = List.length options in
  let nchoice = Random.int nopt in
  let choice = nth options nchoice in
  String.concat "" (List.map (function T str -> str | N x -> generate g x) choice)

let pol : string grammar =
  [ "zdanie", [[N "grupa-podmiotu"; N "grupa-orzeczenia"]]
  ; "grupa-podmiotu", [[N "przydawka"; N "podmiot"]]
  ; "grupa-orzeczenia", [[N "orzeczenie"; N "dopelnienie"]]
  ; "przydawka", [[T "Piękny "];
                  [T "Bogaty "];
                  [T "Wesoły "]]
  ; "podmiot", [[T "policjant "];
                [T "student "];
                [T "piekarz "]]
  ; "orzeczenie", [[T "zjadł "];
                    [T "pokochał "];
                    [T "zobaczył "]]
  ; "dopelnienie", [[T "zupę."];
                    [T "studentkę."];
                    [T "sam siebie."];
                    [T "instytut informatyki."]]]

(* generate pol "zdanie" *)

let expr : unit grammar =
  [(), [[N (); T "+"; N ()];
        [N (); T "*"; N ()];
        [T "("; N (); T ")"];
        [T "1"];
        [T "2"]]];;

(* generate expr () *)
generate pol "zdanie";;