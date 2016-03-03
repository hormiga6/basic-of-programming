(* 目的: 鶴と亀の数の合計と足の数の合計を与えられたら、鶴の数を返す *)
(* tsurukame : int -> int -> int *)
let tsurukame head_total foot_total =
	(4 * head_total - foot_total) / 2

let test1 = tsurukame 5 14 = 3
let test2 = tsurukame 4 16 = 0
let test3 = tsurukame 2 4  = 2
