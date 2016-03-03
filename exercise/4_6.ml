(* 目的: 鶴の数を与えられたら、足の本数を返す *)
(* tsuru_no_ashi : int -> int *)
let tsuru_no_ashi num = num * 2

let test1 = tsuru_no_ashi 1 = 2
let test2 = tsuru_no_ashi 0 = 0
let test3 = tsuru_no_ashi 100 = 200

(* 目的: 亀の数を与えられたら、足の本数を返す *)
(* tsuru_no_ashi : int -> int *)
let kame_no_ashi num = num * 4

let test1 = kame_no_ashi 1 = 4
let test2 = kame_no_ashi 0 = 0
let test3 = kame_no_ashi 100 = 400
