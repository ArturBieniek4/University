let ( let* ) xs ys = List.concat_map ys xs

let rec choose m n =
  if m > n then [] else m :: choose (m+1) n

let rec count_ones xs =
  match xs with
  | [] -> 0
  | true::xs' -> 1 + count_ones xs'
  | false::xs' -> 0

let rec drop n xs = match xs with
| [] -> []
| x::xs' ->
  if n=0 then xs
  else drop (n-1) xs'

let count_row xss = 
  let rec it acc xs = match xs with
  | [] -> acc
  | true :: xs' ->
      let len = 1 + count_ones xs' in
      it (len::acc) (drop len xs')
  | false :: xs' -> it acc xs'
  in List.rev (it [] xss)
  

let verify_row ps xs =
  ps=(count_row xs)

let rec verify_rows pss xss=
  pss=(List.map (fun xs -> count_row xs) xss)

let build_row ps n = 
  let rec it acc ps n solutions prev =
    if n=0 then
      match ps with
      | [] -> acc::solutions
      | [0] -> acc::solutions
      | _ -> solutions
    else
      let sol0=(it (false::acc) ps (n-1) solutions false) in
      match ps with
      | [] -> sol0
      | 0::ps' -> (it (false::acc) ps' (n-1) solutions false)
      | p::ps' -> (it (true::acc) (p-1::ps') (n-1) (if prev then solutions else sol0) true)
  in List.map List.rev (it [] ps n [] false)

let rec gen_comb n =
  if n=0 then [[]]
  else
    let tl = gen_comb (n-1) in
    List.map (fun tl -> false::tl) tl @ List.map (fun tl -> true::tl) tl

let build_row ps n=
    let rec it solutions lastcomb=
    match solutions with
    | [] -> lastcomb
    | sol::solutions' ->
      if (verify_row ps sol) then sol::(it solutions' lastcomb)
      else it solutions' lastcomb
    in it (gen_comb n) []

let rec build_rows pss n=
  match pss with
  | [] -> []
  | ps::pss' -> (build_row ps n) :: build_rows pss' n

let rec comb_rows xss1 xss2 =
  match xss1 with
  | [] -> []
  | xs::xss1' -> List.map (fun x -> xs::x) xss2 @ comb_rows xss1' xss2

let rec merge_comb xsss=
  match xsss with
  | [] -> [[]]
  | xss::xsss' ->
    comb_rows xss (merge_comb xsss')

let rec build_candidate pss n=
    merge_comb (build_rows pss n)

type nonogram_spec = {rows: int list list; cols: int list list}

let rec transpose xss =
  match xss with
  | [] -> []
  | []::xss' -> transpose xss'
  | (x::xs')::xss' -> (x::List.map List.hd xss') :: transpose (xs'::List.map List.tl xss')

let solve_nonogram nono =
  build_candidate (nono.rows) (List.length (nono.cols))
  |> List.filter (fun xss -> transpose xss |> verify_rows nono.cols)

let example_1 = {
  rows = [[2];[1];[1]];
  cols = [[1;1];[2]]
}

let example_2 = {
  rows = [[2];[2;1];[1;1];[2]];
  cols = [[2];[2;1];[1;1];[2]]
};;

(* solve_nonogram example_2;; *)