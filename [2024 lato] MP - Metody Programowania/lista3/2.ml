let square x = x*x;;
let inc x = x+1;;

let compose f1 f2 x = f1 (f2 x);;

compose square inc 5;;
compose inc square 5;;