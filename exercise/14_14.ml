(* 目的: 文字列のリストを受け取ったら、その中の要素を前から順にくっつけた文字列を返す *)
let concat list = List.fold_right (^) list ""
let t1 = concat ["春";"夏";"秋";"冬"] = "春夏秋冬"
