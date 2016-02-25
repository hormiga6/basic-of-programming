(* 目的: 時間を受け取ったら、午前か午後か返す *)
let jikan hour =
	if hour = 0 then "evening"
	else if (((hour - 1) / 12) mod 2 = 1) then "evening" else "morning"

let t1 = jikan 0 = "evening"
let t2 = jikan 1 = "morning"
let t3 = jikan 12 = "morning"
let t4 = jikan 13 = "evening"
let t5 = jikan 24 = "evening"
let t6 = jikan 25 = "morning"
