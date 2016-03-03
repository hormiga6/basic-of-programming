(* 目的: 二次方程式の係数a,b,cを与えられたら判別式の値を返す *)
(* float -> float -> float -> float *)
let hanbetsushiki a b c =
	b ** 2. -. 4. *. a *. c

let t1 = hanbetsushiki 1. 2. 1. = 0.
let t2 = hanbetsushiki 2. 3. 4. = -23.
let t3 = hanbetsushiki 1. 10. 1. = 96.

(* 目的: 二次方程式の係数a,b,cを与えられたら解の個数を返す *)
(* float -> float -> float -> int *)
let kaino_kosu a b c =
	if 0. < hanbetsushiki a b c then 2
	else if 0. = hanbetsushiki a b c then 1
	else 0

let t1 = kaino_kosu 1. 2. 1. = 1
let t2 = kaino_kosu 2. 3. 4. = 0
let t3 = kaino_kosu 1. 10. 1. = 2

(* 目的: 二次方程式の係数a,b,cを与えられたらこの二次方程式が虚数解を持つかを返す *)
(* float -> float -> float -> bool *)
let kyosuulai a b c =
	kaino_kosu a b c = 0

let t1 = kyosuulai 1. 2. 1. = false
let t2 = kyosuulai 2. 3. 4. = true
let t3 = kyosuulai 1. 10. 1. = false
