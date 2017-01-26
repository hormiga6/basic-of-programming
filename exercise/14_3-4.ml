#use "10_6.ml"

(* 目的: 文字列のリストを受け取ったら、その中の要素を前から順にくっつけた文字列を返す *)
let concat list =
	let combine a b = a ^ b in
	List.fold_right combine list ""

let t1 = concat ["春";"夏";"秋";"冬"] = "春夏秋冬"

(* 目的: gakusei_t型のリストを受け取ったら、全員の得点の合計を返す *)
let total_point list =
	let add_point a b =
		let {namae=a_namae;tensuu=a_tensuu;seiseki=a_seiseki} = a in
		a_tensuu + b in
	List.fold_right add_point list 0

let t1 = total_point [
		{namae="Bob";tensuu=99;seiseki="A"};
		{namae="Ed";tensuu=100;seiseki="A"};
		{namae="Jimmy";tensuu=1;seiseki="B"};
	] = 200
