let concat_map f xs = List.concat (List.map f xs )
let rec choose m n =
  if m > n then [] else m :: choose ( m +1) n
let ( let* ) xs ys = List.concat_map ys xs

let two_num_product n m =
  let* a = choose 1 n in
  let* b = choose a n in
  if a * b = m then [a , b ] else []
 
type nonogram_spec = { rows : int list list ; cols : int list list }
 
let rec licz_true = function
  | [] -> 0
  | true :: t -> 1 + licz_true t
  | false :: t -> 0

let licz_wszystko lst =
  let rec drop n = function
    | [] -> []
    | _::t as l -> if n=0 then l else drop (n-1) t
  in
  let rec licz_sekwencje acc = function
    | [] -> List.rev acc
    | true :: t ->
        let len = 1 + licz_true t in
        licz_sekwencje(len :: acc) (drop len t)
    | false :: t -> licz_sekwencje acc t
  in
  licz_sekwencje [] lst
 

 
let rec porownanie lista1 lista2 = 
  match (lista1, lista2) with
  | [], [] -> true
  | [], _ | _, [] -> false 
  | x :: ls1, y :: ls2 -> if x = y then porownanie ls1 ls2 else false
 
let verify_row spec row = 
  porownanie spec (licz_wszystko row)
 

 
let rec verify_rows list_specs list_rows = 
  match (list_specs, list_rows) with
  | [], [] -> true 
  | [], _ | _, [] -> false
  | x :: ls1, y :: ls2 -> if verify_row x y then verify_rows ls1 ls2 else false
 

 
let rec transpose = function
  | [] -> []
  | [] :: _ -> []
  | matrix ->
      let przody = List.map List.hd matrix in
      let tyly = transpose (List.map List.tl matrix) in
      przody:: tyly
  
let generuj_kombi length =
  let rec generuj_helper n =
    if n = 0 then [[]]
    else
      let tails = generuj_helper (n - 1) in
      List.map (fun tail -> false :: tail) tails @ List.map (fun tail -> true :: tail) tails
  in
  generuj_helper length



let build_row spec len =
  let rec build_helper spec list_cand lst_wynik = 
    match list_cand with
    | [] -> lst_wynik
    | hd::tl -> if (verify_row spec hd) then hd:: (build_helper spec tl lst_wynik) 
        else build_helper spec tl lst_wynik
  in
  build_helper spec (generuj_kombi len) []



let rec build_candidate_helper spec_rows len =
  match spec_rows with
  | [] -> [] 
  | hd::tl -> build_row hd len :: build_candidate_helper tl len


let rec combine_dwie list1 list2 =
  match list1 with
  | [] -> []
  | hd::tl -> List.map (fun x -> hd::x) list2 @ combine_dwie tl list2


let rec combine_all lists =
  match lists with
  | [] -> [[]]
  | hd::tl -> 
      let combined_tl = combine_all tl in
      combine_dwie hd combined_tl

let build_candidate spec_rows len =
  combine_all (build_candidate_helper spec_rows len)



let solve_nonogram nono =
  build_candidate (nono.rows) (List.length (nono.cols) )
  |> List.filter ( fun xss -> transpose xss |> verify_rows
                                nono.cols)


let example_1 = {
  rows = [[2];[1];[1]];
  cols = [[1;1];[2]]
}

let example_2 = {
  rows = [[2];[2;1];[1;1];[2]];
  cols = [[2];[2;1];[1;1];[2]]
}

let big_example = {
  rows = [[1;2];[2];[1];[1];[2];[2;4];[2;6];[8];[1;1];[2;2]];
  cols = [[2];[3];[1];[2;1];[5];[4];[1;4;1];[1;5];[2;2];[2;1]]
}
(* solve_nonogram example_2;; *)
let example_3 = {
  rows = [[2];[2;1];[1;1];[2];[2];[1]];
  cols = [[2];[2;1];[1;1];[2];[2];[1]]
};;

solve_nonogram example_2;;