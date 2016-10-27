(* 目的: 0から受け取った自然数までの２乗の和を返す *)
(* sum_of_square : int -> int *)
let rec sum_of_square num =
	if num = 0 then 0 * 0
		else (num * num) + sum_of_square (num - 1)

let t1 = sum_of_square 0 = 0
let t2 = sum_of_square 3 = (1 + 4 + 9)

(* 目的:  テキストの漸化式で定義される数列の第n項を求める *)
(* a:  *)

let rec a n =
	if n = 0 then 3
		else 2 * (a (n -1)) - 1

let t1 = a 0 = 3
let t2 = a 1 = 5
let t3 = a 2 = 9
