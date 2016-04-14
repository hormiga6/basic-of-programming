(* 目的: 成績を受け取ったら、「XXさんの評価はXXです」と返す *)
let seiseki pair = match pair with
	| (name, seiseki) -> name ^ "さんの成績は" ^ seiseki ^ "です。"

let t1 = seiseki ("A","優")= "Aさんの成績は優です。"
let t2 = seiseki ("C","不可")= "Cさんの成績は不可です。"
