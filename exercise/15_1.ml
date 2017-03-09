(* 目的: 受け取ったlstをクイックソートを使って昇順に整列する *)
(* quick_sort: int list -> int list *)
let rec quick_sort lst =
	(* 目的: lstの中からnよりpである要素のみを取り出す*)
	(* take: int -> int list -> (int -> int -> bool) -> int list *)
	let take n lst p = List.filter (fun item -> p item n) lst
	(* 目的: lstの中からnより小さい要素のみを取り出す *)
	(* take_less: int -> int list -> int list *)
	in let take_less n lst = take n lst (<=)
	(* 目的: lstの中からnより大きい要素のみを取り出す *)
	(* take_greater : int -> int list -> int list *)
	in let take_greater n lst = take n lst (>)
	in match lst with
		 [] -> []
		| first :: rest -> quick_sort (take_less first rest)
							@ [first]
							@ quick_sort (take_greater first rest)

let t1 = quick_sort [1;5;4;5;5;10] = [1;4;5;5;5;10]
let t2 = quick_sort [1;5;4;10] = [1;4;5;10]
