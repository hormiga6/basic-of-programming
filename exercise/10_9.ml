(* 二つのリストを受け取ったらそれらの長さが同じかどうかを返す *)
let equal_length list1 list2 = match (list1, list2) with
	| ([],[]) -> true
	| (first::rest,[]) -> false
	| ([], first::rest) -> false
	| (first1::rest1, first2::rest2) -> equal_length rest1 rest2

let t1 = equal_length [1;2] ["b"] = false
let t2 = equal_length [1;2] ["b";"a"] = true
let t3 = equal_length [] [] = true
