(* ---------- Zad 3 ---------- *)

module Zad3 = struct

open List

type 'a symbol =
  | T of string
  | N of 'a

type 'a grammar = ('a * ('a symbol list) list) list

let generate (g : 'a grammar) (s : 'a) : string = failwith "not implemented"

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
        [T "2"]]]

(* generate expr () *)

end

(* ---------- Zad 4 ---------- *)

(* List.of_seq (String.to_seq str) *)

module Zad4 = struct

let parens_ok (i : string) : bool = failwith "not implemented"

end

(* ---------- Zad ---------- 5 *)

module Zad5 = struct

let parens_ok (i : string) : bool = failwith "not implemented"

end
