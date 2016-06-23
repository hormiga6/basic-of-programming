(*  int listは
	- [] 空リスト
	- first::rest 最初の要素がfirstで残りのリストがrest(restが自己参照のケース)
	という形
*)
(* 目的: 整数のリストを受け取ったら、その長さを返す *)
let rec length list = match list with
	[] -> 0
	|  first::rest -> 1 + length rest

let t1 = length [] = 0
let t2 = length [1] = 1
let t3 = length [100;2;0] = 3

(* 目的: 整数のリストを受け取ったら、その中の偶数の要素のみを含むリストを返す *)
let rec even list = match list with
	[] -> []
	|  first::rest -> if (first mod 2) = 0 then first :: (even rest)
					                       else even rest

let t1 = even [] = []
let t2 = even [1; 4; 101] = [4]
let t3 = even [100;2;0] = [100;2;0]

(*
	string listは
	- [] 空リスト
	- first::rest 最初の要素がfirstで残りのリストがrest(restが自己参照のケース)
	という形
*)
(* 目的: 文字列のリストを受け取ったら、その中の要素を前から順にくっつけた文字列を返す *)
let rec concat list = match list with
	[] -> ""
	| first::rest -> first ^ concat rest

let t1 = concat ["春"; "夏"; "秋"; "冬"] = "春夏秋冬"
let t2 = concat [""; ""] = ""
let t3 = concat ["da"; "ta"; "Spring"] = "dataSpring"
