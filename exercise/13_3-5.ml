(* 1 *)
let fun1 a = a

(* 2 *)
let fun2 a  b = a

(* 3 *)
let fun3 a  b = b

(* 4 *)
let fun4 a b = (b a)

(* 5 *)
let fun5 f1 f2 v = f2 (f1 v)

(* 目的: 関数を二つ受け取ったら合成した関数を返す関数
	(comopse time2 add3) 4は　2 * (3 + 4) = 14
*)
let comopse f1 f2 =
	let f a = (f1 (f2 a)) in
	f
let time2 num =  num * 2
let add3 num = num + 3

let t1 = (comopse time2 add3) 4 = 14

(* twice *)
let twice f =
	let g x = f (f x)
	in g
let t2 = twice twice
let t3 = twice twice add3 1 = 13

