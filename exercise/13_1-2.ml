#use "8_1-4.ml"

(* 目的: person_t型のリストを受け取ったら、その中から指定された血液型の人の数を数える。 *)
let rec count_ketsueki list target_blood_type =match list with
	| [] -> 0
	| {name=name; height=height; weight=weight; month=month; day=day; blood_type=blood_type;}::rest ->
		if blood_type = target_blood_type then 1 + count_ketsueki rest target_blood_type else count_ketsueki rest target_blood_type

let t1 = count_ketsueki [
			{name="山田"; height=1.75; weight=71.; month=1; day=1; blood_type="A"};
			{name="山田"; height=1.75; weight=71.; month=1; day=1; blood_type="B"};
			{name="山田"; height=1.75; weight=71.; month=1; day=1; blood_type="B"};
			{name="山田"; height=1.75; weight=71.; month=1; day=1; blood_type="A"};
			{name="山田"; height=1.75; weight=71.; month=1; day=1; blood_type="AB"};
			{name="山田"; height=1.75; weight=71.; month=1; day=1; blood_type="AB"};
			{name="山田"; height=1.75; weight=71.; month=1; day=1; blood_type="B"};
			{name="山田"; height=1.75; weight=71.; month=1; day=1; blood_type="B"};
		] "A"
		= 2

let t2 = count_ketsueki [
			{name="山田"; height=1.75; weight=71.; month=1; day=1; blood_type="A"};
			{name="山田"; height=1.75; weight=71.; month=1; day=1; blood_type="B"};
			{name="山田"; height=1.75; weight=71.; month=1; day=1; blood_type="B"};
			{name="山田"; height=1.75; weight=71.; month=1; day=1; blood_type="A"};
			{name="山田"; height=1.75; weight=71.; month=1; day=1; blood_type="AB"};
			{name="山田"; height=1.75; weight=71.; month=1; day=1; blood_type="AB"};
			{name="山田"; height=1.75; weight=71.; month=1; day=1; blood_type="B"};
			{name="山田"; height=1.75; weight=71.; month=1; day=1; blood_type="B"};
		] "O"
		= 0

(* 目的: person型の名前を返す *)
let get_name person = match person with
	| {name=name; height=height; weight=weight; month=month; day=day; blood_type=blood_type;} -> name

let t3 = get_name {name="山田"; height=1.75; weight=71.; month=1; day=1; blood_type="A"} = "山田"

(* 目的:  person_t型のリストを受け取ったら、その中に出てくる人の名前を返す  *)
let person_namae list = List.map get_name list

let t4 = person_namae [
			{name="山田"; height=1.75; weight=71.; month=1; day=1; blood_type="A"};
			{name="山下"; height=1.75; weight=71.; month=1; day=1; blood_type="B"};
			{name="山川"; height=1.75; weight=71.; month=1; day=1; blood_type="B"};
		]
		=
		["山田";"山下";"山川";]

let t5 = person_namae [
		]
		= []
