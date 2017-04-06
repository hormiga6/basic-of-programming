(* 整数のリストを受け取ったら、それまでの数の合計からなるリストを返す *)
(* acc: これまでの数の合計 *)
let rec sum_list list acc =
  match list with
  | [] -> []
  | first::rest ->
    (acc + first)::(sum_list rest (acc + first))

let t1 = sum_list [3;2;1;4] 0 = [3;5;6;10]

