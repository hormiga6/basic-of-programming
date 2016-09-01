(* lst は
	- []          空リスト
	- first::rest 最初の要素がfirstで残りのリストがrest
	              fistはinteger型、restは自己参照型
	          *)
(* 目的: あらかじめ照準に並んでいる整数のリストと整数を受け取ったら、昇順となる位置にnを挿入したリストを返す関数 *)
let rec insert lst num = match lst with
	| [] -> [num]
	| first::rest -> if num <= first then num :: first :: rest
					else first :: insert rest num

let t1 = insert [0;1;2;4] 3 = [0;1;2;3;4]
let t2 = insert [-1;0;1] 0 = [-1;0;0;1]
let t3 = insert [0;1;2;4] 4 = [0;1;2;4;4]
let t4 = insert [0;1;2;4] 5 = [0;1;2;4;5]
let t5 = insert [1;] 0 = [0;1;]

(* 目的: 整数のリストを受け取ったら、それを昇順に整列したリストを返す *)
let rec ins_sort list = match list with
	| [] -> []
	| first::rest -> insert (ins_sort rest) first

let t1 = ins_sort [4;0;1;2;] = [0;1;2;4;]
let t2 = ins_sort [0;1;4;2;4;]  = [0;1;2;4;4]
let t3 = ins_sort [0;-1;2;0;4;]  = [-1;0;0;2;4]

type gakusei_t = {
	name: string;
	tensuu: int;
	seiseki: string;
}
