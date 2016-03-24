
(* 目的: 国語、数学、英語、理科、社会の点数が与えられたら、合計と平均点を組みにして返す *)
let goukei_to_hekin kokugo sugaku eigo rika shakai =
	((kokugo + sugaku + eigo + rika + shakai), ((kokugo + sugaku + eigo + rika + shakai) / 5 ))

let t1 = goukei_to_hekin 5 4 3 2 1 = (15, 3)
let t2 = goukei_to_hekin 5 4 3 2 2 = (16, 3)
