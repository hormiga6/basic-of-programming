let bmi height weight =	weight /. (height ** 2.)

(* 目的: 身長と体重を与えられたらBMIを計算し、その数値によって体型を返す *)
let taikei height weight =
	if bmi height weight < 18.5 then "やせ"
	else if 18.5 <= bmi height weight && bmi height weight < 25. then "標準"
	else if 25. <= bmi height weight && bmi height weight < 30. then "肥満"
	else "高度肥満"

let t1 = taikei 1.68 58. = "標準"
let t2 = taikei 1.68 120. = "高度肥満"
let t3 = taikei 1.68 50. = "やせ"
