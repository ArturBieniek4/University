(* Przeanalizuj poniższe funkcje. W jaki sposób możesz użyć ich, aby sprawdzić,
czy interpreter wykonuje obliczenia używając gorliwej, czy leniwej kolejności
obliczania? Uzasadnij odpowiedź pokazując, jak interpreter wyliczyłby wartość
w zależności od kolejności obliczania. Załóż, że reguła obliczania wartości
wyrażenia if nie zależy od kolejności obliczania. *)
let rec f () = f ();;
(* OCaml jest gorliwy, więc się zawiesza na tym, gdyby był leniwy, po prostu zwróciłby f() *)

let test x y =
  if x = 0 then 0 else y;;
 
test 0 2/0;
(* Błąd dzielenia przez 0, gdyby był leniwy, to to dzielenie nie zostałoby obliczone *)