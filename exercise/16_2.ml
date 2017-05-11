(* 目的: 関数fと初期値initそしてlstを受け取ったら、initから始めるlstの要素を左から順に施しこむ *)
let rec fold_left f lst init = init


let t1 = fold_left (fun e result -> e::result) [1;2;3;4;5] [] = [5;4;3;2;1;]


