(* 目的: 与えられたリストを逆順にする *)
let rec reverse list =
  match list with
  | [] -> []
  | first::rest -> (reverse rest) @ [first]

let t1 = reverse [1;2;3] = [3;2;1]


let reverse2 lst =
  let rec rev lst result =
    match lst with
    | [] -> result
    | first::rest -> rev result (first::result)
  in rev lst []



