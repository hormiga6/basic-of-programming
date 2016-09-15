(* 目的: 個人のデータ *)
type person_t = {
	name:string; (* 名前 *)
	height:float; (* 身長 *)
	weight:float; (* 体重 *)
	month:int; (* 月 *)
	day:int; (* 日 *)
	blood_type:string; (* 血液型 *)
}

(* 目的: person_tのリストを受け取ったら、各血液型の人が何人いるか組(A,B,AB,O)にして返す *)
let rec ketsueki_shukei list = match  list with
	| [] -> (0,0,0,0)
	| {name=name; height=height; weight=weight; month=month; day=day; blood_type=blood_type}::rest ->
		let (a, b, ab, o) = ketsueki_shukei rest in
			if blood_type = "A" then (a+1, b, ab, o)
			else if blood_type = "B" then (a, b+1, ab, o)
			else if blood_type = "AB" then (a, b, ab+1, o)
			else if blood_type = "O" then (a, b, ab, o+1)
			else (a, b, ab, o)

let t1 = ketsueki_shukei [
		{name="A"; height=1.75; weight=71.; month=1; day=21; blood_type="A"};
		{name="B"; height=1.85; weight=102.; month=2; day=22; blood_type="B"};
		{name="C"; height=1.68; weight=65.; month=3; day=23; blood_type="A"};
		{name="D"; height=1.85; weight=102.; month=2; day=22; blood_type="B"};
		{name="E"; height=1.68; weight=65.; month=3; day=23; blood_type="O"};
		{name="F"; height=1.85; weight=102.; month=2; day=22; blood_type="B"};
	] = (2,3,0,1)

let t2 = ketsueki_shukei [
	] = (0,0,0,0)

(* 目的: person_t型のデータリストを受け取ったら、最も人数の多かった血液型を返す *)
let saita_ketsueki list =
	let (a,b,ab,o) = ketsueki_shukei list in
		if b <= a && ab <= a && o <= a  then "A"
		else if a <= b && ab <= b && o <= b then "B"
		else if a <= ab && b <= ab && o <= ab then "AB"
		else "O"

let t1 = saita_ketsueki [
		{name="A"; height=1.75; weight=71.; month=1; day=21; blood_type="A"};
		{name="B"; height=1.85; weight=102.; month=2; day=22; blood_type="B"};
		{name="C"; height=1.68; weight=65.; month=3; day=23; blood_type="A"};
		{name="D"; height=1.85; weight=102.; month=2; day=22; blood_type="B"};
		{name="E"; height=1.68; weight=65.; month=3; day=23; blood_type="O"};
		{name="F"; height=1.85; weight=102.; month=2; day=22; blood_type="B"};
	] = "B"

let t1 = saita_ketsueki [
		{name="A"; height=1.75; weight=71.; month=1; day=21; blood_type="A"};
		{name="B"; height=1.85; weight=102.; month=2; day=22; blood_type="B"};
		{name="C"; height=1.68; weight=65.; month=3; day=23; blood_type="O"};
		{name="D"; height=1.85; weight=102.; month=2; day=22; blood_type="O"};
		{name="E"; height=1.68; weight=65.; month=3; day=23; blood_type="O"};
		{name="F"; height=1.85; weight=102.; month=2; day=22; blood_type="B"};
	] = "O"

let t2 = saita_ketsueki [] = "A"
