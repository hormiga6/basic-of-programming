#use "4-6.ml"

(* 目的: 鶴と亀の数を与えられたら、足の本数の合計を返す *)
(* tsurukame_no_ashi : int -> int -> int *)
let tsurukame_no_ashi tsuru_num kame_num =
	tsuru_no_ashi tsuru_num + kame_no_ashi kame_num

let test1 = tsurukame_no_ashi 0 0 = 0
let test2 = tsurukame_no_ashi 3 2 = 14
let test3 = tsurukame_no_ashi 0 4 = 16
let test4 = tsurukame_no_ashi 2 0 = 4

